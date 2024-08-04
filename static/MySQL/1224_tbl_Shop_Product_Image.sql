
# Product Permutation Images

USE PARTSLTD_PROD;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Image';

CREATE TABLE IF NOT EXISTS Shop_Product_Image (
    id_image INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_type_image INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Image_id_type_image
		FOREIGN KEY (id_type_image) 
        REFERENCES Shop_Image_Type(id_type),
    id_permutation INT NULL,
    CONSTRAINT FK_Shop_Product_Image_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    url VARCHAR(255),
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on TIMESTAMP,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Product_Image_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);