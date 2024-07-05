


/*

CALL p_shop_get_many_stripe_price_new (
	''
)

*/



CREATE OR REPLACE FUNCTION p_shop_get_many_stripe_price_new (
	IN a_id_user INTEGER
)
RETURNS SETOF REFCURSOR
AS $$
DECLARE
	v_id_user INTEGER;
	v_has_filter_user BOOLEAN;
	v_code_error_data VARCHAR(200);
	v_code_error_permission VARCHAR(200);
	v_guid UUID;
	result_products REFCURSOR;
	-- result_errors REFCURSOR;
BEGIN
	v_id_user := TRIM(COALESCE(a_id_user, ''));
    v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 1);
    v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
	v_guid = gen_random_uuid();

    v_has_filter_user = CASE WHEN v_id_user = '' THEN FALSE ELSE TRUE END;
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Product_Currency_Link;
    DROP TABLE IF EXISTS tmp_Shop_User;
    
    CREATE TEMPORARY TABLE tmp_Shop_User(
		id_user INTEGER PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BOOLEAN NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Shop_Product_Currency_Link (
		id_link INTEGER NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_Product_Currency_Link_id_link
			FOREIGN KEY (id_link)
			REFERENCES Shop_Product_Currency_Region_Link(id_link),
        id_product INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_CurrencyLink_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
        id_permutation INTEGER NULL,
        CONSTRAINT FK_tmp_Shop_Product_Currency_Link_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
		id_currency INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_Currency_Link_id_currency
			FOREIGN KEY (id_currency)
			REFERENCES Shop_Currency(id_currency),
		active BOOLEAN NOT NULL
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

    
    -- User permissions
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
	INSERT INTO tmp_Shop_Product_Currency_Link (
		id_link,
		id_product,
		id_permutation,
		id_currency,
		active
	)
	SELECT id_link,
		id_product,
		id_permutation,
		id_currency,
		active
	FROM Shop_Product_Currency_Region_Link
	WHERE ISNULL(id_stripe_price)
		AND active
	;
    
    -- Permissions
	-- SELECT * FROM tmp_Msg_Error LIMIT 1;
	CALL p_shop_user_eval (
		v_guid, -- a_guid
		v_id_user, 	-- a_id_user
		0,		-- a_get_inactive_users
		CONVERT((SELECT id_permission FROM Shop_Permission WHERE 'STORE_ADMIN' = code), CHAR),		-- a_ids_permission
		(SELECT id_access_level FROM Shop_Access_Level WHERE code = 'ADMIN' AND active),		-- a_ids_access_level
		(SELECT STRING_AGG(DISTINCT id_product, ',') FROM tmp_Shop_Product_Currency_Link), --  (SELECT DISTINCT id_product FROM tmp_Shop_Product_Currency_Link) calc_PCL)		-- a_ids_product
		(SELECT STRING_AGG(DISTINCT id_permutation, ',') FROM tmp_Shop_Product_Currency_Link) -- a_ids_permutation
	);
	-- SELECT * FROM tmp_Msg_Error LIMIT 1;
	
	IF EXISTS (SELECT can_admin FROM Shop_User_Eval_Temp WHERE guid = v_guid AND NOT can_admin LIMIT 1) THEN
		RAISE EXCEPTION 'User ID does not have permission to get all new stripe prices.'
		USING ERRCODE = '42501'
		;
	END IF;
	
	DELETE FROM Shop_User_Eval_Temp
	WHERE guid = v_guid
	;

    
    
    -- Returns
	/*
    IF EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		DELETE FROM tmp_Shop_Product_Currency_Link;
	END IF;
    */
	/*
    SELECT *
    FROM tmp_Shop_User
    ;
    */
    
    OPEN result_products FOR
		SELECT t_PCL.id_product,
			t_PCL.id_permutation,
			P.price_GBP_full * C.factor_from_GBP AS unit_price,
			C.code AS code_currency,
			P.id_stripe_product,
			P.is_subscription,
			LOWER(RI.code) AS name_recurring_interval,
			P.count_recurrence_interval
		FROM tmp_Shop_Product_Currency_Link t_PCL
		INNER JOIN Shop_Product P
			ON t_PCL.id_product = P.id_product
			AND P.active
		INNER JOIN Shop_Recurrence_Interval RI
			ON P.id_recurrence_interval = RI.id_interval
			AND RI.active
		INNER JOIN Shop_Currency C
			ON t_PCL.id_currency = C.id_currency
			AND C.active
		WHERE t_PCL.active
		;
    RETURN NEXT result_products;
    
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
    DROP TABLE IF EXISTS tmp_Shop_User;
    DROP TABLE IF EXISTS tmp_Shop_Product_Currency_Link;
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
    FOR curs IN SELECT p_shop_get_many_stripe_price_new (
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
CALL p_shop_get_many_stripe_price_new (
	''
);

CALL p_shop_get_many_stripe_price_new (
	'auth0|6582b95c895d09a70ba10fef'
);

*/
