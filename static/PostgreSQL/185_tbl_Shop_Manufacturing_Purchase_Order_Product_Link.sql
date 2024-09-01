
-- Manufacturing Purchase Order Product Link



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order_Product_Link';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order_Product_Link (
	id_link INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_order INTEGER NOT NULL,
    CONSTRAINT FK_Manufacturing_Purchase_Order_Product_Link_id_order
		FOREIGN KEY (id_order) 
        REFERENCES Shop_Manufacturing_Purchase_Order(id_order),
    id_permutation INTEGER NOT NULL,
    CONSTRAINT FK_Manufacturing_Purchase_Order_Product_Link_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    cost_total_local REAL NOT NULL,
    id_currency_cost INTEGER NOT NULL,
    value_produced_total_local REAL NOT NULL,
	quantity_used REAL NOT NULL,
	id_unit_quantity INTEGER NOT NULL,
    CONSTRAINT FK_Manufacturing_Purchase_Order_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement),
    latency_manufacture_days INTEGER NOT NULL,
	quantity_produced REAL NOT NULL,
	display_order INTEGER NOT NULL,
    active BOOLEAN NOT NULL,
	created_on TIMESTAMP,
	created_by INT,
	updated_last_on TIMESTAMP NULL,
	created_last_by VARCHAR(100) NULL,
	id_change_set INTEGER NULL,
	CONSTRAINT FK_Manufacturing_Purchase_Order_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);
