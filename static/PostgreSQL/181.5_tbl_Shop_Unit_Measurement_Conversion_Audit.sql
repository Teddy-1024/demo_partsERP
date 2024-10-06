
-- Unit of Measurement Conversion Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Unit_Measurement_Conversion_Audit';

CREATE TABLE IF NOT EXISTS Shop_Unit_Measurement_Conversion_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_conversion INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Unit_Measurement_Conversion_Audit_id_conversion
		FOREIGN KEY (id_conversion)
        REFERENCES Shop_Unit_Measurement_Conversion(id_conversion)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(100),
    value_new VARCHAR(100),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Unit_Measurement_Conversion_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
