
# Shop Product Variation Link

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Product_Variation_Type_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Product_Variation_Type_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Variation_Type_Link
BEFORE INSERT ON Shop_Product_Variation_Type_Link
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
CREATE TRIGGER before_update_Shop_Product_Variation_Type_Link
BEFORE UPDATE ON Shop_Product_Variation_Type_Link
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Product_Variation_Type_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    # Changed id_product
	SELECT NEW.id_link, 'id_product', OLD.id_product, NEW.id_product, NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
	UNION
    # Changed id_variation
	SELECT NEW.id_link, 'id_variation', OLD.id_variation, NEW.id_variation, NEW.id_change_set
		WHERE NOT OLD.id_variation <=> NEW.id_variation
	UNION
	*/
    # Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_link, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;
END //
DELIMITER ;