
# Stock Stock Item Temp

DROP TABLE IF EXISTS Shop_Stock_Item_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Stock_Item_Temp';

CREATE TABLE IF NOT EXISTS Shop_Stock_Item_Temp (
	id_stock INT NULL
    -- , id_category INT NULL
    , id_product INT NOT NULL
	, id_permutation INT NULL
    , id_pairs_variations VARCHAR(4000) NULL
	, date_purchased DATETIME NOT NULL
    , date_received DATETIME NULL
    , id_location_storage INT NOT NULL
    , id_currency_cost INT NOT NULL
    , cost_local_VAT_incl FLOAT NOT NULL
    , cost_local_VAT_excl FLOAT NOT NULL
    , is_sealed BIT NOT NULL
    , date_unsealed DATETIME NULL
	, date_expiration DATETIME NULL
    , is_consumed BIT NOT NULL
    , date_consumed DATETIME NULL
	, active BIT NOT NULL
    , guid BINARY(36) NOT NULL
);
