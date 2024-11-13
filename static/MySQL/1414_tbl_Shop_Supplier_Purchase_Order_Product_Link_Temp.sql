
# Supplier Purchase Order Product Link Temp



-- drop table Shop_Supplier_Purchase_Order_Product_Link_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Purchase_Order_Product_Link_Temp';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Purchase_Order_Product_Link_Temp (
    id_temp INT NOT NULL AUTO_INCREMENT PRIMARY KEY
	, id_link INT NOT NULL
    , id_order INT NOT NULL
    , id_product INT NULL
    , id_permutation INT NULL
    , csv_list_variations VARCHAR(4000) NULL
	, id_unit_quantity INT NOT NULL
	, quantity_ordered FLOAT NOT NULL
    , quantity_received FLOAT NULL
    , latency_delivery_days INT NOT NULL
	, display_order INT NOT NULL
    , active BIT NOT NULL
    , cost_total_local_VAT_excl FLOAT NOT NULL
    , cost_total_local_VAT_incl FLOAT NOT NULL
    , GUID BINARY(36) NOT NULL
);
