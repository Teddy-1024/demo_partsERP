
-- Manufacturing Purchase Order Product Link Temp



-- DROP TABLE Shop_Manufacturing_Purchase_Order_Product_Link_Temp;
-- SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order_Product_Link_Temp';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order_Product_Link_Temp (
	id_link INTEGER NOT NULL PRIMARY KEY,
    GUID UUID NOT NULL,
    id_order INTEGER NOT NULL,
    /*
    CONSTRAINT FK_Manuf_Purch_Order_Product_Link_Temp_id_order
		FOREIGN KEY (id_order) 
        REFERENCES Shop_Manufacturing_Purchase_Order(id_order),
	*/
    id_permutation INTEGER NOT NULL,
    CONSTRAINT FK_Manuf_Purch_Order_Product_Link_Temp_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    cost_total_local REAL NOT NULL,
    id_currency_cost INTEGER NOT NULL,
	quantity_used REAL NOT NULL,
	id_unit_quantity INTEGER NOT NULL,
    CONSTRAINT FK_Manuf_Purch_Order_Product_Link_Temp_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement),
    quantity_produced REAL NULL,
    latency_manufacture_days INTEGER NOT NULL,
	display_order INTEGER NOT NULL,
    active BOOLEAN NOT NULL
);