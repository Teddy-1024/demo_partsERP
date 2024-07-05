
-- Category Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Category_Audit';

CREATE TABLE IF NOT EXISTS Shop_Category_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_category INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Category_Audit_id_category
		FOREIGN KEY (id_category)
		REFERENCES Shop_Category(id_category)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(4000),
	value_new VARCHAR(4000),
	id_change_set INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Category_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
