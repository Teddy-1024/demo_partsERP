
# User Order Product link

USE PARTSLTD_PROD;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Order_Product_Link';

CREATE TABLE IF NOT EXISTS Shop_User_Order_Product_Link (
    id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_order INT NOT NULL,
    CONSTRAINT FK_Shop_User_Order_Product_Link_id_order
		FOREIGN KEY (id_order)
        REFERENCES Shop_User_Order(id_order)
        ON UPDATE RESTRICT,
    id_product INT NOT NULL,
    CONSTRAINT FK_Shop_User_Order_Product_Link_id_product
		FOREIGN KEY (id_product)
        REFERENCES Shop_Product(id_product)
        ON UPDATE RESTRICT,
    id_permutation INT NULL,
    CONSTRAINT FK_Shop_User_Order_Product_Link_id_permutation
		FOREIGN KEY (id_permutation)
        REFERENCES Shop_Product_Permutation(id_permutation)
        ON UPDATE RESTRICT,
	quantity FLOAT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_User_Order_Product_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);