

-- Clear previous proc
DROP PROCEDURE IF EXISTS partsltd_prod.p_shop_save_supplier_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_supplier_test ()
BEGIN
	
	DECLARE v_guid BINARY(36);
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_guid := 'nips';

	SELECT *
	FROM partsltd_prod.Shop_Supplier
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Address
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Address_Temp
	;

	START TRANSACTION;
		
		INSERT INTO partsltd_prod.Shop_Supplier_Temp (
			id_supplier
			, id_currency
			, name_company
			, name_contact
			, department_contact
			, phone_number
			, fax
			, email
			, website
			, active
			, guid
		)
		VALUES (
			-3
            , 1
            , 'Asda'
            , ''
            , NULL
            , ''
            , '123'
            , 'test mail'
            , 'test url'
			, 1 -- active
			, v_guid
		);
		
		INSERT INTO partsltd_prod.Shop_Supplier_Address_Temp (
			id_address
            , id_supplier
			, id_region
			, postcode
			, address_line_1
			, address_line_2
			, city
			, county
            , active
            , GUID
        )
        VALUES (
			-4
			, -3
            , 1
            , 'test postcode'
            , 'test'
            , 'test'
            , 'test'
            , 'cunty'
            , 1
            , v_guid
        )
        ;
        
	COMMIT;
    
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Temp
	WHERE GUID = v_guid
    ;
    
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Address_Temp
	WHERE GUID = v_guid
    ;
    
    CALL partsltd_prod.p_shop_save_supplier ( 
		'Test save Supplier' -- comment
        , v_guid -- guid
        , 1 -- id_user
		, 1 -- debug
    );
    
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Address_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Address
	;
    
	CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
END //
DELIMITER ;;

CALL partsltd_prod.p_shop_save_supplier_test ();

DELETE FROM partsltd_prod.Shop_Supplier_Temp;
DELETE FROM partsltd_prod.Shop_Supplier_Address_Temp;

DROP TABLE IF EXISTS tmp_Msg_Error;
/*

Cannot add or update a child row: a foreign key constraint fails (`partsltd_prod`.`shop_supplier_address`, CONSTRAINT `FK_Shop_Supplier_Address_id_supplier` FOREIGN KEY (`id_supplier`) REFERENCES `shop_supplier` (`id_supplier`) ON UPDATE RESTRICT)

*/