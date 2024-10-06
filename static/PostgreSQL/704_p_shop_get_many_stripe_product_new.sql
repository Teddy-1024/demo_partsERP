

/*

CALL p_shop_get_many_stripe_product_new (
	''
)

*/

CREATE OR REPLACE FUNCTION p_shop_get_many_stripe_product_new (
	IN a_id_user INTEGER
)
RETURNS SETOF REFCURSOR
AS $$
DECLARE
	v_id_user INTEGER;
	v_code_error_data VARCHAR(200);
	v_code_error_permission VARCHAR(200);
	v_guid UUID; 
	result_products REFCURSOR;
	result_product_variation_links REFCURSOR;
	-- result_errors REFCURSOR;
BEGIN
	v_id_user := a_id_user;
    v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 1);
    v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
	v_guid = gen_random_uuid();
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_User;
    
    CREATE TEMPORARY TABLE tmp_Shop_User(
		id_user INTEGER PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BOOLEAN NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Shop_Product (
		id_product INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		id_permutation INTEGER NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
        active BOOLEAN NOT NULL,
        display_order_product INTEGER NOT NULL,
        display_order_permutation INTEGER NOT NULL,
        name VARCHAR(200) NOT NULL,
        description VARCHAR(4000) NOT NULL
    );
    
	/*
    CREATE TABLE IF NOT EXISTS tmp_Msg_Error ( -- IF NOT EXISTS 
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		code VARCHAR(50) NOT NULL,
        -- CONSTRAINT chk_tmp_Msg_Error_code CHECK (code IN (SELECT code FROM Shop_Msg_Error_Type)),
		/*
        id_type INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Msg_Error_id_type
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type(id_type),
		*/
		msg VARCHAR(4000) NOT NULL
    );
    */

    
    -- User
    IF NOT EXISTS(
		SELECT *
		FROM Shop_User
		WHERE 
			id_user = v_id_user
			AND active
	) THEN
		RAISE EXCEPTION 'Valid user ID required.'
		USING ERRCODE = '22000'
        ;
    END IF;

	INSERT INTO tmp_Shop_User (
		id_user,
		active
	)
	SELECT id_user,
		active
	FROM Shop_User
	WHERE id_user = v_id_user
		AND active
	LIMIT 1
	;
    
    -- Get products
	INSERT INTO tmp_Shop_Product (
		id_product,
		id_permutation,
		active,
		display_order_product,
		display_order_permutation,
		name,
		description
	)
	SELECT id_product,
		id_permutation,
		active,
		display_order_product,
		display_order_permutation,
		name,
		description
	FROM (
		SELECT id_product,
			NULL AS id_permutation,
			active,
			display_order AS display_order_product,
			NULL AS display_order_permutation,
			name,
			description,
			id_stripe_product
		FROM Shop_Product P
		UNION
		SELECT t_PPPV.id_product,
			id_permutation,
			t_PPPV.active,
			display_order_product,
			display_order_permutation,
			P.name, ': ' || names_variation AS name,
			P.description || ' With variations: ' || type_name_pairs_variation AS description,
			t_PPPV.id_stripe_product
		FROM (
			SELECT P.id_product,
				PP.id_permutation,
				PP.active,
				P.display_order AS display_order_product,
				PP.display_order AS display_order_permutation,
				STRING_AGG(V.name, ' ') AS names_variation,
				STRING_AGG(VT.name || ': ' || V.name, ', ') AS type_name_pairs_variation,
				PP.id_stripe_product
			FROM Shop_Product_Permutation PP
			INNER JOIN Shop_Product P
				ON PP.id_product = P.id_product
					AND P.active
			INNER JOIN Shop_Product_Permutation_Variation_Link PPVL
				ON PP.id_permutation = PPVL.id_permutation
					AND PPVL.active
			INNER JOIN Shop_Variation V
				ON PPVL.id_variation = V.id_variation
					AND V.active
			INNER JOIN Shop_Variation_Type VT
				ON V.id_type = VT.id_type
					AND VT.active
			GROUP BY id_product, id_permutation -- , VT.id_type, V.id_variation
		) t_PPPV
		INNER JOIN Shop_Product P
			ON t_PPPV.id_product = P.id_product
	) t_PPP
	WHERE ISNULL(id_stripe_product)
		AND active
	;
    
    -- Permissions
	CALL p_shop_calc_user (
		v_guid, -- a_guid
		v_id_user, 	-- a_id_user
		0,		-- a_get_inactive_users
		CONVERT((SELECT id_permission FROM Shop_Permission WHERE 'STORE_ADMIN' = code), CHAR),		-- a_ids_permission
		(SELECT id_access_level FROM Shop_Access_Level WHERE code = 'ADMIN' AND active),		-- a_ids_access_level
		(SELECT STRING_AGG(id_product, ',') From tmp_Shop_Product),		-- a_ids_product
		(SELECT STRING_AGG(id_permutation, ',') From tmp_Shop_Product)		-- a_ids_permutation --  WHERE NOT ISNULL(id_permutation)
	);
	
	IF EXISTS (SELECT can_admin FROM Shop_Calc_User_Temp WHERE guid = v_guid AND NOT can_admin) THEN
		RAISE EXCEPTION 'User ID does not have permission to get all new stripe products.'
		USING ERRCODE = '42501'
        ;
	END IF;
	
	DELETE FROM Shop_Calc_User_Temp
	WHERE guid = v_guid
	;
    
    
    
    
    -- Returns
    /*
    SELECT *
    FROM tmp_Shop_User
    ;
    */
    
	/*
    IF EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		DELETE FROM tmp_Shop_Product;
	END IF;
    */

	OPEN result_products FOR
		SELECT id_product,
			id_permutation,
			name,
			description
		FROM tmp_Shop_Product
		ORDER BY display_order_product, display_order_permutation
		;
	RETURN NEXT result_products;

	OPEN result_product_variation_links FOR
		SELECT PP.id_permutation,
			V.id_variation,
			V.name AS name_variation,
			VT.id_type AS id_type_variation,
			VT.name as name_variation_type
		FROM tmp_Shop_Product t_P
		INNER JOIN Shop_Product_Permutation PP
			ON t_P.id_permutation = PP.id_permutation
		INNER JOIN Shop_Product_Permutation_Variation_Link PPVL
			ON PP.id_permutation = PPVL.id_permutation
				AND PPVL.active
		INNER JOIN Shop_Variation V
			ON PPVL.id_variation = V.id_variation
				AND V.active
		INNER JOIN Shop_Variation_Type VT
			ON V.id_type = VT.id_type
				AND VT.active
		;
    RETURN NEXT result_product_variation_links;
    
    -- Errors
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
		v_id_user
    ;
    */
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_User;
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
    FOR curs IN SELECT p_shop_get_many_stripe_product_new (
	'auth0|6582b95c895d09a70ba10fef'
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


/*
CALL p_shop_get_many_stripe_product_new (
	''
);

CALL p_shop_get_many_stripe_product_new (
	'auth0|6582b95c895d09a70ba10fef'
);



select * from shop_product;
select * from shop_product_permutation_variation_link;

CALL p_shop_calc_user (
			'ead789a1-c7ac-11ee-a256-b42e9986184a', -- a_guid
			'auth0|6582b95c895d09a70ba10fef', 	-- a_id_user
			0,		-- a_get_inactive_users
			'4',		-- a_ids_permission
			'3',		-- a_ids_access_level
			'1',		-- a_ids_product
			'1'		-- a_ids_permutation --  WHERE NOT ISNULL(id_permutation)
		);
        
*/
