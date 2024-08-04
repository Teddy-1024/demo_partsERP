
# Product Price Temp



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Price_Temp';

CREATE TABLE IF NOT EXISTS Shop_Product_Price_Temp (
    id_price INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_permutation INT NULL,
    id_currency INT NOT NULL,
    id_region_purchase INT NOT NULL,
    price_local_VAT_incl FLOAT NULL,
    price_local_VAT_excl FLOAT NULL,
	id_stripe_price VARCHAR(200),
    active BIT NOT NULL DEFAULT 1
);