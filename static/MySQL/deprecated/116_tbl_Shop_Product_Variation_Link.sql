
# Product Variation Link



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Variation_Link';

CREATE TABLE IF NOT EXISTS Shop_Product_Variation_Link (
	id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_product INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Variation_Link_id_product
		FOREIGN KEY (id_product)
		REFERENCES Shop_Product(id_product)
		ON UPDATE RESTRICT,
	id_variation INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Variation_Link_id_variation
		FOREIGN KEY (id_variation)
		REFERENCES Shop_Variation(id_variation)
		ON UPDATE RESTRICT,
    /*
	id_product_variation_type_link INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Variation_Link_id_product_variation_type_link
		FOREIGN KEY (id_product_variation_type_link)
		REFERENCES Shop_Product_Variation_Type_Link(id_link)
		ON UPDATE RESTRICT,
	*/
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on DATETIME,
	created_by INT,
	id_change_set INT,
	CONSTRAINT FK_Shop_Product_Variation_Link_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
