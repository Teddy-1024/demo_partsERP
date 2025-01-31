


/*

CALL p_populate_database ()

*/

/*
-- Remove previous proc
DROP PROCEDURE IF EXISTS p_populate_database;


DELIMITER //
CREATE PROCEDURE p_populate_database ()
BEGIN
*/


# Access Levels
INSERT INTO Shop_Access_Level (
	display_order, code, name, priority
)
VALUES 
	(1, 'VIEW', 'View', 3),
	(2, 'EDIT', 'Edit', 2),
	(3, 'ADMIN', 'Admin', 1)
;

# Error Message Types
INSERT INTO Shop_Msg_Error_Type (
	code, name, description
)
VALUES 
	('BAD_DATA', 'Invalid data', 'Rubbish data')
	, ('NO_PERMISSION', 'No permission', 'Not authorised')
    , ('PRODUCT_AVAILABILITY', 'Product not available', 'Product not available')
    , ('MYSQL_ERROR', 'MySQL error', 'MySQL execution error.')
    , ('WARNING', 'Warning', 'Non-breaking error.')
;

# File Types
INSERT INTO File_Type (
	code, name, extension
)
VALUES 
	('JPEG', 'Joint Photographic Export Group', 'jpg'),
	('PNG', 'Portable Network Graphic', 'png'),
	('GIF', 'GIF', 'gif'),
	('MPEG-4', 'Multimedia Photographic Export Group 4', 'mp4')
;

# Generic / shared properties
INSERT INTO Shop_General (
	quantity_max
)
VALUES (
	10
);

# Image types
INSERT INTO Shop_Image_Type (
	display_order, code, name, name_plural
)
VALUES 
	(1, 'FULL', 'Full Quality Image', 'Full Quality Images'),
	(2, 'LOW', 'Low Quality Image', 'Low Quality Images'),
	(3, 'THUMBNAIL', 'Thumbnail Image', 'Thumbnail Images')
;

# Regions
INSERT INTO Shop_Region (
	display_order, code, name
)
VALUES 
	(1, 'UK', 'United Kingdom')
;

/*
# Region Branches
INSERT INTO Shop_Region_Branch (
	display_order, id_region_parent, id_region_child
)
VALUES 
	(1, 1, 2)
;
*/

# Addresses
INSERT INTO Shop_Address (
	id_region, postcode, address_line_1, address_line_2, city, county
)
VALUES ( 
	1, 'CV22 6DN', '53 Alfred Green Close', '', 'Rugby', 'Warwickshire'
);

# Plants
INSERT INTO Shop_Plant (
	code, name, id_address, id_user_manager
)
VALUES 
	('MAIN', 'Main Plant', 1, 1)
;

