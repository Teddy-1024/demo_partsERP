
# Product Permutation

USE PARTSLTD_PROD;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation (
	id_permutation INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_product INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Variation_Link_id_product
		FOREIGN KEY (id_product)
		REFERENCES Shop_Product(id_product)
		ON UPDATE RESTRICT,
	-- name VARCHAR(255) NOT NULL,
	description VARCHAR(4000) NOT NULL,
	cost_local FLOAT NOT NULL,
    id_currency_cost INT NOT NULL,
	profit_local_min FLOAT NOT NULL,
    -- id_currency_profit_min INT NOT NULL,
	latency_manufacture INT NOT NULL,
	quantity_min FLOAT NOT NULL,
	quantity_max FLOAT NOT NULL,
	quantity_step FLOAT NOT NULL,
	quantity_stock FLOAT NOT NULL,
	is_subscription BIT NOT NULL,
	id_recurrence_interval INT,
	CONSTRAINT FK_Shop_Product_Permutation_id_recurrence_interval
		FOREIGN KEY (id_recurrence_interval)
		REFERENCES Shop_Recurrence_Interval(id_interval),
	count_recurrence_interval INT,
    /*
    id_access_level_required INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Permutation_id_access_level_required
		FOREIGN KEY (id_access_level_required)
        REFERENCES Shop_Access_Level(id_access_level),
	*/
	id_stripe_product VARCHAR(100) NULL,
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_Product_Variation_Link_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
