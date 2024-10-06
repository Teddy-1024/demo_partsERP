



-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_product_category_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_product_category_test (
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
        
        SELECT * FROM tmp_Msg_Error;
		DROP TABLE IF EXISTS tmp_Msg_Error;
    END;
    
	select 'p_shop_save_product_category_test';
    
    SET v_code_type_error_bad_data := 'BAD_DATA';
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    
    SET a_guid := IFNULL(a_guid, UUID());
    
    DROP TABLE IF EXISTS tmp_Category;
    
    CREATE TEMPORARY TABLE tmp_Category (
		id_category INT NOT NULL
        , code VARCHAR(50) NOT NULL
        , name VARCHAR(255) NOT NULL
        , description VARCHAR(4000) NULL
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
		/*
        CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        */
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
        
    
    -- Get data from Temp table
    INSERT INTO tmp_Category (
		id_category
        , code
        , name
        , description
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
        , CONCAT('The following category(s) do not have a code: ', GROUP_CONCAT(t_C.name_error SEPARATOR ', ')) AS msg
	FROM tmp_Category t_C
    ;
    -- name
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
        , CONCAT('The following category(s) do not have a name: ', GROUP_CONCAT(t_C.name_error SEPARATOR ', ')) AS msg
	FROM tmp_Category t_C
    ;
    -- display_order
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
        , CONCAT('The following category(s) do not have a display order: ', GROUP_CONCAT(t_C.name_error SEPARATOR ', ')) AS msg
	FROM tmp_Category t_C
    ;
    
    SELECT * FROM tmp_Category;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN -- (SELECT * FROM tmp_Product WHERE is_new = 0 LIMIT 1) THEN
        SET v_ids_product_permission := (
			SELECT GROUP_CONCAT(P.id_product SEPARATOR ',') 
            FROM Shop_Product P 
            INNER JOIN Shop_Product_Category PC 
				ON P.id_category = PC.id_category 
                AND PC.is_new = 0
		);
        IF NOT ISNULL(v_ids_product_permission) THEN
			SET v_id_permission_product = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
			
			CALL p_shop_calc_user(a_guid, a_id_user, v_id_permission_product, v_ids_product_permission);
			
			UPDATE tmp_Category t_C
            INNER JOIN Shop_Product P ON t_C.id_category = P.id_product
			INNER JOIN Shop_Calc_User_Temp UE_T
				ON P.id_product = UE_T.id_product
				AND UE_T.GUID = a_guid
			SET 
				t_C.can_view = UE_T.can_view
				, t_C.can_edit = UE_T.can_edit
				, t_C.can_admin = UE_T.can_admin
			;
			
			CALL p_shop_clear_calc_user(a_guid);
		END IF;
    END IF;
    
    SELECT * FROM tmp_Category;
    
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
				, PC.name = t_P.name
				, PC.description = t_C.description
				, PC.display_order = t_C.display_order
                , PC.active = t_C.active
				, P.id_change_set = v_id_change_set
			;
		END IF;
		
		INSERT INTO Shop_Product_Category (
			id_category
            , code
			, name
			, description
			, display_order
            , active
			, created_by
			, created_on
		)
		SELECT
			t_C.id_category AS id_category
            , t_C.code AS code
			, t_C.name AS name
			, t_C.description AS description
			, t_C.active AS active
			, t_P.display_order AS display_order
			, a_id_user AS created_by
			, v_now AS created_on
		FROM tmp_Category t_C
		WHERE is_new = 1
			AND active = 1
		;
		
		ROLLBACK;
    END IF;
    
    SELECT * FROM tmp_Msg_Error;
    SELECT * FROM tmp_Category;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Catgory;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
END //
DELIMITER ;;


select *
from shop_product_category;
select *
from shop_product_category_temp;

SELECT 'nips' as guid;

CALL p_shop_save_product_category_TEST  (1, 'nips', 'y');

select *
from shop_product_category;
select *
from shop_product_category_temp;


