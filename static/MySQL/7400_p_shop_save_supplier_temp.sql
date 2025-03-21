

-- Clear previous proc
DROP PROCEDURE IF EXISTS demo.p_shop_save_supplier_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_supplier_test ()
BEGIN
	
	DECLARE v_guid BINARY(36);
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_guid := 'nips';

	SELECT *
	FROM demo.Shop_Supplier
	;
	SELECT *
	FROM demo.Shop_Supplier_Temp
	;
	SELECT *
	FROM demo.Shop_Supplier_Address
	;
	SELECT *
	FROM demo.Shop_Supplier_Address_Temp
	;

	START TRANSACTION;
		
		INSERT INTO demo.Shop_Supplier_Temp (
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
        /* Test 1 - Insert 
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
		)
        */
        /* Test 2 - Update */
        SELECT
			id_supplier
			, id_currency
			, name_company
			, 'Nat' AS name_contact
			, 'Butchery' AS department_contact
			, phone_number
			, fax
			, email
			, website
			, active
			, v_guid
		FROM demo.Shop_Supplier S
        WHERE S.id_supplier = 2
        ;
		
        /*
		INSERT INTO demo.Shop_Supplier_Address_Temp (
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
        / Test 1 - Insert 
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
        /
        / Test 2 - Update /
        SELECT
			id_address
            , id_supplier
			, id_region
			, postcode
			, address_line_1
			, address_line_2
			, city
			, county
            , active
			, v_guid
		FROM demo.Shop_Supplier_Address SA
        WHERE SA.id_supplier = 2
        ;
        */
        
	COMMIT;
    
	SELECT *
	FROM demo.Shop_Supplier_Temp
	WHERE GUID = v_guid
    ;
    
	SELECT *
	FROM demo.Shop_Supplier_Address_Temp
	WHERE GUID = v_guid
    ;
    
    CALL demo.p_shop_save_supplier ( 
		'Test save Supplier' -- comment
        , v_guid -- guid
        , 1 -- id_user
		, 1 -- debug
    );
    
	SELECT *
	FROM demo.Shop_Supplier_Temp
	;
	SELECT *
	FROM demo.Shop_Supplier_Address_Temp
	;
	SELECT *
	FROM demo.Shop_Supplier
	;
	SELECT *
	FROM demo.Shop_Supplier_Address
	;
    
	CALL demo.p_debug_timing_reporting ( v_time_start );
END //
DELIMITER ;

/*
CALL demo.p_shop_save_supplier_test ();

DELETE FROM demo.Shop_Supplier_Temp;
DELETE FROM demo.Shop_Supplier_Address_Temp;

DROP TABLE IF EXISTS tmp_Msg_Error;

Cannot add or update a child row: a foreign key constraint fails (`demo`.`shop_supplier`, CONSTRAINT `FK_Shop_Supplier_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_sales_and_purchasing_change_set` (`id_change_set`))

*/