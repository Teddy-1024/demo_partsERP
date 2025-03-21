



-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_supplier;


DELIMITER //
CREATE PROCEDURE p_shop_save_supplier (
	IN a_comment VARCHAR(500)
	, IN a_guid BINARY(36)
    , IN a_id_user INT
    , IN a_debug BIT
)
BEGIN
	DECLARE v_code_type_error_bad_data VARCHAR(50);
	DECLARE v_code_type_error_no_permission VARCHAR(50);
    DECLARE v_id_access_level_edit INT;
    DECLARE v_id_change_set INT;
    DECLARE v_id_permission_supplier INT;
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_type_error_no_permission INT;
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
			id_type
            , @errno
            , @text
		FROM demo.Shop_Msg_Error_Type MET
        WHERE code = 'MYSQL_ERROR'
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
	SET v_id_permission_supplier := (SELECT id_permission FROM demo.Shop_Permission WHERE code = 'STORE_SUPPLIER' LIMIT 1);
	SET v_id_access_level_EDIT := (SELECT id_access_level FROM demo.Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
	CALL p_validate_guid ( a_guid );
	SET a_comment := TRIM(IFNULL(a_comment, ''));
    
	DROP TEMPORARY TABLE IF EXISTS tmp_Supplier;
	DROP TEMPORARY TABLE IF EXISTS tmp_Supplier_Address;
	DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;

    CREATE TEMPORARY TABLE tmp_Supplier (
		id_supplier_temp INT NOT NULL
		, id_supplier INT NULL
		, id_currency INT NOT NULL
		, name_company VARCHAR(255) NOT NULL
		, name_contact VARCHAR(255) NULL
		, department_contact VARCHAR(255) NULL
		, phone_number VARCHAR(50) NULL
		, fax VARCHAR(50) NULL
		, email VARCHAR(255) NOT NULL
		, website VARCHAR(255) NULL
		, active BIT NOT NULL
		, name_error VARCHAR(1000) NOT NULL
		, is_new BIT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Supplier_Address (
		id_address INT NOT NULL
        , id_supplier INT NOT NULL
        , id_region INT NOT NULL
        , postcode VARCHAR(20) NOT NULL
        , address_line_1 VARCHAR(256) NOT NULL
        , address_line_2 VARCHAR(256) NOT NULL
        , city VARCHAR(256) NOT NULL
		, county VARCHAR(256) NOT NULL
        , active BIT NOT NULL
		, name_error VARCHAR(1000) NOT NULL
		, is_new BIT NOT NULL
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
		, id_type INT NOT NULL
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
    
    
	INSERT INTO tmp_Supplier (
		id_supplier_temp
        , id_supplier
		, id_currency
		, name_company
		, name_contact
		, department_contact
		, phone_number
		, fax
		, email
		, website
		, active
		, name_error
		, is_new
	)
	SELECT
		S_T.id_supplier
		, S_T.id_supplier
		, S_T.id_currency
		, S_T.name_company
		, S_T.name_contact
		, S_T.department_contact
		, S_T.phone_number
		, S_T.fax
		, S_T.email
		, S_T.website
		, S_T.active
		, IFNULL(S_T.name_company, IFNULL(S_T.email, IFNULL(S_T.website, IFNULL(S_T.name_contact, '(No Supplier)'))))
		, IFNULL(S_T.id_supplier, 0) < 1
	FROM demo.Shop_Supplier_Temp S_T
	WHERE GUID = a_guid
	;
    
	INSERT INTO tmp_Supplier_Address (
		id_address
		, id_supplier
        , id_region
        , postcode
        , address_line_1
        , address_line_2
        , city
        , county
		, active
		, name_error
		, is_new
	)
	SELECT
		SA_T.id_address
		, SA_T.id_supplier
        , SA_T.id_region
        , SA_T.postcode
        , SA_T.address_line_1
        , SA_T.address_line_2
        , SA_T.city
        , SA_T.county
		, SA_T.active
		, IFNULL(SA_T.postcode, IFNULL(SA_T.city, IFNULL(SA_T.county, IFNULL(SA_T.address_line_1, IFNULL(SA_T.address_line_2, '(No Supplier)'))))) AS name_error
		, IFNULL(SA_T.id_address, 0) < 1 AS is_new
	FROM demo.Shop_Supplier_Address_Temp SA_T
	WHERE GUID = a_guid
	;
    
    -- Validation
    -- Suppliers
    /*
    # id_address
    IF EXISTS (
		SELECT * 
        FROM tmp_Supplier t_S 
        LEFT JOIN demo.Shop_Address A ON t_S.id_address = A.id_address 
        WHERE 1=1
			AND (
				t_S.id_address = 0
                OR A.active = 0
			)
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
				'The following supplier(s) have an invalid or inactive Address: '
				, GROUP_CONCAT(t_S.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier t_S
        LEFT JOIN demo.Shop_Address A ON t_S.id_address = A.id_address
        WHERE 1=1
			AND (
				t_S.id_address = 0
                OR A.active = 0
			)
		;
    END IF;
    */
    # id_currency
    IF EXISTS (
		SELECT * 
        FROM tmp_Supplier t_S
        LEFT JOIN demo.Shop_Currency C ON t_S.id_currency = C.id_currency 
        WHERE 1=1
			AND (
				t_S.id_currency = 0
                OR C.active = 0
			)
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
				'The following supplier(s) have an invalid or inactive Currency: '
				, GROUP_CONCAT(t_S.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier t_S
        LEFT JOIN demo.Shop_Currency C ON t_S.id_currency = C.id_currency 
        WHERE 1=1
			AND (
				t_S.id_currency = 0
                OR C.active = 0
			)
		;
    END IF;
 	# name_company
    IF EXISTS (SELECT * FROM tmp_Supplier t_S WHERE ISNULL(t_S.name_company) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following supplier(s) do not have a name: ', GROUP_CONCAT(IFNULL(t_S.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Supplier t_S
		WHERE ISNULL(t_S.name_company)
		;
    END IF;
 	# email
    IF EXISTS (SELECT * FROM tmp_Supplier t_S WHERE ISNULL(t_S.email) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following supplier(s) do not have an email: ', GROUP_CONCAT(IFNULL(t_S.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Supplier t_S
		WHERE ISNULL(t_S.email)
		;
    END IF;
    # duplicate
    IF EXISTS (SELECT COUNT(*) FROM tmp_Supplier t_S GROUP BY t_S.id_supplier HAVING COUNT(*) > 1) THEN 
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following supplier(s) are duplicates: ', GROUP_CONCAT(IFNULL(t_S.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Supplier t_S
        GROUP BY t_S.id_supplier
        HAVING COUNT(*) > 1
		;
    END IF;
    
    -- Addresses
    # id_supplier
    IF EXISTS (
		SELECT * 
        FROM tmp_Supplier_Address t_SA
        LEFT JOIN demo.Shop_Supplier S ON t_SA.id_supplier = S.id_supplier
        WHERE 1=1
			AND (
				t_SA.id_supplier = 0
                OR S.active = 0
			)
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
				'The following supplier address(es) have an invalid or inactive Supplier: '
				, GROUP_CONCAT(t_S.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier t_S
        LEFT JOIN demo.Shop_Supplier S ON t_SA.id_supplier = S.id_supplier
        WHERE 1=1
			AND (
				t_SA.id_supplier = 0
                OR S.active = 0
			)
		;
    END IF;
    # id_region
    IF EXISTS (
		SELECT * 
        FROM tmp_Supplier_Address t_SA
        LEFT JOIN demo.Shop_Region R ON t_SA.id_region = R.id_region
        WHERE 1=1
			AND (
				t_SA.id_region = 0
                OR R.active = 0
			)
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
				'The following supplier address(es) have an invalid or inactive Supplier: '
				, GROUP_CONCAT(t_S.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier t_S
        LEFT JOIN demo.Shop_Region R ON t_SA.id_region = R.id_region
        WHERE 1=1
			AND (
				t_SA.id_region = 0
                OR R.active = 0
			)
		;
    END IF;
    # duplicate
    IF EXISTS (SELECT COUNT(*) FROM tmp_Supplier_Address t_SA GROUP BY t_SA.id_address HAVING COUNT(*) > 1) THEN 
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following supplier address(es) are duplicates: ', GROUP_CONCAT(IFNULL(t_S.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Supplier_Address t_SA
        GROUP BY t_SA.id_address
        HAVING COUNT(*) > 1
		;
    END IF;

    -- Permissions
	IF a_debug = 1 THEN
		SELECT 
			a_guid
			, a_id_user
			, FALSE -- get inactive users
			, v_id_permission_supplier
			, v_id_access_level_edit
			, '' -- ids_product
			, 0 -- a_debug
		;
		SELECT * from demo.Shop_Calc_User_Temp;
	END IF;
	
	CALL p_shop_calc_user(
		a_guid
		, a_id_user
		, FALSE -- get inactive users
		, v_id_permission_supplier
		, v_id_access_level_edit
		, '' -- ids_product
		, 0 -- a_debug
	);
	
	IF a_debug = 1 THEN
		SELECT * from demo.Shop_Calc_User_Temp WHERE GUID = a_guid;
	END IF;
	
	IF NOT EXISTS (SELECT can_view FROM demo.Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = a_guid) THEN
		DELETE FROM tmp_Msg_Error;

		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		VALUES (
			v_id_type_error_no_permission
			, v_code_type_error_no_permission
			, CONCAT('You do not have view permissions for ', (SELECT name FROM demo.Shop_Permission WHERE id_permission = v_id_permission_supplier LIMIT 1))
		)
		;
	END IF;

	CALL demo.p_shop_clear_calc_user( 
		a_guid
        , 0 -- a_debug
	);
    
	IF EXISTS ( SELECT * FROM tmp_Msg_Error LIMIT 1 ) THEN
		DELETE FROM tmp_Supplier;
	END IF;
    
    
	-- Transaction    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN		
		START TRANSACTION;
			INSERT INTO demo.Shop_User_Change_Set (
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
			
			INSERT INTO demo.Shop_Supplier (
				id_supplier_temp
				, id_currency
				, name_company
				, name_contact
				, department_contact
				, phone_number
				, fax
				, email
				, website
				, active
				, id_change_set
			)
			SELECT
				t_S.id_supplier
				, t_S.id_currency
				, t_S.name_company
				, t_S.name_contact
				, t_S.department_contact
				, t_S.phone_number
				, t_S.fax
				, t_S.email
				, t_S.website
				, t_S.active
				, v_id_change_set
			FROM tmp_Supplier t_S
			WHERE t_S.is_new = 1
			;
			
			UPDATE tmp_Supplier t_S
			INNER JOIN demo.Shop_Supplier S ON t_S.id_supplier_temp = S.id_supplier_temp
			SET 
				t_S.id_supplier = S.id_supplier
			WHERE t_S.is_new = 1
			;
            
			UPDATE tmp_Supplier_Address t_SA
			INNER JOIN tmp_Supplier t_S ON t_SA.id_supplier = t_S.id_supplier_temp
			SET 
				t_SA.id_supplier = t_S.id_supplier
			WHERE t_S.is_new = 1
			;
            
			UPDATE demo.Shop_Supplier S
			INNER JOIN tmp_Supplier t_S 
				ON S.id_supplier = t_S.id_supplier
				AND t_S.is_new = 0
			SET 
				S.id_currency = t_S.id_currency
				, S.name_company = t_S.name_company
				, S.name_contact = t_S.name_contact
				, S.department_contact = t_S.department_contact
				, S.phone_number = t_S.phone_number
				, S.fax = t_S.fax
				, S.email = t_S.email
				, S.website = t_S.website
				, S.active = t_S.active
				, S.id_change_set = v_id_change_set
				/*
				S.name_company = a_name_company,
				S.name_contact = a_name_contact,
				S.department_contact = a_department_contact,
				S.id_address = a_id_address,
				S.phone_number = a_phone_number,
				S.fax = a_fax,
				S.email = a_email,
				S.website = a_website,
				S.id_currency = a_id_currency,
				S.active = a_active,
				S.id_change_set = v_id_change_set
				*/
			;
            
            INSERT INTO demo.Shop_Supplier_Address (
				id_supplier
                , id_region
                , postcode
                , address_line_1
				, address_line_2
                , city
                , county
                , active
				, id_change_set
            )
            SELECT 
				t_SA.id_supplier
                , t_SA.id_region
                , t_SA.postcode
                , t_SA.address_line_1
				, t_SA.address_line_2
                , t_SA.city
                , t_SA.county
                , t_SA.active
				, v_id_change_set
			FROM tmp_Supplier_Address t_SA
            WHERE t_SA.is_new = 1
            ;
            
            UPDATE demo.Shop_Supplier_Address SA
			INNER JOIN tmp_Supplier_Address t_SA 
				ON SA.id_address = t_SA.id_address
                AND t_SA.is_new = 0
            SET
				SA.id_supplier = t_SA.id_supplier
                , SA.id_region = t_SA.id_region
                , SA.postcode = t_SA.postcode
                , SA.address_line_1 = t_SA.address_line_1
				, SA.address_line_2 = t_SA.address_line_2
                , SA.city = t_SA.city
                , SA.county = t_SA.county
                , SA.active = t_SA.active
				, SA.id_change_set = v_id_change_set
            ;
		COMMIT;
    END IF;
    
    START TRANSACTION;
		DELETE FROM demo.Shop_Supplier_Temp
        WHERE GUID = a_guid;
		DELETE FROM demo.Shop_Supplier_Address_Temp
        WHERE GUID = a_guid;
    COMMIT;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
	INNER JOIN demo.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
	;
    
	IF a_debug = 1 THEN
		SELECT 'A_DEBUG';
		SELECT * from tmp_Supplier;
        SELECT * from tmp_Supplier_Address;
	END IF;

    DROP TEMPORARY TABLE IF EXISTS tmp_Supplier;
	DROP TEMPORARY TABLE IF EXISTS tmp_Supplier_Address;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    
	IF a_debug = 1 THEN
		CALL demo.p_debug_timing_reporting ( v_time_start );
	END IF;
END //
DELIMITER ;


-- SELECT * FROM Shop_Supplier;
/*
delete from shop_supplier_audit where id_supplier = 9;
delete from shop_supplier where id_supplier = 9;
delete from shop_supplier_address_audit where id_address = -4;
delete from shop_supplier_address where id_address = -4;
*/