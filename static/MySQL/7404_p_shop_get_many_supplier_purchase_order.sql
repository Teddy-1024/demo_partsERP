

DROP PROCEDURE IF EXISTS p_shop_get_many_supplier_purchase_order;

DELIMITER //
CREATE PROCEDURE p_shop_get_many_supplier_purchase_order (
	IN a_id_user INT,
    IN a_get_all_supplier BIT,
	IN a_get_inactive_supplier BIT,
	IN a_ids_supplier TEXT,
    IN a_get_all_order BIT,
	IN a_get_inactive_order BIT,
	IN a_ids_order TEXT,
	IN a_ids_permutation TEXT,
    IN a_date_from DATETIME,
    IN a_date_to DATETIME,
	IN a_debug BIT
)
BEGIN
    DECLARE v_code_type_error_bad_data VARCHAR(50);
	DECLARE v_code_type_error_no_permission VARCHAR(50);
    DECLARE v_guid BINARY(36);
    DECLARE v_has_filter_supplier BIT;
    DECLARE v_has_filter_order BIT;
    DECLARE v_has_filter_permutation BIT;
    DECLARE v_has_filter_date_from BIT;
    DECLARE v_has_filter_date_to BIT;
    DECLARE v_id_access_level_view INT;
    DECLARE v_ids_permission_supplier_purchase_order VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_type_error_no_permission INT;
    DECLARE v_time_start TIMESTAMP(6);
    
	SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM demo.Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_code_type_error_bad_data := (SELECT code FROM demo.Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_bad_data := (SELECT id_type FROM demo.Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_code_type_error_no_permission := (SELECT code FROM demo.Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION' LIMIT 1);
    SET v_id_type_error_no_permission := (SELECT id_type FROM demo.Shop_Msg_Error_Type WHERE code = v_code_type_error_no_permission LIMIT 1);
    SET v_ids_permission_supplier_purchase_order := (SELECT GROUP_CONCAT(id_permission SEPARATOR ',') FROM demo.Shop_Permission WHERE code IN ('STORE_SUPPLIER', 'STORE_SUPPLIER_PURCHASE_ORDER', 'STORE_PRODUCT'));
	
	SET a_get_all_supplier := IFNULL(a_get_all_supplier, 1);
	SET a_get_inactive_supplier := IFNULL(a_get_inactive_supplier, 0);
	SET a_ids_supplier := TRIM(IFNULL(a_ids_supplier, ''));
	SET a_get_all_order := IFNULL(a_get_all_order, 1);
	SET a_get_inactive_order := IFNULL(a_get_inactive_order, 0);
	SET a_ids_order := TRIM(IFNULL(a_ids_order, ''));
	SET a_ids_permutation := TRIM(IFNULL(a_ids_permutation, ''));
	SET a_date_from := IFNULL(a_date_from, NULL);
	SET a_date_to := IFNULL(a_date_to, NULL);
	SET a_debug := IFNULL(a_debug, 0);
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Supplier_Purchase_Order_Product_Link;
    DROP TEMPORARY TABLE IF EXISTS tmp_Supplier_Purchase_Order;
    DROP TEMPORARY TABLE IF EXISTS tmp_Supplier;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    DROP TEMPORARY TABLE IF EXISTS tmp_Split;
    
    CREATE TEMPORARY TABLE tmp_Supplier (
		id_supplier INT NOT NULL PRIMARY KEY
    );
    
    CREATE TEMPORARY TABLE tmp_Supplier_Purchase_Order (
		id_order INT NOT NULL PRIMARY KEY
    );
    
    CREATE TEMPORARY TABLE tmp_Permutation (
		id_permutation INT NOT NULL PRIMARY KEY
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
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
    
    SET v_has_filter_supplier = CASE WHEN a_ids_supplier = '' THEN 0 ELSE 1 END;
    SET v_has_filter_order = CASE WHEN a_ids_order = '' THEN 0 ELSE 1 END;
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_date_from = CASE WHEN ISNULL(a_date_from) THEN 0 ELSE 1 END;
    SET v_has_filter_date_to = CASE WHEN ISNULL(a_date_to) THEN 0 ELSE 1 END;

	IF a_debug = 1 THEN
		SELECT
			v_has_filter_supplier,
			v_has_filter_order,
			v_has_filter_permutation,
			v_has_filter_date_from,
			v_has_filter_date_to
		;
	END IF;
    
    -- Permutations
    IF v_has_filter_permutation = 1 THEN
		CALL demo.p_split(v_guid, a_ids_permutation, ',', a_debug);
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM demo.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL demo.p_clear_split_temp( v_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN demo.Shop_Product_Permutation PP ON t_S.as_int = PP.id_permutation
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(PP.id_permutation)
				OR PP.active = 0
		) THEN
			INSERT INTO tmp_Msg_Error (
				id_type,
				code,
				msg
			)
			SELECT
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive permutation IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN demo.Shop_Product_Permutation PP ON t_S.as_int = PP.id_permutation
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(PP.id_permutation)
				OR PP.active = 0
			;
		ELSE
			INSERT INTO tmp_Permutation (
				id_permutation
			)
			SELECT 
				PP.id_permutation
			FROM tmp_Split t_S
			RIGHT JOIN demo.Shop_Product_Permutation PP ON t_S.as_int = PP.id_permutation
			WHERE (
					v_has_filter_permutation = 0
					OR NOT ISNULL(t_S.as_int)
				)
			;
		END IF;
	END IF;

	DELETE FROM tmp_Split;
    
    -- Suppliers
    IF v_has_filter_supplier = 1 THEN
		CALL demo.p_split(v_guid, a_ids_supplier, ',', a_debug);
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM demo.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL demo.p_clear_split_temp( v_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN demo.Shop_Supplier S ON t_S.as_int = S.id_supplier
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(S.id_supplier)
				OR (
					S.active = 0
					AND a_get_inactive_supplier = 0
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
			LEFT JOIN demo.Shop_Supplier S ON t_S.as_int = S.id_supplier
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(S.id_supplier)
				OR (
					S.active = 0
					AND a_get_inactive_supplier = 0
				)
			;
		ELSE
			INSERT INTO tmp_Supplier (
				id_supplier
			)
			SELECT 
				S.id_supplier
			FROM tmp_Split t_S
			RIGHT JOIN demo.Shop_Supplier S ON t_S.as_int = S.id_supplier
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
    
    -- Supplier Purchase Orders
    IF v_has_filter_order = 1 THEN
		CALL demo.p_split(v_guid, a_ids_order, ',', a_debug);
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM demo.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL demo.p_clear_split_temp( v_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN demo.Shop_Supplier_Purchase_Order SPO ON t_S.as_int = SPO.id_order
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(SPO.id_order)
				OR (
					SPO.active = 0
					AND a_get_inactive_order = 0
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
				CONCAT('Invalid or inactive Supplier Purchase Order IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN demo.Shop_Supplier_Purchase_Order SPO ON t_S.as_int = SPO.id_order
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(SPO.id_order)
				OR (
					SPO.active = 0
					AND a_get_inactive_order = 0
				)
			;
		ELSE
			INSERT INTO tmp_Supplier_Purchase_Order (
				id_order
			)
			SELECT 
				SPO.id_order
			FROM tmp_Split t_S
			RIGHT JOIN demo.Shop_Supplier_Purchase_Order SPO ON t_S.as_int = SPO.id_order
			INNER JOIN tmp_Supplier t_SUPP ON SPO.id_supplier_ordered = t_SUPP.id_supplier
			INNER JOIN demo.Shop_Supplier_Purchase_Order_Product_Link SPOPL ON SPO.id_order = SPOPL.id_order
			INNER JOIN tmp_Permutation t_PP ON SPOPL.id_permutation = t_PP.id_permutation
			WHERE (
					a_get_all_order = 1
					OR (
						v_has_filter_order = 1
						AND NOT ISNULL(t_S.as_int)
					)
					OR (
						v_has_filter_supplier = 1
						AND NOT ISNULL(t_SUPP.id_supplier)
					)
					OR (
						v_has_filter_permutation = 1
						AND NOT ISNULL(t_PP.id_permutation)
					)
				)
				AND (
					a_get_inactive_order = 1
					OR SPO.active = 1
				)
				AND (
					v_has_filter_date_from = 0
					OR SPO.created_on > a_date_from
				)
				AND (
					v_has_filter_date_to = 0
					OR SPO.created_on < a_date_to
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
			, v_ids_permission_supplier_purchase_order
			, v_id_access_level_view
			, '' -- ids_product
			, 0 -- a_debug
		;
		SELECT * from demo.Shop_Calc_User_Temp;
	END IF;
	
	CALL p_shop_calc_user(
		v_guid
		, a_id_user
		, FALSE -- get inactive users
		, v_ids_permission_supplier_purchase_order
		, v_id_access_level_view
		, '' -- ids_product
		, 0 -- a_debug
	);
	
	IF a_debug = 1 THEN
		SELECT * from demo.Shop_Calc_User_Temp;
	END IF;
	
	IF NOT EXISTS (SELECT can_view FROM demo.Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
		DELETE FROM tmp_Msg_Error;

		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		VALUES (
			v_id_type_error_no_permission
			, v_code_type_error_no_permission
			, CONCAT('You do not have view permissions for ', (SELECT name FROM demo.Shop_Permission WHERE id_permission = v_ids_permission_supplier_purchase_order LIMIT 1))
		)
		;
	END IF;
    
	IF EXISTS ( SELECT * FROM tmp_Msg_Error LIMIT 1 ) THEN
		DELETE FROM tmp_Permutation;
		DELETE FROM tmp_Supplier_Purchase_Order;
	END IF;
	
    -- Returns
	/*
    # Suppliers
    SELECT 
		t_S.id_supplier,
        S.name_company,
		S.name_contact,
		S.department_contact,
		S.id_address,
		S.phone_number,
		S.fax,
		S.email,
		S.website,
		S.id_currency,
		t_S.active
    FROM tmp_Supplier t_S
    INNER JOIN demo.Shop_Supplier S
		ON t_S.id_supplier = S.id_supplier
	;
    */

    # Supplier Purchase Order
    SELECT 
		t_SPO.id_order
		, SPO.id_supplier_ordered
        , S.name_company
		, SPO.id_currency_cost
        , C.symbol
        , C.code
		, SPO.cost_total_local_VAT_excl
		, SPO.cost_total_local_VAT_incl
        , SPO.active
        , SPO.created_on
        , CONCAT(
			SPO.cost_total_local_VAT_excl
            , ' on '
            , SPO.created_on
		) AS name
    FROM tmp_Supplier_Purchase_Order t_SPO 
	INNER JOIN demo.Shop_Supplier_Purchase_Order SPO ON SPO.id_order = t_SPO.id_order
    LEFT JOIN demo.Shop_Supplier S ON SPO.id_supplier_ordered = S.id_supplier
    LEFT JOIN demo.Shop_Currency C ON SPO.id_currency_cost = C.id_currency
    ;
    
    # Supplier Purchase Order Product Link
    SELECT
		SPOPL.id_link
		, SPOPL.id_order
        , P.id_category
        , P.id_product
		, SPOPL.id_permutation
        , fn_shop_get_product_permutation_name(SPOPL.id_permutation) AS name_permutation
        , fn_shop_get_product_permutation_variations_csv(SPOPL.id_permutation) AS csv_id_pairs_variation
		-- , SPOPL.id_currency_cost
		, SPOPL.id_unit_quantity
		, SPOPL.quantity_ordered
		, SPOPL.quantity_received
		, SPOPL.latency_delivery_days
		, SPOPL.display_order
		, SPOPL.cost_total_local_VAT_excl
		, SPOPL.cost_total_local_VAT_incl
		, SPOPL.cost_unit_local_VAT_excl
		, SPOPL.cost_unit_local_VAT_incl
        , SPOPL.active
    FROM tmp_Supplier_Purchase_Order t_SPO
    INNER JOIN demo.Shop_Supplier_Purchase_Order_Product_Link SPOPL ON t_SPO.id_order = SPOPL.id_order
    LEFT JOIN demo.Shop_Product_Permutation PP ON SPOPL.id_permutation = PP.id_permutation
    LEFT JOIN demo.Shop_Product P ON PP.id_product = P.id_product
    ;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
    INNER JOIN demo.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
    ;
    
    IF a_debug = 1 THEN
		SELECT * from tmp_Supplier_Purchase_Order_Product_Link;
		SELECT * from tmp_Supplier_Purchase_Order;
		SELECT * from tmp_Supplier;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tmp_Supplier_Purchase_Order_Product_Link;
    DROP TEMPORARY TABLE IF EXISTS tmp_Supplier_Purchase_Order;
    DROP TEMPORARY TABLE IF EXISTS tmp_Supplier;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    DROP TEMPORARY TABLE IF EXISTS tmp_Split;
	
    IF a_debug = 1 THEN
		CALL p_debug_timing_reporting( v_time_start );
    END IF;
END //
DELIMITER ;


/*

CALL p_shop_get_many_supplier_purchase_order (
	1, # a_id_user
    1, # a_get_all_supplier
	0, # a_get_inactive_supplier
    '', # a_ids_supplier
	1, # a_get_all_order
	0, # a_get_inactive_order
    '', # a_ids_order
    '', # a_ids_permutation
    NULL, # a_date_from
	NULL # a_date_to
	, 0 # a_debug
);

*/
