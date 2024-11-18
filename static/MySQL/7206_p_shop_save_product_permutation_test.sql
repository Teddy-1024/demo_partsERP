

-- Clear previous proc
DROP PROCEDURE IF EXISTS partsltd_prod.p_shop_save_product_permutation_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_product_permutation_test ()
BEGIN
	
	DECLARE v_guid BINARY(36);
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_guid := 'nips';

	SELECT *
	FROM partsltd_prod.Shop_Product_Permutation
	;
	SELECT *
	FROM partsltd_prod.Shop_Product_Permutation_Variation_Link
	;
	SELECT *
	FROM partsltd_prod.Shop_Product_Permutation_Temp
	;

	START TRANSACTION;
		
		INSERT INTO partsltd_prod.Shop_Product_Permutation_Temp (
			id_permutation
			, id_product
            , csv_id_pairs_variation
            , description
			, cost_local_VAT_excl
			, cost_local_VAT_incl
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
			, guid
		)
		VALUES 
        /* Test 1 - Insert 
        (
			-1 -- id_permutation
			, 5 -- id_product
            , '' -- csv_id_pairs_variation
            , 'Hair clip' -- description
            , NULL -- cost_local_VAT_excl
            , NULL -- cost_local_VAT_incl
            , 1 -- id_currency_cost
            , NULL -- profit_local_min
            , 1 -- latency_manufacture
            , 3 -- id_unit_measurement_quantity
            , 1 -- count_unit_measurement_per_quantity_step
            , 0 -- quantity_min
            , 0 -- quantity_max
            , 2 -- quantity_stock
            , FALSE -- is_subscription
            , NULL -- id_unit_measurement_interval_recurrence
            , NULL -- count_interval_recurrence
            , NULL -- id_stripe_product
            , FALSE -- does_expire_faster_once_unsealed
            , NULL -- id_unit_measurement_interval_expiration_unsealed
            , NULL -- count_interval_expiration_unsealed
			, 1 -- active
			, v_guid
		)
        */
        /* Test 2 - Update
        (
			4 -- id_product
			, 1 -- id_category
			, 'Laptops' -- name
			, 0 -- has_variations
			, 2 -- id_access_level_required
			, 2 -- display_order
			, 1 -- active
			, v_guid
		)
        */
        /* Test 3 - Insert with Variations */
        (
			-1 -- id_permutation
			, 1 -- id_product
            , '1:3' -- csv_id_pairs_variation
            , 'Good Green' -- description
            , NULL -- cost_local_VAT_excl
            , NULL -- cost_local_VAT_incl
            , 1 -- id_currency_cost
            , NULL -- profit_local_min
            , 1 -- latency_manufacture
            , 3 -- id_unit_measurement_quantity
            , 1 -- count_unit_measurement_per_quantity_step
            , 0 -- quantity_min
            , 0 -- quantity_max
            , 2 -- quantity_stock
            , FALSE -- is_subscription
            , NULL -- id_unit_measurement_interval_recurrence
            , NULL -- count_interval_recurrence
            , NULL -- id_stripe_product
            , TRUE -- does_expire_faster_once_unsealed
            , 8 -- id_unit_measurement_interval_expiration_unsealed
            , 2 -- count_interval_expiration_unsealed
			, 1 -- active
			, v_guid
		)
        ;
		
	COMMIT;
    
	SELECT *
	FROM partsltd_prod.Shop_Product_Permutation_Temp
	WHERE GUID = v_guid
    ;
    
    CALL partsltd_prod.p_shop_save_product_permutation ( 
		'Test save product' -- comment
        , v_guid -- guid
        , 1 -- id_user
		, 1 -- debug
    );
    
	SELECT *
	FROM partsltd_prod.Shop_Product_Permutation
	;
	SELECT *
	FROM partsltd_prod.Shop_Product_Permutation_Variation_Link
	;
	SELECT *
	FROM partsltd_prod.Shop_Product_Permutation_Temp
	;
    
	CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
END //
DELIMITER ;;

CALL partsltd_prod.p_shop_save_product_permutation_test ();

DELETE FROM partsltd_prod.Shop_Product_Permutation_Temp;

DROP TABLE IF EXISTS tmp_Msg_Error;


/*
DELETE FROM partsltd_prod.Shop_Product_Permutation_Variation_Link
WHERE id_link >= 3
;
DELETE FROM partsltd_prod.Shop_Product_Permutation
WHERE id_permutation >= 7
;

	SELECT *
	FROM partsltd_prod.Shop_Product_Permutation_Variation_Link_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Variation
	;
*/