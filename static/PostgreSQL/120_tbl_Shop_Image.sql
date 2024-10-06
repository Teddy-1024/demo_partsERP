
-- Images



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Image';

CREATE TABLE IF NOT EXISTS Shop_Image (
    id_image INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_type_image INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Image_id_type_image
		FOREIGN KEY (id_type_image) 
        REFERENCES Shop_Image_Type(id_type),
    id_type_file INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Image_id_type_file
		FOREIGN KEY (id_type_file) 
        REFERENCES File_Type(id_type),
    id_product INTEGER NULL,
    CONSTRAINT FK_Shop_Image_id_product
		FOREIGN KEY (id_product) 
        REFERENCES Shop_Product(id_product),
    id_permutation INTEGER NULL,
    CONSTRAINT FK_Shop_Image_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    url VARCHAR(255),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    display_order INTEGER NOT NULL,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Image_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);