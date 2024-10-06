
# Storage Location Branch Temp



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Storage_Location_Branch_Temp';

CREATE TABLE IF NOT EXISTS Shop_Storage_Location_Branch_Temp (
	id_branch INT NOT NULL PRIMARY KEY,
    id_location_parent INT NOT NULL,
    id_location_child INT NOT NULL,
    -- depth INT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL
);