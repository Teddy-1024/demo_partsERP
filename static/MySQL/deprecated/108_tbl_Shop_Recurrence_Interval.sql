
# Recurrence Interval



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Interval_Recurrence';

CREATE TABLE IF NOT EXISTS Shop_Interval_Recurrence (
	id_interval INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50),
	name VARCHAR(255),
	name_plural VARCHAR(256),
    active BIT NOT NULL DEFAULT 1,
	created_on TIMESTAMP,
	created_by INT,
	id_change_set INT,
	CONSTRAINT FK_Shop_Interval_Recurrence_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
