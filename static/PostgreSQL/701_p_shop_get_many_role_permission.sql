
/*
DROP TABLE IF EXISTS tmp_Shop_Image;
DROP TABLE IF EXISTS tmp_Shop_Product;
DROP TABLE IF EXISTS tmp_Shop_Variation;
DROP TABLE IF EXISTS tmp_Shop_Product_Category;

CREATE OR REPLACE PROCEDURE p_shop_get_many_role_permission (
	a_ids_role VARCHAR(4000),
    a_get_inactive_roles BOOLEAN
)
AS $$
DECLARE 
    v_ids_role VARCHAR(4000);
    v_get_inactive_roles BOOLEAN;
    v_has_filter_role BOOLEAN;
    v_priority_view INTEGER;
    v_priority_edit INTEGER;
    v_priority_admin INTEGER;
BEGIN
	v_ids_role := TRIM(COALESCE(a_ids_role, ''));
    v_get_inactive_roles := COALESCE(a_get_inactive_roles, FALSE);
    
	-- v_ids_role = REPLACE(v_ids_role, '|', ',`');
    v_has_filter_role = CASE WHEN v_ids_role = '' THEN FALSE ELSE TRUE END;

    
    -- Temporary tables
    CREATE TABLE tmp_Permission (
		id_role INTEGER NOT NULL,
        CONSTRAINT FK_tmp_User_Permission_id_role
			FOREIGN KEY (id_role)
            REFERENCES Shop_Role(id_role),
        id_permission INTEGER,
        CONSTRAINT FK_tmp_User_Permission_id_permission
			FOREIGN KEY (id_permission)
            REFERENCES Shop_Permission(id_permission),
		id_access_level INTEGER,
        CONSTRAINT FK_tmp_User_Permission_id_access_level
			FOREIGN KEY (id_user)
            REFERENCES Shop_Access_Level(id_user),
        can_view BOOLEAN, 
        can_edit BOOLEAN, 
        can_admin BIT
    );
    
    
    INSERT INTO tmp_User_Permission (
		id_role,
        id_permission,
        id_access_level,
        can_view,
        can_edit,
        can_admin
    )
    SELECT U.id_user,
		U.is_super_user,
		U.is_super_user,
		U.is_super_user,
		U.is_super_user
	FROM Shop_Role R
	INNER JOIN Shop_Role_Permission_Link RPL
		ON R.id_role = RPL.id_role
			AND RPL.active
	INNER JOIN Shop_Permission PERM
		ON RPL.id_permission = PERM.id_permission
			AND PERM.active
	INNER JOIN Shop_Permission_Group PG
		ON PERM.id_permission_group = PG.id_group
			AND PG.active
	LEFT JOIN Shop_Access_Level AL
		ON RPL.id_access_level = AL.id_access_level
			AND AL.active
    WHERE FIND_IN_SET(R.id_role, v_ids_role) > 0
		AND PERM.required_access_level = FALSE OR AL.
    ;
    
    UPDATE tmp_User_Permission t_UP
    INNER JOIN Shop_Access_Level AL
		ON AL.code = 'ADMIN'
	SET t_UP.id_access_level = AL.id_access_level
    WHERE t_UP.is_super_user
    ;
    
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_Product_Category;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_Image;
END;
$$ LANGUAGE plpgsql;
*/


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
		CURS1, 
		CURS2
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

