
# User Order Audits
USE PARTSLTD_PROD;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Order_Audit';

CREATE TABLE IF NOT EXISTS Shop_User_Order_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_order INT NOT NULL,
	CONSTRAINT FK_Shop_User_Order_Audit_id_order
		FOREIGN KEY (id_order)
		REFERENCES Shop_User_Order(id_order)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(500),
	value_new VARCHAR(500),
	id_change_set_user INT,
	CONSTRAINT FK_Shop_User_Order_Audit_id_change_set_user
		FOREIGN KEY (id_change_set_user)
		REFERENCES Shop_User_Change_Set(id_change_set)
	/*
	id_change_set_product INT,
	CONSTRAINT FK_Shop_User_Basket_Audit_id_change_set_product
		FOREIGN KEY (id_change_set_product)
		REFERENCES Shop_Product_Change_Set(id_change_set)
	*/
);