# Storage Locations
INSERT INTO Shop_Storage_Location (
	id_plant, code, name
)
VALUES 
	(1, 'K-F-1', 'Kitchen Fridge 1')
	, (1, 'K-AHL-M-B', 'Kitchen - Above Hob Left Medial - Bottom')
	, (1, 'K-AHL-M-M', 'Kitchen - Above Hob Left Medial - Middle')
	, (1, 'K-AHL-M-T', 'Kitchen - Above Hob Left Medial - Top')
	, (1, 'K-AHL-L-B', 'Kitchen - Above Hob Left Lateral - Bottom')
	, (1, 'K-AHL-L-M', 'Kitchen - Above Hob Left Lateral - Middle')
	, (1, 'K-AHL-L-T', 'Kitchen - Above Hob Left Lateral - Top')
	, (1, 'K-AHR-M-B', 'Kitchen - Above Hob Left Medial - Bottom')
	, (1, 'K-AHR-M-M', 'Kitchen - Above Hob Left Medial - Middle')
	, (1, 'K-AHR-M-T', 'Kitchen - Above Hob Left Medial - Top')
	, (1, 'K-AHL-M-B', 'Kitchen - Above Hob Left Medial - Bottom')
	, (1, 'K-AHL-M-M', 'Kitchen - Above Hob Left Medial - Middle')
	, (1, 'K-AHL-M-T', 'Kitchen - Above Hob Left Medial - Top')
	, (1, 'K-AHL-L-B', 'Kitchen - Above Hob Left Lateral - Bottom')
	, (1, 'K-AHL-L-M', 'Kitchen - Above Hob Left Lateral - Middle')
	, (1, 'K-AHL-L-T', 'Kitchen - Above Hob Left Lateral - Top')
	, (1, 'K-AHL-XL-B', 'Kitchen - Above Hob Left Extra Lateral - Bottom')
	, (1, 'K-AHL-XL-M', 'Kitchen - Above Hob Left Extra Lateral - Middle')
	, (1, 'K-AHL-XL-T', 'Kitchen - Above Hob Left Extra Lateral - Top')
	, (1, 'K-BS-B', 'Kitchen - Below Sink - Bottom')
	, (1, 'K-BS-T', 'Kitchen - Below Sink - Top')
	, (1, 'K-LO-B', 'Kitchen - Left of Oven - Bottom')
	, (1, 'K-LO-T', 'Kitchen - Left of Oven - Top')
	, (1, 'K-RO-M-B', 'Kitchen - Right of Oven - Medial - Bottom')
	, (1, 'K-RO-M-M', 'Kitchen - Right of Oven - Medial - Middle')
	, (1, 'K-RO-M-T', 'Kitchen - Right of Oven - Medial - Top')
	, (1, 'K-RO-L-B', 'Kitchen - Right of Oven - Lateral - Bottom')
	, (1, 'K-RO-L-T', 'Kitchen - Right of Oven - Lateral - Top')
	, (1, 'K-BBB-B', 'Kitchen - Below Breakfast Bar - Bottom')
	, (1, 'K-BBB-T', 'Kitchen - Below Breakfast Bar - Top')
	, (1, 'K-BSL-M-B', 'Kitchen - Bekow Sink Left - Medial - Bottom')
	, (1, 'K-BSL-M-T', 'Kitchen - Bekow Sink Left - Medial - Top')
	, (1, 'K-BSL-L-B', 'Kitchen - Bekow Sink Left - Lateral - Bottom')
	, (1, 'K-BSL-L-T', 'Kitchen - Bekow Sink Left - Lateral - Top')
	, (1, 'K-ASL-M-B', 'Kitchen - Above Sink Left - Medial - Bottom')
	, (1, 'K-ASL-M-M', 'Kitchen - Above Sink Left - Medial - Middle')
	, (1, 'K-ASL-M-T', 'Kitchen - Above Sink Left - Medial - Top')
	, (1, 'K-ASL-L-B', 'Kitchen - Above Sink Left - Lateral - Bottom')
	, (1, 'K-ASL-L-M', 'Kitchen - Above Sink Left - Lateral - Middle')
	, (1, 'K-ASL-L-T', 'Kitchen - Above Sink Left - Lateral - Top')
	, (1, 'K-ASL-XL-B', 'Kitchen - Above Sink Left - Extra Lateral - Bottom')
	, (1, 'K-ASL-XL-M', 'Kitchen - Above Sink Left - Extra Lateral - Middle')
	, (1, 'K-ASL-XL-T', 'Kitchen - Above Sink Left - Extra Lateral - Top')
	, (1, 'K-T-B', 'Kitchen - Tower - Bottom')
	, (1, 'K-T-LM', 'Kitchen - Tower - Lower Middle')
	, (1, 'K-T-UM', 'Kitchen - Tower - Upper Middle')
	, (1, 'K-T-T', 'Kitchen - Tower - Top')
	, (1, 'K-FJ-MEAT', 'Kitchen - Fridge - Meat Drawer')
	, (1, 'K-FJ-VEG', 'Kitchen - Fridge - Vegetables Drawer')
	, (1, 'K-FJ-CHEESE', 'Kitchen - Fridge - Cheese Drawer')
	, (1, 'K-FJ-S-B', 'Kitchen - Fridge - Shelf - Bottom')
	, (1, 'K-FJ-S-LM', 'Kitchen - Fridge - Shelf - Lower Middle')
	, (1, 'K-FJ-S-UM', 'Kitchen - Fridge - Shelf - Upper Middle')
	, (1, 'K-FJ-S-T', 'Kitchen - Fridge - Shelf - Top')
	, (1, 'K-FJ-DG-B', 'Kitchen - Door Shelf (Guarded) - Bottom')
	, (1, 'K-FJ-DG-LM', 'Kitchen - Door Shelf (Guarded) - Lower Middle')
	, (1, 'K-FJ-DG-UM', 'Kitchen - Door Shelf (Guarded) - Upper Middle')
	, (1, 'K-FJ-DG-T', 'Kitchen - Door Shelf (Guarded) - Top')
	, (1, 'K-FJ-DU', 'Kitchen - Door Shelf (Unguarded)')
	, (1, 'K-FZ-DRAWER-B', 'Kitchen - Freezer - Drawer - Bottom')
	, (1, 'K-FZ-DRAWER-T', 'Kitchen - Freezer - Drawer - Top')
	, (1, 'K-FZ-DRAWER-I', 'Kitchen - Freezer - Drawer - Ice')
	, (1, 'K-FZ-S-B', 'Kitchen - Freezer - Shelf - Bottom')
	, (1, 'K-FZ-S-M', 'Kitchen - Freezer - Shelf - Middle')
	, (1, 'K-FZ-S-T', 'Kitchen - Freezer - Shelf - Top')
	, (1, 'K-FZ-DOOR-XL', 'Kitchen - Freezer - Door - Extra Low')
	, (1, 'K-FZ-DOOR-L', 'Kitchen - Freezer - Door - Lower')
	, (1, 'K-FZ-DOOR-LM', 'Kitchen - Freezer - Door - Lower Middle')
	, (1, 'K-FZ-DOOR-UM', 'Kitchen - Freezer - Door - Upper Middle')
	, (1, 'K-FZ-DOOR-U', 'Kitchen - Freezer - Door - Upper')
	, (1, 'K-FZ-DOOR-XU', 'Kitchen - Freezer - Door - Extra Up')
	, (1, 'K-AFF', 'Kitchen - Above Fridge-Freezer')
	, (1, 'K-CT', 'Kitchen - Counter Top')
