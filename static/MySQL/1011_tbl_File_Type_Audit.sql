
# File Type Audit



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'File_Type_Audit';

CREATE TABLE IF NOT EXISTS File_Type_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_type INT NOT NULL,
	CONSTRAINT FK_File_Type_Audit_id_type
		FOREIGN KEY (id_type)
		REFERENCES File_Type(id_type)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(500),
	value_new VARCHAR(500),
	created_on TIMESTAMP,
	created_by INT,
	updated_last_on TIMESTAMP,
	updated_last_by VARCHAR(100)
);