
# Variations Temp

-- DROP TABLE partsltd_prod.Shop_Variation_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Variation_Temp';

CREATE TABLE Shop_Variation_Temp (
	id_temp INT NOT NULL PRIMARY KEY AUTO_INCREMENT
	, id_variation INT NOT NULL
	, id_type INT NOT NULL
	, code VARCHAR(50)
	, name VARCHAR(255)
	, active BIT
	, display_order INT NOT NULL
	, created_on DATETIME
	, created_by INT
	, guid BINARY(36)
);
