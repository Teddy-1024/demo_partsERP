
# Manufacturing Purchase Order Product Link Temp

-- DROP TABLE Shop_Manufacturing_Purchase_Order_Product_Link_Temp;
-- SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order_Product_Link_Temp';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order_Product_Link_Temp (
	id_link INT NOT NULL PRIMARY KEY,
    id_order INT NOT NULL,
    id_product INT NULL,
    id_permutation INT NULL,
    csv_list_variations VARCHAR(4000) NULL,
	id_unit_quantity INT NOT NULL,
	quantity_used FLOAT NULL,
	quantity_produced FLOAT NULL,
    id_unit_latency_manufacture INT NULL,
    latency_manufacture INT NULL,
	display_order INT NOT NULL,
    active BIT NOT NULL,
    cost_unit_local_VAT_excl FLOAT NULL,
    cost_unit_local_VAT_incl FLOAT NULL,
    price_unit_local_VAT_excl FLOAT NULL,
    price_unit_local_VAT_incl FLOAT NULL,
    GUID BINARY(36) NOT NULL
);
