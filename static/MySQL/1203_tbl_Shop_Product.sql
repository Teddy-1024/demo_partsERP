
# Products



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product';

CREATE TABLE IF NOT EXISTS Shop_Product (
	id_product INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	-- description VARCHAR(4000),
	id_category INT NOT NULL,
    has_variations BIT NOT NULL,
	/*
    price_GBP_full FLOAT,
	price_GBP_min FLOAT,
    # ratio_discount_overall FLOAT NOT NULL DEFAULT 0,
	CONSTRAINT FK_Shop_Product_id_category
		FOREIGN KEY (id_category)
		REFERENCES Shop_Product_Category(id_category)
		ON UPDATE RESTRICT,
	latency_manuf INT,
	quantity_min FLOAT,
	quantity_max FLOAT,
	quantity_step FLOAT,
	quantity_stock FLOAT,
	is_subscription BIT,
	id_unit_measurement_interval_recurrence INT,
	CONSTRAINT FK_Shop_Product_id_unit_measurement_interval_recurrence
		FOREIGN KEY (id_unit_measurement_interval_recurrence)
		REFERENCES Shop_Interval_Recurrence(id_interval),
	count_interval_recurrence INT,
	*/
    id_access_level_required INT NOT NULL,
    CONSTRAINT FK_Shop_Product_id_access_level_required
		FOREIGN KEY (id_access_level_required)
        REFERENCES Shop_Access_Level(id_access_level),
	# id_stripe_product VARCHAR(100),
	# id_stripe_price VARCHAR(100) NOT NULL,
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on TIMESTAMP NOT NULL,
	created_by INT NOT NULL,
	id_change_set INT,
	CONSTRAINT FK_Shop_Product_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
