
# Shop Supplier Purchase Order



DROP TRIGGER IF EXISTS before_insert_Shop_Supplier_Purchase_Order;
DROP TRIGGER IF EXISTS before_update_Shop_Supplier_Purchase_Order;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Supplier_Purchase_Order
BEFORE INSERT ON Shop_Supplier_Purchase_Order
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
CREATE TRIGGER before_update_Shop_Supplier_Purchase_Order
BEFORE UPDATE ON Shop_Supplier_Purchase_Order
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Supplier_Purchase_Order_Audit (
		id_order,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed id_supplier_ordered
	SELECT NEW.id_order, 'id_supplier_ordered', OLD.id_supplier_ordered, NEW.id_supplier_ordered, NEW.id_change_set
		WHERE NOT OLD.id_supplier_ordered <=> NEW.id_supplier_ordered
    UNION
	# Changed cost_total_local
	SELECT NEW.id_order, 'cost_total_local', OLD.cost_total_local, NEW.cost_total_local, NEW.id_change_set
		WHERE NOT OLD.cost_total_local <=> NEW.cost_total_local
    UNION
	# Changed id_currency_cost
	SELECT NEW.id_order, 'id_currency_cost', OLD.id_currency_cost, NEW.id_currency_cost, NEW.id_change_set
		WHERE NOT OLD.id_currency_cost <=> NEW.id_currency_cost
	/*
    UNION
	# Changed latency_delivery
	SELECT NEW.id_order, 'latency_delivery', OLD.latency_delivery, NEW.latency_delivery, NEW.id_change_set
		WHERE NOT OLD.latency_delivery <=> NEW.latency_delivery
    UNION
	# Changed quantity_ordered
	SELECT NEW.id_order, 'quantity_ordered', OLD.quantity_ordered, NEW.quantity_ordered, NEW.id_change_set
		WHERE NOT OLD.quantity_ordered <=> NEW.quantity_ordered
    UNION
	# Changed id_unit_quantity
	SELECT NEW.id_order, 'id_unit_quantity', OLD.id_unit_quantity, NEW.id_unit_quantity, NEW.id_change_set
		WHERE NOT OLD.id_unit_quantity <=> NEW.id_unit_quantity
    UNION
	# Changed quantity_received
	SELECT NEW.id_order, 'quantity_received', OLD.quantity_received, NEW.quantity_received, NEW.id_change_set
		WHERE NOT OLD.quantity_received <=> NEW.quantity_received
	*/
    ;
END //
DELIMITER ;

