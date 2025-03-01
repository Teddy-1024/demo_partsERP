
-- Supplier



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier';

CREATE TABLE IF NOT EXISTS Shop_Supplier (
    id_supplier INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name_company VARCHAR(255) NOT NULL,
    name_contact VARCHAR(255) NULL,
    department_contact VARCHAR(255) NULL,
    id_address INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_id_address
		FOREIGN KEY (id_address)
        REFERENCES Shop_Address(id_address),
	phone_number VARCHAR(50) NULL,
    fax VARCHAR(50) NULL,
    email VARCHAR(255) NOT NULL,
    website VARCHAR(255) NULL,
    id_currency INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Supplier_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);
