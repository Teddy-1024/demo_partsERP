
-- Image Type Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Image_Audit';

CREATE TABLE IF NOT EXISTS Shop_Image_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_image INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Image_Audit_id_image
		FOREIGN KEY (id_image)
        REFERENCES Shop_Image(id_image),
    name_field VARCHAR(50),
    value_prev VARCHAR(10),
    value_new VARCHAR(10),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Image_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);