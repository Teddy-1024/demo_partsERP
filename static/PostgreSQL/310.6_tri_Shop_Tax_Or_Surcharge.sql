
-- Shop Tax_Or_Surcharge

CREATE OR REPLACE FUNCTION before_insert_Shop_Tax_Or_Surcharge()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Tax_Or_Surcharge
BEFORE INSERT ON Shop_Tax_Or_Surcharge
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Tax_Or_Surcharge();


CREATE OR REPLACE FUNCTION before_update_Shop_Tax_Or_Surcharge()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Tax_Or_Surcharge_Audit (
		id_tax,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_tax, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    -- Changed name
	SELECT NEW.id_tax, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    -- Changed fixed_fee
	SELECT NEW.id_tax, 'fixed_fee', OLD.fixed_fee, NEW.fixed_fee, NEW.id_change_set
		WHERE NOT OLD.fixed_fee <=> NEW.fixed_fee
    UNION
    -- Changed multiplier
	SELECT NEW.id_tax, 'multiplier', OLD.multiplier, NEW.multiplier, NEW.id_change_set
		WHERE NOT OLD.multiplier <=> NEW.multiplier
    UNION
    -- Changed apply_fixed_fee_before_multiplier
	SELECT NEW.id_tax, 'apply_fixed_fee_before_multiplier', CONVERT(CONVERT(OLD.apply_fixed_fee_before_multiplier, SIGNED), CHAR), CONVERT(CONVERT(NEW.apply_fixed_fee_before_multiplier, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.apply_fixed_fee_before_multiplier <=> NEW.apply_fixed_fee_before_multiplier
    UNION
    -- Changed quantity_min
	SELECT NEW.id_tax, 'quantity_min', OLD.quantity_min, NEW.quantity_min, NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
    UNION
    -- Changed quantity_max
	SELECT NEW.id_tax, 'quantity_max', OLD.quantity_max, NEW.quantity_max, NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
    UNION
    -- Changed display_order
	SELECT NEW.id_tax, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    UNION
    -- Changed active
	SELECT NEW.id_tax, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Tax_Or_Surcharge
BEFORE UPDATE ON Shop_Tax_Or_Surcharge
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Tax_Or_Surcharge();

