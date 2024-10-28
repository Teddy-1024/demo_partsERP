-- USE partsltd_prod;

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_calc_product_permutation;

DELIMITER //
CREATE PROCEDURE p_shop_calc_product_permutation (
	IN a_id_user INT
    , IN a_get_all_product_category BIT
	, IN a_get_inactive_product_category BIT
	, IN a_ids_product_category TEXT
    , IN a_get_all_product BIT
	, IN a_get_inactive_product BIT
	, IN a_ids_product TEXT
    , IN a_get_all_product_permutation BIT
	, IN a_get_inactive_permutation BIT
	, IN a_ids_permutation TEXT
    , IN a_get_products_quantity_stock_below_min BIT
    , IN a_guid BINARY(36)
    , IN a_debug BIT
)
BEGIN
/*
	PROCEDURE p_shop_calc_product_permutation
	Shared filtering for product permutations
    
    select * FROM partsltd_prod.Shop_msg_error_type;
*/
    DECLARE v_has_filter_product_category BIT;
    DECLARE v_has_filter_product BIT;
    DECLARE v_has_filter_permutation BIT;
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission TEXT;
    DECLARE v_id_access_level_view INT;
    DECLARE v_id_minimum INT;
    DECLARE v_ids_product_invalid TEXT;
    DECLARE v_ids_category_invalid TEXT;
    DECLARE v_time_start TIMESTAMP(6);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_code_type_error_bad_data VARCHAR(50);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_id_access_level_view := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'VIEW');
    
    SELECT 
		MET.id_type
		, MET.code
	INTO
		v_id_type_error_bad_data
		, v_code_type_error_bad_data
	FROM partsltd_prod.Shop_Msg_Error_Type MET
	WHERE MET.code = 'BAD_DATA'
	;
    
    SET a_id_user := TRIM(IFNULL(a_id_user, 0));
    SET a_get_all_product_category := IFNULL(a_get_all_product_category, 0);
    SET a_get_inactive_product_category := IFNULL(a_get_inactive_product_category, 0);
    SET a_ids_product_category := TRIM(IFNULL(a_ids_product_category, ''));
    SET a_get_all_product := IFNULL(a_get_all_product, 0);
    SET a_get_inactive_product := IFNULL(a_get_inactive_product, 0);
    SET a_ids_product := TRIM(IFNULL(a_ids_product, ''));
    SET a_get_all_product_permutation := IFNULL(a_get_all_product_permutation, 0);
    SET a_get_inactive_permutation := IFNULL(a_get_inactive_permutation, 0);
    SET a_ids_permutation := TRIM(IFNULL(a_ids_permutation, ''));
    SET a_get_products_quantity_stock_below_min := IFNULL(a_get_products_quantity_stock_below_min, 0);
    -- SET a_guid := IFNULL(a_guid, UUID());
    SET a_debug := IFNULL(a_debug, 0);
    
    IF a_debug = 1 THEN
		SELECT 
			a_id_user
            , a_get_all_product_category, a_ids_product_category, a_get_inactive_product_category
            , a_get_all_product, a_get_inactive_product, a_ids_product
            , a_get_all_product_permutation, a_get_inactive_permutation, a_ids_permutation
            , a_get_products_quantity_stock_below_min
            , a_debug
		;
    END IF;
    
    -- Temporary tables
    -- DROP TEMPORARY TABLE IF EXISTS tmp_Split;
    DROP TEMPORARY TABLE IF EXISTS tmp_Category_calc;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product_calc;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation_calc;
    
    
    CREATE TEMPORARY TABLE tmp_Category_calc (
		id_category INT NOT NULL
        -- , active BIT NOT NULL
        -- display_order INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Product_calc (
		id_category INT NOT NULL
		, id_product INT NOT NULL
        -- active BIT NOT NULL
        -- display_order INT NOT NULL
        , can_view BIT
        , can_edit BIT
        , can_admin BIT
    );
    
    CREATE TEMPORARY TABLE tmp_Permutation_calc (
		id_permutation INT NULL
        -- id_category INT NOT NULL
		, id_product INT NOT NULL
        -- , active BIT NOT NULL
        -- , display_order INT NOT NULL
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
        -- , guid BINARY(36) NOT NULL
		, id_type INT NULL
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Split (
		substring VARCHAR(4000) NOT NULL
        , as_int INT NULL
	);
    DELETE FROM tmp_Split;
    
    -- Parse filters
    SET v_has_filter_product_category = CASE WHEN a_ids_product_category = '' THEN 0 ELSE 1 END;
    SET v_has_filter_product = CASE WHEN a_ids_product = '' THEN 0 ELSE 1 END;
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    
    CALL p_validate_guid ( a_guid );

	IF a_debug = 1 THEN
		SELECT
			v_has_filter_product_category
            , v_has_filter_product
            , v_has_filter_permutation
		;
    END IF;
    
    -- Categories
    IF TRUE THEN -- NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		CALL partsltd_prod.p_split(a_guid, a_ids_product_category, ',', a_debug);
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = a_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( a_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Product_Category PC ON t_S.as_int = PC.id_category 
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(PC.id_category)
				OR (
					PC.active = 0
					AND a_get_inactive_product_category = 0
				)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- a_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive category IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Product_Category PC ON t_S.as_int = PC.id_category
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(PC.id_category)
				OR (
					PC.active = 0
					AND a_get_inactive_product_category = 0
				)
			;
		ELSE
			INSERT INTO tmp_Category_calc (
				id_category
			)
			SELECT 
				PC.id_category
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_Product_Category PC ON t_S.as_int = PC.id_category
			WHERE (
					a_get_all_product_category = 1
					OR (
						v_has_filter_product_category = 1
						AND NOT ISNULL(t_S.as_int)
					)
				)
				AND (
					a_get_inactive_product_category = 1
					OR PC.active = 1
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    -- Products
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		CALL partsltd_prod.p_split(a_guid, a_ids_product, ',', a_debug);
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = a_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( a_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Product P ON t_S.as_int = P.id_product
			WHERE 
				ISNULL(t_S.as_int)
                OR ISNULL(P.id_product)
				OR (
					P.active = 0
					AND a_get_inactive_product = 0
				)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- a_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive product IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Product P ON t_S.as_int = P.id_product
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(P.id_product)
				OR (
					P.active = 0
					AND a_get_inactive_product = 0
				)
			;
		ELSE
			INSERT INTO tmp_Product_calc (
				id_category
				, id_product
			)
			SELECT 
				P.id_category
				, P.id_product
			FROM tmp_Split t_S
            RIGHT JOIN partsltd_prod.Shop_Product P ON t_S.as_int = P.id_product
			INNER JOIN tmp_Category_calc t_C ON P.id_category = t_C.id_category
			WHERE (
					a_get_all_product = 1
					OR (
						v_has_filter_product = 1
						AND NOT ISNULL(t_S.as_int)
					)
				)
				AND (
					a_get_inactive_product = 1
					OR P.active = 1
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
        
	-- Permutations
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		CALL partsltd_prod.p_split(a_guid, a_ids_product, ',', a_debug);
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = a_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( a_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_S.as_int = PP.id_permutation
			WHERE 
				ISNULL(t_S.as_int)
                OR ISNULL(PP.id_permutation)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- a_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive permutation IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_S.as_int = PP.id_permutation
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(PP.id_permutation)
				OR (
					PP.active = 0
					AND a_get_inactive_product_permutation = 0
				)
			;
		ELSE
			INSERT INTO tmp_Permutation_calc (
				id_permutation
				-- id_category,
				, id_product
			)
			SELECT 
				PP.id_permutation
				-- P.id_category,
				, PP.id_product
			FROM tmp_Split t_S 
            RIGHT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_S.as_int = PP.id_permutation
			INNER JOIN tmp_Product_calc t_P ON PP.id_product = t_P.id_product
			WHERE 1=1
				AND (
					a_get_all_product_permutation = 1
					OR (
						v_has_filter_permutation = 1
						AND NOT ISNULL(t_S.as_int)
					)
				)
				AND (
					a_get_products_quantity_stock_below_min = 0
					OR PP.quantity_stock < PP.quantity_min
				)
				AND (
					a_get_inactive_permutation = 1
					OR PP.active = 1
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
	-- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (SELECT * FROM tmp_Product_calc LIMIT 1) THEN
			SET v_id_permission_product := (SELECT id_permission FROM partsltd_prod.Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
			SET v_ids_product_permission := (SELECT GROUP_CONCAT(id_product SEPARATOR ',') FROM tmp_Product_calc WHERE NOT ISNULL(id_product));
			
			IF a_debug = 1 THEN
				SELECT 
					a_guid AS a_guid
					, a_id_user
					, false AS a_get_inactive_user
					, v_id_permission_product AS a_ids_permission
					, v_id_access_level_view AS a_ids_access_level
					, v_ids_product_permission AS a_ids_product
				;
			END IF;
			
			CALL p_shop_calc_user(
				a_guid
                , a_id_user
                , false -- a_get_inactive_user
                , v_id_permission_product -- a_ids_permission
                , v_id_access_level_view -- a_ids_access_level
                , v_ids_product_permission -- a_ids_permutation
                , false -- a_debug
			);
			
			
			UPDATE tmp_Product_calc t_P
			INNER JOIN partsltd_prod.Shop_Calc_User_Temp UE_T
				ON t_P.id_product = UE_T.id_product
				AND UE_T.GUID = a_guid
			SET t_P.can_view = UE_T.can_view,
				t_P.can_edit = UE_T.can_edit,
				t_P.can_admin = UE_T.can_admin
			;
			
			IF a_debug = 1 THEN
				SELECT * 
                FROM partsltd_prod.Shop_Calc_User_Temp
                WHERE GUID = a_guid
                ;
			END IF;
			
			SET v_ids_product_invalid := (
				SELECT GROUP_CONCAT(t_P.id_product SEPARATOR ',') 
				FROM tmp_Product_calc t_P
				WHERE ISNULL(t_P.can_view)
			);
			SET v_ids_category_invalid := (
				SELECT GROUP_CONCAT(t_P.id_category SEPARATOR ',') 
				FROM (SELECT DISTINCT id_category, id_product, can_view FROM tmp_Product_calc) t_P
				WHERE ISNULL(t_P.can_view)
			);
			
			DELETE t_C
			FROM tmp_Category_calc t_C
			WHERE FIND_IN_SET(t_C.id_category, v_ids_category_invalid) > 0
			;
			
			DELETE t_P
			FROM tmp_Product_calc t_P
			WHERE FIND_IN_SET(t_P.id_product, v_ids_product_invalid) > 0
			;
			
			DELETE t_PP
			FROM tmp_Permutation_calc t_PP
			WHERE FIND_IN_SET(t_PP.id_product, v_ids_product_invalid) > 0
			;
			
			CALL p_shop_clear_calc_user( a_guid, a_debug );
		END IF;
    END IF;
    
	IF a_debug = 1 THEN
		SELECT * FROM tmp_Category_calc;
		SELECT * FROM tmp_Product_calc;
		SELECT * FROM tmp_Permutation_calc;
	END IF;
    
    -- Transaction
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
	/*
	DELETE FROM tmp_Category_calc;
		DELETE FROM tmp_Product_calc;
		DELETE FROM tmp_Permutation_calc;
    ELSE
    */
		START TRANSACTION; 
		
			# Categories
			INSERT INTO Shop_Product_Category_Temp (
				id_category
				, code
				, name
				, description
				, id_access_level_required
				, display_order
				, active
				, can_view
				, can_edit
				, can_admin
				, guid
			)
			SELECT 
				t_C.id_category
				, PC.code
				, PC.name
				, PC.description
				, PC.id_access_level_required
				, PC.display_order
				, PC.active
				, MIN(IFNULL(t_P.can_view, 0)) AS can_view
				, MIN(IFNULL(t_P.can_edit, 0)) AS can_edit
				, MIN(IFNULL(t_P.can_admin, 0)) AS can_admin
				, a_guid
			FROM tmp_Category_calc t_C
			INNER JOIN partsltd_prod.Shop_Product_Category PC ON t_C.id_category = PC.id_category
			LEFT JOIN tmp_Product_calc t_P ON t_C.id_category = t_P.id_product
			GROUP BY PC.id_category
			;
			
			# Products
			INSERT INTO Shop_Product_Temp (
				id_product
				, id_category
				, name
				, has_variations
				, id_access_level_required
				, display_order
				, active
				, can_view
				, can_edit
				, can_admin
				, guid
			)
			SELECT 
				t_P.id_product
				, P.id_category
				, P.name
				, P.has_variations
				, P.id_access_level_required
				, P.display_order
				, P.active
				, t_P.can_view
				, t_P.can_edit
				, t_P.can_admin
				, a_guid
			FROM tmp_Product_calc t_P
			INNER JOIN partsltd_prod.Shop_Product P ON t_P.id_product = P.id_product
			INNER JOIN tmp_Category_calc t_C ON t_P.id_category = t_C.id_category
			INNER JOIN partsltd_prod.Shop_Access_Level AL ON P.id_access_level_required = AL.id_access_level
			GROUP BY P.id_product, t_P.can_view, t_P.can_edit, t_P.can_admin
			;
			
			# Product Permutations
			INSERT INTO Shop_Product_Permutation_Temp (
				id_permutation
				, id_product
				, description
				, cost_local
				, id_currency_cost
				, profit_local_min
				, latency_manufacture
				, id_unit_measurement_quantity
				, count_unit_measurement_per_quantity_step
				, quantity_min
				, quantity_max
				, quantity_stock
				, is_subscription
				, id_unit_measurement_interval_recurrence
				, count_interval_recurrence
				, id_stripe_product
				, does_expire_faster_once_unsealed
				, id_unit_measurement_interval_expiration_unsealed
				, count_interval_expiration_unsealed
				, active
				, can_view
				, can_edit
				, can_admin
				, guid
			)
			SELECT 
				t_PP.id_permutation
				, PP.id_product
				, PP.description
				, PP.cost_local
				, PP.id_currency_cost
				, PP.profit_local_min
				, PP.latency_manufacture
				, PP.id_unit_measurement_quantity
				, PP.count_unit_measurement_per_quantity_step
				, PP.quantity_min
				, PP.quantity_max
				, PP.quantity_stock
				, PP.is_subscription
				, PP.id_unit_measurement_interval_recurrence
				, PP.count_interval_recurrence
				, PP.id_stripe_product
				, PP.does_expire_faster_once_unsealed
				, PP.id_unit_measurement_interval_expiration_unsealed
				, PP.count_interval_expiration_unsealed
				, PP.active
				, IFNULL(t_P.can_view, 0) AS can_view
				, IFNULL(t_P.can_edit, 0) AS can_edit
				, IFNULL(t_P.can_admin, 0) AS can_admin
				, a_guid
			FROM tmp_Permutation_calc t_PP
			INNER JOIN partsltd_prod.Shop_Product_Permutation PP ON t_PP.id_permutation = PP.id_permutation
			INNER JOIN tmp_Product_calc t_P ON t_PP.id_product = t_P.id_product
			INNER JOIN partsltd_prod.Shop_Product P ON t_PP.id_product = P.id_product
			INNER JOIN partsltd_prod.Shop_Product_Category PC ON P.id_category = PC.id_category
			LEFT JOIN partsltd_prod.Shop_Product_Permutation_Variation_Link PPVL ON PP.id_permutation = PPVL.id_permutation
			LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM_Q ON PP.id_unit_measurement_quantity = UM_Q.id_unit_measurement
			LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM_R ON PP.id_unit_measurement_interval_recurrence = UM_R.id_unit_measurement
			LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM_X ON PP.id_unit_measurement_interval_expiration_unsealed = UM_X.id_unit_measurement
			INNER JOIN partsltd_prod.Shop_Currency C ON PP.id_currency_cost = C.id_currency
			GROUP BY PP.id_permutation, t_P.can_view, t_P.can_edit, t_P.can_admin
			;
			
		COMMIT;
    END IF;
    
    /*
    # Errors
    SELECT 
		t_ME.display_order,
		t_ME.guid,
        t_ME.id_type,
        t_ME.msg,
        MET.code, 
        MET.name,
        MET.description
    FROM tmp_Msg_Error t_ME
    INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    WHERE guid = a_guid
    ;
    */
    
    IF a_debug = 1 THEN
		SELECT *
        FROM tmp_Msg_Error
        ;
        
        SELECT *
        FROM partsltd_prod.Shop_Product_Category_Temp
        WHERE GUID = a_guid
        ;
        SELECT *
        FROM partsltd_prod.Shop_Product_Temp
        WHERE GUID = a_guid
        ;
        SELECT *
        FROM partsltd_prod.Shop_Product_Permutation_Temp
        WHERE GUID = a_guid
        ;
        
        CALL p_shop_clear_calc_product_permutation ( a_guid );
    END IF;
    
    -- Clean up
    -- DROP TEMPORARY TABLE IF EXISTS tmp_Split;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation_calc;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product_calc;
    DROP TEMPORARY TABLE IF EXISTS tmp_Category_calc;
    
    IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;;


/*

CALL partsltd_prod.p_shop_calc_product_permutation (
	1 #'auth0|6582b95c895d09a70ba10fef', # a_id_user
    , 1 # a_get_all_product_category
	, 0 # a_get_inactive_product_category
	, '' # a_ids_product_category
    , 1 # a_get_all_product
	, 0 # a_get_inactive_product
	, '' # a_ids_product
    , 1 # a_get_all_product_permutation
	, 0 # a_get_inactive_permutation
	, '' # a_ids_permutation
    , 0 # a_get_products_quantity_stock_below_minimum
    , 'NIPS                                ' # a_guid
    , 0 # a_debug
);


        SELECT *
        FROM partsltd_prod.Shop_Product_Category_Temp
        WHERE GUID = 'NIPS                                '
        ;
        SELECT *
        FROM partsltd_prod.Shop_Product_Temp
        WHERE GUID = 'NIPS                                '
        ;
        SELECT *
        FROM partsltd_prod.Shop_Product_Permutation_Temp
        WHERE GUID = 'NIPS                                '
        ;
        
        CALL p_shop_clear_calc_product_permutation ( 'NIPS                                ' );
        
        SELECT *
        FROM partsltd_prod.Shop_Product_Category_Temp
        WHERE GUID = 'NIPS                                '
        ;
        SELECT *
        FROM partsltd_prod.Shop_Product_Temp
        WHERE GUID = 'NIPS                                '
        ;
        SELECT *
        FROM partsltd_prod.Shop_Product_Permutation_Temp
        WHERE GUID = 'NIPS                                '
        ;
        
*/