
# Discounts

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Discount';

CREATE TABLE Shop_Discount (
	id_discount INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
	id_product INT NOT NULL,
	CONSTRAINT FK_Shop_Discount_id_product
		FOREIGN KEY (id_product) 
		REFERENCES Shop_Product(id_product),
    id_permutation INT,
    CONSTRAINT FK_Shop_Discount_id_permutation
		FOREIGN KEY (id_permutation)
        REFERENCES Shop_Product_Permutation(id_permutation)
        ON UPDATE RESTRICT,
	/*
     id_delivery_region INT,
    CONSTRAINT FK_Shop_Discount_id_delivery_region
		FOREIGN KEY (id_delivery_region)
        REFERENCES Shop_Delivery_Region(id_region)
        ON UPDATE RESTRICT,
    id_currency INT,
    CONSTRAINT FK_Shop_Discount_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
        ON UPDATE RESTRICT,
	*/
	multiplier FLOAT NOT NULL DEFAULT 1 CHECK (multiplier > 0),
    subtractor FLOAT NOT NULL DEFAULT 0,
    apply_multiplier_first BIT DEFAULT 1,
	quantity_min FLOAT NOT NULL DEFAULT 0,
    quantity_max FLOAT NOT NULL,
    date_start DATETIME NOT NULL,
    date_end DATETIME NOT NULL,
	active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_Discount_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
