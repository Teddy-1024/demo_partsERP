

-- Clear previous proc
DROP PROCEDURE IF EXISTS partsltd_prod.p_shop_save_supplier_purchase_order_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_supplier_purchase_order_test ()
BEGIN
	
	DECLARE v_guid BINARY(36);
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_guid := 'nips';

	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link_Temp
	;
    
	START TRANSACTION;
    
		DELETE FROM partsltd_prod.Shop_Supplier_Purchase_Order_Temp;
		DELETE FROM partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link_Temp;

		INSERT INTO partsltd_prod.Shop_Supplier_Purchase_Order_Temp (
			id_order
			, id_supplier_ordered
			, id_currency_cost
            , active
            , GUID
		)
        /* Test 1 - Insert */
        VALUES (
			-1
            , 1
            , 1
            , 1
            , v_guid
        )
        /* Test 2 - Update
        SELECT 
			id_order
			, id_supplier_ordered
			, id_currency_cost
            , active
            , v_guid
		FROM partsltd_prod.Shop_Supplier_Purchase_Order
        WHERE id_order = 6
        */
		;
        
		INSERT INTO partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link_Temp (
			id_link
			, id_order
			, id_permutation
			, id_unit_quantity
			, quantity_ordered
			, quantity_received
			, latency_delivery_days
			, display_order
			, active
			, cost_total_local_VAT_excl
			, cost_total_local_VAT_incl
            , GUID
		)
        /* Test 1 - Insert */
        VALUES (
			-1
            , -1
            , 3
            , 3
            , 3
            , 1
            , 7
            , 1
            , 1
            , 5
            , 6
            , v_guid
        )
        /* Test 2 - Update
        SELECT
			id_link
			, id_order
			, id_permutation
			, id_unit_quantity
			, 5 AS quantity_ordered
			, quantity_received
			, latency_delivery_days
			, display_order
			, active
			, cost_total_local_VAT_excl
			, cost_total_local_VAT_incl
            , v_guid
		FROM partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link
        WHERE id_order = 6
        */
        ;
        
	COMMIT;
    
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Temp
	WHERE GUID = v_guid
    ;
    
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link_Temp
	WHERE GUID = v_guid
    ;
    
    CALL partsltd_prod.p_shop_save_supplier_purchase_order ( 
		'Test save Supplier Purchase Order' -- comment
        , v_guid -- guid
        , 1 -- id_user
		, 1 -- debug
    );
    
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link
	;
    
	CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
END //
DELIMITER ;;

/*
CALL partsltd_prod.p_shop_save_supplier_purchase_order_test ();

DELETE FROM partsltd_prod.Shop_Supplier_Purchase_Order_Temp;
DELETE FROM partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link_Temp;

DROP TABLE IF EXISTS tmp_Msg_Error;

/*
Cannot add or update a child row: a foreign key constraint fails (`partsltd_prod`.`shop_supplier_address`, CONSTRAINT `FK_Shop_Supplier_Address_id_supplier` FOREIGN KEY (`id_supplier`) REFERENCES `shop_supplier` (`id_supplier`) ON UPDATE RESTRICT)

*/