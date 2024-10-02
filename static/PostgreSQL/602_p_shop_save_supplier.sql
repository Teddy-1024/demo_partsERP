



CREATE OR REPLACE PROCEDURE p_shop_save_supplier (
	IN a_guid UUID,
    IN a_id_user INTEGER,
    IN a_comment UUID,
    IN a_id_supplier INTEGER,
    IN a_name_company VARCHAR(256),
    IN a_name_contact VARCHAR(256),
    IN a_department_contact VARCHAR(256),
    IN a_id_address INTEGER,
    IN a_phone_number VARCHAR(20),
    IN a_fax VARCHAR(20),
    IN a_email VARCHAR(515),
    IN a_website VARCHAR(300),
    IN a_id_currency INTEGER,
    IN a_active BOOLEAN
)
AS $$
DECLARE
	v_guid UUID;
    v_id_user INTEGER;
	v_comment VARCHAR(4000);
    v_id_supplier INTEGER;
    v_name_company VARCHAR(256);
    v_name_contact VARCHAR(256);
    v_department_contact VARCHAR(256);
    v_id_address INTEGER;
    v_phone_number VARCHAR(256);
    v_fax VARCHAR(256);
    v_email VARCHAR(256);
    v_website VARCHAR(256);
    v_id_currency INTEGER;
    v_active BOOLEAN;
    v_id_error_type_bad_data INTEGER;
    v_id_error_type_no_permission INTEGER;
	v_guid_permission UUID;
    v_id_permission_supplier INTEGER;
    -- v_id_access_level_EDIT INTEGER;
    v_has_permission BOOLEAN;
    v_id_change_set INTEGER;
    v_is_new_supplier BOOLEAN;
	-- result_errors REFCURSOR;
