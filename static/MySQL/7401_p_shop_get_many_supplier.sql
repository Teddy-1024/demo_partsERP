
USE PARTSLTD_PROD;

/*

CALL p_shop_get_many_supplier (
	'', # a_id_user
    1, # a_get_all_supplier
	0, # a_get_inactive_supplier
    0, # a_get_first_supplier_only
	'', # a_ids_supplier
);

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_supplier;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_supplier (
	IN a_id_user INT,
    IN a_get_all_supplier BIT,
	IN a_get_inactive_supplier BIT,
    IN a_get_first_supplier_only BIT,
	IN a_ids_supplier VARCHAR(4000)
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_supplier BIT;
    DECLARE v_guid BINARY(36);
    # DECLARE v_id_user VARCHAR(100);
    # DECLARE v_ids_permutation_unavailable VARCHAR(4000);
    DECLARE v_id_permission_supplier INT;
    # DECLARE v_ids_product_permission VARCHAR(4000);
    # DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    DECLARE v_now TIMESTAMP;
    DECLARE v_id_minimum INT;
    DECLARE v_code_error_data VARCHAR(50);
    
    
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    
	-- Argument validation + default values
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_get_all_supplier IS NULL THEN
		SET a_get_all_supplier = 1;
    END IF;
	IF a_get_inactive_supplier IS NULL THEN
		SET a_get_inactive_supplier = 0;
    END IF;
	IF a_get_first_supplier_only IS NULL THEN
		SET a_get_first_supplier_only = 0;
    END IF;
	IF a_ids_supplier IS NULL THEN
		SET a_ids_supplier = '';
	ELSE
		SET a_ids_supplier = TRIM(REPLACE(a_ids_supplier, '|', ','));
    END IF;
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Supplier;
    
    CREATE TABLE tmp_Shop_Supplier (
		id_supplier INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Supplier_id_supplier
			FOREIGN KEY (id_supplier)
			REFERENCES Shop_Supplier(id_supplier),
        active BIT NOT NULL,
        rank_supplier INT NULL
    );
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Parse filters
    SET v_has_filter_supplier = CASE WHEN a_ids_supplier = '' THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
    IF v_has_filter_supplier = 1 OR a_get_all_supplier = 1 THEN
		CALL p_split(a_ids_supplier, ',');
        
		IF EXISTS (SELECT * FROM Split_Temp S_T LEFT JOIN Shop_Supplier S ON S_T.substring = S.id_supplier WHERE ISNULL(S.id_supplier)) THEN 
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_code_error_data, 
				CONCAT('Invalid supplier IDs: ', (SELECT GROUP_CONCAT(S.id_supplier) FROM Temp_Split TS LEFT JOIN Shop_Supplier S ON TS.substring = S.id_supplier WHERE ISNULL(S.id_supplier)))
			)
			;
		ELSE
			INSERT INTO tmp_Shop_Supplier (
				id_supplier,
                active,
                rank_supplier
			)
			SELECT 
				S.id_supplier,
                S.active,
                RANK() OVER (ORDER BY id_supplier ASC) AS rank_supplier
			FROM Shop_Supplier S
            LEFT JOIN Split_Temp S_T ON S.id_supplier = S_T.substring
            WHERE
				(
					a_get_all_supplier = 1
                    OR NOT ISNULL(S_T.substring)
				)
				AND (
					a_get_inactive_supplier
                    OR S.active = 1
                )
			;
        END IF;
        
        DROP TABLE Split_Temp;
		
		IF a_get_first_supplier_only THEN
			DELETE FROM tmp_Shop_Supplier t_S
				WHERE t_S.rank_supplier > 1 /*(
					SELECT MIN(t_S.rank_supplier)
                    FROM tmp_Shop_Supplier t_S
				) */
			;
		END IF;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
        # SET v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER());
        SET v_id_permission_supplier := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_SUPPLIER' LIMIT 1);
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
        -- select * from Shop_User_Eval_Temp;
        
        CALL p_shop_user_eval(v_guid, a_id_user, FALSE, v_id_permission_supplier, v_id_access_level_view, '');
        
        -- select * from Shop_User_Eval_Temp;
        
        IF NOT EXISTS (SELECT can_view FROM Shop_User_Eval_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_code_error_data, 
				CONCAT('You do not have view permissions for ', (SELECT name FROM Shop_Permission WHERE id_permission = v_id_permission_supplier LIMIT 1))
			)
			;
        END IF;
	END IF;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns
    SET v_now := NOW();
    
    # Suppliers
    SELECT 
		t_S.id_supplier,
        S.name_company,
		name_contact,
		department_contact,
		id_address,
		phone_number,
		fax,
		email,
		website,
		id_currency,
		t_S.active
    FROM tmp_Shop_Supplier t_S
    INNER JOIN Shop_Supplier S
		ON t_S.id_supplier = S.id_supplier
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
    DROP TABLE IF EXISTS tmp_Supplier;
        
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid
	;
END //
DELIMITER ;


/*

CALL p_shop_get_many_supplier (
	'auth0|6582b95c895d09a70ba10fef', # a_id_user
    1, # a_get_all_supplier
	0, # a_get_inactive_supplier
    0, # a_get_first_supplier_only
	'' # a_ids_supplier
);

select * from shop_supplier;
select * from shop_product;
select * from TMP_MSG_ERROR;
DROP TABLE TMP_MSG_ERROR;

insert into shop_product_change_set (comment)
    values ('set product not subscription - test bool output to python');
    update shop_product
    set is_subscription = 0,
		id_change_set = (select id_change_set from shop_product_change_set order by id_change_set desc limit 1)
    where id_product = 1
*/