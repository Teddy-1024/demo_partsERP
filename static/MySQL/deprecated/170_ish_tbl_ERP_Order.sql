
# ERP Order



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ERP_Order';
	
CREATE TABLE IF NOT EXISTS ERP_Order (
	id_order INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50),
	name VARCHAR(100),
	extension VARCHAR(50),
	created_on TIMESTAMP,
	created_by INT,
    id_customer INT NOT NULL,
    CONSTRAINT FK_ERP_Order_id_customer
		FOREIGN KEY (id_customer)
		REFERENCES ERP_Customer(id_customer)
);