BEGIN
	-- SET SESSION sql_mode = sys.list_drop(@@session.sql_mode, 'ONLY_FULL_GROUP_BY');
    
	v_guid := COALESCE(a_guid, gen_random_uuid());
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_comment := TRIM(COALESCE(a_comment, ''));
	v_id_supplier := COALESCE(a_id_supplier, -1);
	v_name_company := TRIM(COALESCE(a_name_company, ''));
	v_name_contact := TRIM(COALESCE(a_name_contact, ''));
	v_department_contact := TRIM(COALESCE(a_department_contact, ''));
	v_id_address := a_id_address;
	v_phone_number := TRIM(COALESCE(a_phone_number, ''));
	v_fax := TRIM(COALESCE(a_fax, ''));
	v_email := TRIM(COALESCE(a_email, ''));
	v_website := TRIM(COALESCE(a_website, ''));
	v_id_currency := a_id_currency;
	v_active := COALESCE(a_active, FALSE); 
    
    v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA');
	v_guid_permission = gen_random_uuid();
	v_id_user = CURRENT_USER;
	v_id_permission_supplier = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_SUPPLIER' LIMIT 1);
	-- v_id_access_level_EDIT = (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT');
	v_is_new_supplier := CASE WHEN v_id_supplier <= 0 THEN TRUE ELSE FALSE END;
    
    
    -- Temporary tables
    /*
    CREATE TABLE tmp_Shop_Supplier (
		id_supplier INTEGER NOT NULL,
		name_company VARCHAR(255) NOT NULL,
		name_contact VARCHAR(255) NULL,
		department_contact VARCHAR(255) NULL,
		id_address INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Supplier_id_address
			FOREIGN KEY (id_address)
			REFERENCES Shop_Address(id_address),
		phone_number VARCHAR(50) NULL,
		fax VARCHAR(50) NULL,
		email VARCHAR(255) NOT NULL,
		website VARCHAR(255) NULL,
		id_currency INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Supplier_id_currency
			FOREIGN KEY (id_currency)
			REFERENCES Shop_Currency(id_currency),
		active BOOLEAN NOT NULL,
        can_view BOOLEAN NOT NULL, 
        can_edit BOOLEAN NOT NULL, 
        can_admin BOOLEAN NOT NULL
    );
    */
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		id_type INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Argument validation
	IF v_name_company = '' THEN
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(v_guid, v_id_error_type_bad_data, 'Supplier company name must be provided')
        ;
		*/
		RAISE EXCEPTION 'Supplier company name must be provided'
		USING ERRCODE = '22000'
		;
    END IF;

	IF v_id_address IS NULL THEN
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(v_guid, v_id_error_type_bad_data, 'Address ID must be provided')
        ;
		*/
		RAISE EXCEPTION 'Address ID must be provided'
		USING ERRCODE = '22000'
		;
    END IF;

	IF v_email = '' THEN
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(v_guid, v_id_error_type_bad_data, 'Email must be provided')
        ;
		*/
		RAISE EXCEPTION 'Email must be provided.'
		USING ERRCODE = '22000'
		;
    END IF;

	IF v_comment = '' THEN
		RAISE EXCEPTION 'A comment must be provided.'
		USING ERRCODE = '22000'
		;
	END IF;
    
    		
	IF (v_is_new_supplier = FALSE AND NOT EXISTS (SELECT * FROM Shop_Supplier S WHERE S.id_supplier = v_id_supplier)) THEN
		RAISE EXCEPTION 'Invalid supplier ID: %', v_id_supplier
		USING ERRCODE = '22000'
		;
	END IF;
    
    /*
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		INSERT INTO tmp_Shop_Supplier (
			id_supplier, name_company, name_contact, department_contact, id_address, phone_number, fax, email, website, id_currency, active
		)
		VALUES 
			(v_id_supplier, v_name_company, v_name_contact, v_department_contact, v_id_address, v_phone_number, v_fax, v_email, v_website, v_id_currency, v_active)
		/*
		FROM Shop_Supplier S
		WHERE (NOT v_has_filter_category OR C.id_category LIKE '%' || v_ids_category || '%')
			AND (v_get_inactive_categories OR C.active)
		*/
        ;
    END IF;
    */
    
    -- Permissions
	CALL p_shop_calc_user(v_guid_permission, v_id_user, v_id_permission_supplier, '');
	
	/*
	UPDATE tmp_Shop_Supplier t_S
	INNER JOIN Shop_Calc_User_Temp TP
		ON TP.GUID = v_guid_permission
	SET tP.can_view = TP.can_view,
		tP.can_edit = TP.can_edit,
		tP.can_admin = TP.can_admin;
	*/
	v_has_permission := (SELECT can_edit FROM Shop_Calc_User_Temp WHERE GUID = v_guid_permission);
	
	IF v_has_permission = FALSE THEN
		v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
		SELECT
			v_guid, 
			v_id_error_type_no_permission, 
			'You do not have %' || name || ' permissions.'
		FROM Shop_Permission
		WHERE id_permission = v_id_permission_supplier
		;
		*/
		RAISE EXCEPTION 'No permission: %', (
			SELECT name_error
			FROM Shop_Calc_User_Temp
			WHERE GUID = v_guid_permission
		)
		USING ERRCODE = '42501'
		;
	END IF;
	
	-- CALL p_shop_calc_user_clear_temp(v_guid_permission);
	
	DELETE FROM Shop_Calc_User_Temp
	WHERE GUID = v_guid;
    
    
	-- Transaction
	INSERT INTO Shop_Sales_And_Purchasing_Change_Set (
		comment,
		updated_last_by,
		updated_last_on
	)
	VALUES (
		'Save '
		|| CASE WHEN v_is_new_supplier = TRUE THEN 'new ' ELSE '' END
		|| 'Supplier - '
		|| v_comment,
		v_id_user,
		CURRENT_TIMESTAMP
	);
	
	v_id_change_set := (SELECT id_change_set FROM Shop_Sales_And_Purchasing_Change_Set ORDER BY id_change_set DESC LIMIT 1);
	
	START TRANSACTION;
		IF (v_is_new_supplier = TRUE) THEN
			INSERT INTO Shop_Supplier (
				-- id_supplier, 
				name_company, name_contact, department_contact, id_address, phone_number, fax, email, website, id_currency, active, id_change_set
			)
			VALUES 
				(
					-- v_id_supplier, 
					v_name_company, v_name_contact, v_department_contact, v_id_address, v_phone_number, v_fax, v_email, v_website, v_id_currency, v_active, v_id_change_set
				)
			/*
			FROM Shop_Supplier S
			WHERE (NOT v_has_filter_category OR C.id_category LIKE '%' || v_ids_category || '%')
				AND (v_get_inactive_categories OR C.active)
			*/
			;
		ELSE 
			UPDATE Shop_Supplier S
			-- INNER JOIN tmp_Shop_Supplier t_S ON S.id_supplier = t_S.id_supplier
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
				S.name_company = v_name_company,
				S.name_contact = v_name_contact,
				S.department_contact = v_department_contact,
				S.id_address = v_id_address,
				S.phone_number = v_phone_number,
				S.fax = v_fax,
				S.email = v_email,
				S.website = v_website,
				S.id_currency = v_id_currency,
				S.active = v_active,
				S.id_change_set = v_id_change_set
			;
		END IF;
	COMMIT;
    
    -- Returns
    -- v_now = CURRENT_TIMESTAMP;
    
    -- Errors
	/*
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
	*/

    DROP TABLE tmp_Shop_Supplier;
    -- DROP TABLE tmp_Msg_Error;
END;
$$ LANGUAGE plpgsql;


