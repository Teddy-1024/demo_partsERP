
-- Customer Sales Purchase Order



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Customer_Sales_Order';

CREATE TABLE IF NOT EXISTS Shop_Customer_Sales_Order (
	id_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_customer INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_id_customer
		FOREIGN KEY (id_customer)
        REFERENCES Shop_Customer(id_customer),
	price_total_local REAL NOT NULL,
    id_currency_price INTEGER NOT NULL,
    /*
    latency_delivery INTEGER NOT NULL,
	quantity_ordered REAL NOT NULL,
	id_unit_quantity INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit),
    quantity_received INTEGER NULL,
	display_order INTEGER NOT NULL,
    */
    active BOOLEAN NOT NULL DEFAULT TRUE,
	created_on TIMESTAMP,
	created_by INT,
	updated_last_on TIMESTAMP NULL,
	created_last_by VARCHAR(100) NULL,
	id_change_set INTEGER NULL,
	CONSTRAINT FK_Shop_Customer_Sales_Order_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);
