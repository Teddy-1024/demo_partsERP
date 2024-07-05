
-- File Types



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'File_Type';
	
CREATE TABLE IF NOT EXISTS File_Type (
	id_type INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	code VARCHAR(50),
	name VARCHAR(100),
	extension VARCHAR(50),
	created_on TIMESTAMP,
	created_by VARCHAR(100),
	updated_last_on TIMESTAMP,
	updated_last_by VARCHAR(100)
);
