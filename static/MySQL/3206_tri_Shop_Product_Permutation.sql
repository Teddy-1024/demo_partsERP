
# Shop Product Permutation



DROP TRIGGER IF EXISTS before_insert_Shop_Product_Permutation;
DROP TRIGGER IF EXISTS before_update_Shop_Product_Permutation;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Permutation
BEFORE INSERT ON Shop_Product_Permutation
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Product_Permutation
BEFORE UPDATE ON Shop_Product_Permutation
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;

	IF (NOT (
		NEW.id_unit_measurement_interval_recurrence IS NULL
		OR NEW.id_unit_measurement_interval_recurrence NOT IN (SELECT id_unit_measurement FROM Shop_Unit_Measurement WHERE is_unit_of_time = 1)
	)) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Recurrence interval ID must be a unit of time.';
    END IF;

	IF (NOT (
		NEW.id_unit_measurement_interval_expiration_unsealed IS NULL
		OR NEW.id_unit_measurement_interval_expiration_unsealed NOT IN (SELECT id_unit_measurement FROM Shop_Unit_Measurement WHERE is_unit_of_time = 1)
	)) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Unsealed expiration interval ID must be a unit of time.';
    END IF;
    
    INSERT INTO Shop_Product_Permutation_Audit (
		id_permutation,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    # Changed id_product
	SELECT NEW.id_permutation, 'id_product', OLD.id_product, NEW.id_product, NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
	UNION
    # Changed id_variation
	SELECT NEW.id_permutation, 'id_variation', OLD.id_variation, NEW.id_variation, NEW.id_change_set
		WHERE NOT OLD.id_variation <=> NEW.id_variation
	UNION
	# Changed name
	SELECT NEW.id_permutation, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT (OLD.name <=> NEW.name)
	UNION
	*/
	# Changed description
	SELECT NEW.id_permutation, 'description', OLD.description, NEW.description, NEW.id_change_set
		WHERE NOT (OLD.description <=> NEW.description)
	UNION
	# Changed cost_local
	SELECT NEW.id_permutation, 'cost_local', CONVERT(OLD.cost_local, CHAR), CONVERT(NEW.cost_local, CHAR), NEW.id_change_set
		WHERE NOT (OLD.cost_local <=> NEW.cost_local)
	UNION
	# Changed id_currency_cost
	SELECT NEW.id_permutation, 'id_currency_cost', CONVERT(OLD.id_currency_cost, CHAR), CONVERT(NEW.id_currency_cost, CHAR), NEW.id_change_set
		WHERE NOT (OLD.id_currency_cost <=> NEW.id_currency_cost)
	UNION
    /*
	# Changed profit_local_min
	SELECT NEW.id_permutation, 'profit_local_min', CONVERT(OLD.profit_local_min, CHAR), CONVERT(NEW.profit_local_min, CHAR), NEW.id_change_set
		WHERE NOT (OLD.profit_local_min <=> NEW.profit_local_min)
	UNION
	# Changed id_currency_profit_min
	SELECT NEW.id_permutation, 'id_currency_profit_min', CONVERT(OLD.id_currency_profit_min, CHAR), CONVERT(NEW.id_currency_profit_min, CHAR), NEW.id_change_set
		WHERE NOT (OLD.id_currency_profit_min <=> NEW.id_currency_profit_min)
	UNION
    */ 
    /*
	# Changed price_GBP_min
	SELECT NEW.id_permutation, 'price_GBP_min', CONVERT(OLD.price_GBP_min, CHAR), CONVERT(NEW.price_GBP_min, CHAR), NEW.id_change_set
		WHERE NOT (OLD.price_GBP_min <=> NEW.price_GBP_min)
	UNION
    */
    # Changed latency_manufacture_days
	SELECT NEW.id_permutation, 'latency_manufacture_days', CONVERT(OLD.latency_manufacture_days, CHAR), CONVERT(NEW.latency_manufacture_days, CHAR), NEW.id_change_set
		WHERE NOT OLD.latency_manufacture_days <=> NEW.latency_manufacture_days
	UNION
    # Changed id_unit_measurement_quantity
	SELECT NEW.id_permutation, 'id_unit_measurement_quantity', CONVERT(OLD.id_unit_measurement_quantity, CHAR), CONVERT(NEW.id_unit_measurement_quantity, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_unit_measurement_quantity <=> NEW.id_unit_measurement_quantity
	UNION
    # Changed count_unit_measurement_per_quantity_step
	SELECT NEW.id_permutation, 'count_unit_measurement_per_quantity_step', CONVERT(OLD.count_unit_measurement_per_quantity_step, CHAR), CONVERT(NEW.count_unit_measurement_per_quantity_step, CHAR), NEW.id_change_set
		WHERE NOT OLD.count_unit_measurement_per_quantity_step <=> NEW.count_unit_measurement_per_quantity_step
	UNION
    # Changed quantity_min
	SELECT NEW.id_permutation, 'quantity_min', CONVERT(OLD.quantity_min, CHAR), CONVERT(NEW.quantity_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
	UNION
    # Changed quantity_max
	SELECT NEW.id_permutation, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
	UNION
    # Changed quantity_stock
	SELECT NEW.id_permutation, 'quantity_stock', CONVERT(OLD.quantity_stock, CHAR), CONVERT(NEW.quantity_stock, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_stock <=> NEW.quantity_stock
    UNION
    # Changed is_subscription
	SELECT NEW.id_permutation, 'is_subscription', CONVERT(CONVERT(OLD.is_subscription, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_subscription, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.is_subscription <=> NEW.is_subscription
	UNION
    # Changed id_unit_measurement_interval_recurrence
	SELECT NEW.id_permutation, 'id_unit_measurement_interval_recurrence', CONVERT(OLD.id_unit_measurement_interval_recurrence, CHAR), CONVERT(NEW.id_unit_measurement_interval_recurrence, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_unit_measurement_interval_recurrence <=> NEW.id_unit_measurement_interval_recurrence
    UNION
    # Changed count_interval_recurrence
	SELECT NEW.id_permutation, 'count_interval_recurrence', CONVERT(OLD.count_interval_recurrence, CHAR), CONVERT(NEW.count_interval_recurrence, CHAR), NEW.id_change_set
		WHERE NOT OLD.count_interval_recurrence <=> NEW.count_interval_recurrence
	UNION
    # Changed id_stripe_product
	SELECT NEW.id_permutation, 'id_stripe_product', OLD.id_stripe_product, NEW.id_stripe_product, NEW.id_change_set
		WHERE NOT (OLD.id_stripe_product <=> NEW.id_stripe_product)
	UNION
    # Changed does_expire_faster_once_unsealed
	SELECT NEW.id_permutation, 'does_expire_faster_once_unsealed', CONVERT(OLD.does_expire_faster_once_unsealed, CHAR), CONVERT(NEW.does_expire_faster_once_unsealed, CHAR), NEW.id_change_set
		WHERE NOT OLD.does_expire_faster_once_unsealed <=> NEW.does_expire_faster_once_unsealed
    UNION
    # Changed id_unit_measurement_interval_expiration_unsealed
	SELECT NEW.id_permutation, 'id_unit_measurement_interval_expiration_unsealed', CONVERT(OLD.id_unit_measurement_interval_expiration_unsealed, CHAR), CONVERT(NEW.id_unit_measurement_interval_expiration_unsealed, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_unit_measurement_interval_expiration_unsealed <=> NEW.id_unit_measurement_interval_expiration_unsealed
    UNION
    # Changed count_interval_expiration_unsealed
	SELECT NEW.id_permutation, 'count_interval_expiration_unsealed', CONVERT(OLD.count_interval_expiration_unsealed, CHAR), CONVERT(NEW.count_interval_expiration_unsealed, CHAR), NEW.id_change_set
		WHERE NOT OLD.count_interval_expiration_unsealed <=> NEW.count_interval_expiration_unsealed
	UNION
    # Changed active
	SELECT NEW.id_permutation, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	/*
    UNION
	# Changed display_order
	SELECT NEW.id_permutation, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    */
    ;
END //
DELIMITER ;;
