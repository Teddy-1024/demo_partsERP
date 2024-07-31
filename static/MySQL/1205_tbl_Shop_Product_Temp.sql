
# Products Temp

USE PARTSLTD_PROD;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Temp';

CREATE TABLE IF NOT EXISTS Shop_Product_Temp (
	id_product INT NOT NULL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	id_category INT NOT NULL,
    has_variations BIT NOT NULL,
    id_access_level_required INT NOT NULL,
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL
);
