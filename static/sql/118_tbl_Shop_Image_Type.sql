
# Image Types

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Image_Type';

CREATE TABLE IF NOT EXISTS Shop_Image_Type (
	id_type INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50),
	name VARCHAR(255),
	name_plural VARCHAR(256),
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_Image_Type_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);