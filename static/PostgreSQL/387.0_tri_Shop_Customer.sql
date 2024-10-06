
-- Shop Customer

CREATE OR REPLACE FUNCTION before_insert_Shop_Customer()
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

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Customer
BEFORE INSERT ON Shop_Customer
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Customer();


CREATE OR REPLACE FUNCTION before_update_Shop_Customer()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Customer_Audit (
		id_customer,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	-- Changed name_company
	SELECT NEW.id_customer, 'name_company', OLD.name_company, NEW.name_company, NEW.id_change_set
		WHERE NOT OLD.name_company <=> NEW.name_company
    UNION
	-- Changed name_contact
	SELECT NEW.id_customer, 'name_contact', OLD.name_contact, NEW.name_contact, NEW.id_change_set
		WHERE NOT OLD.name_contact <=> NEW.name_contact
    UNION
	-- Changed department_contact
	SELECT NEW.id_customer, 'department_contact', OLD.department_contact, NEW.department_contact, NEW.id_change_set
		WHERE NOT OLD.department_contact <=> NEW.department_contact
    UNION
	-- Changed id_address
	SELECT NEW.id_customer, 'id_address', OLD.id_address, NEW.id_address, NEW.id_change_set
		WHERE NOT OLD.id_address <=> NEW.id_address
    UNION
	-- Changed phone_number
	SELECT NEW.id_customer, 'phone_number', OLD.phone_number, NEW.phone_number, NEW.id_change_set
		WHERE NOT OLD.phone_number <=> NEW.phone_number
    UNION
	-- Changed email
	SELECT NEW.id_customer, 'email', OLD.email, NEW.email, NEW.id_change_set
		WHERE NOT OLD.email <=> NEW.email
    UNION
	-- Changed id_currency
	SELECT NEW.id_customer, 'id_currency', OLD.id_currency, NEW.id_currency, NEW.id_change_set
		WHERE NOT OLD.id_currency <=> NEW.id_currency
    UNION
	-- Changed active
	SELECT NEW.id_customer, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Customer
BEFORE UPDATE ON Shop_Customer
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Customer();

