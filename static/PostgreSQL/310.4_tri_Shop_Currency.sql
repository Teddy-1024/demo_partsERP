
-- Shop Currency

CREATE OR REPLACE FUNCTION before_insert_Shop_Currency()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Currency
BEFORE INSERT ON Shop_Currency
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Currency();


CREATE OR REPLACE FUNCTION before_update_Shop_Currency()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Currency_Audit (
		id_currency,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_currency, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
    -- Changed name
	SELECT NEW.id_currency, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
    -- Changed symbol
	SELECT NEW.id_currency, 'symbol', OLD.symbol, NEW.symbol, NEW.id_change_set
		WHERE NOT OLD.symbol <=> NEW.symbol
	UNION
    -- Changed ratio_2_GBP
	SELECT NEW.id_currency, 'factor_from_GBP', OLD.factor_from_GBP, NEW.factor_from_GBP, NEW.id_change_set
		WHERE NOT OLD.factor_from_GBP <=> NEW.factor_from_GBP
	UNION
	-- Changed active
	SELECT NEW.id_currency, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	-- Changed display_order
	SELECT NEW.id_currency, 'display_order', CONVERT(display_order, CHAR), CONVERT(display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Currency
BEFORE UPDATE ON Shop_Currency
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Currency();
