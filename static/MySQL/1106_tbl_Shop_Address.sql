
# Addresses


SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Address';

CREATE TABLE Shop_Address (
    id_address INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_region INT NOT NULL,
    postcode VARCHAR(20) NOT NULL,
    address_line_1 VARCHAR(256) NOT NULL,
    address_line_2 VARCHAR(256) NOT NULL,
    city VARCHAR(256) NOT NULL,
    county VARCHAR(256) NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Address_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);