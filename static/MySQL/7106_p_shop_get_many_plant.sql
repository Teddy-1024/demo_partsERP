

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_plant;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_plant (
	IN a_get_inactive_plant BIT
)
BEGIN
	SET a_get_inactive_plant = IFNULL(a_get_inactive_plant, 0);
    
	SELECT 
		P.id_plant
        , P.id_address
        , A.id_region
        , P.id_user_manager
		, P.code
		, P.name
		, P.active
	FROM Shop_Plant P
    INNER JOIN Shop_Address A ON P.id_address = A.id_address
	WHERE 
		a_get_inactive_plant = 1
		OR P.active = 1
	;
END //
DELIMITER ;;


/*
CALL p_shop_get_many_plant (
	0 # a_get_inactive_plant
);
*/
