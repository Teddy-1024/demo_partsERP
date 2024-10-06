
-- Shop Supplier

CREATE OR REPLACE FUNCTION before_insert_Shop_Supplier()
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

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Supplier
BEFORE INSERT ON Shop_Supplier
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Supplier();


CREATE OR REPLACE FUNCTION before_update_Shop_Supplier()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Supplier_Audit (
		id_supplier,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	-- Changed name_company
	SELECT NEW.id_supplier, 'name_company', OLD.name_company, NEW.name_company, NEW.id_change_set
		WHERE NOT OLD.name_company <=> NEW.name_company
    UNION
	-- Changed name_contact
	SELECT NEW.id_supplier, 'name_contact', OLD.name_contact, NEW.name_contact, NEW.id_change_set
		WHERE NOT OLD.name_contact <=> NEW.name_contact
    UNION
	-- Changed department_contact
	SELECT NEW.id_supplier, 'department_contact', OLD.department_contact, NEW.department_contact, NEW.id_change_set
		WHERE NOT OLD.department_contact <=> NEW.department_contact
    UNION
	-- Changed id_address
	SELECT NEW.id_supplier, 'id_address', OLD.id_address, NEW.id_address, NEW.id_change_set
		WHERE NOT OLD.id_address <=> NEW.id_address
    UNION
	-- Changed phone_number
	SELECT NEW.id_supplier, 'phone_number', OLD.phone_number, NEW.phone_number, NEW.id_change_set
		WHERE NOT OLD.phone_number <=> NEW.phone_number
    UNION
	-- Changed fax
	SELECT NEW.id_supplier, 'fax', OLD.fax, NEW.fax, NEW.id_change_set
		WHERE NOT OLD.fax <=> NEW.fax
    UNION
	-- Changed email
	SELECT NEW.id_supplier, 'email', OLD.email, NEW.email, NEW.id_change_set
		WHERE NOT OLD.email <=> NEW.email
    UNION
	-- Changed website
	SELECT NEW.id_supplier, 'website', OLD.website, NEW.website, NEW.id_change_set
		WHERE NOT OLD.website <=> NEW.website
    UNION
	-- Changed id_currency
	SELECT NEW.id_supplier, 'id_currency', OLD.id_currency, NEW.id_currency, NEW.id_change_set
		WHERE NOT OLD.id_currency <=> NEW.id_currency
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Supplier
BEFORE UPDATE ON Shop_Supplier
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Supplier();
