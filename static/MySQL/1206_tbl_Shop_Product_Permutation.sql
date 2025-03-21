
# Product Permutation

-- DROP TABLE demo.Shop_Product_Permutation;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation (
	id_permutation INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_permutation_temp INT NOT NULL,
	id_product INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Permutation_id_product
		FOREIGN KEY (id_product)
		REFERENCES Shop_Product(id_product)
		ON UPDATE RESTRICT,
	-- name VARCHAR(255) NOT NULL,
	description VARCHAR(4000) NOT NULL,
	cost_local_VAT_excl FLOAT NULL,
    cost_local_VAT_incl FLOAT NULL,
    id_currency_cost INT NOT NULL,
	profit_local_min FLOAT NULL,
    -- id_currency_profit_min INT NOT NULL,
	latency_manufacture INT NOT NULL,
	id_unit_measurement_quantity INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Permutation_id_unit_quantity
		FOREIGN KEY (id_unit_measurement_quantity)
		REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	count_unit_measurement_per_quantity_step FLOAT NOT NULL,
	quantity_min FLOAT NULL,
	quantity_max FLOAT NULL,
	quantity_stock FLOAT NOT NULL,
	is_subscription BIT NOT NULL,
	id_unit_measurement_interval_recurrence INT,
	CONSTRAINT FK_Shop_Product_Permutation_id_unit_interval_recurrence
		FOREIGN KEY (id_unit_measurement_interval_recurrence)
		REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	/*
	CONSTRAINT CHECK_FK_Shop_Product_Permutation_id_unit_measurement_interval_recurrence
		CHECK (id_unit_measurement_interval_recurrence IN (SELECT id_unit_measurement FROM Shop_Unit_Measurement WHERE is_unit_of_time = 1)),
	*/
	count_interval_recurrence INT,
	id_stripe_product VARCHAR(100) NULL,
	does_expire_faster_once_unsealed BIT NOT NULL DEFAULT 0,
	id_unit_measurement_interval_expiration_unsealed INT,
	CONSTRAINT FK_Shop_Product_Permutation_id_unit_interval_expiration_unsealed
		FOREIGN KEY (id_unit_measurement_interval_expiration_unsealed)
		REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	/*
	CONSTRAINT CHECK_FK_Shop_Product_Permutation_id_interval_expiration_unsealed
		CHECK (id_interval_expiration_unsealed IN (SELECT id_unit_measurement FROM Shop_Unit_Measurement WHERE is_unit_of_time = 1)),
	*/
	count_interval_expiration_unsealed INT,
	active BIT NOT NULL DEFAULT 1,
	-- display_order INT NOT NULL,
	created_on DATETIME,
	created_by INT,
	id_change_set INT,
	CONSTRAINT FK_Shop_Product_Permutation_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
