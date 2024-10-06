# Customer



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Customer';

CREATE TABLE IF NOT EXISTS Shop_Customer (
    id_customer INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_company VARCHAR(255) NOT NULL,
    name_contact VARCHAR(255) NULL,
    department_contact VARCHAR(255) NULL,
    id_address INT NOT NULL,
    CONSTRAINT FK_Shop_Customer_id_address
		FOREIGN KEY (id_address)
        REFERENCES Shop_Address(id_address),
	phone_number VARCHAR(50) NULL,
    email VARCHAR(255) NOT NULL,
    id_currency INT NOT NULL,
    CONSTRAINT FK_Shop_Customer_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency),
    active BIT NOT NULL DEFAULT 1,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Customer_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);
