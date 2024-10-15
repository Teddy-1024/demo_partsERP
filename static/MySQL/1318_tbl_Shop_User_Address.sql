
# User Addresses

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Address';

CREATE TABLE Shop_User_Address (
    id_user_address INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    CONSTRAINT FK_Shop_Address_id_user
		FOREIGN KEY (id_user)
        REFERENCES Shop_User(id_user)
        ON UPDATE RESTRICT,
    -- region VARCHAR(100) NOT NULL,
    id_region INT NOT NULL,
    name_full VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    postcode VARCHAR(20) NOT NULL,
    address_line_1 VARCHAR(256) NOT NULL,
    address_line_2 VARCHAR(256) NOT NULL,
    city VARCHAR(256) NOT NULL,
    county VARCHAR(256) NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_User_Address_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);