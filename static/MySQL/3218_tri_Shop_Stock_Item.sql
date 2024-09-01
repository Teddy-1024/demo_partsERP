
# Shop Product Permutation



DROP TRIGGER IF EXISTS before_insert_Shop_Stock_Item;
DROP TRIGGER IF EXISTS before_update_Shop_Stock_Item;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Stock_Item
BEFORE INSERT ON Shop_Stock_Item
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Stock_Item
BEFORE UPDATE ON Shop_Stock_Item
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Stock_Item_Audit (
		id_stock,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed id_permutation
	SELECT NEW.id_stock, 'id_permutation', OLD.id_permutation, NEW.id_permutation, NEW.id_change_set
		WHERE NOT (OLD.id_permutation <=> NEW.id_permutation)
	UNION
	# Changed date_purchased
	SELECT NEW.id_stock, 'date_purchased', OLD.date_purchased, NEW.date_purchased, NEW.id_change_set
		WHERE NOT (OLD.date_purchased <=> NEW.date_purchased)
	UNION
	# Changed date_received
	SELECT NEW.id_stock, 'date_received', OLD.date_received, NEW.date_received, NEW.id_change_set
		WHERE NOT (OLD.date_received <=> NEW.date_received)
	UNION
	# Changed id_location_storage
	SELECT NEW.id_stock, 'id_location_storage', OLD.id_location_storage, NEW.id_location_storage, NEW.id_change_set
		WHERE NOT (OLD.id_location_storage <=> NEW.id_location_storage)
	UNION
	# Changed id_currency_cost
	SELECT NEW.id_stock, 'id_currency_cost', OLD.id_currency_cost, NEW.id_currency_cost, NEW.id_change_set
		WHERE NOT (OLD.id_currency_cost <=> NEW.id_currency_cost)
	UNION
	# Changed cost_local_VAT_incl
	SELECT NEW.id_stock, 'cost_local_VAT_incl', OLD.cost_local_VAT_incl, NEW.cost_local_VAT_incl, NEW.id_change_set
		WHERE NOT (OLD.cost_local_VAT_incl <=> NEW.cost_local_VAT_incl)
	UNION
	# Changed cost_local_VAT_excl
	SELECT NEW.id_stock, 'cost_local_VAT_excl', OLD.cost_local_VAT_excl, NEW.cost_local_VAT_excl, NEW.id_change_set
		WHERE NOT (OLD.cost_local_VAT_excl <=> NEW.cost_local_VAT_excl)
	UNION
	# Changed is_sealed
	SELECT NEW.id_stock, 'is_sealed', OLD.is_sealed, NEW.is_sealed, NEW.id_change_set
		WHERE NOT (OLD.is_sealed <=> NEW.is_sealed)
	UNION
	# Changed date_unsealed
	SELECT NEW.id_stock, 'date_unsealed', OLD.date_unsealed, NEW.date_unsealed, NEW.id_change_set
		WHERE NOT (OLD.date_unsealed <=> NEW.date_unsealed)
	UNION
	# Changed date_expiration
	SELECT NEW.id_stock, 'date_expiration', OLD.date_expiration, NEW.date_expiration, NEW.id_change_set
		WHERE NOT (OLD.date_expiration <=> NEW.date_expiration)
	UNION
	# Changed is_consumed
	SELECT NEW.id_stock, 'is_consumed', OLD.is_consumed, NEW.is_consumed, NEW.id_change_set
		WHERE NOT (OLD.is_consumed <=> NEW.is_consumed)
	UNION
	# Changed date_consumed
	SELECT NEW.id_stock, 'date_consumed', OLD.date_consumed, NEW.date_consumed, NEW.id_change_set
		WHERE NOT (OLD.date_consumed <=> NEW.date_consumed)
	UNION
    # Changed active
	SELECT NEW.id_stock, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;;
