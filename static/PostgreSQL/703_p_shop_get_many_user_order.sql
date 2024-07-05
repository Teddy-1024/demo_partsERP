

CREATE OR REPLACE FUNCTION p_shop_get_many_user_order (
	IN a_id_user INTEGER,
    IN a_ids_order VARCHAR(4000),
    IN a_n_order_max INTEGER,
	IN a_id_checkout_session VARCHAR(200)
)
RETURNS SETOF REFCURSOR
AS $$
DECLARE
	v_id_user INTEGER;
	v_ids_order VARCHAR(4000);
	v_n_order_max INTEGER;
	v_id_checkout_session VARCHAR(200);
	v_has_filter_user BOOLEAN;
	v_has_filter_order BOOLEAN;
	v_has_filter_session BOOLEAN;
	v_code_error_data VARCHAR(200);
	v_code_error_permission VARCHAR(200);
	v_guid UUID;
	result_orders REFCURSOR;
	-- result_errors REFCURSOR;
BEGIN
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_ids_order := TRIM(COALESCE(a_ids_order, ''));
	v_n_order_max := a_n_order_max;
	v_id_checkout_session := TRIM(COALESCE(a_id_checkout_session, ''));
    
    v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 1);
    v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
	v_guid = gen_random_uuid();

    v_has_filter_user = CASE WHEN v_id_user = '' THEN FALSE ELSE TRUE END;
	v_ids_order = REPLACE(v_ids_order, '|', ',');
    v_has_filter_order = CASE WHEN v_ids_order = '' THEN FALSE ELSE TRUE END;
    v_has_filter_session = CASE WHEN v_id_checkout_session = '' THEN FALSE ELSE TRUE END;
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_User;
    DROP TABLE IF EXISTS tmp_Shop_Order;
    
	/*
    CREATE TABLE tmp_Shop_User(
		id_user INTEGER PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BOOLEAN NOT NULL
    );
	*/
    
    CREATE TEMPORARY TABLE tmp_Shop_Order (
		id_order INTEGER NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_Order_id_order
			FOREIGN KEY (id_order)
			REFERENCES Shop_User_Order(id_order),
        active BOOLEAN NOT NULL
    );
    
	/*
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		-- id_type INTEGER NOT NULL,
		-- CONSTRAINT FK_tmp_Msg_Error_id_type FOREIGN KEY (id_type)
		-- 	REFERENCES Shop_Msg_Error_Type (id_type),
		code VARCHAR(50),
        msg VARCHAR(4000) NOT NULL
	);
    */
    
    -- User
	IF v_has_filter_user THEN
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
		
		v_has_filter_user = EXISTS (SELECT id_user FROM tmp_Shop_User LIMIT 1);
		v_id_user := (SELECT id_user FROM tmp_Shop_User LIMIT 1);
	ELSE
		RAISE EXCEPTION 'Valid user ID must be provided.'
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Permissions
	CALL p_shop_user_eval (
		v_guid, -- a_guid
		a_id_user, 	-- a_id_user
		0,		-- a_get_inactive_users
		CONVERT((SELECT id_permission FROM Shop_Permission WHERE 'STORE_USER' = code), CHAR),		-- a_ids_permission
		(SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' AND active),		-- a_ids_access_level
		'',		-- a_ids_product
		''		-- a_ids_permutation
	);
	
	IF NOT (SELECT can_edit FROM Shop_User_Eval_Temp WHERE guid = v_guid) THEN
		RAISE EXCEPTION 'User ID does not have permission to access orders.'
		USING ERRCODE = '42501'
		;
	END IF;
	
	DELETE FROM Shop_User_Eval_Temp
	WHERE guid = v_guid
	;
    
    -- Invalid Order IDs
	IF v_has_filter_order AND EXISTS (
		SELECT * 
		FROM Shop_User_Order 
		WHERE 
			NOT (id_user = v_id_user)
			AND id_order = ANY(v_ids_order)
		LIMIT 1
	) THEN  -- id_order LIKE CONCAT('%', v_ids_order, '%') LIMIT 1) THEN
		RAISE EXCEPTION 'You do not have access to the following order IDs: %', (
			SELECT STRING_AGG(id_order, ', ') 
			FROM Shop_User_Order 
			WHERE 
				NOT (id_user = v_id_user) 
				AND id_order = ANY(v_ids_order)
		)
		USING ERRCODE = '22000'
		;
	END IF;
	-- Invalid Checkout Session IDs
	IF v_has_filter_session AND EXISTS (
		SELECT * 
		FROM Shop_User_Order 
		WHERE 
			NOT (id_user = v_id_user)  
			AND id_checkout_session = v_id_checkout_session
	) THEN
		RAISE EXCEPTION 'You do not have access to the following checkout session IDs: %', (
			SELECT STRING_AGG(id_order, ', ') 
			FROM Shop_User_Order 
			WHERE 
				NOT (id_user = v_id_user) 
				AND id_checkout_session = v_id_checkout_session
		)
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Valid Orders
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
    
		INSERT INTO tmp_Shop_Order (
			id_order, 
			active
		)
		SELECT UO.id_order,
			UO.active
		FROM Shop_User_Order UO
		INNER JOIN tmp_Shop_User t_U
			ON UO.id_user = t_U.id_user
				AND t_U.active
		WHERE ((NOT v_has_filter_order OR FIND_IN_SET(UO.id_order, v_ids_order) > 0) -- UO.id_order LIKE CONCAT('%', v_ids_order, '%'))
			OR (NOT v_has_filter_session OR UO.id_checkout_session = v_id_checkout_session))
			AND UO.active
		;
    END IF;
    
    
    
    -- Returns
    /*
    SELECT *
    FROM tmp_Shop_User
    ;
    */
    
	OPEN result_orders FOR
		SELECT t_O.id_order,
			UOPL.id_product,
			UOPL.id_permutation,
			UOPL.quantity
		FROM tmp_Shop_Order t_O
		INNER JOIN Shop_User_Order UO
			ON t_O.id_order = UO.id_order
		INNER JOIN Shop_User_Order_Product_Link UOPL
			ON UO.id_order = UOPL.id_order
		WHERE t_O.active
		;
    RETURN NEXT result_orders;
    
	/*
    -- Errors
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
    */

    
    /*
    -- Return arguments for test
    SELECT
		v_id_user,
		v_ids_order,
		v_n_order_max,
		v_id_checkout_session
    ;
    */
    
    -- Clean up
    -- DROP TABLE IF EXISTS tmp_Shop_User;
    -- DROP TABLE IF EXISTS tmp_Shop_Order;
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
    FOR curs IN SELECT p_shop_get_many_user_order (
		'auth0|6582b95c895d09a70ba10fef', # a_id_user
		'1', # a_ids_order
		0, # a_n_order_max
		'' # a_id_checkout_session
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

CALL p_shop_get_many_user_order (
	'auth0|6582b95c895d09a70ba10fef', # a_id_user
    '1', # a_ids_order
	0, # a_n_order_max
    '' # a_id_checkout_session
);

CALL p_shop_get_many_user_order (
	'', # a_id_user
    '1', # a_ids_order
	0, # a_n_order_max
    '' # a_id_checkout_session
);

insert into shop_product_change_set (comment)
    values ('set product not subscription - test bool output to python');
    update shop_product
    set is_subscription = 0,
		id_change_set = (select id_change_set from shop_product_change_set order by id_change_set desc limit 1)
    where id_product = 1
select * from shop_User;
select * from shop_User_oRDER;
*/
