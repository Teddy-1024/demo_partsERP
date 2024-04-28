
# Shop Address

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Address;
DROP TRIGGER IF EXISTS before_update_Shop_Address;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Address
BEFORE INSERT ON Shop_Address
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
CREATE TRIGGER before_update_Shop_Address
BEFORE UPDATE ON Shop_Address
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Address_Audit (
		id_address,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed region
	SELECT NEW.id_address, 'id_region', OLD.id_region, NEW.id_region, NEW.id_change_set
		WHERE NOT OLD.id_region <=> NEW.id_region
    UNION
    # Changed name_full
	SELECT NEW.id_address, 'name_full', OLD.name_full, NEW.name_full, NEW.id_change_set
		WHERE NOT OLD.name_full <=> NEW.name_full
	UNION
    # Changed phone_number
	SELECT NEW.id_address, 'phone_number', OLD.phone_number, NEW.phone_number, NEW.id_change_set
		WHERE NOT OLD.phone_number <=> NEW.phone_number
    UNION
    # Changed postcode
	SELECT NEW.id_address, 'postcode', OLD.postcode, NEW.postcode, NEW.id_change_set
		WHERE NOT OLD.postcode <=> NEW.postcode
    UNION
    # Changed address_line_1
	SELECT NEW.id_address, 'address_line_1', OLD.address_line_1, NEW.address_line_1, NEW.id_change_set
		WHERE NOT OLD.address_line_1 <=> NEW.address_line_1
	UNION
    # Changed address_line_2
	SELECT NEW.id_address, 'address_line_2', OLD.address_line_2, NEW.address_line_2, NEW.id_change_set
		WHERE NOT OLD.address_line_2 <=> NEW.address_line_2
	UNION
    # Changed city
	SELECT NEW.id_address, 'city', OLD.city, NEW.city, NEW.id_change_set
		WHERE NOT OLD.city <=> NEW.city
    UNION
    # Changed county
	SELECT NEW.id_address, 'county', OLD.county, NEW.county, NEW.id_change_set
		WHERE NOT OLD.county <=> NEW.county
	UNION
	# Changed active
	SELECT NEW.id_address, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;