
# Categories

USE PARTSLTD_PROD;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Category';

CREATE TABLE IF NOT EXISTS Shop_Category (
	id_category INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50),
	name VARCHAR(255),
	description VARCHAR(4000),
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on TIMESTAMP,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_Category_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
