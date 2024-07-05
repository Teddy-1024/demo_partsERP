
USE PARTSLTD_PROD;

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

# Categories
INSERT INTO Shop_Category (
	display_order,
	code,
	name,
	description
)
VALUES 
	(1, 'ASS',	'Assistive Devices', 'Braille product line and other assistive devices'),
	(99, 'MISC', 'Miscellaneous', 'Not category allocated products'),
    (2, 'TECH', 'Technology', 'Technological devices')
;

# Recurrence Interval
INSERT INTO Shop_Recurrence_Interval (
	code, name, name_plural
)
VALUES 
	('WEEK', 'Week', 'Weeks'),
	('MONTH', 'Month', 'Months'),
	('YEAR', 'Year', 'Years')
;

INSERT INTO Shop_Region (
	display_order, code, name
)
VALUES 
	(1, 'UK', 'United Kingdom')
;

/*
INSERT INTO Shop_Region_Branch (
	display_order, id_region_parent, id_region_child
)
VALUES 
	(1, 1, 2)
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

# Products
INSERT INTO Shop_Product (
	display_order,
	id_category,
	name,
    has_variations,
	id_access_level_required
)
VALUES 
	(
		1,
		1,
		'Braille Keyboard Translator',
        1,
		3
	),
	(
		2,
		2,
		'Test product 1', 
		0,
        3
	),
    (
		3,
		3,
		'Phone',
        0,
		1
	),
	(
		4,
		3,
		'Laptop',
        0,
		1
	),
	(
		5,
		3,
		'Smart Watch',
        0,
		1
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

# Product Permutations
INSERT INTO Shop_Product_Permutation (
	display_order,
	id_product,
	description,
    cost_local,
    id_currency_cost,
    profit_local_min,
    # id_currency_profit_min,
    latency_manufacture,
	quantity_min,
	quantity_max,
	quantity_step,
	quantity_stock,
	is_subscription,
	id_recurrence_interval,
	count_recurrence_interval,
	-- id_access_level_required,
	id_stripe_product
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
		3,
		1,
		99,
		0,
		NULL,
		NULL,
		-- 1,
		NULL
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
		3,
		1,
		99,
		0,
		NULL,
		NULL,
		-- 1,
		NULL
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
		2,
		1,
		99,
		0,
		NULL,
		NULL,
		-- 1,
		NULL
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
		2,
		1,
		99,
		0,
		NULL,
		NULL,
		-- 1,
		NULL
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
		2,
		1,
		99,
		0,
		NULL,
		NULL,
		-- 1,
		NULL
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
		2,
		1,
		99,
		0,
		NULL,
		NULL,
		-- 1,
		NULL
	)
;

# Product Permutation Variation Links
INSERT INTO Shop_Product_Permutation_Variation_Link (
	display_order, id_permutation, id_variation
)
VALUES
	(1, 1, 1),
	(2, 2, 2)
;

# Product Currency Link
INSERT INTO Shop_Product_Currency_Region_Link (
	id_product, id_permutation, id_currency, id_region_purchase, price_local_VAT_incl, price_local_VAT_excl
)
VALUES
	(1, 1, 1, 1, 24, 20),
	(1, 1, 2, 1, 48, 40),
	(1, 2, 1, 1, 96, 80),
	(2, 3, 1, 1, 144, 120),
	(3, 4, 1, 1, 600, 500),
	(4, 5, 1, 1, 1500, 1200),
	(5, 6, 1, 1, 180, 150)
;

INSERT INTO Shop_Image_Type (
	display_order, code, name, name_plural
)
VALUES 
	(1, 'FULL', 'Full Quality Image', 'Full Quality Images'),
	(2, 'LOW', 'Low Quality Image', 'Low Quality Images'),
	(3, 'THUMBNAIL', 'Thumbnail Image', 'Thumbnail Images')
;

INSERT INTO Shop_Image (
	display_order, id_product, id_permutation, id_type_image, id_type_file, url
)
VALUES 
	(1, 1, 1, 1, 1, '/static/images/prod_PB0NUOSEs06ymG.jpg'), 
	# (1, NULL, 1, 1, 1, '/static/images/prod_PB0NUOSEs06ymG.jpg'), 
	(2, 1, 2, 1, 1, '/static/images/prod_PB0NUOSEs06ymG.jpg'),
	# (1, NULL, 2, 1, 1, '/static/images/prod_PB0NUOSEs06ymG.jpg')
    (3, 2, 3, 1, 1, '/static/images/prod_PB0NUOSEs06ymG.jpg'),
    (4, 3, 4, 1, 1, '/static/images/prod_.jpg'),
    (5, 4, 5, 1, 1, '/static/images/prod_1.jpg'),
    (6, 5, 6, 1, 1, '/static/images/prod_2.jpg')
;

INSERT INTO Shop_Delivery_Option (
	display_order, code, name, latency_delivery_min, latency_delivery_max, quantity_min, quantity_max
)
VALUES 
	(1, 'COLLECT', 'Collection', 0, 0, 0, 1),
	(2, 'SIGNED_1', 'First Class Signed-For', 2, 4, 0, 1)
;

INSERT INTO Shop_Product_Delivery_Option_Link (
	display_order, id_product, id_permutation, id_delivery_option, id_region, id_currency, price_local
)
VALUES 
	(1, 1, 1, 1, 1, 1, 5),
	(2, 1, 2, 1, 1, 1, 9),
	(3, 2, NULL, 1, 1, 1, 10),
	(4, 3, 4, 1, 1, 1, 10),
	(5, 4, 5, 1, 1, 1, 10),
	(6, 5, 6, 1, 1, 1, 10)
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

# Discount Delivery Region Links
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
	(2, 1, 1),
	(2, 2, 1),
	(2, 3, 1),
	(2, 4, 1),
	(2, 5, 1)
;

# Users
INSERT INTO Shop_User (
	id_user,
	name,
	email,
	# email_verified,
	is_super_user
)
VALUES 
	('auth0|6582b95c895d09a70ba10fef', 'Teddy', 'edward.middletonsmith@gmail.com', 1),
	('parts_guest', 'Guest', '', 0)
;

# User Role link
INSERT INTO Shop_User_Role_Link (
	id_user, id_role
)
VALUES 
	('auth0|6582b95c895d09a70ba10fef', 1)
;

# Addresses
INSERT INTO Shop_Address (
	id_user, id_region, name_full, phone_number, postcode, address_line_1, address_line_2, city, county
)
SELECT U.id_user, 1, U.name, '07375 571430', 'CV22 6DN', '53 Alfred Green Close', '', 'Rugby', 'Warwickshire'
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
	('auth0|6582b95c895d09a70ba10fef', 1, 1, 69)
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
	('auth0|6582b95c895d09a70ba10fef', 25, 1, 'noods', 1),
	('auth0|6582b95c895d09a70ba10fef', 25, 1, 'noods', 1)
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

# Unit of Measurement
INSERT INTO Shop_Unit_Measurement (
	name_singular, name_plural, symbol, is_base_unit
)
VALUES
	('metre', 'metres', 'm', 1),
    ('kilogram', 'kilograms', 'kg', 1),
    ('item', 'items', 'x', 0)
;

/*
# Unit of Measurement Conversion
INSERT INTO Shop_Unit_Measurement_Conversion (
	id_unit_derived, id_unit_base, power_unit_base, multiplier_unit_base, increment_unit_base
)
VALUES
	
;
*/

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