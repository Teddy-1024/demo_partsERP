
-- Currencies



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Currency';

CREATE TABLE IF NOT EXISTS Shop_Currency (
    id_currency INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(255) NOT NULL,
    symbol VARCHAR(1) NOT NULL,
    factor_from_GBP REAL NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    display_order INTEGER NOT NULL,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Currency_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);