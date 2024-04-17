
# Product Variation Type Link Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Variation_Type_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Variation_Type_Link_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_link INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Variation_Type_Link_Audit_id_link
		FOREIGN KEY (id_link)
		REFERENCES Shop_Product_Variation_Type_Link(id_link)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(500),
	value_new VARCHAR(500),
	id_change_set INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Variation_Type_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
		ON UPDATE RESTRICT
);
