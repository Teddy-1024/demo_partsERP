
# Shop Manufacturing Purchase Order



DROP TRIGGER IF EXISTS before_insert_Shop_Manufacturing_Purchase_Order;
DROP TRIGGER IF EXISTS before_update_Shop_Manufacturing_Purchase_Order;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Manufacturing_Purchase_Order
BEFORE INSERT ON Shop_Manufacturing_Purchase_Order
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Manufacturing_Purchase_Order
BEFORE UPDATE ON Shop_Manufacturing_Purchase_Order
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Manufacturing_Purchase_Order_Audit (
		id_order,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed cost_total_local
	SELECT NEW.id_order, 'cost_total_local', OLD.cost_total_local, NEW.cost_total_local, NEW.id_change_set
		WHERE NOT OLD.cost_total_local <=> NEW.cost_total_local
    UNION
	# Changed value_produced_total_local
	SELECT NEW.id_order, 'value_produced_total_local', OLD.value_produced_total_local, NEW.value_produced_total_local, NEW.id_change_set
		WHERE NOT OLD.value_produced_total_local <=> NEW.value_produced_total_local
    UNION
	# Changed id_currency_cost
	SELECT NEW.id_order, 'id_currency_cost', OLD.id_currency_cost, NEW.id_currency_cost, NEW.id_change_set
		WHERE NOT OLD.id_currency_cost <=> NEW.id_currency_cost
    UNION
	# Changed active
	SELECT NEW.id_order, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;;
