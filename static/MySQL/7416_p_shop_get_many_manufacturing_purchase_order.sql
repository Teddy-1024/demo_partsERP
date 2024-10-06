



-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_manufacturing_purchase_order;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_manufacturing_purchase_order (
	IN a_id_user INT,
    IN a_get_all_order BIT,
	-- IN a_get_inactive_order BIT,
	IN a_get_first_order_only BIT,
	IN a_ids_order VARCHAR(4000),
	IN a_get_inactive_category BIT,
	IN a_ids_category VARCHAR(4000),
	IN a_get_inactive_product BIT,
	IN a_ids_product VARCHAR(4000),
	IN a_get_inactive_permutation BIT,
	IN a_ids_permutation VARCHAR(4000),
    IN a_date_from TIMESTAMP,
    IN a_date_to TIMESTAMP
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_order BIT;
    DECLARE v_has_filter_category BIT;
    DECLARE v_has_filter_product BIT;
    DECLARE v_has_filter_permutation BIT;
    DECLARE v_has_filter_date_from BIT;
    DECLARE v_has_filter_date_to BIT;
    DECLARE v_guid BINARY(36);
    # DECLARE v_id_user VARCHAR(100);
    # DECLARE v_ids_permutation_unavailable VARCHAR(4000);
    DECLARE v_ids_permission_manufacturing_purchase_order VARCHAR(4000);
    DECLARE v_ids_product_permission VARCHAR(4000);
    # DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    -- DECLARE v_now TIMESTAMP;
    -- DECLARE v_id_minimum INT;
    DECLARE v_code_error_data VARCHAR(50);
    DECLARE v_id_type_error_data INT;
    
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    -- SET v_ids_permission_manufacturing_purchase_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'SHOP_manufacturing_PURCHASE_ORDER' LIMIT 1);
    SET v_code_error_data = 'BAD_DATA';
    SET v_id_type_error_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data);
    
	-- Argument validation + default values
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_get_all_order IS NULL THEN
		SET a_get_all_order = 1;
    END IF;
    /*
	IF a_get_inactive_order IS NULL THEN
		SET a_get_inactive_order = 0;
    END IF;
	*/
    IF a_get_first_order_only IS NULL THEN
		SET a_get_first_order_only = 0;
    END IF;
	IF a_ids_order IS NULL THEN
		SET a_ids_order = '';
	ELSE
		SET a_ids_order = TRIM(REPLACE(a_ids_order, '|', ','));
    END IF;
	IF a_get_inactive_category IS NULL THEN
		SET a_get_inactive_category = 0;
    END IF;
	IF a_ids_category IS NULL THEN
		SET a_ids_category = '';
	ELSE
		SET a_ids_category = TRIM(REPLACE(a_ids_category, '|', ','));
    END IF;
	IF a_get_inactive_product IS NULL THEN
		SET a_get_inactive_product = 0;
    END IF;
	IF a_ids_product IS NULL THEN
		SET a_ids_product = '';
	ELSE
		SET a_ids_product = TRIM(REPLACE(a_ids_product, '|', ','));
    END IF;
	IF a_get_inactive_permutation IS NULL THEN
		SET a_get_inactive_permutation = 0;
    END IF;
	IF a_ids_permutation IS NULL THEN
		SET a_ids_permutation = '';
	ELSE
		SET a_ids_permutation = TRIM(REPLACE(a_ids_permutation, '|', ','));
    END IF;
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order_Product_Link;
    DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    
    CREATE TABLE tmp_Shop_Manufacturing_Purchase_Order (
		id_order INT NOT NULL PRIMARY KEY,
		/*
        id_supplier_ordered INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Manufacturing_Purchase_Order_id_supplier_ordered
			FOREIGN KEY (id_supplier_ordered) 
			REFERENCES Shop_Supplier(id_supplier),
		*/
		cost_total_local FLOAT NOT NULL,
		id_currency_cost INT NOT NULL,
        value_produced_total_local FLOAT NOT NULL,
        active BIT NOT NULL,
        rank_order INT NOT NULL
    );
    
    /*
    CREATE TABLE tmp_Shop_Manufacturing_Purchase_Order_Product_Link (
		id_link INT NOT NULL PRIMARY KEY,
		id_order INT NOT NULL,
		CONSTRAINT FK_tmp_manufacturing_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_manufacturing_Purchase_Order(id_order),
		id_permutation INT NOT NULL,
		CONSTRAINT FK_tmp_manufacturing_Purchase_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		cost_total_local FLOAT NOT NULL,
		id_currency_cost INT NOT NULL,
		quantity_used FLOAT NOT NULL,
		id_unit_quantity INT NOT NULL,
		CONSTRAINT FK_tmp_manufacturing_Purchase_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_produced FLOAT NULL,
		latency_delivery_days INT NOT NULL,
		display_order INT NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Product (
		id_category INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Product_Category(id_category),
		id_product INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		-- product_has_variations BIT NOT NULL,
		id_permutation INT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
        active_category BIT NOT NULL,
        active_product BIT NOT NULL,
        active_permutation BIT NULL,
        display_order_category INT NOT NULL, 
        display_order_product INT NOT NULL, 
        display_order_permutation INT NULL, 
        rank_permutation INT NOT NULL, # _in_category
        # name VARCHAR(255) NOT NULL,
        # description VARCHAR(4000) NOT NULL,
		/*
        price_GBP_full FLOAT NOT NULL,
		price_GBP_min FLOAT NOT NULL,
		*/
        /*
        latency_manufacture_days INT NOT NULL,
		quantity_min FLOAT NOT NULL,
		quantity_max FLOAT NOT NULL,
		quantity_step FLOAT NOT NULL,
		quantity_stock FLOAT NOT NULL,
		is_subscription BIT NOT NULL,
		id_unit_measurement_interval_recurrence INT,
		CONSTRAINT FK_tmp_Shop_Product_id_unit_measurement_interval_recurrence
			FOREIGN KEY (id_unit_measurement_interval_recurrence)
			REFERENCES Shop_Interval_Recurrence(id_interval),
		count_interval_recurrence INT,
        id_stripe_product VARCHAR(100),
        product_has_variations INT NOT NULL,
        */
        can_view BIT, 
        can_edit BIT, 
        can_admin BIT
    );
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Parse filters
    SET v_has_filter_order = CASE WHEN a_ids_order = '' THEN 0 ELSE 1 END;
    SET v_has_filter_category = CASE WHEN a_ids_category = '' THEN 0 ELSE 1 END;
    SET v_has_filter_product = CASE WHEN a_ids_product = '' THEN 0 ELSE 1 END;
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_date_from = CASE WHEN ISNULL(a_date_from) THEN 0 ELSE 1 END;
    SET v_has_filter_date_to = CASE WHEN ISNULL(a_date_to) THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
    IF v_has_filter_category = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
			CALL p_split(a_guid, a_ids_category, ',');
			
			IF EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Product_Category C ON TS.substring = C.id_category WHERE ISNULL(C.id_category)) THEN 
				INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					v_guid,
					v_id_type_error_data,
					v_code_error_data, 
					CONCAT('Invalid category IDs: ', IFNULL(GROUP_CONCAT(TS.substring SEPARATOR ', ') ,'NULL')) 
				FROM Split_Temp TS 
				LEFT JOIN Shop_Product_Category C ON TS.substring = C.id_category 
				WHERE ISNULL(C.id_category)
				;
			END IF;
			
			DROP TABLE Temp_Split;
		END IF;
	END IF;
    
    IF v_has_filter_product = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
			CALL p_split(a_guid, a_ids_product, ',');
			
			IF EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Product ON TS.substring = P.id_product WHERE ISNULL(P.id_product)) THEN 
				INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					v_guid,
					v_id_type_error_data,
					v_code_error_data, 
					CONCAT('Invalid product IDs: ', IFNULL(GROUP_CONCAT(TS.substring SEPARATOR ', ') ,'NULL'))
				FROM Split_Temp TS
                LEFT JOIN Shop_Product ON TS.substring = P.id_product 
                WHERE ISNULL(P.id_product)
				;
			END IF;
			
			DROP TABLE Temp_Split;
		END IF;
	END IF;
    
    IF v_has_filter_permutation = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
			CALL p_split(a_guid, a_ids_permutation, ',');
			
			IF EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Product_Permutation PP ON TS.substring = PP.id_permutation WHERE ISNULL(PP.id_permutation)) THEN 
				INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					v_guid,
					v_id_type_error_data,
					v_code_error_data, 
					CONCAT('Invalid permutation IDs: ', IFNULL(GROUP_CONCAT(TS.substring SEPARATOR ', ') ,'NULL')) 
				FROM Split_Temp TS 
                LEFT JOIN Shop_Product_Permutation PP ON TS.substring = PP.id_permutation 
                WHERE ISNULL(PP.id_permutation)
				;
			END IF;
			
			DROP TABLE Temp_Split;
		END IF;
	END IF;
    
    IF v_has_filter_category = 1 OR v_has_filter_product = 1 OR v_has_filter_permutation = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
			INSERT INTO tmp_Shop_Product (
				id_category,
				id_product,
				id_permutation,
				active_category,
				active_product,
				active_permutation,
				display_order_category,
				display_order_product,
				display_order_permutation
				-- rank_permutation,
				/*
				name,
				description,
				/*
				price_GBP_VAT_incl,
				price_GBP_VAT_excl,
				price_GBP_min,
				*
				latency_manufacture_days,
				quantity_min,
				quantity_max,
				quantity_step,
				quantity_stock,
				is_subscription,
				id_unit_measurement_interval_recurrence,
				count_interval_recurrence,
				id_stripe_product,
				product_has_variations
				*/
			)
			SELECT 
				P.id_category,
				P.id_product,
				-- P.has_variations AS product_has_variations,
				PP.id_permutation,
				C.active AS active_category,
				P.active AS active_product,
				PP.active AS active_permutation,
				C.display_order AS display_order_category,
				P.display_order AS display_order_product,
				PP.display_order AS display_order_permutation
				-- RANK() OVER (ORDER BY C.display_order, P.display_order, PP.display_order) AS rank_permutation, #PARTITION BY P.id_category # _in_category
				/*
				P.name,
				PP.description,
				/*
				PP.price_GBP_VAT_incl,
				PP.price_GBP_VAT_excl,
				PP.price_GBP_min,
				*
				PP.latency_manufacture_days,
				PP.quantity_min,
				PP.quantity_max,
				PP.quantity_step,
				PP.quantity_stock,
				PP.is_subscription,
				PP.id_unit_measurement_interval_recurrence,
				PP.count_interval_recurrence,
				PP.id_stripe_product,
				P.has_variations
				*/
			FROM Shop_Product P
			INNER JOIN Shop_Product_Permutation PP
				ON P.id_product = PP.id_product
			INNER JOIN Shop_Product_Category C
				ON P.id_category = C.id_category
			WHERE
				# permutations
				(
					(
						NOT v_has_filter_permutation 
						OR FIND_IN_SET(PP.id_permutation, a_ids_permutation) > 0
					)
					AND (
						a_get_inactive_permutation 
						OR PP.active = 1
					)
				)
				# categories
				AND (
					(
						NOT v_has_filter_category 
						OR FIND_IN_SET(P.id_category, a_ids_category) > 0
					)
					AND (
						a_get_inactive_category 
						OR C.active = 1
					)
				) 
				# products
				AND (
					(
						NOT v_has_filter_product 
						OR FIND_IN_SET(P.id_product, a_ids_product) > 0
					)
                    AND (
						a_get_inactive_product 
						OR P.active = 1
					)
				)
			;
        END IF;
    END IF;
    
    -- Get orders
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		CALL p_split(a_guid, a_ids_order, ',');
        
		IF v_has_filter_order AND EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Manufacturing_Purchase_Order MPO ON TS.substring = MPO.id_order WHERE ISNULL(MPO.id_order)) THEN 
			INSERT INTO tmp_Msg_Error (
				guid,
                id_type,
				code,
				msg
			)
			SELECT
				v_guid,
                v_id_type_error_data,
				v_code_error_data, 
				CONCAT('Invalid order IDs: ', IFNULL(GROUP_CONCAT(TS.substring SEPARATOR ', '), 'NULL'))
			FROM Split_Temp TS 
            LEFT JOIN Shop_Manufacturing_Purchase_Order MPO ON TS.substring = MPO.id_order 
            WHERE ISNULL(MPO.id_order)
			;
		END IF;
		
        IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
			INSERT INTO tmp_Shop_Manufacturing_Purchase_Order ( -- _Product_Link
				id_order,
				-- active,
				rank_order
			)
			SELECT 
				MPO.id_order,
				-- MPO.active,
				RANK() OVER (ORDER BY MPO.id_order ASC) AS rank_order
			FROM Shop_Manufacturing_Purchase_Order MPO
			INNER JOIN Split_Temp TS ON MPO.id_order = TS.substring
            INNER JOIN Shop_manufacturing_Purchase_Order_Product_Link MPOPL ON MPO.id_order = MPOPL.id_order
            INNER JOIN Shop_Product_Permutation PP ON MPOPL.id_permutation = PP.id_permutation
            INNER JOIN Shop_Product P ON PP.id_product = P.id_product
            INNER JOIN Shop_Product_Category C ON P.id_category = C.id_category
            LEFT JOIN tmp_Shop_Product t_P ON MPOPL.id_permutation = t_P.id_permutation
			WHERE
				# order
				(
					(
						v_has_filter_order = 0
						OR (
							# ID
							FIND_IN_SET(MPO.id_order, a_ids_order) > 0
                            # date
                            AND (
								(
									v_has_filter_date_from = 0
									OR MPO.created_on > a_date_from
								)
								AND (
									v_has_filter_date_to = 0
									OR MPO.created_on < a_date_to
								)
							)
						)
					)
                    # active
                    /*
					AND (
						a_get_inactive_order
						OR MPO.active = 1
					)
                    */
				)
				# permutations
				AND (
					(
						v_has_filter_category = 0 
                        AND v_has_filter_product = 0 
                        AND v_has_filter_permutation = 0
					)
					OR NOT ISNULL(t_P.id_permutation) -- MPO.id_permutation IN (SELECT DISTINCT id_permutation FROM tmp_Shop_Product)
				)
			;
		END IF;
        
        DROP TABLE Split_Temp;
		
		IF a_get_first_order_only THEN
			DELETE t_MPO
            FROM tmp_Shop_Manufacturing_Purchase_Order t_MPO
			WHERE t_MPO.rank_order > (
				SELECT MIN(t_MPO.rank_order)
				FROM tmp_Shop_Manufacturing_Purchase_Order t_MPO
			)
			;
		END IF;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
        # SET v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER());
        SET v_ids_permission_manufacturing_purchase_order := (SELECT GROUP_CONCAT(id_permission SEPARATOR ',') FROM Shop_Permission WHERE code IN ('STORE_manufacturing', 'STORE_manufacturing_PURCHASE_ORDER'));
        -- SET v_ids_permutation_permission := (SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
        SET v_ids_product_permission := (SELECT GROUP_CONCAT(P.id_product SEPARATOR ',') FROM (SELECT DISTINCT id_product FROM tmp_Shop_Product WHERE NOT ISNULL(id_product)) P);
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
        -- select * from Shop_Calc_User_Temp;
        
        CALL p_shop_calc_user(v_guid, a_id_user, FALSE, v_ids_permission_manufacturing_purchase_order, v_id_access_level_view, v_ids_product_permission);
        
        -- select * from Shop_Calc_User_Temp;
        
        IF NOT EXISTS (SELECT can_view FROM Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
                id_type,
				code,
				msg
			)
			SELECT
				v_guid,
                v_id_type_error_data,
				v_code_error_data, 
				CONCAT('You do not have view permissions for ', GROUP_CONCAT(name SEPARATOR ', ')) 
			FROM Shop_Permission 
            WHERE id_permission = v_ids_permission_manufacturing_purchase_order
			;
        END IF;
        
        
        UPDATE tmp_Shop_Product t_P
        INNER JOIN Shop_Calc_User_Temp UE_T
			ON t_P.id_product = UE_T.id_product -- t_P.id_permutation = UE_T.id_permutation
			AND UE_T.GUID = v_guid
        SET t_P.can_view = UE_T.can_view,
			t_P.can_edit = UE_T.can_edit,
            t_P.can_admin = UE_T.can_admin
		;
        
        # CALL p_shop_clear_calc_user(v_guid);
        # DROP TABLE IF EXISTS Shop_Calc_User_Temp;
        DELETE FROM Shop_Calc_User_Temp
        WHERE GUID = v_guid
        ;
	END IF;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns
    -- SET v_now := NOW();
    
    # manufacturing Purchase Order
    SELECT # *
		t_MPO.id_order,
		MPO.cost_total_local,
		MPO.id_currency_cost,
        MPO.value_produced_total_local,
        t_MPO.active
    FROM Shop_Manufacturing_Purchase_Order MPO
    INNER JOIN tmp_Shop_Manufacturing_Purchase_Order t_MPO ON MPO.id_order = t_MPO.id_order
    ;
    
    # manufacturing Purchase Order Product Link
    SELECT
		MPOPL.id_link,
		MPOPL.id_order,
		MPOPL.id_permutation,
        P.name as name_product,
		MPOPL.cost_total_local,
		MPOPL.id_currency_cost,
        MPOPL.value_produced_total_local,
		MPOPL.quantity_used,
		MPOPL.id_unit_quantity,
		MPOPL.quantity_produced,
		MPOPL.latency_manufacture_days,
		MPOPL.display_order
    FROM Shop_manufacturing_Purchase_Order_Product_Link MPOPL
    -- INNER JOIN tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL ON MPOPL.id_link = t_MPOPL.id_link
    INNER JOIN tmp_Shop_Manufacturing_Purchase_Order t_MPO ON MPOPL.id_order = t_MPO.id_order
    INNER JOIN Shop_Product_Permutation PP ON MPOPL.id_permutation = PP.id_permutation
    INNER JOIN Shop_Product P ON PP.id_product = P.id_product
    INNER JOIN Shop_Product_Category C ON P.id_category = C.id_category
    ORDER BY MPOPL.id_order, C.display_order, P.display_order, PP.display_order
    ;
    
    # Errors
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
    
    # select 'other outputs';
    # select * from tmp_Shop_Product;
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order_Product_Link;
    DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order;
    DROP TABLE IF EXISTS tmp_Shop_Product;
        
	DELETE FROM Shop_Calc_User_Temp
	WHERE GUID = v_guid
	;
END //
DELIMITER ;;


/*

CALL p_shop_get_many_manufacturing_purchase_order (
	'', # a_id_user
	1, # a_get_all_order
	-- 0, # a_get_inactive_order
    0, # a_get_first_order_only
    '', # a_ids_order
	0, # a_get_inactive_category
	'', # a_ids_category
    0, # a_get_inactive_product
	'', # a_ids_product
    0, # a_get_inactive_permutation
    '', # a_ids_permutation
    NULL, # a_date_from
	NULL # a_date_to
);

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


*/
