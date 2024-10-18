
# Manufacturing Purchase Order Temp

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order_Temp';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order_Temp (
	id_order INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    /*
	cost_total_local FLOAT NOT NULL,
    */
    id_currency_cost INT NOT NULL,
    cost_total_local_VAT_excl FLOAT NOT NULL,
    cost_total_local_VAT_incl FLOAT NOT NULL,
    price_total_local_VAT_excl FLOAT NOT NULL,
    price_total_local_VAT_incl FLOAT NOT NULL,
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
    GUID BINARY(36) NOT NULL
);
