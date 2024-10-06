
-- Recurrence Interval Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Interval_Recurrence_Audit';

CREATE TABLE IF NOT EXISTS Shop_Interval_Recurrence_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_interval INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Interval_Recurrence_Audit_id_interval
		FOREIGN KEY (id_interval)
		REFERENCES Shop_Interval_Recurrence(id_interval)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(256),
	value_new VARCHAR(256),
	id_change_set INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Interval_Recurrence_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
