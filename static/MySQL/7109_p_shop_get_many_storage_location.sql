

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_storage_location;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_storage_location (
	IN a_get_inactive_storage_location BIT
)
BEGIN
	SET a_get_inactive_storage_location = IFNULL(a_get_inactive_storage_location, 0);
    
	SELECT 
		SL.id_location
        , P.id_plant
        , P.id_address
        , A.id_region
		, SL.code
		, SL.name
		, P.active
	FROM Shop_Storage_Location SL
    INNER JOIN Shop_Plant P ON SL.id_plant = P.id_plant
    INNER JOIN Shop_Address A ON P.id_address = A.id_address
	WHERE 
		a_get_inactive_storage_location = 1
		OR SL.active = 1
	;
END //
DELIMITER ;


/*
CALL p_shop_get_many_storage_location (
	0 # a_get_inactive_storage_location
);
*/
