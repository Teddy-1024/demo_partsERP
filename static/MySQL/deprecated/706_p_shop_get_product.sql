
USE PARTSLTD_PROD;

/*

CALL p_shop_get_product (
	'', # a_id_user
    1, # a_id_product
	'', # a_ids_image
    0, # a_get_first_image_only
    1 # a_get_all_images
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_product;


DELIMITER //
CREATE PROCEDURE p_shop_get_product (
	IN a_id_user INT,
	IN a_id_product INT,
    IN a_ids_permutation VARCHAR(4000),
	IN a_ids_image VARCHAR(500),
    IN a_get_first_image_only BIT,
    IN a_get_all_images BIT
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_product BIT;
    DECLARE v_id_product_search VARCHAR(10);
    DECLARE v_has_filter_permutation BIT;
    DECLARE v_has_product_permutations BIT;
    DECLARE v_guid BINARY(36);
    # DECLARE v_id_user VARCHAR(100);
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission VARCHAR(500);
    DECLARE v_id_access_level_view INT;
    DECLARE v_has_filter_image BIT;
    DECLARE v_now TIMESTAMP;
    DECLARE v_id_minimum INT;
    DECLARE v_code_error_data VARCHAR(50);
    
    
    SET v_guid := UUID();
    SET v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 1);
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');
    
	-- Argument validation + default values
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_ids_image IS NULL THEN
		SET a_ids_image = '';
	ELSE
		SET a_ids_image = TRIM(a_ids_image);
    END IF;
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Image;
    DROP TABLE IF EXISTS tmp_Shop_Variation;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    
    CREATE TABLE tmp_Shop_Product (
		id_product INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		id_permutation INT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
		id_category INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Category(id_category),
        display_order INT, 
        can_view BIT, 
        can_edit BIT, 
        can_admin BIT
    );
    
    /*
    CREATE TEMPORARY TABLE tmp_Shop_Variation (
		id_variation INT NOT NULL,
		id_product INT NOT NULL,
        display_order INT NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Image (
		id_product INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Image_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		id_permutation INT NULL,
        CONSTRAINT FK_tmp_Shop_Image_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
		id_image INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Image_id_image
			FOREIGN KEY (id_image)
			REFERENCES Shop_Image(id_image),
        display_order INT NOT NULL
    );
    
    CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		# code VARCHAR(50) NOT NULL,
        # CONSTRAINT chk_tmp_Msg_Error_code CHECK (code IN (SELECT code FROM Shop_Msg_Error_Type)),
		id_type INT NOT NULL,
        CONSTRAINT FK_tmp_Msg_Error_id_type
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type(id_type),
		msg VARCHAR(4000) NOT NULL
    );
    
    
    -- Parse filters
    # SET v_id_product_search = CONCAT('%', CAST(a_id_product AS CHAR), '%');
    # select v_id_product_search;
    SET v_has_filter_image = '';
    
    # Products
    INSERT INTO tmp_Shop_Product (
		id_product, id_category, display_order
	)
    SELECT P.id_product, P.id_category, P.display_order
	FROM Shop_Product P
	# WHERE P.id_product LIKE v_id_product_search
    WHERE P.id_product = a_id_product
		AND NOT P.has_variations
		AND P.active
	;
    # Product Permutations
    INSERT INTO tmp_Shop_Product (
		id_product, id_category, id_permutation, display_order
	)
    SELECT PP.id_product, P.id_category, PP.id_permutation, PP.display_order
	FROM Shop_Product_Permutation PP
    INNER JOIN Shop_Product P
		ON PP.id_product = P.id_product
			AND P.has_variations
			AND P.active
	# WHERE PP.id_product LIKE v_id_product_search
    WHERE PP.id_product = a_id_product
		AND PP.active
	;
    
    SET a_id_product := (SELECT id_product FROM tmp_Shop_Product LIMIT 1);
    -- SET v_has_filter_product = NOT ISNULL(a_id_product);
    SET v_has_product_permutations = EXISTS (SELECT id_permutation FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));

    IF ISNULL(a_id_product) THEN # NOT v_has_filter_product
		INSERT INTO tmp_Msg_Error (
			guid,
			code,
            msg
		)
        VALUES (
			v_guid,
			v_code_error_data, 
            'Valid product ID not provided.'
		)
        ;
    END IF;
    
    # Permutations
    IF v_has_filter_permutation THEN
		DELETE FROM tmp_Shop_Product
        WHERE FIND_IN_SET(id_permutation, a_ids_permutation) = 0
        ;
        
		IF NOT EXISTS (SELECT * FROM tmp_Shop_Product) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_code_error_data, 
				'Permutation IDs not associated with product ID.'
			)
			;
		END IF;
    END IF;
    
    
    /*
    # Variations
    INSERT INTO tmp_Shop_Variation (
		id_variation, id_product
	)
    SELECT P.id_variation, P.id_product
	FROM Shop_Variation V
    INNER JOIN tmp_Shop_Product t_P
		ON V.id_product = t_P.id_product
		WHERE V.active
	;
    */
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid) THEN
		# Product Images
		INSERT INTO tmp_Shop_Image (
			id_product, id_image, display_order
		)
		SELECT t_P.id_product, I.id_image, I.display_order
		FROM Shop_Image I
		INNER JOIN tmp_Shop_Product t_P
			ON I.id_product = t_P.id_product
				AND ISNULL(I.id_permutation)
		INNER JOIN Shop_Product P
			ON t_P.id_product = P.id_product
				AND NOT P.has_variations
		WHERE I.active
		;
		# Product Permutation Images
		INSERT INTO tmp_Shop_Image (
			id_product, 
			id_permutation, 
			id_image, 
			display_order
		)
		SELECT t_P.id_product,
			t_P.id_permutation,
			I.id_image, 
			ROW_NUMBER() OVER W AS display_order
		FROM Shop_Image I
		INNER JOIN Shop_Product_Permutation PP
			ON I.id_permutation = PP.id_permutation
		INNER JOIN Shop_Product P
			ON PP.id_product = P.id_product
				AND P.has_variations
		INNER JOIN tmp_Shop_Product t_P
			ON P.id_product = t_P.id_product
				AND PP.id_permutation = t_P.id_permutation
		WHERE I.active
        WINDOW W AS (ORDER BY P.display_order, PP.display_order, I.display_order)
		;
    END IF;
    

    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid) AND EXISTS (SELECT * FROM tmp_Shop_Product LIMIT 1) THEN
        # SET v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER());
        SET v_id_permission_product := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
        SET v_ids_product_permission := (SELECT GROUP_CONCAT(DISTINCT id_product SEPARATOR '|') FROM tmp_Shop_Product);
        
		SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission;
        
        CALL p_shop_user_eval(v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission);
        
        select * from shop_user_eval_temp;
        
        UPDATE tmp_Shop_Product t_P
        INNER JOIN Shop_User_Eval_Temp UE_T
			ON t_P.id_product = UE_T.id_product
				AND UE_T.GUID = v_guid
        SET t_P.can_view = UE_T.can_view,
			t_P.can_edit = UE_T.can_edit,
            t_P.can_admin = UE_T.can_admin;
		
        DELETE FROM tmp_Shop_Product
		WHERE FIND_IN_SET(id_product, (SELECT GROUP_CONCAT(id_product SEPARATOR ',') FROM Shop_User_Eval_Temp)) = 0 # id_product NOT LIKE CONCAT('%', (SELECT GROUP_CONCAT(id_product SEPARATOR '|') FROM Shop_User_Eval_Temp), '%');
        ;
        
        # CALL p_shop_user_eval_clear_temp(v_guid);
        # DROP TABLE IF EXISTS Shop_User_Eval_Temp;
        DELETE FROM Shop_User_Eval_Temp
        WHERE GUID = v_guid;
    END IF;
    
    
    -- Returns
    SET v_now := NOW();
    
    # Category
    SELECT DISTINCT t_P.id_category,
        C.name,
        C.description,
        C.display_order
    FROM tmp_Shop_Product t_P
    INNER JOIN Shop_Category C
		ON t_P.id_category = C.id_category
	ORDER BY C.display_order
	;
    
    IF NOT v_has_product_permutations THEN
		# Products
		SELECT t_P.id_product,
			NULL AS id_permutation,
			P.name,
			P.description,
			P.price_GBP_full,
			P.has_variations,
			P.id_category,
			P.latency_manuf,
			P.quantity_min,
			P.quantity_max,
			P.quantity_step,
			P.quantity_stock,
			P.id_stripe_product,
			P.is_subscription,
			RI.name AS name_recurrence_interval,
			RI.name_plural AS name_plural_recurrence_interval,
			P.count_recurrence_interval
		FROM tmp_Shop_Product t_P
		INNER JOIN Shop_Product P
			ON t_P.id_product = P.id_product
		LEFT JOIN Shop_Recurrence_Interval RI
			ON P.id_recurrence_interval = RI.id_interval
		WHERE ISNULL(t_P.id_permutation)
		ORDER BY t_P.display_order
		;
    ELSE
		# Permutations
		SELECT t_P.id_product,
			t_P.id_permutation,
			P.name,
			P.description,
			P.price_GBP_full,
			P.has_variations,
			P.id_category,
			P.latency_manuf,
			P.quantity_min,
			P.quantity_max,
			P.quantity_step,
			P.quantity_stock,
			P.id_stripe_product,
			P.is_subscription,
			RI.name AS name_recurrence_interval,
			RI.name_plural AS name_plural_recurrence_interval,
			P.count_recurrence_interval
		FROM tmp_Shop_Product t_P
		INNER JOIN Shop_Product_Permutation PP
			ON t_P.id_permutation = PP.id_permutation
				AND PP.active
		INNER JOIN Shop_Product P
			ON PP.id_product = P.id_product
		LEFT JOIN Shop_Recurrence_Interval RI
			ON P.id_recurrence_interval = RI.id_interval
		WHERE NOT ISNULL(t_P.id_permutation)
		ORDER BY t_P.display_order
		;
    END IF;
    
    # Variations
    IF v_has_product_permutations THEN
		SELECT PPVL.id_variation,
			t_P.id_product,
			t_P.id_category,
			VT.code AS code_variation_type,
			VT.name AS name_variation_type,
			V.code AS code_variation,
			V.name AS name_variation
		FROM Shop_Product_Permutation_Variation_Link PPVL
        INNER JOIN tmp_Shop_Product t_P
			ON PPVL.id_permutation = t_P.id_permutation
		INNER JOIN Shop_Variation V
			ON PPVL.id_variation = V.id_variation
		INNER JOIN Shop_Variation_Type VT
			ON V.id_type = VT.id_type
		WHERE V.active
			AND VT.active
			AND PPVL.active
		ORDER BY VT.display_order, V.display_order
		;
	ELSE
		SELECT NULL AS id_variation,
			NULL AS id_product,
			NULL AS id_category,
			NULL AS code_variation_type,
			NULL AS name_variation_type,
			NULL AS code_variation,
			NULL AS name_variation
		;
    END IF;
    
    IF v_has_product_permutations THEN
		# Permutation Variations
		SELECT t_P.id_permutation, 
			t_P.id_product,
			t_P.id_category,
			id_variation
		FROM Shop_Product_Permutation_Variation_Link PPVL
		INNER JOIN tmp_Shop_Product t_P
			ON t_P.id_permutation = PPVL.id_permutation
		;
	ELSE
		SELECT NULL AS id_permutation,
			NULL AS id_product,
            NULL AS id_category,
            NULL AS id_variation
		;
    END IF;
    
    # Images
    SELECT I.id_image,
        t_P.id_product,
        I.id_permutation,
        t_P.id_category,
        I.url
    FROM tmp_Shop_Image t_I
    INNER JOIN Shop_Image I
		ON t_I.id_image = I.id_image
	INNER JOIN tmp_Shop_Product t_P
		ON a_id_product = t_P.id_product
			AND I.id_permutation = t_P.id_permutation
    -- WHERE I.active
	ORDER BY I.display_order
	;
    
	# Delivery Regions
    IF v_has_product_permutations THEN
		SELECT DR.id_region,
			t_P.id_category,
			t_P.id_product,
			t_P.id_permutation,
			DR.code,
			DR.name
		FROM Shop_Delivery_Region DR
        INNER JOIN Shop_Product_Delivery_Region_Link PDRL
			ON DR.id_region = PDRL.id_region
				AND PDRL.active
		INNER JOIN tmp_Shop_Product t_P
			ON PDRL.id_permutation = t_P.id_permutation
		WHERE DR.active
        ORDER BY t_P.id_permutation, DR.display_order
		;
	ELSE
		SELECT PDRL.id_region,
			t_P.id_category,
			t_P.id_product,
			t_P.id_permutation,
			DR.code,
			DR.name
		FROM Shop_Delivery_Region DR
        INNER JOIN Shop_Product_Delivery_Region_Link PDRL
			ON DR.id_region = PDRL.id_region
				AND PDRL.active
		INNER JOIN tmp_Shop_Product t_P
			ON PDRL.id_product = t_P.id_product
		WHERE DR.active
        ORDER BY DR.display_order
		;
    END IF;
    
	# Delivery options
    IF v_has_product_permutations THEN
		SELECT _DO.id_option,
			_DO.id_product,
            _DO.id_permutation,
			t_P.id_category,
			DOT.code,
			DOT.name,
			DOT.latency_delivery_min,
			DOT.latency_delivery_max,
			DOT.quantity_min,
			DOT.quantity_max,
			GROUP_CONCAT(DR.code SEPARATOR ',') AS codes_region,
			GROUP_CONCAT(DR.name SEPARATOR ',') AS names_region,
			_DO.price_GBP,
			DOT.display_order
		FROM Shop_Delivery_Option _DO
		INNER JOIN Shop_Delivery_Option_Type DOT
			ON _DO.id_delivery_type = DOT.id_type
				AND DOT.active
		INNER JOIN tmp_Shop_Product t_P
			ON _DO.id_permutation = t_P.id_permutation
		INNER JOIN Shop_Product_Delivery_Region_Link PDRL
			ON t_P.id_product = PDRL.id_product
				AND PDRL.active
		INNER JOIN Shop_Delivery_Region DR
			ON PDRL.id_region = DR.id_region
				AND DR.active
		WHERE _DO.active
			AND a_id_product = _DO.id_product
		GROUP BY t_P.id_product, PDRL.id_region, _DO.id_option, t_P.id_category
		ORDER BY DOT.display_order
		;
    ELSE
		SELECT _DO.id_option,
			_DO.id_product,
            _DO.id_permutation,
			t_P.id_category,
			DOT.code,
			DOT.name,
			DOT.latency_delivery_min,
			DOT.latency_delivery_max,
			DOT.quantity_min,
			DOT.quantity_max,
			GROUP_CONCAT(DR.code SEPARATOR ',') AS codes_region,
			GROUP_CONCAT(DR.name SEPARATOR ',') AS names_region,
			_DO.price_GBP,
			DOT.display_order
		FROM Shop_Delivery_Option _DO
		INNER JOIN Shop_Delivery_Option_Type DOT
			ON _DO.id_delivery_type = DOT.id_type
				AND DOT.active
		INNER JOIN tmp_Shop_Product t_P
			ON _DO.id_product = t_P.id_product
		INNER JOIN Shop_Product_Delivery_Region_Link PDRL
			ON t_P.id_product = PDRL.id_product
				AND PDRL.active
		INNER JOIN Shop_Delivery_Region DR
			ON PDRL.id_region = DR.id_region
				AND DR.active
		WHERE _DO.active
			AND a_id_product = _DO.id_product
		GROUP BY t_P.id_product, PDRL.id_region, _DO.id_option, t_P.id_category
		ORDER BY DOT.display_order
		;
	END IF;
    
    IF v_has_product_permutations THEN
		# Discounts
		SELECT D.id_discount,
			t_P.id_category,
			a_id_product,
            D.id_permutation,
			D.code,
			D.name,
			D.multiplier,
			D.quantity_min,
			D.quantity_max,
			D.date_start,
			D.date_end,
			D.display_order
		FROM Shop_Discount D
		INNER JOIN tmp_Shop_Product t_P
			ON D.id_permutation = t_P.id_permutation
		WHERE D.active
		;
    ELSE
		# Discounts
		SELECT D.id_discount,
			t_P.id_category,
			D.id_product,
            NULL AS id_permutation,
			D.code,
			D.name,
			D.multiplier,
			D.quantity_min,
			D.quantity_max,
			D.date_start,
			D.date_end,
			D.display_order
		FROM Shop_Discount D
		INNER JOIN tmp_Shop_Product t_P
			ON D.id_product = t_P.id_product
		WHERE D.active
			AND a_id_product = D.id_product
		;
    END IF;
    
	IF v_has_product_permutations THEN
		# Discount Delivery Regions
		SELECT DDRL.id_discount,
			DDRL.id_region,
			t_P.id_category,
			t_P.id_product,
			t_P.id_permutation,
			DR.code,
			DR.name,
			DR.display_order
		FROM Shop_Discount D
		INNER JOIN tmp_Shop_Product t_P
			ON D.id_permutation = t_P.id_permutation
		INNER JOIN Shop_Discount_Delivery_Region_Link DDRL
			ON D.id_discount = DDRL.id_discount
				AND DDRL.active
		INNER JOIN Shop_Delivery_Region DR
			ON DDRL.id_region = DR.id_region
				AND DR.active
		WHERE D.active
		;
    ELSE
		# Discount Delivery Regions
		SELECT DDRL.id_discount,
			DDRL.id_region,
			t_P.id_category,
			t_P.id_product,
			NULL AS id_permutation,
			DR.code,
			DR.name,
			DR.display_order
		FROM Shop_Discount D
		INNER JOIN tmp_Shop_Product t_P
			ON D.id_product = t_P.id_product
		INNER JOIN Shop_Discount_Delivery_Region_Link DDRL
			ON D.id_discount = DDRL.id_discount
				AND DDRL.active
		INNER JOIN Shop_Delivery_Region DR
			ON DDRL.id_region = DR.id_region
				AND DR.active
		WHERE D.active
			AND a_id_product = D.id_product
		;
    END IF;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
    WHERE guid = v_guid
    ;
    
    /*
    # Return arguments for test
    SELECT
	a_ids_category,
	a_get_inactive_categories,
	a_ids_product,
	a_get_inactive_products,
    a_get_first_product_only,
    a_get_all_products,
	a_ids_image,
	a_get_inactive_images,
    a_get_first_image_only,
    a_get_all_images
    ;
    */
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_Image;
    DROP TABLE IF EXISTS tmp_Shop_Variation;
    DROP TABLE IF EXISTS tmp_Shop_Product;
END //
DELIMITER ;




CALL p_shop_get_product (
	'', # a_id_user
	1 # a_id_product
);

/*
drop table tmp_msg_error;
select * from shop_image;
select * from shop_discount;

insert into shop_product_change_set (comment)
    values ('set product not subscription - test bool output to python');
    update shop_product
    set is_subscription = 0,
		id_change_set = (select id_change_set from shop_product_change_set order by id_change_set desc limit 1)
    where id_product = 1
*/
