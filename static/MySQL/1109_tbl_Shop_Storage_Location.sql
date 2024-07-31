
# Storage Location

USE PARTSLTD_PROD;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Storage_Location';

CREATE TABLE IF NOT EXISTS Shop_Storage_Location (
	id_location INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_plant INT NOT NULL,
    CONSTRAINT FK_Shop_Storage_Location_id_plant
		FOREIGN KEY (id_plant)
        REFERENCES Shop_Plant(id_plant),
    code VARCHAR(50) NOT NULL,
    name VARCHAR(500) NOT NULL,
	active BIT NOT NULL DEFAULT 1,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_Storage_Location_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
