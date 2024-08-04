
# User Order

USE PARTSLTD_PROD;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Order';

CREATE TABLE IF NOT EXISTS Shop_User_Order (
	id_order INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_user INT NOT NULL,
	CONSTRAINT FK_Shop_User_Order_id_user
		FOREIGN KEY (id_user)
		REFERENCES Shop_User(id_user)
		ON UPDATE RESTRICT,
	value_total FLOAT,
	id_order_status INT NOT NULL,
	CONSTRAINT FK_Shop_User_Order_id_order_status
		FOREIGN KEY (id_order_status)
		REFERENCES Shop_User_Order_Status(id_status),
	id_checkout_session VARCHAR(200) NOT NULL,
	id_currency INT NOT NULL,
	CONSTRAINT FK_Shop_User_Order_id_currency
		FOREIGN KEY (id_currency)
		REFERENCES Shop_Currency(id_currency)
		ON UPDATE RESTRICT,
	active BIT NOT NULL DEFAULT 1,
	created_on TIMESTAMP,
	created_by VARCHAR(100),
	id_change_set_user INT,
	CONSTRAINT FK_Shop_User_Order_id_change_set_user
		FOREIGN KEY (id_change_set_user)
		REFERENCES Shop_User_Change_Set(id_change_set)
        /*
	id_change_set_product INT,
	CONSTRAINT FK_Shop_User_Basket_id_change_set_product
		FOREIGN KEY (id_change_set_product)
		REFERENCES Shop_Product_Change_Set(id_change_set)
        */
);
