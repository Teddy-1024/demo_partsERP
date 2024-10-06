
# Products Temp

-- DROP TABLE IF EXISTS Shop_Product_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Temp';

CREATE TABLE IF NOT EXISTS Shop_Product_Temp (
	id_product INT NOT NULL
	, name VARCHAR(255) NOT NULL
	, id_category INT NOT NULL
    , has_variations BIT NOT NULL
    , id_access_level_required INT NOT NULL
	, display_order INT NOT NULL
	, active BIT NOT NULL DEFAULT 1
	, can_view BIT NULL DEFAULT NULL
	, can_edit BIT NULL DEFAULT NULL
	, can_admin BIT NULL DEFAULT NULL
    , guid BINARY(36) NOT NULL
);
