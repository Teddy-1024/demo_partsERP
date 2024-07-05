

CREATE OR REPLACE FUNCTION p_shop_get_many_supplier_purchase_order (
	IN a_id_user INTEGER,
    IN a_get_all_supplier BOOLEAN,
	IN a_get_inactive_supplier BOOLEAN,
	IN a_get_first_supplier_only BOOLEAN,
	IN a_ids_supplier INTEGER[],
    IN a_get_all_order BOOLEAN,
	IN a_get_inactive_order BOOLEAN,
	IN a_get_first_order_only BOOLEAN,
	IN a_ids_order INTEGER[],
	IN a_get_inactive_category BOOLEAN,
	IN a_ids_category INTEGER[],
	IN a_get_inactive_product BOOLEAN,
	IN a_ids_product INTEGER[],
	IN a_get_inactive_permutation BOOLEAN,
	IN a_ids_permutation INTEGER[],
    IN a_date_from TIMESTAMP,
    IN a_date_to TIMESTAMP
)
RETURNS SETOF REFCURSOR
AS $$
DECLARE
	v_id_user INTEGER;
	v_get_all_supplier BOOLEAN;
	v_get_inactive_supplier BOOLEAN;
	v_get_first_supplier_only BOOLEAN;
	v_ids_supplier INTEGER[];
	v_get_all_order BOOLEAN;
	v_get_inactive_order BOOLEAN;
	v_get_first_order_only BOOLEAN;
	v_ids_order INTEGER[];
	v_get_inactive_category BOOLEAN;
	v_ids_category INTEGER[];
	v_get_inactive_product BOOLEAN;
	v_ids_product INTEGER[];
	v_get_inactive_permutation BOOLEAN;
	v_ids_permutation INTEGER[];
	v_date_from TIMESTAMP;
	v_date_to TIMESTAMP;
	v_has_filter_supplier BOOLEAN;
	v_has_filter_order BOOLEAN;
	v_has_filter_category BOOLEAN;
	v_has_filter_product BOOLEAN;
	v_has_filter_permutation BOOLEAN;
	v_has_filter_date_from BOOLEAN;
	v_has_filter_date_to BOOLEAN;
	v_guid UUID;
	v_ids_permission_supplier_purchase_order INTEGER[];
	v_ids_product_permission INTEGER[];
	v_id_access_level_view INTEGER;
	v_code_error_data VARCHAR(50);
	v_id_type_error_data INTEGER;
	result_suppliers REFCURSOR;
	result_orders REFCURSOR;
	result_order_product_links REFCURSOR;
	-- result_errors REFCURSOR;
