
# Stock Stock Item

USE PARTSLTD_PROD;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Stock_Item';

CREATE TABLE IF NOT EXISTS Shop_Stock_Item (
	id_stock INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_permutation INT NOT NULL,
	CONSTRAINT FK_Shop_Stock_Item_id_permutation
		FOREIGN KEY (id_permutation)
		REFERENCES Shop_Product_Permutation(id_permutation),
	date_purchased DATETIME NOT NULL,
    date_received DATETIME NULL,
    id_location_storage INT NOT NULL,
    CONSTRAINT FK_Shop_Stock_Item_id_location_storage
		FOREIGN KEY (id_location_storage)
        REFERENCES Shop_Storage_Location(id_location),
    id_currency_cost INT NOT NULL,
    CONSTRAINT FK_Shop_Stock_Item_id_currency
		FOREIGN KEY (id_currency_cost)
        REFERENCES Shop_Currency(id_currency),
    cost_local_VAT_incl FLOAT NOT NULL,
    cost_local_VAT_excl FLOAT NOT NULL,
    is_sealed BIT NOT NULL DEFAULT 1,
    date_unsealed DATETIME NULL,
	date_expiration DATETIME NOT NULL,
    is_consumed BIT NOT NULL DEFAULT 0,
    date_consumed DATETIME NULL,
	active BIT NOT NULL DEFAULT 1,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_Stock_Item_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
