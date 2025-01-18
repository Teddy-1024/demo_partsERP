


/*

CALL p_shop_get_many_access_level (
	0 # a_get_inactive_access_level
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_access_level;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_access_level (
	IN a_get_inactive_access_level BIT
)
BEGIN
	SET a_get_inactive_access_level = IFNULL(a_get_inactive_access_level, 0);
    
	SELECT 
		AL.id_access_level
		, AL.code
		, AL.name
		, AL.priority
		, AL.display_order
		, AL.active
	FROM Shop_Access_Level AL
	WHERE 
		a_get_inactive_access_level = 1
		OR AL.active = 1
	ORDER BY AL.display_order
	;
END //
DELIMITER ;


/*
CALL p_shop_get_many_access_level (
	0 # a_get_inactive_access_level
);
*/
