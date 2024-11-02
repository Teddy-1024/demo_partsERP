
# Supplier

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier';

CREATE TABLE IF NOT EXISTS Shop_Supplier (
    id_supplier INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    , name_company VARCHAR(255) NOT NULL
    , name_contact VARCHAR(255) NULL
    , department_contact VARCHAR(255) NULL
    /*
    id_address INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_id_address
        FOREIGN KEY (id_address)
        REFERENCES Shop_Address(id_address),
    */
    , phone_number VARCHAR(50) NULL
    , fax VARCHAR(50) NULL
    , email VARCHAR(255) NOT NULL
    , website VARCHAR(255) NULL
    , id_currency INT NOT NULL
    , CONSTRAINT FK_Shop_Supplier_id_currency
        FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
    , active BIT NOT NULL DEFAULT 1
    , created_on DATETIME
    , created_by INT
    , id_change_set INT
    , CONSTRAINT FK_Shop_Supplier_id_change_set
        FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
	, id_supplier_temp INT NOT NULL
);
