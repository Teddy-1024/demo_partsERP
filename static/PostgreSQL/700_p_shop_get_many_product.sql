

CREATE OR REPLACE FUNCTION p_shop_get_many_product (
	IN a_id_user INTEGER,
    IN a_get_all_category BOOLEAN,
	IN a_get_inactive_category BOOLEAN,
    IN a_get_first_category_only BOOLEAN,
	IN a_ids_category INTEGER[],
    IN a_get_all_product BOOLEAN,
	IN a_get_inactive_product BOOLEAN,
    IN a_get_first_product_only BOOLEAN,
	IN a_ids_product INTEGER[],
    IN a_get_all_product_permutation BOOLEAN,
	IN a_get_inactive_permutation BOOLEAN,
    IN a_get_first_permutation_only BOOLEAN,
	IN a_ids_permutation INTEGER[],
    IN a_get_all_image BOOLEAN,
	IN a_get_inactive_image BOOLEAN,
    IN a_get_first_image_only BOOLEAN,
    IN a_ids_image INTEGER[],
    IN a_get_all_delivery_region BOOLEAN,
	IN a_get_inactive_delivery_region BOOLEAN,
    IN a_ids_delivery_region INTEGER[],
    IN a_get_all_currency BOOLEAN,
	IN a_get_inactive_currency BOOLEAN,
    IN a_ids_currency INTEGER[],
    IN a_get_all_discount BOOLEAN,
	IN a_get_inactive_discount BOOLEAN,
    IN a_ids_discount INTEGER[]
)
RETURNS SETOF REFCURSOR -- categories, SETOF products, SETOF variations, SETOF prices, SETOF images, SETOF delivery_options, SETOF discounts
AS $$
DECLARE
	v_id_user INTEGER;
	v_get_all_category BOOLEAN;
	v_get_inactive_category BOOLEAN;
	v_get_first_category_only BOOLEAN;
	v_ids_category INTEGER[];
	v_get_all_product BOOLEAN;
	v_get_inactive_product BOOLEAN;
	v_get_first_product_only BOOLEAN;
	v_ids_product INTEGER[];
	v_get_all_product_permutation BOOLEAN;
	v_get_inactive_permutation BOOLEAN;
	v_get_first_permutation_only BOOLEAN;
	v_ids_permutation INTEGER[];
	v_get_all_image BOOLEAN;
	v_get_inactive_image BOOLEAN;
	v_get_first_image_only BOOLEAN;
	v_ids_image INTEGER[];
	v_get_all_delivery_region BOOLEAN;
	v_get_inactive_delivery_region BOOLEAN;
	v_ids_delivery_region INTEGER[];
	v_get_all_currency BOOLEAN;
	v_get_inactive_currency BOOLEAN;
	v_ids_currency INTEGER[];
	v_get_all_discount BOOLEAN;
	v_get_inactive_discount BOOLEAN;
	v_ids_discount INTEGER[];

    v_has_filter_category BOOLEAN;
    v_has_filter_product BOOLEAN;
    v_has_filter_permutation BOOLEAN;
    v_has_filter_image BOOLEAN;
    v_has_filter_delivery_region BOOLEAN;
    v_has_filter_currency BOOLEAN;
    v_has_filter_discount BOOLEAN;
    v_guid UUID;
    -- v_id_user VARCHAR(100);
    v_ids_permutation_unavailable VARCHAR(4000);
    v_id_permission_product INTEGER;
    v_ids_product_permission VARCHAR(4000);
    -- v_ids_permutation_permission VARCHAR(4000);
    v_id_access_level_view INTEGER;
    -- v_now TIMESTAMP;
    v_id_minimum INTEGER;

	result_categories REFCURSOR;
	result_products REFCURSOR;
	result_variations REFCURSOR;
	result_prices REFCURSOR;
	result_images REFCURSOR;
	result_delivery_options REFCURSOR;
	result_discounts REFCURSOR;
	/*
	-- result_errors REFCURSOR;
	*/
