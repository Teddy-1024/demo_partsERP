
# Product Permutation Temp

-- DROP TABLE IF EXISTS Shop_Product_Permutation_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation_Temp';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation_Temp (
	id_temp INT NOT NULL PRIMARY KEY AUTO_INCREMENT
	, id_permutation INT NOT NULL
	, id_product INT NOT NULL
	, csv_id_pairs_variation VARCHAR(4000) NULL
	, description VARCHAR(4000) NOT NULL
	, cost_local_VAT_excl FLOAT NULL
    , cost_local_VAT_incl FLOAT NULL
    , id_currency_cost INT NOT NULL
	, profit_local_min FLOAT NULL
	, latency_manufacture INT NOT NULL
	, id_unit_measurement_quantity INT NOT NULL
	, count_unit_measurement_per_quantity_step FLOAT NOT NULL
	, quantity_min FLOAT NULL
	, quantity_max FLOAT NULL
	, quantity_stock FLOAT NULL
	, is_subscription BIT NOT NULL
	, id_unit_measurement_interval_recurrence INT
	, count_interval_recurrence INT
	, id_stripe_product VARCHAR(100) NULL
	, does_expire_faster_once_unsealed BIT NOT NULL DEFAULT 0
	, id_unit_measurement_interval_expiration_unsealed INT
	, count_interval_expiration_unsealed INT
	, active BIT NOT NULL DEFAULT 1
	-- display_order INT NOT NULL
    , guid BINARY(36)
	, can_view BIT NULL DEFAULT NULL
	, can_edit BIT NULL DEFAULT NULL
	, can_admin BIT NULL DEFAULT NULL
);
