
-- Shop Access Level

CREATE OR REPLACE FUNCTION before_insert_Shop_Access_Level()
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

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Access_Level
BEFORE INSERT ON Shop_Access_Level
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Access_Level();


CREATE OR REPLACE FUNCTION before_update_Shop_Access_Level()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Access_Level_Audit (
		id_access_level,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_access_level, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT (OLD.code <=> NEW.code)
    UNION
    -- Changed name
	SELECT NEW.id_access_level, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT (OLD.name <=> NEW.name)
    UNION
    -- Changed priority
	SELECT NEW.id_access_level, 'priority', CONVERT(OLD.priority, CHAR), CONVERT(NEW.priority, CHAR), NEW.id_change_set
		WHERE NOT (OLD.priority <=> NEW.priority)
	UNION
	-- Changed active
	SELECT NEW.id_access_level, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    UNION
    -- Changed display_order
	SELECT NEW.id_access_level, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
	;
	
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Access_Level
BEFORE UPDATE ON Shop_Access_Level
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Access_Level();
