

CREATE OR REPLACE FUNCTION p_shop_get_many_supplier (
	IN a_id_user INTEGER,
    IN a_get_all_supplier BOOLEAN,
	IN a_get_inactive_supplier BOOLEAN,
    IN a_get_first_supplier_only BOOLEAN,
	IN a_ids_supplier INTEGER[]
)
RETURNS SETOF REFCURSOR
AS $$
DECLARE
	v_id_user INTEGER;
	v_get_all_supplier BOOLEAN;
	v_get_inactive_supplier BOOLEAN;
	v_get_first_supplier_only BOOLEAN;
	v_ids_supplier INTEGER[];
	v_has_filter_supplier BOOLEAN;
	v_guid UUID;
	v_id_permission_supplier INTEGER;
	v_id_access_level_view INTEGER;
	v_id_minimum INTEGER;
	result_suppliers REFCURSOR;
	-- result_errors REFCURSOR;
BEGIN
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_get_all_supplier := COALESCE(a_get_all_supplier, TRUE);
	v_get_inactive_supplier := COALESCE(a_get_inactive_supplier, FALSE);
	v_get_first_supplier_only := COALESCE(a_get_first_supplier_only, FALSE);
	v_ids_supplier := TRIM(COALESCE(a_ids_supplier, ''));
    
    v_guid := gen_random_uuid();
    v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');
    v_has_filter_supplier = NOT (a_ids_supplier = '');
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Supplier;
    
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
            WHERE
				(
					a_get_inactive_supplier
                    OR S.active = TRUE
                )
				AND (
					a_get_all_supplier
					OR S.id_supplier = ANY(v_ids_supplier)
				)
			;
        END IF;
		
		IF a_get_first_supplier_only THEN
			DELETE FROM tmp_Shop_Supplier t_S
				WHERE t_S.rank_supplier > (
					SELECT MIN(t_S.rank_supplier)
                    FROM tmp_Shop_Supplier t_S
				)
			;
		END IF;
    END IF;
    
    -- Permissions
	-- v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER);
	v_id_permission_supplier := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_SUPPLIER' LIMIT 1);
	
	-- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
	-- select * from Shop_User_Eval_Temp;
	
	CALL p_shop_user_eval(v_guid, a_id_user, FALSE, v_id_permission_supplier, v_id_access_level_view, '');
	
	-- select * from Shop_User_Eval_Temp;
	
	IF NOT EXISTS (SELECT can_view FROM Shop_User_Eval_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
		RAISE EXCEPTION 'You do not have view permissions for %', (
			SELECT name 
			FROM Shop_Permission 
			WHERE id_permission = v_id_permission_supplier 
			LIMIT 1
		)
		USING ERRCODE = '42501'
		;
	END IF;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns

    -- Suppliers
	OPEN result_suppliers FOR
		SELECT 
			t_S.id_supplier,
			S.name_company,
			name_contact,
			department_contact,
			id_address,
			phone_number,
			fax,
			email,
			website,
			id_currency,
			active
		FROM tmp_Shop_Supplier t_S
		INNER JOIN Shop_Supplier S
			ON t_S.id_supplier = S.id_supplier
		;
    RETURN NEXT result_suppliers;
    
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
    DROP TABLE IF EXISTS tmp_Supplier;
        
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
    FOR curs IN SELECT p_shop_get_many_supplier (
		'', -- a_id_user
		TRUE, -- a_get_all_supplier
		FALSE, -- a_get_inactive_supplier
		FALSE, -- a_get_first_supplier_only
		'' -- a_ids_supplier
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

