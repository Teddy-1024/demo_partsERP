

DO $$
BEGIN
	RAISE NOTICE 'TRIGGER CREATION COMPLETE';
END $$;

/*
CREATE OR REPLACE PROCEDURE p_save_product (
	IN a_guid UUID,
    
)
AS $$
BEGIN

	-- Argument default values
	IF a_ids_category IS NULL THEN
		SET a_ids_category = '';
    END IF;
	IF a_get_inactive_categories IS NULL THEN
		SET a_get_inactive_categories = FALSE;
    END IF;
    /*
	IF a_get_all_categories IS NULL THEN
		SET a_get_all_categories = FALSE;
    END IF;
    */
	IF a_ids_product IS NULL THEN
		SET a_ids_product = '';
    END IF;
	IF a_get_inactive_products IS NULL THEN
		SET a_get_inactive_products = FALSE;
    END IF;
	IF a_get_first_product_only IS NULL THEN
		SET a_get_first_product_only = TRUE;
    END IF;
	IF a_get_all_products IS NULL THEN
		SET a_get_all_products = FALSE;
    END IF;
	IF a_ids_image IS NULL THEN
		SET a_ids_image = '';
    END IF;
	IF a_get_inactive_images IS NULL THEN
		SET a_get_inactive_images = FALSE;
    END IF;
	IF a_get_first_image_only IS NULL THEN
		SET a_get_first_image_only = TRUE;
    END IF;
	IF a_get_all_images IS NULL THEN
		SET a_get_all_images = FALSE;
    END IF;
    
    
    -- Temporary tables
    CREATE TABLE tmp_Shop_Category (
		id_category INTEGER NOT NULL,
        active BOOLEAN NOT NULL,
        display_order INTEGER NOT NULL, 
        can_view BOOLEAN NOT NULL, 
        can_edit BOOLEAN NOT NULL, 
        can_admin BOOLEAN NOT NULL
    );
    
    CREATE TABLE tmp_Shop_Product (
		id_category INTEGER NOT NULL,
		id_product INTEGER NOT NULL,
        active BOOLEAN NOT NULL,
        display_order INTEGER NOT NULL, 
        can_view BOOLEAN NOT NULL, 
        can_edit BOOLEAN NOT NULL, 
        can_admin BOOLEAN NOT NULL
    );
    
    CREATE TABLE tmp_Shop_Variation (
		id_variation INTEGER NOT NULL,
		id_product INTEGER NOT NULL,
        display_order INTEGER NOT NULL
    );
    
    CREATE TABLE tmp_Shop_Image (
		id_product INTEGER NOT NULL,
		id_image INTEGER NOT NULL,
        active BOOLEAN NOT NULL,
        display_order INTEGER NOT NULL
    );
    
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
    
    
    -- Parse filters
	SET a_ids_category = REPLACE(a_ids_category, ',', '|');
	SET a_ids_product = REPLACE(a_ids_product, ',', '|');
    SET v_has_filter_category = CASE WHEN a_ids_category = '' THEN FALSE ELSE TRUE END;
    SET v_has_filter_product = CASE WHEN a_ids_product = '' THEN FALSE ELSE TRUE END;
    
    INSERT INTO tmp_Shop_Category (
		id_category, active, display_order
	)
    SELECT C.id_category, C.active, C.display_order
	FROM Shop_Category C
    WHERE (NOT v_has_filter_category OR C.id_category LIKE '%' || a_ids_category || '%')
		AND (a_get_inactive_categories OR C.active);
    
    INSERT INTO tmp_Shop_Product (
		id_category, id_product, active, display_order
	)
    SELECT P.id_category, P.id_product, P.active, P.display_order
	FROM Shop_Product P
    INNER JOIN tmp_Shop_Category tC
		ON P.id_category = tC.id_category
		WHERE (a_get_all_products OR P.id_product LIKE '%' || a_ids_product || '%')
			AND (a_get_inactive_products OR P.active);
	
    IF a_get_first_product_only THEN
		DELETE FROM tmp_Shop_Product
			WHERE display_order > (SELECT display_order FROM tmp_Shop_Product ORDER BY display_order ASC LIMIT 1);
    END IF;
	
    IF v_has_filter_product THEN
		DELETE FROM tmp_Shop_Category
			WHERE id_category NOT IN (SELECT DISTINCT id_category FROM tmp_Shop_Product);
    END IF;
    
    INSERT INTO tmp_Shop_Variation (
		id_variation, id_product -- , display_order
	)
    SELECT P.id_variation, P.id_product -- , P.display_order
	FROM Shop_Variation V
    INNER JOIN tmp_Shop_Product tP
		ON V.id_product = tP.id_product
		WHERE V.active;
    
    INSERT INTO tmp_Shop_Image (
		id_product, id_image, active, display_order
	)
    SELECT I.id_product, I.id_image, I.active, I.display_order
	FROM Shop_Image I
    INNER JOIN tmp_Shop_Product tP
		ON I.id_image = tP.id_image
		WHERE (a_get_all_images OR I.id_image LIKE '%' || a_ids_image || '%')
			AND (a_get_inactive_images OR I.active);
	
    IF a_get_first_image_only THEN
		DELETE FROM tmp_Shop_Image
			WHERE display_order > (SELECT display_order FROM tmp_Shop_Image ORDER BY display_order ASC LIMIT 1);
    END IF;
	
    IF v_has_filter_image THEN
		DELETE FROM tmp_Shop_Product
			WHERE id_product NOT IN (SELECT DISTINCT id_product FROM tmp_Shop_Image);
		DELETE FROM tmp_Shop_Category
			WHERE id_category NOT IN (SELECT DISTINCT id_category FROM tmp_Shop_Product);
    END IF;
    
    
    -- Permissions
    IF EXISTS (SELECT * FROM tmp_Shop_Category LIMIT 1) THEN
		SET v_guid_permission = gen_random_uuid();
        SET v_id_user = CURRENT_USER;
        SET v_id_permission_product = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
        SET v_ids_product_permission = (SELECT STRING_AGG(item, '|') FROM tmp_Shop_Product);
        
        CALL p_shop_user_eval(v_guid_permission, v_id_user, v_id_permission_product, v_ids_product_permission);
        
        UPDATE tmp_Shop_Product tP
        INNER JOIN Shop_User_Eval_Temp TP
			ON tP.id_product = TP.id_product
				AND TP.GUID = v_guid_permission
        SET tP.can_view = TP.can_view,
			tP.can_edit = TP.can_edit,
            tP.can_admin = TP.can_admin;
		
        CALL p_shop_user_eval_clear_temp(v_guid_permission);
    END IF;
    
    
    -- Returns
    SET v_now = CURRENT_TIMESTAMP;
    
    -- Categories
    SELECT (
		tC.id_category,
        C.name,
        C.description,
        tC.can_view,
        tC.can_edit,
        tC.can_admin
    )
    FROM tmp_Shop_Category tC
    INNER JOIN Shop_Category C
		ON tC.id_category = C.id_category
	;
    
    -- Products
    SELECT 
		tP.id_product,
        P.name,
        P.price,
        P.description,
        C.id_category,
        P.lead_time,
        P.id_stripe_product,
        P.id_stripe_price,
        P.is_subscription,
        RI.name AS name_recurrence_interval,
        RI.name_plural AS name_plural_recurrence_interval,
        P.count_recurrence_interval,
        tP.can_view,
        tP.can_edit,
        tP.can_admin
    FROM tmp_Shop_Product tP
    INNER JOIN Shop_Product P
		ON tP.id_product = P.id_product
		INNER JOIN Shop_Recurrence_Interval RI
			ON P.id_recurrence_interval = RI.id_interval
	;
    
    -- Variations
    SELECT 
		PVL.id_variation,
        tV.id_product,
        V.code,
        V.name,
        PVL.display_order
    FROM tmp_Shop_Product tV
    INNER JOIN Shop_Product_Variation_Link PVL
		ON tV.id_product = PVL.id_product
		INNER JOIN Shop_Variation V
			ON PVL.id_variation = V.id_variation
            WHERE V.active
				AND PVL.active
	;
    
    -- Images
    SELECT 
		tI.id_image,
        tI.id_product,
        I.url,
        PIL.display_order
    FROM tmp_Shop_Image tI
    INNER JOIN Shop_Product_Image_Link PIL
		ON tI.id_product = PIL.id_product
		WHERE I.active
			AND PIL.active
	;
END;
$$ LANGUAGE plpgsql;
*/
