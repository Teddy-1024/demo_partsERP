
USE PARTSLTD_PROD;

/*

CALL p_shop_get_many_customer (
	'', # a_id_user
    1, # a_get_all_customer
	0, # a_get_inactive_customer
    0, # a_get_first_customer_only
	'', # a_ids_customer
);

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_customer;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_customer (
	IN a_id_user VARCHAR(200),
    IN a_get_all_customer BIT,
	IN a_get_inactive_customer BIT,
    IN a_get_first_customer_only BIT,
	IN a_ids_customer VARCHAR(4000)
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_id_error_type_bad_data INT;
    DECLARE v_code_error_type_bad_data VARCHAR(50);
    DECLARE v_has_filter_customer BIT;
    DECLARE v_guid VARCHAR(36);
    # DECLARE v_id_user VARCHAR(100);
    # DECLARE v_ids_permutation_unavailable VARCHAR(4000);
    DECLARE v_id_permission_customer INT;
    # DECLARE v_ids_product_permission VARCHAR(4000);
    # DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    DECLARE v_now DATETIME;
    DECLARE v_id_minimum INT;
    
    SET v_code_error_type_bad_data = 'BAD_DATA';
    SET v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_bad_data LIMIT 1);
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');
    
    
	-- Argument validation + default values
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_get_inactive_customer IS NULL THEN
		SET a_get_inactive_customer = 0;
    END IF;
	IF a_get_first_customer_only IS NULL THEN
		SET a_get_first_customer_only = 0;
    END IF;
	IF a_ids_customer IS NULL THEN
		SET a_ids_customer = '';
	ELSE
		SET a_ids_customer = TRIM(REPLACE(a_ids_customer, '|', ','));
    END IF;
    
    SET v_has_filter_customer = CASE WHEN a_ids_customer = '' THEN 0 ELSE 1 END;
    
	IF a_get_all_customer IS NULL THEN
		SET a_get_all_customer = NOT v_has_filter_customer;
    END IF;
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Customer;
    
    CREATE TABLE tmp_Shop_Customer (
		id_customer INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Customer_id_customer
			FOREIGN KEY (id_customer)
			REFERENCES Shop_Customer(id_customer),
        active BIT NOT NULL,
        rank_customer INT NULL,
        can_view BIT, 
        can_edit BIT, 
        can_admin BIT
    );
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid VARCHAR(36) NOT NULL,
		id_type INT NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Parse filters
    SET v_has_filter_customer = CASE WHEN a_ids_customer = '' THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
    IF v_has_filter_customer = 1 OR a_get_all_customer = 1 THEN
		CALL p_split(a_ids_customer, ',');
        
		IF EXISTS (SELECT * FROM Split_Temp S_T LEFT JOIN Shop_Customer C ON S_T.substring = C.id_customer WHERE ISNULL(C.id_customer)) THEN 
			INSERT INTO tmp_Msg_Error (
				guid,
                id_type,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_id_error_type_bad_data,
				v_code_error_type_bad_data, 
				CONCAT('Invalid customer IDs: ', (SELECT GROUP_CONCAT(C.id_customer) FROM Split_Temp S_T LEFT JOIN Shop_Customer C ON S_T.substring = C.id_customer WHERE ISNULL(C.id_customer)))
			)
			;
		ELSE
			INSERT INTO tmp_Shop_Customer (
				id_customer,
                active,
                rank_customer
			)
			SELECT 
				C.id_customer,
                C.active,
                RANK() OVER (ORDER BY C.id_customer ASC) AS rank_customer
			FROM Shop_Customer C
            LEFT JOIN Split_Temp S_T ON C.id_customer = S_T.substring
            WHERE
				(
					a_get_all_customer = 1
                    OR NOT ISNULL(S_T.substring)
				)
				AND (
					a_get_inactive_customer = 1
                    OR C.active = 1
                )
			;
        END IF;
        
        DROP TABLE Split_Temp;
		
		IF a_get_first_customer_only = 1 THEN
			DELETE FROM tmp_Shop_Customer t_C
				WHERE t_C.rank_customer > (
					SELECT MIN(t_C.rank_customer)
                    FROM tmp_Shop_Customer t_C
				)
			;
		END IF;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
        # SET v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER());
        SET v_id_permission_customer := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_CUSTOMER' LIMIT 1);
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
        -- select * from Shop_User_Eval_Temp;
        
        CALL p_shop_user_eval(v_guid, a_id_user, FALSE, v_id_permission_customer, v_id_access_level_view, '');
        
        -- select * from Shop_User_Eval_Temp;
        
        IF NOT EXISTS (SELECT can_view FROM Shop_User_Eval_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
                id_type,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_id_error_type_bad_data,
				v_code_error_type_bad_data, 
				CONCAT('You do not have view permissions for ', IFNULL((SELECT name FROM Shop_Permission WHERE id_permission = v_id_permission_customer LIMIT 1), 'Permission not found'))
			)
			;
        END IF;
	END IF;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns
    -- SET v_now := NOW();
    
    # customers
    SELECT 
		t_C.id_customer,
        C.name_company,
		C.name_contact,
		C.department_contact,
		C.id_address,
		C.phone_number,
		C.email,
		C.id_currency,
		C.active
    FROM tmp_Shop_Customer t_C
    INNER JOIN Shop_Customer C ON t_C.id_customer = C.id_customer
	;
    
    # Errors
    SELECT 
		/*
        t_ME.display_order,
		t_ME.guid,
        t_ME.id_type,
        t_ME.msg,
        MET.code, 
        MET.name,
        MET.description
        */
        *
    FROM tmp_Msg_Error t_ME
    INNER JOIN Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    WHERE guid = v_guid
    ;
    
    /*
    # Return arguments for test
    SELECT
	a_ids_category,
	a_get_inactive_category,
	a_ids_product,
	a_get_inactive_product,
    a_get_first_product_only,
    a_get_all_product,
	a_ids_image,
	a_get_inactive_image,
    a_get_first_image_only,
    a_get_all_image
    ;
    */
    
    # select 'other outputs';
    # select * from tmp_Shop_Product;
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_Customer;
        
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid
	;
END //
DELIMITER ;


/*
CALL p_shop_get_many_customer (
	'', # a_id_user
    1, # a_get_all_customer
	0, # a_get_inactive_customer
    0, # a_get_first_customer_only
	'' # a_ids_customer
);

SELECT *
FROM Shop_Customer;

*/
