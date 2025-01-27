

CREATE OR REPLACE FUNCTION p_shop_get_many_customer_sales_order (
	IN a_id_user INTEGER,
    IN a_get_all_customer BOOLEAN,
	IN a_get_inactive_customer BOOLEAN,
	IN a_get_first_customer_only BOOLEAN,
	IN a_ids_customer INTEGER[],
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
	v_get_all_customer BOOLEAN;
	v_get_inactive_customer BOOLEAN;
	v_get_first_customer_only BOOLEAN;
	v_ids_customer INTEGER[];
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
	-- Argument redeclaration
	-- Variable declaration
    v_has_filter_customer BOOLEAN;
    v_has_filter_order BOOLEAN;
    v_has_filter_category BOOLEAN;
    v_has_filter_product BOOLEAN;
    v_has_filter_permutation BOOLEAN;
    v_has_filter_date_from BOOLEAN;
    v_has_filter_date_to BOOLEAN;
    v_guid UUID;
    -- v_id_user VARCHAR(100);
    -- v_ids_permutation_unavailable VARCHAR(4000);
    v_ids_permission_customer_purchase_order VARCHAR(4000);
    v_ids_product_permission VARCHAR(4000);
    -- v_ids_permutation_permission VARCHAR(4000);
    v_id_access_level_view INTEGER;
    -- v_now TIMESTAMP;
    -- v_id_minimum INTEGER;
    v_code_error_data VARCHAR(50);
    v_id_type_error_data INTEGER;
	result_customers REFCURSOR;
	result_orders REFCURSOR;
	result_order_product_links REFCURSOR;
	-- result_errors REFCURSOR;
BEGIN
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_get_inactive_customer := COALESCE(a_get_inactive_customer, FALSE);
	v_get_first_customer_only := COALESCE(a_get_first_customer_only, FALSE);
	v_ids_customer := TRIM(COALESCE(a_ids_customer, ''));
	v_get_all_customer := COALESCE(a_get_all_customer, CASE WHEN v_ids_customer = '' THEN TRUE ELSE FALSE END);
    v_get_inactive_order := COALESCE(a_get_inactive_order, FALSE);
	v_get_first_order_only := COALESCE(a_get_first_order_only, FALSE);
	v_ids_order := TRIM(COALESCE(a_ids_order, ''));
	v_get_all_order := COALESCE(a_get_all_order, CASE WHEN v_ids_order = '' THEN TRUE ELSE FALSE END);
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
    -- v_ids_permission_customer_purchase_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'Shop_Customer_Sales_ORDER' LIMIT 1);
    v_code_error_data := 'BAD_DATA';
    v_id_type_error_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data);
	
    v_has_filter_category := CASE WHEN a_ids_category = '' THEN FALSE ELSE TRUE END;
    v_has_filter_product := CASE WHEN a_ids_product = '' THEN FALSE ELSE TRUE END;
    v_has_filter_permutation := CASE WHEN a_ids_permutation = '' THEN FALSE ELSE TRUE END;
    v_has_filter_date_from := CASE WHEN ISNULL(a_date_from) THEN FALSE ELSE TRUE END;
    v_has_filter_date_to := CASE WHEN ISNULL(a_date_to) THEN FALSE ELSE TRUE END;
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Customer_Sales_Order_Product_Link;
    DROP TABLE IF EXISTS tmp_Shop_Customer_Sales_Order;
    DROP TABLE IF EXISTS tmp_Shop_Customer;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    
    CREATE TABLE tmp_Shop_Customer (
		id_customer INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Customer_id_customer
			FOREIGN KEY (id_customer)
			REFERENCES Shop_Customer(id_customer),
        active BOOLEAN NOT NULL,
        rank_customer INTEGER NULL,
        can_view BOOLEAN, 
        can_edit BOOLEAN, 
        can_admin BIT
    );
    
    CREATE TABLE tmp_Shop_Customer_Sales_Order (
		id_order INTEGER NOT NULL PRIMARY KEY,
        /*
		id_customer INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Customer_Sales_Order_id_customer
			FOREIGN KEY (id_customer) 
			REFERENCES Shop_Customer(id_customer),
		price_total_local REAL NOT NULL,
		id_currency_price INTEGER NOT NULL,
        */
        active BOOLEAN NOT NULL,
        rank_order INTEGER NOT NULL
    );
    
    /*
    CREATE TABLE tmp_Shop_Customer_Sales_Order_Product_Link (
		id_link INTEGER NOT NULL PRIMARY KEY,
		id_order INTEGER NOT NULL,
		CONSTRAINT FK_tmp_customer_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_Customer_Sales_Order(id_order),
		id_permutation INTEGER NOT NULL,
		CONSTRAINT FK_tmp_customer_Purchase_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		price_total_local REAL NOT NULL,
		id_currency_price INTEGER NOT NULL,
		quantity_ordered REAL NOT NULL,
		id_unit_quantity INTEGER NOT NULL,
		CONSTRAINT FK_tmp_customer_Purchase_Order_Product_Link_id_unit_quantity
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
			REFERENCES Shop_Product_Category(id_category),
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
        -- name VARCHAR(255) NOT NULL,
        -- description VARCHAR(4000) NOT NULL,
		/*
        price_GBP_full REAL NOT NULL,
		price_GBP_min REAL NOT NULL,
		*/
        /*
        latency_manufacture INTEGER NOT NULL,
		quantity_min REAL NOT NULL,
		quantity_max REAL NOT NULL,
		quantity_step REAL NOT NULL,
		quantity_stock REAL NOT NULL,
		is_subscription BOOLEAN NOT NULL,
		id_unit_measurement_interval_recurrence INTEGER,
		CONSTRAINT FK_tmp_Shop_Product_id_unit_measurement_interval_recurrence
			FOREIGN KEY (id_unit_measurement_interval_recurrence)
			REFERENCES Shop_Interval_Recurrence(id_interval),
		count_interval_recurrence INTEGER,
        id_stripe_product VARCHAR(100),
        product_has_variations INTEGER NOT NULL,
        */
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
    
    IF v_has_filter_customer = TRUE OR a_get_all_customer = TRUE THEN
		IF EXISTS (
			SELECT * 
			FROM UNNEST(v_ids_customer) AS Customer_Id
			LEFT JOIN Shop_Customer C ON Customer_Id = C.id_customer
			WHERE ISNULL(C.id_customer)
			LIMIT 1
		) THEN 
			RAISE EXCEPTION 'Invalid customer IDs: %', (
				SELECT STRING_AGG(Customer_Id, ', ')
				FROM UNNEST(v_ids_customer) AS Customer_Id
				LEFT JOIN Shop_Customer C ON Customer_Id = C.id_customer
				WHERE ISNULL(C.id_customer)
			)
			USING ERRCODE = '22000'
			;
		ELSE
			INSERT INTO tmp_Shop_Customer (
				id_customer,
                active,
                rank_customer
			)
			SELECT 
				C.id_customer,
                C.active,
                RANK() OVER (ORDER BY id_customer ASC) AS rank_customer
			FROM Shop_Customer C
            -- LEFT JOIN Split_Temp S_T ON C.id_customer = S_T.substring
            WHERE
				(
					a_get_all_customer = TRUE
                    -- OR NOT ISNULL(S_T.substring)
					OR C.id_customer = ANY(v_ids_customer)
                )
				AND (
					a_get_inactive_customer
                    OR C.active = TRUE
                )
			;
        END IF;
		
		IF a_get_first_customer_only THEN
			DELETE FROM tmp_Shop_Customer t_C
				WHERE t_C.rank_customer > (
					SELECT MIN(t_C.rank_customer)
                    FROM tmp_Shop_Customer t_C
				)
			;
		END IF;
    END IF;
    
    IF v_has_filter_category = TRUE AND EXISTS (
		SELECT STRING_AGG(Category_Id, ', ')
		FROM UNNEST(v_ids_category) AS Category_Id
		LEFT JOIN Shop_Product_Category C ON Category_Id = C.id_customer
		WHERE ISNULL(C.id_customer)
		LIMIT 1
	) THEN 
		RAISE EXCEPTION 'Invalid category IDs: %', (
			SELECT STRING_AGG(Category_Id, ', ')
			FROM UNNEST(v_ids_category) AS Category_Id
			LEFT JOIN Shop_Product_Category C ON Category_Id = C.id_customer
			WHERE ISNULL(C.id_customer)
		)
		USING ERRCODE = '22000'
		;
	END IF;
    
    IF v_has_filter_product = TRUE AND EXISTS (
		SELECT *
		FROM UNNEST(v_ids_product) AS Product_Id
		LEFT JOIN Shop_Product P ON Product_Id = P.id_product
		WHERE ISNULL(P.id_product)
		LIMIT 1
	) THEN 
		RAISE EXCEPTION 'Invalid product IDs: %', (
			SELECT COALESCE(STRING_AGG(Product_Id, ', ') ,'NULL')
			FROM UNNEST(v_ids_product) AS Product_Id
			LEFT JOIN Shop_Product P ON Product_Id = P.id_product
			WHERE ISNULL(P.id_product)
		)
		USING ERRCODE = '22000'
		;
	END IF;
    
    IF v_has_filter_permutation = TRUE AND EXISTS (
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
			id_unit_measurement_interval_recurrence,
			count_interval_recurrence,
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
			PP.id_unit_measurement_interval_recurrence,
			PP.count_interval_recurrence,
			PP.id_stripe_product,
			P.has_variations
			*/
		FROM Shop_Product P
		INNER JOIN Shop_Product_Permutation PP
			ON P.id_product = PP.id_product
		INNER JOIN Shop_Product_Category C
			ON P.id_category = C.id_category
		WHERE
			-- permutations
			(
				(
					NOT v_has_filter_permutation 
					OR FIND_IN_SET(PP.id_permutation, a_ids_permutation) > 0
				)
				AND (
					a_get_inactive_permutation 
					OR PP.active = TRUE
				)
			)
			-- categories
			AND (
				(
					NOT v_has_filter_category 
					OR FIND_IN_SET(P.id_category, a_ids_category) > 0
				)
				AND (
					a_get_inactive_category 
					OR C.active = TRUE
				)
			) 
			-- products
			AND (
				(
					NOT v_has_filter_product 
					OR FIND_IN_SET(P.id_product, a_ids_product) > 0
				)
				AND (
					a_get_inactive_product 
					OR P.active = TRUE
				)
			)
		;
    END IF;
    
    -- Get orders
	IF v_has_filter_order AND EXISTS (
		SELECT * 
		FROM UNNEST(v_ids_order) AS Order_Id
		LEFT JOIN Shop_Customer_Sales_Order CSO ON Order_Id = CSO.id_order
		WHERE ISNULL(CSO.id_order)
		LIMIT 1
	) THEN 
		RAISE EXCEPTION 'Invalid order IDs: %', (
			SELECT STRING_AGG(Order_Id, ', ')
			FROM UNNEST(v_ids_order) AS Order_Id
			LEFT JOIN Shop_Customer_Sales_Order CSO ON Order_Id = CSO.id_order
			WHERE ISNULL(CSO.id_order)
		)
		USING ERRCODE = '22000'
		;
	END IF;
	
	INSERT INTO tmp_Shop_Customer_Sales_Order ( -- _Product_Link
		id_order,
		active,
		rank_order
	)
	SELECT 
		CSO.id_order,
		CSO.active,
		RANK() OVER (ORDER BY CSO.id_order ASC) AS rank_order
	FROM Shop_Customer_Sales_Order CSO
	-- LEFT JOIN Split_Temp S_T ON CSO.id_order = S_T.substring
	INNER JOIN Shop_Customer_Sales_Order_Product_Link CSOPL ON CSO.id_order = CSOPL.id_order
	INNER JOIN Shop_Customer S ON CSO.id_customer = S.id_customer
	INNER JOIN Shop_Product_Permutation PP ON CSOPL.id_permutation = PP.id_permutation
	INNER JOIN Shop_Product P ON PP.id_product = P.id_product
	INNER JOIN Shop_Product_Category C ON P.id_category = C.id_category
	LEFT JOIN tmp_Shop_Product t_P ON CSOPL.id_permutation = t_P.id_permutation
	LEFT JOIN tmp_Shop_Customer t_S ON CSO.id_customer = t_S.id_customer
	WHERE
		-- customer
		/*
		(
			a_get_all_customer = 1
			OR NOT ISNULL(t_S.id_customer) -- CSO.id_customer IN (SELECT DISTINCT id_customer FROM tmp_Shop_Customer)
		)
		*/
		NOT ISNULL(t_S.id_customer)
		-- order
		AND (
			(
				a_get_all_order = 1
				OR (
					-- ID
					-- FIND_IN_SET(CSO.id_order, a_ids_order) > 0
					-- NOT ISNULL(S_T.substring)
					CSO.id_order = ANY(v_ids_order)
					-- date
					AND (
						(
							v_has_filter_date_from = 0
							OR CSO.created_on > a_date_from
						)
						AND (
							v_has_filter_date_to = 0
							OR CSO.created_on < a_date_to
						)
					)
				)
			)
			-- active
			AND (
				a_get_inactive_order
				OR CSO.active = TRUE
			)
		)
		-- permutations
		AND (
			(
				v_has_filter_category = FALSE 
				AND v_has_filter_product = FALSE 
				AND v_has_filter_permutation = 0
			)
			OR NOT ISNULL(t_P.id_permutation) -- CSO.id_permutation IN (SELECT DISTINCT id_permutation FROM tmp_Shop_Product)
		)
	;
	
	IF a_get_first_order_only THEN
		DELETE FROM tmp_Shop_Customer_Sales_Order t_CSO
			WHERE t_CSO.rank_order > (
				SELECT MIN(t_CSO.rank_order)
				FROM tmp_Shop_Customer_Sales_Order t_CSO
			)
		;
	END IF;
    
    -- Permissions
	-- v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER);
	v_ids_permission_customer_purchase_order := (SELECT STRING_AGG(id_permission, ',') FROM Shop_Permission WHERE code IN ('STORE_customer', 'STORE_customer_PURCHASE_ORDER'));
	-- v_ids_permutation_permission := (SELECT STRING_AGG(id_permutation, ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
	v_ids_product_permission := (SELECT STRING_AGG(P.id_product, ',') FROM (SELECT DISTINCT id_product FROM tmp_Shop_Product WHERE NOT ISNULL(id_product)) P);
	
	-- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
	-- select * from Shop_Calc_User_Temp;
	
	CALL p_shop_calc_user(v_guid, a_id_user, FALSE, v_ids_permission_customer_purchase_order, v_id_access_level_view, v_ids_product_permission);
	
	-- select * from Shop_Calc_User_Temp;
	
	IF NOT EXISTS (SELECT can_view FROM Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
		RAISE EXCEPTION 'You do not have view permissions for %', (
			SELECT COALESCE(STRING_AGG(name, ', '), 'NULL') 
			FROM Shop_Permission 
			WHERE id_permission = v_ids_permission_customer_purchase_order
		)
		USING ERRCODE = '42501'
		;
	END IF;
	
	
	UPDATE tmp_Shop_Product t_P
	SET t_P.can_view = UE_T.can_view,
		t_P.can_edit = UE_T.can_edit,
		t_P.can_admin = UE_T.can_admin
	FROM tmp_Shop_Product t_P
	INNER JOIN Shop_Calc_User_Temp UE_T
		ON t_P.id_product = UE_T.id_product -- t_P.id_permutation = UE_T.id_permutation
		AND UE_T.GUID = v_guid
	;
	
	-- CALL p_shop_clear_calc_user(v_guid);
	-- DROP TABLE IF EXISTS Shop_Calc_User_Temp;
	DELETE FROM Shop_Calc_User_Temp
	WHERE GUID = v_guid
	;
    
    
    -- select * from tmp_Shop_Customer;
    -- select * from tmp_Shop_Product;
    
    -- Returns
    -- v_now := CURRENT_TIMESTAMP;
    
    -- customers
	OPEN result_customers FOR
		SELECT 
			t_S.id_customer,
			S.name_company,
			S.name_contact,
			S.department_contact,
			S.id_address,
			S.phone_number,
			S.email,
			S.id_currency,
			t_S.active
		FROM tmp_Shop_Customer t_S
		INNER JOIN Shop_Customer S
			ON t_S.id_customer = S.id_customer
		;
    RETURN NEXT result_customers;
    
    -- Customer Sales Order
	OPEN result_orders FOR
		SELECT -- *
			t_CSO.id_order,
			CSO.id_customer,
			CSO.price_total_local,
			CSO.id_currency_price,
			t_CSO.active
		FROM Shop_Customer_Sales_Order CSO
		INNER JOIN tmp_Shop_Customer_Sales_Order t_CSO ON CSO.id_order = t_CSO.id_order
		;
    RETURN NEXT result_orders;
    
    -- Customer Sales Order Product Link
	OPEN result_order_product_links FOR
		SELECT
			CSOPL.id_link,
			CSOPL.id_order,
			CSOPL.id_permutation,
			P.name as name_product,
			CSOPL.price_total_local,
			CSOPL.id_currency_price,
			CSOPL.quantity_ordered,
			CSOPL.id_unit_quantity,
			CSOPL.quantity_delivered,
			CSOPL.latency_delivery_days,
			CSOPL.display_order
		FROM Shop_Customer_Sales_Order_Product_Link CSOPL
		-- INNER JOIN tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL ON CSOPL.id_link = t_CSOPL.id_link
		INNER JOIN tmp_Shop_Customer_Sales_Order t_CSO ON CSOPL.id_order = t_CSO.id_order
		INNER JOIN Shop_Product_Permutation PP ON CSOPL.id_permutation = PP.id_permutation
		INNER JOIN Shop_Product P ON PP.id_product = P.id_product
		INNER JOIN Shop_Product_Category C ON P.id_category = C.id_category
		ORDER BY CSOPL.id_order, C.display_order, P.display_order, PP.display_order
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
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
    */

    /*
    -- Return arguments for test
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
    
    -- select 'other outputs';
    -- select * from tmp_Shop_Product;
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_Customer_Sales_Order_Product_Link;
    DROP TABLE IF EXISTS tmp_Shop_Customer_Sales_Order;
    DROP TABLE IF EXISTS tmp_Shop_Customer;
    DROP TABLE IF EXISTS tmp_Shop_Product;
        
	DELETE FROM Shop_Calc_User_Temp
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
    FOR curs IN SELECT p_shop_get_many_customer_sales_order (
		'', -- a_id_user
		1, -- a_get_all_customer
		0, -- a_get_inactive_customer
		0, -- a_get_first_customer_only
		'', -- a_ids_customer
		1, -- a_get_all_order
		0, -- a_get_inactive_order
		0, -- a_get_first_order_only
		'', -- a_ids_order
		0, -- a_get_inactive_category
		'', -- a_ids_category
		0, -- a_get_inactive_product
		'', -- a_ids_product
		0, -- a_get_inactive_permutation
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

