

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_stock_item;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_stock_item (
	IN a_id_user INT,
    IN a_get_all_product_permutation BIT,
	IN a_get_inactive_product_permutation BIT,
    IN a_ids_product_permutation TEXT,
    IN a_get_all_stock_item BIT,
	IN a_get_inactive_stock_item BIT,
	IN a_ids_stock_item LONGTEXT,
    IN a_get_all_region_storage BIT,
	IN a_get_inactive_region_storage BIT,
    IN a_ids_region_storage TEXT,
    IN a_get_all_plant_storage BIT,
	IN a_get_inactive_plant_storage BIT,
    IN a_ids_plant_storage TEXT,
    IN a_get_all_location_storage BIT,
	IN a_get_inactive_location_storage BIT,
    IN a_ids_location_storage TEXT,
    IN a_date_received_to DATETIME,
	IN a_get_sealed_stock_item_only BIT,
	IN a_get_unsealed_stock_item_only BIT,
	IN a_get_expired_stock_item_only BIT,
	IN a_get_nonexpired_stock_item_only BIT,
	IN a_get_consumed_stock_item_only BIT,
	IN a_get_nonconsumed_stock_item_only BIT,
    IN a_debug BIT
)
BEGIN
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
    -- DECLARE v_now DATETIME;
    -- DECLARE v_id_minimum INT;
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'VIEW');
    SET v_time_start := CURRENT_TIMESTAMP(6);

    
	-- Argument validation + default values
	SET a_id_user := TRIM(IFNULL(a_id_user, ''));
	SET a_get_all_product_permutation := IFNULL(a_get_all_product_permutation, 0);
	-- SET a_guid_permutations := IFNULL(a_guid_permutations, '');
	SET a_get_inactive_product_permutation := IFNULL(a_get_inactive_product_permutation, 0);
	SET a_ids_product_permutation := IFNULL(a_ids_product_permutation, '');
	SET a_get_all_stock_item := IFNULL(a_get_all_stock_item, 0);
	SET a_get_inactive_stock_item := IFNULL(a_get_inactive_stock_item, 0);
	SET a_ids_stock_item := TRIM(IFNULL(a_ids_stock_item, ''));
	SET a_get_all_region_storage := IFNULL(a_get_all_region_storage, 0);
	SET a_get_inactive_region_storage := IFNULL(a_get_inactive_region_storage, 0);
	SET a_ids_region_storage := TRIM(IFNULL(a_ids_region_storage, ''));
	SET a_get_all_plant_storage := IFNULL(a_get_all_plant_storage, 0);
	SET a_get_inactive_plant_storage := IFNULL(a_get_inactive_plant_storage, 0);
	SET a_ids_plant_storage := TRIM(IFNULL(a_ids_plant_storage, ''));
	SET a_get_all_location_storage := IFNULL(a_get_all_location_storage, 0);
	SET a_get_inactive_location_storage := IFNULL(a_get_inactive_location_storage, 0);
	SET a_ids_location_storage := TRIM(IFNULL(a_ids_location_storage, ''));
	SET a_date_received_to := a_date_received_to; -- IFNULL(a_date_received_to, NOW());
	SET a_get_sealed_stock_item_only := IFNULL(a_get_sealed_stock_item_only, 0);
	SET a_get_unsealed_stock_item_only := IFNULL(a_get_unsealed_stock_item_only, 0);
	SET a_get_expired_stock_item_only := IFNULL(a_get_expired_stock_item_only, 0);
	SET a_get_nonexpired_stock_item_only := IFNULL(a_get_nonexpired_stock_item_only, 0);
	SET a_get_consumed_stock_item_only := IFNULL(a_get_consumed_stock_item_only, 0);
	SET a_get_nonconsumed_stock_item_only := IFNULL(a_get_nonconsumed_stock_item_only, 0);
	
    -- Temporary tables
    DROP TEMPORARY TABLE IF EXISTS tmp_Region_Storage;
    DROP TEMPORARY TABLE IF EXISTS tmp_Plant_Storage;
    DROP TEMPORARY TABLE IF EXISTS tmp_Location_Storage;
	DROP TEMPORARY TABLE IF EXISTS tmp_Stock_Item;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
	-- DROP TABLE IF EXISTS tmp_Msg_Error;
    DROP TEMPORARY TABLE IF EXISTS tmp_Category;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    
    CREATE TEMPORARY TABLE tmp_Category (
		id_category INT NOT NULL
        , display_order INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Product (
		id_category INT NOT NULL
		, id_product INT NOT NULL
        , display_order INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Permutation (
		id_permutation INT NULL
		, id_product INT NOT NULL
        , can_view BIT
        , can_edit BIT
        , can_admin BIT
    );
	
	CREATE TEMPORARY TABLE tmp_Stock_Item (
		id_stock INT NOT NULL PRIMARY KEY
        , id_permutation INT NOT NULL
        , id_product INT NOT NULL
		, id_location_storage INT NOT NULL
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
        -- , rank_region INT NOT NULL
	);

	CREATE TEMPORARY TABLE tmp_Plant_Storage (
		id_plant INT NOT NULL PRIMARY KEY
        /*
		CONSTRAINT FK_tmp_Plant_Storage_id_plant
			FOREIGN KEY (id_plant)
			REFERENCES Shop_Plant(id_plant)
		*/
        -- , rank_plant INT NOT NULL
        , id_region INT NOT NULL
	);

	CREATE TEMPORARY TABLE tmp_Location_Storage (
		id_location INT NOT NULL PRIMARY KEY
        /*
		CONSTRAINT FK_tmp_Location_Storage_id_location
			FOREIGN KEY (id_location)
			REFERENCES Shop_Location_Storage(id_location)
		*/
        -- , rank_location INT NOT NULL
        , id_plant INT NOT NULL
	);
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        -- guid BINARY(36) NOT NULL,
		id_type INT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Split (
		substring VARCHAR(4000) NOT NULL
        , as_int INT NULL
	);
    DELETE FROM tmp_Split;
    
    
    -- Parse filters
    SET v_has_filter_permutation = CASE WHEN a_ids_product_permutation = '' THEN 0 ELSE 1 END; -- CASE WHEN a_guid_permutations = '' THEN 0 ELSE 1 END;
    SET v_has_filter_stock_item = CASE WHEN a_ids_stock_item = '' THEN 0 ELSE 1 END;
    SET v_has_filter_region_storage = CASE WHEN a_ids_region_storage = '' THEN 0 ELSE 1 END;
    SET v_has_filter_plant_storage = CASE WHEN a_ids_plant_storage = '' THEN 0 ELSE 1 END;
    SET v_has_filter_location_storage = CASE WHEN a_ids_location_storage = '' THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
    CALL partsltd_prod.p_shop_calc_product_permutation (
		a_id_user
		, 1 -- a_get_all_product_category
		, 0 -- a_get_inactive_product_category
		, '' -- a_ids_product_category
		, 1 -- a_get_all_product
		, 0 -- a_get_inactive_product
		, '' -- a_ids_product
		, a_get_all_product_permutation
		, a_get_inactive_product_permutation
		, a_ids_product_permutation
		, 0 
		, v_guid -- a_guid
		, 0 -- a_debug 
    );
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		INSERT INTO tmp_Category (
			id_category
			, display_order
		)
		SELECT 
			PC.id_category
			, PC.display_order
		FROM (SELECT * FROM partsltd_prod.Shop_Product_Category_Temp WHERE GUID = v_guid) PC_T 
		INNER JOIN partsltd_prod.Shop_Product_Category PC ON PC_T.id_category = PC.id_category
		;
		
		INSERT INTO tmp_Product (
			id_product
			, id_category
			, display_order
		)
		SELECT 
			P.id_product
			, P.id_category
			, P.display_order
		FROM (SELECT * FROM partsltd_prod.Shop_Product_Temp WHERE GUID = v_guid) P_T 
		INNER JOIN partsltd_prod.Shop_Product P ON P.id_product = P_T.id_product
		;
		
		INSERT INTO tmp_Permutation (
			id_permutation
			, id_product
            , can_view
            , can_edit
            , can_admin
		)
		SELECT 
			PP.id_permutation
			, PP.id_product
            , PP_T.can_view
            , PP_T.can_edit
            , PP_T.can_admin
		FROM (SELECT * FROM partsltd_prod.Shop_Product_Permutation_Temp WHERE GUID = v_guid) PP_T
		INNER JOIN partsltd_prod.Shop_Product_Permutation PP ON PP_T.id_permutation = PP.id_permutation
		;
    
    # Stock Items
		CALL partsltd_prod.p_split(v_guid, a_ids_stock_item, ',', a_debug);
        
        DELETE FROM tmp_Split;
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( v_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Stock_Item SI ON t_S.as_int = SI.id_stock
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(SI.id_stock)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- v_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive stock item IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Stock_Item SI ON t_S.as_int = SI.id_stock
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(SI.id_stock)
			;
		ELSE
			INSERT INTO tmp_Stock_Item (
				id_stock
                , id_permutation
                , id_product
                , id_location_storage
			)
			SELECT 
				SI.id_stock
                , SI.id_permutation
                , t_PP.id_product
                , SI.id_location_storage
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_Stock_Item SI ON t_S.as_int = SI.id_stock
            INNER JOIN tmp_Permutation t_PP ON SI.id_permutation = t_PP.id_permutation
			WHERE 
				(
					a_get_all_stock_item = 1
					OR (
						v_has_filter_stock_item = 1
						AND NOT ISNULL(t_S.as_int)
					)
				)
				AND (
					a_get_inactive_stock_item = 1
					OR SI.active = 1
				)
				AND (
					ISNULL(a_date_received_to)
					OR SI.date_received <= a_date_received_to
				)
				AND (
					a_get_unsealed_stock_item_only = 0
					OR SI.is_sealed = 0
				)
				AND (
					a_get_sealed_stock_item_only = 0
					OR SI.is_sealed = 1
				)
				AND (
					a_get_nonexpired_stock_item_only = 0
					OR SI.date_expiration > v_time_start
				)
				AND (
					a_get_expired_stock_item_only = 0
					OR SI.date_expiration <= v_time_start
				)
				AND (
					a_get_consumed_stock_item_only = 0
					OR SI.is_consumed = 1
				)
				AND (
					a_get_nonconsumed_stock_item_only = 0
					OR SI.is_consumed = 0
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
	-- Storage Regions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_region_storage, ',', a_debug);
        
        DELETE FROM tmp_Split;
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( v_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Region R ON t_S.as_int = R.id_region
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(R.id_region)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- v_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive region IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Region R ON t_S.as_int = R.id_region
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(R.id_region)
			;
		ELSE
			INSERT INTO tmp_Region_Storage (
				id_region
			)
			WITH RECURSIVE Recursive_CTE_Region_Storage AS (
				SELECT 
					R.id_region AS id_region_parent,
					NULL AS id_region_child
				FROM tmp_Split t_S
				RIGHT JOIN partsltd_prod.Shop_Region R 
					ON t_S.as_int = R.id_region
					AND (
						a_get_all_region_storage = 1
						OR NOT ISNULL(t_S.as_int)
					)
					AND (
						a_get_inactive_region_storage = 1
						OR R.active = 1
					)			
                INNER JOIN (
					SELECT
						A.id_region
					FROM tmp_Stock_Item t_SI
					-- INNER JOIN tmp_Stock_Item t_SI ON SL.id_location = t_SI.id_location_storage
					INNER JOIN partsltd_prod.Shop_Storage_Location SL ON t_SI.id_location_storage = SL.id_location
					INNER JOIN partsltd_prod.Shop_Plant P ON SL.id_plant = P.id_plant
					INNER JOIN partsltd_prod.Shop_Address A ON P.id_address = A.id_address
				) A_SI ON R.id_region = A_SI.id_region
				UNION
				SELECT 
					RB.id_region_parent,
					RB.id_region_child
				FROM partsltd_prod.Shop_Region_Branch RB
				INNER JOIN Recursive_CTE_Region_Storage r_RS
					ON RB.id_region_parent = r_RS.id_region_child
					AND (
						a_get_inactive_region_storage = 1
						OR RB.active = 1
					)
			)
			SELECT
				DISTINCT R.id_region
			FROM partsltd_prod.Shop_Region R
			INNER JOIN Recursive_CTE_Region_Storage r_RS
				ON R.id_region = r_RS.id_region_parent
				OR R.id_region = r_RS.id_region_child
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
	-- Plants
    INSERT INTO tmp_Plant_Storage (
		id_plant
        , id_region
	)
	SELECT 
		DISTINCT P.id_plant
        , A.id_region
	FROM tmp_Stock_Item t_SI
	INNER JOIN partsltd_prod.Shop_Storage_Location SL ON t_SI.id_location_storage = SL.id_location
	INNER JOIN partsltd_prod.Shop_Plant P ON SL.id_plant = P.id_plant
    INNER JOIN partsltd_prod.Shop_Address A ON P.id_address = A.id_address
	;
    
	-- Storage Locations
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_location_storage, ',', a_debug);
        
        DELETE FROM tmp_Split;
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( v_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Region R ON t_S.as_int = R.id_region
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(R.id_region)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- v_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive region IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Region R ON t_S.as_int = R.id_region
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(R.id_region)
			;
		ELSE
			INSERT INTO tmp_Location_Storage (
				id_location
				, id_plant
			)
			WITH RECURSIVE Recursive_CTE_Location_Storage AS (
				SELECT 
					SL.id_location AS id_location_parent,
					NULL AS id_location_child
				FROM tmp_Split t_S
				RIGHT JOIN partsltd_prod.Shop_Storage_Location SL 
					ON t_S.as_int = SL.id_location
					AND (
						a_get_all_location_storage = 1
						OR NOT ISNULL(t_S.as_int)
					)
					AND (
						a_get_inactive_location_storage = 1
						OR SL.active = 1
					)
                INNER JOIN tmp_Stock_Item t_SI ON SL.id_location = t_SI.id_location_storage
				UNION
				SELECT 
					SLB.id_location_parent,
					SLB.id_location_child
				FROM partsltd_prod.Shop_Storage_Location_Branch SLB
				INNER JOIN Recursive_CTE_Location_Storage r_LS
					ON SLB.id_location_parent = r_LS.id_location_child
					AND (
						a_get_inactive_location_storage
						OR SLB.active = 1
					)
			)
			SELECT
				DISTINCT SL.id_location
				, SL.id_plant
			FROM partsltd_prod.Shop_Storage_Location SL
			INNER JOIN Recursive_CTE_Location_Storage r_LS
				ON SL.id_location = r_LS.id_location_parent
				OR SL.id_location = r_LS.id_location_child
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    /*
    -- Permissions
    IF EXISTS (SELECT * FROM tmp_Stock_Item LIMIT 1) THEN
        SET v_id_permission_product := (SELECT id_permission FROM partsltd_prod.Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
        SET v_ids_product_permission := (SELECT GROUP_CONCAT(id_product SEPARATOR ',') FROM tmp_Permutation WHERE NOT ISNULL(id_product));
        -- SET v_ids_permutation_permission := (SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission;
        -- select * FROM partsltd_prod.Shop_Calc_User_Temp;
        
        CALL p_shop_calc_user(
			v_guid
            , a_id_user
            , false -- a_get_inactive_users
            , v_id_permission_product
            , v_id_access_level_view
            , v_ids_product_permission
            , 0 -- a_debug
		);
        
        -- select * FROM partsltd_prod.Shop_Calc_User_Temp;
        
        UPDATE tmp_Stock_Item t_SI
        INNER JOIN partsltd_prod.Shop_Calc_User_Temp UE_T
			ON t_SI.id_product = UE_T.id_product
			AND UE_T.GUID = v_guid
        SET t_SI.can_view = UE_T.can_view,
			t_SI.can_edit = UE_T.can_edit,
            t_SI.can_admin = UE_T.can_admin
		;
        
        DELETE t_SI
		FROM tmp_Stock_Item t_SI
        / *
		LEFT JOIN partsltd_prod.Shop_Calc_User_Temp UE_T
			ON t_SI.id_product = UE_T.id_product
			AND UE_T.GUID = v_guid
		* /
		WHERE 
			/ *
			FIND_IN_SET(t_SI.id_product, (
				SELECT GROUP_CONCAT(UET.id_product SEPARATOR ',') 
				FROM partsltd_prod.Shop_Calc_User_Temp UET)
			) = 0 # id_product NOT LIKE CONCAT('%', (SELECT GROUP_CONCAT(id_product SEPARATOR '|') FROM partsltd_prod.Shop_Calc_User_Temp), '%');
			* /
            / *
			ISNULL(UE_T.id_product)
			OR IFNULL(UE_T.can_view, 0) = 0
            * /
            t_SI.id_product NOT IN (
				SELECT id_product 
                FROM partsltd_prod.Shop_Calc_User_Temp UE_T
                WHERE
					GUID = v_guid
					AND IFNULL(can_view, 0) = 1
			)
        ;
        
        # CALL p_shop_clear_calc_user(v_guid);
        # DROP TABLE IF EXISTS Shop_Calc_User_Temp;
        DELETE FROM partsltd_prod.Shop_Calc_User_Temp
        WHERE GUID = v_guid
        ;
    END IF;
    */
    
    /*
    select * FROM partsltd_prod.Shop_stock_item;
    select * from tmp_Stock_Item;
    select * from tmp_Permutation;
    select * from tmp_Location_Storage;
    select * from Shop_Storage_Location;
    select * from tmp_Plant_Storage;
    select * from tmp_Region_Storage;
    */
    
    -- Returns
    -- SET v_now := NOW();
    # Stock Items
    SELECT 
		t_SI.id_stock,
		t_SI.id_permutation,
		P.id_product,
		P.id_category,
		t_SI.id_location_storage,
        t_PS.id_plant,
        PLANT.id_address AS id_address_plant,
        t_RS.id_region AS id_region_plant,
        SL.code AS code_storage_location,
        SL.name AS name_storage_location,
        PLANT.code AS code_plant,
        PLANT.name AS name_plant,
		SI.id_currency_cost,
		CURRENCY.symbol AS symbol_currency_cost,
		CURRENCY.code AS code_currency_cost,
		SI.cost_local_VAT_excl,
		SI.cost_local_VAT_incl,
		SI.date_purchased,
		SI.date_received,
		SI.is_sealed,
		SI.date_unsealed,
		SI.date_expiration,
		SI.is_consumed,
		SI.date_consumed,
		SI.active,
		/*
        t_SI.active_permutation,
		t_SI.active_product,
		t_SI.active_category,
		*/
        t_PP.can_view,
        t_PP.can_edit,
        t_PP.can_admin
    FROM tmp_Stock_Item t_SI
    INNER JOIN partsltd_prod.Shop_Stock_Item SI ON t_SI.id_stock = SI.id_stock
	INNER JOIN tmp_Permutation t_PP ON t_SI.id_permutation = t_PP.id_permutation
    INNER JOIN partsltd_prod.Shop_Product P ON t_PP.id_product = P.id_product
	INNER JOIN tmp_Location_Storage t_LS ON t_SI.id_location_storage = t_LS.id_location
	INNER JOIN tmp_Plant_Storage t_PS ON t_LS.id_plant = t_PS.id_plant
    INNER JOIN partsltd_prod.Shop_Plant PLANT ON t_PS.id_plant = PLANT.id_plant
	INNER JOIN partsltd_prod.Shop_Address A ON PLANT.id_address = A.id_address
	INNER JOIN tmp_Region_Storage t_RS ON A.id_region = t_RS.id_region
	INNER JOIN partsltd_prod.Shop_Storage_Location SL ON t_LS.id_location = SL.id_location
    INNER JOIN partsltd_prod.Shop_Currency CURRENCY ON SI.id_currency_cost = CURRENCY.id_currency
	WHERE
		IFNULL(t_PP.can_view, 0) = 1
	;
    
    # Errors
    SELECT 
		t_ME.display_order,
		-- t_ME.guid,
        t_ME.id_type,
        t_ME.msg,
        MET.code, 
        MET.name,
        MET.description
    FROM tmp_Msg_Error t_ME
    INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    -- WHERE guid = v_guid
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
	-- DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    
	CALL partsltd_prod.p_shop_clear_calc_product_permutation ( v_guid );
    
    IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;


/*
CALL p_shop_get_many_stock_item (
	1, # a_id_user
    1, # a_get_all_product_permutation
	-- 'nips', # a_guid_permutations
    0, # a_get_inactive_product_permutation
    '', # a_ids_product_permutation
	1, # a_get_all_stock_item
	0, # a_get_inactive_stock_item
	'', # a_ids_stock_item
    1, # a_get_all_region_storage
    0, # a_get_inactive_delivery_region
	'', # a_ids_region_storage
	1, # a_get_all_plant_storage
	0, # a_get_inactive_plant_storage
	'', # a_ids_plant_storage
	1, # a_get_all_location_storage
	0, # a_get_inactive_location_storage
	'', # a_ids_location_storage
	NULL, # a_date_received_to
	0, # a_get_sealed_stock_item_only
	0, # a_get_unsealed_stock_item_only
	0, # a_get_expired_stock_item_only
	0, # a_get_nonexpired_stock_item_only
	0, # a_get_consumed_stock_item_only
	0 # a_get_nonconsumed_stock_item_only
    , 0 # a_debug
);



DROP TABLE IF EXISTS tmp_Msg_Error;

select * FROM partsltd_prod.Shop_Storage_Location;
select * FROM partsltd_prod.Shop_product;
select * from TMP_MSG_ERROR;
DROP TABLE TMP_MSG_ERROR;

insert into shop_product_change_set (comment)
    values ('set product not subscription - test bool output to python');
    update shop_product
    set is_subscription = 0,
		id_change_set = (select id_change_set FROM partsltd_prod.Shop_product_change_set order by id_change_set desc limit 1)
    where id_product = 1
*/
