
# Currency Temp



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Currency_Temp';

CREATE TABLE IF NOT EXISTS Shop_Currency_Temp (
    id_currency INT NOT NULL PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(255) NOT NULL,
    symbol VARCHAR(1) NOT NULL,
    factor_from_GBP FLOAT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL
);