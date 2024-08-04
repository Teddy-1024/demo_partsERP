
# Stock Stock Item Temp

USE PARTSLTD_PROD;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Stock_Item_Temp';

CREATE TABLE IF NOT EXISTS Shop_Stock_Item_Temp (
	id_stock INT NOT NULL PRIMARY KEY,
	id_permutation INT NOT NULL,
	date_purchased TIMESTAMP NOT NULL,
    id_location_storage INT NOT NULL,
    id_currency INT NOT NULL,
    cost_local_VAT_incl FLOAT NOT NULL,
    cost_local_VAT_excl FLOAT NOT NULL,
    is_sealed BIT NOT NULL DEFAULT 1,
    date_unsealed TIMESTAMP NULL,
	date_expiration TIMESTAMP NULL,
    is_consumed BIT NOT NULL DEFAULT 0,
    date_consumed TIMESTAMP NULL,
	active BIT NOT NULL DEFAULT 1
);
