


/*

CALL p_shop_get_many_region (
	0 # a_get_inactive_region
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_region;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_region (
	IN a_get_inactive_region BIT
)
BEGIN
	IF a_get_inactive_region IS NULL THEN
		SET a_get_inactive_region = 0;
    END IF;
    
	SELECT 
		R.id_region,
        R.code,
        R.name,
        R.active,
        R.display_order
	FROM Shop_Region R
	WHERE a_get_inactive_region
		OR R.active
	ORDER BY R.display_order
	;
END //
DELIMITER ;


/*
CALL p_shop_get_many_region (
	0 # a_get_inactive_region
);
*/
