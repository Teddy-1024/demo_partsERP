
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
	latency_manufacture INT NOT NULL,
	quantity_min FLOAT NOT NULL,
	quantity_max FLOAT NOT NULL,
	quantity_step FLOAT NOT NULL,
	quantity_stock FLOAT NOT NULL,
	is_subscription BIT NOT NULL,
	id_interval_recurrence INT,
	CONSTRAINT FK_Shop_Product_Permutation_Temp_id_interval_recurrence
		FOREIGN KEY (id_interval_recurrence)
		REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	count_interval_recurrence INT,
	id_stripe_product VARCHAR(100) NULL,
	does_expire_faster_once_unsealed BIT NOT NULL DEFAULT 0,
	id_interval_expiration_unsealed INT,
	CONSTRAINT FK_Shop_Product_Permutation_Temp_id_interval_expiration_unsealed
		FOREIGN KEY (id_interval_expiration_unsealed)
		REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	count_interval_expiration_unsealed INT,
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on TIMESTAMP,
	created_by VARCHAR(100),
    guid BINARY(36)
);
