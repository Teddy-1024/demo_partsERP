
# Categories


SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Category';

CREATE TABLE IF NOT EXISTS Shop_Product_Category (
	id_category INT NOT NULL AUTO_INCREMENT PRIMARY KEY
	, code VARCHAR(50)
	, name VARCHAR(255)
	, description VARCHAR(4000)
	, active BIT NOT NULL DEFAULT 1
	, display_order INT NOT NULL
    , id_access_level_required INT NOT NULL
    , CONSTRAINT FK_Shop_Product_Category_id_access_level_required
		FOREIGN KEY (id_access_level_required)
        REFERENCES Shop_Access_Level(id_access_level)
	, created_on DATETIME
	, created_by INT NOT NULL
	, id_change_set INT
	, CONSTRAINT FK_Shop_Product_Category_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
