
# Products



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_product INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Audit_id_product
		FOREIGN KEY (id_product)
		REFERENCES Shop_Product(id_product)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(500),
	value_new VARCHAR(500),
	id_change_set INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);