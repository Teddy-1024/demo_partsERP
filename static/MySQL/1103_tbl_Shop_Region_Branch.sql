
# Region Branchs



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Region_Branch';

CREATE TABLE IF NOT EXISTS Shop_Region_Branch (
	id_branch INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_region_parent INT NOT NULL,
    CONSTRAINT FK_Shop_Region_Branch_id_region_parent
		FOREIGN KEY (id_region_parent)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    id_region_child INT NOT NULL,
    CONSTRAINT FK_Shop_Region_Branch_id_region_child
		FOREIGN KEY (id_region_child)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    -- depth INT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Region_Branch_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);