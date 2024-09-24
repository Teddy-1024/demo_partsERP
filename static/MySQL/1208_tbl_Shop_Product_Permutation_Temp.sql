
# Product Permutation Temp



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation_Temp';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation_Temp (
	id_permutation INT NOT NULL PRIMARY KEY,
	id_product INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Permutation_Temp_id_product
		FOREIGN KEY (id_product)
		REFERENCES Shop_Product(id_product)
		ON UPDATE RESTRICT,
	description VARCHAR(4000) NOT NULL,
	cost_local FLOAT NOT NULL,
    id_currency_cost INT NOT NULL,
	profit_local_min FLOAT NOT NULL,
	latency_manufacture_days INT NOT NULL,
	id_unit_measurement_quantity INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Permutation_Temp_id_unit_quantity
		FOREIGN KEY (id_unit_measurement_quantity)
		REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	count_unit_measurement_per_quantity_step FLOAT NOT NULL,
	quantity_min FLOAT NOT NULL,
	quantity_max FLOAT NOT NULL,
	quantity_stock FLOAT NULL,
	is_subscription BIT NOT NULL,
	id_unit_measurement_interval_recurrence INT,
	CONSTRAINT FK_Shop_Product_Permutation_Temp_id_unit_recurrence
		FOREIGN KEY (id_unit_measurement_interval_recurrence)
		REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	count_interval_recurrence INT,
	id_stripe_product VARCHAR(100) NULL,
	does_expire_faster_once_unsealed BIT NOT NULL DEFAULT 0,
	id_unit_measurement_interval_expiration_unsealed INT,
	CONSTRAINT FK_Shop_Product_Permutation_Temp_id_unit_expiration
		FOREIGN KEY (id_unit_measurement_interval_expiration_unsealed)
		REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	count_interval_expiration_unsealed INT,
	active BIT NOT NULL DEFAULT 1,
	-- display_order INT NOT NULL,
    guid BINARY(36)
);
