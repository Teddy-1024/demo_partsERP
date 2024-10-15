
# Supplier Purchase Order Staging

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Purchase_Order_Temp';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Purchase_Order_Temp (
	id_order INT NOT NULL,
    id_supplier_ordered INT NOT NULL,
    id_currency_cost INT NOT NULL,
    active BIT NULL
);
