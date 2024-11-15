



-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_manufacturing_purchase_order;

DROP TABLE IF EXISTS tmp_Manufacturing_Purchase_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Msg_Error;

DELIMITER //
CREATE PROCEDURE p_shop_save_manufacturing_purchase_order (
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
    DECLARE v_ids_permission_manufacturing_purchase_order VARCHAR(100);
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
	SET v_ids_permission_manufacturing_purchase_order := (SELECT GROUP_CONCAT(id_permission SEPARATOR ',') FROM partsltd_prod.Shop_Permission WHERE code IN ('STORE_MANUFACTURING_PURCHASE_ORDER', 'STORE_PRODUCT'));
	SET v_id_access_level_edit := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
	CALL p_validate_guid ( a_guid );
	SET a_comment := TRIM(IFNULL(a_comment, ''));
    
	DROP TEMPORARY TABLE IF EXISTS tmp_Manufacturing_Purchase_Order;
	DROP TEMPORARY TABLE IF EXISTS tmp_Manufacturing_Purchase_Order_Product_Link;
	DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;

    -- Temporary tables
    CREATE TEMPORARY TABLE tmp_Manufacturing_Purchase_Order (
		id_order INT NOT NULL PRIMARY KEY
        , id_order_temp INT NOT NULL
		, id_currency INT NOT NULL
		, active BIT NOT NULL
		, is_new BIT NOT NULL
		, name_error VARCHAR(1000) NOT NULL
		, cost_total_local_VAT_excl FLOAT NULL
		, cost_total_local_VAT_incl FLOAT NULL
		, price_total_local_VAT_excl FLOAT NULL
		, price_total_local_VAT_incl FLOAT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Manufacturing_Purchase_Order_Product_Link (
		id_link INT NOT NULL PRIMARY KEY
		, id_order INT NOT NULL
        , id_product INT NULL
        , id_permutation INT NULL
		, id_unit_quantity INT NOT NULL
		, quantity_used FLOAT NOT NULL
		, quantity_produced FLOAT NULL
		, id_unit_latency_manufacture INT NULL
		, latency_manufacture INT NULL
		, display_order INT NOT NULL
        , active BIT NOT NULL
		, cost_unit_local_VAT_excl FLOAT NULL
		, cost_unit_local_VAT_incl FLOAT NULL
		, cost_total_local_VAT_excl FLOAT NULL
		, cost_total_local_VAT_incl FLOAT NULL
		, price_unit_local_VAT_excl FLOAT NULL
		, price_unit_local_VAT_incl FLOAT NULL
		, price_total_local_VAT_excl FLOAT NULL
		, price_total_local_VAT_incl FLOAT NULL
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
    
	INSERT INTO tmp_Manufacturing_Purchase_Order (
		id_order
		, id_order_temp
		, id_currency
		, active
		, is_new
		, name_error
	)
	SELECT
		MPO_T.id_order
		, MPO_T.id_order
		, IFNULL(IFNULL(MPO_T.id_currency, MPO.id_currency), 0) AS id_currency
		, IFNULL(IFNULL(MPO_T.active, MPO.active), 1) AS active
		, IFNULL(MPO_T.id_order, 0) < 1 AS is_new
		, CASE WHEN IFNULL(MPO_T.id_order, -1) < 0 THEN
			CONCAT('New Manufacturing Purchase Order ', MPO_T.id_order)
		ELSE
			CONCAT(
				IFNULL(IFNULL(MPO_T.id_order, MPO.id_order), '(No Manufacturing Purchase Order)')
				, ' - '
				, IFNULL(IFNULL(MPO_T.id_currency, MPO.id_currency), '(No Currency)')
			)
		END AS name_error
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Temp MPO_T
	LEFT JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO ON MPO_T.id_order = MPO.id_order
	WHERE MPO_T.GUID = a_guid
	;

	INSERT INTO tmp_Manufacturing_Purchase_Order_Product_Link (
		id_link
		, id_order
        , id_product
		, id_permutation
		, id_unit_quantity
		, quantity_used
		, quantity_produced
		, id_unit_latency_manufacture
		, latency_manufacture
		, display_order
		, active
		, cost_unit_local_VAT_excl
		, cost_unit_local_VAT_incl
		, price_unit_local_VAT_excl
		, price_unit_local_VAT_incl
		, has_order
		, is_new
	)
	SELECT 
		IFNULL(MPOPL_T.id_link, 0) AS id_link
		, IFNULL(IFNULL(MPOPL_T.id_order, MPOPL.id_order), 0) AS id_order
        , IFNULL(MPOPL_T.id_product, PP.id_product) AS id_product
		, IFNULL(
			IFNULL(
				IFNULL(
					MPOPL_T.id_permutation
                    , CASE WHEN NOT ISNULL(MPOPL_T.id_product) AND NOT ISNULL(MPOPL_T.csv_list_variations) THEN
						partsltd_prod.fn_shop_get_id_product_permutation_from_variation_csv_list(MPOPL_T.id_product, MPOPL_T.csv_list_variations)
					ELSE NULL END
				)
                , MPOPL.id_permutation
			)
            , 0
		) AS id_permutation
		, IFNULL(IFNULL(MPOPL_T.id_unit_quantity, MPOPL.id_unit_quantity), 0) AS id_unit_quantity
		, MPOPL_T.quantity_used AS quantity_used
		, MPOPL_T.quantity_produced AS quantity_produced
		, MPOPL_T.id_unit_latency_manufacture AS id_unit_latency_manufacture
		, MPOPL_T.latency_manufacture AS latency_manufacture
		, IFNULL(MPOPL_T.display_order, RANK() OVER (PARTITION BY IFNULL(IFNULL(MPOPL_T.id_order, MPOPL.id_order), 0) ORDER BY IFNULL(IFNULL(MPOPL_T.display_order, MPOPL.display_order), 0))) AS display_order
		, IFNULL(IFNULL(MPOPL_T.active, MPOPL.active), 1) AS active
		-- , MPOPL_T.cost_total_local_VAT_excl / MPOPL_T.quantity_used AS cost_unit_local_VAT_excl
 		-- , MPOPL_T.cost_total_local_VAT_incl / MPOPL_T.quantity_used AS cost_unit_local_VAT_incl
		, IFNULL(MPOPL_T.cost_unit_local_VAT_excl, MPOPL.cost_unit_local_VAT_excl) AS cost_unit_local_VAT_excl
		, IFNULL(MPOPL_T.cost_unit_local_VAT_incl, MPOPL.cost_unit_local_VAT_incl) AS cost_unit_local_VAT_incl
		, IFNULL(MPOPL_T.price_unit_local_VAT_excl, MPOPL.price_unit_local_VAT_excl) AS price_unit_local_VAT_excl
		, IFNULL(MPOPL_T.price_unit_local_VAT_incl, MPOPL.price_unit_local_VAT_incl) AS price_unit_local_VAT_incl
		, NOT ISNULL(t_MPO.id_order) AS has_order
	    , IFNULL(MPOPL_T.id_link, 0) < 1 AS is_new
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp MPOPL_T
	LEFT JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link MPOPL ON MPOPL_T.id_link = MPOPL.id_link
	LEFT JOIN tmp_Manufacturing_Purchase_Order t_MPO ON MPOPL_T.id_order = t_MPO.id_order
	LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON MPOPL.id_permutation = PP.id_permutation
	WHERE MPOPL_T.GUID = a_guid
	;

    UPDATE tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
	-- INNER JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp MPOPL_T ON t_MPOPL.id_order = MPOPL_T.id_order
    LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_MPOPL.id_permutation = PP.id_permutation
    LEFT JOIN partsltd_prod.Shop_Product P ON PP.id_product = P.id_product
    LEFT JOIN partsltd_prod.Shop_Product_Category PC ON P.id_category = PC.id_category
	SET 
		name_error = CONCAT(
			CASE WHEN ISNULL(t_MPOPL.id_permutation) THEN
				CASE WHEN ISNULL(PP.id_product) THEN
					'(No Product Permutation)'
				ELSE
					CONCAT(
						PC.name
                        , ' - '
                        , P.name
                    )
                END
			ELSE 
				fn_shop_get_product_permutation_name(PP.id_permutation) 
			END
			, ' - x'
			, IFNULL(t_MPOPL.quantity_used, '(No Quantity)')
            , ' Used  - x'
			, IFNULL(t_MPOPL.quantity_produced, '(No Quantity)')
            , ' Produced'
		)
		, cost_total_local_VAT_excl = t_MPOPL.quantity_used * t_MPOPL.cost_unit_local_VAT_excl
		, cost_total_local_VAT_incl = t_MPOPL.quantity_used * t_MPOPL.cost_unit_local_VAT_incl
		, price_total_local_VAT_excl = t_MPOPL.quantity_produced * t_MPOPL.price_unit_local_VAT_excl
		, price_total_local_VAT_incl = t_MPOPL.quantity_produced * t_MPOPL.price_unit_local_VAT_incl
	;
	
	-- Insert missing order records
	INSERT INTO tmp_Manufacturing_Purchase_Order (
		id_order
		, id_order_temp
		, id_currency
		, active
		, is_new
		, name_error
	)
	SELECT
		MPO.id_order
		, MPO.id_order_temp
		, MPO.id_currency
		, MPO.active
		, FALSE AS is_new
		, CONCAT(
			IFNULL(MPO.id_order, '(No Manufacturing Purchase Order)')
			, ' - '
			, IFNULL(MPO.id_currency, '(No Currency)')
		) AS name_error
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order MPO
	INNER JOIN tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL 
		ON MPO.id_order = t_MPOPL.id_order
		AND t_MPOPL.has_order = 0
	;
	
    UPDATE tmp_Manufacturing_Purchase_Order t_MPO
	INNER JOIN (
		SELECT 
			t_MPOPL.id_order
			, SUM(t_MPOPL.cost_total_local_VAT_excl) AS cost_total_local_VAT_excl
            , SUM(t_MPOPL.cost_total_local_VAT_incl) AS cost_total_local_VAT_incl
			, SUM(t_MPOPL.price_total_local_VAT_excl) AS price_total_local_VAT_excl
            , SUM(t_MPOPL.price_total_local_VAT_incl) AS price_total_local_VAT_incl
        FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		GROUP BY t_MPOPL.id_order
	) SUM_t_MPOPL ON t_MPO.id_order = SUM_t_MPOPL.id_order
	SET 
		t_MPO.cost_total_local_VAT_excl = SUM_t_MPOPL.cost_total_local_VAT_excl
		, t_MPO.cost_total_local_VAT_incl = SUM_t_MPOPL.cost_total_local_VAT_incl
		, t_MPO.price_total_local_VAT_excl = SUM_t_MPOPL.price_total_local_VAT_excl
		, t_MPO.price_total_local_VAT_incl = SUM_t_MPOPL.price_total_local_VAT_incl
	;

    -- Validation
	-- Manufacturing Purchase Order
    # id_order
    IF EXISTS (
		SELECT * 
        FROM tmp_Manufacturing_Purchase_Order t_MPO
        LEFT JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO ON t_MPO.id_order = MPO.id_order
        WHERE 1=1
			AND t_MPO.id_order > 0
			AND ISNULL(MPO.id_order)
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
				'A valid ID is required for the following Manufacturing Purchase Order(s): '
				, GROUP_CONCAT(t_MPO.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Manufacturing_Purchase_Order t_MPO
        LEFT JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO ON t_MPO.id_order = MPO.id_order
        WHERE 1=1
			AND t_MPO.id_order > 0
			AND ISNULL(MPO.id_order)
		;
    END IF;
    # id_currency
    IF EXISTS (
		SELECT * 
        FROM tmp_Manufacturing_Purchase_Order t_MPO
        LEFT JOIN partsltd_prod.Shop_Currency C ON t_MPO.id_currency = C.id_currency
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
				'A valid currency is required for the following Manufacturing Purchase Order(s): '
				, GROUP_CONCAT(CONCAT(t_MPO.name_error, ' - ', t_MPO.id_currency) SEPARATOR ', ')
			) AS msg
		FROM tmp_Manufacturing_Purchase_Order t_MPO
        LEFT JOIN partsltd_prod.Shop_Currency C ON t_MPO.id_currency = C.id_currency
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
        FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
        LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM ON t_MPOPL.id_unit_quantity = UM.id_unit_measurement
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
				'A valid unit measurement of quantity is required for the following Manufacturing Purchase Order(s): '
				, GROUP_CONCAT(CONCAT(t_MPOPL.name_error, ' - ', t_MPO.id_unit_quantity) SEPARATOR ', ')
			) AS msg
        FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
        LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM ON t_MPOPL.id_unit_quantity = UM.id_unit_measurement
        WHERE 1=1
			AND (
				ISNULL(UM.id_unit_measurement)
				OR UM.active = 0
			)
		;
    END IF;
	# Invalid quantity used
	IF EXISTS (
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			ISNULL(t_MPOPL.quantity_used)
			OR t_MPOPL.quantity_used <= 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'A valid quantity used is required for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(CONCAT(t_MPOPL.name_error, ' - ', t_MPOPL.quantity_used) SEPARATOR ', ')
			)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.quantity_used)
			AND t_MPOPL.quantity_used <= 0
		;
	END IF;
	# Invalid quantity produced
	IF EXISTS (
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE
			NOT ISNULL(t_MPOPL.quantity_produced)
			AND t_MPOPL.quantity_produced < 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'A valid quantity produced is required for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(CONCAT(t_MPOPL.name_error, ' - ', t_MPOPL.quantity_produced) SEPARATOR ', ')
			)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.quantity_produced)
			AND t_MPOPL.quantity_produced < 0
		;
	END IF;
    # id_unit_latency_manufacture
    IF EXISTS (
		SELECT * 
        FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
        LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM ON t_MPOPL.id_unit_latency_manufacture = UM.id_unit_measurement
        WHERE 
			ISNULL(t_MPOPL.id_unit_latency_manufacture)
			OR ISNULL(UM.id_unit_measurement)
			OR UM.active = 0
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
				'A valid unit measurement of manufacture latency is required for the following Manufacturing Purchase Order(s): '
				, GROUP_CONCAT(CONCAT(t_MPOPL.name_error, ' - ', t_MPOPL.id_unit_latency_manufacture) SEPARATOR ', ')
			) AS msg
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
        LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM ON t_MPOPL.id_unit_latency_manufacture = UM.id_unit_measurement
        WHERE 
			ISNULL(t_MPOPL.id_unit_latency_manufacture)
			OR ISNULL(UM.id_unit_measurement)
			OR UM.active = 0
		;
    END IF;
	# Invalid manufacture latency
	IF EXISTS (
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE t_MPOPL.latency_manufacture < 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'A valid manufacture latency is required for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(CONCAT(t_MPOPL.name_error, ' - ', t_MPOPL.latency_manufacture) SEPARATOR ', ')
			)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE t_MPOPL.latency_manufacture < 0
		;
	END IF;
    
	# Invalid costs excl VAT
	IF EXISTS (
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.cost_unit_local_VAT_excl)
			AND t_MPOPL.cost_unit_local_VAT_excl < 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'A valid cost excluding VAT is required for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(CONCAT(t_MPOPL.name_error, ' - ', t_MPOPL.cost_unit_local_VAT_excl) SEPARATOR ', ')
			)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.cost_unit_local_VAT_excl)
			AND t_MPOPL.cost_unit_local_VAT_excl < 0
		;
	END IF;
	# Invalid costs incl VAT
	IF EXISTS (
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.cost_unit_local_VAT_incl)
			AND t_MPOPL.cost_unit_local_VAT_incl < 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'A valid cost including VAT is required for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(CONCAT(t_MPOPL.name_error, ' - ', t_MPOPL.cost_unit_local_VAT_incl) SEPARATOR ', ')
			)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.cost_unit_local_VAT_incl)
			AND t_MPOPL.cost_unit_local_VAT_incl < 0
		;
	END IF;
    
	# Invalid prices excl VAT
	IF EXISTS (
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.price_unit_local_VAT_excl)
			AND t_MPOPL.price_unit_local_VAT_excl < 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'A valid price excluding VAT is required for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(CONCAT(t_MPOPL.name_error, ' - ', t_MPOPL.price_unit_local_VAT_excl) SEPARATOR ', ')
			)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.price_unit_local_VAT_excl)
			AND t_MPOPL.price_unit_local_VAT_excl < 0
		;
	END IF;
	# Invalid prices incl VAT
	IF EXISTS (
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.price_unit_local_VAT_incl)
			AND t_MPOPL.price_unit_local_VAT_incl < 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'A valid price including VAT is required for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(CONCAT(t_MPOPL.name_error, ' - ', t_MPOPL.price_unit_local_VAT_incl) SEPARATOR ', ')
			)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.price_unit_local_VAT_incl)
			AND t_MPOPL.price_unit_local_VAT_incl < 0
		;
	END IF;
    
    -- Duplicates
    /*
	IF EXISTS (
		SELECT 
			t_MPOPL.id_permutation
			, t_MPOPL.name_error
			, COUNT(*)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL 
		GROUP BY t_MPOPL.id_permutation, t_MPOPL.name_error
		HAVING COUNT(*) > 1
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT('Duplicate records: ', GROUP_CONCAT(t_MPOPLC.name_error SEPARATOR ', '))
		FROM (
			SELECT 
				t_MPOPL.id_permutation
				, t_MPOPL.name_error
				, COUNT(*)
			FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL 
			GROUP BY t_MPOPL.id_permutation, t_MPOPL.name_error
			HAVING COUNT(*) > 1
		) t_MPOPLC
		;
	END IF;
    */
	-- Empty Manufacturing Purchase Order
	IF EXISTS ( SELECT * FROM tmp_Manufacturing_Purchase_Order t_MPO LEFT JOIN tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL ON t_MPO.id_order = t_MPOPL.id_order WHERE ISNULL(t_MPOPL.id_order) ) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'There are no items in the following Manufacturing Purchase Order(s): '
				, GROUP_CONCAT(t_MPO.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Manufacturing_Purchase_Order t_MPO 
		LEFT JOIN tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL ON t_MPO.id_order = t_MPOPL.id_order 
		WHERE ISNULL(t_MPOPL.id_order)
		;
	END IF;
	
	-- Manufacturing Purchase Order Items without Order
	IF EXISTS ( 
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL 
		LEFT JOIN tmp_Manufacturing_Purchase_Order t_MPO ON t_MPOPL.id_order = t_MPO.id_order
		WHERE ISNULL(t_MPO.id_order) 
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'There is no order for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(t_MPOPL.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL 
		LEFT JOIN tmp_Manufacturing_Purchase_Order t_MPO ON t_MPOPL.id_order = t_MPO.id_order
		WHERE ISNULL(t_MPO.id_order) 
		;
	END IF;
    
    -- Permissions
	SET v_ids_product_permission := (
		SELECT 
			GROUP_CONCAT(DISTINCT PP.id_product SEPARATOR ',')
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		INNER JOIN partsltd_prod.Shop_Product_Permutation PP ON t_MPOPL.id_permutation = PP.id_permutation
	);
	IF a_debug = 1 THEN
		SELECT 
			a_guid
			, a_id_user
			, FALSE -- get inactive users
			, v_ids_permission_manufacturing_purchase_order
			, v_id_access_level_edit
			, v_ids_product_permission -- ids_product
			, 0 -- a_debug
		;
		SELECT * 
		FROM partsltd_prod.Shop_Calc_User_Temp
		WHERE GUID = a_guid
		;
	END IF;
	
	CALL p_shop_calc_user(
		a_guid
		, a_id_user
		, FALSE -- get inactive users
		, v_ids_permission_manufacturing_purchase_order
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
				'You do not have edit permissions for '
				, GROUP_CONCAT(name SEPARATOR ', ') 
			)
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

	-- Changed quantity used
	IF EXISTS (
		SELECT *
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		INNER JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link MPOPL ON t_MPOPL.id_link = MPOPL.id_link
		INNER JOIN partsltd_prod.Shop_Stock_Item SI ON MPOPL.id_permutation = SI.id_permutation
		WHERE 
			t_MPOPL.is_new = 0
			AND t_MPOPL.quantity_used <> MPOPL.quantity_used
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
				'The quantity used has changed on the following orders. Please update the stock items appropriately.'
                , GROUP_CONCAT(
					CONCAT(
						t_MPOPL.name_error
                        , ' - from '
                        , MPOPL.quantity_used
                        , ' to '
                        , t_MPOPL.quantity_used
					) SEPARATOR ', '
				)
			) AS msg
		;
    END IF;
	-- Changed quantity produced
	IF EXISTS (
		SELECT *
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		INNER JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link MPOPL ON t_MPOPL.id_link = MPOPL.id_link
		INNER JOIN partsltd_prod.Shop_Stock_Item SI ON MPOPL.id_permutation = SI.id_permutation
		WHERE 
			t_MPOPL.is_new = 0
			AND t_MPOPL.quantity_produced <> MPOPL.quantity_produced
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
				'The quantity produced has changed on the following orders. Please update the stock items appropriately.'
                , GROUP_CONCAT(
					CONCAT(
						t_MPOPL.name_error
                        , ' - from '
                        , MPOPL.quantity_produced
                        , ' to '
                        , t_MPOPL.quantity_produced
					) SEPARATOR ', '
				)
			) AS msg
		;
    END IF;
    
	IF EXISTS ( SELECT * FROM tmp_Msg_Error WHERE id_type <> v_id_type_error_warning LIMIT 1 ) THEN
		DELETE FROM tmp_Manufacturing_Purchase_Order_Product_Link;
		DELETE FROM tmp_Manufacturing_Purchase_Order;
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
		
			INSERT INTO partsltd_prod.Shop_Manufacturing_Purchase_Order (
				id_order_temp
				, id_currency
				, cost_total_local_VAT_excl
				, cost_total_local_VAT_incl
				, price_total_local_VAT_excl
				, price_total_local_VAT_incl
				, active
				, created_by
				, created_on
				, id_change_set
			)
			SELECT
				t_MPO.id_order_temp
				, t_MPO.id_currency
				, t_MPO.cost_total_local_VAT_excl
				, t_MPO.cost_total_local_VAT_incl
				, t_MPO.price_total_local_VAT_excl
				, t_MPO.price_total_local_VAT_incl
				, t_MPO.active
				, a_id_user
				, v_time_start
				, v_id_change_set
			FROM tmp_Manufacturing_Purchase_Order t_MPO
			INNER JOIN tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL ON t_MPO.id_order = t_MPOPL.id_order
			WHERE t_MPO.is_new = 1
			;
			
			UPDATE tmp_Manufacturing_Purchase_Order t_MPO
			INNER JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO 
				ON t_MPO.id_order_temp = MPO.id_order_temp
				AND MPO.id_change_set = v_id_change_set
			SET 
				t_MPO.id_order = MPO.id_order
			WHERE t_MPO.is_new = 1
			;
            
			UPDATE tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
			INNER JOIN tmp_Manufacturing_Purchase_Order t_MPO ON t_MPOPL.id_order = t_MPO.id_order_temp
			SET 
				t_MPOPL.id_order = t_MPO.id_order
			WHERE t_MPO.is_new = 1
			;
			
			INSERT INTO Shop_Manufacturing_Purchase_Order_Product_Link (
				id_order
				, id_permutation
				, id_unit_quantity
				, quantity_used
				, quantity_produced
				, id_unit_latency_manufacture
				, latency_manufacture
				, display_order
				, active
				, cost_unit_local_VAT_excl
				, cost_unit_local_VAT_incl
				, price_unit_local_VAT_excl
				, price_unit_local_VAT_incl
				, created_by
                , created_on
				, id_change_set
			)
			SELECT
				t_MPOPL.id_order
				, t_MPOPL.id_permutation
				, t_MPOPL.id_unit_quantity
				, t_MPOPL.quantity_used
				, t_MPOPL.quantity_produced
				, t_MPOPL.id_unit_latency_manufacture
				, t_MPOPL.latency_manufacture
				, t_MPOPL.display_order
				, t_MPOPL.active
				, t_MPOPL.cost_unit_local_VAT_excl
				, t_MPOPL.cost_unit_local_VAT_incl
				, t_MPOPL.price_unit_local_VAT_excl
				, t_MPOPL.price_unit_local_VAT_incl
				, a_id_user
                , v_time_start
				, v_id_change_set
			FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
			WHERE t_MPOPL.is_new = 1
			;
		
			UPDATE partsltd_prod.Shop_Manufacturing_Purchase_Order MPO
			INNER JOIN tmp_Manufacturing_Purchase_Order t_MPO 
				ON MPO.id_order = t_MPO.id_order
				AND t_MPO.is_new = 0
			INNER JOIN tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL ON t_MPO.id_order = t_MPOPL.id_order
			SET
				MPO.id_currency = t_MPO.id_currency
				, MPO.cost_total_local_VAT_excl = t_MPO.cost_total_local_VAT_excl
				, MPO.cost_total_local_VAT_incl = t_MPO.cost_total_local_VAT_incl
				, MPO.price_total_local_VAT_excl = t_MPO.price_total_local_VAT_excl
				, MPO.price_total_local_VAT_incl = t_MPO.price_total_local_VAT_incl
				, MPO.active = t_MPO.active
				, MPO.id_change_set = v_id_change_set
			;
			
			UPDATE partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link MPOPL
			INNER JOIN tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
				ON MPOPL.id_link = t_MPOPL.id_link
				AND t_MPOPL.is_new = 0
			SET
				MPOPL.id_order = t_MPOPL.id_order
				, MPOPL.id_permutation = t_MPOPL.id_permutation
				, MPOPL.id_unit_quantity = t_MPOPL.id_unit_quantity
				, MPOPL.quantity_used = t_MPOPL.quantity_used
				, MPOPL.quantity_produced = t_MPOPL.quantity_produced
				, MPOPL.id_unit_latency_manufacture = t_MPOPL.id_unit_latency_manufacture
				, MPOPL.latency_manufacture = t_MPOPL.latency_manufacture
				, MPOPL.display_order = t_MPOPL.display_order
				, MPOPL.active = t_MPOPL.active
				, MPOPL.cost_unit_local_VAT_excl = t_MPOPL.cost_unit_local_VAT_excl
				, MPOPL.cost_unit_local_VAT_incl = t_MPOPL.cost_unit_local_VAT_incl
				, MPOPL.price_unit_local_VAT_excl = t_MPOPL.price_unit_local_VAT_excl
				, MPOPL.price_unit_local_VAT_incl = t_MPOPL.price_unit_local_VAT_incl
				, MPOPL.id_change_set = v_id_change_set
			;
		
			DELETE MPO_T
			FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Temp MPO_T
			WHERE MPO_T.GUID = a_guid
			;
			DELETE MPOPL_T
			FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp MPOPL_T
			WHERE MPOPL_T.GUID = a_guid
			;
			
		COMMIT;
    END IF;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
	INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
	;
    
	IF a_debug = 1 THEN
		SELECT * from tmp_Manufacturing_Purchase_Order;
		SELECT * from tmp_Manufacturing_Purchase_Order_Product_Link;
	END IF;

    DROP TEMPORARY TABLE tmp_Manufacturing_Purchase_Order;
    DROP TEMPORARY TABLE tmp_Manufacturing_Purchase_Order_Product_Link;
    DROP TEMPORARY TABLE tmp_Msg_Error;
    
	IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
	END IF;
END //
DELIMITER ;;


/*

DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;
DELETE FROM Shop_Manufacturing_Purchase_Order_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order;

INSERT INTO Shop_Manufacturing_Purchase_Order_Product_Link_Temp (
	guid,
    id_link,
    id_order,
	id_permutation,
	cost_total_local,
	id_currency,
	quantity_used,
	id_unit_quantity,
	quantity_produced,
	latency_manufacture,
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
		1, # id_currency,
		1, # quantity_used,
		1, # id_unit_quantity,
		1, # quantity_produced,
		14, # latency_manufacture ,
		1, # display_order
        1 # active
    )
;

SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

CALL p_shop_save_manufacturing_purchase_order (
	'TEST SAVE'
	, 'NIPS' # a_guid
    , 1 -- 'auth0|6582b95c895d09a70ba10fef', # a_id_user
	, 1 -- a_debug
);

SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;
DELETE FROM Shop_Manufacturing_Purchase_Order_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order;


*/

