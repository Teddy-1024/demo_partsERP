

-- Clear previous proc
DROP PROCEDURE IF EXISTS partsltd_prod.p_shop_save_Manufacturing_purchase_order_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_Manufacturing_purchase_order_test ()
BEGIN
	
	DECLARE v_guid BINARY(36);
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_guid := 'nips';

	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order
	;
	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link
	;
	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp
	;
    
	START TRANSACTION;
    
		DELETE FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Temp;
		DELETE FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

		INSERT INTO partsltd_prod.Shop_Manufacturing_Purchase_Order_Temp (
			id_order
			, id_currency
            , active
            , GUID
		)
        /* Test 1 - Insert */
        VALUES (
			-1
            , 1
            , 1
            , v_guid
        )
        /* Test 2: Alter
        SELECT 
			id_order
			, id_currency
            , active
            , v_guid
		FROM partsltd_prod.Shop_Manufacturing_Purchase_Order
        WHERE id_order = 6
        */
		;-- SELECT * FROM partsltd_prod.Shop_Unit_Measurement;
        
		INSERT INTO partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp (
			id_link
			, id_order
			, id_permutation
			, id_unit_quantity
			, quantity_used
			, quantity_produced
			, id_unit_latency_manufacture
            , latency_manufacture
			, display_order
			, active
            , GUID
		)
        /* Test 1 - Insert */
        VALUES (
			-1 -- id_link
            , -1 -- id_order
            , 3 -- id_permutation
            , 3 -- id_unit_quantity
            , 3 -- quantity_used
            , 0 -- quantity_produced
            , 4 -- id_unit_latency_manufacture
            , 4 -- latency_manufacture
            , 1 -- display_order
            , 1 -- active
            , v_guid -- 
        )
        /* Test 2: Alter
        SELECT
			id_link
			, id_order
			, id_permutation
			, id_unit_quantity
			, quantity_used
			, quantity_produced
			, id_unit_latency_manufacture
			, latency_manufacture
			, display_order
			, active
            , v_guid
		FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link
        WHERE id_order = 6
        */
        ;
        
	COMMIT;
    
	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Temp
	WHERE GUID = v_guid
    ;
    
	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp
	WHERE GUID = v_guid
    ;
    
    CALL partsltd_prod.p_shop_save_Manufacturing_purchase_order ( 
		'Test save Manufacturing Purchase Order' -- comment
        , v_guid -- guid
        , 1 -- id_user
		, 1 -- debug
    );
    
	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order
	;
	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link
	;
    
	CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
END //
DELIMITER ;;

/*
CALL partsltd_prod.p_shop_save_Manufacturing_purchase_order_test ();

DELETE FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Temp;
DELETE FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

DROP TABLE IF EXISTS tmp_Msg_Error;

select * from partsltd_prod.Shop_User;
Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'partsltd_prod.t_MPOPL.name_error' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
*/