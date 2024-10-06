
-- File Type Audits

CREATE OR REPLACE FUNCTION before_insert_File_Type_Audit()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_File_Type_Audit
BEFORE INSERT ON File_Type_Audit
FOR EACH ROW
EXECUTE FUNCTION before_insert_File_Type_Audit();


CREATE OR REPLACE FUNCTION before_update_File_Type_Audit()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_last_on = CURRENT_TIMESTAMP;
    NEW.updated_last_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_File_Type_Audit
BEFORE UPDATE ON File_Type_Audit
FOR EACH ROW
EXECUTE FUNCTION before_update_File_Type_Audit();