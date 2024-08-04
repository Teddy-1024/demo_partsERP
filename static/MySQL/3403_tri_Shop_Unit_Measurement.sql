
# Shop Unit of Measurement



DROP TRIGGER IF EXISTS before_insert_Shop_Unit_Measurement;
DROP TRIGGER IF EXISTS before_update_Shop_Unit_Measurement;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Unit_Measurement
BEFORE INSERT ON Shop_Unit_Measurement
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Unit_Measurement
BEFORE UPDATE ON Shop_Unit_Measurement
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Unit_Measurement_Audit (
		id_unit_measurement,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed name_singular
	SELECT NEW.id_unit_measurement, 'name_singular', OLD.name_singular, NEW.name_singular, NEW.id_change_set
		WHERE NOT OLD.name_singular <=> NEW.name_singular
    UNION
	# Changed name_plural
	SELECT NEW.id_unit_measurement, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
    UNION
	# Changed symbol
	SELECT NEW.id_unit_measurement, 'symbol', OLD.symbol, NEW.symbol, NEW.id_change_set
		WHERE NOT OLD.symbol <=> NEW.symbol
    UNION
	# Changed is_base_unit
	SELECT NEW.id_unit_measurement, 'is_base_unit', OLD.is_base_unit, NEW.is_base_unit, NEW.id_change_set
		WHERE NOT OLD.is_base_unit <=> NEW.is_base_unit
    UNION
	# Changed is_unit_of_distance
	SELECT NEW.id_unit_measurement, 'is_unit_of_distance', OLD.is_unit_of_distance, NEW.is_unit_of_distance, NEW.id_change_set
		WHERE NOT OLD.is_unit_of_distance <=> NEW.is_unit_of_distance
    UNION
	# Changed is_unit_of_mass
	SELECT NEW.id_unit_measurement, 'is_unit_of_mass', OLD.is_unit_of_mass, NEW.is_unit_of_mass, NEW.id_change_set
		WHERE NOT OLD.is_unit_of_mass <=> NEW.is_unit_of_mass
    UNION
	# Changed is_unit_of_time
	SELECT NEW.id_unit_measurement, 'is_unit_of_time', OLD.is_unit_of_time, NEW.is_unit_of_time, NEW.id_change_set
		WHERE NOT OLD.is_unit_of_time <=> NEW.is_unit_of_time
    UNION
	# Changed is_unit_of_volume
	SELECT NEW.id_unit_measurement, 'is_unit_of_volume', OLD.is_unit_of_volume, NEW.is_unit_of_volume, NEW.id_change_set
		WHERE NOT OLD.is_unit_of_volume <=> NEW.is_unit_of_volume
    UNION
	# Changed active
	SELECT NEW.id_unit_measurement, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;

