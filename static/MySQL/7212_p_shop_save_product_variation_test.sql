

-- Clear previous proc
DROP PROCEDURE IF EXISTS partsltd_prod.p_shop_save_product_variation_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_product_variation_test ()
BEGIN
	
	DECLARE v_guid BINARY(36);
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_guid := 'nips';

	SELECT *
	FROM partsltd_prod.Shop_Variation_Type
	;
	SELECT *
	FROM partsltd_prod.Shop_Variation_Type_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Variation
	;
	SELECT *
	FROM partsltd_prod.Shop_Variation_Temp
	;
    
	START TRANSACTION;
    
		DELETE FROM partsltd_prod.Shop_Variation_Type_Temp;
		DELETE FROM partsltd_prod.Shop_Variation_Temp;

		INSERT INTO partsltd_prod.Shop_Variation_Type_Temp (
			id_type
            -- , id_type_temp
            , code
            , name
            , name_plural
            , display_order
            , active
            , GUID
		)
        /* Test 1 - Insert 
        VALUES (
			-1
            -- , -1
            , 'SIZE'
            , 'Size'
            , 'Sizes'
            , 2
            , 1
            , v_guid
        )
        */
        /* Test 2: Alter */
        SELECT
			id_type
            -- , id_type AS id_type_temp
            , code
            , name
            , name_plural
            , display_order
            , active
            , v_guid AS GUID
		FROM partsltd_prod.Shop_Variation_Type
        WHERE id_type = 1
		;
        
		INSERT INTO partsltd_prod.Shop_Variation_Temp (
			id_variation
            , id_type
            , code
            , name
            , display_order
            , active
            , GUID
		)
        /* Test 1 - Insert 
        VALUES (
			-1 -- id_variation
            , -1 -- id_type
            , '300 mL' -- code
            , '300 millilitres' -- name
            , 1 -- display_order
            , 1 -- active
            , v_guid -- 
        )
        */
        /* Test 3 - Insert 
        VALUES (
			-1 -- id_variation
            , 1 -- id_type
            , 'SILVER' -- code
            , 'Silver' -- name
            , 10 -- display_order
            , 1 -- active
            , 'NIPS' -- v_guid -- 
        );
        */
        /* Test 2: Alter */
        SELECT
			id_variation
            , id_type
            , code
            , name
            , display_order
            , active
            , v_guid AS GUID
		FROM partsltd_prod.Shop_Variation
        WHERE id_variation = 2
        UNION
        SELECT
			-1 -- id_variation
            , 1 -- id_type
            , 'GREEN' -- code
            , 'Green' -- name
            , 3 -- display_order
            , 1 -- active
            , v_guid -- 
        ;
        
	COMMIT;
    
	SELECT *
	FROM partsltd_prod.Shop_Variation_Type_Temp
	WHERE GUID = v_guid
    ;
    
	SELECT *
	FROM partsltd_prod.Shop_Variation_Temp
	WHERE GUID = v_guid
    ;
    
    CALL partsltd_prod.p_shop_save_product_variation ( 
		'Test save Variations - add + edit' -- comment
        , v_guid -- guid
        , 1 -- id_user
		, 1 -- debug
    );
    
	SELECT *
	FROM partsltd_prod.Shop_Variation_Type_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Variation_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Variation_Type
	;
	SELECT *
	FROM partsltd_prod.Shop_Variation
	;
    
	CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
END //
DELIMITER ;;

CALL partsltd_prod.p_shop_save_product_variation_test ();

DELETE FROM partsltd_prod.Shop_Variation_Type_Temp;
DELETE FROM partsltd_prod.Shop_Variation_Temp;

DROP TABLE IF EXISTS tmp_Msg_Error;

/*

delete from shop_variation_audit
where id_variation = 3
;
delete from shop_variation_audit
where id_variation = 3
;
delete from shop_variation_type_audit
where id_type = -1
;
delete
-- select *
 from shop_variation_type
where id_type = -1
;

Cannot add or update a child row: a foreign key constraint fails (`partsltd_prod`.`shop_variation_type`, CONSTRAINT `FK_Shop_Variation_Type_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`))

*/