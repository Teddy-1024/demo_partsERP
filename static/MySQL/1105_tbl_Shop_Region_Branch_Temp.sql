
# Region Branch Temp

USE PARTSLTD_PROD;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Region_Branch_Temp';

CREATE TABLE IF NOT EXISTS Shop_Region_Branch_Temp (
	id_branch INT NOT NULL PRIMARY KEY,
    id_region_parent INT NOT NULL,
    id_region_child INT NOT NULL,
    -- depth INT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL
);