BEGIN
	v_id_user := a_id_user;
	v_get_all_category := COALESCE(a_get_all_category, FALSE);
	v_get_inactive_category := COALESCE(a_get_inactive_category, FALSE);
	v_get_first_category_only := COALESCE(a_get_first_category_only, TRUE);
	v_ids_category := COALESCE(a_ids_category, ARRAY[]::INTEGER[]);
	v_get_all_product := COALESCE(a_get_all_product, FALSE);
	v_get_inactive_product := COALESCE(a_get_inactive_product, FALSE);
	v_get_first_product_only := COALESCE(a_get_first_product_only, TRUE);
	v_ids_product := COALESCE(a_ids_product, ARRAY[]::INTEGER[]);
	v_get_all_product_permutation := COALESCE(a_get_all_product_permutation, FALSE);
	v_get_inactive_permutation := COALESCE(a_get_inactive_permutation, FALSE);
	v_get_first_permutation_only := COALESCE(a_get_first_permutation_only, TRUE);
	v_ids_permutation := COALESCE(a_ids_permutation, ARRAY[]::INTEGER[]);
	v_get_all_image := COALESCE(a_get_all_image, TRUE);
	v_get_inactive_image := COALESCE(a_get_inactive_image, FALSE);
	v_get_first_image_only := COALESCE(a_get_first_image_only, FALSE);
	v_ids_image := COALESCE(a_ids_image, ARRAY[]::INTEGER[]);
	v_get_all_delivery_region := COALESCE(a_get_all_delivery_region, TRUE);
	v_get_inactive_delivery_region := COALESCE(a_get_inactive_delivery_region, FALSE);
	v_ids_delivery_region := COALESCE(a_ids_delivery_region, ARRAY[]::INTEGER[]);
	v_get_all_currency := COALESCE(a_get_all_currency, TRUE);
	v_get_inactive_currency := COALESCE(a_get_inactive_currency, FALSE);
	v_ids_currency := COALESCE(a_ids_currency, ARRAY[]::INTEGER[]);
	v_get_all_discount := COALESCE(a_get_all_discount, TRUE);
	v_get_inactive_discount := COALESCE(a_get_inactive_discount, FALSE);
	v_ids_discount := COALESCE(a_ids_discount, ARRAY[]::INTEGER[]);
	/* 
	ROLLBACK;
	*/
    v_guid := gen_random_uuid();
    v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');

    v_has_filter_category = (CARDINALITY(v_ids_category) > 0);
    v_has_filter_product = (CARDINALITY(v_ids_product) > 0);
    v_has_filter_permutation = (CARDINALITY(v_ids_permutation) > 0);
    v_has_filter_image = (CARDINALITY(v_ids_image) > 0);
    v_has_filter_delivery_region = (CARDINALITY(v_ids_delivery_region) > 0);
    v_has_filter_currency = (CARDINALITY(v_ids_currency) > 0);
    v_has_filter_discount = (CARDINALITY(v_ids_discount) > 0);
    
    /*
    SELECT v_id_user, v_get_all_category, v_ids_category, v_get_inactive_category, v_get_all_product, 
    v_ids_product, v_get_inactive_product, v_get_first_product_only, v_get_all_product_permutation, v_ids_permutation, 
    v_get_inactive_permutation, v_get_all_image, v_ids_image, v_get_inactive_image, v_get_first_image_only, 
    v_get_all_delivery_region, v_ids_delivery_region, v_get_inactive_delivery_region, v_get_all_currency, v_ids_currency, 
    v_get_inactive_currency, v_get_all_discount, v_ids_discount, v_get_inactive_discount
    ;
    */
    
    -- Temporary tables
	/*
    DROP TEMPORARY TABLE IF EXISTS tmp_Discount;
    DROP TEMPORARY TABLE IF EXISTS tmp_Currency;
    DROP TEMPORARY TABLE IF EXISTS tmp_Delivery_Region;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Image;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Variation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product_Category;
	*/
    DROP TABLE IF EXISTS tmp_Discount;
    DROP TABLE IF EXISTS tmp_Currency;
    DROP TABLE IF EXISTS tmp_Delivery_Region;
    DROP TABLE IF EXISTS tmp_Shop_Image;
    DROP TABLE IF EXISTS tmp_Shop_Variation;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_Product_Category;
    
    CREATE TEMPORARY TABLE tmp_Shop_Product_Category (
		id_category INTEGER NOT NULL,
		/*
        CONSTRAINT FK_tmp_Shop_Product_Category_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Product_Category(id_category),
		*/
        active BOOLEAN NOT NULL,
        display_order INTEGER NOT NULL, 
        can_view BOOLEAN, 
        can_edit BOOLEAN, 
        can_admin BIT
    );
    
    CREATE TEMPORARY TABLE tmp_Shop_Product (
		id_category INTEGER NOT NULL,
		/*
        CONSTRAINT FK_tmp_Shop_Product_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Product_Category(id_category),
		*/
		id_product INTEGER NOT NULL,
		/*
        CONSTRAINT FK_tmp_Shop_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		*/
		-- product_has_variations BOOLEAN NOT NULL,
		id_permutation INTEGER NULL,
		/*
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
		*/
        active_category BOOLEAN NOT NULL,
        active_product BOOLEAN NOT NULL,
        active_permutation BOOLEAN NULL,
        display_order_category INTEGER NOT NULL, 
        display_order_product INTEGER NOT NULL, 
        display_order_permutation INTEGER NULL, 
        -- rank_permutation INTEGER NOT NULL, -- _in_category
		rank_category INTEGER NOT NULL,
		rank_product INTEGER NOT NULL,
		rank_permutation INTEGER NOT NULL,
        name VARCHAR(255) NOT NULL,
        description VARCHAR(4000) NOT NULL,
		/*
        price_GBP_full REAL NOT NULL,
		price_GBP_min REAL NOT NULL,
		*/
        latency_manufacture INTEGER NOT NULL,
		quantity_min REAL NOT NULL,
		quantity_max REAL NOT NULL,
		quantity_step REAL NOT NULL,
		quantity_stock REAL NOT NULL,
		is_subscription BOOLEAN NOT NULL,
		id_recurrence_interval INTEGER,
		/*
		CONSTRAINT FK_tmp_Shop_Product_id_recurrence_interval
			FOREIGN KEY (id_recurrence_interval)
			REFERENCES Shop_Recurrence_Interval(id_interval),
		*/
		count_recurrence_interval INTEGER,
        id_stripe_product VARCHAR(100),
        product_has_variations BOOLEAN NOT NULL,
        can_view BOOLEAN, 
        can_edit BOOLEAN, 
        can_admin BOOLEAN
    );
    
    /*
    CREATE TEMPORARY TABLE tmp_Shop_Variation (
		id_variation INTEGER NOT NULL,
		id_product INTEGER NOT NULL,
        display_order INTEGER NOT NULL
    );
    */
    
    CREATE TEMPORARY TABLE tmp_Shop_Image (
		id_image INTEGER NOT NULL,
		/*
        CONSTRAINT FK_tmp_Shop_Image_id_image
			FOREIGN KEY (id_image)
			REFERENCES Shop_Image(id_image),
		*/
		id_product INTEGER NOT NULL,
		/*
        CONSTRAINT FK_tmp_Shop_Image_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		*/
		id_permutation INTEGER NULL,
		/*
        CONSTRAINT FK_tmp_Shop_Image_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
		*/
        active BOOLEAN NOT NULL,
        display_order INTEGER NOT NULL,
        rank_in_product_permutation INTEGER NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Delivery_Region (
		id_region INTEGER NOT NULL,
		/*
        CONSTRAINT FK_tmp_Delivery_Region_id_region
			FOREIGN KEY (id_region)
			REFERENCES Shop_Region(id_region),
		*/
        active BOOLEAN NOT NULL,
        display_order INTEGER NOT NULL,
        requires_delivery_option BOOLEAN NOT NULL DEFAULT FALSE
    );
    
    CREATE TEMPORARY TABLE tmp_Currency (
		id_currency INTEGER NOT NULL,
		/*
        CONSTRAINT FK_tmp_Shop_Currency_id_currency
			FOREIGN KEY (id_currency)
			REFERENCES Shop_Currency(id_currency),
		*/
        active BOOLEAN NOT NULL,
        display_order INTEGER NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Discount (
		id_discount INTEGER NOT NULL,
		/*
        CONSTRAINT FK_tmp_Discount_id_discount
			FOREIGN KEY (id_discount)
			REFERENCES Shop_Discount(id_discount),
		*/
        active BOOLEAN NOT NULL,
        display_order INTEGER NOT NULL
    );
    
	/*
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		id_type INTEGER NOT NULL,
		/*
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
		*/
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    */

    
	INSERT INTO tmp_Shop_Product (
		id_category,
		id_product,
		id_permutation,
		active_category,
		active_product,
		active_permutation,
        display_order_category,
        display_order_product,
        display_order_permutation,
        -- rank_permutation,
		rank_category,
		rank_product,
		rank_permutation,
        name,
        description,
        /*
		price_GBP_VAT_incl,
		price_GBP_VAT_excl,
		price_GBP_min,
		*/
        latency_manufacture,
		quantity_min,
		quantity_max,
		quantity_step,
		quantity_stock,
		is_subscription,
		id_recurrence_interval,
		count_recurrence_interval,
        id_stripe_product,
        product_has_variations
	)
    SELECT 
		P.id_category,
		P.id_product,
		-- P.has_variations AS product_has_variations,
		PP.id_permutation,
		C.active AS active_category,
		P.active AS active_product,
		PP.active AS active_permutation,
		C.display_order AS display_order_category,
		P.display_order AS display_order_product,
		PP.display_order AS display_order_permutation,
        -- RANK() OVER (ORDER BY C.display_order, P.display_order, PP.display_order) AS rank_permutation, -- PARTITION BY P.id_category -- _in_category
		RANK() OVER (ORDER BY C.display_order) AS rank_category,
		RANK() OVER (PARTITION BY P.id_category ORDER BY P.display_order) AS rank_product,
		RANK() OVER (PARTITION BY P.id_category, P.id_product ORDER BY PP.display_order) AS rank_permutation,
		P.name,
		PP.description,
        /*
		PP.price_GBP_VAT_incl,
		PP.price_GBP_VAT_excl,
		PP.price_GBP_min,
		*/
        PP.latency_manufacture,
		PP.quantity_min,
		PP.quantity_max,
		PP.quantity_step,
		PP.quantity_stock,
		PP.is_subscription,
		PP.id_recurrence_interval,
		PP.count_recurrence_interval,
		PP.id_stripe_product,
        P.has_variations
	FROM Shop_Product P
    INNER JOIN Shop_Product_Permutation PP
		ON P.id_product = PP.id_product
	INNER JOIN Shop_Product_Category C
		ON P.id_category = C.id_category
	WHERE
		-- permutations
		(
			(
				v_get_all_product_permutation 
				OR (
					v_has_filter_permutation 
					-- AND FIND_IN_SET(PP.id_permutation, v_ids_permutation) > 0
					AND PP.id_permutation = ANY(v_ids_permutation)
				)
			)
			AND (v_get_inactive_permutation OR PP.active)
        )
		-- categories
		AND (
			(
				v_get_all_category 
                OR (
					v_has_filter_category 
					-- AND FIND_IN_SET(P.id_category, v_ids_category) > 0
					AND C.id_category = ANY(v_ids_category)
				)
			)
			AND (v_get_inactive_category OR C.active)
		) 
		-- products
		AND (
			(
				v_get_all_product 
				OR (
					v_has_filter_product 
					-- AND FIND_IN_SET(P.id_product, v_ids_product) > 0
					AND P.id_product = ANY(v_ids_product)
				)
			)
			AND (v_get_inactive_product OR P.active)
		)
    ;
    
    -- select * from tmp_Shop_Product;
    
    IF v_get_first_category_only THEN
		DELETE FROM tmp_Shop_Product t_P
			WHERE t_P.rank_category > 1
		;
    END IF;
    
    IF v_get_first_product_only THEN
		DELETE FROM tmp_Shop_Product t_P
			WHERE t_P.rank_product > 1
		;
    END IF;
    
    IF v_get_first_permutation_only THEN
		DELETE FROM tmp_Shop_Product t_P
			WHERE t_P.rank_permutation > 1
		;
    END IF;

    
    INSERT INTO tmp_Shop_Product_Category (
		id_category, 
        active,
        display_order
	)
	SELECT DISTINCT C.id_category,
		C.active,
		C.display_order
	FROM tmp_Shop_Product t_P
    INNER JOIN Shop_Product_Category C
		ON t_P.id_category = C.id_category
	ORDER BY C.display_order
	;
    
    /*
    INSERT INTO tmp_Shop_Variation (
		id_variation, id_product -- , display_order
	)
    SELECT P.id_variation, P.id_product -- , P.display_order
	FROM Shop_Variation V
    INNER JOIN tmp_Shop_Product t_P
		ON V.id_product = t_P.id_product
		WHERE V.active;
    */
    
    -- Product Images
    INSERT INTO tmp_Shop_Image (
		id_product, 
        id_permutation,
        id_image, 
        active, 
        display_order,
        rank_in_product_permutation
	)
    SELECT id_product, 
		id_permutation,
		id_image, 
		active, 
		ROW_NUMBER() OVER (ORDER BY display_order_product_temp, display_order_image), 
		RANK() OVER (PARTITION BY id_product, id_permutation ORDER BY display_order_product_temp, display_order_image)
	FROM (
		SELECT t_P.id_product, 
			I.id_permutation,
			I.id_image, 
			I.active, 
			I.display_order AS display_order_image,
            t_P.rank_permutation AS display_order_product_temp
		FROM Shop_Image I
		INNER JOIN tmp_Shop_Product t_P
			ON I.id_product = t_P.id_product
				AND NOT t_P.product_has_variations
		UNION
		SELECT t_P.id_product, 
			I.id_permutation,
			I.id_image, 
			I.active, 
			I.display_order AS display_order_image,
            t_P.rank_permutation AS display_order_product_temp
		FROM Shop_Image I
		INNER JOIN tmp_Shop_Product t_P
			ON I.id_permutation = t_P.id_permutation
				AND t_P.product_has_variations
		) IPP
	WHERE 
		(
			v_get_all_image 
			OR v_get_first_image_only 
			-- OR FIND_IN_SET(id_image, v_ids_image) > 0
			OR IPP.id_image = ANY(v_ids_image)
		)
		AND (v_get_inactive_image OR IPP.active)
	;
    
    IF v_get_first_image_only THEN
		DELETE FROM tmp_Shop_Image
			WHERE rank_in_product_permutation > 1
		;
    END IF;
    
    /*
    IF v_has_filter_image THEN
		DELETE FROM tmp_Shop_Product
			WHERE id_product NOT IN (SELECT DISTINCT id_product FROM tmp_Shop_Image);
		DELETE FROM tmp_Shop_Product_Category
			WHERE id_category NOT IN (SELECT DISTINCT id_category FROM tmp_Shop_Product);
    END IF;
    */
    
    -- Delivery Regions
    INSERT INTO tmp_Delivery_Region (
		id_region,
        active,
        display_order,
		requires_delivery_option
    )
    WITH RECURSIVE Recursive_CTE_Delivery_Region AS (
		SELECT 
			CAST(NULL AS INTEGER) AS id_region_parent,
            DR.id_region AS id_region_child,
            -- CASE WHEN FIND_IN_SET(DR.id_region, v_ids_delivery_region) > 0 THEN TRUE ELSE FALSE END AS requires_delivery_option
			(DR.id_region = ANY(v_ids_delivery_region)) AS requires_delivery_option
		FROM Shop_Product_Currency_Region_Link PCRL
		INNER JOIN Shop_Currency C ON PCRL.id_currency = C.id_currency
		INNER JOIN tmp_Shop_Product t_P 
			ON PCRL.id_product = t_P.id_product
			AND PCRL.id_permutation = t_P.id_permutation
		INNER JOIN Shop_Region DR ON PCRL.id_region_purchase = DR.id_region
		WHERE 
			(
				v_get_all_delivery_region
				-- OR FIND_IN_SET(DR.id_region, v_ids_delivery_region) > 0
				OR DR.id_region = ANY(v_ids_delivery_region)
			)
			AND (
				v_get_inactive_delivery_region
				OR DR.active = TRUE
			)
		UNION
        SELECT 
			DRB.id_region_parent,
			DRB.id_region_child,
            FALSE AS requires_delivery_option
		FROM Shop_Region_Branch DRB
        INNER JOIN Recursive_CTE_Delivery_Region r_DR 
			ON DRB.id_region_parent = r_DR.id_region_child
		WHERE (
			v_get_inactive_delivery_region
			OR DRB.active = TRUE
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
		/*(
			v_get_all_category 
			OR v_get_all_product
			OR v_get_all_product_permutation
		) */
		FIND_IN_SET(t_P.id_category, v_ids_category) > 0
		OR FIND_IN_SET(t_P.id_product, v_ids_product) > 0
		OR FIND_IN_SET(t_P.id_permutation, v_ids_permutation) > 0
	;
    */
    
    IF v_has_filter_delivery_region THEN
		v_ids_permutation_unavailable = (
			SELECT STRING_AGG(t_P.id_permutation, ', ')
			FROM (
				SELECT * 
				FROM tmp_Shop_Product t_P 
				WHERE
					/*(
						v_get_all_category 
						OR v_get_all_produc
						OR v_get_all_product_permutation
					)
					FIND_IN_SET(t_P.id_category, v_ids_category) > 0
					OR FIND_IN_SET(t_P.id_product, v_ids_product) > 0
					OR FIND_IN_SET(t_P.id_permutation, v_ids_permutation) > 0
					*/
					t_P.id_category = ANY(v_ids_category)
					OR t_P.id_product = ANY(v_ids_product)
					OR t_P.id_permutation = ANY(v_ids_permutation)
			) t_P
			LEFT JOIN (
				SELECT *
				FROM Shop_Product_Currency_Region_Link PCRL
				WHERE 
					v_get_all_delivery_region
					-- OR FIND_IN_SET(PCRL.id_region_purchase, v_ids_delivery_region) > 0
					OR PCRL.id_region_purchase = ANY(v_ids_delivery_region)
			) PCRL
				ON t_P.id_product = PCRL.id_product
				AND t_P.id_permutation = PCRL.id_permutation
			LEFT JOIN tmp_Delivery_Region t_DR
				ON PCRL.id_region_purchase = t_DR.id_region
				AND t_DR.requires_delivery_option
			WHERE 
				ISNULL(t_DR.id_region)
		);
        IF NOT ISNULL(v_ids_permutation_unavailable) THEN
			/*
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
				'Error: The following permutation IDs are not available in this region: ' || COALESCE(v_ids_permutation_unavailable, 'NULL')
			);
			*/
			RAISE EXCEPTION 'The following permutation IDs are not available in this region: %', COALESCE(v_ids_permutation_unavailable, 'NULL')
			USING ERRCODE = '22000';
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
    
    -- Currencies
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
		ON PCRL.id_product = t_P.id_product
		AND PCRL.id_permutation = t_P.id_permutation
	INNER JOIN tmp_Delivery_Region t_DR ON PCRL.id_region_purchase = t_DR.id_region
	WHERE
		(
			v_get_all_currency
			-- R FIND_IN_SET(C.id_currency, v_ids_currency) > 0
			OR C.id_currency = ANY(v_ids_currency)
		)
		AND (
			v_get_inactive_currency
			OR (
				C.active
				AND PCRL.active
			)
		)
	;
	
	-- select * from tmp_Currency;
	
	IF v_has_filter_currency THEN
		v_ids_permutation_unavailable = (
			SELECT STRING_AGG(t_P.id_permutation, ', ')
			FROM (
				SELECT * 
				FROM tmp_Shop_Product t_P 
				WHERE 
					/*(
						v_get_all_category 
						OR v_get_all_product
						OR v_get_all_product_permutation
					)
					FIND_IN_SET(t_P.id_category, v_ids_category) > 0
					OR FIND_IN_SET(t_P.id_product, v_ids_product) > 0
					OR FIND_IN_SET(t_P.id_permutation, v_ids_permutation) > 0
					*/
					t_P.id_category = ANY(v_ids_category)
					OR t_P.id_product = ANY(v_ids_product)
					OR t_P.id_permutation = ANY(v_ids_permutation)
			) t_P
			INNER JOIN (
				SELECT *
				FROM Shop_Product_Currency_Region_Link PCRL
				WHERE 
					(
						v_get_all_currency
						-- OR FIND_IN_SET(PCRL.id_currency, v_ids_currency) > 0
						OR PCRL.id_currency = ANY(v_ids_currency)
					)
			) PCRL
				ON t_P.id_permutation = PCRL.id_permutation
			LEFT JOIN tmp_Currency t_C
				ON PCRL.id_currency = t_C.id_currency
			WHERE ISNULL(t_C.id_currency) 
		);
		IF NOT ISNULL(v_ids_permutation_unavailable) THEN
			/*
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
				'Error: The following permutation IDs are not available in this currency: ' || COALESCE(v_ids_permutation_unavailable, 'NULL')
			);
			*/
			RAISE EXCEPTION 'The following permutation IDs are not available in this currency: %', COALESCE(v_ids_permutation_unavailable, 'NULL')
			USING ERRCODE = '22000';
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
    
    -- Discounts
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
		AND D.id_permutation = t_P.id_permutation
	WHERE
		(
			v_get_all_discount
			-- OR FIND_IN_SET(D.id_discount, v_ids_discount) > 0
			OR D.id_discount = ANY(v_ids_discount)
		)
		AND (
			v_get_inactive_discount
			OR D.active
		)
	;
    -- select 'pre-permission results';
    -- select * from tmp_Shop_Product;
    
    -- Permissions
    IF EXISTS (SELECT * FROM tmp_Shop_Product_Category LIMIT 1) THEN
        -- v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER);
        v_id_permission_product := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
        v_ids_product_permission := (SELECT STRING_AGG(id_product, ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_product));
        -- v_ids_permutation_permission := (SELECT STRING_AGG(id_permutation, ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
        
        -- SELECT v_guid, v_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission;
        -- select * from Shop_User_Eval_Temp;
        
        CALL p_shop_user_eval(v_guid, v_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission);
        
        -- select * from Shop_User_Eval_Temp;
        
        UPDATE tmp_Shop_Product t_P
        SET t_P.can_view = UE_T.can_view,
			t_P.can_edit = UE_T.can_edit,
            t_P.can_admin = UE_T.can_admin
		FROM tmp_Shop_Product t_P
        INNER JOIN Shop_User_Eval_Temp UE_T
			ON t_P.id_product = UE_T.id_product
			AND UE_T.GUID = v_guid
		;
		-- select * from Shop_User_Eval_Temp;
		-- select * from tmp_Shop_Product;
        
        DELETE FROM tmp_Shop_Product t_P
		WHERE 
			-- FIND_IN_SET(t_P.id_product, (SELECT STRING_AGG(UET.id_product, ',') FROM Shop_User_Eval_Temp UET)) = FALSE -- id_product NOT LIKE CONCAT('%', (SELECT STRING_AGG(id_product, '|') FROM Shop_User_Eval_Temp), '%');
			t_P.id_product NOT IN (
				SELECT id_product
				FROM Shop_User_Eval_Temp UET
				WHERE UET.GUID = v_guid
			)
			OR ISNULL(t_P.can_view)
			OR t_P.can_view = FALSE
        ;
        
        -- CALL p_shop_user_eval_clear_temp(v_guid);
        -- DROP TABLE IF EXISTS Shop_User_Eval_Temp;
        DELETE FROM Shop_User_Eval_Temp
        WHERE GUID = v_guid
        ;
    END IF;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns
    -- v_now := CURRENT_TIMESTAMP;
    
    -- Categories
	OPEN result_categories FOR
	-- RETURN QUERY
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
    RETURN NEXT result_categories;
	-- CLOSE result_categories;
    
    -- Products
	OPEN result_products FOR
	-- RETURN QUERY
		SELECT 
			t_P.id_product,
			t_P.id_permutation,
			t_P.name,
			t_P.description,
			P.has_variations,
			P.id_category,
			PP.cost_local,
			PP.id_currency_cost,
			PP.profit_local_min,
			t_P.latency_manufacture,
			t_P.quantity_min,
			t_P.quantity_max,
			t_P.quantity_step,
			t_P.quantity_stock,
			t_P.id_stripe_product,
			t_P.is_subscription,
			RI.name AS name_recurrence_interval,
			RI.name_plural AS name_plural_recurrence_interval,
			t_P.count_recurrence_interval,
			t_P.display_order_category,
			t_P.display_order_product,
			t_P.display_order_permutation,
			COALESCE(t_P.can_view, FALSE),
			COALESCE(t_P.can_edit, FALSE),
			COALESCE(t_P.can_admin, FALSE)
		FROM tmp_Shop_Product t_P
		INNER JOIN Shop_Product P ON t_P.id_product = P.id_product
		INNER JOIN Shop_Product_Permutation PP ON t_P.id_permutation = PP.id_permutation
		LEFT JOIN Shop_Recurrence_Interval RI ON t_P.id_recurrence_interval = RI.id_interval
		ORDER BY t_P.rank_permutation
		;
    RETURN NEXT result_products;
	-- CLOSE result_products;
    
    -- Variations
	OPEN result_variations FOR
	-- RETURN QUERY
		SELECT 
			V.id_variation,
			t_P.id_product,
			t_P.id_permutation,
			t_P.id_category,
			VT.code AS code_variation_type,
			VT.name AS name_variation_type,
			V.code AS code_variation,
			V.name AS name_variation,
			RANK() OVER (ORDER BY t_P.rank_permutation, PPVL.display_order) AS display_order
		FROM Shop_Variation V
		INNER JOIN Shop_Variation_Type VT
			ON V.id_type = VT.id_type
		INNER JOIN Shop_Product_Permutation_Variation_Link PPVL ON V.id_variation = PPVL.id_variation
		INNER JOIN tmp_Shop_Product t_P ON PPVL.id_permutation = t_P.id_permutation
		WHERE V.active
			AND PPVL.active
		;
    RETURN NEXT result_variations;
	-- CLOSE result_variations;

    /*
    -- Permutation variations output
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
    
    -- Product Price
	OPEN result_prices FOR
	-- RETURN QUERY
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
			ON PCRL.id_product = t_P.id_product
			AND PCRL.id_permutation = t_P.id_permutation
		-- INNER JOIN Shop_Product P ON PCRL.id_product = P.id_product
		INNER JOIN tmp_Currency t_C ON PCRL.id_currency = t_C.id_currency
		INNER JOIN Shop_Currency C ON t_C.id_currency = C.id_currency
		INNER JOIN tmp_Delivery_Region t_DR ON PCRL.id_region_purchase = t_DR.id_region
		WHERE (
			v_get_inactive_product 
			AND v_get_inactive_permutation
			AND v_get_inactive_currency
			AND v_get_inactive_delivery_region
			OR PCRL.active
		)
		ORDER BY t_P.rank_permutation
		;
    RETURN NEXT result_prices;
	-- CLOSE result_prices;

    /*
    -- Currency
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
    
    -- Images
	OPEN result_images FOR
	-- RETURN QUERY
		SELECT 
			t_I.id_image,
			t_I.id_product,
			t_I.id_permutation,
			t_P.id_category,
			I.url,
			I.active,
			I.display_order
		FROM tmp_Shop_Image t_I
		INNER JOIN Shop_Image I
			ON t_I.id_image = I.id_image
		INNER JOIN tmp_Shop_Product t_P
			ON t_I.id_product = t_P.id_product
				AND t_I.id_permutation = t_P.id_permutation
		ORDER BY t_P.rank_permutation, I.display_order
		;
    RETURN NEXT result_images;
	-- CLOSE result_images;
    
    -- Delivery options
	OPEN result_delivery_options FOR
	-- RETURN QUERY
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
			STRING_AGG(DR.code, ',') AS codes_region,
			STRING_AGG(DR.name, ',') AS names_region,
			PDOL.price_local,
			PDOL.display_order
		FROM Shop_Delivery_Option _DO
		INNER JOIN Shop_Product_Delivery_Option_Link PDOL
			ON _DO.id_option = PDOL.id_delivery_option
			AND (
				v_get_inactive_delivery_region
				OR PDOL.active
			)
		INNER JOIN tmp_Shop_Product t_P
			ON PDOL.id_product = t_P.id_product
			AND PDOL.id_permutation = t_P.id_permutation
		INNER JOIN tmp_Delivery_Region t_DR ON PDOL.id_region = t_DR.id_region
		INNER JOIN Shop_Region DR ON t_DR.id_region = DR.id_region
		WHERE (
			v_get_inactive_delivery_region
			OR _DO.active
		)
		GROUP BY t_P.id_category, t_P.id_product, PDOL.id_permutation, t_P.rank_permutation, DR.id_region, _DO.id_option, PDOL.id_link
		ORDER BY t_P.rank_permutation, PDOL.display_order
		;
    RETURN NEXT result_delivery_options;
    -- CLOSE result_delivery_options;

    -- Discounts
	OPEN result_discounts FOR
	-- RETURN QUERY
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
			STRING_AGG(DR.code, ', ') OVER(PARTITION BY D.id_discount) AS codes_region,
			STRING_AGG(DR.name, ', ') OVER(PARTITION BY D.id_discount) AS names_region,
			STRING_AGG(C.code, ', ') OVER(PARTITION BY D.id_discount) AS codes_currency,
			STRING_AGG(C.name, ', ') OVER(PARTITION BY D.id_discount) AS names_currency,
			ROW_NUMBER() OVER(ORDER BY D.display_order) AS display_order
		FROM tmp_Discount t_D
		INNER JOIN Shop_Discount D ON t_D.id_discount = D.id_discount
		INNER JOIN Shop_Product P ON D.id_product = P.id_product
		INNER JOIN tmp_Shop_Product t_P
			ON D.id_product = t_P.id_product
			-- AND D.id_permutation = t_P.id_permutation
		INNER JOIN Shop_Discount_Region_Currency_Link DRCL
			ON D.id_discount = DRCL.id_discount
		INNER JOIN tmp_Delivery_Region t_DR ON DRCL.id_region = t_DR.id_region
		INNER JOIN Shop_Region DR ON t_DR.id_region = DR.id_region
		INNER JOIN tmp_Currency t_C ON DRCL.id_currency = t_C.id_currency
		INNER JOIN Shop_Currency C ON t_C.id_currency = C.id_currency
		GROUP BY D.id_discount, DR.id_region, C.id_currency, P.id_category, P.id_product, D.id_permutation
		ORDER BY D.display_order, DR.display_order, C.display_order
		;
    RETURN NEXT result_discounts;
	-- CLOSE result_discounts;
    /*
    -- Delivery Regions
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
			v_get_inactive_delivery_region 
            OR PDRL.active
		)
	INNER JOIN tmp_Shop_Product t_P
		ON PDRL.id_product = t_P.id_product
		AND PDRL.id_permutation = t_P.id_permutation
	INNER JOIN tmp_Currency t_C ON PDRL.id_currency = t_C.id_currency
	ORDER BY t_DR.display_order
	;
    */
    
    -- Errors
	/*
	OPEN result_errors FOR
	RETURN QUERY
	SELECT 
		t_ME.display_order,
		t_ME.guid,
		t_ME.id_type,
		t_ME.msg,
		MET.code, 
		MET.name,
		MET.description
	FROM tmp_Msg_Error t_ME
	INNER JOIN Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
	WHERE guid = v_guid
	;
    RETURN NEXT result_errors;
    */
	
    /*
    -- Return arguments for test
    SELECT
	v_ids_category,
	v_get_inactive_category,
	v_ids_product,
	v_get_inactive_product,
    v_get_first_product_only,
    v_get_all_product,
	v_ids_image,
	v_get_inactive_image,
    v_get_first_image_only,
    v_get_all_image
    ;
    */
    
    -- select 'other outputs';
    -- select * from tmp_Shop_Product;
    
    -- Clean up
	/*
    DROP TEMPORARY TABLE IF EXISTS tmp_Discount;
    DROP TEMPORARY TABLE IF EXISTS tmp_Currency;
    DROP TEMPORARY TABLE IF EXISTS tmp_Delivery_Region;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Image;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Variation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product_Category;
    DROP TABLE IF EXISTS tmp_Discount;
    DROP TABLE IF EXISTS tmp_Currency;
    DROP TABLE IF EXISTS tmp_Delivery_Region;
    DROP TABLE IF EXISTS tmp_Shop_Image;
    DROP TABLE IF EXISTS tmp_Shop_Variation;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_Product_Category;
	*/
END;
$$ LANGUAGE plpgsql;


/*

DROP FUNCTION IF EXISTS fetch_results;

CREATE OR REPLACE FUNCTION fetch_results()
RETURNS VOID AS $$
DECLARE
    curs refcursor;
    rec record;
    curs1 refcursor;
    rec1 record;
    curs2 refcursor;
    rec2 record;
BEGIN
    FOR curs IN SELECT p_shop_get_many_product (
		1, -- a_id_user
		TRUE, -- a_get_all_category
		FALSE, -- a_get_inactive_category
		FALSE, -- a_get_first_category_only
		ARRAY[]::INTEGER[], -- a_ids_category
		TRUE, -- a_get_all_product
		FALSE, -- a_get_inactive_product
		FALSE, -- a_get_first_product_only
		ARRAY[]::INTEGER[], -- a_ids_product
		TRUE, -- a_get_all_product_permutation
		FALSE, -- a_get_inactive_permutation
		FALSE, -- a_get_first_permutation_only
		ARRAY[1, 2, 3, 4, 5]::INTEGER[], -- a_ids_permutation
		FALSE, -- a_get_all_image
		FALSE, -- a_get_inactive_image
		TRUE, -- a_get_first_image_only
		ARRAY[]::INTEGER[], -- a_ids_image
		FALSE, -- a_get_all_delivery_region
		FALSE, -- a_get_inactive_delivery_region
		ARRAY[]::INTEGER[], -- a_ids_delivery_region
		FALSE, -- a_get_all_currency
		FALSE, -- a_get_inactive_currency
		ARRAY[]::INTEGER[], -- a_ids_currency
		TRUE, -- a_get_all_discount
		FALSE, -- a_get_inactive_discount
		ARRAY[]::INTEGER[] -- a_ids_discount
	) LOOP
        RAISE NOTICE 'Fetching from cursor: %', curs;
        LOOP
            FETCH curs INTO rec;
            EXIT WHEN NOT FOUND;
            RAISE NOTICE 'Record: %', rec;
        END LOOP;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT fetch_results();

*/
