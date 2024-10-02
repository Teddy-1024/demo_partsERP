

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_stock_item;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_stock_item (
	IN a_id_user INT,
    IN a_get_all_product_permutation BIT,
	IN a_guid_permutations BINARY(36),
    IN a_get_all_stock_item BIT,
	IN a_get_inactive_stock_item BIT,
	IN a_ids_stock_item LONGTEXT,
    IN a_get_all_region_storage BIT,
	IN a_get_inactive_region_storage BIT,
    IN a_ids_region_storage VARCHAR(4000),
    IN a_get_all_plant_storage BIT,
	IN a_get_inactive_plant_storage BIT,
    IN a_ids_plant_storage VARCHAR(4000),
    IN a_get_all_location_storage BIT,
	IN a_get_inactive_location_storage BIT,
    IN a_ids_location_storage TEXT,
    IN a_date_received_to TIMESTAMP,
	IN a_get_sealed_stock_item_only BIT,
	IN a_get_unsealed_stock_item_only BIT,
	IN a_get_expired_stock_item_only BIT,
	IN a_get_nonexpired_stock_item_only BIT,
	IN a_get_consumed_stock_item_only BIT,
	IN a_get_nonconsumed_stock_item_only BIT
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
    -- DECLARE v_now TIMESTAMP;
    -- DECLARE v_id_minimum INT;
	DECLARE v_now TIMESTAMP;
    
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');
    SET v_now := NOW();

    
	-- Argument validation + default values
	SET a_id_user := TRIM(IFNULL(a_id_user, ''));
	SET a_get_all_product_permutation := IFNULL(a_get_all_product_permutation, 0);
	SET a_guid_permutations := IFNULL(a_guid_permutations, '');
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
    DROP TABLE IF EXISTS tmp_Region_Storage;
    DROP TABLE IF EXISTS tmp_Plant_Storage;
    DROP TABLE IF EXISTS tmp_Location_Storage;
	DROP TABLE IF EXISTS tmp_Stock_Item;
    DROP TABLE IF EXISTS tmp_Permutation;
	DROP TABLE IF EXISTS tmp_Msg_Error;
    

	CREATE TEMPORARY TABLE tmp_Permutation (
		id_permutation INT NOT NULL,
        id_product INT NOT NULL
        /*
		CONSTRAINT FK_tmp_Permutation_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation)
		*/
        -- , rank_permutation INT NOT NULL
	);
	
	CREATE TEMPORARY TABLE tmp_Stock_Item (
		id_stock INT NOT NULL PRIMARY KEY
        , id_permutation INT NOT NULL
        , id_product INT NOT NULL
		, id_location_storage INT NOT NULL
		-- , id_currency_cost INT NOT NUL
        /*
		, date_purchased TIMESTAMP NOT NULL
		, date_received TIMESTAMP NULL
        /
		CONSTRAINT FK_tmp_Stock_Item_id_location_storage
			FOREIGN KEY (id_location_storage)
			REFERENCES Shop_Storage_Location(id_location),
		/
        /
		CONSTRAINT FK_tmp_Stock_Item_id_currency
			FOREIGN KEY (id_currency_cost)
			REFERENCES Shop_Currency(id_currency),
		/
		, cost_local_VAT_incl FLOAT NOT NULL
		, cost_local_VAT_excl FLOAT NOT NULL
		, is_sealed BIT NOT NULL DEFAULT 1
		, date_unsealed TIMESTAMP NULL
		, date_expiration TIMESTAMP NOT NULL
		, is_consumed BIT NOT NULL DEFAULT 0
		, date_consumed TIMESTAMP NULL
		, active_stock_item BIT NOT NULL DEFAULT 1
        , active_permutation BIT NOT NULL
        , active_product BIT NOT NULL
        , active_category BIT NOT NULL
        -- , rank_stock_item INT NOT NULL
        , display_order_permutation INT NOT NULL
        , display_order_product INT NOT NULL
        , display_order_category INT NOT NULL
        */
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
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
        /*
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
		*/
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Parse filters
    SET v_has_filter_permutation = CASE WHEN a_guid_permutations = '' THEN 0 ELSE 1 END;
    SET v_has_filter_stock_item = CASE WHEN a_ids_stock_item = '' THEN 0 ELSE 1 END;
    SET v_has_filter_region_storage = CASE WHEN a_ids_region_storage = '' THEN 0 ELSE 1 END;
    SET v_has_filter_plant_storage = CASE WHEN a_ids_plant_storage = '' THEN 0 ELSE 1 END;
    SET v_has_filter_location_storage = CASE WHEN a_ids_location_storage = '' THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
    INSERT INTO tmp_Permutation (
		id_permutation,
        id_product
	)
	SELECT 
		PP.id_permutation,
        PP.id_product
	FROM Shop_Product_Permutation PP
    LEFT JOIN Shop_Product_Permutation_Temp PPT ON PP.id_permutation = PPT.id_permutation
    WHERE 
		a_get_all_product_permutation = 1
		OR PPT.GUID = a_guid_permutations
	;
    
	INSERT INTO tmp_Stock_Item (
		id_stock,
		id_permutation,
        id_product,
        id_location_storage
	)
    SELECT 
		SI.id_stock,
		t_PP.id_permutation,
        t_PP.id_product,
        SI.id_location_storage
	FROM Shop_Stock_Item SI
	INNER JOIN tmp_Permutation t_PP ON SI.id_permutation = t_PP.id_permutation
	WHERE
		(
			a_get_all_stock_item = 1
			OR (
				v_has_filter_stock_item = 1
				AND FIND_IN_SET(SI.id_stock, a_ids_stock_item) > 0
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
			OR SI.date_expiration > v_now
		)
		AND (
			a_get_expired_stock_item_only = 0
			OR SI.date_expiration <= v_now
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
    
	-- Storage Regions
    INSERT INTO tmp_Region_Storage (
		id_region
    )
    WITH RECURSIVE Recursive_CTE_Region_Storage AS (
		SELECT 
			R.id_region AS id_region_parent,
            NULL AS id_region_child
		FROM tmp_Stock_Item t_SI
		-- INNER JOIN tmp_Stock_Item t_SI ON SL.id_location = t_SI.id_location_storage
		INNER JOIN Shop_Storage_Location SL ON t_SI.id_location_storage = SL.id_location
		INNER JOIN Shop_Plant P ON SL.id_plant = P.id_plant
		INNER JOIN Shop_Address A ON P.id_address = A.id_address
		INNER JOIN Shop_Region R 
			ON A.id_region = R.id_region
			AND (
				a_get_all_region_storage
				OR FIND_IN_SET(R.id_region, a_ids_region_storage) > 0
			)
			AND (
				a_get_inactive_region_storage
				OR R.active = 1
			)			
		UNION
        SELECT 
			RB.id_region_parent,
			RB.id_region_child
		FROM Shop_Region_Branch RB
        INNER JOIN Recursive_CTE_Region_Storage r_RS
			ON RB.id_region_parent = r_RS.id_region_child
            AND (
				a_get_inactive_region_storage
                OR RB.active = 1
            )
	)
    SELECT
		DISTINCT R.id_region
	FROM Shop_Region R
    INNER JOIN Recursive_CTE_Region_Storage r_RS
		ON R.id_region = r_RS.id_region_parent
		OR R.id_region = r_RS.id_region_child
    ;

	-- Plants
    INSERT INTO tmp_Plant_Storage (
		id_plant
        , id_region
	)
	SELECT 
		DISTINCT P.id_plant
        , A.id_region
	FROM tmp_Stock_Item t_SI
	INNER JOIN Shop_Storage_Location SL ON t_SI.id_location_storage = SL.id_location
	INNER JOIN Shop_Plant P ON SL.id_plant = P.id_plant
    INNER JOIN Shop_Address A ON P.id_address = A.id_address
	;
    
	-- Storage Locations
    INSERT INTO tmp_Location_Storage (
		id_location
        , id_plant
    )
    WITH RECURSIVE Recursive_CTE_Location_Storage AS (
		SELECT 
			SL.id_location AS id_location_parent,
            NULL AS id_location_child
		FROM tmp_Stock_Item t_SI
		-- INNER JOIN tmp_Stock_Item t_SI ON SL.id_location = t_SI.id_location_storage
		INNER JOIN Shop_Storage_Location SL 
			ON t_SI.id_location_storage = SL.id_location
			AND (
				a_get_all_location_storage
				OR FIND_IN_SET(SL.id_location, a_ids_location_storage) > 0
			)
			AND (
				a_get_inactive_location_storage
				OR SL.active = 1
			)			
		UNION
        SELECT 
			SLB.id_location_parent,
			SLB.id_location_child
		FROM Shop_Storage_Location_Branch SLB
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
	FROM Shop_Storage_Location SL
    INNER JOIN Recursive_CTE_Location_Storage r_LS
		ON SL.id_location = r_LS.id_location_parent
		OR SL.id_location = r_LS.id_location_child
    ;


    -- Permissions
    IF EXISTS (SELECT * FROM tmp_Stock_Item LIMIT 1) THEN
        SET v_id_permission_product := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
        SET v_ids_product_permission := (SELECT GROUP_CONCAT(id_product SEPARATOR ',') FROM tmp_Permutation WHERE NOT ISNULL(id_product));
        -- SET v_ids_permutation_permission := (SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission;
        -- select * from Shop_Calc_User_Temp;
        
        CALL p_shop_calc_user(v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission);
        
        -- select * from Shop_Calc_User_Temp;
        
        UPDATE tmp_Stock_Item t_SI
        INNER JOIN Shop_Calc_User_Temp UE_T
			ON t_SI.id_product = UE_T.id_product
			AND UE_T.GUID = v_guid
        SET t_SI.can_view = UE_T.can_view,
			t_SI.can_edit = UE_T.can_edit,
            t_SI.can_admin = UE_T.can_admin
		;
        
        DELETE t_SI
		FROM tmp_Stock_Item t_SI
        /*
		LEFT JOIN Shop_Calc_User_Temp UE_T
			ON t_SI.id_product = UE_T.id_product
			AND UE_T.GUID = v_guid
		*/
		WHERE 
			/*
			FIND_IN_SET(t_SI.id_product, (
				SELECT GROUP_CONCAT(UET.id_product SEPARATOR ',') 
				FROM Shop_Calc_User_Temp UET)
			) = 0 # id_product NOT LIKE CONCAT('%', (SELECT GROUP_CONCAT(id_product SEPARATOR '|') FROM Shop_Calc_User_Temp), '%');
			*/
            /*
			ISNULL(UE_T.id_product)
			OR IFNULL(UE_T.can_view, 0) = 0
            */
            t_SI.id_product NOT IN (
				SELECT id_product 
                FROM Shop_Calc_User_Temp UE_T
                WHERE
					GUID = v_guid
					AND IFNULL(can_view, 0) = 1
			)
        ;
        
        # CALL p_shop_calc_user_clear_temp(v_guid);
        # DROP TABLE IF EXISTS Shop_Calc_User_Temp;
        DELETE FROM Shop_Calc_User_Temp
        WHERE GUID = v_guid
        ;
    END IF;
    
    /*
    select * from shop_stock_item;
    select * from tmp_Stock_Item;
    select * from tmp_Permutation;
    select * from tmp_Location_Storage;
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
        t_RS.id_region,
		SI.id_currency_cost,
		CURRENCY.symbol AS symbol_currency_cost,
		CURRENCY.code AS code_currency_cost,
		SI.date_purchased,
		SI.date_received,
		SI.cost_local_VAT_incl,
		SI.cost_local_VAT_excl,
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
        IFNULL(t_SI.can_view, 0),
        IFNULL(t_SI.can_edit, 0),
        IFNULL(t_SI.can_admin, 0)
    FROM tmp_Stock_Item t_SI
    INNER JOIN Shop_Stock_Item SI ON t_SI.id_stock = SI.id_stock
	INNER JOIN tmp_Permutation t_PP ON t_SI.id_permutation = t_PP.id_permutation
    INNER JOIN Shop_Product P ON t_PP.id_product = P.id_product
	INNER JOIN tmp_Location_Storage t_LS ON t_SI.id_location_storage = t_LS.id_location
	INNER JOIN tmp_Plant_Storage t_PS ON t_LS.id_plant = t_PS.id_plant
    INNER JOIN Shop_Plant PLANT ON t_PS.id_plant = PLANT.id_plant
	INNER JOIN Shop_Address A ON PLANT.id_address = A.id_address
	INNER JOIN tmp_Region_Storage t_RS ON A.id_region = t_RS.id_region
	INNER JOIN Shop_Storage_Location SL ON t_LS.id_location = SL.id_location
    INNER JOIN Shop_Currency CURRENCY ON SI.id_currency_cost = CURRENCY.id_currency
	WHERE
		IFNULL(t_SI.can_view, 0) = 1
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
	DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
END //
DELIMITER ;;


CALL p_shop_get_many_stock_item (
	1, # a_id_user
    1, # a_get_all_product_permutation
	'nips', # a_guid_permutations
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
);

/*


DROP TABLE IF EXISTS tmp_Msg_Error;

select * from Shop_Storage_Location;
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