;

/*
# Storage Location Branches
INSERT INTO Shop_Storage_Location_Branch (
	id_location_parent, id_location_child
)
VALUES 
	(1, 2)
;
*/

# Currency
INSERT INTO Shop_Currency (
	display_order, code, name, symbol, factor_from_GBP
)
VALUES
	(1, 'GBP', 'Great British Pound', '£', 1),
	(2, 'EUR', 'Euro', '€', 1.17)
;

# Taxes and Surcharges
INSERT INTO Shop_Tax_Or_Surcharge (
	display_order,
    id_tax,
	code,
	name,
    id_region_buyer,
    id_region_seller,
    fixed_fee,
	multiplier,
    apply_fixed_fee_before_multiplier,
	quantity_min,
	quantity_max
)
VALUES 
	(1, 1, 'VAT', 'Value Added Tax', 1, 1, 0, 0.2, 1, 0, 1)
;

# Unit of Measurement
INSERT INTO Shop_Unit_Measurement (
	name_singular, name_plural, symbol, is_base_unit, is_unit_of_distance, is_unit_of_mass, is_unit_of_time, is_unit_of_volume
)
VALUES
	('metre', 'metres', 'm', 1, 1, 0, 0, 0)
	, ('millimetre', 'millimetres', 'mm', 0, 1, 0, 0, 0)
    , ('kilogram', 'kilograms', 'kg', 1, 0, 1, 0, 0)
	, ('gram', 'grams', 'g', 0, 0, 1, 0, 0)
	, ('litre', 'litres', 'L', 0, 0, 0, 0, 1)
	, ('millilitre', 'millilitres', 'mL', 0, 0, 0, 0, 1)
    , ('item', 'items', 'x', 0, 0, 0, 0, 0)
	, ('hour', 'hours', 'h', 1, 0, 0, 1, 0)
	, ('day', 'days', 'd', 0, 0, 0, 1, 0)
;

# Unit of Measurement Conversion
INSERT INTO Shop_Unit_Measurement_Conversion (
	id_unit_derived
	, id_unit_base
	, display_order
	, multiplier_unit_base
	, increment_unit_base
	, apply_multiplier_before_increment
)
VALUES 
	(
		2 -- id_unit_derived
		, 1 -- id_unit_base
		, 1 -- display_order
		, 0.001 -- multiplier_unit_base
		, 0 -- increment_unit_base
		, apply_multiplier_before_increment
	)
	, (
		4 -- id_unit_derived
		, 3 -- id_unit_base
		, 1 -- display_order
		, 0.001 -- multiplier_unit_base
		, 0 -- increment_unit_base
		, apply_multiplier_before_increment
	)
	, (
		6 -- id_unit_derived
		, 5 -- id_unit_base
		, 1 -- display_order
		, 0.001 -- multiplier_unit_base
		, 0 -- increment_unit_base
		, apply_multiplier_before_increment
	)
	, (
		9 -- id_unit_derived
		, 8 -- id_unit_base
		, 1 -- display_order
		, 24 -- multiplier_unit_base
		, 0 -- increment_unit_base
		, apply_multiplier_before_increment
	)
;


# Categories
INSERT INTO Shop_Product_Category (
	display_order,
	code,
	name,
	description,
    id_access_level_required,
    created_by
)
VALUES 
	(1, 'ASS',	'Assistive Devices', 'Braille product line and other assistive devices', 1, 1),
	(99, 'MISC', 'Miscellaneous', 'Not category allocated products', 1, 1),
    (2, 'TECH', 'Technology', 'Technological devices', 1, 1)
;

/*
# Recurrence Interval
INSERT INTO Shop_Interval_Recurrence (
	code, name, name_plural
)
VALUES 
	('WEEK', 'Week', 'Weeks'),
	('MONTH', 'Month', 'Months'),
	('YEAR', 'Year', 'Years')
;
*/

