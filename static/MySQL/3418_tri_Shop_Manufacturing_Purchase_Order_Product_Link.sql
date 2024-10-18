
# Shop Manufacturing Purchase Order Product Link



DROP TRIGGER IF EXISTS before_insert_Shop_Manufacturing_Purchase_Order_Product_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Manufacturing_Purchase_Order_Product_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Manufacturing_Purchase_Order_Product_Link
BEFORE INSERT ON Shop_Manufacturing_Purchase_Order_Product_Link
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Manufacturing_Purchase_Order_Product_Link
BEFORE UPDATE ON Shop_Manufacturing_Purchase_Order_Product_Link
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Manufacturing_Purchase_Order_Product_Link_Audit (
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
	# Changed id_unit_quantity
	SELECT NEW.id_link, 'id_unit_quantity', OLD.id_unit_quantity, NEW.id_unit_quantity, NEW.id_change_set
		WHERE NOT OLD.id_unit_quantity <=> NEW.id_unit_quantity
    UNION
	# Changed quantity_used
	SELECT NEW.id_link, 'quantity_used', OLD.quantity_used, NEW.quantity_used, NEW.id_change_set
		WHERE NOT OLD.quantity_used <=> NEW.quantity_used
    UNION
	# Changed quantity_produced
	SELECT NEW.id_link, 'quantity_produced', OLD.quantity_produced, NEW.quantity_produced, NEW.id_change_set
		WHERE NOT OLD.quantity_produced <=> NEW.quantity_produced
    UNION
	# Changed cost_unit_local_VAT_excl
	SELECT NEW.id_order, 'cost_unit_local_VAT_excl', OLD.cost_unit_local_VAT_excl, NEW.cost_unit_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.cost_unit_local_VAT_excl <=> NEW.cost_unit_local_VAT_excl
    UNION
	# Changed cost_unit_local_VAT_incl
	SELECT NEW.id_order, 'cost_unit_local_VAT_incl', OLD.cost_unit_local_VAT_incl, NEW.cost_unit_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.cost_unit_local_VAT_incl <=> NEW.cost_unit_local_VAT_incl
    UNION
	# Changed price_unit_local_VAT_excl
	SELECT NEW.id_order, 'price_unit_local_VAT_excl', OLD.price_unit_local_VAT_excl, NEW.price_unit_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.price_unit_local_VAT_excl <=> NEW.price_unit_local_VAT_excl
    UNION
	# Changed price_unit_local_VAT_incl
	SELECT NEW.id_order, 'price_unit_local_VAT_incl', OLD.price_unit_local_VAT_incl, NEW.price_unit_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.price_unit_local_VAT_incl <=> NEW.price_unit_local_VAT_incl
    UNION
	# Changed latency_manufacture_days
	SELECT NEW.id_link, 'latency_manufacture_days', OLD.latency_manufacture_days, NEW.latency_manufacture_days, NEW.id_change_set
		WHERE NOT OLD.latency_manufacture_days <=> NEW.latency_manufacture_days
    UNION
	# Changed display_order
	SELECT NEW.id_link, 'display_order', OLD.display_order, NEW.display_order, NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    UNION
	# Changed active
	SELECT NEW.id_link, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;;

