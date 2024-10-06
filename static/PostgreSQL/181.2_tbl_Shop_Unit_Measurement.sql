
-- Unit of Measurement



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Unit_Measurement';

CREATE TABLE IF NOT EXISTS Shop_Unit_Measurement (
    id_unit_measurement INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name_singular VARCHAR(255) NOT NULL,
    name_plural VARCHAR(256) NOT NULL,
    symbol VARCHAR(50) NOT NULL,
    is_base_unit BOOLEAN NOT NULL DEFAULT FALSE,
	
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Unit_Measurement_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
