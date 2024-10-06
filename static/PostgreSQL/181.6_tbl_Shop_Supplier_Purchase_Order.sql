
-- Supplier Purchase Order



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Purchase_Order';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Purchase_Order (
	id_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_supplier_ordered INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_id_supplier_ordered
		FOREIGN KEY (id_supplier_ordered) 
        REFERENCES Shop_Supplier(id_supplier),
	/*
    id_supplier_fulfilled INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_id_supplier_fulfilled
		FOREIGN KEY (id_supplier_fulfilled) 
        REFERENCES Shop_Supplier(id_supplier),
	*/
    cost_total_local REAL NOT NULL,
    id_currency_cost INTEGER NOT NULL,
    /*
    latency_delivery INTEGER NOT NULL,
	quantity_ordered REAL NOT NULL,
	id_unit_quantity INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit),
    -- quantity_received INTEGER NULL,
	display_order INTEGER NOT NULL,
    */
    active BOOLEAN NOT NULL DEFAULT TRUE,
	created_on TIMESTAMP,
	created_by INT,
	updated_last_on TIMESTAMP NULL,
	created_last_by VARCHAR(100) NULL,
	id_change_set INTEGER NULL,
	CONSTRAINT FK_Shop_Supplier_Purchase_Order_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);
