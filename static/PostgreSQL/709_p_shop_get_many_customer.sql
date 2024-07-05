

CREATE OR REPLACE FUNCTION p_shop_get_many_customer (
	IN a_id_user INTEGER,
    IN a_get_all_customer BOOLEAN,
	IN a_get_inactive_customer BOOLEAN,
    IN a_get_first_customer_only BOOLEAN,
	IN a_ids_customer INTEGER[]
)
RETURNS SETOF REFCURSOR
AS $$
DECLARE
	v_id_user INTEGER;
	v_get_all_customer BOOLEAN;
	v_get_inactive_customer BOOLEAN;
	v_get_first_customer_only BOOLEAN;
	v_ids_customer INTEGER[];
	v_has_filter_customer BOOLEAN;
	v_guid UUID;
	v_id_permission_customer INTEGER;
	v_id_access_level_view INTEGER;
	v_id_error_type_bad_data INTEGER;
	v_code_error_type_bad_data VARCHAR(50);
	result_customers REFCURSOR;
	-- result_errors REFCURSOR;
BEGIN
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_get_inactive_customer := COALESCE(a_get_inactive_customer, FALSE);
	v_get_first_customer_only := COALESCE(a_get_first_customer_only, FALSE);
	v_ids_customer := TRIM(COALESCE(a_ids_customer, ''));
	v_get_all_customer := COALESCE(a_get_all_customer, CASE WHEN v_ids_customer = '' THEN TRUE ELSE FALSE END);


    v_code_error_type_bad_data = 'BAD_DATA';
    v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_bad_data LIMIT 1);
    v_guid := gen_random_uuid();
    v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');
    
    v_has_filter_customer = CASE WHEN a_ids_customer = '' THEN FALSE ELSE TRUE END;

    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Customer;
    
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
		) THEN 
			RAISE EXCEPTION 'Invalid customer IDs: %', (
				SELECT STRING_AGG(Customer_Id, ', ')
			FROM UNNEST(v_ids_customer) AS Customer_Id
			LEFT JOIN Shop_Customer C ON Customer_Id = C.id_customer 
			WHERE ISNULL(C.id_customer)
				LIMIT 1
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
                RANK() OVER (ORDER BY C.id_customer ASC) AS rank_customer
			FROM Shop_Customer C
            LEFT JOIN Split_Temp S_T ON C.id_customer = S_T.substring
            WHERE
				(
					a_get_all_customer = 1
                    OR NOT ISNULL(S_T.substring)
				)
				AND (
					a_get_inactive_customer = 1
                    OR C.active = TRUE
                )
			;
        END IF;
		
		IF a_get_first_customer_only = TRUE THEN
			DELETE FROM tmp_Shop_Customer t_C
				WHERE t_C.rank_customer > (
					SELECT MIN(t_C.rank_customer)
                    FROM tmp_Shop_Customer t_C
				)
			;
		END IF;
    END IF;
    
    -- Permissions
	-- v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER);
	v_id_permission_customer := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_CUSTOMER' LIMIT 1);
	
	-- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
	-- select * from Shop_User_Eval_Temp;
	
	CALL p_shop_user_eval(v_guid, a_id_user, FALSE, v_id_permission_customer, v_id_access_level_view, '');
	
	-- select * from Shop_User_Eval_Temp;
	
	IF NOT EXISTS (SELECT can_view FROM Shop_User_Eval_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
		RAISE EXCEPTION 'You do not have view permissions for %', (
			SELECT COALESCE(STRING_AGG(name, ', '), 'NULL') 
			FROM Shop_Permission 
			WHERE id_permission = v_id_permission_customer
		)
		USING ERRCODE = '42501'
		;
	END IF;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns
    -- v_now := CURRENT_TIMESTAMP;
    
    -- customers
	OPEN result_customers FOR
		SELECT 
			t_C.id_customer,
			C.name_company,
			C.name_contact,
			C.department_contact,
			C.id_address,
			C.phone_number,
			C.email,
			C.id_currency,
			C.active
		FROM tmp_Shop_Customer t_C
		INNER JOIN Shop_Customer C ON t_C.id_customer = C.id_customer
		;
    RETURN NEXT result_customers;
    
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
    DROP TABLE IF EXISTS tmp_Shop_Customer;
        
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
    FOR curs IN SELECT p_shop_get_many_customer (
		'', -- a_id_user
		1, -- a_get_all_customer
		0, -- a_get_inactive_customer
		0, -- a_get_first_customer_only
		'' -- a_ids_customer
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

