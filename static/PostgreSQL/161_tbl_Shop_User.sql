
-- Users



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User';

CREATE TABLE IF NOT EXISTS Shop_User (
    id_user INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_user_oauth VARCHAR(200) NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(254) NOT NULL,
    is_email_verified BOOLEAN NOT NULL DEFAULT FALSE,
    is_super_user BOOLEAN NOT NULL DEFAULT FALSE,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_User_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);
