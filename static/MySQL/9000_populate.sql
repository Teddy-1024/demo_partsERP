


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
	('BAD_DATA', 'Invalid data', 'Rubbish data'),
	('NO_PERMISSION', 'No permission', 'Not authorised'),
    ('PRODUCT_AVAILABILITY', 'Product not available', 'Product not available')
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
	('metre', 'metres', 'm', 1, 1, 0, 0, 0),
    ('kilogram', 'kilograms', 'kg', 1, 0, 1, 0, 0),
    ('item', 'items', 'x', 0, 0, 0, 0, 0),
	('hour', 'hours', 'h', 1, 0, 0, 1, 0)
;

/*
# Unit of Measurement Conversion
INSERT INTO Shop_Unit_Measurement_Conversion (
	id_unit_derived, id_unit_base, power_unit_base, multiplier_unit_base, increment_unit_base
)
VALUES
	
;
*/


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
	display_order,
	id_product,
	description,
    cost_local,
    id_currency_cost,
    profit_local_min,
    # id_currency_profit_min,
    latency_manufacture_days,
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
		1, 
		1, 
		'Good Red',
        5,
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
		2, 
		1, 
		'Good Blue',
        6,
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
		3, 
		2, 
		'Test product describes good',
        10,
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
		4, 
		3, 
		'Phone describes good',
        10,
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
		5, 
		4, 
		'Laptop describes good',
        10,
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
		6, 
		5, 
		'Smart watch describes good',
        10,
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
;

# Variations
INSERT INTO Shop_Variation (
	display_order, id_type, code, name
)
VALUES 
	(1, 1, 'RED', 'Red'),
	(2, 1, 'BLUE', 'Blue')
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
	# email_verified
	, is_super_user
)
VALUES 
	('auth0|6582b95c895d09a70ba10fef', 'Teddy', 'Middleton-Smith', 'edward.middletonsmith@gmail.com', 1),
	('parts_guest', 'Guest', '', '', 0)
;

# User Role link
INSERT INTO Shop_User_Role_Link (
	id_user, id_role
)
VALUES 
	(1, 1)
;

# Addresses
INSERT INTO Shop_Address (
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
	name_company, name_contact, department_contact, id_address, phone_number, fax, email, website, id_currency
)
VALUES
	('Precision And Research Technology Systems Limited', 'Teddy Middleton-Smith', 'Executive Management', 1, '07375571430', '', 'teddy@partsltd.co.uk', 'www.partsltd.co.uk', 1)
;

# Suppliers
INSERT INTO Shop_Supplier (
	name_company
	, name_contact
	, department_contact
	, id_address
	, phone_number
	, fax
	, email
	, website
	, id_currency
)
VALUES
	('Malt Kiln Farm Shop', NULL, NULL, 2, '01788 832640', NULL, 'farmshop@maltkilnfarmshop.co.uk', 'https://www.maltkilnfarmshop.co.uk/', 1)
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
DELIMITER ;;


-- Call
CALL p_populate_database();

-- Remove proc
DROP PROCEDURE IF EXISTS p_populate_database;
*/