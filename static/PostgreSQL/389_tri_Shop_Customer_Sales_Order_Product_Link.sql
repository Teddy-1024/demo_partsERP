
-- Shop Customer Sales Order Product Link

CREATE OR REPLACE FUNCTION before_insert_Shop_Customer_Sales_Order_Product_Link()
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

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Customer_Sales_Order_Product_Link
BEFORE INSERT ON Shop_Customer_Sales_Order_Product_Link
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Customer_Sales_Order_Product_Link();


CREATE OR REPLACE FUNCTION before_update_Shop_Customer_Sales_Order_Product_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Customer_Sales_Order_Product_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	-- Changed id_order
	SELECT NEW.id_link, 'id_order', OLD.id_order, NEW.id_order, NEW.id_change_set
		WHERE NOT OLD.id_order <=> NEW.id_order
    UNION
	-- Changed id_permutation
	SELECT NEW.id_link, 'id_permutation', OLD.id_permutation, NEW.id_permutation, NEW.id_change_set
		WHERE NOT OLD.id_permutation <=> NEW.id_permutation
    UNION
	-- Changed price_total_local
	SELECT NEW.id_link, 'price_total_local', OLD.price_total_local, NEW.price_total_local, NEW.id_change_set
		WHERE NOT OLD.price_total_local <=> NEW.price_total_local
    UNION
	-- Changed id_currency_price
	SELECT NEW.id_link, 'id_currency_price', OLD.id_currency_price, NEW.id_currency_price, NEW.id_change_set
		WHERE NOT OLD.id_currency_price <=> NEW.id_currency_price
    UNION
	-- Changed quantity_ordered
	SELECT NEW.id_link, 'quantity_ordered', OLD.quantity_ordered, NEW.quantity_ordered, NEW.id_change_set
		WHERE NOT OLD.quantity_ordered <=> NEW.quantity_ordered
    UNION
	-- Changed id_unit_quantity
	SELECT NEW.id_link, 'id_unit_quantity', OLD.id_unit_quantity, NEW.id_unit_quantity, NEW.id_change_set
		WHERE NOT OLD.id_unit_quantity <=> NEW.id_unit_quantity
    UNION
	-- Changed quantity_delivered
	SELECT NEW.id_link, 'quantity_delivered', OLD.quantity_delivered, NEW.quantity_delivered, NEW.id_change_set
		WHERE NOT OLD.quantity_delivered <=> NEW.quantity_delivered
    UNION
	-- Changed latency_delivery_days
	SELECT NEW.id_link, 'latency_delivery_days', OLD.latency_delivery_days, NEW.latency_delivery_days, NEW.id_change_set
		WHERE NOT OLD.latency_delivery_days <=> NEW.latency_delivery_days
    UNION
	-- Changed display_order
	SELECT NEW.id_link, 'display_order', OLD.display_order, NEW.display_order, NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    UNION
	-- Changed active
	SELECT NEW.id_link, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Customer_Sales_Order_Product_Link
BEFORE UPDATE ON Shop_Customer_Sales_Order_Product_Link
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Customer_Sales_Order_Product_Link();
