
-- Shop Discount

CREATE OR REPLACE FUNCTION before_insert_Shop_Discount()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
  NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Discount
BEFORE INSERT ON Shop_Discount
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Discount();


CREATE OR REPLACE FUNCTION before_update_Shop_Discount()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Discount_Audit (
		id_discount,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_discount, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    -- Changed name
	SELECT NEW.id_discount, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    -- Changed multiplier
	SELECT NEW.id_discount, 'multiplier', OLD.multiplier, NEW.multiplier, NEW.id_change_set
		WHERE NOT OLD.multiplier <=> NEW.multiplier
    UNION
    -- Changed subtractor
	SELECT NEW.id_discount, 'subtractor', OLD.subtractor, NEW.subtractor, NEW.id_change_set
		WHERE NOT OLD.subtractor <=> NEW.subtractor
    UNION
    -- Changed apply_multiplier_first
	SELECT NEW.id_discount, 'apply_multiplier_first', CONVERT(CONVERT(OLD.apply_multiplier_first, SIGNED), CHAR), CONVERT(CONVERT(NEW.apply_multiplier_first, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.apply_multiplier_first <=> NEW.apply_multiplier_first
    UNION
    -- Changed quantity_min
	SELECT NEW.id_discount, 'quantity_min', OLD.quantity_min, NEW.quantity_min, NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
    UNION
    -- Changed quantity_max
	SELECT NEW.id_discount, 'quantity_max', OLD.quantity_max, NEW.quantity_max, NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
    UNION
    -- Changed date_start
	SELECT NEW.id_discount, 'date_start', OLD.date_start, NEW.date_start, NEW.id_change_set
		WHERE NOT OLD.date_start <=> NEW.date_start
    UNION
    -- Changed date_end
	SELECT NEW.id_discount, 'date_end', OLD.date_end, NEW.date_end, NEW.id_change_set
		WHERE NOT OLD.date_end <=> NEW.date_end
    UNION
    -- Changed display_order
	SELECT NEW.id_discount, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    UNION
    -- Changed active
	SELECT NEW.id_discount, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Discount
BEFORE UPDATE ON Shop_Discount
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Discount();
