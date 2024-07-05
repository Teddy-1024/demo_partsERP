
-- Product Change Set



CREATE OR REPLACE FUNCTION before_insert_Shop_Product_Change_Set()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.updated_last_on IS NULL THEN
		NEW.updated_last_on = CURRENT_TIMESTAMP;
	END IF;
	IF NEW.updated_last_by IS NULL THEN
		NEW.updated_last_by = CURRENT_USER;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Product_Change_Set
BEFORE INSERT ON Shop_Product_Change_Set
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Product_Change_Set();
