
-- Product Permutation



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation (
	id_permutation INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_product INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Product_Variation_Link_id_product
		FOREIGN KEY (id_product)
		REFERENCES Shop_Product(id_product)
		ON UPDATE RESTRICT,
	-- name VARCHAR(255) NOT NULL,
	description VARCHAR(4000) NOT NULL,
	cost_local REAL NOT NULL,
    id_currency_cost INTEGER NOT NULL,
	profit_local_min REAL NOT NULL,
    -- id_currency_profit_min INTEGER NOT NULL,
	latency_manufacture_days INTEGER NOT NULL,
	quantity_min REAL NOT NULL,
	quantity_max REAL NOT NULL,
	quantity_step REAL NOT NULL,
	quantity_stock REAL NOT NULL,
	is_subscription BOOLEAN NOT NULL,
	id_unit_measurement_interval_recurrence INTEGER,
	CONSTRAINT FK_Shop_Product_Permutation_id_unit_measurement_interval_recurrence
		FOREIGN KEY (id_unit_measurement_interval_recurrence)
		REFERENCES Shop_Interval_Recurrence(id_interval),
	count_interval_recurrence INTEGER,
    /*
    id_access_level_required INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_Permutation_id_access_level_required
		FOREIGN KEY (id_access_level_required)
        REFERENCES Shop_Access_Level(id_access_level),
	*/
	id_stripe_product VARCHAR(100) NULL,
	active BOOLEAN NOT NULL DEFAULT TRUE,
	display_order INTEGER NOT NULL,
	created_on TIMESTAMP,
	created_by INT,
	id_change_set INTEGER,
	CONSTRAINT FK_Shop_Product_Variation_Link_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
