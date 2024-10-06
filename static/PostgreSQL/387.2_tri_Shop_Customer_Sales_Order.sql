
-- Shop Customer Sales Order

CREATE OR REPLACE FUNCTION before_insert_Shop_Customer_Sales_Order()
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

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Customer_Sales_Order
BEFORE INSERT ON Shop_Customer_Sales_Order
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Customer_Sales_Order();


CREATE OR REPLACE FUNCTION before_update_Shop_Customer_Sales_Order()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Customer_Sales_Order_Audit (
		id_order,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	-- Changed id_customer
	SELECT NEW.id_order, 'id_customer', OLD.id_customer, NEW.id_customer, NEW.id_change_set
		WHERE NOT OLD.id_customer <=> NEW.id_customer
    UNION
	-- Changed price_total_local
	SELECT NEW.id_order, 'price_total_local', OLD.price_total_local, NEW.price_total_local, NEW.id_change_set
		WHERE NOT OLD.price_total_local <=> NEW.price_total_local
    UNION
	-- Changed id_currency_price
	SELECT NEW.id_order, 'id_currency_price', OLD.id_currency_price, NEW.id_currency_price, NEW.id_change_set
		WHERE NOT OLD.id_currency_price <=> NEW.id_currency_price
	UNION
	-- Changed active
	SELECT NEW.id_order, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Customer_Sales_Order
BEFORE UPDATE ON Shop_Customer_Sales_Order
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Customer_Sales_Order();
