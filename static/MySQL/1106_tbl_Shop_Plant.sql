
# Plant

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Plant';

CREATE TABLE IF NOT EXISTS Shop_Plant (
	id_plant INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(500) NOT NULL,
    id_address INT NOT NULL,
    CONSTRAINT FK_Shop_Plant_id_address
		FOREIGN KEY (id_address)
        REFERENCES Shop_Address(id_address),
    id_user_manager INT NOT NULL,
	active BIT NOT NULL DEFAULT 1,
	created_on DATETIME,
	created_by INT,
	id_change_set INT,
	CONSTRAINT FK_Shop_Plant_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
