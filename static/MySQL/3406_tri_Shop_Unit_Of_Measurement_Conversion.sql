
# Shop Unit of Measurement Conversion



DROP TRIGGER IF EXISTS before_insert_Shop_Unit_Measurement_Conversion;
DROP TRIGGER IF EXISTS before_update_Shop_Unit_Measurement_Conversion;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Unit_Measurement_Conversion
BEFORE INSERT ON Shop_Unit_Measurement_Conversion
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Unit_Measurement_Conversion
BEFORE UPDATE ON Shop_Unit_Measurement_Conversion
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Unit_Measurement_Conversion_Audit (
		id_conversion,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed id_unit_derived
	SELECT NEW.id_conversion, 'id_unit_derived', OLD.id_unit_derived, NEW.id_unit_derived, NEW.id_change_set
		WHERE NOT OLD.id_unit_derived <=> NEW.id_unit_derived
    UNION
	# Changed id_unit_base
	SELECT NEW.id_conversion, 'id_unit_base', OLD.id_unit_base, NEW.id_unit_base, NEW.id_change_set
		WHERE NOT OLD.id_unit_base <=> NEW.id_unit_base
    UNION
	# Changed multiplier_unit_base
	SELECT NEW.id_conversion, 'multiplier_unit_base', OLD.multiplier_unit_base, NEW.multiplier_unit_base, NEW.id_change_set
		WHERE NOT OLD.multiplier_unit_base <=> NEW.multiplier_unit_base
    UNION
	# Changed increment_unit_base
	SELECT NEW.id_conversion, 'active', OLD.increment_unit_base, NEW.increment_unit_base, NEW.id_change_set
		WHERE NOT OLD.increment_unit_base <=> NEW.increment_unit_base
    UNION
	# Changed apply_multiplier_before_increment
	SELECT NEW.id_conversion, 'apply_multiplier_before_increment', OLD.apply_multiplier_before_increment, NEW.apply_multiplier_before_increment, NEW.id_change_set
		WHERE NOT OLD.apply_multiplier_before_increment <=> NEW.apply_multiplier_before_increment
    UNION
	# Changed active
	SELECT NEW.id_conversion, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;

