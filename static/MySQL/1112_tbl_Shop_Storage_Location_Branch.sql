
# Storage Location Branch



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Storage_Location_Branch';

CREATE TABLE IF NOT EXISTS Shop_Storage_Location_Branch (
	id_branch INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_location_parent INT NOT NULL,
    CONSTRAINT FK_Shop_Storage_Location_Branch_id_location_parent
		FOREIGN KEY (id_location_parent)
        REFERENCES Shop_Storage_Location(id_location)
        ON UPDATE RESTRICT,
    id_location_child INT NOT NULL,
    CONSTRAINT FK_Shop_Storage_Location_Branch_id_location_child
		FOREIGN KEY (id_location_child)
        REFERENCES Shop_Storage_Location(id_location)
        ON UPDATE RESTRICT,
    -- depth INT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Storage_Location_Branch_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);