BEGIN
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_get_all_supplier := COALESCE(a_get_all_supplier, TRUE);
	v_get_inactive_supplier := COALESCE(a_get_inactive_supplier, FALSE);
	v_get_first_supplier_only := COALESCE(a_get_first_supplier_only, FALSE);
	v_ids_supplier := TRIM(COALESCE(a_ids_supplier, ''));
	v_get_all_order := COALESCE(a_get_all_order, TRUE);
	v_get_inactive_order := COALESCE(a_get_inactive_order, FALSE);
	v_get_first_order_only := COALESCE(a_get_first_order_only, FALSE);
	v_ids_order := TRIM(COALESCE(a_ids_order, ''));
	v_get_inactive_category := COALESCE(a_get_inactive_category, FALSE);
	v_ids_category := TRIM(COALESCE(a_ids_category, ''));
	v_get_inactive_product := COALESCE(a_get_inactive_product, FALSE);
	v_ids_product := TRIM(COALESCE(a_ids_product, ''));
	v_get_inactive_permutation := COALESCE(a_get_inactive_permutation, FALSE);
	v_ids_permutation := TRIM(COALESCE(a_ids_permutation, ''));
	v_date_from := a_date_from;
	v_date_to := a_date_to;
    
    v_guid := gen_random_uuid();
    v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    -- v_ids_permission_supplier_purchase_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'SHOP_SUPPLIER_PURCHASE_ORDER' LIMIT 1);
    v_code_error_data = 'BAD_DATA';
    v_id_type_error_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data);
    v_has_filter_supplier = (CARDINALITY(v_ids_supplier) > 0);
    v_has_filter_order = (CARDINALITY(v_ids_order) > 0);
    v_has_filter_category = (CARDINALITY(v_ids_category) > 0);
    v_has_filter_product = (CARDINALITY(v_ids_product) > 0);
    v_has_filter_permutation = (CARDINALITY(v_ids_permutation) > 0);
    v_has_filter_date_from = CASE WHEN ISNULL(v_date_from) THEN FALSE ELSE TRUE END;
    v_has_filter_date_to = CASE WHEN ISNULL(v_date_to) THEN FALSE ELSE TRUE END;

    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order_Product_Link;
    DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order;
    DROP TABLE IF EXISTS tmp_Shop_Supplier;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    
    CREATE TABLE tmp_Shop_Supplier (
		id_supplier INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Supplier_id_supplier
			FOREIGN KEY (id_supplier)
			REFERENCES Shop_Supplier(id_supplier),
        active BOOLEAN NOT NULL,
        rank_supplier INTEGER NULL,
        can_view BOOLEAN, 
        can_edit BOOLEAN, 
        can_admin BIT
    );
    
    CREATE TABLE tmp_Shop_Supplier_Purchase_Order (
		id_order INTEGER NOT NULL PRIMARY KEY,
		id_supplier_ordered INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Supplier_Purchase_Order_id_supplier_ordered
			FOREIGN KEY (id_supplier_ordered) 
			REFERENCES Shop_Supplier(id_supplier),
		cost_total_local REAL NOT NULL,
		id_currency_cost INTEGER NOT NULL,
        active BOOLEAN NOT NULL,
        rank_order INTEGER NOT NULL
    );
    
    /*
    CREATE TABLE tmp_Shop_Supplier_Purchase_Order_Product_Link (
		id_link INTEGER NOT NULL PRIMARY KEY,
		id_order INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_Supplier_Purchase_Order(id_order),
		id_permutation INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		cost_total_local REAL NOT NULL,
		id_currency_cost INTEGER NOT NULL,
		quantity_ordered REAL NOT NULL,
		id_unit_quantity INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_received REAL NULL,
		latency_delivery_days INTEGER NOT NULL,
		display_order INTEGER NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Product (
		id_category INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Category(id_category),
		id_product INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		-- product_has_variations BOOLEAN NOT NULL,
		id_permutation INTEGER NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
        active_category BOOLEAN NOT NULL,
        active_product BOOLEAN NOT NULL,
        active_permutation BOOLEAN NULL,
        display_order_category INTEGER NOT NULL, 
        display_order_product INTEGER NOT NULL, 
        display_order_permutation INTEGER NULL, 
        rank_permutation INTEGER NOT NULL, -- _in_category
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
		CONSTRAINT FK_tmp_Shop_Product_id_recurrence_interval
			FOREIGN KEY (id_recurrence_interval)
			REFERENCES Shop_Recurrence_Interval(id_interval),
		count_recurrence_interval INTEGER,
        id_stripe_product VARCHAR(100),
        product_has_variations INTEGER NOT NULL,
        can_view BOOLEAN, 
        can_edit BOOLEAN, 
        can_admin BIT
    );
    
	/*
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
    */

	-- select v_has_filter_product, v_has_filter_permutation;
    
    IF v_has_filter_supplier THEN
		IF EXISTS (
			SELECT * 
			FROM UNNEST(v_ids_supplier) AS Supplier_Id
			LEFT JOIN Shop_Supplier S ON Supplier_Id = S.id_supplier
			WHERE ISNULL(S.id_supplier)
			LIMIT 1
		) THEN 
			RAISE EXCEPTION 'Invalid supplier IDs: %', (
				SELECT STRING_AGG(Supplier_Id, ', ')
				FROM UNNEST(v_ids_supplier) AS Supplier_Id
				LEFT JOIN Shop_Supplier S ON Supplier_Id = S.id_supplier
				WHERE ISNULL(S.id_supplier)
				LIMIT 1
			)
			USING ERRCODE = '22000'
			;
		ELSE
			INSERT INTO tmp_Shop_Supplier (
				id_supplier,
                active,
                rank_supplier
			)
			SELECT 
				S.id_supplier,
                S.active,
                RANK() OVER (ORDER BY id_supplier ASC) AS rank_supplier
			FROM Shop_Supplier S
            INNER JOIN Split_Temp TS ON S.id_supplier = TS.substring
            WHERE
				(
					v_get_inactive_supplier
                    OR S.active = TRUE
                )
			;
        END IF;
		
		IF v_get_first_supplier_only THEN
			DELETE FROM tmp_Shop_Supplier t_S
				WHERE t_S.rank_supplier > (
					SELECT MIN(t_S.rank_supplier)
                    FROM tmp_Shop_Supplier t_S
				)
			;
		END IF;
    END IF;
    
    IF v_has_filter_category = TRUE THEN
		IF EXISTS (
			SELECT * 
			FROM UNNEST(v_ids_category) AS Category_Id
			LEFT JOIN Shop_Category C ON Category_Id = C.id_category
			WHERE ISNULL(C.id_category)
		) THEN 
			RAISE EXCEPTION 'Invalid category IDs: %', (
				SELECT STRING_AGG(Category_Id, ', ')
				FROM UNNEST(v_ids_category) AS Category_Id
				LEFT JOIN Shop_Category C ON Category_Id = C.id_category
				WHERE ISNULL(C.id_category)
			)
			USING ERRCODE = '22000'
			;
		END IF;
	END IF;
    
    IF v_has_filter_product = TRUE THEN
		IF EXISTS (
			SELECT *
			FROM UNNEST(v_ids_product) AS Product_Id
			LEFT JOIN Shop_Product P ON Product_Id = P.id_product
			WHERE ISNULL(P.id_product)
			LIMIT 1
		) THEN 
			RAISE EXCEPTION 'Invalid product IDs: %', (
				SELECT STRING_AGG(Product_Id, ', ')
				FROM UNNEST(v_ids_product) AS Product_Id
				LEFT JOIN Shop_Product P ON Product_Id = P.id_product
				WHERE ISNULL(P.id_product)
			)
			USING ERRCODE = '22000'
			;
		END IF;
	END IF;
    
    IF v_has_filter_permutation = TRUE THEN
		IF EXISTS (
			SELECT *
			FROM UNNEST(v_ids_permutation) AS Permutation_Id
			LEFT JOIN Shop_Product_Permutation PP ON Permutation_Id = PP.id_permutation
			WHERE ISNULL(PP.id_permutation)
			LIMIT 1
		) THEN 
			RAISE EXCEPTION 'Invalid permutation IDs: %', (
				SELECT STRING_AGG(Permutation_Id, ', ')
				FROM UNNEST(v_ids_permutation) AS Permutation_Id
				LEFT JOIN Shop_Product_Permutation PP ON Permutation_Id = PP.id_permutation
				WHERE ISNULL(PP.id_permutation)
			)
			USING ERRCODE = '22000'
			;
		END IF;
	END IF;
    
    IF v_has_filter_category = TRUE OR v_has_filter_product = TRUE OR v_has_filter_permutation = TRUE THEN
		INSERT INTO tmp_Shop_Product (
			id_category,
			id_product,
			id_permutation,
			active_category,
			active_product,
			active_permutation,
			display_order_category,
			display_order_product,
			display_order_permutation
			-- rank_permutation,
			/*
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
			*/
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
			PP.display_order AS display_order_permutation
			-- RANK() OVER (ORDER BY C.display_order, P.display_order, PP.display_order) AS rank_permutation, #PARTITION BY P.id_category -- _in_category
			/*
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
			*/
		FROM Shop_Product P
		INNER JOIN Shop_Product_Permutation PP
			ON P.id_product = PP.id_product
		INNER JOIN Shop_Category C
			ON P.id_category = C.id_category
		WHERE
			-- permutations
			(
				(
					NOT v_has_filter_permutation 
					OR FIND_IN_SET(PP.id_permutation, v_ids_permutation) > 0
				)
				AND (
					v_get_inactive_permutation 
					OR PP.active = TRUE
				)
			)
			-- categories
			AND (
				(
					NOT v_has_filter_category 
					OR FIND_IN_SET(P.id_category, v_ids_category) > 0
				)
				AND (
					v_get_inactive_category 
					OR C.active = TRUE
				)
			) 
			-- products
			AND (
				(
					NOT v_has_filter_product 
					OR FIND_IN_SET(P.id_product, v_ids_product) > 0
				)
				AND (
					v_get_inactive_product 
					OR P.active = TRUE
				)
			)
		;
    END IF;
    
    -- Get orders
	IF v_has_filter_order AND EXISTS (
		-- SELECT * FROM Split_Temp TS LEFT JOIN Shop_Supplier_Purchase_Order SPO ON TS.substring = SPO.id_order WHERE ISNULL(SPO.id_order)
		SELECT *
		FROM UNNEST(v_ids_order) Order_Id
		
	) THEN 
		RAISE EXCEPTION 'Invalid order IDs: %', (
			SELECT STRING_AGG(TS.substring, ', ')
			FROM UNNEST(v_ids_order) 
			LEFT JOIN Shop_Supplier_Purchase_Order SPO ON TS.substring = SPO.id_order 
			WHERE ISNULL(SPO.id_order)
		)
		USING ERRCODE = '22000'
		;
	END IF;
	
	INSERT INTO tmp_Shop_Supplier_Purchase_Order ( -- _Product_Link
		id_order,
		-- active,
		rank_order
	)
	SELECT 
		SPO.id_order,
		-- SPO.active,
		RANK() OVER (ORDER BY SPO.id_order ASC) AS rank_order
	FROM Shop_Supplier_Purchase_Order SPO
	-- INNER JOIN Split_Temp TS ON SPO.id_order = TS.substring
	INNER JOIN Shop_Supplier_Purchase_Order_Product_Link SPOPL ON SPO.id_order = SPOPL.id_order
	INNER JOIN Shop_Supplier S ON SPO.id_supplier_ordered = S.id_supplier
	INNER JOIN Shop_Product_Permutation PP ON SPOPL.id_permutation = PP.id_permutation
	INNER JOIN Shop_Product P ON PP.id_product = P.id_product
	INNER JOIN Shop_Category C ON P.id_category = C.id_category
	LEFT JOIN tmp_Shop_Product t_P ON SPOPL.id_permutation = t_P.id_permutation
	LEFT JOIN tmp_Shop_Supplier t_S ON SPO.id_supplier_ordered = t_S.id_supplier
	WHERE
		-- supplier
		(
			v_has_filter_supplier = FALSE
			OR NOT ISNULL(t_S.id_supplier) -- SPO.id_supplier_ordered IN (SELECT DISTINCT id_supplier FROM tmp_Shop_Supplier)
		)
		-- order
		AND (
			(
				v_has_filter_order = FALSE
				OR (
					-- ID
					-- FIND_IN_SET(SPO.id_order, v_ids_order) > 0
					SPO.id_order = ANY(v_ids_order)
					-- date
					AND (
						(
							v_has_filter_date_from = FALSE
							OR SPO.created_on > v_date_from
						)
						AND (
							v_has_filter_date_to = FALSE
							OR SPO.created_on < v_date_to
						)
					)
				)
			)
			-- active
			/*
			AND (
				v_get_inactive_order
				OR SPO.active = TRUE
			)
			*/
		)
		-- permutations
		AND (
			(
				v_has_filter_category = FALSE 
				AND v_has_filter_product = FALSE 
				AND v_has_filter_permutation = FALSE
			)
			OR NOT ISNULL(t_P.id_permutation) -- SPO.id_permutation IN (SELECT DISTINCT id_permutation FROM tmp_Shop_Product)
		)
	;
	
	IF v_get_first_order_only THEN
		DELETE FROM tmp_Shop_Supplier_Purchase_Order t_SPO
			WHERE t_SPO.rank_order > (
				SELECT MIN(t_SPO.rank_order)
				FROM tmp_Shop_Supplier_Purchase_Order t_SPO
			)
		;
	END IF;
    
    -- Permissions
	-- v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER);
	v_ids_permission_supplier_purchase_order := (SELECT STRING_AGG(id_permission, ',') FROM Shop_Permission WHERE code IN ('STORE_SUPPLIER', 'STORE_SUPPLIER_PURCHASE_ORDER'));
	-- v_ids_permutation_permission := (SELECT STRING_AGG(id_permutation, ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
	v_ids_product_permission := (SELECT STRING_AGG(DISTINCT t_P.id_product, ',') FROM tmp_Shop_Product t_P WHERE NOT ISNULL(t_P.id_product));
	
	-- SELECT v_guid, v_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
	-- select * from Shop_User_Eval_Temp;
	
	CALL p_shop_user_eval(v_guid, v_id_user, FALSE, v_ids_permission_supplier_purchase_order, v_id_access_level_view, v_ids_product_permission);
	
	-- select * from Shop_User_Eval_Temp;
	
	IF NOT EXISTS (SELECT can_view FROM Shop_User_Eval_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
		RAISE EXCEPTION 'You do not have view permissions for %', (
			SELECT STRING_AGG(name, ', ')
			FROM Shop_Permission 
			WHERE id_permission = v_ids_permission_supplier_purchase_order
		)
		USING ERRCODE = '42501'
		;
	END IF;
	
	
	UPDATE tmp_Shop_Product t_P
	SET t_P.can_view = UE_T.can_view,
		t_P.can_edit = UE_T.can_edit,
		t_P.can_admin = UE_T.can_admin
	FROM tmp_Shop_Product t_P
	INNER JOIN Shop_User_Eval_Temp UE_T
		ON t_P.id_product = UE_T.id_product -- t_P.id_permutation = UE_T.id_permutation
		AND UE_T.GUID = v_guid
	;
	
	-- CALL p_shop_user_eval_clear_temp(v_guid);
	-- DROP TABLE IF EXISTS Shop_User_Eval_Temp;
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid
	;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns
    -- v_now := CURRENT_TIMESTAMP;
    
    -- Suppliers
	OPEN result_suppliers FOR
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
		FROM tmp_Shop_Supplier t_S
		INNER JOIN Shop_Supplier S
			ON t_S.id_supplier = S.id_supplier
		;
    RETURN NEXT result_suppliers;
    
    -- Supplier Purchase Order
	OPEN result_orders FOR
		SELECT -- *
			t_SPO.id_order,
			SPO.id_supplier_ordered,
			SPO.cost_total_local,
			SPO.id_currency_cost,
			t_SPO.active
		FROM Shop_Supplier_Purchase_Order SPO
		INNER JOIN tmp_Shop_Supplier_Purchase_Order t_SPO ON SPO.id_order = t_SPO.id_order
		;
    RETURN NEXT result_orders;
    
    -- Supplier Purchase Order Product Link
	OPEN result_order_product_links FOR
		SELECT
			SPOPL.id_link,
			SPOPL.id_order,
			SPOPL.id_permutation,
			P.name as name_product,
			SPOPL.cost_total_local,
			SPOPL.id_currency_cost,
			SPOPL.quantity_ordered,
			SPOPL.id_unit_quantity,
			SPOPL.quantity_received,
			SPOPL.latency_delivery_days,
			SPOPL.display_order
		FROM Shop_Supplier_Purchase_Order_Product_Link SPOPL
		-- INNER JOIN tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL ON SPOPL.id_link = t_SPOPL.id_link
		INNER JOIN tmp_Shop_Supplier_Purchase_Order t_SPO ON SPOPL.id_order = t_SPO.id_order
		INNER JOIN Shop_Product_Permutation PP ON SPOPL.id_permutation = PP.id_permutation
		INNER JOIN Shop_Product P ON PP.id_product = P.id_product
		INNER JOIN Shop_Category C ON P.id_category = C.id_category
		ORDER BY SPOPL.id_order, C.display_order, P.display_order, PP.display_order
		;
    RETURN NEXT result_order_product_links;
    
    -- Errors
	/*
    SELECT 
		/*
        t_ME.display_order,
		t_ME.guid,
        t_ME.id_type,
        t_ME.msg,
        MET.code, 
        MET.name,
        MET.description
        */
        *
    FROM tmp_Msg_Error t_ME
    INNER JOIN Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    WHERE guid = v_guid
    ;
	*/

	/*
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
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
    DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order_Product_Link;
    DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order;
    DROP TABLE IF EXISTS tmp_Shop_Supplier;
    DROP TABLE IF EXISTS tmp_Shop_Product;
        
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid
	;
END;
$$ LANGUAGE plpgsql;


/*

DROP FUNCTION IF EXISTS fetch_results;

CREATE OR REPLACE FUNCTION fetch_results()
RETURNS VOID AS $$
DECLARE
    curs refcursor;
    rec record;
BEGIN
    FOR curs IN SELECT p_shop_get_many_supplier_purchase_order (
		'', -- a_id_user
		TRUE, -- a_get_all_supplier
		FALSE, -- a_get_inactive_supplier
		FALSE, -- a_get_first_supplier_only
		'', -- a_ids_supplier
		TRUE, -- a_get_all_order
		-- FALSE, -- a_get_inactive_order
		FALSE, -- a_get_first_order_only
		'', -- a_ids_order
		FALSE, -- a_get_inactive_category
		'', -- a_ids_category
		FALSE, -- a_get_inactive_product
		'', -- a_ids_product
		FALSE, -- a_get_inactive_permutation
		'', -- a_ids_permutation
		NULL, -- a_date_from
		NULL -- a_date_to
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

