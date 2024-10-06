
# Users



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User';

CREATE TABLE IF NOT EXISTS Shop_User (
    id_user INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user_auth0 VARCHAR(200) NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    email VARCHAR(254) NOT NULL,
    is_email_verified BIT NOT NULL DEFAULT 0,
    is_super_user BIT NOT NULL DEFAULT 0,
    id_currency_default INT NULL,
    id_region_default INT NULL,
    is_included_VAT_default BIT NOT NULL DEFAULT 1,
    active BIT NOT NULL DEFAULT 1,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_User_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);
