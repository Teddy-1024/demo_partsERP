
/*

CALL p_shop_calc_user (
	gen_random_uuid(), -- a_guid
	'', 	-- a_id_user
	0,		-- a_get_inactive_users
    '1',	-- a_ids_permission
    '',		-- a_ids_access_level
	'1'		-- a_ids_product
)

*/

CREATE OR REPLACE PROCEDURE p_shop_calc_user (
	IN a_guid UUID,
    IN a_id_user INTEGER,
    IN a_get_inactive_users BOOLEAN,
    IN a_ids_permission INTEGER[],
    IN a_ids_access_level INTEGER[],
    IN a_ids_product INTEGER[] -- VARCHAR(4000) -- IN a_ids_permutation VARCHAR(4000)
	/*
	OUT result_errors TABLE (
		guid UUID,
		id_type INTEGER,
		code VARCHAR(50),
		msg VARCHAR(4000)
	)
	*/
	-- INOUT a_error_msg TEXT
)
AS $$
DECLARE
	v_guid UUID;
    v_id_user INTEGER;
    v_get_inactive_users BOOLEAN;
    v_ids_permission INTEGER[];
    v_ids_access_level INTEGER[];
    v_ids_product INTEGER[]; -- TEXT; -- VARCHAR(4000); -- IN a_ids_permutation VARCHAR(4000)
    v_has_filter_user BOOLEAN;
    v_has_filter_permission BOOLEAN;
    v_has_filter_access_level BOOLEAN;
    -- v_has_filter_permutation BOOLEAN;
    v_has_filter_product BOOLEAN;
    v_id_permission_product INTEGER;
    v_id_permission INTEGER;
    -- v_ids_product UUID;
    v_id_access_level_view INTEGER;
    -- v_id_access_level_product_required INTEGER;
    v_priority_access_level_view INTEGER;
    v_priority_access_level_edit INTEGER;
    v_priority_access_level_admin INTEGER;
    v_id_access_level INTEGER;
    v_priority_access_level INTEGER;
    v_now TIMESTAMP;
	v_ids_row_delete UUID;
    v_code_error_data VARCHAR(200);
    v_id_error_data INTEGER;
    v_code_error_permission VARCHAR(200);
    -- result_errors REFCURSOR;
	-- v_error_msg TEXT := NULL;
