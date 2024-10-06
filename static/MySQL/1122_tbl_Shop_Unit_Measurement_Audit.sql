
# Unit of Measurement Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Unit_Measurement_Audit';

CREATE TABLE IF NOT EXISTS Shop_Unit_Measurement_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_unit_measurement INT NOT NULL,
    CONSTRAINT FK_Shop_Unit_Measurement_Audit_id_unit_measurement
		FOREIGN KEY (id_unit_measurement)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Unit_Measurement_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
