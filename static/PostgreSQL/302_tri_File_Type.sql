
-- File Type

CREATE OR REPLACE FUNCTION before_insert_File_Type()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_File_Type
BEFORE INSERT ON File_Type
FOR EACH ROW
EXECUTE FUNCTION before_insert_File_Type();


CREATE OR REPLACE FUNCTION before_update_File_Type()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO File_Type_Audit (
		id_type,
        name_field,
        value_prev,
        value_new
    )
    -- Changed code
	SELECT NEW.id_type, 'code', OLD.code, NEW.code
		WHERE NOT OLD.code <=> NEW.code
	UNION
    -- Changed name
	SELECT NEW.id_type, 'name', OLD.name, NEW.name
		WHERE NOT OLD.name <=> NEW.name
    UNION
    -- Changed extension
	SELECT NEW.id_type, 'extension', CONVERT(OLD.extension, CHAR), CONVERT(NEW.extension, CHAR)
		WHERE NOT OLD.extension <=> NEW.extension
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_File_Type
BEFORE UPDATE ON File_Type
FOR EACH ROW
EXECUTE FUNCTION before_update_File_Type();
