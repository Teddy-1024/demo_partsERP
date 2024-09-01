



-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_stock_item;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_stock_item (
	IN a_id_user INT,
    IN a_get_all_category BIT,
	IN a_get_inactive_category BIT,
    IN a_get_first_category_only BIT,
	IN a_ids_category TEXT,
    IN a_get_all_product BIT,
	IN a_get_inactive_product BIT,
    IN a_get_first_product_only BIT,
	IN a_ids_product LONGTEXT,
    IN a_get_all_product_permutation BIT,
	IN a_get_inactive_permutation BIT,
	IN a_get_first_permutation_only BIT,
	IN a_ids_permutation LONGTEXT,
    IN a_get_all_stock_item BIT,
	IN a_get_inactive_stock_item BIT,
	IN a_get_first_stock_item_only BIT,
	IN a_ids_stock_item LONGTEXT,
    IN a_get_all_region_storage BIT,
	IN a_get_inactive_region_storage BIT,
    IN a_get_first_region_storage_only BIT,
    IN a_ids_region_storage VARCHAR(4000),
    IN a_get_all_plant_storage BIT,
	IN a_get_inactive_plant_storage BIT,
    IN a_get_first_plant_storage_only BIT,
    IN a_ids_plant_storage VARCHAR(4000),
    IN a_get_all_location_storage BIT,
	IN a_get_inactive_location_storage BIT,
    IN a_get_first_location_storage_only BIT,
    IN a_ids_location_storage TEXT,
    IN a_date_received_to TIMESTAMP,
	IN a_get_sealed_stock_item_only BIT,
	IN a_get_unsealed_stock_item_only BIT,
	IN a_get_expired_stock_item_only BIT,
	IN a_get_nonexpired_stock_item_only BIT,
	IN a_get_consumed_stock_item_only BIT,
	IN a_get_nonconsumed_stock_item_only BIT
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_category BIT;
    DECLARE v_has_filter_product BIT;
    DECLARE v_has_filter_permutation BIT;
    DECLARE v_has_filter_stock_item BIT;
    DECLARE v_has_filter_region_storage BIT;
    DECLARE v_has_filter_plant_storage BIT;
    DECLARE v_has_filter_location_storage BIT;
    DECLARE v_guid BINARY(36);
    -- DECLARE v_ids_permutation_unavailable LONGTEXT;
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission LONGTEXT;
    -- DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    -- DECLARE v_now TIMESTAMP;
    -- DECLARE v_id_minimum INT;
	DECLARE v_now TIMESTAMP;
    
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');
    SET v_now := NOW();

    
	-- Argument validation + default values
	SET a_id_user := TRIM(IFNULL(a_id_user, ''));
	SET a_get_all_category := IFNULL(a_get_all_category, 0);
	SET a_get_inactive_category := IFNULL(a_get_inactive_category, 0);
	SET a_get_first_category_only := IFNULL(a_get_first_category_only, 1);
	SET a_ids_category := TRIM(IFNULL(a_ids_category, ''));
	SET a_get_all_product := IFNULL(a_get_all_product, 0);
	SET a_get_inactive_product := IFNULL(a_get_inactive_product, 0);
	SET a_get_first_product_only := IFNULL(a_get_first_product_only, 1);
	SET a_ids_product := TRIM(IFNULL(a_ids_product, ''));
	SET a_get_all_product_permutation := IFNULL(a_get_all_product_permutation, 0);
	SET a_get_inactive_permutation := IFNULL(a_get_inactive_permutation, 0);
	SET a_get_first_permutation_only := IFNULL(a_get_first_permutation_only, 1);
	SET a_ids_permutation := TRIM(IFNULL(a_ids_permutation, ''));
	SET a_get_all_stock_item := IFNULL(a_get_all_stock_item, 0);
	SET a_get_inactive_stock_item := IFNULL(a_get_inactive_stock_item, 0);
	SET a_get_first_stock_item_only := IFNULL(a_get_first_stock_item_only, 1);
	SET a_ids_stock_item := TRIM(IFNULL(a_ids_stock_item, ''));
	SET a_get_all_region_storage := IFNULL(a_get_all_region_storage, 0);
	SET a_get_inactive_region_storage := IFNULL(a_get_inactive_region_storage, 0);
	SET a_get_first_region_storage_only := IFNULL(a_get_first_region_storage_only, 1);
	SET a_ids_region_storage := TRIM(IFNULL(a_ids_region_storage, ''));
	SET a_get_all_plant_storage := IFNULL(a_get_all_plant_storage, 0);
	SET a_get_inactive_plant_storage := IFNULL(a_get_inactive_plant_storage, 0);
	SET a_get_first_plant_storage_only := IFNULL(a_get_first_plant_storage_only, 1);
	SET a_ids_plant_storage := TRIM(IFNULL(a_ids_plant_storage, ''));
	SET a_get_all_location_storage := IFNULL(a_get_all_location_storage, 0);
	SET a_get_inactive_location_storage := IFNULL(a_get_inactive_location_storage, 0);
	SET a_get_first_location_storage_only := IFNULL(a_get_first_location_storage_only, 1);
	SET a_ids_location_storage := TRIM(IFNULL(a_ids_location_storage, ''));
	SET a_date_received_to := IFNULL(a_date_received_to, NOW());
	SET a_get_sealed_stock_item_only := IFNULL(a_get_sealed_stock_item_only, 0);
	SET a_get_unsealed_stock_item_only := IFNULL(a_get_unsealed_stock_item_only, 0);
	SET a_get_expired_stock_item_only := IFNULL(a_get_expired_stock_item_only, 0);
	SET a_get_nonexpired_stock_item_only := IFNULL(a_get_nonexpired_stock_item_only, 0);
	SET a_get_consumed_stock_item_only := IFNULL(a_get_consumed_stock_item_only, 0);
	SET a_get_nonconsumed_stock_item_only := IFNULL(a_get_nonconsumed_stock_item_only, 0);
	
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Region_Storage;
    DROP TABLE IF EXISTS tmp_Plant_Storage;
    DROP TABLE IF EXISTS tmp_Location_Storage;
	DROP TABLE IF EXISTS tmp_Stock_Item;
    DROP TABLE IF EXISTS tmp_Permutation;
    DROP TABLE IF EXISTS tmp_Product;
    DROP TABLE IF EXISTS tmp_Category;
	DROP TABLE IF EXISTS tmp_Msg_Error;
    
    CREATE TEMPORARY TABLE tmp_Category (
		id_category INT NOT NULL
        /*
        , CONSTRAINT FK_tmp_Category_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Product_Category(id_category)
		/
        active BIT NOT NULL,
        display_order INT NOT NULL, 
		can_view BIT, 
        can_edit BIT, 
        can_admin BIT
        */
        , rank_category INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Product (
		/*
		id_category INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Product_Category(id_category),
		*/
		id_product INT NOT NULL
        /*
        , CONSTRAINT FK_tmp_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product)
		*/
		-- product_has_variations BIT NOT NULL,
		/*
		id_permutation INT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
        active_category BIT NOT NULL,
        active_product BIT NOT NULL,
        active_permutation BIT NULL,
        display_order_category INT NOT NULL, 
        display_order_product INT NOT NULL, 
        display_order_permutation INT NULL, 
        rank_permutation INT NOT NULL, # _in_category
        name VARCHAR(255) NOT NULL,
        description VARCHAR(4000) NOT NULL,
		/
        price_GBP_full FLOAT NOT NULL,
		price_GBP_min FLOAT NOT NULL,
		*
        , latency_manufacture INT NOT NULL
		, quantity_min FLOAT NOT NULL
		, quantity_max FLOAT NOT NULL
		, quantity_step FLOAT NOT NULL
		, quantity_stock FLOAT NOT NULL
		, is_subscription BIT NOT NULL
		, id_recurrence_interval INT
		, CONSTRAINT FK_tmp_Shop_Product_id_recurrence_interval
			FOREIGN KEY (id_recurrence_interval)
			REFERENCES Shop_Recurrence_Interval(id_interval)
		, count_recurrence_interval INT
        , id_stripe_product VARCHAR(100)
        , product_has_variations INT NOT NULL
        , can_view BIT
        , can_edit BIT
        , can_admin BIT
        */
        , rank_product INT NOT NULL
    );

	CREATE TEMPORARY TABLE tmp_Permutation (
		id_permutation INT NOT NULL
        /*
		CONSTRAINT FK_tmp_Permutation_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation)
		*/
        , rank_permutation INT NOT NULL
	);
	
	CREATE TEMPORARY TABLE tmp_Stock_Item (
		id_stock INT NOT NULL PRIMARY KEY,
		id_permutation INT NOT NULL
        /*
		CONSTRAINT FK_tmp_Stock_Item_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
		*/
		, id_product INT NOT NULL
        /*
		CONSTRAINT FK_tmp_Stock_Item_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		*/
		, id_category INT NOT NULL
        /*
		CONSTRAINT FK_tmp_Stock_Item_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Product_Category(id_category),
		*/
		, date_purchased TIMESTAMP NOT NULL
		, date_received TIMESTAMP NULL
		, id_location_storage INT NOT NULL
        /*
		CONSTRAINT FK_tmp_Stock_Item_id_location_storage
			FOREIGN KEY (id_location_storage)
			REFERENCES Shop_Storage_Location(id_location),
		*/
		, id_currency_cost INT NOT NULL
        /*
		CONSTRAINT FK_tmp_Stock_Item_id_currency
			FOREIGN KEY (id_currency_cost)
			REFERENCES Shop_Currency(id_currency),
		*/
		, cost_local_VAT_incl FLOAT NOT NULL
		, cost_local_VAT_excl FLOAT NOT NULL
		, is_sealed BIT NOT NULL DEFAULT 1
		, date_unsealed TIMESTAMP NULL
		, date_expiration TIMESTAMP NOT NULL
		, is_consumed BIT NOT NULL DEFAULT 0
		, date_consumed TIMESTAMP NULL
		, active_stock_item BIT NOT NULL DEFAULT 1
        , active_permutation BIT NOT NULL
        , active_product BIT NOT NULL
        , active_category BIT NOT NULL
        , rank_stock_item INT NOT NULL
        , display_order_permutation INT NOT NULL
        , display_order_product INT NOT NULL
        , display_order_category INT NOT NULL
        , can_view BIT NULL
        , can_edit BIT NULL
		, can_admin BIT NULL
	);

	CREATE TEMPORARY TABLE tmp_Region_Storage (
		id_region INT NOT NULL PRIMARY KEY
        /*
		CONSTRAINT FK_tmp_Region_Storage_id_region
			FOREIGN KEY (id_region)
			REFERENCES Shop_Region(id_region)
		*/
        , rank_region INT NOT NULL
	);

	CREATE TEMPORARY TABLE tmp_Plant_Storage (
		id_plant INT NOT NULL PRIMARY KEY
        /*
		CONSTRAINT FK_tmp_Plant_Storage_id_plant
			FOREIGN KEY (id_plant)
			REFERENCES Shop_Plant(id_plant)
		*/
        , rank_plant INT NOT NULL
        , id_region INT NOT NULL
	);

	CREATE TEMPORARY TABLE tmp_Location_Storage (
		id_location INT NOT NULL PRIMARY KEY
        /*
		CONSTRAINT FK_tmp_Location_Storage_id_location
			FOREIGN KEY (id_location)
			REFERENCES Shop_Location_Storage(id_location)
		*/
        , rank_location INT NOT NULL
        , id_plant INT NOT NULL
	);
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
        /*
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
		*/
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Parse filters
    SET v_has_filter_category = CASE WHEN a_ids_category = '' THEN 0 ELSE 1 END;
    SET v_has_filter_product = CASE WHEN a_ids_product = '' THEN 0 ELSE 1 END;
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_stock_item = CASE WHEN a_ids_stock_item = '' THEN 0 ELSE 1 END;
    SET v_has_filter_region_storage = CASE WHEN a_ids_region_storage = '' THEN 0 ELSE 1 END;
    SET v_has_filter_plant_storage = CASE WHEN a_ids_plant_storage = '' THEN 0 ELSE 1 END;
    SET v_has_filter_location_storage = CASE WHEN a_ids_location_storage = '' THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
	INSERT INTO tmp_Stock_Item (
		id_stock,
		id_permutation,
		id_product,
		id_category,
		active_stock_item,
		active_permutation,
		active_product,
		active_category,
        display_order_permutation,
        display_order_product,
        display_order_category,
        rank_stock_item,
		date_purchased,
		date_received,
		id_location_storage,
		id_currency_cost,
        /*
		symbol_currency_cost,
		code_currency_cost,
		*/
        cost_local_VAT_incl,
		cost_local_VAT_excl,
		is_sealed,
		date_unsealed,
		date_expiration,
		is_consumed,
		date_consumed
	)
    SELECT 
		SI.id_stock,
		PP.id_permutation,
		P.id_product,
		P.id_category,
        SI.active AS active_stock_item,
		PP.active AS active_permutation,
		P.active AS active_product,
		C.active AS active_category,
		PP.display_order AS display_order_permutation,
		P.display_order AS display_order_product,
		C.display_order AS display_order_category,
        RANK() OVER (ORDER BY C.display_order, P.display_order, PP.display_order, SI.date_expiration) AS rank_stock_item,
		SI.date_purchased,
		SI.date_received,
		SI.id_location_storage,
		SI.id_currency_cost,
		/*
        CURRENCY.symbol AS symbol_currency_cost,
		CURRENCY.code AS code_currency_cost,
		*/
        SI.cost_local_VAT_incl,
		SI.cost_local_VAT_excl,
		SI.is_sealed,
		SI.date_unsealed,
		SI.date_expiration,
		SI.is_consumed,
		SI.date_consumed
	FROM Shop_Stock_Item SI
	INNER JOIN Shop_Product_Permutation PP ON SI.id_permutation = PP.id_permutation
	INNER JOIN Shop_Product P ON PP.id_product = P.id_product
	INNER JOIN Shop_Product_Category C ON P.id_category = C.id_category	
	WHERE
		# stock items
		(
			(
				a_get_all_stock_item
				OR (
					v_has_filter_stock_item
                    AND FIND_IN_SET(SI.id_stock, a_ids_stock_item) > 0
				)
			)
			AND (
				a_get_inactive_stock_item
				OR SI.active
			)
			AND (
				ISNULL(a_date_received_to)
				OR SI.date_received <= a_date_received_to
			)
			AND (
				a_get_unsealed_stock_item_only = 0
				OR NOT SI.is_sealed
			)
			AND (
				a_get_sealed_stock_item_only = 0
				OR SI.is_sealed
			)
			AND (
				a_get_nonexpired_stock_item_only = 0
				OR SI.date_expiration > v_now
			)
			AND (
				a_get_expired_stock_item_only = 0
				OR SI.date_expiration <= v_now
			)
			AND (
				a_get_consumed_stock_item_only = 0
				OR SI.is_consumed
			)
			AND (
				a_get_nonconsumed_stock_item_only = 0
				OR NOT SI.is_consumed
			)
        )
		# permutations
		AND (
			(
				a_get_all_product_permutation 
				OR (
					v_has_filter_permutation 
                    AND FIND_IN_SET(PP.id_permutation, a_ids_permutation) > 0
				)
			)
			AND (
				a_get_inactive_permutation 
				OR PP.active
			)
        )
		# products
		AND (
			(
				a_get_all_product 
				OR v_has_filter_product AND FIND_IN_SET(P.id_product, a_ids_product) > 0
			)
			AND (
				a_get_inactive_product 
				OR P.active
			)
		)
		# categories
		AND (
			(
				a_get_all_category 
                OR v_has_filter_category AND FIND_IN_SET(P.id_category, a_ids_category) > 0
			)
			AND (
				a_get_inactive_category 
				OR C.active
			)
		) 
    ;
    IF a_get_first_stock_item_only THEN
		DELETE t_SI
		FROM tmp_Stock_Item t_SI
		WHERE t_SI.rank_stock_item > 1
		;
	END IF;

	-- Permutations
    INSERT INTO tmp_Permutation (
		id_permutation,
        rank_permutation
	)
	SELECT 
		DISTINCT t_SI.id_permutation
        , RANK() OVER (ORDER BY id_permutation) AS rank_permutation
	FROM tmp_Stock_Item t_SI
	;
    IF a_get_first_product_only THEN
		DELETE t_P
		FROM tmp_Product t_P
		WHERE t_P.rank_permutation > 1
		;
    END IF;
    

	-- Products
    INSERT INTO tmp_Product (
		id_product,
        rank_product
	)
	SELECT 
		DISTINCT t_SI.id_product
        , RANK() OVER (ORDER BY id_product) AS rank_product
	FROM tmp_Stock_Item t_SI
	;
    IF a_get_first_product_only THEN
		DELETE t_P
		FROM tmp_Product t_P
		WHERE t_P.rank_product > 1
		;
    END IF;

    
	-- Categories
    INSERT INTO tmp_Category (
		id_category,
        rank_category
	)
	SELECT 
		DISTINCT t_SI.id_category
        , RANK() OVER (ORDER BY id_category) AS rank_category
	FROM tmp_Stock_Item t_SI
	;
	IF a_get_first_category_only THEN
		DELETE t_P
		FROM tmp_Product t_P
		INNER JOIN tmp_Category t_C ON t_P.id_category = t_C.id_category
		WHERE t_C.rank_category > 1
		;
		DELETE t_C
		FROM tmp_Category t_C
		WHERE t_C.rank_category > 1
		;
	END IF;

	-- Storage Regions
    INSERT INTO tmp_Region_Storage (
		id_region
        , rank_region
    )
    WITH RECURSIVE Recursive_CTE_Region_Storage AS (
		SELECT 
			R.id_region AS id_region_parent,
            NULL AS id_region_child
		FROM tmp_Stock_Item t_SI
		-- INNER JOIN tmp_Stock_Item t_SI ON SL.id_location = t_SI.id_location_storage
		INNER JOIN Shop_Storage_Location SL ON t_SI.id_location_storage = SL.id_location
		INNER JOIN Shop_Plant P ON SL.id_plant = P.id_plant
		INNER JOIN Shop_Address A ON P.id_address = A.id_address
		INNER JOIN Shop_Region R 
			ON A.id_region = R.id_region
			AND (
				a_get_all_region_storage
				OR FIND_IN_SET(R.id_region, a_ids_region_storage) > 0
			)
			AND (
				a_get_inactive_region_storage
				OR R.active = 1
			)			
		UNION
        SELECT 
			RB.id_region_parent,
			RB.id_region_child
		FROM Shop_Region_Branch RB
        INNER JOIN Recursive_CTE_Region_Storage r_RS
			ON RB.id_region_parent = r_RS.id_region_child
            AND (
				a_get_inactive_region_storage
                OR RB.active = 1
            )
	)
    SELECT
		DISTINCT R.id_region,
		RANK() OVER (ORDER BY R.id_region) AS rank_region
	FROM Shop_Region R
    INNER JOIN Recursive_CTE_Region_Storage r_RS
		ON R.id_region = r_RS.id_region_parent
		OR R.id_region = r_RS.id_region_child
    ;
	IF a_get_first_region_storage_only THEN
		DELETE t_RS
		FROM tmp_Region_Storage t_RS
		WHERE t_RS.rank_region > 1
		;
	END IF;

	-- Plants
    INSERT INTO tmp_Plant_Storage (
		id_plant
		, rank_plant
        , id_region
	)
	SELECT 
		DISTINCT P.id_plant
		, RANK() OVER (ORDER BY P.id_plant) AS rank_plant
        , A.id_region
	FROM tmp_Stock_Item t_SI
	INNER JOIN Shop_Storage_Location SL ON t_SI.id_location_storage = SL.id_location
	INNER JOIN Shop_Plant P ON SL.id_plant = P.id_plant
    INNER JOIN Shop_Address A ON P.id_address = A.id_address
	;
    IF a_get_first_plant_storage_only THEN
		DELETE t_P
		FROM tmp_Plant_Storage t_P
		WHERE t_P.rank_plant > 1
		;
    END IF;
    
	-- Storage Locations
    INSERT INTO tmp_Location_Storage (
		id_location
        , rank_location
        , id_plant
    )
    WITH RECURSIVE Recursive_CTE_Location_Storage AS (
		SELECT 
			SL.id_location AS id_location_parent,
            NULL AS id_location_child
		FROM tmp_Stock_Item t_SI
		-- INNER JOIN tmp_Stock_Item t_SI ON SL.id_location = t_SI.id_location_storage
		INNER JOIN Shop_Storage_Location SL 
			ON t_SI.id_location_storage = SL.id_location
			AND (
				a_get_all_location_storage
				OR FIND_IN_SET(SL.id_location, a_ids_location_storage) > 0
			)
			AND (
				a_get_inactive_location_storage
				OR SL.active = 1
			)			
		UNION
        SELECT 
			SLB.id_location_parent,
			SLB.id_location_child
		FROM Shop_Storage_Location_Branch SLB
        INNER JOIN Recursive_CTE_Location_Storage r_LS
			ON SLB.id_location_parent = r_LS.id_location_child
            AND (
				a_get_inactive_location_storage
                OR SLB.active = 1
            )
	)
    SELECT
		DISTINCT SL.id_location
		, RANK() OVER (ORDER BY SL.id_location) AS rank_location
        , SL.id_plant
	FROM Shop_Storage_Location SL
    INNER JOIN Recursive_CTE_Location_Storage r_LS
		ON SL.id_location = r_LS.id_location_parent
		OR SL.id_location = r_LS.id_location_child
    ;
	IF a_get_first_location_storage_only THEN
		DELETE t_LS
		FROM tmp_Location_Storage t_LS
		WHERE t_LS.rank_location > 1
		;
	END IF;


    -- Permissions
    IF EXISTS (SELECT * FROM tmp_Stock_Item LIMIT 1) THEN
        SET v_id_permission_product := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
        SET v_ids_product_permission := (SELECT GROUP_CONCAT(id_product SEPARATOR ',') FROM tmp_Product WHERE NOT ISNULL(id_product));
        -- SET v_ids_permutation_permission := (SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission;
        -- select * from Shop_User_Eval_Temp;
        
        CALL p_shop_user_eval(v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission);
        
        -- select * from Shop_User_Eval_Temp;
        
        UPDATE tmp_Stock_Item t_SI
        INNER JOIN Shop_User_Eval_Temp UE_T
			ON t_SI.id_product = UE_T.id_product
			AND UE_T.GUID = v_guid
        SET t_SI.can_view = UE_T.can_view,
			t_SI.can_edit = UE_T.can_edit,
            t_SI.can_admin = UE_T.can_admin
		;
        
        DELETE t_SI
		FROM tmp_Stock_Item t_SI
        /*
		LEFT JOIN Shop_User_Eval_Temp UE_T
			ON t_SI.id_product = UE_T.id_product
			AND UE_T.GUID = v_guid
		*/
		WHERE 
			/*
			FIND_IN_SET(t_SI.id_product, (
				SELECT GROUP_CONCAT(UET.id_product SEPARATOR ',') 
				FROM Shop_User_Eval_Temp UET)
			) = 0 # id_product NOT LIKE CONCAT('%', (SELECT GROUP_CONCAT(id_product SEPARATOR '|') FROM Shop_User_Eval_Temp), '%');
			*/
            /*
			ISNULL(UE_T.id_product)
			OR IFNULL(UE_T.can_view, 0) = 0
            */
            t_SI.id_product NOT IN (
				SELECT id_product 
                FROM Shop_User_Eval_Temp UE_T
                WHERE
					GUID = v_guid
					AND IFNULL(can_view, 0) = 1
			)
        ;
        
        # CALL p_shop_user_eval_clear_temp(v_guid);
        # DROP TABLE IF EXISTS Shop_User_Eval_Temp;
        DELETE FROM Shop_User_Eval_Temp
        WHERE GUID = v_guid
        ;
    END IF;
    
    
    -- Returns
    -- SET v_now := NOW();
    # Stock Items
    SELECT 
		t_SI.id_stock,
		t_SI.id_permutation,
		t_SI.id_product,
		t_SI.id_category,
		t_SI.date_purchased,
		t_SI.date_received,
		t_SI.id_location_storage,
		SL.name AS name_location_storage,
		t_SI.id_currency_cost,
		CURRENCY.symbol AS symbol_currency_cost,
		CURRENCY.code AS code_currency_cost,
		t_SI.cost_local_VAT_incl,
		t_SI.cost_local_VAT_excl,
		t_SI.is_sealed,
		t_SI.date_unsealed,
		t_SI.date_expiration,
		t_SI.is_consumed,
		t_SI.date_consumed,
		t_SI.active_stock_item,
		t_SI.active_permutation,
		t_SI.active_product,
		t_SI.active_category,
		IFNULL(t_SI.can_view, 0),
        IFNULL(t_SI.can_edit, 0),
        IFNULL(t_SI.can_admin, 0)
    FROM tmp_Stock_Item t_SI
	INNER JOIN tmp_Permutation t_PP ON t_SI.id_permutation = t_PP.id_permutation
	INNER JOIN tmp_Product t_P ON t_SI.id_product = t_P.id_product
	INNER JOIN tmp_Category t_C ON t_SI.id_category = t_C.id_category
	INNER JOIN tmp_Location_Storage t_LS ON t_SI.id_location_storage = t_LS.id_location
	INNER JOIN tmp_Plant_Storage t_PS ON t_LS.id_plant = t_PS.id_plant
    INNER JOIN Shop_Plant P ON t_PS.id_plant = P.id_plant
	INNER JOIN Shop_Address A ON P.id_address = A.id_address
	INNER JOIN tmp_Region_Storage t_RS ON A.id_region = t_RS.id_region
	INNER JOIN Shop_Storage_Location SL ON t_LS.id_location = SL.id_location
    INNER JOIN Shop_Currency CURRENCY ON t_SI.id_currency_cost = CURRENCY.id_currency
	WHERE
		IFNULL(t_SI.can_view, 0) = 1
	ORDER BY t_SI.rank_stock_item
	;

	# Variations
	SELECT
		V.id_variation,
		VT.id_type,
		t_SI.id_stock_item,
		t_SI.id_permutation,
		t_SI.id_product,
		t_SI.id_category,
		VT.code AS code_variation_type,
		VT.name AS name_variation_type,
		V.code AS code_variation,
		V.name AS name_variation,
		RANK() OVER (ORDER BY t_SI.rank_permutation, PPVL.display_order) AS display_order
	FROM Shop_Variation V
	INNER JOIN Shop_Variation_Type VT ON V.id_type = VT.id_type
	INNER JOIN Shop_Product_Permutation_Variation_Link PPVL ON V.id_variation = PPVL.id_variation
	INNER JOIN tmp_Stock_Item t_SI ON PPVL.id_permutation = t_SI.id_permutation
	INNER JOIN tmp_Permutation t_PP ON t_SI.id_permutation = t_PP.id_permutation
	INNER JOIN tmp_Product t_P ON t_SI.id_product = t_P.id_product
	INNER JOIN tmp_Category t_C ON t_SI.id_category = t_C.id_category
	INNER JOIN tmp_Location_Storage t_LS ON t_SI.id_location_storage = t_LS.id_location
	INNER JOIN tmp_Plant_Storage t_PS ON t_LS.id_plant = t_PS.id_plant
	INNER JOIN tmp_Region_Storage t_RS ON t_PS.id_region = t_RS.id_region
	WHERE 
		V.active
		AND PPVL.active
    ;
    
    # Errors
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
    
    
    -- Clean up
    DROP TEMPORARY TABLE IF EXISTS tmp_Region_Storage;
    DROP TEMPORARY TABLE IF EXISTS tmp_Plant_Storage;
    DROP TEMPORARY TABLE IF EXISTS tmp_Location_Storage;
	DROP TEMPORARY TABLE IF EXISTS tmp_Stock_Item;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Category;
	DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
END //
DELIMITER ;;

/*

CALL p_shop_get_many_stock_item (
	0, # a_id_user
    1, # a_get_all_category
	0, # a_get_inactive_category
	0, # a_get_first_category_only
	'', # a_ids_category
    1, # a_get_all_product
	0, # a_get_inactive_product
    0, # a_get_first_product_only
	'', # a_ids_product
    1, # a_get_all_product_permutation
	0, # a_get_inactive_permutation
	0, # a_get_first_permutation_only
	'1,2,3,4,5,6', # a_ids_permutation
	1, # a_get_all_stock_item
	0, # a_get_inactive_stock_item
	0, # a_get_first_stock_item_only
	'', # a_ids_stock_item
    0, # a_get_all_region_storage
    0, # a_get_inactive_delivery_region
	0, # a_get_first_region_storage_only
	'', # a_ids_region_storage
	0, # a_get_all_plant_storage
	0, # a_get_inactive_plant_storage
	0, # a_get_first_plant_storage_only
	'', # a_ids_plant_storage
	0, # a_get_all_location_storage
	0, # a_get_inactive_location_storage
	0, # a_get_first_location_storage_only
	'', # a_ids_location_storage
	NOW(), # a_date_received_to
	0, # a_get_sealed_stock_item_only
	0, # a_get_unsealed_stock_item_only
	0, # a_get_expired_stock_item_only
	0, # a_get_nonexpired_stock_item_only
	0, # a_get_consumed_stock_item_only
	0 # a_get_nonconsumed_stock_item_only
);



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
*/
