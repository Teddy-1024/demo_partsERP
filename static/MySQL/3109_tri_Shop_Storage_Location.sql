
# Shop Storage Location

USE PARTSLTD_PROD;

DROP TRIGGER IF EXISTS before_insert_Shop_Storage_Location;
DROP TRIGGER IF EXISTS before_update_Shop_Storage_Location;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Storage_Location
BEFORE INSERT ON Shop_Storage_Location
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Storage_Location
BEFORE UPDATE ON Shop_Storage_Location
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Storage_Location_Audit (
		id_location,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed id_plant
	SELECT NEW.id_location, 'id_plant', OLD.id_plant, NEW.id_plant, NEW.id_change_set
		WHERE NOT OLD.id_plant <=> NEW.id_plant
    UNION
    # Changed code
	SELECT NEW.id_location, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_location, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed active
	SELECT NEW.id_location, 'active', CONVERT(OLD.active, CHAR), CONVERT(NEW.active, CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;
