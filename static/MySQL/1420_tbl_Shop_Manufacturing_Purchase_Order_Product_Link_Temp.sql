
# Manufacturing Purchase Order Product Link Temp

-- DROP TABLE Shop_Manufacturing_Purchase_Order_Product_Link_Temp;
-- SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order_Product_Link_Temp';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order_Product_Link_Temp (
	id_link INT NOT NULL PRIMARY KEY,
    id_order INT NOT NULL,
    id_permutation INT NOT NULL,
	id_unit_quantity INT NOT NULL,
	quantity_used FLOAT NOT NULL,
    latency_manufacture_days INT NOT NULL,
	quantity_produced FLOAT NOT NULL,
	display_order INT NOT NULL,
    active BIT NOT NULL,
    cost_unit_local_VAT_excl FLOAT NULL,
    cost_unit_local_VAT_incl FLOAT NULL,
    price_unit_local_VAT_excl FLOAT NULL,
    price_unit_local_VAT_incl FLOAT NULL,
    GUID BINARY(36) NOT NULL
);
