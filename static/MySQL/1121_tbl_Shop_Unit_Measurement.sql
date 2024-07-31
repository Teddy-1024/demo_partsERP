
# Unit of Measurement

USE PARTSLTD_PROD;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Unit_Measurement';

CREATE TABLE IF NOT EXISTS Shop_Unit_Measurement (
    id_unit_measurement INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_singular VARCHAR(255) NOT NULL,
    name_plural VARCHAR(256) NOT NULL,
    symbol VARCHAR(50) NOT NULL,
    is_base_unit BIT NOT NULL DEFAULT 0,
    is_unit_of_distance BIT NOT NULL DEFAULT 0,
    is_unit_of_mass BIT NOT NULL DEFAULT 0,
    is_unit_of_time BIT NOT NULL DEFAULT 0,
    is_unit_of_volume BIT NOT NULL DEFAULT 0,
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Unit_Measurement_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
