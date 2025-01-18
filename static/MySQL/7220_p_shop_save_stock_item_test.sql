

-- Clear previous proc
DROP PROCEDURE IF EXISTS partsltd_prod.p_shop_save_stock_item_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_stock_item_test ()
BEGIN
	
	DECLARE v_guid BINARY(36);
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_guid := 'nips';

	SELECT *
	FROM partsltd_prod.Shop_Stock_Item
	;
	SELECT *
	FROM partsltd_prod.Shop_Stock_Item_Temp
	;

	START TRANSACTION;
		
		INSERT INTO partsltd_prod.Shop_Stock_Item_Temp (
			id_stock
			-- id_category
			, id_product
			, id_permutation
			, id_pairs_variations
			-- , has_variations
			, date_purchased
			, date_received
			, id_location_storage
			, id_currency_cost
			, cost_local_VAT_excl
			, cost_local_VAT_incl
			, is_sealed
			, date_unsealed
			, date_expiration
			, is_consumed
			, date_consumed
			, active
			, guid
		)
		VALUES (
			-1 -- id_stock
			-- 1 -- id_category
			, 4 -- id_product
            , NULL -- id_permutation
            , NULL -- id_pairs_variations
            -- , FALSE -- 0 -- has_variations
			, '2025-09-05 00:00' -- date_purchased
			, NULL -- date_received
			, 1 -- id_location_storage
			, 1 -- id_currency_cost
			, 10 -- cost_local_VAT_excl
			, 12  -- cost_local_VAT_incl
			, 1 -- is_sealed
			, NULL -- date_unsealed
			, NULL -- date_expiration
			, FALSE -- 0 -- is_consumed
			, NULL -- date_consumed
			, 1 -- active
			, v_guid
		);
		
	COMMIT;
    
	SELECT *
	FROM partsltd_prod.Shop_Stock_Item_Temp
	WHERE GUID = v_guid
    ;
    
    CALL partsltd_prod.p_shop_save_Stock_Item ( 
		'Test save Stock_Item' -- comment
        , v_guid -- guid
        , 1 -- id_user
		, 0 -- debug
    );
    
	SELECT *
	FROM partsltd_prod.Shop_Stock_Item
	;
	SELECT *
	FROM partsltd_prod.Shop_Stock_Item_Temp
	;
    
	CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
END //
DELIMITER ;

CALL partsltd_prod.p_shop_save_stock_item_test ();

DELETE FROM partsltd_prod.Shop_Stock_Item_Temp;

/*
update shop_product p set p.has_variations = 0 where id_product = 4
DROP TABLE IF EXISTS tmp_Msg_Error;
*/