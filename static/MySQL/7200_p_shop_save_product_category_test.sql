
-- Clear previous proc
DROP PROCEDURE IF EXISTS partsltd_prod.p_shop_save_product_category_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_product_category_test ()
BEGIN
	
	DECLARE v_guid BINARY(36);
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_guid := 'nips';

	SELECT *
	FROM partsltd_prod.Shop_Product_Category
	;
	SELECT *
	FROM partsltd_prod.Shop_Product_Category_Temp
	;

	START TRANSACTION;
		
		INSERT INTO partsltd_prod.Shop_Product_Category_Temp (
			id_category
            , name
            , code
            , description
            , id_access_level_required
            , display_order
            , guid
		)
		VALUES (
			-5 -- id_category
			, 'Nips' -- name
			, 'Lips' -- code
			, 'Chips' -- description
			, 2 -- id_access_level_required
			, 25 -- display_order
			, v_guid
		);
		
	COMMIT;
    
	SELECT *
	FROM partsltd_prod.Shop_Product_Category_Temp
	WHERE GUID = v_guid
    ;
    
    CALL partsltd_prod.p_shop_save_product_category ( 
		'Test save product category' -- comment
        , v_guid -- guid
        , 1 -- id_user
		, 1 -- debug
    );
    
	SELECT *
	FROM partsltd_prod.Shop_Product_Category
	;
	SELECT *
	FROM partsltd_prod.Shop_Product_Category_Temp
	;
    
	CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
END //
DELIMITER ;;

/*
CALL partsltd_prod.p_shop_save_product_category_test ();

DELETE FROM partsltd_prod.Shop_Product_Category_Temp;

DROP TABLE IF EXISTS tmp_Msg_Error;
*/
