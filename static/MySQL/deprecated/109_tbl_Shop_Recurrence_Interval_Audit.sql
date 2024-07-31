
# Recurrence Interval Audits

USE PARTSLTD_PROD;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Recurrence_Interval_Audit';

CREATE TABLE IF NOT EXISTS Shop_Recurrence_Interval_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_interval INT NOT NULL,
	CONSTRAINT FK_Shop_Recurrence_Interval_Audit_id_interval
		FOREIGN KEY (id_interval)
		REFERENCES Shop_Recurrence_Interval(id_interval)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(256),
	value_new VARCHAR(256),
	id_change_set INT NOT NULL,
	CONSTRAINT FK_Shop_Recurrence_Interval_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
