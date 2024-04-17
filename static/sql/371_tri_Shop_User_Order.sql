
# Shop Product Variation Link

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_User_Order;
DROP TRIGGER IF EXISTS before_update_Shop_User_Order;


DELIMITER //
CREATE TRIGGER before_insert_Shop_User_Order
BEFORE INSERT ON Shop_User_Order
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
CREATE TRIGGER before_update_Shop_User_Order
BEFORE UPDATE ON Shop_User_Order
FOR EACH ROW
BEGIN
	IF OLD.id_change_set_user <=> NEW.id_change_set_user THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
	IF NOT (NEW.id_checkout_session <=> OLD.id_checkout_session) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Checkout session ID must not change.';
    END IF;
    
    INSERT INTO Shop_User_Order_Audit (
		id_order,
        name_field,
        value_prev,
        value_new,
        id_change_set_user
    )
    # Changed id_user
	SELECT NEW.id_order, 'id_user', OLD.id_user, NEW.id_user, NEW.id_change_set_user
		WHERE NOT OLD.id_user <=> NEW.id_user
	UNION
	# Changed value_total
	SELECT NEW.id_order, 'value_total', CONVERT(OLD.value_total, CHAR), CONVERT(NEW.value_total, CHAR), NEW.id_change_set_user
		WHERE NOT (OLD.value_total <=> NEW.value_total)
	UNION
	# Changed id_order_status
	SELECT NEW.id_order, 'id_order_status', CONVERT(OLD.id_order_status, CHAR), CONVERT(NEW.id_order_status, CHAR), NEW.id_change_set_user
		WHERE NOT (OLD.id_order_status <=> NEW.id_order_status)
	UNION
	# Changed id_checkout_session
	SELECT NEW.id_order, 'id_checkout_session', OLD.id_checkout_session, NEW.id_checkout_session, NEW.id_change_set_user
		WHERE NOT (OLD.id_checkout_session <=> NEW.id_checkout_session)
	UNION
    # Changed active
	SELECT NEW.id_order, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set_user
		WHERE NOT (OLD.active <=> NEW.active)
	;
END //
DELIMITER ;