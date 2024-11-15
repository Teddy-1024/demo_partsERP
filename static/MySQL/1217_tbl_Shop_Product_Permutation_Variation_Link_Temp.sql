
# Product Permutation Variation Link

-- DROP TABLE IF EXISTS Shop_Product_Permutation_Variation_Link_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation_Variation_Link_Temp';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation_Variation_Link_Temp (
	id_temp INT NOT NULL AUTO_INCREMENT PRIMARY KEY
	, id_link INT NOT NULL
	, id_permutation INT NOT NULL
	, id_variation INT NOT NULL
	, active BIT NOT NULL
	, display_order INT NOT NULL
    , GUID BINARY(36) NOT NULL
);
