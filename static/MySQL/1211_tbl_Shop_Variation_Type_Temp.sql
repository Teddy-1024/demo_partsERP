
# Variation Types Temp

-- DROP TABLE demo.Shop_Variation_Type_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Variation_Type_Temp';

CREATE TABLE IF NOT EXISTS Shop_Variation_Type_Temp (
	id_temp INT NOT NULL PRIMARY KEY AUTO_INCREMENT
	, id_type INT NOT NULL
	-- , id_type_temp INT NOT NULL
	, code VARCHAR(50)
	, name VARCHAR(255)
	, name_plural VARCHAR(256)
	, active BIT NULL
	, display_order INT NOT NULL
	, created_on DATETIME
	, created_by INT
    , guid BINARY(36) NOT NULL
);