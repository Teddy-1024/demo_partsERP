
-- Delivery Option



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation_Delivery_Option_Link';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation_Delivery_Option_Link (
    id_link INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_product INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_Permutation_Delivery_Option_Link_id_product
		FOREIGN KEY (id_product)
        REFERENCES Shop_Product(id_product)
        ON UPDATE RESTRICT,
    id_permutation INTEGER,
    CONSTRAINT FK_Shop_Product_Permutation_Delivery_Option_Link_id_permutation
		FOREIGN KEY (id_permutation)
        REFERENCES Shop_Product_Permutation(id_permutation)
        ON UPDATE RESTRICT,
    id_delivery_option INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_Permutation_Delivery_Option_Link_id_delivery_option
		FOREIGN KEY (id_delivery_option)
        REFERENCES Shop_Delivery_Option(id_option)
        ON UPDATE RESTRICT,
    id_region INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_Permutation_Delivery_Option_Link_id_region
		FOREIGN KEY (id_region)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    id_currency INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_Permutation_Delivery_Option_Link_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
        ON UPDATE RESTRICT,
	price_local REAL NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    display_order INTEGER NOT NULL,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Product_Permutation_Delivery_Option_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);