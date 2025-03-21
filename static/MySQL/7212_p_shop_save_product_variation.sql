

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_product_variation;

DROP TABLE IF EXISTS tmp_Variation_Type;
DROP TABLE IF EXISTS tmp_Variation;
DROP TABLE IF EXISTS tmp_Msg_Error;

DELIMITER //
CREATE PROCEDURE p_shop_save_product_variation (
	IN a_comment VARCHAR(500)
	, IN a_guid BINARY(36)
    , IN a_id_user INT
    , IN a_debug BIT
)
BEGIN
	DECLARE v_code_type_error_bad_data VARCHAR(50);
	DECLARE v_code_type_error_no_permission VARCHAR(50);
	DECLARE v_code_type_error_warning VARCHAR(50);
    DECLARE v_id_access_level_edit INT;
    DECLARE v_id_change_set INT;
    DECLARE v_ids_permission_product_variation VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_type_error_no_permission INT;
    DECLARE v_id_type_error_warning INT;
	DECLARE v_ids_product_permission TEXT;
    DECLARE v_time_start TIMESTAMP(6);

    DECLARE exit handler for SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            @sqlstate = RETURNED_SQLSTATE
            , @errno = MYSQL_ERRNO
            , @text = MESSAGE_TEXT
		;
        
        ROLLBACK;
        
		CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
			display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
			, id_type INT NULL
			, code VARCHAR(50) NOT NULL
			, msg VARCHAR(4000) NOT NULL
		);
        INSERT INTO tmp_Msg_Error (
			id_type
            , code
            , msg
		)
        SELECT 
			MET.id_type
            , @errno
            , @text
		FROM demo.Shop_Msg_Error_Type MET
        WHERE code = 'MYSQL_ERROR'
        LIMIT 1
		;
        SELECT *
        FROM tmp_Msg_Error;
		DROP TABLE IF EXISTS tmp_Msg_Error;
    END;
    
	SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_code_type_error_bad_data := (SELECT code FROM demo.Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_bad_data := (SELECT id_type FROM demo.Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_code_type_error_no_permission := (SELECT code FROM demo.Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION' LIMIT 1);
    SET v_id_type_error_no_permission := (SELECT id_type FROM demo.Shop_Msg_Error_Type WHERE code = v_code_type_error_no_permission LIMIT 1);
	SET v_code_type_error_warning := (SELECT code FROM demo.Shop_Msg_Error_Type WHERE code = 'WARNING' LIMIT 1);
    SET v_id_type_error_warning := (SELECT id_type FROM demo.Shop_Msg_Error_Type WHERE code = v_code_type_error_warning LIMIT 1);
	SET v_ids_permission_product_variation := (SELECT GROUP_CONCAT(id_permission SEPARATOR ',') FROM demo.Shop_Permission WHERE code IN ('STORE_PRODUCT'));
	SET v_id_access_level_edit := (SELECT id_access_level FROM demo.Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
	CALL p_validate_guid ( a_guid );
	SET a_comment := TRIM(IFNULL(a_comment, ''));
    
	DROP TEMPORARY TABLE IF EXISTS tmp_Variation_Type;
	DROP TEMPORARY TABLE IF EXISTS tmp_Variation;
	DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;

    -- Temporary tables
    CREATE TEMPORARY TABLE tmp_Variation_Type (
		id_type INT NOT NULL PRIMARY KEY
		, id_type_temp INT NOT NULL
		, code VARCHAR(50)
		, name VARCHAR(255)
		, name_plural VARCHAR(256)
		, active BIT NULL
		, display_order INT NOT NULL
		, created_on DATETIME
		, created_by INT
		, is_new BIT NOT NULL
		, name_error VARCHAR(1000) NOT NULL
    );
    -- CREATE TEMPORARY TABLE tmp_Variation_Type_Count
    
    CREATE TEMPORARY TABLE tmp_Variation (
		id_variation INT NOT NULL PRIMARY KEY
		, id_type INT NOT NULL
		, code VARCHAR(50)
		, name VARCHAR(255)
		, active BIT
		, display_order INT NOT NULL
		, created_on DATETIME
		, created_by INT
		, has_type BIT NULL
		, is_new BIT NOT NULL
		, name_error VARCHAR(1000) NOT NULL
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
		, id_type INT NOT NULL
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
    
	INSERT INTO tmp_Variation_Type (
		id_type
        , id_type_temp
		, code
		, name
		, name_plural
		, active
		, display_order
		, created_on
		, created_by
		, is_new
		, name_error
	)
	SELECT
		VT_T.id_type
		, VT_T.id_type
		, VT_T.code
		, VT_T.name
		, VT_T.name_plural
		, VT_T.active
		, VT_T.display_order
		, IFNULL(VT_T.created_on, VT.created_on) AS created_on
		, IFNULL(VT_T.created_by, VT.created_by) AS created_by
		, IFNULL(VT_T.id_type, 0) < 1 AS is_new
		, CASE WHEN IFNULL(VT_T.id_type, 0) < 1 THEN
			CONCAT(
				'New Variation Type: '
                , VT_T.display_order
                , ' - '
                , IFNULL(VT_T.code, '(No Code)')
                , ' - '
                , IFNULL(VT_T.name, '(No Name)')
			)
		ELSE
			CONCAT(
                VT_T.display_order
                , ' - '
                , IFNULL(VT_T.code, '(No Code)')
                , ' - '
                , IFNULL(VT_T.name, '(No Name)')
			)
		END AS name_error
	FROM demo.Shop_Variation_Type_Temp VT_T
	LEFT JOIN demo.Shop_Variation_Type VT ON VT_T.id_type = VT.id_type
	WHERE VT_T.GUID = a_guid
	;

	INSERT INTO tmp_Variation (
		id_variation
		, id_type
		, code
		, name
		, active
		, display_order
		, created_on
		, created_by
		, has_type
		, is_new
		, name_error
	)
	SELECT 
		V_T.id_variation
        , IFNULL(V_T.id_type, V.id_type) AS id_type
        , V_T.code
        , V_T.name
        , V_T.active
        , V_T.display_order
        , IFNULL(V_T.created_on, V.created_on) AS created_on
        , IFNULL(V_T.created_by, V.created_by) AS created_by
		, NOT ISNULL(t_VT.id_type) AS has_type
	    , IFNULL(V_T.id_variation, 0) < 1 AS is_new
        , CASE WHEN IFNULL(V_T.id_variation, 0) < 1 THEN
			CONCAT(
				'New Variation: '
                , V_T.display_order
                , ' - '
                , IFNULL(V_T.code, '(No Code)')
                , ' - '
                , IFNULL(V_T.name, '(No Name)')
			)
		ELSE
			CONCAT(
                V_T.display_order
                , ' - '
                , IFNULL(V_T.code, '(No Code)')
                , ' - '
                , IFNULL(V_T.name, '(No Name)')
			)
		END AS name_error
	FROM demo.Shop_Variation_Temp V_T
	LEFT JOIN demo.Shop_Variation V ON V_T.id_variation = V.id_variation
	-- LEFT JOIN demo.Shop_Variation_Type VT ON V_T.id_type = VT.id_type
    LEFT JOIN tmp_Variation_Type t_VT ON V_T.id_type = t_VT.id_type
	WHERE V_T.GUID = a_guid
	;
	
	-- Insert missing order records
	INSERT INTO tmp_Variation_Type (
		id_type
        , id_type_temp
		, code
		, name
		, name_plural
		, active
		, display_order
		, created_on
		, created_by
		, is_new
		, name_error
	)
	SELECT
		VT.id_type
		, VT.id_type
		, VT.code
		, VT.name
		, VT.name_plural
		, VT.active
		, VT.display_order
		, VT.created_on
		, VT.created_by
		, 0 AS is_new
		, CONCAT(
			VT.display_order
			, ' - '
			, IFNULL(VT.code, '(No Code)')
			, ' - '
			, IFNULL(VT.name, '(No Name)')
		) AS name_error
	FROM demo.Shop_Variation_Type VT
    INNER JOIN tmp_Variation t_V 
		ON VT.id_type = t_V.id_type
        AND t_V.has_type = 0
		AND NOT ISNULL(t_V.id_type)
    ;
    
    UPDATE tmp_Variation t_V
    INNER JOIN tmp_Variation_Type t_VT ON t_V.id_type = t_V.id_type
    SET t_V.has_type = 1
    WHERE t_V.has_type = 0
    ;

    -- Validation
	-- Variation Type
    # id_type
    IF EXISTS (
		SELECT * 
        FROM tmp_Variation_Type t_VT
        INNER JOIN demo.Shop_Variation_Type VT ON t_VT.id_type = VT.id_type
        WHERE 1=1
			AND t_VT.id_type > 0
			AND ISNULL(VT.id_type)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'A valid ID is required for the following Product Variation Type(s): '
				, GROUP_CONCAT(t_VT.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Variation_Type t_VT
        INNER JOIN demo.Shop_Variation_Type VT ON t_VT.id_type = VT.id_type
        WHERE 1=1
			AND t_VT.id_type > 0
			AND ISNULL(VT.id_type)
		;
    END IF;
    -- Variation
	# id_variation
    IF EXISTS (
		SELECT * 
        FROM tmp_Variation t_V
        INNER JOIN demo.Shop_Variation V ON t_V.id_variation = V.id_variation
        WHERE 1=1
			AND t_V.id_variation > 0
			AND ISNULL(V.id_variation)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'A valid ID is required for the following Product Variation(s): '
				, GROUP_CONCAT(t_V.name_error SEPARATOR ', ')
			) AS msg
        FROM tmp_Variation t_V
        INNER JOIN demo.Shop_Variation V ON t_V.id_variation = V.id_variation
        WHERE 1=1
			AND t_V.id_variation > 0
			AND ISNULL(V.id_variation)
		;
    END IF;
    # id_type
    IF EXISTS ( SELECT * FROM tmp_Variation t_V WHERE t_V.has_type = 0 LIMIT 1 ) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'A valid ID is required for the following Product Variation(s): '
				, GROUP_CONCAT(t_V.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Variation t_V
        WHERE t_V.has_type = 0
		;
    END IF;
    
    -- Duplicate Variation Type Ids
    -- Duplicate Variation Ids
    -- Duplicate Variation Type Codes
    -- Duplicate Variation Codes
    -- Variation unit measurement with no count unit measurement
    
    -- Permissions
	IF a_debug = 1 THEN
		SELECT 
			a_guid
			, a_id_user
			, FALSE -- get inactive users
			, v_ids_permission_product_variation
			, v_id_access_level_edit
			, NULL -- ids_product
			, 0 -- a_debug
		;
		SELECT * 
		FROM demo.Shop_Calc_User_Temp
		WHERE GUID = a_guid
		;
	END IF;
	
	CALL p_shop_calc_user(
		a_guid
		, a_id_user
		, FALSE -- get inactive users
		, v_ids_permission_product_variation
		, v_id_access_level_edit
		, NULL -- ids_product
		, 0 -- a_debug
	);
	
	IF a_debug = 1 THEN
		SELECT * from demo.Shop_Calc_User_Temp WHERE GUID = a_guid;
	END IF;
	
	IF EXISTS (SELECT * FROM demo.Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = a_guid AND IFNULL(UE_T.can_view, 0) = 0) THEN
		DELETE FROM tmp_Msg_Error;

		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_no_permission
			, v_code_type_error_no_permission
			, CONCAT(
				'You do not have edit permissions for '
				, GROUP_CONCAT(name SEPARATOR ', ') 
			)
		FROM demo.Shop_Permission PERM
		INNER JOIN demo.Shop_Calc_User_Temp UE_T 
			ON PERM.id_permission = UE_T.id_permission
			AND UE_T.GUID = a_guid
			AND IFNULL(UE_T.can_view, 0) = 0
		;
	END IF;

	CALL demo.p_shop_clear_calc_user( 
		a_guid
		, 0 -- a_debug 
	);
    
	IF EXISTS ( SELECT * FROM tmp_Msg_Error WHERE id_type <> v_id_type_error_warning LIMIT 1 ) THEN
		DELETE FROM tmp_Variation_Type;
        DELETE FROM tmp_Variation;
	END IF;
	
	-- Transaction    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		START TRANSACTION;
			INSERT INTO Shop_Product_Change_Set (
				comment
				, updated_last_by
				, updated_last_on
			)
			VALUES (
				a_comment
				, a_id_user
				, v_time_start
			);
			
			SET v_id_change_set := LAST_INSERT_ID();
		
			INSERT INTO demo.Shop_Variation_Type (
				id_type_temp
				, code
				, name
				, name_plural
				, active
				, display_order
				, created_on
				, created_by
			)
			SELECT
				t_VT.id_type
				, t_VT.code
				, t_VT.name
				, t_VT.name_plural
				, t_VT.active
				, t_VT.display_order
				, t_VT.created_on
				, t_VT.created_by
			FROM tmp_Variation_Type t_VT
			WHERE t_VT.is_new = 1
			;
			
			UPDATE tmp_Variation_Type t_VT
			INNER JOIN demo.Shop_Variation_Type VT ON t_VT.id_type_temp = VT.id_type_temp
			SET 
				t_VT.id_type = VT.id_type
			WHERE t_VT.is_new = 1
			;
            
			UPDATE tmp_Variation t_V
			INNER JOIN tmp_Variation_Type t_VT 
				ON t_V.id_type = t_VT.id_type_temp
				AND t_VT.is_new = 1
			SET 
				t_V.id_type = t_VT.id_type
			;
			
			INSERT INTO demo.Shop_Variation (
				id_type
				, code
				, name
				, active
				, display_order
				, created_on
				, created_by
			)
			SELECT
				t_V.id_type
				, t_V.code
				, t_V.name
				, t_V.active
				, t_V.display_order
				, t_V.created_on
				, t_V.created_by
			FROM tmp_Variation t_V
			WHERE t_V.is_new = 1
			;
		
			UPDATE demo.Shop_Variation_Type VT
			INNER JOIN tmp_Variation_Type t_VT
				ON VT.id_type = t_VT.id_type
				AND t_VT.is_new = 0
			INNER JOIN tmp_Variation t_V ON t_VT.id_type = t_V.id_type
			SET
				VT.code = t_VT.code
				, VT.name = t_VT.name
				, VT.name_plural = t_VT.name_plural
				, VT.active = t_VT.active
				, VT.display_order = t_VT.display_order
				, VT.created_on = t_VT.created_on
				, VT.created_by = t_VT.created_by
                , VT.id_change_set = v_id_change_set
			;
			
			UPDATE demo.Shop_Variation V
			INNER JOIN tmp_Variation t_V
				ON V.id_variation = t_V.id_variation
				AND t_V.is_new = 0
			SET
				V.code = t_V.code
				, V.name = t_V.name
				, V.active = t_V.active
				, V.display_order = t_V.display_order
				, V.created_on = t_V.created_on
				, V.created_by = t_V.created_by
                , V.id_change_set = v_id_change_set
			;
		
		COMMIT;
    END IF;
    
    START TRANSACTION;
		
        DELETE VT_T
		FROM demo.Shop_Variation_Type_Temp VT_T
		WHERE VT_T.GUID = a_guid
		;
		DELETE V_T
		FROM demo.Shop_Variation_Temp V_T
		WHERE V_T.GUID = a_guid
		;
		
	COMMIT;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
	INNER JOIN demo.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
	;
    
	IF a_debug = 1 THEN
		SELECT * from tmp_Variation_Type;
		SELECT * from tmp_Variation;
	END IF;

    DROP TEMPORARY TABLE tmp_Variation_Type;
    DROP TEMPORARY TABLE tmp_Variation;
    DROP TEMPORARY TABLE tmp_Msg_Error;
    
	IF a_debug = 1 THEN
		CALL demo.p_debug_timing_reporting ( v_time_start );
	END IF;
END //
DELIMITER ;


