



-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_customer;


DELIMITER //
CREATE PROCEDURE p_shop_save_customer (
	IN a_guid VARCHAR(500),
    IN a_id_user INT,
    IN a_comment VARCHAR(500),
    IN a_id_customer INT,
    IN a_name_company VARCHAR(256),
    IN a_name_contact VARCHAR(256),
    IN a_department_contact VARCHAR(256),
    IN a_id_address INT,
    IN a_phone_number VARCHAR(20),
    IN a_email VARCHAR(515),
    IN a_id_currency INT,
    IN a_active BIT
)
BEGIN
    DECLARE v_id_error_type_bad_data INT;
    DECLARE v_id_error_type_no_permission INT;
	DECLARE v_guid_permission BINARY(36);
    DECLARE v_id_permission_customer INT;
    DECLARE v_id_access_level_EDIT INT;
    DECLARE v_has_permission BIT;
    DECLARE v_id_change_set INT;
    DECLARE v_is_new_customer BIT;
    
    SET v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA');
	SET v_guid_permission = UUID();
	SET v_id_permission_customer = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_CUSTOMER' LIMIT 1);
	SET v_id_access_level_EDIT = (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT');
    
	-- Argument default values
    IF a_guid IS NULL THEN 
		SET a_guid = UUID();
	END IF;
    
    
    -- Temporary tables
    /*
    CREATE TABLE tmp_Shop_Customer (
		id_customer INT NOT NULL,
		name_company VARCHAR(255) NOT NULL,
		name_contact VARCHAR(255) NULL,
		department_contact VARCHAR(255) NULL,
		id_address INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Customer_id_address
			FOREIGN KEY (id_address)
			REFERENCES Shop_Address(id_address),
		phone_number VARCHAR(50) NULL,
		fax VARCHAR(50) NULL,
		email VARCHAR(255) NOT NULL,
		website VARCHAR(255) NULL,
		id_currency INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Customer_id_currency
			FOREIGN KEY (id_currency)
			REFERENCES Shop_Currency(id_currency),
		active BIT NOT NULL,
        can_view BIT NOT NULL, 
        can_edit BIT NOT NULL, 
        can_admin BIT NOT NULL
    );
    */
    
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
    
    
    -- Argument validation
	IF a_id_customer IS NULL THEN
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(a_guid, v_id_error_type_bad_data, 'Customer ID must not be null')
        ;
    END IF;
	IF a_name_company IS NULL THEN
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(a_guid, v_id_error_type_bad_data, 'Customer company name must not be null')
        ;
    END IF;
	IF a_id_address IS NULL THEN
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(a_guid, v_id_error_type_bad_data, 'Customer address ID must not be null')
        ;
    END IF;
	IF a_email IS NULL THEN
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(a_guid, v_id_error_type_bad_data, 'Customer email must not be null')
        ;
    END IF;
	IF a_active IS NULL THEN
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(a_guid, v_id_error_type_bad_data, 'Customer active status must not be null')
        ;
    END IF;
    
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		SET v_is_new_customer := CASE WHEN a_id_customer <= 0 THEN 1 ELSE 0 END;
		
        IF (v_is_new_customer = 0 AND NOT EXISTS (SELECT * FROM Shop_Customer C WHERE C.id_customer = a_id_customer)) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, CONCAT('Invalid customer ID: ', a_id_customer))
			;
		END IF;
    END IF;
    
    /*
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		INSERT INTO tmp_Shop_Customer (
			id_customer, name_company, name_contact, department_contact, id_address, phone_number, fax, email, website, id_currency, active
		)
		VALUES 
			(a_id_customer, a_name_company, a_name_contact, a_department_contact, a_id_address, a_phone_number, a_fax, a_email, a_website, a_id_currency, a_active)
		/*
		FROM Shop_Customer S
		WHERE (NOT v_has_filter_category OR C.id_category LIKE '%' || a_ids_category || '%')
			AND (a_get_inactive_categories OR C.active)
		*
        ;
    END IF;
    */
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
        CALL p_shop_user_eval(v_guid_permission, a_id_user, 0, v_id_permission_customer, v_id_access_level_edit, '');
        
        /*
        UPDATE tmp_Shop_Customer t_S
        INNER JOIN Shop_User_Eval_Temp TP
			ON TP.GUID = v_guid_permission
        SET tP.can_view = TP.can_view,
			tP.can_edit = TP.can_edit,
            tP.can_admin = TP.can_admin;
		*/
        SET v_has_permission := (SELECT can_edit FROM Shop_User_Eval_Temp WHERE GUID = v_guid_permission);
        
        IF v_has_permission = 0 THEN
			SET v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, msg
			)
			SELECT
				a_guid, 
				v_id_error_type_no_permission, 
				CONCAT('You do not have ', name, ' permissions.')
			FROM Shop_Permission
            WHERE id_permission = v_id_permission_customer
			;
        END IF;
        
        -- CALL p_shop_user_eval_clear_temp(v_guid_permission);
        
        DELETE FROM Shop_User_Eval_Temp
        WHERE GUID = a_guid;
    END IF;
    
    
	-- Transaction    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		INSERT INTO Shop_Sales_And_Purchasing_Change_Set (
			comment,
			updated_last_by,
			updated_last_on
		)
		VALUES (
			CONCAT(
				'Save ',
                CASE WHEN v_is_new_customer = 1 THEN 'new ' ELSE '' END,
                'Customer - ',
                a_comment
			),
			a_id_user,
			CURRENT_TIME()
		);
		
        SET v_id_change_set := (SELECT id_change_set FROM Shop_Sales_And_Purchasing_Change_Set ORDER BY id_change_set DESC LIMIT 1);
        
		START TRANSACTION;
			IF (v_is_new_customer = 1) THEN
				INSERT INTO Shop_Customer (
					-- id_customer, 
                    name_company, name_contact, department_contact, id_address, phone_number, email, id_currency, active, id_change_set
				)
				VALUES 
					(
						-- a_id_customer, 
						a_name_company, a_name_contact, a_department_contact, a_id_address, a_phone_number, a_email, a_id_currency, a_active, v_id_change_set
                    )
				/*
				FROM Shop_Customer S
				WHERE (NOT v_has_filter_category OR C.id_category LIKE '%' || a_ids_category || '%')
					AND (a_get_inactive_categories OR C.active)
				*/
				;
			ELSE 
				UPDATE Shop_Customer C
				-- INNER JOIN tmp_Shop_Customer t_S ON S.id_customer = t_S.id_customer
				SET 
					/*
					S.name_company = t_S.name_company,
					S.name_contact = t_S.name_contact,
					S.department_contact = t_S.department_contact,
					S.id_address = t_S.id_address,
					S.phone_number = t_S.phone_number,
					S.fax = t_S.fax,
					S.email = t_S.email,
					S.website = t_S.website,
					S.id_currency = t_S.id_currency,
					S.active = t_S.active
                    */
					C.name_company = a_name_company,
					C.name_contact = a_name_contact,
					C.department_contact = a_department_contact,
					C.id_address = a_id_address,
					C.phone_number = a_phone_number,
					C.email = a_email,
					C.website = a_website,
					C.id_currency = a_id_currency,
					C.active = a_active,
                    C.id_change_set = v_id_change_set
				;
			END IF;
		
		IF EXISTS (SELECT * FROM tmp_Msg_Error) THEN
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
    END IF;
    
    -- Returns
    -- SET v_now = NOW();
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
	;
    
    -- DROP TABLE tmp_Shop_Customer;
    DROP TABLE tmp_Msg_Error;
END //
DELIMITER ;;


/*

CALL p_shop_save_customer (
	'NIPS', # a_guid
    'auth0|6582b95c895d09a70ba10fef', # a_id_user
    'Initial Customer', # a_comment
    '-1', # a_id_customer
    'good co', # a_name_company
    'teddy', # a_name_contact
    'manufacturing', # a_department_contact
    1, # a_id_address
    'BRING BRING', # a_phone_number
    'e@mail.com', # a_email
    1, # a_id_currency_cost
    1 # a_active
);

SELECT * FROM Shop_Customer
;

DELETE FROM Shop_Customer
;

*/