BEGIN
	-- Parse arguments + get default values
    v_guid := COALESCE(a_guid, gen_random_uuid());
	v_id_user := CASE WHEN a_id_user IS NULL THEN '' ELSE TRIM(a_id_user) END;
	v_get_inactive_users := COALESCE(a_get_inactive_users, FALSE);
	v_ids_permission := COALESCE(a_ids_permission, ARRAY[]::INTEGER[]);
	v_ids_access_level := COALESCE(a_ids_access_level, ARRAY[]::INTEGER[]);
	-- v_ids_permutation := CASE WHEN a_ids_permutation IS NULL THEN '' ELSE TRIM(a_ids_permutation) END;
	v_ids_product := COALESCE(a_ids_product, ARRAY[]::INTEGER[]);
    
    v_id_error_data := 1;
    v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = v_id_error_data);
    
    v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
    
    v_has_filter_user := (v_id_user <= 0);
    v_has_filter_permission := (CARDINALITY(v_ids_permission) > 0);
    v_has_filter_access_level := (CARDINALITY(v_ids_access_level) > 0);
    /*
    v_has_filter_permutation := CASE WHEN v_ids_permutation = '' THEN FALSE ELSE TRUE END;
    */
    v_has_filter_product := (CARDINALITY(v_ids_product) = 0);
    v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    v_priority_access_level_view := (SELECT priority FROM Shop_Access_Level WHERE id_access_level = v_id_access_level_view);
    v_priority_access_level_edit := (SELECT priority FROM Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    v_priority_access_level_admin := (SELECT priority FROM Shop_Access_Level WHERE code = 'ADMIN' LIMIT 1);

	v_id_permission_product := (SELECT v_id_permission FROM Shop_Permission WHERE code = 'SHOP_PRODUCT' LIMIT 1);

	-- Clear previous proc results
	-- DROP TABLE IF EXISTS tmp_User_Role_Link;
	-- DROP TEMPORARY TABLE IF EXISTS tmp_User_Role_Link;
	DROP TABLE IF EXISTS tmp_Shop_Product_p_shop_calc_user;
	-- DROP TABLE IF EXISTS Shop_Calc_User_Temp;
    
    
    -- Permanent Table
	CREATE TABLE IF NOT EXISTS Shop_Calc_User_Temp (
		id_row INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
		guid UUID NOT NULL,
		id_user INTEGER,
		CONSTRAINT FK_Shop_Calc_User_Temp_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User (id_user),
		id_permission_required INTEGER NOT NULL,
		CONSTRAINT FK_Shop_Calc_User_Temp_id_permission_required
			FOREIGN KEY (id_permission_required)
			REFERENCES Shop_Permission (id_permission),
		/*
		id_access_level_required INTEGER NOT NULL,
		CONSTRAINT FK_Shop_Calc_User_Temp_id_access_level_required
			FOREIGN KEY (id_access_level_required)
			REFERENCES Shop_Access_Level (id_access_level),
		*/
		priority_access_level_required INTEGER NOT NULL,
        /*
		CONSTRAINT FK_Shop_Calc_User_Temp_priority_access_level_required
			FOREIGN KEY (priority_access_level_required)
			REFERENCES Shop_Access_Level (priority),
		*/
		id_product INTEGER NULL,
		CONSTRAINT FK_Shop_Calc_User_Temp_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product (id_product),
		/*
		id_permutation INTEGER NULL,
		CONSTRAINT FK_Shop_Calc_User_Temp_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES parts.Shop_Product_Permutation (id_permutation),
		*/
        is_super_user BOOLEAN NULL,
		priority_access_level_user INTEGER NULL,
        /*
		CONSTRAINT FK_Shop_Calc_User_Temp_priority_access_level_minimum
			FOREIGN KEY (priority_access_level_minimum)
			REFERENCES Shop_Access_Level (priority)
		*/
		can_view BOOLEAN,
		can_edit BOOLEAN,
		can_admin BOOLEAN, -- DEFAULT 0
		name_error VARCHAR(200) NULL
	);
	
	-- Temporary tables
	CREATE TEMPORARY TABLE tmp_Shop_Product_p_shop_calc_user (
		id_row INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
		id_product INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Product_p_shop_calc_user_id_product FOREIGN KEY (id_product)
			REFERENCES Shop_Product (id_product),
		/*
		id_permutation INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Product_p_shop_calc_user_id_permutation 
			FOREIGN KEY (id_permutation)
			REFERENCES parts.Shop_Product_Permutation (id_permutation),
		*/
        id_access_level_required INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Product_p_shop_calc_user_id_access_level_required 
			FOREIGN KEY (id_access_level_required)
			REFERENCES Shop_Access_Level (id_access_level),
		guid UUID NOT NULL,
        rank_product INTEGER NOT NULL
	);
	
	/*
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
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

    
    -- Permission IDs
	IF v_has_filter_permission THEN
		-- CALL p_split(a_guid, v_ids_permission, ',');
		
		-- Invalid
		IF EXISTS (
			SELECT UNNEST(v_ids_permission) AS id_permission 
			EXCEPT 
			SELECT id_permission FROM Shop_Permission 
		) THEN -- (SELECT PERM.id_permission FROM Split_Temp ST LEFT JOIN Shop_Permission PERM ON ST.substring = PERM.id_permission WHERE ISNULL(PERM.id_permission)) THEN
			/*
			INSERT INTO tmp_Msg_Error (
				guid,
				id_type,
				code,
				msg
			)
			SELECT
				v_guid,
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
				v_code_error_data, 
				'Invalid permission IDs: ' || COALESCE(STRING_AGG(ST.substring, ', '), 'NULL')
			FROM Split_Temp ST 
			LEFT JOIN Shop_Permission PERM ON ST.substring = PERM.id_permission 
			WHERE ISNULL(PERM.id_permission)
			;
			*/
			RAISE EXCEPTION 'Invalid permission IDs: %', (
				SELECT STRING_AGG(id_permission, ', ') 
				FROM (
					SELECT UNNEST(v_ids_permission) AS id_permission 
					EXCEPT 
					SELECT id_permission FROM Shop_Permission 
				) Permission
			)
			USING ERRCODE = '22000'
			;
		END IF;
		
		-- Inactive
		IF EXISTS (
			SELECT UNNEST(v_ids_permission) AS id_permission 
			EXCEPT 
			SELECT id_permission FROM Shop_Permission 
			WHERE active
		) THEN -- (SELECT PERM.id_permission FROM Split_Temp ST INNER JOIN Shop_Permission PERM ON ST.substring = PERM.id_permission WHERE PERM.active = FALSE) THEN
			/*
			INSERT INTO tmp_Msg_Error (
				guid,
				id_type,
				code,
				msg
			)
			SELECT
				v_guid,
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
				v_code_error_data, 
				'The following permissions are not active: ' || COALESCE(STRING_AGG(ST.substring, ', '), 'NULL')
			FROM Split_Temp ST 
			INNER JOIN Shop_Permission PERM ON ST.substring = PERM.id_permission 
			WHERE PERM.active = FALSE
			;
			*/
			RAISE EXCEPTION 'Inactive permission IDs: %', (
				SELECT STRING_AGG(id_permission, ', ') 
				FROM (
					SELECT UNNEST(v_ids_permission) AS id_permission 
					EXCEPT 
					SELECT id_permission FROM Shop_Permission
					WHERE active
				) Permission
			)
			USING ERRCODE = '22000'
			;
		END IF;

		-- Get the permission with the highest priority access level required
		v_id_permission := (
			SELECT PERMS.id_permission 
			FROM (
				SELECT PERM2.id_permission
				FROM Split_Temp ST 
				INNER JOIN Shop_Permission PERM2 ON ST.substring = PERM2.id_permission
				WHERE PERM.active 
				UNION
				SELECT v_id_permission_product
			) PERMS
			INNER JOIN Shop_Permission PERM1 ON PERMS.id_permission = PERM1.id_permission
			INNER JOIN Shop_Access_Level AL ON PERM1.id_access_level_required = AL.id_access_level
			ORDER BY AL.priority ASC
			LIMIT 1
		);
		
		-- DROP TABLE Split_Temp;
	ELSIF v_has_filter_product THEN
		v_id_permission := v_id_permission_product;
	ELSE
		/*
		INSERT INTO tmp_Msg_Error (
			guid,
			id_type,
			code,
			msg
		)
		VALUES (
			v_guid,
			(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
			v_code_error_data, 
			'Permission ID required'
		)
		;
		*/
		RAISE EXCEPTION 'Permission ID required.'
		USING ERRCODE = '22000'
		;
	END IF;
    
	-- access level
	IF v_has_filter_access_level THEN
		IF EXISTS (
			/*
			SELECT ST.substring 
			FROM Split_Temp ST 
			LEFT JOIN Shop_Access_Level AL 
			ON ST.substring = AL.id_access_level
			WHERE 
				ISNULL(AL.id_access_level)
				OR AL.active = FALSE
			*/
			SELECT UNNEST(v_ids_access_level) AS id_access_level 
			EXCEPT
			SELECT id_access_level FROM Shop_Access_Level
		) THEN
			/*
			INSERT INTO tmp_Msg_Error (
				guid,
				id_type,
				code,
				msg
			)
			SELECT
				v_guid,	
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
				v_code_error_data, 
				'Invalid access level IDs: ' || STRING_AGG(ST.substring, ', ')
			FROM Split_Temp ST 
			LEFT JOIN Shop_Access_Level AL ON ST.substring = AL.id_access_level
			WHERE ISNULL(AL.id_access_level)
			;
			*/
			RAISE EXCEPTION 'Invalid access level IDs: %', (
				SELECT STRING_AGG(id_access_level, ', ') 
				FROM (
					SELECT UNNEST(v_ids_access_level) AS id_access_level 
					EXCEPT 
					SELECT id_access_level FROM Shop_Access_Level 
				) AL
			)
			USING ERRCODE = '22000'
			;
		END IF;
		
		IF EXISTS (
			SELECT UNNEST(v_ids_access_level) AS id_access_level 
			EXCEPT
			SELECT id_access_level FROM Shop_Access_Level
			WHERE active
		) THEN
			RAISE EXCEPTION 'Inactive access level IDs: %', (
				SELECT STRING_AGG(id_access_level, ', ') 
				FROM (
					SELECT UNNEST(v_ids_access_level) AS id_access_level 
					EXCEPT 
					SELECT id_access_level FROM Shop_Access_Level
				) AL
			)
			USING ERRCODE = '22000'
			;
		END IF;

		v_id_access_level := (
			SELECT AL.id_access_level 
			FROM Shop_Access_Level AL 
			WHERE 
				AL.active
				AND AL.id_access_level = ANY(v_ids_access_level)
			ORDER BY AL.priority ASC 
			LIMIT 1
		);
	ELSE
		v_id_access_level := (
			SELECT id_access_level_required AS id_access_level
			FROM (
				SELECT id_access_level 
				FROM Shop_Permission PERM
				WHERE 
					PERM.id_permission = v_id_permission
				UNION
				SELECT v_id_access_level_view AS id_access_level
			) PERMS
			INNER JOIN Shop_Access_Level AL ON PERMS.id_access_level = AL.id_access_level
			ORDER BY AL.priority ASC
			LIMIT 1
		); -- v_id_access_level_view;
	END IF;

	v_priority_access_level := (SELECT priority FROM Shop_Access_Level WHERE id_access_level = v_id_access_level);

    -- Invalid user ID
	IF v_has_filter_user THEN
		IF ISNULL((SELECT id_user FROM Shop_User WHERE id_user = v_id_user)) THEN -- NOT v_has_filter_user THEN
			/*
			INSERT INTO tmp_Msg_Error (
				guid,
				id_type,
				code,
				msg
			)
			VALUES (
				v_guid,
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
				v_code_error_data, 
				'Invalid user ID: ' || COALESCE(v_id_user, 'NULL')
			)
			;
			*/
			RAISE EXCEPTION 'Invalid user ID: %', v_id_user
			USING ERRCODE = '22000'
			;
		END IF;
		
		IF ISNULL((SELECT id_user FROM Shop_User WHERE id_user = v_id_user AND active)) THEN
			RAISE EXCEPTION 'Inactive user ID: %', v_id_user
			USING ERRCODE = '22000'
			;
		END IF;
	END IF;
    

	-- Invalid products
	IF v_has_filter_product THEN
		-- Invalid product IDs
		IF EXISTS (
			SELECT UNNEST(v_ids_product) AS id_product 
			EXCEPT 
			SELECT id_product FROM Shop_Product
		) THEN -- (SELECT * FROM Split_Temp ST LEFT JOIN Shop_Product P ON ST.substring = P.id_product WHERE ISNULL(P.id_product)) THEN 
			/*
			INSERT INTO tmp_Msg_Error (
				guid,
				id_type,
				code,
				msg
			)
			SELECT
				v_guid,
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
				v_code_error_data, 
				'Invalid product IDs: ' || COALESCE(STRING_AGG(ST.substring, ', '), 'NULL')
			FROM Split_Temp ST 
			LEFT JOIN Shop_Product P ON ST.substring = P.id_product 
			WHERE ISNULL(P.id_product)
			;
			*/
			RAISE EXCEPTION 'Invalid product IDs: %', (
				SELECT STRING_AGG(id_product, ', ') 
				FROM (
					SELECT UNNEST(v_ids_product) AS id_product 
					EXCEPT 
					SELECT id_product FROM Shop_Product 
				) Product
			)
			USING ERRCODE = '22000'
			;
		END IF;
		
		INSERT INTO tmp_Shop_Product_p_shop_calc_user (
			id_product,
			-- id_permutation,
			id_access_level_required,
			guid,
			rank_product -- rank_permutation
		)
		SELECT 
			DISTINCT P.id_product,
			-- PP.id_permutation,
			P.id_access_level_required,
			v_guid,
			RANK() OVER (ORDER BY C.display_order, P.display_order) AS rank_product
		FROM Shop_Product P -- ON ST.substring = P.id_product -- Shop_Product_Permutation PP
		INNER JOIN Shop_Product_Category C ON P.id_category = C.id_category
		INNER JOIN Shop_Access_Level AL
			ON P.id_access_level_required = AL.id_access_level
				AND AL.active
		WHERE -- FIND_IN_SET(P.id_product, v_ids_product) > 0 -- FIND_IN_SET(PP.id_permutation, v_ids_permutation) > 0
			P.id_product = ANY(v_ids_product)
			-- AND P.active -- not worried as we want users to be able to see their order history
		;
		/*
		DELETE FROM tmp_Shop_Product_p_shop_calc_user
		WHERE rank_permutation > 1
		;
		*/
		-- v_has_filter_product := EXISTS (SELECT * FROM tmp_Shop_Product_p_shop_calc_user WHERE v_guid = guid);
	END IF;

	-- User permissions
	/*
	IF v_has_filter_product THEN
		INSERT INTO Shop_Calc_User_Temp (
			guid,
			id_user,
			id_permission_required,
			id_product,
			-- id_permutation,
			priority_access_level_required,
			priority_access_level_user,
			is_super_user,
			can_view,
			can_edit,
			can_admin
		)
		SELECT 
			v_guid, 
			v_id_user, 
			v_id_permission AS id_permission_required,
			P.id_product, 
			-- t_P.id_permutation, 
			CASE WHEN v_priority_access_level <= AL_P.priority THEN v_priority_access_level ELSE AL_P.priority END AS priority_access_level_required,
			AL_U.priority AS priority_access_level_user,
			U.is_super_user,
			CASE WHEN U.is_super_user THEN TRUE ELSE CASE WHEN NOT ISNULL(AL_U.priority) AND AL_U.priority <= v_priority_access_level_view AND AL_U.priority <= priority_access_level_required THEN TRUE ELSE FALSE END END AS can_view,
			CASE WHEN U.is_super_user THEN TRUE ELSE CASE WHEN NOT ISNULL(AL_U.priority) AND AL_U.priority <= v_priority_access_level_edit AND AL_U.priority <= priority_access_level_required THEN TRUE ELSE FALSE END END AS can_edit,
			CASE WHEN U.is_super_user THEN TRUE ELSE CASE WHEN NOT ISNULL(AL_U.priority) AND AL_U.priority <= v_priority_access_level_admin AND AL_U.priority <= priority_access_level_required THEN TRUE ELSE FALSE END END AS can_admin
		FROM Shop_User U
			/*
			ON U.id_user = v_id_user
			AND U.active
			*/
		LEFT JOIN Shop_User_Role_Link URL
			ON U.id_user = URL.id_user
			AND URL.active
		LEFT JOIN Shop_Role_Permission_Link RPL
			ON URL.id_role = RPL.id_role
			AND RPL.active
		INNER JOIN Shop_Access_Level AL_U
			ON RPL.id_access_leveL = AL_U.id_access_level
			AND AL_U.active
		INNER JOIN tmp_Shop_Product_p_shop_calc_user t_P
			ON t_P.guid = v_guid
			AND AL.id_access_level = t_P.id_access_leveL_required
		INNER JOIN Shop_Access_Level AL_P
			ON t_P.id_access_leveL_required = AL_P.id_access_level
			AND AL_P.active
		WHERE 
			v_guid = t_P.guid
			AND U.active
			AND U.id_user = v_id_user
		;
	ELSE
		INSERT INTO Shop_Calc_User_Temp (--UE_T
			guid,
			id_user,
			id_permission_required,
			priority_access_level_required,
			priority_access_level_user,
			is_super_user,
			can_view,
			can_edit,
			can_admin
		)
		SELECT 
			v_guid,
			v_id_user,
			v_id_permission AS id_permission_required,
			v_priority_access_level AS priority_access_level_required,
			AL.priority AS priority_access_level_user,
			U.is_super_user,
			CASE WHEN U.is_super_user THEN TRUE ELSE CASE WHEN NOT ISNULL(AL.priority) AND AL.priority <= v_priority_access_level_view AND AL.priority <= v_priority_access_level THEN TRUE ELSE FALSE END END AS can_view,
			CASE WHEN U.is_super_user THEN TRUE ELSE CASE WHEN NOT ISNULL(AL.priority) AND AL.priority <= v_priority_access_level_edit AND AL.priority <= v_priority_access_level THEN TRUE ELSE FALSE END END AS can_edit,
			CASE WHEN U.is_super_user THEN TRUE ELSE CASE WHEN NOT ISNULL(AL.priority) AND AL.priority <= v_priority_access_level_admin AND AL.priority <= v_priority_access_level THEN TRUE ELSE FALSE END END AS can_admin
		FROM Shop_User U
		INNER JOIN Shop_User_Role_Link URL
			ON U.id_user = URL.id_user
			AND URL.active
		INNER JOIN Shop_Role_Permission_Link RPL
			ON URL.id_role = RPL.id_role
			AND RPL.active
		INNER JOIN Shop_Access_Level AL
			ON RPL.id_access_level = AL.id_access_level
			AND AL.active
		WHERE 
			U.id_user = v_id_user
			AND U.active
			AND RPL.id_permission = v_id_permission
		ORDER BY AL.priority ASC
		;
	END IF;
    */
	INSERT INTO Shop_Calc_User_Temp (--UE_T
		guid,
		id_user,
		id_permission_required,
		id_product,
		priority_access_level_required,
		priority_access_level_user,
		is_super_user,
		can_view,
		can_edit,
		can_admin,
		name_error
	)
	SELECT 
		v_guid,
		v_id_user,
		v_id_permission AS id_permission_required,
		t_P.id_product,
		MIN(v_priority_access_level, AL_P.priority) AS priority_access_level_required,
		AL_U.priority AS priority_access_level_user,
		U.is_super_user,
		(U.is_super_user AND NOT ISNULL(priority_access_level_user) AND priority_access_level_user <= v_priority_access_level_view AND priority_access_level_user <= priority_access_level_required) AS can_view,
		(U.is_super_user AND NOT ISNULL(priority_access_level_user) AND priority_access_level_user <= v_priority_access_level_edit AND priority_access_level_user <= priority_access_level_required) AS can_edit,
		(U.is_super_user AND NOT ISNULL(priority_access_level_user) AND priority_access_level_user <= v_priority_access_level_admin AND priority_access_level_user <= priority_access_level_required) AS can_admin,
		Permission.name || ' ' || (SELECT name FROM Shop_Access_Level WHERE priority = priority_access_level_required ORDER BY id_access_level ASC LIMIT 1) || ' permissions' || CASE WHEN ISNULL(t_P.id_product) THEN '' ELSE ' for product ' || P.name END AS name_error
	FROM Shop_User U
	INNER JOIN Shop_User_Role_Link URL
		ON U.id_user = URL.id_user
		AND URL.active
	INNER JOIN Shop_Role_Permission_Link RPL
		ON URL.id_role = RPL.id_role
		AND RPL.active
	INNER JOIN Shop_Access_Level AL_U
		ON RPL.id_access_level = AL_U.id_access_level
		AND AL_U.active
	INNER JOIN Shop_Permission Permission
		ON RPL.id_permission = Permission.id_permission
		AND Permission.active
	CROSS JOIN tmp_Shop_Product_p_shop_calc_user t_P -- ON t_P.guid = v_guid
	INNER JOIN Shop_Product P ON t_P.id_product = P.id_product
	INNER JOIN Shop_Access_Level AL_P
		ON t_P.id_access_level_required = AL_P.id_access_level
		-- AND AL_P.active
	WHERE 
		U.id_user = v_id_user
		AND U.active
		AND RPL.id_permission = v_id_permission
		AND t_P.guid = v_guid
	ORDER BY AL_P.priority ASC, t_P.rank_product ASC
	;

    -- IF EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = v_guid) THEN
	/*
	OPEN result_errors FOR
		SELECT * 
		FROM tmp_Msg_Error 
		WHERE GUID = v_guid
		;
	-- RETURN NEXT result_errors;
    -- result_errors 
	a_error_msg := (
		SELECT 
			-- GUID, id_type, code, 
			msg
		FROM tmp_Msg_Error
		WHERE GUID = v_guid
		LIMIT 1
	);
	*/

    -- select * from tmp_Shop_Product_p_shop_calc_user;
    -- Clean up
	DROP TABLE IF EXISTS tmp_Shop_Product_p_shop_calc_user;
    -- DROP TEMPORARY TABLE IF EXISTS tmp_User_Role_Link;
    -- DROP TABLE IF EXISTS tmp_Msg_Error;
