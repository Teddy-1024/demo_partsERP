
# Supplier Addresses Staging

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Address_Temp';

CREATE TABLE Shop_Supplier_Address_Temp (
    id_address INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    , id_supplier INT NOT NULL
    , id_region INT NOT NULL
    , postcode VARCHAR(20) NOT NULL
    , address_line_1 VARCHAR(256) NOT NULL
    , address_line_2 VARCHAR(256) NOT NULL
    , city VARCHAR(256) NOT NULL
    , county VARCHAR(256) NOT NULL
    , active BIT NOT NULL DEFAULT 1
    , GUID BINARY(36) NOT NULL
);