-- 
USE partsltd_prod;

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_product;

DELIMITER //
CREATE PROCEDURE p_shop_get_many_product (
	IN a_id_user INT
    , IN a_get_all_product_category BIT
	, IN a_get_inactive_product_category BIT
	, IN a_ids_product_category VARCHAR(500)
    , IN a_get_all_product BIT
	, IN a_get_inactive_product BIT
	, IN a_ids_product VARCHAR(500)
    , IN a_get_all_product_permutation BIT
	, IN a_get_inactive_permutation BIT
	, IN a_ids_permutation VARCHAR(4000)
    , IN a_get_all_image BIT
	, IN a_get_inactive_image BIT
    , IN a_ids_image VARCHAR(4000)
    , IN a_get_products_quantity_stock_below_min BIT
    , IN a_debug BIT
)
BEGIN
    
	-- Argument redeclaration
	-- Variable declaration
    # DECLARE v_has_filter_product_category BIT;
    # DECLARE v_has_filter_product BIT;
    # DECLARE v_has_filter_permutation BIT;
    DECLARE v_has_filter_image BIT;
    DECLARE v_guid BINARY(36);
    # DECLARE v_id_user VARCHAR(100);
    -- DECLARE v_ids_permutation_unavailable VARCHAR(4000);
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission VARCHAR(4000);
    -- DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    -- DECLARE v_now DATETIME;
    DECLARE v_id_minimum INT;
    DECLARE v_ids_product_invalid VARCHAR(4000);
    DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'VIEW');
    
    
	-- Argument validation + default values
    SET a_id_user := IFNULL(a_id_user, 0);
    SET a_get_all_product_category := IFNULL(a_get_all_product_category, 0);
    SET a_get_inactive_product_category := IFNULL(a_get_inactive_product_category, 0);
    SET a_ids_product_category := TRIM(IFNULL(a_ids_product_category, ''));
    SET a_get_all_product := IFNULL(a_get_all_product, 0);
    SET a_get_inactive_product := IFNULL(a_get_inactive_product, 0);
    SET a_ids_product := TRIM(IFNULL(a_ids_product, ''));
    SET a_get_all_product_permutation := IFNULL(a_get_all_product_permutation, 0);
    SET a_get_inactive_permutation := IFNULL(a_get_inactive_permutation, 0);
    SET a_ids_permutation := TRIM(IFNULL(a_ids_permutation, ''));
    SET a_get_all_image := IFNULL(a_get_all_image, 0);
    SET a_get_inactive_image := IFNULL(a_get_inactive_image, 0);
    SET a_ids_image := TRIM(IFNULL(a_ids_image, ''));
    SET a_get_products_quantity_stock_below_min := IFNULL(a_get_products_quantity_stock_below_min, 0);
    SET a_debug := IFNULL(a_debug, 0);
    
    IF a_debug = 1 THEN
		SELECT 
			a_id_user
            , a_get_all_product_category, a_ids_product_category, a_get_inactive_product_category
            , a_get_all_product, a_get_inactive_product, a_ids_product
            , a_get_all_product_permutation, a_get_inactive_permutation, a_ids_permutation
            , a_get_all_image, a_get_inactive_image, a_ids_image
            , a_get_products_quantity_stock_below_min
            , a_debug
		;
    END IF;
    
    -- Temporary tables
    DROP TEMPORARY TABLE IF EXISTS tmp_Split;
    DROP TEMPORARY TABLE IF EXISTS tmp_Image;
    DROP TEMPORARY TABLE IF EXISTS tmp_Category;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    
    CREATE TEMPORARY TABLE tmp_Category (
		id_category INT NOT NULL
        /*
        active BIT NOT NULL
        */
        , display_order INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Product (
		id_category INT NOT NULL
		, id_product INT NOT NULL
        , display_order INT NOT NULL
        /*
        active BIT NOT NULL,
        */
        , can_view BIT
        , can_edit BIT
        , can_admin BIT
    );
    
    CREATE TEMPORARY TABLE tmp_Permutation (
		id_permutation INT NULL
        -- id_category INT NOT NULL,
		, id_product INT NOT NULL
        -- , active BIT NOT NULL
        -- , display_order INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Image (
		id_image INT NOT NULL
		-- id_product INT NOT NULL,
		, id_permutation INT NULL
        /*
        active BIT NOT NULL
        display_order INT NOT NULL
        -- rank_in_product_permutation INT NOT NULL
        */
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
    -- CALL p_validate_guid ( v_guid );
    -- SET v_has_filter_product_category = CASE WHEN a_ids_product_category = '' THEN 0 ELSE 1 END;
    -- SET v_has_filter_product = CASE WHEN a_ids_product = '' THEN 0 ELSE 1 END;
    -- SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_image = CASE WHEN a_ids_image = '' THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
    CALL partsltd_prod.p_shop_calc_product_permutation (
		a_id_user
		, a_get_all_product_category
		, a_get_inactive_product_category
		, a_ids_product_category
		, a_get_all_product
		, a_get_inactive_product
		, a_ids_product
		, a_get_all_product_permutation
		, a_get_inactive_permutation
		, a_ids_permutation
		, a_get_products_quantity_stock_below_min 
		, v_guid -- a_guid
		, 0 -- a_debug 
    );
    
	INSERT INTO tmp_Category (
		id_category
        /*
        active,
        */
        , display_order
	)
    SELECT 
		PC.id_category
        /*
        PC.active,
		*/
        , PC.display_order
	FROM (SELECT * FROM partsltd_prod.Shop_Product_Category_Temp WHERE GUID = v_guid) PC_T 
    INNER JOIN partsltd_prod.Shop_Product_Category PC ON PC_T.id_category = PC.id_category
    ;
    
	INSERT INTO tmp_Product (
		id_product
		, id_category
        /*
        active
        */
        , display_order
	)
    SELECT 
		P.id_product
		, P.id_category
        -- P.active,
        , P.display_order
	FROM (SELECT * FROM partsltd_prod.Shop_Product_Temp WHERE GUID = v_guid) P_T 
    INNER JOIN partsltd_prod.Shop_Product P ON P.id_product = P_T.id_product
    ;
    
	INSERT INTO tmp_Permutation (
		id_permutation
		-- id_category,
		, id_product
        -- , active
        -- , display_order
	)
    SELECT 
		PP.id_permutation
		-- P.id_category,
		, PP.id_product
        -- , PP.active
        -- , RANK() OVER (ORDER BY VT.display_order, V.display_order)
	FROM (SELECT * FROM partsltd_prod.Shop_Product_Permutation_Temp WHERE GUID = v_guid) PP_T
    INNER JOIN partsltd_prod.Shop_Product_Permutation PP ON PP_T.id_permutation = PP.id_permutation
    ;
    
    # Product Images
    IF (v_has_filter_image = 1 AND NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1)) THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_image, ',', a_debug);
		
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
            LEFT JOIN partsltd_prod.Shop_Product_Image I ON t_S.as_int = I.id_image
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(I.id_image)
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
				CONCAT('Invalid or inactive image IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Product_Image I ON t_S.as_int = I.id_image
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(I.id_image)
				-- OR PC.active = 0
			;
		ELSE
			INSERT INTO tmp_Image (
				id_image
                , id_permutation
			)
			SELECT 
				I.id_image
                , I.id_permutation
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_Product_Image I ON t_S.as_int = I.id_image
            INNER JOIN tmp_Permutation t_PP ON I.id_permutation = t_PP.id_permutation
			WHERE 
				(
					a_get_all_image = 1
					OR NOT ISNULL(t_S.as_int)
				)
				AND (
					a_get_inactive_image = 1
					OR I.active = 1
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    -- Outputs
    # Categories
    SELECT 
		-- DISTINCT 
        t_C.id_category
        , PC.code
        , PC.name
        , PC.description
        , PC.id_access_level_required
		, AL.name AS name_access_level_required
        , PC.display_order
        , PC.active
        , MIN(t_P.can_view) AS can_view
        , MIN(t_P.can_edit) AS can_edit
        , MIN(t_P.can_admin) AS can_admin
    FROM tmp_Category t_C
    INNER JOIN partsltd_prod.Shop_Product_Category PC ON t_C.id_category = PC.id_category
    LEFT JOIN tmp_Product t_P ON t_C.id_category = t_P.id_product
    INNER JOIN partsltd_prod.Shop_Access_Level AL ON PC.id_access_level_required = AL.id_access_level
	GROUP BY t_C.id_category -- , t_P.id_product
	ORDER BY PC.display_order
	;
    
    # Products
    SELECT 
		t_P.id_product,
        P.id_category,
        P.name,
        P.has_variations,
        P.id_access_level_required,
		AL.name AS name_access_level_required,
        P.active,
        P.display_order,
        t_P.can_view,
        t_P.can_edit,
        t_P.can_admin
    FROM tmp_Product t_P
    INNER JOIN partsltd_prod.Shop_Product P ON t_P.id_product = P.id_product
    INNER JOIN tmp_Category t_C ON t_P.id_category = t_C.id_category
    INNER JOIN partsltd_prod.Shop_Access_Level AL ON P.id_access_level_required = AL.id_access_level
    GROUP BY t_P.id_category, t_C.display_order, t_P.id_product, t_P.can_view, t_P.can_edit, t_P.can_admin
	ORDER BY t_C.display_order, P.display_order
	;
    
    # Product Permutations
    SELECT 
		t_PP.id_permutation,
		PP.id_product,
        P.id_category,
        PP.description,
        PP.cost_local_VAT_excl,
        PP.cost_local_VAT_incl,
        PP.id_currency_cost,
        C.code AS code_currency_cost,
        C.symbol AS symbol_currency_cost,
        PP.profit_local_min,
        PP.latency_manufacture,
        PP.id_unit_measurement_quantity,
        UM_Q.symbol AS symbol_unit_measurement_quantity,
        UM_Q.symbol_is_suffix_not_prefix AS symbol_is_suffix_not_prefix_unit_measurement_quantity,
        UM_Q.name_singular AS name_singular_unit_measurement_quantity,
        UM_Q.name_plural AS name_plural_unit_measurement_quantity,
        PP.count_unit_measurement_per_quantity_step,
        PP.quantity_min,
        PP.quantity_max,
        PP.quantity_stock,
        PP.is_subscription,
        PP.id_unit_measurement_interval_recurrence,
        UM_R.symbol AS symbol_unit_measurement_interval_recurrence,
        UM_R.symbol_is_suffix_not_prefix AS symbol_is_suffix_not_prefix_unit_measurement_interval_recurrence,
        UM_R.name_singular AS name_singular_unit_measurement_interval_recurrence,
        UM_R.name_plural AS name_plural_unit_measurement_interval_recurrence,
        PP.count_interval_recurrence,
        PP.id_stripe_product,
        PP.does_expire_faster_once_unsealed,
        PP.id_unit_measurement_interval_expiration_unsealed,
        UM_X.symbol AS symbol_unit_measurement_interval_expiration_unsealed,
        UM_X.symbol_is_suffix_not_prefix AS symbol_is_suffix_not_prefix_unit_measurement_interval_expiration_unsealed,
        UM_X.name_singular AS name_singular_unit_measurement_interval_expiration_unsealed,
        UM_X.name_plural AS name_plural_unit_measurement_interval_expiration_unsealed,
        PP.count_interval_expiration_unsealed,
        NOT ISNULL(PPVL.id_permutation) AS has_variations,
        PP.active,
        -- PP.display_order,
        IFNULL(t_P.can_view, 0) AS can_view,
        IFNULL(t_P.can_edit, 0) AS can_edit,
        IFNULL(t_P.can_admin, 0) AS can_admin
    FROM tmp_Permutation t_PP
    INNER JOIN partsltd_prod.Shop_Product_Permutation PP ON t_PP.id_permutation = PP.id_permutation
    INNER JOIN tmp_Product t_P ON t_PP.id_product = t_P.id_product
    INNER JOIN partsltd_prod.Shop_Product P ON t_PP.id_product = P.id_product
    INNER JOIN partsltd_prod.Shop_Product_Category PC ON P.id_category = PC.id_category
    LEFT JOIN partsltd_prod.Shop_Product_Permutation_Variation_Link PPVL ON PP.id_permutation = PPVL.id_permutation
	LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM_Q ON PP.id_unit_measurement_quantity = UM_Q.id_unit_measurement
	LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM_R ON PP.id_unit_measurement_interval_recurrence = UM_R.id_unit_measurement
	LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM_X ON PP.id_unit_measurement_interval_expiration_unsealed = UM_X.id_unit_measurement
    INNER JOIN partsltd_prod.Shop_Currency C ON PP.id_currency_cost = C.id_currency
    GROUP BY PC.id_category, P.id_product, PP.id_permutation, t_P.can_view, t_P.can_edit, t_P.can_admin
	ORDER BY PC.display_order, P.display_order -- , t_PP.display_order
	;
    
    # Variations
    SELECT 
		V.id_variation
        , V.id_type
        , V.code AS code_variation
        , V.name AS name_variation
		, V.display_order AS display_order_variation
        , V.active AS active_variation
        , VT.code AS code_variation_type
        , VT.name AS name_variation_type
        , VT.name_plural AS name_plural_variation_type
		, VT.display_order AS display_order_variation_type
        , VT.active AS active_variation_type
        , t_P.id_product
        , t_PP.id_permutation
        , t_C.id_category
    FROM partsltd_prod.Shop_Variation V
	INNER JOIN partsltd_prod.Shop_Variation_Type VT ON V.id_type = VT.id_type
    INNER JOIN partsltd_prod.Shop_Product_Permutation_Variation_Link PPVL ON V.id_variation = PPVL.id_variation
	INNER JOIN tmp_Permutation t_PP ON PPVL.id_permutation = t_PP.id_permutation
	INNER JOIN tmp_Product t_P ON t_PP.id_product = t_P.id_product
	INNER JOIN tmp_Category t_C ON t_P.id_category = t_C.id_category
	WHERE 
		V.active
		AND PPVL.active
	;
    
    # Images
    SELECT 
		t_I.id_image,
        t_PP.id_product,
		t_I.id_permutation,
        t_C.id_category,
        I.url,
        I.active,
        I.display_order
    FROM tmp_Image t_I
    INNER JOIN partsltd_prod.Shop_Product_Image I ON t_I.id_image = I.id_image
	INNER JOIN tmp_Permutation t_PP ON t_I.id_permutation = t_PP.id_permutation
    INNER JOIN tmp_Product t_P ON t_PP.id_product = t_P.id_product
    INNER JOIN tmp_Category t_C ON t_P.id_category = t_C.id_category
	ORDER BY t_C.display_order, t_P.display_order, I.display_order
	;
    
    # Errors
    SELECT *
    /*
		t_ME.display_order,
		t_ME.guid,
        t_ME.id_type,
        t_ME.msg,
        MET.code, 
        MET.name,
        MET.description
	*/
    FROM tmp_Msg_Error t_ME
    INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
    -- WHERE guid = v_guid
    ;
    
    IF a_debug = 1 THEN
		SELECT * FROM tmp_Category;
		SELECT * FROM tmp_Product;
		SELECT * FROM tmp_Permutation;
		SELECT * FROM tmp_Image;
    END IF;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Split;
    DROP TEMPORARY TABLE IF EXISTS tmp_Image;
    DROP TEMPORARY TABLE IF EXISTS tmp_Category;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    
	CALL partsltd_prod.p_shop_clear_calc_product_permutation ( v_guid );
    
    IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;;


/*

CALL partsltd_prod.p_shop_get_many_product (
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
    , 1 # a_get_all_image
    , 0 # a_get_inactive_image
	, '' # a_ids_image
    , 0 # a_get_products_quantity_stock_below_minimum
    , 0 # a_debug
);

select * FROM partsltd_prod.Shop_Calc_User_Temp;

select * FROM partsltd_prod.Shop_Product_Category;
select * FROM partsltd_prod.Shop_Product_Permutation;
select * FROM partsltd_prod.Shop_product_change_set;
insert into shop_product_change_set ( comment ) values ('set stock quantities below minimum for testing');
update shop_product_permutation
set quantity_stock = 0,
	id_change_set = (select id_change_set FROM partsltd_prod.Shop_product_change_set order by id_change_set desc limit 1)
where id_permutation < 5

DROP TABLE IF EXISTS tmp_Msg_Error;

select * FROM partsltd_prod.Shop_image;
select * FROM partsltd_prod.Shop_product;
select * from TMP_MSG_ERROR;
DROP TABLE TMP_MSG_ERROR;

insert into shop_product_change_set (comment)
    values ('set product not subscription - test bool output to python');
    update shop_product
    set is_subscription = 0,
		id_change_set = (select id_change_set FROM partsltd_prod.Shop_product_change_set order by id_change_set desc limit 1)
    where id_product = 1

select * FROM partsltd_prod.Shop_Calc_User_Temp;
select distinct guid 
-- DELETE
FROM partsltd_prod.Shop_Calc_User_Temp;
*/
