
# Shop Category



DROP TRIGGER IF EXISTS before_insert_Shop_Product_Category;
DROP TRIGGER IF EXISTS before_update_Shop_Product_Category;

DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Category
BEFORE INSERT ON Shop_Product_Category
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_update_Shop_Product_Category
BEFORE UPDATE ON Shop_Product_Category
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Product_Category_Audit (
		id_category,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_category, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
    # Changed name
	SELECT NEW.id_category, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	# Changed description
	SELECT NEW.id_category, 'description', OLD.description, NEW.description, NEW.id_change_set
		WHERE NOT OLD.description <=> NEW.description
	UNION
	# Changed active
	SELECT NEW.id_category, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
    # Changed display_order
	SELECT NEW.id_category, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END //
DELIMITER ;
