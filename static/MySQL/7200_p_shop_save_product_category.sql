



-- Clear previous proc
DROP PROCEDURE IF EXISTS p_save_category;
DROP PROCEDURE IF EXISTS p_shop_save_category;
DROP PROCEDURE IF EXISTS p_shop_save_product_category;


DELIMITER //
CREATE PROCEDURE p_shop_save_product_category (
	IN a_id_user INT,
	IN a_guid BINARY(36),
	IN a_comment VARCHAR(500)
)
BEGIN
	DECLARE v_code_type_error_bad_data VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission LONGTEXT;
    DECLARE v_id_change_set INT;
    DECLARE v_id_access_level_edit INT;
    DECLARE v_now TIMESTAMP;
    
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
        
		CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
			display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
			, guid BINARY(36) NOT NULL
			, id_type INT NULL
			, code VARCHAR(50) NOT NULL
			, msg VARCHAR(4000) NOT NULL
		);
        INSERT INTO tmp_Msg_Error (
			guid
            , id_type
            , code
            , msg
		)
        SELECT 
			a_guid
            , NULL
            , @errno
            , @text
		;
        SELECT *
        FROM tmp_Msg_Error;
		DROP TABLE IF EXISTS tmp_Msg_Error;
    END;
    
    SET v_code_type_error_bad_data := 'BAD_DATA';
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_id_access_level_edit := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
    SET a_guid := IFNULL(a_guid, UUID());
    
    DROP TABLE IF EXISTS tmp_Category;
    
    CREATE TEMPORARY TABLE tmp_Category (
		id_category INT NOT NULL
        , code VARCHAR(50) NOT NULL
        , name VARCHAR(255) NOT NULL
        , description VARCHAR(4000) NULL
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
        , guid BINARY(36) NOT NULL
		, id_type INT NULL
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
        
    
    -- Get data from Temp table
    INSERT INTO tmp_Category (
		id_category
        , code
        , name
        , description
        , id_access_level_required
        , active
        , display_order
        , name_error
        , is_new
	)
    SELECT 
		IFNULL(PC_T.id_category, PC.id_category) AS id_category
        , IFNULL(PC_T.code, PC.code) AS code
        , IFNULL(PC_T.name, PC.code) AS name
        , IFNULL(PC_T.description, PC.description) AS description
        , PC_T.id_access_level_required AS id_access_level_required
        , IFNULL(PC_T.active, PC.active) AS active
        , IFNULL(PC_T.display_order, PC.display_order) AS display_order
        , IFNULL(PC_T.name, IFNULL(PC.name, IFNULL(PC_T.code, IFNULL(PC.code, IFNULL(PC_T.id_category, '(No Product Category)'))))) AS name_error
        , CASE WHEN IFNULL(PC_T.id_category, 0) < 1 THEN 1 ELSE 0 END AS is_new
	FROM Shop_Product_Category_Temp PC_T
    LEFT JOIN Shop_Product_Category PC ON PC_T.id_category = PC.id_category
    WHERE PC_T.guid = a_guid
    ;
    
    -- Validation
    -- Missing mandatory fields
    -- code
    IF EXISTS (SELECT * FROM tmp_Category t_C WHERE ISNULL(t_C.code) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, code
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following category(s) do not have a code: ', GROUP_CONCAT(IFNULL(t_C.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Category t_C
		WHERE ISNULL(t_C.code)
		;
    END IF;
    -- name
    IF EXISTS (SELECT * FROM tmp_Category t_C WHERE ISNULL(t_C.name) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, code
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following category(s) do not have a name: ', GROUP_CONCAT(IFNULL(t_C.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Category t_C
		WHERE ISNULL(t_C.name)
		;
    END IF;
    -- display_order
    IF EXISTS (SELECT * FROM tmp_Category t_C WHERE ISNULL(t_C.display_order) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, code
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following category(s) do not have a display order: ', GROUP_CONCAT(IFNULL(t_C.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Category t_C
		WHERE ISNULL(t_C.display_order)
		;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN -- (SELECT * FROM tmp_Product WHERE is_new = 0 LIMIT 1) THEN
        SET v_ids_product_permission := (
			SELECT GROUP_CONCAT(P.id_product SEPARATOR ',') 
            FROM Shop_Product P 
            INNER JOIN tmp_Category t_C
				ON P.id_category = t_C.id_category 
                AND t_C.is_new = 0
		);
        IF NOT ISNULL(v_ids_product_permission) THEN
			SET v_id_permission_product = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
			
			CALL p_shop_user_eval(a_guid, a_id_user, FALSE, v_id_permission_product, v_id_access_level_edit, v_ids_product_permission);
			
			UPDATE tmp_Category t_C
            INNER JOIN Shop_Product P ON t_C.id_category = P.id_product
			INNER JOIN Shop_User_Eval_Temp UE_T
				ON P.id_product = UE_T.id_product
				AND UE_T.GUID = a_guid
			SET 
				t_C.can_view = UE_T.can_view
				, t_C.can_edit = UE_T.can_edit
				, t_C.can_admin = UE_T.can_admin
			;
			
			CALL p_clear_shop_user_eval_temp(a_guid);
		END IF;
    END IF;
    
    SET v_now := CURRENT_TIMESTAMP();
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		START TRANSACTION;
		
		IF NOT ISNULL(v_ids_product_permission) THEN
			INSERT INTO Shop_Product_Change_Set ( comment )
			VALUES ( a_comment )
			;
			
			SET v_id_change_set := LAST_INSERT_ID();
			
			UPDATE Shop_Product_Category PC
			INNER JOIN tmp_Category t_C ON PC.id_category = t_C.id_category
			SET 
				PC.id_category = t_C.id_category
				, PC.code = t_C.code
				, PC.name = t_C.name
				, PC.description = t_C.description
                , PC.id_access_level_required = t_C.id_access_level_required
                , PC.active = t_C.active
				, PC.display_order = t_C.display_order
				, PC.id_change_set = v_id_change_set
			;
		END IF;
		
		INSERT INTO Shop_Product_Category (
			code
			, name
			, description
            , id_access_level_required
            , active
			, display_order
			, created_by
			, created_on
		)
		SELECT
			-- t_C.id_category AS id_category
            t_C.code AS code
			, t_C.name AS name
			, t_C.description AS description
            , t_C.id_access_level_required AS id_access_level_required
			, t_C.active AS active
			, t_C.display_order AS display_order
			, a_id_user AS created_by
			, v_now AS created_on
		FROM tmp_Category t_C
		WHERE is_new = 1
			AND active = 1
		;
		
		COMMIT;
    END IF;
    
    DELETE FROM Shop_Product_Category_Temp
    WHERE GUID = a_guid;
    
    SELECT * FROM tmp_Msg_Error;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Catgory;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
END //
DELIMITER ;;

