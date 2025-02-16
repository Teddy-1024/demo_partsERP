
# Error Message Type



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Msg_Error_Type';

CREATE TABLE IF NOT EXISTS Shop_Msg_Error_Type (
	id_type INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50) NOT NULL,
	name VARCHAR(500) NOT NULL,
	description VARCHAR(1000)
);
