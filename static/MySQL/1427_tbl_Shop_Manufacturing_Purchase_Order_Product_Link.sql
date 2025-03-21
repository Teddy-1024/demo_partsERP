
# Manufacturing Purchase Order Product Link

-- DROP TABLE demo.Shop_Manufacturing_Purchase_Order_Product_Link_Audit
-- DROP TABLE demo.Shop_Manufacturing_Purchase_Order_Product_Link

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order_Product_Link';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order_Product_Link (
	id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    , id_order INT NOT NULL
    , CONSTRAINT FK_Manufacturing_Purchase_Order_Product_Link_id_order
		FOREIGN KEY (id_order) 
        REFERENCES demo.Shop_Manufacturing_Purchase_Order(id_order)
    , id_permutation INT NOT NULL
    , CONSTRAINT FK_Manufacturing_Purchase_Order_Product_Link_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES demo.Shop_Product_Permutation(id_permutation)
    , cost_unit_local_VAT_excl FLOAT NULL
    , cost_unit_local_VAT_incl FLOAT NULL
    , price_unit_local_VAT_excl FLOAT NULL
    , price_unit_local_VAT_incl FLOAT NULL
	, id_unit_quantity INT NOT NULL
    , CONSTRAINT FK_Manufacturing_Purchase_Order_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES demo.Shop_Unit_Measurement(id_unit_measurement)
	, quantity_used FLOAT NULL
	, quantity_produced FLOAT NULL
	, id_unit_latency_manufacture INT NULL
	, CONSTRAINT FK_MPO_id_unit_latency_manufacture
		FOREIGN KEY (id_unit_latency_manufacture)
		REFERENCES demo.Shop_Unit_Measurement(id_unit_measurement)
    , latency_manufacture INT NULL
	, display_order INT NOT NULL
    , active BIT NOT NULL
	, created_on DATETIME
	, created_by INT
	, updated_last_on DATETIME NULL
	, created_last_by VARCHAR(100) NULL
	, id_change_set INT NULL
	, CONSTRAINT FK_Manufacturing_Purchase_Order_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES demo.Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);