END;
$$ LANGUAGE plpgsql;


/*

CALL p_shop_calc_user (
	'56c9dfc1-e22f-11ee-aab4-b42e9986184a', -- v_guid
	'', 	-- v_id_user -- 'auth0|6582b95c895d09a70ba10fef',
	false,		-- v_get_inactive_users
    '4,5',	-- v_ids_permission
    '1',		-- v_ids_access_level
	-- null,		-- v_ids_product
    '1,2,3'		-- v_ids_permutation
);

SELECT *
FROM Shop_Calc_User_Temp
;

DROP TABLE Shop_Calc_User_Temp;

SELECT *
FROM Shop_Permission
;

SELECT *
FROM Shop_Access_Level
;

SELECT *
FROM Shop_Product
;

SELECT *
FROM Shop_Product_Permutation
;


*/

/*
SELECT 'NOODS' AS guid,
	U.id_user AS id_user,
	P.id_permission AS id_permission_required,
	AL.id_access_level AS id_access_level_required,
	/*
	v_id_permission,
	v_id_access_level,
	*/
	AL.priority, -- MIN(AL.priority),
	U.is_super_user
	/*
	CASE WHEN U.is_super_user THEN TRUE ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_view THEN TRUE ELSE FALSE END END,
	CASE WHEN U.is_super_user THEN TRUE ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_edit THEN TRUE ELSE FALSE END END,
	CASE WHEN U.is_super_user THEN TRUE ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_admin THEN TRUE ELSE FALSE END END
	*/
FROM parts.Shop_User U
INNER JOIN Shop_User_Role_Link URL
	ON U.id_user = URL.id_user
		AND URL.active
INNER JOIN Shop_Role_Permission_Link RPL
	ON URL.id_role = RPL.id_role
		AND RPL.active
INNER JOIN Shop_Permission P
	ON RPL.id_permission = P.id_permission
		AND P.active
inner JOIN Shop_Access_Level AL
	-- ON P.id_access_level_required = AL.id_access_level
    ON RPL.id_access_level = AL.id_access_level
		AND AL.active
WHERE U.id_user = 'auth0|6582b95c895d09a70ba10fef'
	AND U.active
	AND FIND_IN_SET(P.id_permission, '1,2') > 0
	-- AND v_id_access_level = AL.id_access_leveld
-- GROUP BY U.id_user, P.id_permission, AL.id_access_level -- , is_super_user

*/
