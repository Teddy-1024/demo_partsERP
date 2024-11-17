
# Users Temp

-- DROP TABLE IF EXISTS Shop_User_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Temp';

CREATE TABLE IF NOT EXISTS Shop_User_Temp (
    id_temp INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    , id_user INT NOT NULL
    , id_user_auth0 VARCHAR(200) NOT NULL
    , firstname VARCHAR(255)
    , surname VARCHAR(255)
    , email VARCHAR(254)
    , is_email_verified BIT
    , is_super_user BIT
    , id_currency_default INT
    , id_region_default INT
    , is_included_VAT_default BIT
    , active BIT
    , guid BINARY(36) NOT NULL
);
