
# Variations



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Variation';

CREATE TABLE Shop_Variation (
	id_variation INT NOT NULL AUTO_INCREMENT PRIMARY KEY
	, id_type INT NOT NULL
	, CONSTRAINT FK_Shop_Variation_id_type
		FOREIGN KEY (id_type) 
		REFERENCES partsltd_prod.Shop_Variation_Type(id_type)
		ON UPDATE RESTRICT
    , id_unit_measurement INT NULL
	, CONSTRAINT FK_Shop_Unit_Measurement_id_unit_measurement
		FOREIGN KEY (id_unit_measurement) 
		REFERENCES partsltd_prod.Shop_Unit_Measurement(id_unit_measurement)
    , count_unit_measurement INT NULL
	, code VARCHAR(50)
	, name VARCHAR(255)
	, active BIT NOT NULL DEFAULT 1
	, display_order INT NOT NULL
	, created_on DATETIME
	, created_by INT
	, id_change_set INT
	, CONSTRAINT FK_Shop_Variation_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES partsltd_prod.Shop_Product_Change_Set(id_change_set)
);
