
# Product Price Audits

USE PARTSLTD_PROD;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Price_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Price_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_price INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Price_Audit_id_price
		FOREIGN KEY (id_price)
        REFERENCES Shop_Product_Price(id_price)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Price_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
