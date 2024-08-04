
# Sales And Purchasing Change Sets



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Sales_And_Purchasing_Change_Set';

CREATE TABLE Shop_Sales_And_Purchasing_Change_Set (
	id_change_set INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	comment VARCHAR(500),
	updated_last_on TIMESTAMP,
	updated_last_by VARCHAR(100)
);