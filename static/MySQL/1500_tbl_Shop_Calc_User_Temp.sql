
# Calc User Staging
-- USE demo;
-- DROP TABLE IF EXISTS Shop_Calc_User_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Calc_User_Temp';

CREATE TABLE Shop_Calc_User_Temp (
	-- id_row INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	guid BINARY(36) NOT NULL,
	id_user INT NULL,
	id_permission_required INT NOT NULL,
	CONSTRAINT FK_Shop_Calc_User_Temp_id_permission_required
		FOREIGN KEY (id_permission_required)
		REFERENCES demo.Shop_Permission (id_permission),
	priority_access_level_required INT NOT NULL,
	id_product INT NULL,
	CONSTRAINT FK_Shop_Calc_User_Temp_id_product
		FOREIGN KEY (id_product)
		REFERENCES demo.Shop_Product (id_product),
	is_super_user BIT NULL,
	priority_access_level_user INT NULL,
	can_view BIT,
	can_edit BIT,
	can_admin BIT
);