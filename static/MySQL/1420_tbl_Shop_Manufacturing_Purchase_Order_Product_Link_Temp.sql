
# Manufacturing Purchase Order Product Link Temp

USE PARTSLTD_PROD;

-- DROP TABLE Shop_Manufacturing_Purchase_Order_Product_Link_Temp;
-- SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order_Product_Link_Temp';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order_Product_Link_Temp (
	id_link INT NOT NULL PRIMARY KEY,
    GUID BINARY(36) NOT NULL,
    id_order INT NOT NULL,
    /*
    CONSTRAINT FK_Manuf_Purch_Order_Product_Link_Temp_id_order
		FOREIGN KEY (id_order) 
        REFERENCES Shop_Manufacturing_Purchase_Order(id_order),
	*/
    id_permutation INT NOT NULL,
    CONSTRAINT FK_Manuf_Purch_Order_Product_Link_Temp_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    cost_total_local FLOAT NOT NULL,
    id_currency_cost INT NOT NULL,
	quantity_used FLOAT NOT NULL,
	id_unit_quantity INT NOT NULL,
    CONSTRAINT FK_Manuf_Purch_Order_Product_Link_Temp_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement),
    quantity_produced FLOAT NULL,
    latency_manufacture_days INT NOT NULL,
	display_order INT NOT NULL,
    active BIT NOT NULL
);