# Products
INSERT INTO Shop_Product (
	display_order,
	id_category,
	name,
    has_variations,
	id_access_level_required,
    created_by
)
VALUES 
	(
		1,
		1,
		'Braille Keyboard Translator',
        1,
		3,
        1
	),
	(
		2,
		2,
		'Test product 1', 
		0,
        3,
        1
	),
    (
		3,
		3,
		'Phone',
        0,
		1,
        1
	),
	(
		4,
		3,
		'Laptop',
        0,
		1,
        1
	),
	(
		5,
		3,
		'Smart Watch',
        0,
		1,
        1
	)
;

# Product Permutations
INSERT INTO Shop_Product_Permutation (
	-- display_order,
    id_permutation_temp,
	id_product,
	description,
    cost_local_VAT_excl,
    cost_local_VAT_incl,
    id_currency_cost,
    profit_local_min,
    # id_currency_profit_min,
    latency_manufacture,
	id_unit_measurement_quantity,
    count_unit_measurement_per_quantity_step,
    quantity_min,
	quantity_max,
	quantity_stock,
	is_subscription,
	id_unit_measurement_interval_recurrence,
	count_interval_recurrence,
	-- id_access_level_required,
	id_stripe_product
	, does_expire_faster_once_unsealed
	, id_unit_measurement_interval_expiration_unsealed
	, count_interval_expiration_unsealed
)
VALUES 
	(
		-- 1,
        -1,
		1, 
		'Good Red',
        5,
        6,
        1,
        3,
        # 1,
        14,
		1,
		1,
		3,
		99,
		1,
		0,
		NULL,
		NULL,
		-- 1,
		NULL
		, 0
		, NULL
		, NULL
	),
	(
		-- 2, 
		-2,
		1, 
		'Good Blue',
        6,
        7.2,
        1,
        4,
        # 1,
		14,
		1,
		1,
		3,
		99,
		1,
		0,
		NULL,
		NULL,
		-- 1,
		NULL
		, 0
		, NULL
		, NULL
	),
	(
		-- 3, 
		-3,
		2, 
		'Test product describes good',
        10,
        12,
        1,
        5,
        # 1,
		14,
		1,
		1,
		2,
		99,
		1,
		0,
		NULL,
		NULL,
		-- 1,
		NULL
		, 0
		, NULL
		, NULL
	),
	(
		-- 4, 
		-4,
		3, 
		'Phone describes good',
        10,
        12,
        1,
        5,
        # 1,
		14,
		1,
		1,
		2,
		99,
		1,
		0,
		NULL,
		NULL,
		-- 1,
		NULL
		, 0
		, NULL
		, NULL
	),
	(
		-- 5, 
		-5,
		4, 
		'Laptop describes good',
        10,
        12,
        1,
        5,
        # 1,
		14,
		1,
		1,
		2,
		99,
		1,
		0,
		NULL,
		NULL,
		-- 1,
		NULL
		, 0
		, NULL
		, NULL
	),
	(
		-- 6, 
		-6,
		5, 
		'Smart watch describes good',
        10,
        12,
        1,
        5,
        # 1,
		14,
		1,
		1,
		2,
		99,
		1,
		0,
		NULL,
		NULL,
		-- 1,
		NULL
		, 0
		, NULL
		, NULL
	)
;

# Variation Types
INSERT INTO Shop_Variation_Type (
	display_order, code, name, name_plural
)
VALUES 
	(1, 'COLOUR', 'Colour', 'Colours')
	, (2, 'SIZE', 'Size', 'Sizes')
;

