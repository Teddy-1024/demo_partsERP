



-- Clear previous proc
DROP PROCEDURE IF EXISTS p_save_product;
DROP PROCEDURE IF EXISTS p_shop_save_product;


DELIMITER //
CREATE PROCEDURE p_shop_save_product (
    IN a_comment VARCHAR(500),
	IN a_guid BINARY(36),
    IN a_id_user INT,
    IN a_debug BIT
)
BEGIN
	DECLARE v_code_type_error_bad_data VARCHAR(100);
    DECLARE v_id_access_level_edit INT;
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission LONGTEXT;
    DECLARE v_id_change_set INT;
    DECLARE v_time_start TIMESTAMP(6);
    
    DECLARE exit handler for SQLEXCEPTION
    BEGIN
        -- Get diagnostic information
        GET DIAGNOSTICS CONDITION 1
            @sqlstate = RETURNED_SQLSTATE
            , @errno = MYSQL_ERRNO
            , @text = MESSAGE_TEXT
		;
        
        -- Rollback the transaction
        ROLLBACK;
        
        -- Select the error information
        -- SELECT 'Error' AS status, @errno AS error_code, @sqlstate AS sql_state, @text AS message;
        INSERT INTO tmp_Msg_Error (
			-- guid
            id_type
            , code
            , msg
		)
        SELECT 
			-- a_guid
            (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'MYSQL_ERROR' LIMIT 1)
            , @errno
            , IFNULL(@text, 'NULL')
		;
        
        SELECT *
        FROM tmp_Msg_Error t_ME
        INNER JOIN demo.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
        ;
        
        DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
        DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    END;
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_code_type_error_bad_data := (SELECT code FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_id_access_level_edit := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
    CALL p_validate_guid ( a_guid );
    SET a_debug := IFNULL(a_debug, 0);
    
    IF a_debug = 1 THEN
		SELECT 
			v_code_type_error_bad_data
            , v_id_type_error_bad_data
        ;
    END IF;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    
    CREATE TEMPORARY TABLE tmp_Product (
		id_category INT NOT NULL
		, id_product INT NOT NULL
        , name VARCHAR(255) NOT NULL
		, has_variations BIT NOT NULL
		, id_access_level_required INT NOT NULL
        , active BIT NOT NULL
        , display_order INT NOT NULL
        , can_view BIT NULL
        , can_edit BIT NULL
        , can_admin BIT NULL
        , name_error VARCHAR(255) NOT NULL
        , is_new BIT NOT NULL
    );
        
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
        -- , guid BINARY(36) NOT NULL
		, id_type INT NOT NULL
		/*
        CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        */
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
        
    
    -- Get data from Temp table
    INSERT INTO tmp_Product (
		id_category
        , id_product
        , name
        , has_variations
        , id_access_level_required
        , active
        , display_order
        , name_error
        , is_new
	)
    SELECT 
		IFNULL(P_T.id_category, P.id_category) AS id_category
        , IFNULL(P_T.id_product, 0) AS id_product
        , IFNULL(P_T.name, P.name) AS name
        , IFNULL(P_T.has_variations, P.has_variations) AS has_variations
        , IFNULL(P_T.id_access_level_required, P.id_access_level_required) AS id_access_level_required
        , IFNULL(P_T.active, P.active) AS active
        , IFNULL(P_T.display_order, P.display_order) AS display_order
        , IFNULL(P_T.name, IFNULL(P.name, IFNULL(P_T.id_product, '(No Product)'))) AS name_error
        , CASE WHEN IFNULL(P_T.id_product, 0) < 1 THEN 1 ELSE 0 END AS is_new
	FROM demo.Shop_Product_Temp P_T
    LEFT JOIN demo.Shop_Product P ON P_T.id_product = P.id_product
    ;
    
    -- Validation
    -- Missing mandatory fields    
    -- id_category
    IF EXISTS (SELECT * FROM tmp_Product t_P WHERE ISNULL(t_P.id_category) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, IFNULL(CONCAT('The following product(s) do not have a category: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')), 'NULL')
		FROM tmp_Product t_P
		WHERE ISNULL(t_P.id_category)
		;
	END IF;
    
    -- name
    IF EXISTS (SELECT * FROM tmp_Product t_P WHERE ISNULL(t_P.name) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, IFNULL(CONCAT('The following product(s) do not have a name: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')), 'NULL')
		FROM tmp_Product t_P
		WHERE ISNULL(t_P.name)
		;
	END IF;
    
    -- has_variations
    IF EXISTS (SELECT * FROM tmp_Product t_P WHERE ISNULL(t_P.has_variations) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, IFNULL(CONCAT('The following product(s) do not have a has-variations setting: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')), 'NULL')
		FROM tmp_Product t_P
		WHERE ISNULL(t_P.has_variations)
		;
	END IF;
    
    -- id_access_level_required
    IF EXISTS (SELECT * FROM tmp_Product t_P WHERE ISNULL(t_P.id_access_level_required) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, IFNULL(CONCAT('The following product(s) do not have a required access level ID: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')), 'NULL')
		FROM tmp_Product t_P
		WHERE ISNULL(t_P.id_access_level_required)
		;
	END IF;
    
    -- display_order
    IF EXISTS (SELECT * FROM tmp_Product t_P WHERE ISNULL(t_P.display_order) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, IFNULL(CONCAT('The following product(s) do not have a display order: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')), 'NULL')
		FROM tmp_Product t_P
		WHERE ISNULL(t_P.display_order)
		;
	END IF;
    
    
    -- Permissions
	SET v_ids_product_permission := (SELECT GROUP_CONCAT(id_product SEPARATOR ',') FROM tmp_Product WHERE is_new = 0);

	SET v_id_permission_product = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
	
	CALL demo.p_shop_calc_user(
		a_guid
		, a_id_user
		, FALSE -- get_inactive_users
		, v_id_permission_product
		, v_id_access_level_edit
		, v_ids_product_permission
		, 0 -- debug
	);
	
	UPDATE tmp_Product t_P
	INNER JOIN demo.Shop_Calc_User_Temp UE_T
		ON t_P.id_product = UE_T.id_product
		AND UE_T.GUID = a_guid
	SET 
		t_P.can_view = UE_T.can_view
		, t_P.can_edit = UE_T.can_edit
		, t_P.can_admin = UE_T.can_admin
	;
    
    IF EXISTS (SELECT * FROM tmp_Product WHERE IFNULL(can_edit, 0) = 0 AND is_new = 0 LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_no_permission
			, v_code_type_error_no_permission
			, CONCAT('You do not have permission to edit the following Product(s): ', IFNULL(GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', '), 'NULL'))
		FROM tmp_Product t_P
		WHERE 
			IFNULL(can_edit, 0) = 0 
            AND is_new = 0
		;
    END IF;
    
    IF EXISTS (SELECT * FROM demo.Shop_Calc_User_Temp WHERE ISNULL(id_product) AND GUID = a_guid AND can_edit = 0) THEN
		DELETE t_ME
        FROM tmp_Msg_Error t_ME
        WHERE t_ME.id_type <> v_id_type_error_no_permission
        ;
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		VALUES (
			v_id_type_error_no_permission
			, v_code_type_error_no_permission
			, 'You do not have permission to edit Products'
		)
		;
    END IF;
	
	CALL demo.p_shop_clear_calc_user(
		a_guid
		, 0 -- debug
	);
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		START TRANSACTION;
	
			INSERT INTO demo.Shop_Product_Change_Set ( comment )
			VALUES ( a_comment )
			;
			
			SET v_id_change_set := LAST_INSERT_ID();
			
			UPDATE demo.Shop_Product P
			INNER JOIN tmp_Product t_P ON P.id_product = t_P.id_product
			SET 
				P.id_category = t_P.id_category
				, P.name = t_P.name
				, P.has_variations = t_P.has_variations
				, P.id_access_level_required = t_P.id_access_level_required
				, P.display_order = t_P.display_order
				, P.active = t_P.active
				, P.id_change_set = v_id_change_set
			;
            
            INSERT INTO demo.Shop_Product (
                id_category
                , name
                , has_variations
                , id_access_level_required
                , display_order
                , created_by
                , created_on
            )
            SELECT
                t_P.id_category AS id_category
                , t_P.name AS name
                , t_P.has_variations AS has_variations
                , t_P.id_access_level_required AS id_access_level_required
                , t_P.display_order AS display_order
                , a_id_user AS created_by
                , v_time_start AS created_on
            FROM tmp_Product t_P
            WHERE is_new = 1
            ;
            
		COMMIT;
    END IF;
        
	START TRANSACTION;

		DELETE FROM demo.Shop_Product_Temp
		WHERE GUID = a_guid;

	COMMIT;
    
    SELECT * 
    FROM tmp_Msg_Error t_ME
    INNER JOIN demo.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
    ;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    
    IF a_debug = 1 THEN
		CALL demo.p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;

