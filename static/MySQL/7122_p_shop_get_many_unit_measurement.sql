
-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_unit_measurement;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_unit_measurement (
	IN a_get_inactive_unit_measurement BIT
)
BEGIN
	SET a_get_inactive_unit_measurement := IFNULL(a_get_inactive_unit_measurement, 0);
    
	SELECT 
		UM.id_unit_measurement,
		UM.name_singular,
		UM.name_plural,
		UM.symbol,
		UM.symbol_is_suffix_not_prefix,
		UM.is_base_unit,
		UM.is_unit_of_distance,
		UM.is_unit_of_mass,
		UM.is_unit_of_time,
		UM.is_unit_of_volume,
		UM.active
	FROM Shop_Unit_Measurement UM
	WHERE 
		a_get_inactive_unit_measurement = 1
		OR UM.active = 1
	;
END //
DELIMITER ;


/*
CALL p_shop_get_many_unit_measurement (
	0 # a_get_inactive_unit_measurement
);

select *
from shop_unit_measurement
*/