# Variations
INSERT INTO Shop_Variation (
	display_order, id_type, code, name, id_unit_measurement, count_unit_measurement
)
VALUES 
	(1, 1, 'RED', 'Red', NULL, NULL)
	, (2, 1, 'BLUE', 'Blue', NULL, NULL)
	, (3, 1, 'GREEN', 'Green', NULL, NULL)
	, (4, 1, 'White', 'White', NULL, NULL)
	, (5, 1, 'BLACK', 'Black', NULL, NULL)
	, (1, 2, '400ml', '400 millilitres', 6, 400)
	, (2, 2, '400g', '400 grams', 4, 400)
	, (3, 2, '410g', '410 grams', 4, 410)
	, (4, 2, '8g', '8 grams', 4, 8)
	, (5, 2, '13g', '13 grams', 4, 13)
	, (6, 2, '27g', '27 grams', 4, 27)
	, (7, 2, '104g', '104 grams', 4, 104)
	, (8, 2, '200g', '200 grams', 4, 200)
	, (9, 2, '92g', '92 grams', 4, 92)
	, (10, 2, '100g', '100 grams', 4, 100)
	, (11, 2, '500g', '500 grams', 4, 500)
	, (12, 2, '250g', '250 grams', 4, 250)
	, (13, 2, '750g', '750 grams', 4, 750)
	, (14, 2, '145g', '145 grams', 4, 145)
	, (15, 2, '340g', '340 grams', 4, 340)
	, (16, 2, '132g', '132 grams', 4, 132)
	, (17, 2, '170g', '170 grams', 4, 170)
	, (18, 2, '700g', '700 grams', 4, 700)
	, (19, 2, '150g', '150 grams', 4, 150)
	, (20, 2, '1kg', '1 kilogram', 3, 1)
	, (21, 2, '2kg', '2 kilograms', 3, 2)
	, (22, 2, '800ml', '800 millilitres', 6, 800)
	, (23, 2, '570g', '570 grams', 4, 570)
	, (24, 2, '300g', '300 grams', 4, 300)
	, (25, 2, '350g', '350 grams', 4, 350)
	, (26, 2, '30g', '30 grams', 4, 30)
	, (27, 2, '1L', '1 litre', 5, 1)
	, (28, 2, '1.2L', '1.2 litres', 5, 1.2)
	, (29, 2, '1.8L', '1.8 litres', 5, 1.8)
	, (30, 2, 'bag of 20', 'bag of 20', 7, 20)
	, (31, 2, '180ml', '180 millilitres', 6, 180)
	, (32, 2, '70g', '70 grams', 4, 70)
	, (33, 2, '60ml', '60 millilitres', 6, 60)
	, (34, 2, '325g', '325 grams', 4, 325)
	, (35, 2, 'pack of 50', 'pack of 50', 7, 50)
	, (36, 2, 'box of 24 (each 5.9g)', 'box of 24 (each 5.9 grams)', 7, 24)
	, (37, 2, '397g', '397 grams', 4, 397)
	, (38, 2, '720g', '720 grams', 4, 720)
	, (39, 2, '454g', '454 grams', 4, 454)
	, (40, 2, 'pack of 4 (each 37g)', 'pack of 4 (each 37 grams)', 7, 4)
	, (41, 2, '450g', '450 grams', 4, 450)
	, (42, 2, '24.6.g', '24.6 grams', 4, 24.6)
	, (43, 2, '230g', '230 grams', 4, 230)
	, (44, 2, '37.3g', '37.3 grams', 4, 37.3)
	, (45, 2, '38.3g', '38.3 grams', 4, 38.3)
	, (46, 2, '123g', '123 grams', 4, 123)
	, (47, 2, '266g', '266 grams', 4, 266)
	, (48, 2, '157g', '157 grams', 4, 157)
	, (49, 2, '285g', '285 grams', 4, 285)
	, (50, 2, '700ml', '700 millilitres', 6, 700)
	, (51, 2, '5L', '5 litres', 5, 5)
	, (52, 2, '216g', '216 grams', 4, 216)
	, (53, 2, '320g', '320 grams', 4, 320)
	, (54, 2, '2L', '2 litres', 5, 2)
	, (55, 2, '200ml', '200 millilitres', 6, 200)
	, (56, 2, '250ml', '250 millilitres', 6, 250)
	, (57, 2, '1 punnet', '1 punnet', 7, 1)
	, (58, 2, '420g', '420 grams', 4, 420)
	, (59, 2, '230g', '230 grams', 4, 230)
	, (60, 2, '465g', '465 grams', 4, 465)
	, (61, 2, '500ml', '500 millilitres', 6, 500)
	, (62, 2, '250ml', '250 millilitres', 6, 250)
	, (63, 2, '238ml', '238 millilitres', 6, 238)
	, (64, 2, '140ml', '140 millilitres', 6, 140)
	, (65, 2, '195g', '195 grams', 4, 195)
	, (66, 2, '1pt', '1 pint', 5, 1)
	, (67, 2, '570ml', '570 millilitres', 6, 570)
	, (68, 2, '360g', '360 grams', 4, 360)
	, (69, 2, '90g', '90 grams', 4, 90)
	, (70, 2, '800ml', '800 millilitres', 6, 800)
	, (71, 2, '197g', '197 grams', 4, 197)
;

