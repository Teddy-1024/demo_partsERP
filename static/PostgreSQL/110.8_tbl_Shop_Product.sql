
-- Products



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product';

CREATE TABLE IF NOT EXISTS Shop_Product (
	id_product INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(255) NOT NULL,
	-- description VARCHAR(4000),
	id_category INTEGER NOT NULL,
    has_variations BOOLEAN NOT NULL,
	/*
    price_GBP_full REAL,
	price_GBP_min REAL,
    -- ratio_discount_overall REAL NOT NULL DEFAULT 0,
	CONSTRAINT FK_Shop_Product_id_category
		FOREIGN KEY (id_category)
		REFERENCES Shop_Category(id_category)
		ON UPDATE RESTRICT,
	latency_manuf INTEGER,
	quantity_min REAL,
	quantity_max REAL,
	quantity_step REAL,
	quantity_stock REAL,
	is_subscription BOOLEAN,
	id_recurrence_interval INTEGER,
	CONSTRAINT FK_Shop_Product_id_recurrence_interval
		FOREIGN KEY (id_recurrence_interval)
		REFERENCES Shop_Recurrence_Interval(id_interval),
	count_recurrence_interval INTEGER,
	*/
    id_access_level_required INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_id_access_level_required
		FOREIGN KEY (id_access_level_required)
        REFERENCES Shop_Access_Level(id_access_level),
	-- id_stripe_product VARCHAR(100),
	-- id_stripe_price VARCHAR(100) NOT NULL,
	active BOOLEAN NOT NULL DEFAULT TRUE,
	display_order INTEGER NOT NULL,
	created_on TIMESTAMP,
	created_by VARCHAR(100),
	id_change_set INTEGER,
	CONSTRAINT FK_Shop_Product_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
