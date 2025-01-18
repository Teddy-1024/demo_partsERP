

-- Clear previous proc
DROP PROCEDURE IF EXISTS partsltd_prod.p_shop_save_product_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_product_test ()
BEGIN
	
	DECLARE v_guid BINARY(36);
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_guid := 'nips';

	SELECT *
	FROM partsltd_prod.Shop_Product
	;
	SELECT *
	FROM partsltd_prod.Shop_Product_Temp
	;

	START TRANSACTION;
		
		INSERT INTO partsltd_prod.Shop_Product_Temp (
			id_product
			, id_category
			, name
			, has_variations
			, id_access_level_required
			, display_order
			, active
			, guid
		)
		VALUES 
        /* Test 1 - Update
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
        /* Test 2 - Insert */
        (
			-14 -- id_product
			, 5 -- id_category
			, 'Clip' -- name
			, 0 -- has_variations
			, 1 -- id_access_level_required
			, 1 -- display_order
			, 1 -- active
			, v_guid
		)
        ;
		
	COMMIT;
    
	SELECT *
	FROM partsltd_prod.Shop_Product_Temp
	WHERE GUID = v_guid
    ;
    
    CALL partsltd_prod.p_shop_save_product ( 
		'Test save product' -- comment
        , v_guid -- guid
        , 1 -- id_user
		, 1 -- debug
    );
    
	SELECT *
	FROM partsltd_prod.Shop_Product
	;
	SELECT *
	FROM partsltd_prod.Shop_Product_Temp
	;
    
	CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
END //
DELIMITER ;

/*
CALL partsltd_prod.p_shop_save_product_test ();

DELETE FROM partsltd_prod.Shop_Product_Temp;

DROP TABLE IF EXISTS tmp_Msg_Error;
*/