INSERT INTO partsltd_prod.Shop_Product_Change_Set (
	comment
)
VALUES ( 'Update Variation Display Orders' )
;
UPDATE partsltd_prod.Shop_Variation V
INNER JOIN (
    SELECT 
        V.id_variation,
        RANK() OVER (ORDER BY 
            CONCAT(
                CASE WHEN V.count_unit_measurement = FLOOR(V.count_unit_measurement) THEN
                    LPAD(CAST(V.count_unit_measurement AS CHAR), 25, '0')
                ELSE
                    CONCAT(
                        LPAD(
                            CAST(FLOOR(V.count_unit_measurement) AS CHAR)
                            , 25
                            , '0'
                        )
                        , SUBSTRING(
                            CAST(V.count_unit_measurement AS CHAR)
                            FROM LOCATE('.', CAST(V.count_unit_measurement AS CHAR))
                        )
                    )
                END
                , ' '
                , IFNULL(IFNULL(UM.symbol, UM.name_singular), '(No Unit of Measurement)')
            )
        ) as new_order
    FROM partsltd_prod.Shop_Variation V
    INNER JOIN partsltd_prod.Shop_Unit_Measurement UM 
        ON V.id_unit_measurement = UM.id_unit_measurement
        AND UM.active = 1
    WHERE 
        V.id_type = 2
) AS RANKED ON V.id_variation = RANKED.id_variation
JOIN (
    SELECT CS.id_change_set
    FROM partsltd_prod.Shop_Product_Change_Set CS
    ORDER BY CS.id_change_set DESC
    LIMIT 1
) AS CS
SET 
    V.display_order = RANKED.new_order
    , V.id_change_set = CS.id_change_set
WHERE 
    V.id_type = 2
;

# Product Permutation Variation Links
INSERT INTO Shop_Product_Permutation_Variation_Link (
	display_order, id_permutation, id_variation
)
VALUES
	(1, 1, 1),
	(2, 2, 2)
;

# Stock items
INSERT INTO Shop_Stock_Item (
	id_permutation
	, date_purchased
	, id_location_storage
	, id_currency_cost
	, cost_local_VAT_incl
	, cost_local_VAT_excl
	, date_expiration
)
VALUES 
	(1, NOW(), 1, 1, 5, 4.2, '2025-09-05 00:00:00'),
	(2, NOW(), 1, 1, 6, 5, '2026-09-05 00:00:00'),
	(3, NOW(), 1, 1, 10, 8.4, '2027-09-05 00:00:00'),
	(4, NOW(), 1, 1, 10, 8.4, '2028-09-05 00:00:00'),
	(5, NOW(), 1, 1, 10, 8.4, '2029-09-05 00:00:00'),
	(6, NOW(), 1, 1, 10, 8.4, '2030-09-05 00:00:00')
;

# Product Price
INSERT INTO Shop_Product_Price (
	id_permutation
	, id_currency
	, id_region_purchase
	, price_local_VAT_incl
	, price_local_VAT_excl
)
VALUES
	(1, 1, 1, 24, 20),
	(1, 2, 1, 48, 40),
	(2, 1, 1, 96, 80),
	(3, 1, 1, 144, 120),
	(4, 1, 1, 600, 500),
	(5, 1, 1, 1500, 1200),
	(6, 1, 1, 180, 150)
;

# Product Images
INSERT INTO Shop_Product_Image (
	display_order, 
	id_permutation, 
	id_type_image, 
	url
)
VALUES 
	(1, 1, 1, '/static/images/prod_PB0NUOSEs06ymG.jpg'), 
	# (1, 1, 1, '/static/images/prod_PB0NUOSEs06ymG.jpg'), 
	(2, 2, 1, '/static/images/prod_PB0NUOSEs06ymG.jpg'),
	# (1, 2, 1, '/static/images/prod_PB0NUOSEs06ymG.jpg')
    (3, 3, 1, '/static/images/prod_PB0NUOSEs06ymG.jpg'),
    (4, 4, 1, '/static/images/prod_.jpg'),
    (5, 5, 1, '/static/images/prod_1.jpg'),
    (6, 6, 1, '/static/images/prod_2.jpg')
;

# Delivery Options
INSERT INTO Shop_Delivery_Option (
	display_order, code, name, latency_delivery_min, latency_delivery_max
)
VALUES 
	(1, 'COLLECT', 'Collection', 0, 0),
	(2, 'SIGNED_1', 'First Class Signed-For', 2, 4)
;

# Product Delivery Option Links
INSERT INTO Shop_Product_Permutation_Delivery_Option_Link (
	display_order, id_product, id_permutation, id_delivery_option, id_region, id_currency, price_local, quantity_min, quantity_max
)
VALUES 
	(1, 1, 1, 1, 1, 1, 5, 0, 1),
	(2, 1, 2, 1, 1, 1, 9, 0, 1),
	(3, 2, 3, 1, 1, 1, 10, 0, 1),
	(4, 3, 4, 1, 1, 1, 10, 0, 1),
	(5, 4, 5, 1, 1, 1, 10, 0, 1),
	(6, 5, 6, 1, 1, 1, 10, 0, 1)
;

