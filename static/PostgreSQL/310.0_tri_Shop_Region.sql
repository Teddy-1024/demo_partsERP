
-- Shop Delivery Region

CREATE OR REPLACE FUNCTION before_insert_Shop_Region()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Region
BEFORE INSERT ON Shop_Region
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Region();


CREATE OR REPLACE FUNCTION before_update_Shop_Region()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Region_Audit (
		id_region,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_region, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    -- Changed name
	SELECT NEW.id_region, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    -- Changed active
	SELECT NEW.id_region, 'active', CONVERT(OLD.active, CHAR), CONVERT(NEW.active, CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    UNION
    -- Changed display_order
	SELECT NEW.id_region, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Region
BEFORE UPDATE ON Shop_Region
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Region();
