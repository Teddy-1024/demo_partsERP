
# File Types

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'File_Type';
	
CREATE TABLE IF NOT EXISTS File_Type (
	id_type INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50),
	name VARCHAR(100),
	extension VARCHAR(50),
	created_on DATETIME,
	created_by VARCHAR(100),
	updated_last_on DATETIME,
	updated_last_by VARCHAR(100)
);
