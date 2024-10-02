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
    
    select * from shop_msg_error_type;
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
    DECLARE v_time_end TIMESTAMP(6);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_code_type_error_bad_data VARCHAR(50);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');
    
    SELECT 
		MET.id_type
		, MET.code
	INTO
		v_id_type_error_bad_data
		, v_code_type_error_bad_data
	FROM Shop_Msg_Error_Type MET
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
    DROP TEMPORARY TABLE IF EXISTS tmp_Category;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    
    
    CREATE TEMPORARY TABLE tmp_Category (
		id_category INT NOT NULL
        -- , active BIT NOT NULL
        -- display_order INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Product (
		id_category INT NOT NULL
		, id_product INT NOT NULL
        -- active BIT NOT NULL
        -- display_order INT NOT NULL
        , can_view BIT
        , can_edit BIT
        , can_admin BIT
    );
    
    CREATE TEMPORARY TABLE tmp_Permutation (
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
    
    
    -- Parse filters
    SET v_has_filter_product_category = CASE WHEN a_ids_product_category = '' THEN 0 ELSE 1 END;
    SET v_has_filter_product = CASE WHEN a_ids_product = '' THEN 0 ELSE 1 END;
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    
    IF ISNULL(a_guid) THEN
		INSERT INTO tmp_Msg_Error (
			-- guid
            id_type
            , code
            , msg
		)
        VALUES (
			-- NULL
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
            , 'GUID is required.'
        );
    END IF;

	IF a_debug = 1 THEN
		SELECT
			v_has_filter_product_category
            , v_has_filter_product
            , v_has_filter_permutation
		;
    END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		INSERT INTO tmp_Category (
			id_category
		)
		SELECT 
			PC.id_category
		FROM Shop_Product_Category PC
		WHERE (
				a_get_all_product_category = 1
				OR (
					v_has_filter_product_category = 1
					AND FIND_IN_SET(PC.id_category, a_ids_product_category) > 0
				)
			)
			AND (
				a_get_inactive_product_category = 1
				OR PC.active = 1
			)
		;
		
		INSERT INTO tmp_Product (
			id_category
			, id_product
		)
		SELECT 
			P.id_category
			, P.id_product
		FROM Shop_Product P
		INNER JOIN tmp_Category t_C ON P.id_category = t_C.id_category
		WHERE (
				a_get_all_product = 1
				OR (
					v_has_filter_product = 1
					AND FIND_IN_SET(P.id_product, a_ids_product) > 0
				)
			)
			AND (
				a_get_inactive_product = 1
				OR P.active = 1
			)
		;
		
		INSERT INTO tmp_Permutation (
			id_permutation
			-- id_category,
			, id_product
		)
		SELECT 
			PP.id_permutation
			-- P.id_category,
			, PP.id_product
		FROM Shop_Product_Permutation PP
		INNER JOIN tmp_Product t_P ON PP.id_product = t_P.id_product
		WHERE (
				a_get_all_product_permutation = 1
				OR (
					v_has_filter_permutation = 1
					AND FIND_IN_SET(PP.id_permutation, a_ids_permutation) > 0
				)
				OR (
					a_get_products_quantity_stock_below_min = 1
					AND PP.quantity_stock < PP.quantity_min
				)
			)
			AND (
				a_get_inactive_permutation = 1
				OR PP.active = 1
			)
		;
    
		-- Permissions
		IF EXISTS (SELECT * FROM tmp_Product LIMIT 1) THEN
			SET v_id_permission_product := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
			SET v_ids_product_permission := (SELECT GROUP_CONCAT(id_product SEPARATOR ',') FROM tmp_Product WHERE NOT ISNULL(id_product));
			
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
			
			CALL p_shop_calc_user(a_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission);
			
			
			UPDATE tmp_Product t_P
			INNER JOIN Shop_Calc_User_Temp UE_T
				ON t_P.id_product = UE_T.id_product
				AND UE_T.GUID = a_guid
			SET t_P.can_view = UE_T.can_view,
				t_P.can_edit = UE_T.can_edit,
				t_P.can_admin = UE_T.can_admin
			;
			
			IF a_debug = 1 THEN
				SELECT * 
                FROM Shop_Calc_User_Temp
                WHERE GUID = a_guid
                ;
			END IF;
			
			SET v_ids_product_invalid := (
				SELECT GROUP_CONCAT(t_P.id_product SEPARATOR ',') 
				FROM tmp_Product t_P
				WHERE ISNULL(t_P.can_view)
			);
			SET v_ids_category_invalid := (
				SELECT GROUP_CONCAT(t_P.id_category SEPARATOR ',') 
				FROM tmp_Product t_P
				WHERE ISNULL(t_P.can_view)
			);
			
			DELETE 
			FROM tmp_Category t_C
			WHERE FIND_IN_SET(t_C.id_category, v_ids_category_invalid) > 0
			;
			
			DELETE 
			FROM tmp_Product t_P
			WHERE FIND_IN_SET(t_P.id_product, v_ids_product_invalid) > 0
			;
			
			DELETE
			FROM tmp_Permutation t_PP
			WHERE FIND_IN_SET(t_PP.id_product, v_ids_product_invalid) > 0
			;
			
			CALL p_shop_clear_calc_user(a_guid);
		END IF;
    END IF;
    
	IF a_debug = 1 THEN
		SELECT * FROM tmp_Category;
		SELECT * FROM tmp_Product;
		SELECT * FROM tmp_Permutation;
	END IF;
    
    IF EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		DELETE FROM tmp_Category;
		DELETE FROM tmp_Product;
		DELETE FROM tmp_Permutation;
    ELSE
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
			FROM tmp_Category t_C
			INNER JOIN Shop_Product_Category PC ON t_C.id_category = PC.id_category
			LEFT JOIN tmp_Product t_P ON t_C.id_category = t_P.id_product
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
			FROM tmp_Product t_P
			INNER JOIN Shop_Product P ON t_P.id_product = P.id_product
			INNER JOIN tmp_Category t_C ON t_P.id_category = t_C.id_category
			INNER JOIN Shop_Access_Level AL ON P.id_access_level_required = AL.id_access_level
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
				, latency_manufacture_days
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
				, PP.latency_manufacture_days
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
			FROM tmp_Permutation t_PP
			INNER JOIN Shop_Product_Permutation PP ON t_PP.id_permutation = PP.id_permutation
			INNER JOIN tmp_Product t_P ON t_PP.id_product = t_P.id_product
			INNER JOIN Shop_Product P ON t_PP.id_product = P.id_product
			INNER JOIN Shop_Product_Category PC ON P.id_category = PC.id_category
			LEFT JOIN Shop_Product_Permutation_Variation_Link PPVL ON PP.id_permutation = PPVL.id_permutation
			LEFT JOIN Shop_Unit_Measurement UM_Q ON PP.id_unit_measurement_quantity = UM_Q.id_unit_measurement
			LEFT JOIN Shop_Unit_Measurement UM_R ON PP.id_unit_measurement_interval_recurrence = UM_R.id_unit_measurement
			LEFT JOIN Shop_Unit_Measurement UM_X ON PP.id_unit_measurement_interval_expiration_unsealed = UM_X.id_unit_measurement
			INNER JOIN Shop_Currency C ON PP.id_currency_cost = C.id_currency
			GROUP BY PP.id_permutation, t_P.can_view, t_P.can_edit, t_P.can_admin
			;
			
		COMMIT;
    END IF;
    
    
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
    INNER JOIN Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    WHERE guid = a_guid
    ;
    
    IF a_debug = 1 THEN
		SET v_time_end := CURRENT_TIMESTAMP(6);
        SELECT
			v_time_start
            , UNIX_TIMESTAMP(v_time_start)
            , MICROSECOND(v_time_start) / 1000
            , v_time_end
            , UNIX_TIMESTAMP(v_time_end)
            , MICROSECOND(v_time_end) / 1000
            , v_time_end - v_time_start AS timestamp_delta
            , UNIX_TIMESTAMP(v_time_end - v_time_start) AS UNIX_TIMESTAMP_timestamp_delta
            , MICROSECOND(v_time_end - v_time_start) AS MICROSECOND_timestamp_delta
            -- , TIME_FORMAT(TIMEDIFF(v_time_end, v_time_start), '%H:%i:%s') AS time_difference
            , CONCAT(
				TIME_FORMAT(TIMEDIFF(v_time_end, v_time_start), '%H hours, %i minutes, %s seconds'),
				', ',
				TIMESTAMPDIFF(MICROSECOND, v_time_start, v_time_end) % 1000000 / 1000, ' milliseconds'
			) AS time_difference
		;
        
        SELECT *
        FROM Shop_Product_Category_Temp
        WHERE GUID = a_guid
        ;
        SELECT *
        FROM Shop_Product_Temp
        WHERE GUID = a_guid
        ;
        SELECT *
        FROM Shop_Product_Permutation_Temp
        WHERE GUID = a_guid
        ;
        
        START TRANSACTION;
        
			DELETE FROM Shop_Product_Category_Temp
			WHERE GUID = a_guid
			;
			DELETE FROM Shop_Product_Temp
			WHERE GUID = a_guid
			;
			DELETE FROM Shop_Product_Permutation_Temp
			WHERE GUID = a_guid
			;
            
		COMMIT;
    END IF;
    
    -- Clean up
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Category;
    
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
    , 'NIPS' # a_guid
    , 1 # a_debug
);

/
DELETE FROM Shop_Product_Category_Temp
WHERE GUID = 'NIPS'
;
DELETE FROM Shop_Product_Temp
WHERE GUID = 'NIPS'
;
DELETE FROM Shop_Product_Permutation_Temp
WHERE GUID = 'NIPS'
;
*/