# Discounts
INSERT INTO Shop_Discount (
	id_product,
	id_permutation,
	code,
	name,
	multiplier,
	quantity_min,
	quantity_max,
	date_start,
	date_end,
	display_order
)
VALUES 
	(1, 1, 'CRIMBO50', 'Christmas 50% off sale!', 0.5, 3, 9, NOW(), '2023-12-31 23:59:59', 1),
	(1, 2, 'CRIMBO50', 'Christmas 50% off sale!', 0.5, 3, 9, NOW(), '2023-12-31 23:59:59', 1)
;

# Discount Delivery Region Currency Links
INSERT INTO Shop_Discount_Region_Currency_Link (
	id_discount,
	id_region,
	id_currency
)
VALUES
	(1, 1, 1),
	(2, 1, 1),
	(1, 1, 2),
	(2, 1, 2)
;


# Permission Groups
INSERT INTO Shop_Permission_Group (
	display_order, code, name
)
VALUES 
	(0, 'ADMIN', 'Website Admin'),
	(1, 'HOME', 'Home, Contact Us, and other public information'),
	(2, 'PRODUCT', 'Store Products'),
	(3, 'USER', 'Store User'),
    (4, 'SALES_AND_PURCHASING', 'Sales and Purchasing'),
    (5, 'MANUFACTURING', 'Manufacturing')
;
/*
select * from Shop_Permission
select * from Shop_Role_Permission_Link
*/
# Permissions
INSERT INTO Shop_Permission (
	display_order, code, name, id_permission_group, id_access_level_required
)
VALUES 
	(1, 'HOME', 'Home Page', 2, 1),
	(2, 'STORE_PRODUCT', 'Store Product Page', 3, 1),
	(3, 'STORE_USER', 'Store User Account Page', 4, 2),
    (10, 'STORE_USER_ADMIN', 'Store User Admin Page', 4, 3),
	(4, 'STORE_ADMIN', 'Store Admin Page', 1, 3),
    (5, 'STORE_SUPPLIER', 'Store Supplier Page', 4, 2),
    (6, 'STORE_SUPPLIER_PURCHASE_ORDER', 'Store Supplier Purchase Order Page', 4, 2),
    (7, 'STORE_MANUFACTURING_PURCHASE_ORDER', 'Store Manufacturing Purchase Order Page', 5, 2),
    (8, 'STORE_CUSTOMER', 'Store Customer Page', 4, 2),
    (9, 'STORE_CUSTOMER_SALES_ORDER', 'Store Customer Sales Order Page', 4, 2),
	(99, 'CONTACT_US', 'Contact Us Page', 2, 1)
;

# Roles
INSERT INTO Shop_Role (
	display_order,
	code,
	name
)
VALUES 
	(1, 'DIRECTOR', 'Director'),
	(2, 'USER', 'User')
;

# Role Permission link
INSERT INTO Shop_Role_Permission_Link (
	id_role, id_permission, id_access_level
)
VALUES 
	(1, 1, 3),
	(1, 2, 3),
	(1, 3, 3),
	(1, 4, 3),
	(1, 5, 3),
	(1, 6, 3),
	(1, 7, 3),
	(1, 8, 3),
	(1, 9, 3),
	(1, 10, 3),
	(1, 11, 3),
	(2, 1, 1),
	(2, 2, 1),
	(2, 3, 1),
	(2, 4, 1),
	(2, 5, 1)
;

# Users
INSERT INTO Shop_User (
	id_user_auth0
	, firstname
    , surname
	, email
	, is_super_user
    , active
)
VALUES 
	(
		'auth0|6582b95c895d09a70ba10fef' -- id_user_auth0
		, 'Teddy' -- firstname
        , 'Middleton-Smith' -- surname
        , 'edward.middletonsmith@gmail.com' -- email
        , 1 -- is_super_user
		, 1 -- active
	),
	(
		'parts_guest' -- id_user_auth0
        , 'Guest' -- firstname
        , '' -- surname
        , '' -- email
        , 0 -- is_super_user
		, 1 -- active
	),
    (
		'auth0|672659014296b7f94a9bab45' -- id_user_auth0
		, 'Tierney' -- firstname
		, 'Gullen' -- surname
		, 'tierneybailey13@gmail.com' -- email
		, 1 -- is_super_user
		, 1 -- active
	),
	(
		'auth0|679cc2fe0d652a47af90d16b' -- id_user_auth0
        , 'Demo' -- firstname
        , '' -- surname
        , 'bot@partsltd.co.uk' -- email
        , 0 -- is_super_user
		, 1 -- active
	)
;

# User Role link
INSERT INTO Shop_User_Role_Link (
	id_user, id_role
)
VALUES 
	(1, 1)
;

# User Addresses
INSERT INTO Shop_User_Address (
	id_user, id_region, name_full, phone_number, postcode, address_line_1, address_line_2, city, county
)
SELECT U.id_user, 1, CONCAT(U.firstname, ' ', U.surname), '07375 571430', 'CV22 6DN', '53 Alfred Green Close', '', 'Rugby', 'Warwickshire'
	FROM Shop_User U
