



-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_supplier_purchase_order;

DROP TABLE IF EXISTS tmp_Supplier_Purchase_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Msg_Error;

DELIMITER //
CREATE PROCEDURE p_shop_save_supplier_purchase_order (
	IN a_comment VARCHAR(500)
	, IN a_guid BINARY(36)
    , IN a_id_user INT
    , IN a_debug BIT
)
BEGIN
	DECLARE v_code_type_error_bad_data VARCHAR(50);
	DECLARE v_code_type_error_no_permission VARCHAR(50);
	DECLARE v_code_type_error_warning VARCHAR(50);
    DECLARE v_id_access_level_edit INT;
    DECLARE v_id_change_set INT;
    DECLARE v_id_permission_supplier_purchase_order VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_type_error_no_permission INT;
    DECLARE v_id_type_error_warning INT;
	DECLARE v_ids_product_permission TEXT;
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
			MET.id_type
            , @errno
            , @text
		FROM partsltd_prod.Shop_Msg_Error_Type MET
        WHERE code = 'MYSQL_ERROR'
		;
        SELECT *
        FROM tmp_Msg_Error;
		DROP TABLE IF EXISTS tmp_Msg_Error;
    END;
    
	SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_code_type_error_bad_data := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_bad_data := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_code_type_error_no_permission := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION' LIMIT 1);
    SET v_id_type_error_no_permission := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_no_permission LIMIT 1);
    SET v_code_type_error_warning := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'WARNING' LIMIT 1);
    SET v_id_type_error_warning := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_warning LIMIT 1);
	SET v_id_permission_supplier_purchase_order := (SELECT GROUP_CONCAT(id_permission SEPARATOR ',') FROM partsltd_prod.Shop_Permission WHERE code IN ('STORE_SUPPLIER', 'STORE_SUPPLIER_PURCHASE_ORDER', 'STORE_PRODUCT'));
	SET v_id_access_level_edit := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
	CALL p_validate_guid ( a_guid );
	SET a_comment := TRIM(IFNULL(a_comment, ''));
    
	DROP TEMPORARY TABLE IF EXISTS tmp_Supplier_Purchase_Order;
	DROP TEMPORARY TABLE IF EXISTS tmp_Supplier_Purchase_Order_Product_Link;
	DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;

    -- Temporary tables
    CREATE TEMPORARY TABLE tmp_Supplier_Purchase_Order (
		id_order INT NOT NULL PRIMARY KEY
        , id_order_temp INT NOT NULL
		, id_supplier_ordered INT NOT NULL
		, id_currency_cost INT NOT NULL
		, cost_total_local_VAT_excl FLOAT NULL
		, cost_total_local_VAT_incl FLOAT NULL
        , active BIT NOT NULL
		, is_new BIT NOT NULL
		, name_error VARCHAR(1000) NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Supplier_Purchase_Order_Product_Link (
		id_link INT NOT NULL PRIMARY KEY
		, id_order INT NOT NULL
        , id_permutation INT NOT NULL
		-- , id_currency_cost INT NOT NULL
		, quantity_ordered FLOAT NOT NULL
		, id_unit_quantity INT NOT NULL
		, quantity_received FLOAT NULL
		, latency_delivery_days INT NOT NULL
		, display_order INT NOT NULL
        , active BIT NOT NULL
		, cost_total_local_VAT_excl FLOAT NOT NULL
		, cost_total_local_VAT_incl FLOAT NOT NULL
		, cost_unit_local_VAT_excl FLOAT NOT NULL
		, cost_unit_local_VAT_incl FLOAT NOT NULL
		, has_order BIT NULL
		, is_new BIT NOT NULL
		, name_error VARCHAR(1000) NULL
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
		, id_type INT NOT NULL
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
    
	INSERT INTO tmp_Supplier_Purchase_Order (
		id_order
        , id_order_temp
		, id_supplier_ordered
		, id_currency_cost
        , active
        , is_new
        , name_error
	)
	SELECT
		SPO_T.id_order
		, SPO_T.id_order
		, IFNULL(IFNULL(SPO_T.id_supplier_ordered, SPO.id_supplier_ordered), 0) AS id_supplier_ordered
		, IFNULL(IFNULL(SPO_T.id_currency_cost, SPO.id_currency_cost), 0) AS id_currency_cost
        , IFNULL(IFNULL(SPO_T.active, SPO.active), 1) AS active
        , ISNULL(SPO.id_order) AS is_new
        , CONCAT(
			IFNULL(S.name_company, '(No Supplier)')
            , ' - '
            , IFNULL(SPO.created_on, '(No creation date)')
            , ' - '
            , IFNULL(C.symbol, '(No Currency)')
            , ' '
            , IFNULL(IFNULL(SPO.cost_total_local_vat_excl, SPO.cost_total_local_vat_incl), '(No cost)')
		) AS name_error
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Temp SPO_T
	LEFT JOIN partsltd_prod.Shop_Supplier_Purchase_Order SPO ON SPO_T.id_order = SPO.id_order
    LEFT JOIN partsltd_prod.Shop_Supplier S ON SPO_T.id_supplier_ordered = S.id_supplier
    LEFT JOIN partsltd_prod.Shop_Currency C ON SPO_T.id_currency_cost = C.id_currency
	WHERE SPO_T.GUID = a_guid
	;

	INSERT INTO tmp_Supplier_Purchase_Order_Product_Link (
		id_link
		, id_order
		, id_permutation
		-- , id_currency_cost
		, id_unit_quantity
		, quantity_ordered
		, quantity_received
		, latency_delivery_days
		, display_order
		, cost_total_local_VAT_excl
		, cost_total_local_VAT_incl
		, cost_unit_local_VAT_excl
		, cost_unit_local_VAT_incl
        , active
		, has_order
		, is_new
	)
	SELECT 
		IFNULL(SPOPL_T.id_link, 0) AS id_link
		, IFNULL(IFNULL(SPOPL_T.id_order, SPOPL.id_order), 0) AS id_order
		, IFNULL(
			IFNULL(
				IFNULL(
					SPOPL_T.id_permutation
                    , CASE WHEN NOT ISNULL(SPOPL_T.id_product) AND NOT ISNULL(SPOPL_T.csv_list_variations) THEN
						partsltd_prod.fn_shop_get_id_product_permutation_from_variation_csv_list(SPOPL_T.id_product, SPOPL_T.csv_list_variations)
					ELSE NULL END
				)
                , SPOPL.id_permutation
			)
            , 0
		) AS id_permutation
		-- , IFNULL(IFNULL(SPOPL_T.id_currency_cost, SPOPL.id_currency_cost), 0) AS id_currency_cost
		, IFNULL(IFNULL(SPOPL_T.id_unit_quantity, SPOPL.id_unit_quantity), 0) AS id_unit_quantity
		, IFNULL(IFNULL(SPOPL_T.quantity_ordered, SPOPL.quantity_ordered), 0) AS quantity_ordered
		, IFNULL(SPOPL_T.quantity_received, SPOPL.quantity_received) AS quantity_received
		, IFNULL(SPOPL_T.latency_delivery_days, SPOPL.latency_delivery_days) AS latency_delivery_days
		, RANK() OVER (PARTITION BY IFNULL(IFNULL(SPOPL_T.id_order, SPOPL.id_order), 0) ORDER BY IFNULL(IFNULL(SPOPL_T.display_order, SPOPL.display_order), 0)) AS display_order
		, IFNULL(IFNULL(SPOPL_T.cost_total_local_VAT_excl, SPOPL.cost_total_local_VAT_excl), 0) AS cost_total_local_VAT_excl
		, IFNULL(IFNULL(SPOPL_T.cost_total_local_VAT_incl, SPOPL.cost_total_local_VAT_incl), 0) AS cost_total_local_VAT_incl
		, IFNULL(SPOPL_T.cost_total_local_VAT_excl / SPOPL_T.quantity_ordered, SPOPL.cost_unit_local_VAT_excl) AS cost_unit_local_VAT_excl
		, IFNULL(SPOPL_T.cost_total_local_VAT_incl / SPOPL_T.quantity_ordered, SPOPL.cost_unit_local_VAT_incl) AS cost_unit_local_VAT_incl
		, IFNULL(IFNULL(SPOPL_T.active, SPOPL.active), 1) AS active
		, NOT ISNULL(t_SPO.id_order) AS has_order
	    , IFNULL(SPOPL_T.id_link, 0) < 1 AS is_new
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link_Temp SPOPL_T
	LEFT JOIN partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link SPOPL ON SPOPL_T.id_link = SPOPL.id_link
	LEFT JOIN tmp_Supplier_Purchase_Order t_SPO ON SPOPL_T.id_order = t_SPO.id_order
	WHERE SPOPL_T.GUID = a_guid
	;
    
    UPDATE tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
	INNER JOIN partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link_Temp SPOPL_T ON t_SPOPL.id_order = SPOPL_T.id_order
    LEFT JOIN partsltd_prod.Shop_Product P ON SPOPL_T.id_product = P.id_product
    LEFT JOIN partsltd_prod.Shop_Product_Category PC ON P.id_category = PC.id_category
	SET 
		name_error = CONCAT(
			CASE WHEN ISNULL(t_SPOPL.id_permutation) THEN
				CASE WHEN ISNULL(SPOPL_T.id_product) THEN
					'(No Product Permutation)'
				ELSE
					CONCAT(
						PC.name
                        , ' - '
                        , P.name
                    )
                END
			ELSE 
				fn_shop_get_product_permutation_name(t_SPOPL.id_permutation) 
			END
			, ' - x'
			, IFNULL(t_SPOPL.quantity_ordered, '(No Quantity)')
		)
	;
	
	INSERT INTO tmp_Supplier_Purchase_Order (
		id_order
        , id_order_temp
		, id_supplier_ordered
		, id_currency_cost
        , active
        , is_new
	)
	SELECT
		SPO.id_order
		, SPO.id_order
		, IFNULL(SPO.id_supplier_ordered, 0) AS id_supplier_ordered
		, IFNULL(SPO.id_currency_cost, 0) AS id_currency_cost
        , SPO.active AS active
        , 0 AS is_new
	FROM partsltd_prod.Shop_Supplier_Purchase_Order SPO
	INNER JOIN tmp_Supplier_Purchase_Order_Product_Link t_SPOPL 
		ON SPO.id_order = t_SPOPL.id_order
		AND t_SPOPL.has_order = 0
	;
        
    UPDATE tmp_Supplier_Purchase_Order t_SPO
	INNER JOIN (
		SELECT 
			t_SPOPL.id_order
			, SUM(t_SPOPL.cost_total_local_VAT_excl) AS cost_total_local_VAT_excl
            , SUM(t_SPOPL.cost_total_local_VAT_incl) AS cost_total_local_VAT_incl
        FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
		GROUP BY t_SPOPL.id_order
	) SUM_t_SPOPL ON t_SPO.id_order = SUM_t_SPOPL.id_order
	SET 
		t_SPO.cost_total_local_VAT_excl = SUM_t_SPOPL.cost_total_local_VAT_excl
		, t_SPO.cost_total_local_VAT_incl = SUM_t_SPOPL.cost_total_local_VAT_incl
	;

    -- Validation
	-- Supplier Purchase Order
    # id_order
    IF EXISTS (
		SELECT * 
        FROM tmp_Supplier_Purchase_Order t_SPO
        LEFT JOIN partsltd_prod.Shop_Supplier_Purchase_Order SPO ON t_SPO.id_order = SPO.id_order
        WHERE 1=1
			AND t_SPO.id_order > 0
			AND ISNULL(SPO.id_order)
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
				'A valid ID is required for the following Supplier Purchase Order(s): '
				, GROUP_CONCAT(CONCAT(IFNULL(t_SPO.id_stock, '(No Supplier Purchase Order)')) SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier_Purchase_Order t_SPO
        LEFT JOIN partsltd_prod.Shop_Supplier_Purchase_Order SPO ON t_SPO.id_order = SPO.id_order
        WHERE 1=1
			AND t_SPO.id_stock > 0
			AND ISNULL(SPO.id_stock)
		;
    END IF;
    # id_supplier_ordered
    IF EXISTS (
		SELECT * 
        FROM tmp_Supplier_Purchase_Order t_SPO
        LEFT JOIN partsltd_prod.Shop_Supplier S ON t_SPO.id_supplier_ordered = S.id_supplier
        WHERE 1=1
			AND (
				ISNULL(S.id_supplier)
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
				'A valid supplier is required for the following Supplier Purchase Order(s): '
				, GROUP_CONCAT(CONCAT(IFNULL(t_SPO.id_stock, '(No Supplier Purchase Order)'), ' - ', t_SPO.id_supplier_ordered) SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier_Purchase_Order t_SPO
        LEFT JOIN partsltd_prod.Shop_Supplier S ON t_SPO.id_supplier_ordered = S.id_supplier
        WHERE 1=1
			AND (
				ISNULL(S.id_supplier)
				OR S.active = 0
			)
		;
    END IF;
    # id_currency_cost
    IF EXISTS (
		SELECT * 
        FROM tmp_Supplier_Purchase_Order t_SPO
        LEFT JOIN partsltd_prod.Shop_Currency C ON t_SPO.id_currency_cost = C.id_currency
        WHERE 1=1
			AND (
				ISNULL(C.id_currency)
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
				'A valid currency is required for the following Supplier Purchase Order(s): '
				, GROUP_CONCAT(CONCAT(IFNULL(t_SPO.id_stock, '(No Supplier Purchase Order)'), ' - ', t_SPO.id_currency_cost) SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier_Purchase_Order t_SPO
        LEFT JOIN partsltd_prod.Shop_Currency C ON t_SPO.id_currency_cost = C.id_currency
        WHERE 1=1
			AND (
				ISNULL(C.id_currency)
				OR C.active = 0
			)
		;
    END IF;
    # id_unit_quantity
    IF EXISTS (
		SELECT * 
        FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
        LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM ON t_SPOPL.id_unit_quantity = UM.id_unit_measurement
        WHERE 1=1
			AND (
				ISNULL(UM.id_unit_measurement)
				OR UM.active = 0
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
				'A valid unit measurement of quantity is required for the following Supplier Purchase Order(s): '
				, GROUP_CONCAT(CONCAT(IFNULL(t_SPO.id_stock, '(No Supplier Purchase Order)'), ' - ', t_SPO.id_currency_cost) SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
        LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM ON t_SPOPL.id_unit_quantity = UM.id_unit_measurement
        WHERE 1=1
			AND (
				ISNULL(UM.id_unit_measurement)
				OR UM.active = 0
			)
		;
    END IF;
	# Invalid quantity ordered
	IF EXISTS (
		SELECT * 
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
		WHERE 
			ISNULL(t_SPOPL.quantity_ordered)
			OR t_SPOPL.quantity_ordered <= 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_type_error_bad_data, 
			v_code_type_error_bad_data, 
			CONCAT(
				'A valid quantity ordered is required for the following Supplier Purchase Order Item(s): '
				, GROUP_CONCAT(t_SPOPL.name_error SEPARATOR ', ')
			)
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
		WHERE 
			ISNULL(t_SPOPL.quantity_ordered)
			OR t_SPOPL.quantity_ordered <= 0
		;
	END IF;
	# Invalid quantity received
	IF EXISTS (
		SELECT * 
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
		WHERE t_SPOPL.quantity_received < 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_type_error_bad_data, 
			v_code_type_error_bad_data, 
			CONCAT(
				'A valid quantity received is required for the following Supplier Purchase Order Item(s): '
				, GROUP_CONCAT(t_SPOPL.name_error, ' - ', t_SPOPL.quantity_received SEPARATOR ', ')
			)
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
		WHERE t_SPOPL.quantity_received < 0
		;
	END IF;
	# Invalid delivery latency
	IF EXISTS (
		SELECT * 
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
		WHERE t_SPOPL.latency_delivery_days < 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_type_error_bad_data, 
			v_code_type_error_bad_data, 
			CONCAT(
				'A valid delivery latency is required for the following Supplier Purchase Order Item(s): '
				, GROUP_CONCAT(t_SPOPL.name_error, ' - ', t_SPOPL.latency_delivery_days SEPARATOR ', ')
			)
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
		WHERE t_SPOPL.latency_delivery_days < 0
		;
	END IF;
    
    -- Duplicates
	IF EXISTS (
		SELECT 
			id_permutation
			, name_error
			, COUNT(*)
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL 
		GROUP BY id_permutation, name_error
		HAVING COUNT(*) > 1
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_type_error_bad_data, 
			v_code_type_error_bad_data, 
			CONCAT('Duplicate records: ', GROUP_CONCAT(t_SPOPLC.name_error SEPARATOR ', '))
		FROM (
			SELECT 
				id_permutation
				, name_error
				, COUNT(*) 
			FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL 
			GROUP BY id_permutation, name_error 
			HAVING COUNT(*) > 1
		) t_SPOPLC
		;
	END IF;
	-- Empty Supplier Purchase Order
	IF EXISTS ( SELECT * FROM tmp_Supplier_Purchase_Order t_SPO LEFT JOIN tmp_Supplier_Purchase_Order_Product_Link t_SPOPL ON t_SPO.id_order = t_SPOPL.id_order WHERE ISNULL(t_SPOPL.id_order) ) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_type_error_bad_data, 
			v_code_type_error_bad_data, 
			CONCAT(
				'There are no items in the following Supplier Purchase Order(s): '
				, GROUP_CONCAT(t_SPO.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier_Purchase_Order t_SPO 
		LEFT JOIN tmp_Supplier_Purchase_Order_Product_Link t_SPOPL ON t_SPO.id_order = t_SPOPL.id_order 
		WHERE ISNULL(t_SPOPL.id_order)
		;
	END IF;
	
	-- Supplier Purchase Order Items without Order
	IF EXISTS ( 
		SELECT * 
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL 
		LEFT JOIN tmp_Supplier_Purchase_Order t_SPO ON t_SPOPL.id_order = t_SPO.id_order
		WHERE ISNULL(t_SPO.id_order) 
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_type_error_bad_data, 
			v_code_type_error_bad_data, 
			CONCAT(
				'There is no order for the following Supplier Purchase Order Item(s): '
				, GROUP_CONCAT(t_SPOPL.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL 
		LEFT JOIN tmp_Supplier_Purchase_Order t_SPO ON t_SPOPL.id_order = t_SPO.id_order
		WHERE ISNULL(t_SPO.id_order) 
		;
	END IF;
    
    -- Permissions
	SET v_ids_product_permission := (
		SELECT 
			GROUP_CONCAT(DISTINCT PP.id_product SEPARATOR ',')
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
		INNER JOIN partsltd_prod.Shop_Product_Permutation PP ON t_SPOPL.id_permutation = PP.id_permutation
	);
	IF a_debug = 1 THEN
		SELECT 
			a_guid
			, a_id_user
			, FALSE -- get inactive users
			, v_id_permission_supplier_purchase_order
			, v_id_access_level_edit
			, v_ids_product_permission -- ids_product
			, 0 -- a_debug
		;
		SELECT * from partsltd_prod.Shop_Calc_User_Temp;
	END IF;
	
	CALL p_shop_calc_user(
		a_guid
		, a_id_user
		, FALSE -- get inactive users
		, v_id_permission_supplier_purchase_order
		, v_id_access_level_edit
		, v_ids_product_permission -- ids_product
		, 0 -- a_debug
	);
	
	IF a_debug = 1 THEN
		SELECT * from partsltd_prod.Shop_Calc_User_Temp WHERE GUID = a_guid;
	END IF;
	
	IF EXISTS (SELECT * FROM partsltd_prod.Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = a_guid AND IFNULL(UE_T.can_view, 0) = 0) THEN
		DELETE FROM tmp_Msg_Error;

		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_no_permission
			, v_code_type_error_no_permission
			, CONCAT(
				'You do not have view permissions for '
				, GROUP_CONCAT(name SEPARATOR ', ') 
			) AS msg
		FROM partsltd_prod.Shop_Permission PERM
		INNER JOIN partsltd_prod.Shop_Calc_User_Temp UE_T 
			ON PERM.id_permission = UE_T.id_permission
			AND UE_T.GUID = a_guid
			AND IFNULL(UE_T.can_view, 0) = 0
		;
	END IF;

	CALL partsltd_prod.p_shop_clear_calc_user( 
		a_guid
        , 0 -- a_debug
	);

	IF EXISTS (
		SELECT *
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
		INNER JOIN partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link SPOPL ON t_SPOPL.id_link = SPOPL.id_link
		INNER JOIN partsltd_prod.Shop_Stock_Item SI ON SPOPL.id_permutation = SI.id_permutation
		WHERE 
			t_SPOPL.is_new = 0
			AND t_SPOPL.quantity_received <> SPOPL.quantity_received
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
            , code
            , msg
		)
        SELECT
			v_id_type_error_warning
            , v_code_type_error_warning
            , CONCAT(
				'The quantity received has changed on the following orders. Please update the stock items appropriately.'
                , GROUP_CONCAT(
					CONCAT(
						t_SPOPL.name_error
                        , ' - from '
                        , SPOPL.quantity_received
                        , ' to '
                        , t_SPOPL.quantity_received
					) SEPARATOR ', '
				)
			) AS msg
		;
    END IF;
    
	IF EXISTS ( SELECT * FROM tmp_Msg_Error LIMIT 1 ) THEN
		DELETE FROM tmp_Supplier_Purchase_Order;
		DELETE FROM tmp_Supplier_Purchase_Order_Product_Link;
	END IF;
	
	-- Transaction    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		START TRANSACTION;
			INSERT INTO Shop_Sales_And_Purchasing_Change_Set (
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
		
			INSERT INTO partsltd_prod.Shop_Supplier_Purchase_Order (
				id_order_temp
				, id_supplier_ordered
				, id_currency_cost
				, cost_total_local_VAT_excl
				, cost_total_local_VAT_incl
                , active
				, created_by
				, created_on
				, id_change_set
			)
			SELECT
				t_SPO.id_order_temp
				, t_SPO.id_supplier_ordered
				, t_SPO.id_currency_cost
				, t_SPO.cost_total_local_VAT_excl
				, t_SPO.cost_total_local_VAT_incl
				, t_SPO.active
				, a_id_user
				, v_time_start
				, v_id_change_set
			FROM tmp_Supplier_Purchase_Order t_SPO
			INNER JOIN tmp_Supplier_Purchase_Order_Product_Link t_SPOPL ON t_SPO.id_order = t_SPOPL.id_order
			WHERE t_SPOPL.is_new = 1
            GROUP BY t_SPO.id_order
			;
		
			UPDATE partsltd_prod.Shop_Supplier_Purchase_Order SPO
			INNER JOIN tmp_Supplier_Purchase_Order t_SPO 
				ON SPO.id_order = t_SPO.id_order
				AND t_SPO.is_new = 0
			INNER JOIN tmp_Supplier_Purchase_Order_Product_Link t_SPOPL ON t_SPO.id_order = t_SPOPL.id_order
			SET
				SPO.id_supplier_ordered = t_SPO.id_supplier_ordered
				, SPO.id_currency_cost = t_SPO.id_currency_cost
				, SPO.cost_total_local_VAT_excl = t_SPO.cost_total_local_VAT_excl
				, SPO.cost_total_local_VAT_incl = t_SPO.cost_total_local_VAT_incl
				, SPO.active = t_SPO.active
				, SPO.id_change_set = v_id_change_set
			;
            
			
			UPDATE tmp_Supplier_Purchase_Order t_SPO
			INNER JOIN partsltd_prod.Shop_Supplier_Purchase_Order SPO ON t_SPO.id_order_temp = SPO.id_order_temp
			SET 
				t_SPO.id_order = SPO.id_order
			WHERE t_SPO.is_new = 1
			;
            
			UPDATE tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
			INNER JOIN tmp_Supplier_Purchase_Order t_SPO ON t_SPOPL.id_order = t_SPO.id_order_temp
			SET 
				t_SPOPL.id_order = t_SPO.id_order
			WHERE t_SPO.is_new = 1
			;
            
			
			INSERT INTO Shop_Supplier_Purchase_Order_Product_Link (
				id_order
				, id_permutation
				, id_unit_quantity
				, quantity_ordered
				, quantity_received
				, latency_delivery_days
				, display_order
				, active
				, cost_total_local_VAT_excl
				, cost_total_local_VAT_incl
				, cost_unit_local_VAT_excl
				, cost_unit_local_VAT_incl
				, created_by
                , created_on
				, id_change_set
			)
			SELECT
				t_SPOPL.id_order
				, t_SPOPL.id_permutation
				, t_SPOPL.id_unit_quantity
				, t_SPOPL.quantity_ordered
				, t_SPOPL.quantity_received
				, t_SPOPL.latency_delivery_days
				, t_SPOPL.display_order
				, t_SPOPL.active
				, t_SPOPL.cost_total_local_VAT_excl
				, t_SPOPL.cost_total_local_VAT_incl
				, t_SPOPL.cost_unit_local_VAT_excl
				, t_SPOPL.cost_unit_local_VAT_incl
				, a_id_user
                , v_time_start
				, v_id_change_set
			FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
			WHERE t_SPOPL.is_new = 1
			;
			
			UPDATE partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link SPOPL
			INNER JOIN tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
				ON SPOPL.id_link = t_SPOPL.id_link
				AND t_SPOPL.is_new = 0
			SET
				SPOPL.id_order = t_SPOPL.id_order
				, SPOPL.id_permutation = t_SPOPL.id_permutation
				, SPOPL.id_unit_quantity = t_SPOPL.id_unit_quantity
				, SPOPL.quantity_ordered = t_SPOPL.quantity_ordered
				, SPOPL.quantity_received = t_SPOPL.quantity_received
				, SPOPL.latency_delivery_days = t_SPOPL.latency_delivery_days
				, SPOPL.display_order = t_SPOPL.display_order
				, SPOPL.active = t_SPOPL.active
				, SPOPL.cost_total_local_VAT_excl = t_SPOPL.cost_total_local_VAT_excl
				, SPOPL.cost_total_local_VAT_incl = t_SPOPL.cost_total_local_VAT_incl
				, SPOPL.cost_unit_local_VAT_excl = t_SPOPL.cost_unit_local_VAT_excl
				, SPOPL.cost_unit_local_VAT_incl = t_SPOPL.cost_unit_local_VAT_incl
				, SPOPL.id_change_set = v_id_change_set
			;
		
			DELETE SPO_T
			FROM Shop_Supplier_Purchase_Order_Temp SPO_T
			WHERE SPO_T.GUID = a_guid
			;
			DELETE SPOPL_T
			FROM Shop_Supplier_Purchase_Order_Product_Link_Temp SPOPL_T
			WHERE SPOPL_T.GUID = a_guid
			;
			
		COMMIT;
    END IF;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
	INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
	;
    
	IF a_debug = 1 THEN
		SELECT * from tmp_Supplier_Purchase_Order;
		SELECT * from tmp_Supplier_Purchase_Order_Product_Link;
	END IF;

    DROP TEMPORARY TABLE tmp_Supplier_Purchase_Order;
    DROP TEMPORARY TABLE tmp_Supplier_Purchase_Order_Product_Link;
    DROP TEMPORARY TABLE tmp_Msg_Error;
    
	IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
	END IF;
END //
DELIMITER ;;


/*

DELETE FROM Shop_Supplier_Purchase_Order_Product_Link_Audit;
DELETE FROM Shop_Supplier_Purchase_Order_Product_Link;
DELETE FROM Shop_Supplier_Purchase_Order_Product_Link_Temp;
DELETE FROM Shop_Supplier_Purchase_Order_Audit;
DELETE FROM Shop_Supplier_Purchase_Order;

INSERT INTO Shop_Supplier_Purchase_Order_Product_Link_Temp (
	guid,
    id_link,
    id_order,
	id_permutation,
	cost_total_local,
	id_currency_cost,
	quantity_ordered,
	id_unit_quantity,
	quantity_received,
	latency_delivery_days,
	display_order,
    active
)
VALUES
	(
		'NIPS', # guid
		-1, # id_link,
		-1, # id_order,
		1, # id_permutation,
		100, # cost_total_local,
		1, # id_currency_cost,
		1, # quantity_ordered,
		1, # id_unit_quantity,
		1, # quantity_received,
		14, # latency_delivery_days ,
		1, # display_order
        1 # active
    )
;

SELECT * FROM Shop_Supplier_Purchase_Order_Product_Link_Temp;

CALL p_shop_save_supplier_purchase_order (
	'NIPS', # a_guid
    'auth0|6582b95c895d09a70ba10fef', # a_id_user
    -1, # a_id_order
    1, # a_id_supplier_ordered
    1 # a_id_currency_cost
);

SELECT * FROM Shop_Supplier_Purchase_Order_Product_Link_Temp;

DELETE FROM Shop_Supplier_Purchase_Order_Product_Link_Audit;
DELETE FROM Shop_Supplier_Purchase_Order_Product_Link;
DELETE FROM Shop_Supplier_Purchase_Order_Product_Link_Temp;
DELETE FROM Shop_Supplier_Purchase_Order_Audit;
DELETE FROM Shop_Supplier_Purchase_Order;


*/

