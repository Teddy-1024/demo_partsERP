
-- Shop User Order Type

CREATE OR REPLACE FUNCTION before_insert_Shop_User_Order_Status()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_User_Order_Status
BEFORE INSERT ON Shop_User_Order_Status
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_User_Order_Status();


CREATE OR REPLACE FUNCTION before_update_Shop_User_Order_Status()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_User_Order_Status_Audit (
		id_Status,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_Status, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    -- Changed name
	SELECT NEW.id_Status, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    -- Changed name_plural
	SELECT NEW.id_Status, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
	UNION
	-- Changed active
	SELECT NEW.id_Status, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	-- Changed display_order
	SELECT NEW.id_Status, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_User_Order_Status
BEFORE UPDATE ON Shop_User_Order_Status
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_User_Order_Status();
