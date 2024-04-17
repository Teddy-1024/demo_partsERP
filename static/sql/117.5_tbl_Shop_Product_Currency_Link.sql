
# Product Currency link

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Currency_Link';

CREATE TABLE IF NOT EXISTS Shop_Product_Currency_Link (
    id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_product INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Link_id_product
		FOREIGN KEY (id_product)
        REFERENCES Shop_Product(id_product)
        ON UPDATE RESTRICT,
    id_permutation INT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Link_id_permutation
		FOREIGN KEY (id_permutation)
        REFERENCES Shop_Product_Permutation(id_permutation)
        ON UPDATE RESTRICT,
    id_currency INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Link_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
        ON UPDATE RESTRICT,
    id_region_purchase INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Link_id_region_purchase
		FOREIGN KEY (id_region_purchase)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    price_local_VAT_incl FLOAT NULL,
    price_local_VAT_excl FLOAT NULL,
	id_stripe_price VARCHAR(200),
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Product_Currency_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);