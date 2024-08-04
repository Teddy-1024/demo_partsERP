
# Unit of Measurement Conversion



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Unit_Measurement_Conversion';

CREATE TABLE IF NOT EXISTS Shop_Unit_Measurement_Conversion (
    id_conversion INT NOT NULL PRIMARY KEY,
    id_unit_derived INT NOT NULL,
    id_unit_base INT NOT NULL,
    power_unit_base FLOAT NOT NULL,
    multiplier_unit_base FLOAT NOT NULL,
    increment_unit_base FLOAT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    created_on TIMESTAMP,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Unit_Measurement_Conversion_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
