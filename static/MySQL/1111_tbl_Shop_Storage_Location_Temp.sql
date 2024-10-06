
# Storage Location Temp



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Storage_Location_Temp';

CREATE TABLE IF NOT EXISTS Shop_Storage_Location (
	id_location INT NOT NULL PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(500) NOT NULL,
	active BIT NOT NULL DEFAULT 1
);
