
# Categories Temp

-- DROP TABLE Shop_Product_Category_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Category_Temp';

CREATE TABLE IF NOT EXISTS Shop_Product_Category_Temp (
	id_category INT NOT NULL
	, code VARCHAR(50) NOT NULL
	, name VARCHAR(255) NOT NULL
	, description VARCHAR(4000) NULL
	, active BIT NOT NULL
	, display_order INT NOT NULL
    , id_access_level_required INT NOT NULL DEFAULT 1
    , guid BINARY(36) NOT NULL
);
