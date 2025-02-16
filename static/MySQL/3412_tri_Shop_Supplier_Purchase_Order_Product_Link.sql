
# Shop Supplier Purchase Order Product Link



DROP TRIGGER IF EXISTS before_insert_Shop_Supplier_Purchase_Order_Product_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Supplier_Purchase_Order_Product_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Supplier_Purchase_Order_Product_Link
BEFORE INSERT ON Shop_Supplier_Purchase_Order_Product_Link
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Supplier_Purchase_Order_Product_Link
BEFORE UPDATE ON Shop_Supplier_Purchase_Order_Product_Link
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Supplier_Purchase_Order_Product_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed id_order
	SELECT NEW.id_link, 'id_order', OLD.id_order, NEW.id_order, NEW.id_change_set
		WHERE NOT OLD.id_order <=> NEW.id_order
    UNION
	# Changed id_permutation
	SELECT NEW.id_link, 'id_permutation', OLD.id_permutation, NEW.id_permutation, NEW.id_change_set
		WHERE NOT OLD.id_permutation <=> NEW.id_permutation
    UNION
    /*
	# Changed id_currency_cost
	SELECT NEW.id_link, 'id_currency_cost', OLD.id_currency_cost, NEW.id_currency_cost, NEW.id_change_set
		WHERE NOT OLD.id_currency_cost <=> NEW.id_currency_cost
    UNION
	*/
    # Changed quantity_ordered
	SELECT NEW.id_link, 'quantity_ordered', OLD.quantity_ordered, NEW.quantity_ordered, NEW.id_change_set
		WHERE NOT OLD.quantity_ordered <=> NEW.quantity_ordered
    UNION
	# Changed id_unit_quantity
	SELECT NEW.id_link, 'id_unit_quantity', OLD.id_unit_quantity, NEW.id_unit_quantity, NEW.id_change_set
		WHERE NOT OLD.id_unit_quantity <=> NEW.id_unit_quantity
    UNION
	# Changed quantity_received
	SELECT NEW.id_link, 'quantity_received', OLD.quantity_received, NEW.quantity_received, NEW.id_change_set
		WHERE NOT OLD.quantity_received <=> NEW.quantity_received
    UNION
	# Changed latency_delivery_days
	SELECT NEW.id_link, 'latency_delivery_days', OLD.latency_delivery_days, NEW.latency_delivery_days, NEW.id_change_set
		WHERE NOT OLD.latency_delivery_days <=> NEW.latency_delivery_days
    UNION
	# Changed display_order
	SELECT NEW.id_link, 'display_order', OLD.display_order, NEW.display_order, NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    UNION
	# Changed active
	SELECT NEW.id_link, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    UNION
	# Changed cost_total_local_VAT_excl
	SELECT NEW.id_link, 'cost_total_local_VAT_excl', OLD.cost_total_local_VAT_excl, NEW.cost_total_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.cost_total_local_VAT_excl <=> NEW.cost_total_local_VAT_excl
    UNION
	# Changed cost_total_local_VAT_incl
	SELECT NEW.id_link, 'cost_total_local_VAT_incl', OLD.cost_total_local_VAT_incl, NEW.cost_total_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.cost_total_local_VAT_incl <=> NEW.cost_total_local_VAT_incl
    UNION
	# Changed cost_unit_local_VAT_excl
	SELECT NEW.id_link, 'cost_unit_local_VAT_excl', OLD.cost_unit_local_VAT_excl, NEW.cost_unit_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.cost_unit_local_VAT_excl <=> NEW.cost_unit_local_VAT_excl
    UNION
	# Changed cost_unit_local_VAT_incl
	SELECT NEW.id_link, 'cost_unit_local_VAT_incl', OLD.cost_unit_local_VAT_incl, NEW.cost_unit_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.cost_unit_local_VAT_incl <=> NEW.cost_unit_local_VAT_incl
    ;
END //
DELIMITER ;
