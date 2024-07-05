
-- Recurrence Interval



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Recurrence_Interval';

CREATE TABLE IF NOT EXISTS Shop_Recurrence_Interval (
	id_interval INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	code VARCHAR(50),
	name VARCHAR(255),
	name_plural VARCHAR(256),
    active BOOLEAN NOT NULL DEFAULT TRUE,
	created_on TIMESTAMP,
	created_by VARCHAR(100),
	id_change_set INTEGER,
	CONSTRAINT FK_Shop_Recurrence_Interval_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