;

# User Basket
INSERT INTO Shop_User_Basket (
	id_user,
	id_product,
	id_permutation,
	quantity
)
VALUES
	(1, 1, 1, 69)
;

# User Order Status
INSERT INTO Shop_User_Order_Status (
	display_order, code, name, name_plural
)
VALUES
	(1, 'SUCCESS', 'Success', 'Successes'),
	(2, 'FAIL', 'Failure', 'Failures')
;

/*
# User Order
INSERT INTO Shop_User_Order (
	id_user, value_total, id_order_status, id_checkout_session, id_currency
)
VALUES
	(1, 25, 1, 'noods', 1),
	(1, 25, 1, 'noods', 1)
;

# User Order Product Link
INSERT INTO Shop_User_Order_Product_Link (
	id_order, id_product, id_permutation, quantity
)
VALUES
	(1, 1, 1, 69),
	(1, 2, NULL, 69),
	(1, 1, 2, 69)
;
*/

# Supplier
INSERT INTO Shop_Supplier (
	id_supplier_temp
    , name_company
    , name_contact
    , department_contact
    -- , id_address
    , phone_number
    , fax
    , email
    , website
    , id_currency
)
VALUES
	(
		-1
		, 'Precision And Research Technology Systems Limited'
        , 'Teddy Middleton-Smith'
        , 'Executive Management'
        -- , 1
        , '07375571430'
        , ''
        , 'teddy@partsltd.co.uk'
        , 'www.partsltd.co.uk'
        , 1
	)
;

# Suppliers
INSERT INTO Shop_Supplier (
	id_supplier_temp
    , name_company
	, name_contact
	, department_contact
	-- , id_address
	, phone_number
	, fax
	, email
	, website
	, id_currency
)
VALUES
	(
		-2
		, 'Malt Kiln Farm Shop'
        , NULL
        , NULL
        -- , 1
        , '01788 832640'
        , NULL
        , 'farmshop@maltkilnfarmshop.co.uk'
        , 'https://www.maltkilnfarmshop.co.uk/'
        , 1
	)
	, (
		-3
		, 'Asda'
        , NULL
        , NULL
        -- , 1
        , ''
        , NULL
        , ''
        , ''
        , 1
	)
;

# Supplier Addresses
INSERT INTO Shop_Supplier_Address (
	id_supplier
    , id_region
    , postcode
    , address_line_1
    , address_line_2
    , city
    , county
    , active
)
VALUES 
	( 
		1
		, 1
		, 'CV22 6DN'
		, '53 Alfred Green Close'
		, ''
		, 'Rugby'
		, 'Warwickshire'
		, 1
	),
    ( 
		2
        , 1
		, 'CV22 6DN'
		, '53 Alfred Green Close'
		, ''
		, 'Rugby'
		, 'Warwickshire'
		, 1
	)
;

/*
# Supplier Purchase Order
INSERT INTO Shop_Supplier_Purchase_Order (
	id_supplier, value_total, id_order_status, id_checkout_session, id_currency
)
VALUES
;

# Supplier Purchase Order Product Link
INSERT INTO Shop_Supplier_Purchase_Order_Product_Link (
	id_order, id_permutation, cost_total_local, id_currency_cost, quantity_ordered, id_unit_quantity, quantity_received, latency_delivery, display_order
)
VALUES
;
*/

/*
# Manufacturing Purchase Order
INSERT INTO Shop_Manufacturing_Purchase_Order (
	cost_total_local, id_currency_cost
)
VALUES
;

# Manufacturing Purchase Order Product Link
INSERT INTO Shop_Manufacturing_Purchase_Order_Product_Link (
	id_order, id_permutation, cost_total_local, id_currency_cost, quantity_used, id_unit_quantity, quantity_produced, latency_manufacturing_days, display_order
)
VALUES
;
*/

/*
# Customer
INSERT INTO Shop_Customer (
	name_company, name_contact, department_contact, id_address, phone_number, email, id_currency
)
VALUES

;
*/

/*
# Customer Sales Order
INSERT INTO Shop_Customer_Sales_Order (
	cost_total_local, id_currency_cost
)
VALUES
;

# Customer Sales Order Product Link
INSERT INTO Shop_Customer_Sales_Order_Product_Link (
	id_order, id_permutation, cost_total_local, id_currency_cost, quantity_ordered, id_unit_quantity, quantity_delivered, latency_delivery_days, display_order
)
VALUES
;
*/




/* 
    -- Clean up
END //
DELIMITER ;


-- Call
CALL p_populate_database();

-- Remove proc
DROP PROCEDURE IF EXISTS p_populate_database;
*/