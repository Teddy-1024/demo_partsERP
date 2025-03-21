-- USE demo;

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_product_price_and_discount_and_delivery_option;

DELIMITER //
CREATE PROCEDURE p_shop_get_many_product_price_and_discount_and_delivery_option (
	IN a_id_user INT
    , IN a_get_all_product_permutation BIT
	, IN a_get_inactive_product_permutation BIT
	, IN a_ids_product_permutation TEXT
    , IN a_get_all_product_price BIT
	, IN a_get_inactive_product_price BIT
	, IN a_ids_product_price TEXT
    , IN a_product_price_min FLOAT
    , IN a_product_price_max FLOAT
    , IN a_get_all_currency BIT
	, IN a_get_inactive_currency BIT
    , IN a_ids_currency VARCHAR(4000)
    , IN a_get_all_discount BIT
	, IN a_get_inactive_discount BIT
    , IN a_ids_discount TEXT
    , IN a_get_all_delivery_option BIT
	, IN a_get_inactive_delivery_option BIT
    , IN a_ids_delivery_option TEXT
    , IN a_get_all_delivery_region BIT
	, IN a_get_inactive_delivery_region BIT
    , IN a_ids_delivery_region TEXT
    , IN a_debug BIT
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_product_permutation BIT;
    DECLARE v_has_filter_product_price BIT;
    DECLARE v_has_filter_currency BIT;
    DECLARE v_has_filter_discount BIT;
    DECLARE v_has_filter_delivery_option BIT;
    DECLARE v_has_filter_delivery_region BIT;
    DECLARE v_guid BINARY(36);
    # DECLARE v_id_user VARCHAR(100);
    DECLARE v_ids_permutation_unavailable VARCHAR(4000);
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission VARCHAR(4000);
    -- DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    -- DECLARE v_now DATETIME;
    DECLARE v_id_minimum INT;
    DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');
    
    
	-- Argument validation + default values
    SET a_id_user := TRIM(IFNULL(a_id_user, ''));
	SET a_get_all_product_permutation := TRIM(IFNULL(a_get_all_product_permutation, 1));
	SET a_get_inactive_product_permutation := TRIM(IFNULL(a_get_inactive_product_permutation, 0));
	SET a_ids_product_permutation := TRIM(IFNULL(a_ids_product_permutation, ''));
	SET a_get_all_delivery_region := TRIM(IFNULL(a_get_all_delivery_region, 1));
	SET a_get_inactive_delivery_region := TRIM(IFNULL(a_get_inactive_delivery_region, 0));
	SET a_ids_delivery_region := TRIM(IFNULL(a_ids_delivery_region, ''));
	SET a_get_all_currency := TRIM(IFNULL(a_get_all_currency, 1));
	SET a_get_inactive_currency := TRIM(IFNULL(a_get_inactive_currency, 0));
	SET a_ids_currency := TRIM(IFNULL(a_ids_currency, ''));
	SET a_get_all_discount := TRIM(IFNULL(a_get_all_discount, 1));
	SET a_get_inactive_discount := TRIM(IFNULL(a_get_inactive_discount, 0));
	SET a_ids_discount := TRIM(IFNULL(a_ids_discount, ''));
    SET a_debug := IFNULL(a_debug, 0);
    
    IF a_debug = 1 THEN
		SELECT
			a_id_user
			, a_get_all_variation_type
			, a_get_inactive_variation_type
			, a_get_first_variation_type_only
			, a_ids_variation_type
			, a_get_all_variation
			, a_get_inactive_variation
			, a_get_first_variation_only
			, a_ids_variation
			, a_debug
		;
    END IF;
    
    -- Temporary tables
    DROP TEMPORARY TABLE IF EXISTS tmp_Discount;
    DROP TEMPORARY TABLE IF EXISTS tmp_Currency;
    DROP TEMPORARY TABLE IF EXISTS tmp_Delivery_Region;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Image;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Variation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product_2;
    DROP TEMPORARY TABLE IF EXISTS tmp_Category;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    
    CREATE TEMPORARY TABLE tmp_Category (
		id_category INT NOT NULL
        , display_order INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Product (
		id_category INT NOT NULL
		, id_product INT NOT NULL
        , display_order INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Permutation (
		id_permutation INT NULL
		, id_product INT NOT NULL
        , can_view BIT
        , can_edit BIT
        , can_admin BIT
    );
    
    CREATE TEMPORARY TABLE tmp_Price (
		id_price INT
        , id_permutation INT
    );
    
    CREATE TEMPORARY TABLE tmp_Currency (
		id_currency INT NOT NULl
        /*
        active BIT NOT NULL
        display_order INT NOT NULL
        */
    );
    
    CREATE TEMPORARY TABLE tmp_Discount (
		id_discount INT NOT NULL
        /*
        active BIT NOT NULL,
        display_order INT NOT NULL
        */
    );
    
    CREATE TEMPORARY TABLE tmp_Delivery_Option (
		id_option INT NOT NULL
        /*
        active BIT NOT NULL,
        display_order INT NOT NULL,
        requires_delivery_option BIT NOT NULL DEFAULT 0
        */
    );
    
    CREATE TEMPORARY TABLE tmp_Delivery_Region (
		id_region INT NOT NULL
        /*
        active BIT NOT NULL,
        display_order INT NOT NULL,
        requires_delivery_option BIT NOT NULL DEFAULT 0
        */
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        -- guid BINARY(36) NOT NULL,
		id_type INT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Split (
		substring VARCHAR(4000) NOT NULL
        , as_int INT NULL
	);
    DELETE FROM tmp_Split;
    
    
    -- Parse filters
    SET v_has_filter_product_permutation = CASE WHEN a_ids_product_permutation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_product_price = CASE WHEN a_ids_product_price = '' THEN 0 ELSE 1 END;
    SET v_has_filter_currency = CASE WHEN a_ids_currency = '' THEN 0 ELSE 1 END;
    SET v_has_filter_discount = CASE WHEN a_ids_discount = '' THEN 0 ELSE 1 END;
    SET v_has_filter_delivery_option = CASE WHEN a_ids_delivery_option = '' THEN 0 ELSE 1 END;
    SET v_has_filter_delivery_region = CASE WHEN a_ids_delivery_region = '' THEN 0 ELSE 1 END;

	IF a_debug = 1 THEN
		SELECT
            v_has_filter_product_permutation
            , v_has_filter_product_price
            , v_has_filter_currency
            , v_has_filter_discount
            , v_has_filter_delivery_option
            , v_has_filter_delivery_region
		;
    END IF;
    
    CALL demo.p_shop_calc_product_permutation (
		a_id_user
		, 1 -- a_get_all_product_category
		, 0 -- a_get_inactive_product_category
		, '' -- a_ids_product_category
		, 1 -- a_get_all_product
		, 0 -- a_get_inactive_product
		, '' -- a_ids_product
		, a_get_all_product_permutation
		, a_get_inactive_product_permutation
		, a_ids_product_permutation
		, 0 
		, v_guid -- a_guid
		, 0 -- a_debug 
    );
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		INSERT INTO tmp_Category (
			id_category
			, display_order
		)
		SELECT 
			PC.id_category
			, PC.display_order
		FROM (SELECT * FROM demo.Shop_Product_Category_Temp WHERE GUID = v_guid) PC_T 
		INNER JOIN demo.Shop_Product_Category PC ON PC_T.id_category = PC.id_category
		;
		
		INSERT INTO tmp_Product (
			id_product
			, id_category
			, display_order
		)
		SELECT 
			P.id_product
			, P.id_category
			, P.display_order
		FROM (SELECT * FROM demo.Shop_Product_Temp WHERE GUID = v_guid) P_T 
		INNER JOIN demo.Shop_Product P ON P.id_product = P_T.id_product
		;
		
		INSERT INTO tmp_Permutation (
			id_permutation
			, id_product
            , can_view
            , can_edit
            , can_admin
		)
		SELECT 
			PP.id_permutation
			, PP.id_product
            , PP_T.can_view
            , PP_T.can_edit
            , PP_T.can_admin
		FROM (SELECT * FROM demo.Shop_Product_Permutation_Temp WHERE GUID = v_guid) PP_T
		INNER JOIN demo.Shop_Product_Permutation PP ON PP_T.id_permutation = PP.id_permutation
		;
    
    # Product Prices
		CALL demo.p_split(v_guid, a_ids_product_price, ',', a_debug);
        
        DELETE FROM tmp_Split;
		
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
            LEFT JOIN demo.Shop_Product_Price PRICE ON t_S.as_int = PRICE.id_price
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(PRICE.id_price)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- v_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive product price IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN demo.Shop_Product_Price PRICE ON t_S.as_int = PRICE.id_price
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(PRICE.id_price)
			;
		ELSE
			INSERT INTO tmp_Price (
				id_price
                , id_permutation
			)
			SELECT 
				PRICE.id_price
                , PRICE.id_permutation
			FROM tmp_Split t_S
			RIGHT JOIN demo.Shop_Product_Price PRICE ON t_S.as_int = PRICE.id_price
            INNER JOIN tmp_Permutation t_PP ON SI.id_permutation = t_PP.id_permutation
			WHERE 
				(
					a_get_all_stock_item = 1
					OR (
						v_has_filter_stock_item = 1
						AND NOT ISNULL(t_S.as_int)
					)
				)
				AND (
					a_get_inactive_stock_item = 1
					OR SI.active = 1
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    
	INSERT INTO tmp_Shop_Product (
		id_permutation,
		active_permutation,
        display_order_permutation
	)
    SELECT 
		PP.id_permutation,
		PP.active AS active_permutation,
		PP.display_order AS display_order_permutation
	FROM Shop_Product P
    INNER JOIN Shop_Product_Permutation PP
		ON P.id_product = PP.id_product
	INNER JOIN Shop_Product_Category C
		ON P.id_category = C.id_category
	WHERE
		# permutations
		(
			a_get_all_product_permutation 
			OR (
				v_has_filter_product_permutation 
				AND FIND_IN_SET(PP.id_permutation, a_ids_product_permutation) > 0
			)
			OR (
				a_get_products_quantity_stock_below_min = 1
				AND PP.quantity_stock < PP.quantity_min
			)
		)
		AND (
			a_get_inactive_product_permutation 
			OR PP.active
		)
    ;
    
    # Delivery Regions
    INSERT INTO tmp_Delivery_Region (
		id_region,
        active,
        display_order,
		requires_delivery_option
    )
    WITH RECURSIVE Recursive_CTE_Delivery_Region AS (
		SELECT 
			DR.id_region AS id_region_parent,
            NULL AS id_region_child,
            CASE WHEN FIND_IN_SET(DR.id_region, a_ids_delivery_region) > 0 THEN 1 ELSE 0 END AS requires_delivery_option
		FROM Shop_Product_Currency_Region_Link PCRL
		INNER JOIN Shop_Currency C ON PCRL.id_currency = C.id_currency
		INNER JOIN tmp_Shop_Product t_P 
			ON PCRL.id_product <=> t_P.id_product
			AND PCRL.id_permutation <=> t_P.id_permutation
		INNER JOIN Shop_Region DR ON PCRL.id_region_purchase = DR.id_region
		WHERE 
			(
				a_get_all_delivery_region
				OR FIND_IN_SET(DR.id_region, a_ids_delivery_region) > 0
			)
			AND (
				a_get_inactive_delivery_region
				OR DR.active = 1
			)
		UNION
        SELECT 
			DRB.id_region_parent,
			DRB.id_region_child,
            0 AS requires_delivery_option
		FROM Shop_Region_Branch DRB
        INNER JOIN Recursive_CTE_Delivery_Region r_DR 
			ON DRB.id_region_parent = r_DR.id_region_child
            AND (
				a_get_inactive_delivery_region
                OR DRB.active = 1
            )
	)
    SELECT
		DR.id_region,
        DR.active,
        DR.display_order,
		requires_delivery_option
	FROM Shop_Region DR
    INNER JOIN Recursive_CTE_Delivery_Region r_DR 
		ON DR.id_region = r_DR.id_region_parent
		OR DR.id_region = r_DR.id_region_child
    ;
    /*
    select * from tmp_delivery_region;
    SELECT * 
	FROM tmp_Shop_Product t_P 
	WHERE 
		*(
			a_get_all_category 
			OR a_get_all_product
			OR a_get_all_product_permutation
		)*
		FIND_IN_SET(t_P.id_category, a_ids_category) > 0
		OR FIND_IN_SET(t_P.id_product, a_ids_product) > 0
		OR FIND_IN_SET(t_P.id_permutation, a_ids_product_permutation) > 0
	;
    */
    
    IF v_has_filter_delivery_region THEN
		SET v_ids_permutation_unavailable = (
			SELECT GROUP_CONCAT(t_P.id_permutation SEPARATOR ', ')
			FROM (
				SELECT * 
				FROM tmp_Shop_Product t_P 
				WHERE
					/*(
						a_get_all_category 
						OR a_get_all_produc
						OR a_get_all_product_permutation
					)*/
					FIND_IN_SET(t_P.id_category, a_ids_category) > 0
					OR FIND_IN_SET(t_P.id_product, a_ids_product) > 0
					OR FIND_IN_SET(t_P.id_permutation, a_ids_product_permutation) > 0
			) t_P
			LEFT JOIN (
				SELECT *
				FROM Shop_Product_Currency_Region_Link PCRL
				WHERE 
					(
						a_get_all_delivery_region
						OR FIND_IN_SET(PCRL.id_region_purchase, a_ids_delivery_region) > 0
					)
			) PCRL
				ON t_P.id_product <=> PCRL.id_product
				AND t_P.id_permutation <=> PCRL.id_permutation
			LEFT JOIN tmp_Delivery_Region t_DR
				ON PCRL.id_region_purchase = t_DR.id_region
				AND t_DR.requires_delivery_option = 1
			WHERE 
				ISNULL(t_DR.id_region)
		);
        IF NOT ISNULL(v_ids_permutation_unavailable) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				id_type,
                code,
				msg
			)
			VALUES (
				v_guid,
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'PRODUCT_AVAILABILITY' LIMIT 1),
                'PRODUCT_AVAILABILITY',
				CONCAT('Error: The following permutation IDs are not available in this region: ', IFNULL(v_ids_permutation_unavailable, 'NULL'))
			);
        END IF;
        /*
		DELETE FROM tmp_Shop_Product t_P
        WHERE t_P.id_permutation NOT IN (
			SELECT
				id_permutation
			FROM Shop_Product_Currency_Region_Link PCL
            INNER JOIN tmp_Delivery_Region t_DR
				ON PCRL.id_region_purchase = t_DR.id_region
		);
        */
    END IF;
    
    -- select * from tmp_Shop_Product;
    
    # Currencies
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid) THEN
		INSERT INTO tmp_Currency (
			id_currency,
			active,
			display_order
		)
		SELECT
			C.id_currency,
			C.active,
			C.display_order
		FROM Shop_Product_Currency_Region_Link PCRL
		INNER JOIN Shop_Currency C ON PCRL.id_currency = C.id_currency
		INNER JOIN tmp_Shop_Product t_P 
			ON PCRL.id_product <=> t_P.id_product
			AND PCRL.id_permutation <=> t_P.id_permutation
		INNER JOIN tmp_Delivery_Region t_DR ON PCRL.id_region_purchase = t_DR.id_region
		WHERE
			(
				a_get_all_currency
				OR FIND_IN_SET(C.id_currency, a_ids_currency) > 0
			)
			AND (
				a_get_inactive_currency
				OR (
					C.active
					AND PCRL.active
				)
			)
		;
		
		-- select * from tmp_Currency;
		
		IF v_has_filter_currency THEN
			SET v_ids_permutation_unavailable = (
				SELECT GROUP_CONCAT(t_P.id_permutation SEPARATOR ', ')
				FROM (
					SELECT * 
					FROM tmp_Shop_Product t_P 
					WHERE 
						/*(
							a_get_all_category 
							OR a_get_all_product
							OR a_get_all_product_permutation
						)*/
						FIND_IN_SET(t_P.id_category, a_ids_category) > 0
						OR FIND_IN_SET(t_P.id_product, a_ids_product) > 0
						OR FIND_IN_SET(t_P.id_permutation, a_ids_product_permutation) > 0
				) t_P
				INNER JOIN (
					SELECT *
					FROM Shop_Product_Currency_Region_Link PCRL
					WHERE 
						(
							a_get_all_currency
							OR FIND_IN_SET(PCRL.id_currency, a_ids_currency) > 0
						)
				) PCRL
					ON t_P.id_permutation = PCRL.id_permutation
				LEFT JOIN tmp_Currency t_C
					ON PCRL.id_currency = t_C.id_currency
				WHERE ISNULL(t_C.id_currency) 
			);
			IF NOT ISNULL(v_ids_permutation_unavailable) THEN
				INSERT INTO tmp_Msg_Error (
					guid,
					id_type,
                    code,
					msg
				)
				VALUES (
					v_guid,
					(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'PRODUCT_AVAILABILITY' LIMIT 1),
					'PRODUCT_AVAILABILITY',
					CONCAT('Error: The following permutation IDs are not available in this currency: ', IFNULL(v_ids_permutation_unavailable, 'NULL'))
				);
			END IF;
			/*
			DELETE FROM tmp_Shop_Product t_P
			WHERE t_P.id_permutation NOT IN (
				SELECT
					id_permutation
				FROM Shop_Product_Currency_Region_Link PCL
				INNER JOIN tmp_Currency t_C
					ON PCRL.id_currency = t_C.id_currency
			);
			*/
		END IF;
    END IF;
    
    # Discounts
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid) THEN
		INSERT INTO tmp_Discount (
			id_discount,
			active,
			display_order
		)
		SELECT
			D.id_discount,
			D.active,
			D.display_order
		FROM Shop_Discount D
		INNER JOIN tmp_Shop_Product t_P
			ON D.id_product = t_P.id_product
			AND D.id_permutation <=> t_P.id_permutation
		WHERE
			(
				a_get_all_discount
				OR FIND_IN_SET(D.id_discount, a_ids_discount) > 0
			)
			AND (
				a_get_inactive_discount
				OR D.active
			)
		;
    END IF;
    # select 'pre-permission results';
    # select * from tmp_Shop_Product;
    
    -- Permissions
    IF EXISTS (SELECT * FROM tmp_Shop_Product_Category LIMIT 1) THEN
        # SET v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER());
        SET v_id_permission_product := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
        SET v_ids_product_permission := (SELECT GROUP_CONCAT(id_product SEPARATOR ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_product));
        -- SET v_ids_permutation_permission := (SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission;
        -- select * from Shop_Calc_User_Temp;
        
        CALL p_shop_calc_user(v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission);
        
        -- select * from Shop_Calc_User_Temp;
        
        UPDATE tmp_Shop_Product t_P
        INNER JOIN Shop_Calc_User_Temp UE_T
			ON t_P.id_product = UE_T.id_product
			AND UE_T.GUID = v_guid
        SET t_P.can_view = UE_T.can_view,
			t_P.can_edit = UE_T.can_edit,
            t_P.can_admin = UE_T.can_admin
		;
		-- select * from Shop_Calc_User_Temp;
		-- select * from tmp_Shop_Product;
        
        DELETE t_P
        FROM tmp_Shop_Product t_P
		WHERE 
			FIND_IN_SET(t_P.id_product, (SELECT GROUP_CONCAT(UET.id_product SEPARATOR ',') FROM Shop_Calc_User_Temp UET)) = 0 # id_product NOT LIKE CONCAT('%', (SELECT GROUP_CONCAT(id_product SEPARATOR '|') FROM Shop_Calc_User_Temp), '%');
            OR (
				ISNULL(t_P.can_view)
				AND (
					NOT v_has_filter_category
                    OR FIND_IN_SET(t_P.id_category, a_ids_category) = 0
				)
                AND (
					NOT v_has_filter_product
                    OR FIND_IN_SET(t_P.id_product, a_ids_product) = 0
                )
                AND (
					NOT v_has_filter_product_permutation 
                    OR FIND_IN_SET(t_P.id_permutation, a_ids_product_permutation) = 0
				)
            )
        ;
        
        CALL p_shop_clear_calc_user(v_guid);
        # DROP TABLE IF EXISTS Shop_Calc_User_Temp;
        /*
        DELETE FROM Shop_Calc_User_Temp UE_T
        WHERE UE_T.GUID = v_guid
        ;
        */
    END IF;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns
    -- SET v_now := NOW();
    
    # Categories
    SELECT 
		DISTINCT t_C.id_category,
        C.name,
        C.description,
        C.display_order
    FROM tmp_Shop_Product_Category t_C
    INNER JOIN Shop_Product_Category C
		ON t_C.id_category = C.id_category
	INNER JOIN tmp_Shop_Product t_P
		ON t_C.id_category = t_P.id_category
	ORDER BY C.display_order
	;
    
    # Products
    SELECT 
		t_P.id_product,
		t_P.id_permutation,
        t_P.name,
        t_P.description,
        P.has_variations,
        P.id_category,
        PP.cost_local,
        PP.id_currency_cost,
        CURRENCY.code AS code_currency_cost,
        CURRENCY.symbol AS symbol_currency_cost,
        PP.profit_local_min,
        t_P.latency_manufacture,
        t_P.quantity_min,
        t_P.quantity_max,
        t_P.quantity_step,
        t_P.quantity_stock,
        t_P.id_stripe_product,
        t_P.is_subscription,
        UM.name_singular AS name_interval_recurrence,
        UM.name_plural AS name_plural_interval_recurrence,
        PP.count_interval_recurrence,
        t_P.display_order_category,
        t_P.display_order_product,
        t_P.display_order_permutation,
        IFNULL(t_P.can_view, 0) AS can_view,
        IFNULL(t_P.can_edit, 0) AS can_edit,
        IFNULL(t_P.can_admin, 0) AS can_admin
    FROM tmp_Shop_Product t_P
    INNER JOIN Shop_Product P ON t_P.id_product = P.id_product
    INNER JOIN Shop_Product_Permutation PP ON t_P.id_permutation = PP.id_permutation
	-- LEFT JOIN Shop_Interval_Recurrence RI ON t_P.id_unit_measurement_interval_recurrence = RI.id_interval
	LEFT JOIN Shop_Unit_Measurement UM ON PP.id_unit_measurement_interval_recurrence = UM.id_unit_measurement
    INNER JOIN Shop_Currency CURRENCY ON PP.id_currency_cost = CURRENCY.id_currency
	ORDER BY t_P.rank_permutation
	;
    
    # Variations
    SELECT 
		V.id_variation
        , V.code AS code_variation
        , V.name AS name_variation
        , V.active AS active_variation
		, V.display_order
        , V.id_type
        , VT.code AS code_variation_type
        , VT.name AS name_variation_type
        , VT.name_plural AS name_plural_variation_type
        , VT.active AS active_variation_type
		, VT.display_order
        , t_P.id_product
        , t_P.id_permutation
        , t_P.id_category
    FROM Shop_Variation V
	INNER JOIN Shop_Variation_Type VT ON V.id_type = VT.id_type
    INNER JOIN Shop_Product_Permutation_Variation_Link PPVL ON V.id_variation = PPVL.id_variation
	INNER JOIN tmp_Shop_Product t_P ON PPVL.id_permutation <=> t_P.id_permutation
	WHERE V.active
		AND PPVL.active
	;
    
    /*
    # Permutation variations output
	SELECT t_P.id_permutation, 
		t_P.id_product,
		t_P.id_category,
		id_variation
	FROM Shop_Product_Permutation_Variation_Link PPVL
	INNER JOIN tmp_Shop_Product t_P
		ON t_P.id_permutation = PPVL.id_permutation
	ORDER BY t_P.display_order
	;
    */
    -- select * from Shop_Product_Currency_Region_Link;
    -- select * from shop_currency;
    /*
    select * from tmp_Currency;
    select * from tmp_delivery_region;
    select * from tmp_shop_product;
    */
    
    # Product Price
	SELECT 
		PCRL.id_link AS id_price,
        t_P.id_permutation, 
		t_P.id_product,
		t_P.id_category,
        t_C.id_currency,
        C.code AS code_currency,
        C.name AS name_currency,
        C.symbol AS symbol_currency,
        t_DR.id_region,
		PCRL.price_local_VAT_incl,
		PCRL.price_local_VAT_excl,
        ROW_NUMBER() OVER(ORDER BY t_P.rank_permutation, C.display_order) AS display_order
	FROM Shop_Product_Currency_Region_Link PCRL
	INNER JOIN tmp_Shop_Product t_P
		ON PCRL.id_product <=> t_P.id_product
		AND PCRL.id_permutation <=> t_P.id_permutation
	-- INNER JOIN Shop_Product P ON PCRL.id_product = P.id_product
	INNER JOIN tmp_Currency t_C ON PCRL.id_currency = t_C.id_currency
	INNER JOIN Shop_Currency C ON t_C.id_currency = C.id_currency
	INNER JOIN tmp_Delivery_Region t_DR ON PCRL.id_region_purchase = t_DR.id_region
    WHERE (
        a_get_inactive_product 
        AND a_get_inactive_product_permutation
        AND a_get_inactive_currency
        AND a_get_inactive_delivery_region
        OR PCRL.active
	)
	ORDER BY t_P.rank_permutation
	;
    
    /*
    # Currency
	SELECT
		DISTINCT C.id_currency,
        C.code,
        C.name,
        C.factor_from_GBP,
        t_C.display_order
	FROM Shop_Currency C
    INNER JOIN tmp_Currency t_C ON C.id_currency = t_C.id_currency
    GROUP BY C.id_currency, t_C.display_order
	ORDER BY t_C.display_order
	;
    */
    
    # Images
    SELECT 
		t_I.id_image,
        t_I.id_product,
		t_I.id_permutation,
        t_P.id_category,
        I.url,
        I.active,
        I.display_order
    FROM tmp_Shop_Image t_I
    INNER JOIN Shop_Product_Image I
		ON t_I.id_image = I.id_image
	INNER JOIN tmp_Shop_Product t_P
		ON t_I.id_product = t_P.id_product
			AND t_I.id_permutation <=> t_P.id_permutation
	ORDER BY t_P.rank_permutation, I.display_order
	;
    
    # Delivery options
    SELECT 
		_DO.id_option,
		PDOL.id_product,
		PDOL.id_permutation,
		t_P.id_category,
		_DO.code,
		_DO.name,
		_DO.latency_delivery_min,
		_DO.latency_delivery_max,
		_DO.quantity_min,
		_DO.quantity_max,
		GROUP_CONCAT(DR.code SEPARATOR ',') AS codes_region,
		GROUP_CONCAT(DR.name SEPARATOR ',') AS names_region,
		PDOL.price_local,
		PDOL.display_order
	FROM Shop_Delivery_Option _DO
    INNER JOIN Shop_Product_Permutation_Delivery_Option_Link PDOL
		ON _DO.id_option = PDOL.id_delivery_option
		AND (
			a_get_inactive_delivery_region
			OR PDOL.active
		)
	INNER JOIN tmp_Shop_Product t_P
		ON PDOL.id_product = t_P.id_product
		AND PDOL.id_permutation <=> t_P.id_permutation
	INNER JOIN tmp_Delivery_Region t_DR ON PDOL.id_region = t_DR.id_region
	INNER JOIN Shop_Region DR ON t_DR.id_region = DR.id_region
	WHERE (
		a_get_inactive_delivery_region
		OR _DO.active
	)
	GROUP BY t_P.id_category, t_P.id_product, PDOL.id_permutation, t_P.rank_permutation, DR.id_region, _DO.id_option, PDOL.id_link
	ORDER BY t_P.rank_permutation, PDOL.display_order
	;
    
    # Discounts
    SELECT 
		D.id_discount,
		P.id_category,
		D.id_product,
		D.id_permutation,
        DR.id_region,
        C.id_currency,
		D.code AS code_discount,
		D.name AS name_discount,
		D.multiplier,
        D.subtractor,
        D.apply_multiplier_first,
		D.quantity_min,
		D.quantity_max,
		D.date_start,
		D.date_end,
        GROUP_CONCAT(DR.code) AS codes_region,
        GROUP_CONCAT(DR.name) AS names_region,
        GROUP_CONCAT(C.code) AS codes_currency,
        GROUP_CONCAT(C.name) AS names_currency,
		ROW_NUMBER() OVER(ORDER BY D.display_order) AS display_order
	FROM tmp_Discount t_D
    INNER JOIN Shop_Discount D ON t_D.id_discount = D.id_discount
    INNER JOIN Shop_Product P ON D.id_product = P.id_product
	INNER JOIN tmp_Shop_Product t_P
		ON D.id_product = t_P.id_product
		-- AND D.id_permutation <=> t_P.id_permutation
	INNER JOIN Shop_Discount_Region_Currency_Link DRCL
		ON D.id_discount = DRCL.id_discount
	INNER JOIN tmp_Delivery_Region t_DR ON DRCL.id_region = t_DR.id_region
	INNER JOIN Shop_Region DR ON t_DR.id_region = DR.id_region
	INNER JOIN tmp_Currency t_C ON DRCL.id_currency = t_C.id_currency
	INNER JOIN Shop_Currency C ON t_C.id_currency = C.id_currency
    GROUP BY D.id_discount, DR.id_region, C.id_currency
    ORDER BY D.display_order, DR.display_order, C.display_order
	;
    
    /*
    # Delivery Regions
    SELECT 
		t_DR.id_region,
		t_P.id_category,
		t_P.id_product,
		t_P.id_permutation,
		DR.code,
		DR.name
	FROM tmp_Delivery_Region t_DR
    INNER JOIN Shop_Delivery_Region DR ON t_DR.id_region = DR.id_region
	INNER JOIN Shop_Product_Region_Currency_Link PDRL 
		ON DR.id_region = PDRL.id_region 
        AND (
			a_get_inactive_delivery_region 
            OR PDRL.active
		)
	INNER JOIN tmp_Shop_Product t_P
		ON PDRL.id_product = t_P.id_product
		AND PDRL.id_permutation <=> t_P.id_permutation
	INNER JOIN tmp_Currency t_C ON PDRL.id_currency = t_C.id_currency
	ORDER BY t_DR.display_order
	;
    */
    
    # Errors
    SELECT 
        *
    FROM tmp_Msg_Error t_ME
    INNER JOIN Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
    -- WHERE guid = v_guid
    ;
    
    
    -- Clean up
    DROP TEMPORARY TABLE IF EXISTS tmp_Discount;
    DROP TEMPORARY TABLE IF EXISTS tmp_Currency;
    DROP TEMPORARY TABLE IF EXISTS tmp_Delivery_Region;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Image;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Variation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product_2;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product_Category;
    DROP TEMPORARY TABLE IF EXISTS tmp_Category;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    
    
	CALL demo.p_shop_clear_calc_product_permutation ( v_guid );
    
    IF a_debug = 1 THEN
		CALL demo.p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;


/*

CALL demo.p_shop_get_many_product_price_and_discount_and_delivery_option (
	IN a_id_user INT,
    IN a_get_all_product_permutation BIT,
	IN a_get_inactive_product_permutation BIT,
	IN a_ids_product_permutation VARCHAR(4000),
    IN a_get_all_delivery_region BIT,
	IN a_get_inactive_delivery_region BIT,
    IN a_ids_delivery_region VARCHAR(4000),
    IN a_get_all_currency BIT,
	IN a_get_inactive_currency BIT,
    IN a_ids_currency VARCHAR(4000),
    IN a_get_all_discount BIT,
	IN a_get_inactive_discount BIT,
    IN a_ids_discount VARCHAR(4000)
);

select * FROM Shop_Calc_User_Temp;

select * from Shop_Product_Permutation;
select * from shop_product_change_set;
insert into shop_product_change_set ( comment ) values ('set stock quantities below minimum for testing');
update shop_product_permutation
set quantity_stock = 0,
	id_change_set = (select id_change_set from shop_product_change_set order by id_change_set desc limit 1)
where id_permutation < 5

DROP TABLE IF EXISTS tmp_Msg_Error;

select * from shop_image;
select * from shop_product;
select * from TMP_MSG_ERROR;
DROP TABLE TMP_MSG_ERROR;

insert into shop_product_change_set (comment)
    values ('set product not subscription - test bool output to python');
    update shop_product
    set is_subscription = 0,
		id_change_set = (select id_change_set from shop_product_change_set order by id_change_set desc limit 1)
    where id_product = 1

select * FROM Shop_Calc_User_Temp;
select distinct guid 
-- DELETE
FROM Shop_Calc_User_Temp;
*/
