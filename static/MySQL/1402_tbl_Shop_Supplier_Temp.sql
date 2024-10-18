
# Supplier Staging

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Temp';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Temp (
    id_supplier INT NOT NULL,
    name_company VARCHAR(255) NOT NULL,
    name_contact VARCHAR(255) NULL,
    department_contact VARCHAR(255) NULL,
    -- id_address INT NOT NULL,
    phone_number VARCHAR(50) NULL,
    fax VARCHAR(50) NULL,
    email VARCHAR(255) NOT NULL,
    website VARCHAR(255) NULL,
    id_currency INT NOT NULL,
    active BIT NULL,
    GUID BINARY(36) NOT NULL
);
