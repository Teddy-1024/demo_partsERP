
USE PARTSLTD_PROD;


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_save_product;
DROP PROCEDURE IF EXISTS p_shop_save_product;


DELIMITER //
CREATE PROCEDURE p_shop_save_product (
	IN a_guid BINARY(36),
	IN a_id_user INT,
	IN a_comment VARCHAR(500)
)
BEGIN
	DECLARE v_code_type_error_bad_data VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission LONGTEXT;
    DECLARE v_id_change_set INT;
    
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
    END;
    
    SET v_code_type_error_bad_data := 'BAD_DATA';
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    
    SET a_guid := IFNULL(a_guid, UUID());
    
    
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
        , guid BIGINT NOT NULL
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
        , IFNULL(PT.name, P.name) AS name
        , IFNULL(PT.has_variations, P.has_variations) AS has_variations
        , IFNULL(PT.id_access_level_required, P.id_access_level_required) AS id_access_level_required
        , IFNULL(P_T.active, P.active) AS active
        , IFNULL(P_T.display_order, P.display_order) AS display_order
        , IFNULL(PT.name, IFNULL(P.name, IFNULL(P_T.id_product, '(No Product)'))) AS name_error
        , CASE WHEN IFNULL(P_T.id_product, 0) < 1 THEN 1 ELSE 0 END AS is_new
	FROM Shop_Product_Tenp P_T
    LEFT JOIN Shop_Product P ON P_T.id_product = P.id_product
    ;
    
    -- Validation
    -- Missing mandatory fields
    INSERT INTO tmp_Msg_Error (
		guid
        , id_type
        , code
        , msg
	)
    -- id_category
    SELECT
		a_guid AS GUID
        , v_id_type_error_bad_data
        , v_code_error_bad_data
        , CONCAT('The following product(s) do not have a category: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', '))
	FROM tmp_Product t_P
    WHERE ISNULL(t_P.id_category)
    UNION
    -- name
    SELECT
		a_guid AS GUID
        , v_id_type_error_bad_data
        , v_code_error_bad_data
        , CONCAT('The following product(s) do not have a name: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', '))
	FROM tmp_Product t_P
    WHERE ISNULL(t_P.name)
    UNION
    -- has_variations
    SELECT
		a_guid AS GUID
        , v_id_type_error_bad_data
        , v_code_error_bad_data
        , CONCAT('The following product(s) do not have a has-variations setting: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', '))
	FROM tmp_Product t_P
    WHERE ISNULL(t_P.has_variations)
    UNION
    -- id_access_level_required
    SELECT
		a_guid AS GUID
        , v_id_type_error_bad_data
        , v_code_error_bad_data
        , CONCAT('The following product(s) do not have a required access level ID: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', '))
	FROM tmp_Product t_P
    WHERE ISNULL(t_P.id_access_level_required)
    UNION
    -- display_order
    SELECT
		a_guid AS GUID
        , v_id_type_error_bad_data
        , v_code_error_bad_data
        , CONCAT('The following product(s) do not have a display order: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', '))
	FROM tmp_Product t_P
    WHERE ISNULL(t_P.display_order)
    ;
    
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN -- (SELECT * FROM tmp_Product WHERE is_new = 0 LIMIT 1) THEN
        SET v_ids_product_permission := (SELECT GROUP_CONCAT(item SEPARATOR ',') FROM tmp_Shop_Product WHERE is_new = 0);
        IF NOT ISNULL(v_ids_product_permission) THEN
			SET v_id_permission_product = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
			
			CALL p_shop_user_eval(a_guid, a_id_user, v_id_permission_product, v_ids_product_permission);
			
			UPDATE tmp_Product t_P
			INNER JOIN Shop_User_Eval_Temp UE_T
				ON t_P.id_product = UE_T.id_product
				AND UE_T.GUID = a_guid
			SET 
				t_P.can_view = UE_T.can_view
				, t_P.can_edit = UE_T.can_edit
				, t_P.can_admin = UE_T.can_admin
			;
			
			CALL p_shop_user_eval_clear_temp(a_guid);
		END IF;
    END IF;
    
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		-- Start the transaction
		START TRANSACTION;
		
		-- Your transaction logic goes here
		IF NOT ISNULL(v_ids_product_permission) THEN
			INSERT INTO Shop_Product_Change_Set ( comment )
			VALUES ( a_comment )
			;
			
			SET v_id_change_set := LAST_INSERT_ID();
			
			UPDATE Shop_Product P
			INNER JOIN tmp_Product t_P ON P.id_product = t_P.id_product
			SET 
				P.id_category = t_P.id_category
				, P.name = t_P.name
				, P.has_variations = t_P.has_variations
				, P.id_access_level_required = t_P.id_access_level_required
				, P.display_order = t_P.display_order
				, P.id_change_set = v_id_change_set
			;
		END IF;
		
		INSERT INTO Shop_Product (
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
			, v_now AS created_on
		FROM tmp_Product t_P
		WHERE is_new = 1
		;
		
		-- If we reach here without error, commit the transaction
		COMMIT;
    END IF;
    
    SELECT * FROM tmp_Msg_Error;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
END //
DELIMITER ;

