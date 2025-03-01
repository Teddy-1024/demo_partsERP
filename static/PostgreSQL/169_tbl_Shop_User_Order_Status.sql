
-- User Order Types



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Order_Status';

CREATE TABLE IF NOT EXISTS Shop_User_Order_Status (
	id_status INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	code VARCHAR(50),
	name VARCHAR(255),
	name_plural VARCHAR(256),
	active BOOLEAN NOT NULL DEFAULT TRUE,
	display_order INTEGER NOT NULL,
	created_on TIMESTAMP,
	created_by INT,
	id_change_set INTEGER,
	CONSTRAINT FK_Shop_User_Order_Status_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_User_Change_Set(id_change_set)
);
