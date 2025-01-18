
# Shop User Order Product Link



DROP TRIGGER IF EXISTS before_insert_Shop_User_Order_Product_Link;
DROP TRIGGER IF EXISTS before_update_Shop_User_Order_Product_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_User_Order_Product_Link
BEFORE INSERT ON Shop_User_Order_Product_Link
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_User_Order_Product_Link
BEFORE UPDATE ON Shop_User_Order_Product_Link
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_User_Order_Product_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed id_product
	SELECT NEW.id_link, 'active', CONVERT(OLD.id_product, CHAR), CONVERT(NEW.id_product, CHAR), NEW.id_change_set
		WHERE NOT (OLD.id_product <=> NEW.id_product)
    UNION
	# Changed quantity
	SELECT NEW.id_link, 'quantity', CONVERT(OLD.quantity, CHAR), CONVERT(NEW.quantity, CHAR), NEW.id_change_set
		WHERE NOT (OLD.quantity <=> NEW.quantity)
    UNION
	# Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;