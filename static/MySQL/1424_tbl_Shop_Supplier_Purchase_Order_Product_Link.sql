
# Supplier Purchase Order Product Link



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Purchase_Order_Product_Link';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Purchase_Order_Product_Link (
	id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_order INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_Product_Link_id_order
		FOREIGN KEY (id_order) 
        REFERENCES Shop_Supplier_Purchase_Order(id_order),
    id_permutation INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_Product_Link_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    -- id_currency_cost INT NOT NULL,
	id_unit_quantity INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_Product_Link_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	quantity_ordered FLOAT NOT NULL,
    quantity_received FLOAT NULL,
    latency_delivery_days INT NOT NULL,
	display_order INT NOT NULL,
    active BIT NOT NULL,
    cost_total_local_VAT_excl FLOAT NOT NULL,
	cost_total_local_VAT_incl FLOAT NOT NULL,
	cost_unit_local_VAT_excl FLOAT NOT NULL,
	cost_unit_local_VAT_incl FLOAT NOT NULL,
	created_on DATETIME,
	created_by INT,
	updated_last_on DATETIME NULL,
	created_last_by VARCHAR(100) NULL,
	id_change_set INT NULL,
	CONSTRAINT FK_Shop_Supplier_Purchase_Order_Product_Link_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);