
# Manufacturing Purchase Order

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order (
	id_order INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_order_temp INT NULL,
    /*
	cost_total_local FLOAT NOT NULL,
    id_currency_cost INT NOT NULL,
    */
    id_currency INT NOT NULL,
    CONSTRAINT FK_Manufacturing_Purchase_Order_id_currency
		FOREIGN KEY (id_currency) 
        REFERENCES Shop_Currency(id_currency),
    cost_total_local_VAT_excl FLOAT NULL,
    cost_total_local_VAT_incl FLOAT NULL,
    price_total_local_VAT_excl FLOAT NULL,
    price_total_local_VAT_incl FLOAT NULL,
    /*
    latency_delivery INT NOT NULL,
	quantity_ordered FLOAT NOT NULL,
	id_unit_quantity INT NOT NULL,
    CONSTRAINT FK_Shop_Manufacturing_Purchase_Order_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit),
    quantity_received INT NULL,
	display_order INT NOT NULL,
    */
    active BIT NOT NULL DEFAULT 1,
	created_on DATETIME,
	created_by INT,
	updated_last_on DATETIME NULL,
	created_last_by VARCHAR(100) NULL,
	id_change_set INT NULL,
	CONSTRAINT FK_Shop_Manufacturing_Purchase_Order_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);
