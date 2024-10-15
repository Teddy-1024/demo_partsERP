

DROP PROCEDURE IF EXISTS p_shop_get_many_supplier;

DELIMITER //
CREATE PROCEDURE p_shop_get_many_supplier (
	IN a_id_user INT
    , IN a_get_all_supplier BIT
	, IN a_get_inactive_supplier BIT
	, IN a_ids_supplier TEXT
    , IN a_debug BIT
)
BEGIN
    DECLARE v_code_type_error_bad_data VARCHAR(50);
	DECLARE v_code_type_error_no_permission VARCHAR(50);
    DECLARE v_guid BINARY(36);
    DECLARE v_has_filter_supplier BIT;
    DECLARE v_id_access_level_view INT;
    DECLARE v_id_permission_supplier INT;
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_type_error_no_permission INT;
    DECLARE v_time_start TIMESTAMP(6);
    
	SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_code_type_error_bad_data := (SELECT code FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_code_type_error_no_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
    SET v_id_type_error_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_no_permission);
	SET v_id_permission_supplier := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_SUPPLIER' LIMIT 1);
    
	SET a_get_all_supplier := IFNULL(a_get_all_supplier, 0);
	SET a_get_inactive_supplier := IFNULL(a_get_inactive_supplier, 0);
	SET a_ids_supplier := TRIM(IFNULL(a_ids_supplier, ''));
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Supplier;
    
    CREATE TEMPORARY TABLE tmp_Supplier (
		id_supplier INT NOT NULL
    );
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		id_type INT NOT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Split (
		substring VARCHAR(4000) NOT NULL
        , as_int INT NULL
	);
    DELETE FROM tmp_Split;
    
    
    -- Parse filters
    SET v_has_filter_supplier = CASE WHEN a_ids_supplier = '' THEN 0 ELSE 1 END;

	IF a_debug = 1 THEN
		SELECT 
			v_has_filter_supplier
		;
    END IF;

    -- Suppliers
    IF v_has_filter_supplier = 1 THEN
		CALL partsltd_prod.p_split(a_guid, a_ids_supplier, ',', a_debug);
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = a_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( a_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Supplier S ON t_S.as_int = S.id_supplier
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(S.id_supplier)
				OR (
					S.active = 0
					AND v_get_inactive_supplier = 0
				)
		) THEN
			INSERT INTO tmp_Msg_Error (
				id_type,
				code,
				msg
			)
			SELECT
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive Supplier IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Supplier S ON t_S.as_int = S.id_supplier
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(S.id_supplier)
				OR (
					S.active = 0
					AND v_get_inactive_supplier = 0
				)
			;
		ELSE
			INSERT INTO tmp_Supplier (
				id_supplier
			)
			SELECT 
				S.id_supplier
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_Supplier S ON t_S.as_int = S.id_supplier
			WHERE (
					a_get_all_supplier = 1
					OR (
						v_has_filter_supplier = 1
						AND NOT ISNULL(t_S.as_int)
					)
				)
				AND (
					a_get_inactive_supplier = 1
					OR S.active = 1
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;

    -- Permissions	
	IF a_debug = 1 THEN
		SELECT 
			v_guid
			, a_id_user
			, FALSE -- get inactive users
			, v_id_permission_supplier
			, v_id_access_level_view
			, '' -- ids_product
			, 0 -- a_debug
		;
		SELECT * from Shop_Calc_User_Temp;
	END IF;
	
	CALL p_shop_calc_user(
		v_guid
		, a_id_user
		, FALSE -- get inactive users
		, v_id_permission_supplier
		, v_id_access_level_view
		, '' -- ids_product
		, 0 -- a_debug
	);
	
	IF a_debug = 1 THEN
		SELECT * from Shop_Calc_User_Temp;
	END IF;
	
	IF NOT EXISTS (SELECT can_view FROM Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
		DELETE FROM tmp_Msg_Error;

		INSERT INTO tmp_Msg_Error (
			, id_type
			, code
			, msg
		)
		VALUES (
			v_id_type_error_no_permission
			, v_code_type_error_no_permission
			CONCAT('You do not have view permissions for ', (SELECT name FROM Shop_Permission WHERE id_permission = v_id_permission_supplier LIMIT 1))
		)
		;
	END IF;
    
	IF EXISTS ( SELECT * FROM tmp_Msg_Error LIMIT 1 ) THEN
		DELETE FROM tmp_Supplier;
	END IF;
    
    -- Returns    
    # Suppliers
    SELECT 
		t_S.id_supplier,
		S.id_address,
		S.id_currency,
        S.name_company,
		S.name_contact,
		S.department_contact,
		S.phone_number,
		S.fax,
		S.email,
		S.website,
		S.active
    FROM tmp_Supplier t_S
    INNER JOIN Shop_Supplier S
		ON t_S.id_supplier = S.id_supplier
	;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
    INNER JOIN Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
    ;
    
    IF a_debug = 1 THEN
		SELECT * from tmp_Supplier;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tmp_Supplier;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
	
    IF a_debug = 1 THEN
		CALL p_debug_timing_reporting( v_time_start );
    END IF;
END //
DELIMITER ;;



CALL p_shop_get_many_supplier (
	1 -- 'auth0|6582b95c895d09a70ba10fef' # a_id_user
    , 1 # a_get_all_supplier
	, 0 # a_get_inactive_supplier
	, '' # a_ids_supplier
    , 0 # a_debug
);

/*
*/