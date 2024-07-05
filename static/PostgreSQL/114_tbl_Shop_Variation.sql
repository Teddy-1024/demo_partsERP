
-- Variations



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Variation';

CREATE TABLE Shop_Variation (
	id_variation INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
	id_type INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Variation_id_type
		FOREIGN KEY (id_type) 
		REFERENCES Shop_Variation_Type(id_type)
		ON UPDATE RESTRICT,
	code VARCHAR(50),
	name VARCHAR(255),
	active BOOLEAN NOT NULL DEFAULT TRUE,
	display_order INTEGER NOT NULL,
	created_on TIMESTAMP,
	created_by VARCHAR(100),
	id_change_set INTEGER,
	CONSTRAINT FK_Shop_Variation_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
