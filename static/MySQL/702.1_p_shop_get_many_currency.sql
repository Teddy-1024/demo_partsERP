
USE PARTSLTD_PROD;

/*

CALL p_shop_get_many_currency (
	0 # a_get_inactive_currency
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_currency;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_currency (
	IN a_get_inactive_currency BIT
)
BEGIN
	IF a_get_inactive_currency IS NULL THEN
		SET a_get_inactive_currency = 0;
    END IF;
    
	SELECT 
		C.id_currency,
        C.code,
        C.name,
        C.factor_from_GBP,
        C.active,
        C.display_order
	FROM Shop_Currency C
	WHERE a_get_inactive_currency
		OR C.active
	ORDER BY C.display_order
	;
END //
DELIMITER ;


CALL p_shop_get_many_currency (
	0 # a_get_inactive_currency
);
