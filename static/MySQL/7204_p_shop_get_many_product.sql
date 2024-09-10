-- USE partsltd_prod;

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
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_product_category BIT;
    DECLARE v_has_filter_product BIT;
    DECLARE v_has_filter_permutation BIT;
    DECLARE v_has_filter_image BIT;
    DECLARE v_guid BINARY(36);
    # DECLARE v_id_user VARCHAR(100);
    -- DECLARE v_ids_permutation_unavailable VARCHAR(4000);
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission VARCHAR(4000);
    -- DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    -- DECLARE v_now TIMESTAMP;
    DECLARE v_id_minimum INT;
    DECLARE v_ids_product_invalid VARCHAR(4000);
    
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');
    
    
	-- Argument validation + default values
    SET a_id_user := TRIM(IFNULL(a_id_user, ''));
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
    
    /*
    SELECT a_id_user, a_get_all_product_category, a_ids_product_category, a_get_inactive_product_category, a_get_all_product, 
    a_ids_product, a_get_inactive_product, a_get_first_product_only, a_get_all_product_permutation, a_ids_permutation, 
    a_get_inactive_permutation, a_get_all_image, a_ids_image, a_get_inactive_image, a_get_first_image_only, 
    a_get_all_delivery_region, a_ids_delivery_region, a_get_inactive_delivery_region, a_get_all_currency, a_ids_currency, 
    a_get_inactive_currency, a_get_all_discount, a_ids_discount, a_get_inactive_discount
    ;
    */
    
    -- Temporary tables
    DROP TEMPORARY TABLE IF EXISTS tmp_Category;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Image;
    DROP TEMPORARY TABLE IF EXISTS tmp_Image;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product_2;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product_Copy;
    
    
    CREATE TEMPORARY TABLE tmp_Category (
		id_category INT NOT NULL,
        active BIT NOT NULL,
        display_order INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Product (
		id_category INT NOT NULL,
		id_product INT NOT NULL,
        active BIT NOT NULL,
        display_order INT NOT NULL,
        can_view BIT, 
        can_edit BIT, 
        can_admin BIT
    );
    
    CREATE TEMPORARY TABLE tmp_Permutation (
		-- id_category INT NOT NULL,
		id_product INT NOT NULL,
		id_permutation INT NULL,
        active BIT NOT NULL,
        display_order INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Image (
		id_image INT NOT NULL,
		-- id_product INT NOT NULL,
		id_permutation INT NULL,
        active BIT NOT NULL,
        display_order INT NOT NULL
        -- rank_in_product_permutation INT NOT NULL
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Parse filters
    SET v_has_filter_product_category = CASE WHEN a_ids_product_category = '' THEN 0 ELSE 1 END;
    SET v_has_filter_product = CASE WHEN a_ids_product = '' THEN 0 ELSE 1 END;
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_image = CASE WHEN a_ids_image = '' THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
	INSERT INTO tmp_Category (
		id_category,
        active,
        display_order
	)
    SELECT 
		PC.id_category,
        PC.active,
        PC.display_order
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
		id_category,
		id_product,
        active,
        display_order
	)
    SELECT 
		P.id_category,
		P.id_product,
        P.active,
        P.display_order
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
		-- id_category,
		id_product,
		id_permutation,
        active,
        display_order
	)
    SELECT 
		-- P.id_category,
		PP.id_product,
		PP.id_permutation,
        PP.active,
        PP.display_order
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
    
    # Product Images
    -- CREATE TEMPORARY TABLE tmp_Product_Copy SELECT * FROM tmp_Product;
    
	INSERT INTO tmp_Image (
		-- id_product
        id_permutation
        , id_image
        , active
        , display_order
        -- , rank_in_product_permutation
	)
    /*
    WITH CTE_Product AS (
		SELECT 
			t_P.id_product
			, t_P.id_permutation
			, t_P.product_has_variations
			, t_P.rank_permutation
		FROM tmp_Product t_P
	)
    */
    SELECT 
		-- IPP.id_product
		I.id_permutation
		, I.id_image
		, I.active
		, I.display_order
		-- , RANK() OVER (PARTITION BY IPP.id_product, IPP.id_permutation ORDER BY IPP.display_order_product_temp, IPP.display_order_image)
	FROM Shop_Product_Image I
	INNER JOIN tmp_Permutation t_PP ON I.id_permutation = t_PP.id_permutation
	INNER JOIN Shop_Product P ON t_PP.id_product = P.id_product
    WHERE 
		P.has_variations = 0
		AND (
			a_get_all_image = 1 OR 
            FIND_IN_SET(id_image, a_ids_image) > 0
		)
		AND (
			a_get_inactive_image = 1
			OR I.active = 1
        )
	;
    
    -- Permissions
    IF EXISTS (SELECT * FROM tmp_Product LIMIT 1) THEN
        # SET v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER());
        SET v_id_permission_product := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
        SET v_ids_product_permission := (SELECT GROUP_CONCAT(id_product SEPARATOR ',') FROM tmp_Product WHERE NOT ISNULL(id_product));
        -- SET v_ids_permutation_permission := (SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') FROM tmp_Product WHERE NOT ISNULL(id_permutation));
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission;
        -- select * from Shop_User_Eval_Temp;
        
        CALL p_shop_user_eval(v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission);
        
        -- select * from Shop_User_Eval_Temp;
        
        UPDATE tmp_Product t_P
        INNER JOIN Shop_User_Eval_Temp UE_T
			ON t_P.id_product = UE_T.id_product
			AND UE_T.GUID = v_guid
        SET t_P.can_view = UE_T.can_view,
			t_P.can_edit = UE_T.can_edit,
            t_P.can_admin = UE_T.can_admin
		;
		-- select * from Shop_User_Eval_Temp;
		-- select * from tmp_Product;
        
        SET v_ids_product_invalid := (
			SELECT GROUP_CONCAT(t_P.id_product SEPARATOR ',') 
            FROM tmp_Product t_P
			WHERE ISNULL(t_P.can_view)
		);
        
        DELETE -- t_PC
        FROM tmp_Category t_PC
        WHERE t_PC.id_category IN (
			SELECT PC.id_category
            FROM Shop_Product_Category PC
            INNER JOIN Shop_Product P ON PC.id_category = P.id_category
            WHERE FIND_IN_SET(P.id_product, v_ids_product_invalid) > 0
		) -- INVALID ON t_PC.id_category = INVALID.id_category
        ;
        
        DELETE -- t_P
        FROM tmp_Product t_P
        WHERE FIND_IN_SET(t_P.id_product, v_ids_product_invalid) > 0
        ;
        
        DELETE -- t_P
        FROM tmp_Permutation t_PP
        WHERE FIND_IN_SET(t_PP.id_product, v_ids_product_invalid) > 0
        ;
        
        CALL p_clear_shop_user_eval_temp(v_guid);
        # DROP TABLE IF EXISTS Shop_User_Eval_Temp;
        /*
        DELETE FROM Shop_User_Eval_Temp UE_T
        WHERE UE_T.GUID = v_guid
        ;
        */
    END IF;
    
    -- select * from tmp_Product;
    
    -- Returns
    -- SET v_now := NOW();
    
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
    INNER JOIN Shop_Product_Category PC ON t_C.id_category = PC.id_category
    LEFT JOIN tmp_Product t_P ON t_C.id_category = t_P.id_product
    INNER JOIN Shop_Access_Level AL ON PC.id_access_level_required = AL.id_access_level
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
    INNER JOIN Shop_Product P ON t_P.id_product = P.id_product
    INNER JOIN tmp_Category t_C ON t_P.id_category = t_C.id_category
    INNER JOIN Shop_Access_Level AL ON P.id_access_level_required = AL.id_access_level
    GROUP BY t_P.id_category, t_C.display_order, t_P.id_product, t_P.can_view, t_P.can_edit, t_P.can_admin
	ORDER BY t_C.display_order, P.display_order
	;
    
    # Product Permutations
    SELECT 
		t_PP.id_permutation,
		PP.id_product,
        P.id_category,
        PP.description,
        PP.cost_local,
        PP.id_currency_cost,
        C.code AS code_currency_cost,
        C.symbol AS symbol_currency_cost,
        PP.profit_local_min,
        PP.latency_manufacture,
        PP.quantity_min,
        PP.quantity_max,
        PP.quantity_step,
        PP.quantity_stock,
        PP.id_stripe_product,
        PP.is_subscription,
        UM.name_singular AS name_recurrence_interval,
        UM.name_plural AS name_plural_recurrence_interval,
        PP.count_interval_recurrence,
        PP.active,
        PP.display_order,
        IFNULL(t_P.can_view, 0) AS can_view,
        IFNULL(t_P.can_edit, 0) AS can_edit,
        IFNULL(t_P.can_admin, 0) AS can_admin
    FROM tmp_Permutation t_PP
    INNER JOIN Shop_Product_Permutation PP ON t_PP.id_permutation = PP.id_permutation
    INNER JOIN tmp_Product t_P ON t_PP.id_product = t_P.id_product
    INNER JOIN Shop_Product P ON t_PP.id_product = P.id_product
    INNER JOIN Shop_Product_Category PC ON P.id_category = PC.id_category
	-- LEFT JOIN Shop_Recurrence_Interval RI ON t_P.id_interval_recurrence = RI.id_interval
	LEFT JOIN Shop_Unit_Measurement UM ON PP.id_interval_recurrence = UM.id_unit_measurement
    INNER JOIN Shop_Currency C ON PP.id_currency_cost = C.id_currency
    GROUP BY PC.id_category, P.id_product, PP.id_permutation, t_P.can_view, t_P.can_edit, t_P.can_admin
	ORDER BY PC.display_order, P.display_order, PP.display_order
	;
    
    # Variations
    SELECT 
		V.id_variation
        , V.code AS code_variation
        , V.name AS name_variation
        , V.active AS active_variation
		, V.display_order
        , V.id_type
        , VT.code AS code_variation_type
        , VT.name AS name_variation_type
        , VT.name_plural AS name_plural_variation_type
        , VT.active AS active_variation_type
		, VT.display_order
        , t_P.id_product
        , t_PP.id_permutation
        , t_C.id_category
    FROM Shop_Variation V
	INNER JOIN Shop_Variation_Type VT ON V.id_type = VT.id_type
    INNER JOIN Shop_Product_Permutation_Variation_Link PPVL ON V.id_variation = PPVL.id_variation
	INNER JOIN tmp_Permutation t_PP ON PPVL.id_permutation = t_PP.id_permutation
	INNER JOIN tmp_Product t_P ON t_PP.id_product = t_P.id_product
	INNER JOIN tmp_Category t_C ON t_P.id_category = t_C.id_category
	WHERE V.active
		AND PPVL.active
	;
    
    /*
    # Permutation variations output
	SELECT t_P.id_permutation, 
		t_P.id_product,
		t_P.id_category,
		id_variation
	FROM Shop_Product_Permutation_Variation_Link PPVL
	INNER JOIN tmp_Product t_P
		ON t_P.id_permutation = PPVL.id_permutation
	ORDER BY t_P.display_order
	;
    */
    -- select * from Shop_Product_Currency_Region_Link;
    -- select * from shop_currency;
    /*
    select * from tmp_Currency;
    select * from tmp_delivery_region;
    select * from tmp_product;
    */
    
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
    INNER JOIN Shop_Product_Image I ON t_I.id_image = I.id_image
	INNER JOIN tmp_Permutation t_PP ON t_I.id_permutation = t_PP.id_permutation
    INNER JOIN tmp_Product t_P ON t_PP.id_product = t_P.id_product
    INNER JOIN tmp_Category t_C ON t_P.id_category = t_C.id_category
	ORDER BY t_C.display_order, t_P.display_order, t_PP.display_order, I.display_order
	;
    
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
    WHERE guid = v_guid
    ;
    
    /*
    # Return arguments for test
    SELECT
	a_ids_product_category,
	a_get_inactive_product_category,
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
    
    # select 'other outputs';
    # select * from tmp_Product;
    
    -- Clean up
    DROP TEMPORARY TABLE IF EXISTS tmp_Image;
    DROP TEMPORARY TABLE IF EXISTS tmp_Image;
    DROP TEMPORARY TABLE IF EXISTS tmp_Category;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product_2;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product_Copy;
    
END //
DELIMITER ;;


/*

CALL partsltd_prod.p_shop_get_many_product (
	1 #'auth0|6582b95c895d09a70ba10fef', # a_id_user
    , 1 # a_get_all_product_category
	, 1 # a_get_inactive_product_category
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
    , 1 # a_get_products_quantity_stock_below_minimum
);

select * FROM Shop_User_Eval_Temp;

select * from Shop_Product_Category;
select * from Shop_Product_Permutation;
select * from shop_product_change_set;
insert into shop_product_change_set ( comment ) values ('set stock quantities below minimum for testing');
update shop_product_permutation
set quantity_stock = 0,
	id_change_set = (select id_change_set from shop_product_change_set order by id_change_set desc limit 1)
where id_permutation < 5

DROP TABLE IF EXISTS tmp_Msg_Error;

select * from shop_image;
select * from shop_product;
select * from TMP_MSG_ERROR;
DROP TABLE TMP_MSG_ERROR;

insert into shop_product_change_set (comment)
    values ('set product not subscription - test bool output to python');
    update shop_product
    set is_subscription = 0,
		id_change_set = (select id_change_set from shop_product_change_set order by id_change_set desc limit 1)
    where id_product = 1

select * FROM Shop_User_Eval_Temp;
select distinct guid 
-- DELETE
FROM Shop_User_Eval_Temp;
*/
