
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
	# Changed id_currency
	SELECT NEW.id_order, 'id_currency', OLD.id_currency, NEW.id_currency, NEW.id_change_set
		WHERE NOT OLD.id_currency <=> NEW.id_currency
    UNION
	# Changed cost_total_local_VAT_excl
	SELECT NEW.id_order, 'cost_total_local_VAT_excl', OLD.cost_total_local_VAT_excl, NEW.cost_total_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.cost_total_local_VAT_excl <=> NEW.cost_total_local_VAT_excl
    UNION
	# Changed cost_total_local_VAT_incl
	SELECT NEW.id_order, 'cost_total_local_VAT_incl', OLD.cost_total_local_VAT_incl, NEW.cost_total_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.cost_total_local_VAT_incl <=> NEW.cost_total_local_VAT_incl
    UNION
	# Changed price_total_local_VAT_excl
	SELECT NEW.id_order, 'price_total_local_VAT_excl', OLD.price_total_local_VAT_excl, NEW.price_total_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.price_total_local_VAT_excl <=> NEW.price_total_local_VAT_excl
    UNION
	# Changed price_total_local_VAT_incl
	SELECT NEW.id_order, 'price_total_local_VAT_incl', OLD.price_total_local_VAT_incl, NEW.price_total_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.price_total_local_VAT_incl <=> NEW.price_total_local_VAT_incl
    UNION
	# Changed active
	SELECT NEW.id_order, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;;
