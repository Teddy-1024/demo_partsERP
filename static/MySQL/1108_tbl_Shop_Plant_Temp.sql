
# Plant Temp



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Plant_Temp';

CREATE TABLE IF NOT EXISTS Shop_Plant_Temp (
	id_plant INT NOT NULL PRIMARY KEY
    , code VARCHAR(50) NOT NULL
    , name VARCHAR(500) NOT NULL
    , id_address INT NOT NULL
    , id_user_manager INT NOT NULL
	, active BIT NOT NULL DEFAULT 1
    , guid BINARY(36) NOT NULL
);
