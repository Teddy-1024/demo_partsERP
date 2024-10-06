
-- Product Change Sets



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Change_Set';

CREATE TABLE Shop_Product_Change_Set (
	id_change_set INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	comment VARCHAR(4000),
	updated_last_on TIMESTAMP,
	updated_last_by VARCHAR(100)
);