
/* Clear Store DataBase */
USE PARTS;


# Drop dependencies
DROP TABLE IF EXISTS Shop_User_Eval_Temp;
DROP TABLE IF EXISTS tmp_Msg_Error;
DROP TABLE IF EXISTS tmp_Currency;
DROP TABLE IF EXISTS tmp_Delivery_Region;
DROP TABLE IF EXISTS tmp_Region;
DROP TABLE IF EXISTS tmp_Shop_User;
DROP TABLE IF EXISTS tmp_Shop_Order;
DROP TABLE IF EXISTS tmp_Shop_Product;
DROP TABLE IF EXISTS tmp_Shop_Product_p_Shop_User_Eval;
DROP TABLE IF EXISTS tmp_Shop_Image;
DROP TABLE IF EXISTS tmp_Shop_Variation;
DROP TABLE IF EXISTS tmp_Shop_Discount;
DROP TABLE IF EXISTS tmp_Discount;
DROP TABLE IF EXISTS tmp_Shop_Category;
DROP TABLE IF EXISTS tmp_Shop_Product_Currency_Region_Link;
DROP TABLE IF EXISTS tmp_Shop_Product_Currency_Link;
DROP TABLE IF EXISTS tmp_User_Role_Link;
DROP TABLE IF EXISTS tmp_Shop_Basket;


# Delete old tables
DROP TABLE IF EXISTS Shop_User_Order_Product_Link_Audit;
DROP TABLE IF EXISTS Shop_User_Order_Product_Link;

DROP TABLE IF EXISTS Shop_User_Order_Audit;
DROP TABLE IF EXISTS Shop_User_Order;

DROP TABLE IF EXISTS Shop_User_Order_Status_Audit;
DROP TABLE IF EXISTS Shop_User_Order_Status;

DROP TABLE IF EXISTS Shop_User_Basket_Audit;
DROP TABLE IF EXISTS Shop_User_Basket;

DROP TABLE IF EXISTS Shop_Address_Audit;
DROP TABLE IF EXISTS Shop_Address;

DROP TABLE IF EXISTS Shop_User_Role_Link_Audit;
DROP TABLE IF EXISTS Shop_User_Role_Link;

DROP TABLE IF EXISTS Shop_User_Audit;
DROP TABLE IF EXISTS Shop_User;

DROP TABLE IF EXISTS Shop_Role_Permission_Link_Audit;
DROP TABLE IF EXISTS Shop_Role_Permission_Link;

DROP TABLE IF EXISTS Shop_Role_Audit;
DROP TABLE IF EXISTS Shop_Role;

DROP TABLE IF EXISTS Shop_Permission_Audit;
DROP TABLE IF EXISTS Shop_Permission;

DROP TABLE IF EXISTS Shop_Permission_Group_Audit;
DROP TABLE IF EXISTS Shop_Permission_Group;


DROP TABLE IF EXISTS Shop_Discount_Region_Currency_Link_Audit;
DROP TABLE IF EXISTS Shop_Discount_Region_Currency_Link;

DROP TABLE IF EXISTS Shop_Discount_Audit;
DROP TABLE IF EXISTS Shop_Discount;

DROP TABLE IF EXISTS Shop_Product_Delivery_Option_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Delivery_Option_Link;

DROP TABLE IF EXISTS Shop_Delivery_Option_Audit;
DROP TABLE IF EXISTS Shop_Delivery_Option;

DROP TABLE IF EXISTS Shop_Image_Audit;
DROP TABLE IF EXISTS Shop_Image;

DROP TABLE IF EXISTS Shop_Image_Type_Audit;
DROP TABLE IF EXISTS Shop_Image_Type;

DROP TABLE IF EXISTS Shop_Product_Currency_Region_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Currency_Region_Link;
DROP TABLE IF EXISTS Shop_Product_Currency_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Currency_Link;

DROP TABLE IF EXISTS Shop_Product_Variation_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Variation_Link;
DROP TABLE IF EXISTS Shop_Product_Permutation_Variation_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Permutation_Variation_Link;

DROP TABLE IF EXISTS Shop_Product_Permutation_Audit;
DROP TABLE IF EXISTS Shop_Product_Permutation;

DROP TABLE IF EXISTS Shop_Variation_Audit;
DROP TABLE IF EXISTS Shop_Variation;
DROP TABLE IF EXISTS Shop_Product_Variation_Type_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Variation_Type_Link;

DROP TABLE IF EXISTS Shop_Variation_Type_Audit;
DROP TABLE IF EXISTS Shop_Variation_Type;

DROP TABLE IF EXISTS Shop_Product_Audit;
DROP TABLE IF EXISTS Shop_Product;

DROP TABLE IF EXISTS Shop_Tax_Or_Surcharge_Audit;
DROP TABLE IF EXISTS Shop_Tax_Or_Surcharge;

DROP TABLE IF EXISTS Shop_Currency_Audit;
DROP TABLE IF EXISTS Shop_Currency;

DROP TABLE IF EXISTS Shop_Delivery_Region_Branch_Audit;
DROP TABLE IF EXISTS Shop_Delivery_Region_Branch;
DROP TABLE IF EXISTS Shop_Region_Branch_Audit;
DROP TABLE IF EXISTS Shop_Region_Branch;

DROP TABLE IF EXISTS Shop_Delivery_Region_Audit;
DROP TABLE IF EXISTS Shop_Delivery_Region;
DROP TABLE IF EXISTS Shop_Region_Audit;
DROP TABLE IF EXISTS Shop_Region;

DROP TABLE IF EXISTS Shop_Recurrence_Interval_Audit;
DROP TABLE IF EXISTS Shop_Recurrence_Interval;

DROP TABLE IF EXISTS Shop_Category_Audit;
DROP TABLE IF EXISTS Shop_Category;

DROP TABLE IF EXISTS Shop_General_Audit;
DROP TABLE IF EXISTS Shop_General;

DROP TABLE IF EXISTS File_Type_Audit;
DROP TABLE IF EXISTS File_Type;

DROP TABLE IF EXISTS Msg_Error_Type;

DROP TABLE IF EXISTS Shop_Access_Level_Audit;
DROP TABLE IF EXISTS Shop_Access_Level;

DROP TABLE IF EXISTS Shop_User_Change_Set;

DROP TABLE IF EXISTS Shop_Msg_Error_Type;

DROP TABLE IF EXISTS Shop_Product_Change_Set;

# Product Change Sets

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Change_Set';

CREATE TABLE Shop_Product_Change_Set (
	id_change_set INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	comment VARCHAR(500),
	updated_last_on DATETIME,
	updated_last_by VARCHAR(100)
);
# User Change Sets

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Change_Set';

CREATE TABLE IF NOT EXISTS Shop_User_Change_Set (
	id_change_set INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    comment VARCHAR(500),
    updated_last_on DATETIME,
    updated_last_by VARCHAR(100)
);
# Access Levels

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Access_Level';

CREATE TABLE IF NOT EXISTS Shop_Access_Level (
    id_access_level INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50),
    name VARCHAR(255),
    priority INT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Access_Level_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_User_Change_Set(id_change_set)
);
# Access Level Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Access_Level_Audit';

CREATE TABLE IF NOT EXISTS Shop_Access_Level_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_access_level INT NOT NULL,
    CONSTRAINT FK_Shop_Access_Level_Audit_id_access_level
		FOREIGN KEY (id_access_level)
        REFERENCES Shop_Access_Level(id_access_level)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Access_Level_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_User_Change_Set(id_change_set)
);
# Error Message Type

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Msg_Error_Type';

CREATE TABLE IF NOT EXISTS Shop_Msg_Error_Type (
	id_type INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50) NOT NULL,
	name VARCHAR(500) NOT NULL,
	description VARCHAR(1000)
);

# File Types

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'File_Type';
	
CREATE TABLE IF NOT EXISTS File_Type (
	id_type INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50),
	name VARCHAR(100),
	extension VARCHAR(50),
	created_on DATETIME,
	created_by VARCHAR(100),
	updated_last_on DATETIME,
	updated_last_by VARCHAR(100)
);

# File Type Audit

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'File_Type_Audit';

CREATE TABLE IF NOT EXISTS File_Type_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_type INT NOT NULL,
	CONSTRAINT FK_File_Type_Audit_id_type
		FOREIGN KEY (id_type)
		REFERENCES File_Type(id_type)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(500),
	value_new VARCHAR(500),
	created_on DATETIME,
	created_by VARCHAR(100),
	updated_last_on DATETIME,
	updated_last_by VARCHAR(100)
);
# Generic / shared properties

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_General';

CREATE TABLE IF NOT EXISTS Shop_General (
	id_general INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	quantity_max FLOAT,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT CHK_Shop_General_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Shop General Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_General_Audit';

CREATE TABLE IF NOT EXISTS Shop_General_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_general INT NOT NULL,
	CONSTRAINT FK_Shop_General_Audit_id_general
		FOREIGN KEY (id_general)
		REFERENCES Shop_General(id_general)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(500),
	value_new VARCHAR(500),
	id_change_set INT NOT NULL,
	CONSTRAINT FK_Shop_General_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Categories

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Category';

CREATE TABLE IF NOT EXISTS Shop_Category (
	id_category INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50),
	name VARCHAR(255),
	description VARCHAR(4000),
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_Category_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Category Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Category_Audit';

CREATE TABLE IF NOT EXISTS Shop_Category_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_category INT NOT NULL,
	CONSTRAINT FK_Shop_Category_Audit_id_category
		FOREIGN KEY (id_category)
		REFERENCES Shop_Category(id_category)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(500),
	value_new VARCHAR(500),
	id_change_set INT NOT NULL,
	CONSTRAINT FK_Shop_Category_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Recurrence Interval

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Recurrence_Interval';

CREATE TABLE IF NOT EXISTS Shop_Recurrence_Interval (
	id_interval INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50),
	name VARCHAR(255),
	name_plural VARCHAR(256),
    active BIT NOT NULL DEFAULT 1,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_Recurrence_Interval_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Recurrence Interval Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Recurrence_Interval_Audit';

CREATE TABLE IF NOT EXISTS Shop_Recurrence_Interval_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_interval INT NOT NULL,
	CONSTRAINT FK_Shop_Recurrence_Interval_Audit_id_interval
		FOREIGN KEY (id_interval)
		REFERENCES Shop_Recurrence_Interval(id_interval)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(256),
	value_new VARCHAR(256),
	id_change_set INT NOT NULL,
	CONSTRAINT FK_Shop_Recurrence_Interval_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Regions

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Region';

CREATE TABLE IF NOT EXISTS Shop_Region (
	id_region INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Region_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Region Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Region_Audit';

CREATE TABLE IF NOT EXISTS Shop_Region_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_region INT NOT NULL,
    CONSTRAINT FK_Shop_Region_Audit_id_region
		FOREIGN KEY (id_region)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    name_field VARCHAR(64) NOT NULL,
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Region_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Region Branchs

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Region_Branch';

CREATE TABLE IF NOT EXISTS Shop_Region_Branch (
	id_branch INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_region_parent INT NOT NULL,
    CONSTRAINT FK_Shop_Region_Branch_id_region_parent
		FOREIGN KEY (id_region_parent)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    id_region_child INT NOT NULL,
    CONSTRAINT FK_Shop_Region_Branch_id_region_child
		FOREIGN KEY (id_region_child)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    -- depth INT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Region_Branch_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Region Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Region_Branch_Audit';

CREATE TABLE IF NOT EXISTS Shop_Region_Branch_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_branch INT NOT NULL,
    CONSTRAINT FK_Shop_Region_Branch_Audit_id_branch
		FOREIGN KEY (id_branch)
        REFERENCES Shop_Region_Branch(id_branch)
        ON UPDATE RESTRICT,
    name_field VARCHAR(64) NOT NULL,
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Region_Branch_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Currencies

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Currency';

CREATE TABLE IF NOT EXISTS Shop_Currency (
    id_currency INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(255) NOT NULL,
    symbol VARCHAR(1) NOT NULL,
    factor_from_GBP FLOAT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Currency_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
# Currency Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Currency_Audit';

CREATE TABLE IF NOT EXISTS Shop_Currency_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_currency INT NOT NULL,
    CONSTRAINT FK_Shop_Currency_Audit_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Currency_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
# Taxes and Surcharges

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Tax_Or_Surcharge';

CREATE TABLE Shop_Tax_Or_Surcharge (
	id_tax INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
	id_region_buyer INT NOT NULL,
	CONSTRAINT FK_Shop_Tax_Or_Surcharge_id_region_buyer
		FOREIGN KEY (id_region_buyer) 
		REFERENCES Shop_Region(id_region),
	id_region_seller INT NOT NULL,
	CONSTRAINT FK_Shop_Tax_Or_Surcharge_id_region_seller
		FOREIGN KEY (id_region_seller) 
		REFERENCES Shop_Region(id_region),
    id_currency INT,
    CONSTRAINT FK_Shop_Tax_Or_Surcharge_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
        ON UPDATE RESTRICT,
    fixed_fee FLOAT NOT NULL DEFAULT 0,
	multiplier FLOAT NOT NULL DEFAULT 1 CHECK (multiplier > 0),
    apply_fixed_fee_before_multiplier BIT DEFAULT 1,
	quantity_min FLOAT NOT NULL DEFAULT 0,
    quantity_max FLOAT NOT NULL,
	active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_Tax_Or_Surcharge_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Tax Or Surcharge Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Tax_Or_Surcharge_Audit';

CREATE TABLE IF NOT EXISTS Shop_Tax_Or_Surcharge_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_tax INT NOT NULL,
    CONSTRAINT FK_Shop_Tax_Or_Surcharge_Audit_id_discount
		FOREIGN KEY (id_tax)
        REFERENCES Shop_Tax_Or_Surcharge(id_tax)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Tax_Or_Surcharge_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
# Products

USE PARTS;

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
		REFERENCES Shop_Category(id_category)
		ON UPDATE RESTRICT,
	latency_manuf INT,
	quantity_min FLOAT,
	quantity_max FLOAT,
	quantity_step FLOAT,
	quantity_stock FLOAT,
	is_subscription BIT,
	id_recurrence_interval INT,
	CONSTRAINT FK_Shop_Product_id_recurrence_interval
		FOREIGN KEY (id_recurrence_interval)
		REFERENCES Shop_Recurrence_Interval(id_interval),
	count_recurrence_interval INT,
	*/
    id_access_level_required INT NOT NULL,
    CONSTRAINT FK_Shop_Product_id_access_level_required
		FOREIGN KEY (id_access_level_required)
        REFERENCES Shop_Access_Level(id_access_level),
	# id_stripe_product VARCHAR(100),
	# id_stripe_price VARCHAR(100) NOT NULL,
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_Product_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Products

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_product INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Audit_id_product
		FOREIGN KEY (id_product)
		REFERENCES Shop_Product(id_product)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(500),
	value_new VARCHAR(500),
	id_change_set INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Variation Types

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Variation_Type';

CREATE TABLE IF NOT EXISTS Shop_Variation_Type (
	id_type INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50),
	name VARCHAR(255),
	name_plural VARCHAR(256),
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_Variation_Type_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Variation Type Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Variation_Type_Audit';

CREATE TABLE IF NOT EXISTS Shop_Variation_Type_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_type INT NOT NULL,
	CONSTRAINT FK_Shop_Variation_Type_Audit_id_type
		FOREIGN KEY (id_type)
		REFERENCES Shop_Variation_Type(id_type)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(500),
	value_new VARCHAR(500),
	id_change_set INT NOT NULL,
	CONSTRAINT FK_Shop_Variation_Type_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Variations

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Variation';

CREATE TABLE Shop_Variation (
	id_variation INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	id_type INT NOT NULL,
	CONSTRAINT FK_Shop_Variation_id_type
		FOREIGN KEY (id_type) 
		REFERENCES Shop_Variation_Type(id_type)
		ON UPDATE RESTRICT,
	code VARCHAR(50),
	name VARCHAR(255),
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_Variation_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Variation Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Variation_Audit';

CREATE TABLE IF NOT EXISTS Shop_Variation_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_variation INT NOT NULL,
	CONSTRAINT FK_Shop_Variation_Audit_id_variation
		FOREIGN KEY (id_variation)
		REFERENCES Shop_Variation(id_variation)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(500),
	value_new VARCHAR(500),
	id_change_set INT NOT NULL,
	CONSTRAINT FK_Shop_Variation_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Product Permutation

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation (
	id_permutation INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_product INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Variation_Link_id_product
		FOREIGN KEY (id_product)
		REFERENCES Shop_Product(id_product)
		ON UPDATE RESTRICT,
	-- name VARCHAR(255) NOT NULL,
	description VARCHAR(4000) NOT NULL,
	cost_local_manufacturing FLOAT NOT NULL,
    id_currency_cost_manufacturing INT NOT NULL,
	profit_local_min FLOAT NOT NULL,
    id_currency_profit_min INT NOT NULL,
	latency_manufacture INT NOT NULL,
	quantity_min FLOAT NOT NULL,
	quantity_max FLOAT NOT NULL,
	quantity_step FLOAT NOT NULL,
	quantity_stock FLOAT NOT NULL,
	is_subscription BIT NOT NULL,
	id_recurrence_interval INT,
	CONSTRAINT FK_Shop_Product_Permutation_id_recurrence_interval
		FOREIGN KEY (id_recurrence_interval)
		REFERENCES Shop_Recurrence_Interval(id_interval),
	count_recurrence_interval INT,
    id_access_level_required INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Permutation_id_access_level_required
		FOREIGN KEY (id_access_level_required)
        REFERENCES Shop_Access_Level(id_access_level),
	id_stripe_product VARCHAR(100) NULL,
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_Product_Variation_Link_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Product Permutation Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_permutation INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Permutation_Audit_id_permutation
		FOREIGN KEY (id_permutation)
		REFERENCES Shop_Product_Permutation(id_permutation)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(500),
	value_new VARCHAR(500),
	id_change_set INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Permutation_Audit_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
		ON UPDATE RESTRICT
);

# Product Permutation Variation Link

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation_Variation_Link';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation_Variation_Link (
	id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_permutation INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Permutation_Variation_Link_id_permutation
		FOREIGN KEY (id_permutation)
		REFERENCES Shop_Product_Permutation(id_permutation)
		ON UPDATE RESTRICT,
	id_variation INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Permutation_Variation_Link_id_variation
		FOREIGN KEY (id_variation)
		REFERENCES Shop_Variation(id_variation)
		ON UPDATE RESTRICT,
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_Product_Permutation_Variation_Link_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Product Permutation Variation Link Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation_Variation_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation_Variation_Link_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_link INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Permutation_Variation_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Product_Permutation_Variation_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Permutation_Variation_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
# Product Currency link

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Currency_Link';

CREATE TABLE IF NOT EXISTS Shop_Product_Currency_Link (
    id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_product INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Link_id_product
		FOREIGN KEY (id_product)
        REFERENCES Shop_Product(id_product)
        ON UPDATE RESTRICT,
    id_permutation INT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Link_id_permutation
		FOREIGN KEY (id_permutation)
        REFERENCES Shop_Product_Permutation(id_permutation)
        ON UPDATE RESTRICT,
    id_currency INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Link_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
        ON UPDATE RESTRICT,
    id_region_purchase INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Link_id_region_purchase
		FOREIGN KEY (id_region_purchase)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    price_local_VAT_incl FLOAT NULL,
    price_local_VAT_excl FLOAT NULL,
	id_stripe_price VARCHAR(200),
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Product_Currency_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Product Currency Region link

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Currency_Region_Link';

CREATE TABLE IF NOT EXISTS Shop_Product_Currency_Region_Link (
    id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_product INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Region_Link_id_product
		FOREIGN KEY (id_product)
        REFERENCES Shop_Product(id_product)
        ON UPDATE RESTRICT,
    id_permutation INT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Region_Link_id_permutation
		FOREIGN KEY (id_permutation)
        REFERENCES Shop_Product_Permutation(id_permutation)
        ON UPDATE RESTRICT,
    id_currency INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Region_Link_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
        ON UPDATE RESTRICT,
    id_region_purchase INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Region_Link_id_region_purchase
		FOREIGN KEY (id_region_purchase)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    price_local_VAT_incl FLOAT NULL,
    price_local_VAT_excl FLOAT NULL,
	id_stripe_price VARCHAR(200),
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Product_Currency_Region_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Product Currency Link Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Currency_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Currency_Link_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_link INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Product_Currency_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Product Currency Region Link Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Currency_Region_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Currency_Region_Link_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_link INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Region_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Product_Currency_Region_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Region_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Image Types

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Image_Type';

CREATE TABLE IF NOT EXISTS Shop_Image_Type (
	id_type INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50),
	name VARCHAR(255),
	name_plural VARCHAR(256),
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_Image_Type_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Image Type Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Image_Type_Audit';

CREATE TABLE IF NOT EXISTS Shop_Image_Type_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_type INT NOT NULL,
    CONSTRAINT FK_Shop_Image_Type_Audit_id_type
		FOREIGN KEY (id_type)
        REFERENCES Shop_Image_Type(id_type)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Image_Type_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Images

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Image';

CREATE TABLE IF NOT EXISTS Shop_Image (
    id_image INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_type_image INT NOT NULL,
    CONSTRAINT FK_Shop_Image_id_type_image
		FOREIGN KEY (id_type_image) 
        REFERENCES Shop_Image_Type(id_type),
    id_type_file INT NOT NULL,
    CONSTRAINT FK_Shop_Image_id_type_file
		FOREIGN KEY (id_type_file) 
        REFERENCES File_Type(id_type),
    id_product INT NULL,
    CONSTRAINT FK_Shop_Image_id_product
		FOREIGN KEY (id_product) 
        REFERENCES Shop_Product(id_product),
    id_permutation INT NULL,
    CONSTRAINT FK_Shop_Image_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    url VARCHAR(255),
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Image_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Image Type Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Image_Audit';

CREATE TABLE IF NOT EXISTS Shop_Image_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_image INT NOT NULL,
    CONSTRAINT FK_Shop_Image_Audit_id_image
		FOREIGN KEY (id_image)
        REFERENCES Shop_Image(id_image),
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Image_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Delivery Options

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Delivery_Option';

CREATE TABLE IF NOT EXISTS Shop_Delivery_Option (
	id_option INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(4000),
    latency_delivery_min INT NOT NULL,
    latency_delivery_max INT NOT NULL,
    quantity_min INT NOT NULL,
    quantity_max INT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Delivery_Option_Type_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Delivery Option Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Delivery_Option_Audit';

CREATE TABLE IF NOT EXISTS Shop_Delivery_Option_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_option INT NOT NULL,
    CONSTRAINT FK_Shop_Delivery_Option_Audit_id_option
		FOREIGN KEY (id_option)
        REFERENCES Shop_Delivery_Option(id_option)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Delivery_Option_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Delivery Option

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Delivery_Option_Link';

CREATE TABLE IF NOT EXISTS Shop_Product_Delivery_Option_Link (
    id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_product INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Delivery_Option_Link_id_product
		FOREIGN KEY (id_product)
        REFERENCES Shop_Product(id_product)
        ON UPDATE RESTRICT,
    id_permutation INT,
    CONSTRAINT FK_Shop_Product_Delivery_Option_Link_id_permutation
		FOREIGN KEY (id_permutation)
        REFERENCES Shop_Product_Permutation(id_permutation)
        ON UPDATE RESTRICT,
    id_delivery_option INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Delivery_Option_Link_id_delivery_option
		FOREIGN KEY (id_delivery_option)
        REFERENCES Shop_Delivery_Option(id_option)
        ON UPDATE RESTRICT,
    id_region INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Delivery_Option_Link_id_region
		FOREIGN KEY (id_region)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    id_currency INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Delivery_Option_Link_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
        ON UPDATE RESTRICT,
	price_local FLOAT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Product_Delivery_Option_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Delivery Option Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Delivery_Option_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Delivery_Option_Link_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_link INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Delivery_Option_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Product_Delivery_Option_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(64) NOT NULL,
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Delivery_Option_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Discounts

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Discount';

CREATE TABLE Shop_Discount (
	id_discount INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
	id_product INT NOT NULL,
	CONSTRAINT FK_Shop_Discount_id_product
		FOREIGN KEY (id_product) 
		REFERENCES Shop_Product(id_product),
    id_permutation INT,
    CONSTRAINT FK_Shop_Discount_id_permutation
		FOREIGN KEY (id_permutation)
        REFERENCES Shop_Product_Permutation(id_permutation)
        ON UPDATE RESTRICT,
	/*
     id_delivery_region INT,
    CONSTRAINT FK_Shop_Discount_id_delivery_region
		FOREIGN KEY (id_delivery_region)
        REFERENCES Shop_Delivery_Region(id_region)
        ON UPDATE RESTRICT,
    id_currency INT,
    CONSTRAINT FK_Shop_Discount_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
        ON UPDATE RESTRICT,
	*/
	multiplier FLOAT NOT NULL DEFAULT 1 CHECK (multiplier > 0),
    subtractor FLOAT NOT NULL DEFAULT 0,
    apply_multiplier_first BIT DEFAULT 1,
	quantity_min FLOAT NOT NULL DEFAULT 0,
    quantity_max FLOAT NOT NULL,
    date_start DATETIME NOT NULL,
    date_end DATETIME NOT NULL,
	active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_Discount_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Discount Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Discount_Audit';

CREATE TABLE IF NOT EXISTS Shop_Discount_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_discount INT NOT NULL,
    CONSTRAINT FK_Shop_Discount_Audit_id_discount
		FOREIGN KEY (id_discount)
        REFERENCES Shop_Discount(id_discount)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Discount_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
# Discount Region Currency Link

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Discount_Region_Currency_Link';

CREATE TABLE IF NOT EXISTS Shop_Discount_Region_Currency_Link (
    id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_discount INT NOT NULL,
    CONSTRAINT FK_Shop_Discount_Region_Currency_Link_id_discount
		FOREIGN KEY (id_discount)
        REFERENCES Shop_Discount(id_discount)
        ON UPDATE RESTRICT,
    id_region INT NOT NULL,
    CONSTRAINT FK_Shop_Discount_Region_Currency_Link_id_region
		FOREIGN KEY (id_region)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    id_currency INT NOT NULL,
    CONSTRAINT FK_Shop_Discount_Region_Currency_Link_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
        ON UPDATE RESTRICT,
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Discount_Region_Currency_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Discount Region Currency Link Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Discount_Region_Currency_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Discount_Region_Currency_Link_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_link INT NOT NULL,
    CONSTRAINT FK_Shop_Discount_Region_Currency_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Discount_Region_Currency_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Discount_Region_Currency_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
# Permission Groups

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Permission_Group';

CREATE TABLE IF NOT EXISTS Shop_Permission_Group (
    id_group INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50),
    name VARCHAR(255),
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Permission_Group_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
# Permission Group Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Permission_Group_Audit';

CREATE TABLE IF NOT EXISTS Shop_Permission_Group_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_group INT NOT NULL,
    CONSTRAINT FK_Shop_Permission_Group_Audit_id_group
		FOREIGN KEY (id_group)
        REFERENCES Shop_Permission_Group(id_group)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Permission_Group_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
# Permissions

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Permission';

CREATE TABLE IF NOT EXISTS Shop_Permission (
    id_permission INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50),
    name VARCHAR(255),
    id_permission_group INT NOT NULL,
    CONSTRAINT FK_Shop_Permission_id_permission_group
		FOREIGN KEY (id_permission_group)
        REFERENCES Shop_Permission_Group(id_group)
        ON UPDATE RESTRICT,
    id_access_level_required INT NOT NULL,
    CONSTRAINT FK_Shop_Permission_id_access_level_required
		FOREIGN KEY (id_access_level_required)
        REFERENCES Shop_Access_Level(id_access_level),
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
	CONSTRAINT FK_Shop_Permission_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_User_Change_Set(id_change_set)
);
# Permission Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Permission_Audit';

CREATE TABLE IF NOT EXISTS Shop_Permission_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_permission INT NOT NULL,
    CONSTRAINT FK_Shop_Permission_Audit_id_permission
		FOREIGN KEY (id_permission)
        REFERENCES Shop_Permission(id_permission)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Permission_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
# Roles

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Role';

CREATE TABLE IF NOT EXISTS Shop_Role (
    id_role INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50),
    name VARCHAR(255),
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Role_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_User_Change_Set(id_change_set)
);
# Role Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Role_Audit';

CREATE TABLE Shop_Role_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_role INT NOT NULL,
    CONSTRAINT FK_Shop_Role_Audit_id_role
		FOREIGN KEY (id_role)
        REFERENCES Shop_Role(id_role)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Role_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
# Role Permission link

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Role_Permission_Link';

CREATE TABLE IF NOT EXISTS Shop_Role_Permission_Link (
    id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_role INT,
    CONSTRAINT FK_Shop_Role_Permission_Link_id_role
		FOREIGN KEY (id_role)
        REFERENCES Shop_Role(id_role)
        ON UPDATE RESTRICT,
    id_permission INT,
    CONSTRAINT FK_Shop_Role_Permission_Link_id_permission
		FOREIGN KEY (id_permission)
        REFERENCES Shop_Permission(id_permission)
        ON UPDATE RESTRICT,
    id_access_level INT,
    CONSTRAINT FK_Shop_Role_Permission_Link_id_access_level
		FOREIGN KEY (id_access_level)
        REFERENCES Shop_Access_Level(id_access_level),
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Role_Permission_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);
# Role Permission link Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Role_Permission_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Role_Permission_Link_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_link INT NOT NULL,
    CONSTRAINT FK_Shop_Role_Permission_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Role_Permission_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Role_Permission_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);
# Users

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User';

CREATE TABLE IF NOT EXISTS Shop_User (
    id_user VARCHAR(200) NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(254) NOT NULL,
    email_verified BIT NOT NULL DEFAULT 0,
    is_super_user BIT NOT NULL DEFAULT 0,
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_User_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);

# User Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Audit';

CREATE TABLE IF NOT EXISTS Shop_User_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user VARCHAR(200) NOT NULL,
    CONSTRAINT FK_Shop_User_Audit_id_user
		FOREIGN KEY (id_user)
        REFERENCES Shop_User(id_user)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_User_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
# User Role link

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Role_Link';

CREATE TABLE IF NOT EXISTS Shop_User_Role_Link (
    id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user VARCHAR(200) NOT NULL,
    CONSTRAINT FK_Shop_User_Role_Link_id_user
		FOREIGN KEY (id_user)
        REFERENCES Shop_User(id_user)
        ON UPDATE RESTRICT,
    id_role INT NOT NULL,
    CONSTRAINT FK_Shop_User_Role_Link_id_role
		FOREIGN KEY (id_role)
        REFERENCES Shop_Role(id_role),
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_User_Role_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);
# User Role Link Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Role_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_User_Role_Link_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_link INT NOT NULL,
    CONSTRAINT FK_Shop_User_Role_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_User_Role_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_User_Role_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);

# Addresses

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Address';

CREATE TABLE Shop_Address (
    id_address INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user VARCHAR(200) NOT NULL,
    CONSTRAINT FK_Shop_Address_id_user
		FOREIGN KEY (id_user)
        REFERENCES Shop_User(id_user)
        ON UPDATE RESTRICT,
    -- region VARCHAR(100) NOT NULL,
    id_region INT NOT NULL,
    name_full VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    postcode VARCHAR(20) NOT NULL,
    address_line_1 VARCHAR(100) NOT NULL,
    address_line_2 VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    county VARCHAR(100) NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Address_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);
# Address Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Address_Audit';

CREATE TABLE IF NOT EXISTS Shop_Address_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_address INT NOT NULL,
    CONSTRAINT FK_Shop_Address_Audit_id_address
		FOREIGN KEY (id_address)
        REFERENCES Shop_Address(id_address)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Address_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
# User Basket (Product Link)

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Basket';

CREATE TABLE IF NOT EXISTS Shop_User_Basket (
	id_item INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_user VARCHAR(200) NOT NULL,
	CONSTRAINT FK_Shop_User_Basket_id_user
		FOREIGN KEY (id_user)
		REFERENCES Shop_User(id_user)
		ON UPDATE RESTRICT,
	id_product INT NOT NULL,
	CONSTRAINT FK_Shop_User_Basket_id_product
		FOREIGN KEY (id_product)
		REFERENCES Shop_Product(id_product)
		ON UPDATE RESTRICT,
	id_permutation INT,
	CONSTRAINT FK_Shop_User_Basket_id_permutation
		FOREIGN KEY (id_permutation)
		REFERENCES Shop_Product_Permutation(id_permutation)
		ON UPDATE RESTRICT,
	quantity INT NOT NULL,
	active BIT NOT NULL DEFAULT 1,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set_user INT,
	CONSTRAINT FK_Shop_User_Basket_id_change_set_user
		FOREIGN KEY (id_change_set_user)
		REFERENCES Shop_User_Change_Set(id_change_set)
        /*
	id_change_set_product INT,
	CONSTRAINT FK_Shop_User_Basket_id_change_set_product
		FOREIGN KEY (id_change_set_product)
		REFERENCES Shop_Product_Change_Set(id_change_set)
        */
);

# Product Basket Audits
USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Basket_Audit';

CREATE TABLE IF NOT EXISTS Shop_User_Basket_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_item INT NOT NULL,
	CONSTRAINT FK_Shop_User_Basket_Audit_id_link
		FOREIGN KEY (id_item)
		REFERENCES Shop_User_Basket(id_item)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(500),
	value_new VARCHAR(500),
	id_change_set_user INT,
	CONSTRAINT FK_Shop_User_Basket_Audit_id_change_set_user
		FOREIGN KEY (id_change_set_user)
		REFERENCES Shop_User_Change_Set(id_change_set)
	/*
	id_change_set_product INT,
	CONSTRAINT FK_Shop_User_Basket_Audit_id_change_set_product
		FOREIGN KEY (id_change_set_product)
		REFERENCES Shop_Product_Change_Set(id_change_set)
	*/
);

# User Order Types

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Order_Status';

CREATE TABLE IF NOT EXISTS Shop_User_Order_Status (
	id_status INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50),
	name VARCHAR(255),
	name_plural VARCHAR(256),
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_User_Order_Status_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_User_Change_Set(id_change_set)
);

# Order Type Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Order_Status_Audit';

CREATE TABLE IF NOT EXISTS Shop_User_Order_Status_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_status INT NOT NULL,
    CONSTRAINT FK_Shop_User_Order_Status_Audit_id_status
		FOREIGN KEY (id_status)
        REFERENCES Shop_User_Order_Status(id_status)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_User_Order_Status_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# User Order

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Order';

CREATE TABLE IF NOT EXISTS Shop_User_Order (
	id_order INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_user VARCHAR(200) NOT NULL,
	CONSTRAINT FK_Shop_User_Order_id_user
		FOREIGN KEY (id_user)
		REFERENCES Shop_User(id_user)
		ON UPDATE RESTRICT,
	value_total FLOAT,
	id_order_status INT NOT NULL,
	CONSTRAINT FK_Shop_User_Order_id_order_status
		FOREIGN KEY (id_order_status)
		REFERENCES Shop_User_Order_Status(id_status),
	id_checkout_session VARCHAR(200) NOT NULL,
	id_currency INT NOT NULL,
	CONSTRAINT FK_Shop_User_Order_id_currency
		FOREIGN KEY (id_currency)
		REFERENCES Shop_Currency(id_currency)
		ON UPDATE RESTRICT,
	active BIT NOT NULL DEFAULT 1,
	created_on DATETIME,
	created_by VARCHAR(100),
	id_change_set_user INT,
	CONSTRAINT FK_Shop_User_Order_id_change_set_user
		FOREIGN KEY (id_change_set_user)
		REFERENCES Shop_User_Change_Set(id_change_set)
        /*
	id_change_set_product INT,
	CONSTRAINT FK_Shop_User_Basket_id_change_set_product
		FOREIGN KEY (id_change_set_product)
		REFERENCES Shop_Product_Change_Set(id_change_set)
        */
);

# User Order Audits
USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Order_Audit';

CREATE TABLE IF NOT EXISTS Shop_User_Order_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_order INT NOT NULL,
	CONSTRAINT FK_Shop_User_Order_Audit_id_order
		FOREIGN KEY (id_order)
		REFERENCES Shop_User_Order(id_order)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(500),
	value_new VARCHAR(500),
	id_change_set_user INT,
	CONSTRAINT FK_Shop_User_Order_Audit_id_change_set_user
		FOREIGN KEY (id_change_set_user)
		REFERENCES Shop_User_Change_Set(id_change_set)
	/*
	id_change_set_product INT,
	CONSTRAINT FK_Shop_User_Basket_Audit_id_change_set_product
		FOREIGN KEY (id_change_set_product)
		REFERENCES Shop_Product_Change_Set(id_change_set)
	*/
);

# User Order Product link

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Order_Product_Link';

CREATE TABLE IF NOT EXISTS Shop_User_Order_Product_Link (
    id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_order INT NOT NULL,
    CONSTRAINT FK_Shop_User_Order_Product_Link_id_order
		FOREIGN KEY (id_order)
        REFERENCES Shop_User_Order(id_order)
        ON UPDATE RESTRICT,
    id_product INT NOT NULL,
    CONSTRAINT FK_Shop_User_Order_Product_Link_id_product
		FOREIGN KEY (id_product)
        REFERENCES Shop_Product(id_product)
        ON UPDATE RESTRICT,
    id_permutation INT NULL,
    CONSTRAINT FK_Shop_User_Order_Product_Link_id_permutation
		FOREIGN KEY (id_permutation)
        REFERENCES Shop_Product_Permutation(id_permutation)
        ON UPDATE RESTRICT,
	quantity FLOAT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_User_Order_Product_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);
# User Order Product Link Audits

USE PARTS;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Order_Product_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_User_Order_Product_Link_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_link INT NOT NULL,
    CONSTRAINT FK_Shop_User_Order_Product_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_User_Order_Product_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_User_Order_Product_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);

# Shop User Change Set

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_User_Change_Set;


DELIMITER //
CREATE TRIGGER before_insert_Shop_User_Change_Set
BEFORE INSERT ON Shop_User_Change_Set
FOR EACH ROW
BEGIN
	IF NEW.updated_last_on <=> NULL THEN
		SET NEW.updated_last_on = NOW();
	END IF;
	IF NEW.updated_last_by <=> NULL THEN
		SET NEW.updated_last_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;
# Shop Access Level

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Access_Level;
DROP TRIGGER IF EXISTS before_update_Shop_Access_Level;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Access_Level
BEFORE INSERT ON Shop_Access_Level
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Access_Level
BEFORE UPDATE ON Shop_Access_Level
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Access_Level_Audit (
		id_access_level,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_access_level, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT (OLD.code <=> NEW.code)
    UNION
    # Changed name
	SELECT NEW.id_access_level, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT (OLD.name <=> NEW.name)
    UNION
    # Changed priority
	SELECT NEW.id_access_level, 'priority', CONVERT(OLD.priority, CHAR), CONVERT(NEW.priority, CHAR), NEW.id_change_set
		WHERE NOT (OLD.priority <=> NEW.priority)
	UNION
	# Changed active
	SELECT NEW.id_access_level, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    UNION
    # Changed display_order
	SELECT NEW.id_access_level, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
	;
END //
DELIMITER ;

# Product Change Set

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Product_Change_Set;

DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Change_Set
BEFORE INSERT ON Shop_Product_Change_Set
FOR EACH ROW
BEGIN
	IF NEW.updated_last_on <=> NULL THEN
		SET NEW.updated_last_on = NOW();
	END IF;
	IF NEW.updated_last_by <=> NULL THEN
		SET NEW.updated_last_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;

# File Type

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_File_Type;
DROP TRIGGER IF EXISTS before_update_File_Type;

DELIMITER //
CREATE TRIGGER before_insert_File_Type
BEFORE INSERT ON File_Type
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_update_File_Type
BEFORE UPDATE ON File_Type
FOR EACH ROW
BEGIN
    INSERT INTO File_Type_Audit (
		id_type,
        name_field,
        value_prev,
        value_new
    )
    # Changed code
	SELECT NEW.id_type, 'code', OLD.code, NEW.code
		WHERE NOT OLD.code <=> NEW.code
	UNION
    # Changed name
	SELECT NEW.id_type, 'name', OLD.name, NEW.name
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed extension
	SELECT NEW.id_type, 'extension', CONVERT(OLD.extension, CHAR), CONVERT(NEW.extension, CHAR)
		WHERE NOT OLD.extension <=> NEW.extension
    ;
END //
DELIMITER ;

# File Type Audits

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_File_Type_Audit;
DROP TRIGGER IF EXISTS before_update_File_Type_Audit;


DELIMITER //
CREATE TRIGGER before_insert_File_Type_Audit
BEFORE INSERT ON File_Type_Audit
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_update_File_Type_Audit
BEFORE UPDATE ON File_Type_Audit
FOR EACH ROW
BEGIN
    SET NEW.updated_last_on = NOW();
    SET NEW.updated_last_by = CURRENT_USER();
END //
DELIMITER ;
# Shop General

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_General;
DROP TRIGGER IF EXISTS before_update_Shop_General;

DELIMITER //
CREATE TRIGGER before_insert_Shop_General
BEFORE INSERT ON Shop_General
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_update_Shop_General
BEFORE UPDATE ON Shop_General
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_General_Audit (
		id_general,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed quantity max
	SELECT NEW.id_general, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
	;
END //
DELIMITER ;
# Shop Category

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Category;
DROP TRIGGER IF EXISTS before_update_Shop_Category;

DELIMITER //
CREATE TRIGGER before_insert_Shop_Category
BEFORE INSERT ON Shop_Category
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_update_Shop_Category
BEFORE UPDATE ON Shop_Category
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Category_Audit (
		id_category,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_category, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
    # Changed name
	SELECT NEW.id_category, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	# Changed description
	SELECT NEW.id_category, 'description', OLD.description, NEW.description, NEW.id_change_set
		WHERE NOT OLD.description <=> NEW.description
	UNION
	# Changed active
	SELECT NEW.id_category, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
    # Changed display_order
	SELECT NEW.id_category, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END //
DELIMITER ;

# Shop Recurrence Interval

USE PARTS;


DROP TRIGGER IF EXISTS before_insert_Shop_Recurrence_Interval;
DROP TRIGGER IF EXISTS before_update_Shop_Recurrence_Interval;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Recurrence_Interval
BEFORE INSERT ON Shop_Recurrence_Interval
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Recurrence_Interval
BEFORE UPDATE ON Shop_Recurrence_Interval
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Recurrence_Interval_Audit (
		id_interval,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_interval, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_interval, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed name_plural
	SELECT NEW.id_interval, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
    UNION
    # Changed name
	SELECT NEW.id_interval, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
	;
END //
DELIMITER ;
# Shop Delivery Region

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Region;
DROP TRIGGER IF EXISTS before_update_Shop_Region;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Region
BEFORE INSERT ON Shop_Region
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Region
BEFORE UPDATE ON Shop_Region
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Region_Audit (
		id_region,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_region, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_region, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed active
	SELECT NEW.id_region, 'active', CONVERT(OLD.active, CHAR), CONVERT(NEW.active, CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    UNION
    # Changed display_order
	SELECT NEW.id_region, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END //
DELIMITER ;

# Shop Region Branch

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Region_Branch;
DROP TRIGGER IF EXISTS before_update_Shop_Region_Branch;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Region_Branch
BEFORE INSERT ON Shop_Region_Branch
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Region_Branch
BEFORE UPDATE ON Shop_Region_Branch
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Region_Branch_Audit (
		id_branch,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    # Changed depth
	SELECT NEW.id_branch, 'depth', CONVERT(OLD.depth, CHAR), CONVERT(NEW.depth, CHAR), NEW.id_change_set
		WHERE NOT OLD.depth <=> NEW.depth
    UNION
    */
    # Changed active
	SELECT NEW.id_branch, 'active', CONVERT(OLD.active, CHAR), CONVERT(NEW.active, CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    UNION
    # Changed display_order
	SELECT NEW.id_branch, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END //
DELIMITER ;

# Shop Currency

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Currency;
DROP TRIGGER IF EXISTS before_update_Shop_Currency;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Currency
BEFORE INSERT ON Shop_Currency
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Currency
BEFORE UPDATE ON Shop_Currency
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Currency_Audit (
		id_currency,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_currency, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
    # Changed name
	SELECT NEW.id_currency, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
    # Changed symbol
	SELECT NEW.id_currency, 'symbol', OLD.symbol, NEW.symbol, NEW.id_change_set
		WHERE NOT OLD.symbol <=> NEW.symbol
	UNION
    # Changed ratio_2_GBP
	SELECT NEW.id_currency, 'factor_from_GBP', OLD.factor_from_GBP, NEW.factor_from_GBP, NEW.id_change_set
		WHERE NOT OLD.factor_from_GBP <=> NEW.factor_from_GBP
	UNION
	# Changed active
	SELECT NEW.id_currency, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_currency, 'display_order', CONVERT(display_order, CHAR), CONVERT(display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;
END //
DELIMITER ;
# Shop Tax_Or_Surcharge

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Tax_Or_Surcharge;
DROP TRIGGER IF EXISTS before_update_Shop_Tax_Or_Surcharge;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Tax_Or_Surcharge
BEFORE INSERT ON Shop_Tax_Or_Surcharge
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_update_Shop_Tax_Or_Surcharge
BEFORE UPDATE ON Shop_Tax_Or_Surcharge
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Tax_Or_Surcharge_Audit (
		id_tax,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_tax, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_tax, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed fixed_fee
	SELECT NEW.id_tax, 'fixed_fee', OLD.fixed_fee, NEW.fixed_fee, NEW.id_change_set
		WHERE NOT OLD.fixed_fee <=> NEW.fixed_fee
    UNION
    # Changed multiplier
	SELECT NEW.id_tax, 'multiplier', OLD.multiplier, NEW.multiplier, NEW.id_change_set
		WHERE NOT OLD.multiplier <=> NEW.multiplier
    UNION
    # Changed apply_fixed_fee_before_multiplier
	SELECT NEW.id_tax, 'apply_fixed_fee_before_multiplier', CONVERT(CONVERT(OLD.apply_fixed_fee_before_multiplier, SIGNED), CHAR), CONVERT(CONVERT(NEW.apply_fixed_fee_before_multiplier, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.apply_fixed_fee_before_multiplier <=> NEW.apply_fixed_fee_before_multiplier
    UNION
    # Changed quantity_min
	SELECT NEW.id_tax, 'quantity_min', OLD.quantity_min, NEW.quantity_min, NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
    UNION
    # Changed quantity_max
	SELECT NEW.id_tax, 'quantity_max', OLD.quantity_max, NEW.quantity_max, NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
    UNION
    # Changed display_order
	SELECT NEW.id_tax, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    UNION
    # Changed active
	SELECT NEW.id_tax, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;


# Shop Product

USE PARTS;


DROP TRIGGER IF EXISTS before_insert_Shop_Product;
DROP TRIGGER IF EXISTS before_update_Shop_Product;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Product
BEFORE INSERT ON Shop_Product
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Product
BEFORE UPDATE ON Shop_Product
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
	/*
    IF NOT NEW.has_variations THEN
		IF ISNULL(NEW.price_GBP_full) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have price or variations (with prices).';
		END IF;
		IF ISNULL(NEW.price_GBP_min) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have minimum price or variations (with prices).';
		END IF;
		IF ISNULL(NEW.latency_manuf) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have manufacturing latency or variations (with manufacturing latencies).';
		END IF;
		IF ISNULL(NEW.quantity_min) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have minimum quantity or variations (with minimum quantities).';
		END IF;
		IF ISNULL(NEW.quantity_max) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have maximum quantity or variations (with maximum quantities).';
		END IF;
		IF ISNULL(NEW.quantity_step) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have increment of quantity or variations (with increments of quantities).';
		END IF;
		IF ISNULL(NEW.quantity_stock) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have stock quantity or variations (with stock quantities).';
		END IF;
		IF ISNULL(NEW.is_subscription) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have subscription status or variations (with subscription statuses).';
		END IF;
		IF ISNULL(NEW.id_recurrence_interval) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have recurrence interval or variations (with recurrence intervals).';
		END IF;
		IF ISNULL(NEW.count_recurrence_interval) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have recurrence interval count or variations (with recurrence interval counts).';
		END IF;
    END IF;
    */
    
    INSERT INTO Shop_Product_Audit (
		id_product,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed name
	SELECT NEW.id_product, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    /*
    UNION
    # Changed description
	SELECT NEW.id_product, 'description', OLD.description, NEW.description, NEW.id_change_set
		WHERE NOT OLD.description <=> NEW.description
    UNION
    # Changed price_GBP_full
	SELECT NEW.id_product, 'price_GBP_full', CONVERT(OLD.price_GBP_full, CHAR), CONVERT(NEW.price_GBP_full, CHAR), NEW.id_change_set
		WHERE NOT OLD.price_GBP_full <=> NEW.price_GBP_full
	UNION
    # Changed price_GBP_min
	SELECT NEW.id_product, 'price_GBP_min', CONVERT(OLD.price_GBP_min, CHAR), CONVERT(NEW.price_GBP_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.price_GBP_min <=> NEW.price_GBP_min
	UNION
    # Changed has_variations
	SELECT NEW.id_product, 'has_variations', CONVERT(CONVERT(NEW.has_variations, SIGNED), CHAR), CONVERT(CONVERT(NEW.has_variations, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.has_variations <=> NEW.has_variations
	UNION
    /*
    # Changed discount
	SELECT NEW.id_product, 'discount', CONVERT(OLD.discount, CHAR), CONVERT(NEW.discount, CHAR), NEW.id_change_set
		WHERE NOT OLD.discount <=> NEW.discount
    */
	UNION
    # Changed id_category
	SELECT NEW.id_product, 'id_category', CONVERT(OLD.id_category, CHAR), CONVERT(NEW.id_category, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_category <=> NEW.id_category
	/*
    UNION
    # Changed latency_manuf
	SELECT NEW.id_product, 'latency_manuf', CONVERT(OLD.latency_manuf, CHAR), CONVERT(NEW.latency_manuf, CHAR), NEW.id_change_set
		WHERE NOT OLD.latency_manuf <=> NEW.latency_manuf
	UNION
    # Changed quantity_min
	SELECT NEW.id_product, 'quantity_min', CONVERT(OLD.quantity_min, CHAR), CONVERT(NEW.quantity_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
	UNION
    # Changed quantity_max
	SELECT NEW.id_product, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
	UNION
    # Changed quantity_step
	SELECT NEW.id_product, 'quantity_step', CONVERT(OLD.quantity_step, CHAR), CONVERT(NEW.quantity_step, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_step <=> NEW.quantity_step
	UNION
    # Changed quantity_stock
	SELECT NEW.id_product, 'quantity_stock', CONVERT(OLD.quantity_stock, CHAR), CONVERT(NEW.quantity_stock, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_stock <=> NEW.quantity_stock
    UNION
    # Changed is_subscription
	SELECT NEW.id_product, 'is_subscription', CONVERT(CONVERT(OLD.is_subscription, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_subscription, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.is_subscription <=> NEW.is_subscription
	UNION
    # Changed id_recurrence_interval
	SELECT NEW.id_product, 'id_recurrence_interval', CONVERT(OLD.id_recurrence_interval, CHAR), CONVERT(NEW.id_recurrence_interval, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_recurrence_interval <=> NEW.id_recurrence_interval
    UNION
    # Changed count_recurrence_interval
	SELECT NEW.id_product, 'count_recurrence_interval', CONVERT(OLD.count_recurrence_interval, CHAR), CONVERT(NEW.count_recurrence_interval, CHAR), NEW.id_change_set
		WHERE NOT OLD.count_recurrence_interval <=> NEW.count_recurrence_interval
	UNION
    # Changed id_access_level_required
	SELECT NEW.id_product, 'id_access_level_required', CONVERT(OLD.id_access_level_required, CHAR), CONVERT(NEW.id_access_level_required, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_access_level_required <=> NEW.id_access_level_required
	UNION
    # Changed id_stripe_product
	SELECT NEW.id_product, 'id_stripe_product', OLD.id_stripe_product, NEW.id_stripe_product, NEW.id_change_set
		WHERE NOT OLD.id_stripe_product <=> NEW.id_stripe_product
    /*
    UNION
    # Changed id_stripe_price
	SELECT NEW.id_product, 'id_stripe_price', OLD.id_stripe_price, NEW.id_stripe_price, NEW.id_change_set
		WHERE NOT OLD.id_stripe_price <=> NEW.id_stripe_price
	*/
    UNION
	# Changed active
	SELECT NEW.id_product, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_product, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END //
DELIMITER ;

# Shop Variation Type

USE PARTS;


DROP TRIGGER IF EXISTS before_insert_Shop_Variation_Type;
DROP TRIGGER IF EXISTS before_update_Shop_Variation_Type;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Variation_Type
BEFORE INSERT ON Shop_Variation_Type
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Variation_Type
BEFORE UPDATE ON Shop_Variation_Type
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Variation_Type_Audit (
		id_type,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_type, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_type, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed name_plural
	SELECT NEW.id_type, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
	UNION
	# Changed active
	SELECT NEW.id_type, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_type, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
	;
END //
DELIMITER ;

# Shop Variation

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Variation;
DROP TRIGGER IF EXISTS before_update_Shop_Variation;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Variation
BEFORE INSERT ON Shop_Variation
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Variation
BEFORE UPDATE ON Shop_Variation
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Variation_Audit (
		id_variation,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_variation, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_variation, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	# Changed active
	SELECT NEW.id_variation, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_variation, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;
END //
DELIMITER ;

# Shop Product Permutation

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Product_Permutation;
DROP TRIGGER IF EXISTS before_update_Shop_Product_Permutation;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Permutation
BEFORE INSERT ON Shop_Product_Permutation
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Product_Permutation
BEFORE UPDATE ON Shop_Product_Permutation
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Product_Permutation_Audit (
		id_permutation,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    # Changed id_product
	SELECT NEW.id_permutation, 'id_product', OLD.id_product, NEW.id_product, NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
	UNION
    # Changed id_variation
	SELECT NEW.id_permutation, 'id_variation', OLD.id_variation, NEW.id_variation, NEW.id_change_set
		WHERE NOT OLD.id_variation <=> NEW.id_variation
	UNION
	# Changed name
	SELECT NEW.id_permutation, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT (OLD.name <=> NEW.name)
	UNION
	*/
	# Changed description
	SELECT NEW.id_permutation, 'description', OLD.description, NEW.description, NEW.id_change_set
		WHERE NOT (OLD.description <=> NEW.description)
	UNION
	# Changed cost_local_manufacturing
	SELECT NEW.id_permutation, 'cost_local_manufacturing', CONVERT(OLD.cost_local_manufacturing, CHAR), CONVERT(NEW.cost_local_manufacturing, CHAR), NEW.id_change_set
		WHERE NOT (OLD.cost_local_manufacturing <=> NEW.cost_local_manufacturing)
	UNION
	# Changed id_currency_cost_manufacturing
	SELECT NEW.id_permutation, 'id_currency_cost_manufacturing', CONVERT(OLD.id_currency_cost_manufacturing, CHAR), CONVERT(NEW.id_currency_cost_manufacturing, CHAR), NEW.id_change_set
		WHERE NOT (OLD.id_currency_cost_manufacturing <=> NEW.id_currency_cost_manufacturing)
	UNION
	# Changed profit_local_min
	SELECT NEW.id_permutation, 'profit_local_min', CONVERT(OLD.profit_local_min, CHAR), CONVERT(NEW.profit_local_min, CHAR), NEW.id_change_set
		WHERE NOT (OLD.profit_local_min <=> NEW.profit_local_min)
	UNION
	# Changed id_currency_profit_min
	SELECT NEW.id_permutation, 'id_currency_profit_min', CONVERT(OLD.id_currency_profit_min, CHAR), CONVERT(NEW.id_currency_profit_min, CHAR), NEW.id_change_set
		WHERE NOT (OLD.id_currency_profit_min <=> NEW.id_currency_profit_min)
	UNION
    /*
	# Changed price_GBP_min
	SELECT NEW.id_permutation, 'price_GBP_min', CONVERT(OLD.price_GBP_min, CHAR), CONVERT(NEW.price_GBP_min, CHAR), NEW.id_change_set
		WHERE NOT (OLD.price_GBP_min <=> NEW.price_GBP_min)
	UNION
    */
    # Changed latency_manufacture
	SELECT NEW.id_product, 'latency_manufacture', CONVERT(OLD.latency_manufacture, CHAR), CONVERT(NEW.latency_manufacture, CHAR), NEW.id_change_set
		WHERE NOT OLD.latency_manufacture <=> NEW.latency_manufacture
	UNION
    # Changed quantity_min
	SELECT NEW.id_product, 'quantity_min', CONVERT(OLD.quantity_min, CHAR), CONVERT(NEW.quantity_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
	UNION
    # Changed quantity_max
	SELECT NEW.id_product, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
	UNION
    # Changed quantity_step
	SELECT NEW.id_product, 'quantity_step', CONVERT(OLD.quantity_step, CHAR), CONVERT(NEW.quantity_step, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_step <=> NEW.quantity_step
	UNION
    # Changed quantity_stock
	SELECT NEW.id_product, 'quantity_stock', CONVERT(OLD.quantity_stock, CHAR), CONVERT(NEW.quantity_stock, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_stock <=> NEW.quantity_stock
    UNION
    # Changed is_subscription
	SELECT NEW.id_product, 'is_subscription', CONVERT(CONVERT(OLD.is_subscription, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_subscription, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.is_subscription <=> NEW.is_subscription
	UNION
    # Changed id_recurrence_interval
	SELECT NEW.id_product, 'id_recurrence_interval', CONVERT(OLD.id_recurrence_interval, CHAR), CONVERT(NEW.id_recurrence_interval, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_recurrence_interval <=> NEW.id_recurrence_interval
    UNION
    # Changed count_recurrence_interval
	SELECT NEW.id_product, 'count_recurrence_interval', CONVERT(OLD.count_recurrence_interval, CHAR), CONVERT(NEW.count_recurrence_interval, CHAR), NEW.id_change_set
		WHERE NOT OLD.count_recurrence_interval <=> NEW.count_recurrence_interval
	UNION
    # Changed id_stripe_product
	SELECT NEW.id_permutation, 'id_stripe_product', OLD.id_stripe_product, NEW.id_stripe_product, NEW.id_change_set
		WHERE NOT (OLD.id_stripe_product <=> NEW.id_stripe_product)
	UNION
    # Changed active
	SELECT NEW.id_permutation, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_permutation, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;
END //
DELIMITER ;
# Shop Product Permutation Variation Link

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Product_Permutation_Variation_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Product_Permutation_Variation_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Permutation_Variation_Link
BEFORE INSERT ON Shop_Product_Permutation_Variation_Link
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Product_Permutation_Variation_Link
BEFORE UPDATE ON Shop_Product_Permutation_Variation_Link
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Product_Permutation_Variation_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    # Changed id_product
	SELECT NEW.id_link, 'id_product', OLD.id_product, NEW.id_product, NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
	UNION
    # Changed id_variation
	SELECT NEW.id_link, 'id_variation', OLD.id_variation, NEW.id_variation, NEW.id_change_set
		WHERE NOT OLD.id_variation <=> NEW.id_variation
	UNION
	*/
    # Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_link, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;
END //
DELIMITER ;
# Shop Product Currency Link

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Product_Currency_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Product_Currency_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Currency_Link
BEFORE INSERT ON Shop_Product_Currency_Link
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
    /*
    SET NEW.price_local = (
		SELECT PP.price_GBP_full * C.factor_from_GBP
        FROM Shop_Product_Permutation PP
        INNER JOIN Shop_Product P ON PP.id_product = P.id_product
		INNER JOIN Shop_Currency C ON NEW.id_currency = C.id_currency
        WHERE NEW.id_product = P.id_product
        LIMIT 1
	);
    */
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Product_Currency_Link
BEFORE UPDATE ON Shop_Product_Currency_Link
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    /*
    SET NEW.price_local = (
		SELECT P.price_GBP_full * C.factor_from_GBP
        FROM Shop_Product P
		INNER JOIN Shop_Currency C ON NEW.id_currency = C.id_currency
        WHERE NEW.id_product = P.id_product
        LIMIT 1
	);
    */
    
    INSERT INTO Shop_Product_Currency_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    # Changed id_product
	SELECT NEW.id_link, 'id_product', CONVERT(OLD.id_product, CHAR), CONVERT(NEW.id_product, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
	UNION
	# Changed id_currency
	SELECT NEW.id_link, 'id_currency', CONVERT(OLD.id_currency, CHAR), CONVERT(NEW.id_currency, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_currency <=> NEW.id_currency
    UNION
	# Changed price_local
	SELECT NEW.id_link, 'price_local', OLD.price_local, NEW.price_local, NEW.id_change_set
		WHERE NOT OLD.price_local <=> NEW.price_local
    UNION
    */ 
	# Changed price_local_VAT_incl
	SELECT NEW.id_link, 'price_local_VAT_incl', OLD.price_local_VAT_incl, NEW.price_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.price_local_VAT_incl <=> NEW.price_local_VAT_incl
    UNION
	# Changed price_local_VAT_excl
	SELECT NEW.id_link, 'price_local_VAT_excl', OLD.price_local_VAT_excl, NEW.price_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.price_local_VAT_excl <=> NEW.price_local_VAT_excl
    UNION
	# Changed id_stripe_price
	SELECT NEW.id_link, 'id_stripe_price', OLD.id_stripe_price, NEW.id_stripe_price, NEW.id_change_set
		WHERE NOT OLD.id_stripe_price <=> NEW.id_stripe_price
    UNION
	# Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;

# Shop Product Currency Region Link

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Product_Currency_Region_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Product_Currency_Region_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Currency_Region_Link
BEFORE INSERT ON Shop_Product_Currency_Region_Link
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
    /*
    SET NEW.price_local = (
		SELECT PP.price_GBP_full * C.factor_from_GBP
        FROM Shop_Product_Permutation PP
        INNER JOIN Shop_Product P ON PP.id_product = P.id_product
		INNER JOIN Shop_Currency C ON NEW.id_currency = C.id_currency
        WHERE NEW.id_product = P.id_product
        LIMIT 1
	);
    */
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Product_Currency_Region_Link
BEFORE UPDATE ON Shop_Product_Currency_Region_Link
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    /*
    SET NEW.price_local = (
		SELECT P.price_GBP_full * C.factor_from_GBP
        FROM Shop_Product P
		INNER JOIN Shop_Currency C ON NEW.id_currency = C.id_currency
        WHERE NEW.id_product = P.id_product
        LIMIT 1
	);
    */
    
    INSERT INTO Shop_Product_Currency_Region_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    # Changed id_product
	SELECT NEW.id_link, 'id_product', CONVERT(OLD.id_product, CHAR), CONVERT(NEW.id_product, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
	UNION
	# Changed id_currency
	SELECT NEW.id_link, 'id_currency', CONVERT(OLD.id_currency, CHAR), CONVERT(NEW.id_currency, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_currency <=> NEW.id_currency
    UNION
	# Changed price_local
	SELECT NEW.id_link, 'price_local', OLD.price_local, NEW.price_local, NEW.id_change_set
		WHERE NOT OLD.price_local <=> NEW.price_local
    UNION
    */ 
	# Changed price_local_VAT_incl
	SELECT NEW.id_link, 'price_local_VAT_incl', OLD.price_local_VAT_incl, NEW.price_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.price_local_VAT_incl <=> NEW.price_local_VAT_incl
    UNION
	# Changed price_local_VAT_excl
	SELECT NEW.id_link, 'price_local_VAT_excl', OLD.price_local_VAT_excl, NEW.price_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.price_local_VAT_excl <=> NEW.price_local_VAT_excl
    UNION
	# Changed id_stripe_price
	SELECT NEW.id_link, 'id_stripe_price', OLD.id_stripe_price, NEW.id_stripe_price, NEW.id_change_set
		WHERE NOT OLD.id_stripe_price <=> NEW.id_stripe_price
    UNION
	# Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;

# Shop Image Type

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Image_Type;
DROP TRIGGER IF EXISTS before_update_Shop_Image_Type;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Image_Type
BEFORE INSERT ON Shop_Image_Type
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Image_Type
BEFORE UPDATE ON Shop_Image_Type
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Image_Type_Audit (
		id_type,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_type, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_type, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed name_plural
	SELECT NEW.id_type, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
	UNION
	# Changed active
	SELECT NEW.id_type, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_type, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;
END //
DELIMITER ;
# Shop Image

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Image;
DROP TRIGGER IF EXISTS before_update_Shop_Image;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Image
BEFORE INSERT ON Shop_Image
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Image
BEFORE UPDATE ON Shop_Image
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change set ID must be provided.';
    END IF;
    IF ISNULL(NEW.id_product) AND ISNULL(NEW.id_permutation) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Image must NOT have ID for product AND product permutation.';
    END IF;
    
    INSERT INTO Shop_Image_Audit (
		id_image,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed id_type_image
	SELECT NEW.id_image, 'id_type_image', CONVERT(OLD.id_type_image, CHAR), CONVERT(NEW.id_type_image, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_type_image <=> NEW.id_type_image
    UNION
    # Changed id_type_file
	SELECT NEW.id_image, 'id_type_file', CONVERT(OLD.id_type_file, CHAR), CONVERT(NEW.id_type_file, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_type_file <=> NEW.id_type_file
    UNION
    # Changed id_product
	SELECT NEW.id_image, 'id_product', CONVERT(OLD.id_product, CHAR), CONVERT(NEW.id_product, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
    UNION
    # Changed id_permutation
	SELECT NEW.id_image, 'id_permutation', CONVERT(OLD.id_permutation, CHAR), CONVERT(NEW.id_permutation, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_permutation <=> NEW.id_permutation
    UNION
    # Changed url
	SELECT NEW.id_image, 'url', OLD.url, NEW.url, NEW.id_change_set
		WHERE NOT OLD.url <=> NEW.url
	UNION
	# Changed active
	SELECT NEW.id_image, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_image, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
	;
END //
DELIMITER ;
# Shop Delivery Option Type

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Delivery_Option;
DROP TRIGGER IF EXISTS before_update_Shop_Delivery_Option;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Delivery_Option
BEFORE INSERT ON Shop_Delivery_Option
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Delivery_Option
BEFORE UPDATE ON Shop_Delivery_Option
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Delivery_Option_Audit (
		id_option,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_option, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_option, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed latency_delivery_min
	SELECT NEW.id_option, 'latency_delivery_min', CONVERT(OLD.latency_delivery_min, CHAR), CONVERT(NEW.latency_delivery_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.latency_delivery_min <=> NEW.latency_delivery_min
    UNION
    # Changed latency_delivery_max
	SELECT NEW.id_option, 'latency_delivery_max', CONVERT(OLD.latency_delivery_max, CHAR), CONVERT(NEW.latency_delivery_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.latency_delivery_max <=> NEW.latency_delivery_max
    UNION
    # Changed quantity_min
	SELECT NEW.id_option, 'quantity_min', CONVERT(OLD.quantity_min, CHAR), CONVERT(NEW.quantity_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
    UNION
    # Changed quantity_max
	SELECT NEW.id_option, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
    UNION
    # Changed active
	SELECT NEW.id_option, 'active', CONVERT(OLD.active, CHAR), CONVERT(NEW.active, CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    UNION
    # Changed display_order
	SELECT NEW.id_option, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END //
DELIMITER ;
# Shop Product Delivery Option Link

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Product_Delivery_Option_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Product_Delivery_Option_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Delivery_Option_Link
BEFORE INSERT ON Shop_Product_Delivery_Option_Link
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Product_Delivery_Option_Link
BEFORE UPDATE ON Shop_Product_Delivery_Option_Link
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Product_Delivery_Option_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    # Changed id_product
	SELECT NEW.id_link, 'id_product', CONVERT(OLD.id_product, CHAR), CONVERT(NEW.id_product, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
    UNION
    # Changed id_permutation
	SELECT NEW.id_link, 'id_permutation', CONVERT(OLD.id_permutation, CHAR), CONVERT(NEW.id_permutation, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_permutation <=> NEW.id_permutation
    UNION
    # Changed id_option
	SELECT NEW.id_link, 'id_option', CONVERT(OLD.id_option, CHAR), CONVERT(NEW.id_option, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_option <=> NEW.id_option
	UNION
    # Changed id_region
	SELECT NEW.id_link, 'id_region', CONVERT(OLD.id_region, CHAR), CONVERT(NEW.id_region, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_region <=> NEW.id_region
	UNION
    */
    # Changed price_local
	SELECT NEW.id_link, 'price_local', CONVERT(OLD.price_local, CHAR), CONVERT(NEW.price_local, CHAR), NEW.id_change_set
		WHERE NOT OLD.price_local <=> NEW.price_local
	UNION
	# Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_link, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
	;
END //
DELIMITER ;
# Shop Discount

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Discount;
DROP TRIGGER IF EXISTS before_update_Shop_Discount;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Discount
BEFORE INSERT ON Shop_Discount
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_update_Shop_Discount
BEFORE UPDATE ON Shop_Discount
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Discount_Audit (
		id_discount,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_discount, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_discount, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed multiplier
	SELECT NEW.id_discount, 'multiplier', OLD.multiplier, NEW.multiplier, NEW.id_change_set
		WHERE NOT OLD.multiplier <=> NEW.multiplier
    UNION
    # Changed subtractor
	SELECT NEW.id_discount, 'subtractor', OLD.subtractor, NEW.subtractor, NEW.id_change_set
		WHERE NOT OLD.subtractor <=> NEW.subtractor
    UNION
    # Changed apply_multiplier_first
	SELECT NEW.id_discount, 'apply_multiplier_first', CONVERT(CONVERT(OLD.apply_multiplier_first, SIGNED), CHAR), CONVERT(CONVERT(NEW.apply_multiplier_first, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.apply_multiplier_first <=> NEW.apply_multiplier_first
    UNION
    # Changed quantity_min
	SELECT NEW.id_discount, 'quantity_min', OLD.quantity_min, NEW.quantity_min, NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
    UNION
    # Changed quantity_max
	SELECT NEW.id_discount, 'quantity_max', OLD.quantity_max, NEW.quantity_max, NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
    UNION
    # Changed date_start
	SELECT NEW.id_discount, 'date_start', OLD.date_start, NEW.date_start, NEW.id_change_set
		WHERE NOT OLD.date_start <=> NEW.date_start
    UNION
    # Changed date_end
	SELECT NEW.id_discount, 'date_end', OLD.date_end, NEW.date_end, NEW.id_change_set
		WHERE NOT OLD.date_end <=> NEW.date_end
    UNION
    # Changed display_order
	SELECT NEW.id_discount, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    UNION
    # Changed active
	SELECT NEW.id_discount, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;


# Shop Discount Region Currency Link

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Discount_Region_Currency_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Discount_Region_Currency_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Discount_Region_Currency_Link
BEFORE INSERT ON Shop_Discount_Region_Currency_Link
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Discount_Region_Currency_Link
BEFORE UPDATE ON Shop_Discount_Region_Currency_Link
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Discount_Region_Currency_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    # Changed id_discount
	SELECT NEW.id_link, 'id_discount', CONVERT(OLD.id_discount, CHAR), CONVERT(NEW.id_discount, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_discount <=> NEW.id_discount
    UNION
    # Changed id_region
	SELECT NEW.id_link, 'id_region', CONVERT(OLD.id_region, CHAR), CONVERT(NEW.id_region, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_region <=> NEW.id_region
	UNION
	*/
    # Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	;
END //
DELIMITER ;
# Shop Permission Group

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Permission_Group;
DROP TRIGGER IF EXISTS before_update_Shop_Permission_Group;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Permission_Group
BEFORE INSERT ON Shop_Permission_Group
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Permission_Group
BEFORE UPDATE ON Shop_Permission_Group
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Permission_Group_Audit (
		id_group,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_group, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
    # Changed name
	SELECT NEW.id_group, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	# Changed active
	SELECT NEW.id_group, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    UNION
    # Changed display_order
	SELECT NEW.id_group, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END //
DELIMITER ;
# Shop Permission

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Permission;
DROP TRIGGER IF EXISTS before_update_Shop_Permission;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Permission
BEFORE INSERT ON Shop_Permission
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Permission
BEFORE UPDATE ON Shop_Permission
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Permission_Audit (
		id_permission,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_permission, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
    # Changed name
	SELECT NEW.id_permission, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	# Changed id_permission_group
	SELECT NEW.id_permission, 'id_permission_group', CONVERT(OLD.id_permission_group, CHAR), CONVERT(NEW.id_permission_group, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_permission_group <=> NEW.id_permission_group
	UNION
	# Changed Id_access_level_required
	SELECT NEW.id_permission, 'Id_access_level_required', CONVERT(OLD.Id_access_level_required, CHAR), CONVERT(NEW.Id_access_level_required, CHAR), NEW.id_change_set
		WHERE NOT OLD.Id_access_level_required <=> NEW.Id_access_level_required
	UNION
	# Changed active
	SELECT NEW.id_permission, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    UNION
    # Changed display_order
	SELECT NEW.id_permission, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END //
DELIMITER ;
# Shop Role

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Role;
DROP TRIGGER IF EXISTS before_update_Shop_Role;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Role
BEFORE INSERT ON Shop_Role
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Role
BEFORE UPDATE ON Shop_Role
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Role_Audit (
		id_role,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_role, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
	# Changed name
	SELECT NEW.id_role, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	# Changed active
	SELECT NEW.id_role, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    UNION
    # Changed display_order
	SELECT NEW.id_role, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END //
DELIMITER ;

# Shop Role Permission Link

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Role_Permission_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Role_Permission_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Role_Permission_Link
BEFORE INSERT ON Shop_Role_Permission_Link
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Role_Permission_Link
BEFORE UPDATE ON Shop_Role_Permission_Link
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Role_Permission_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    # Changed id_role
	SELECT NEW.id_link, 'id_role', CONVERT(OLD.id_role, CHAR), CONVERT(NEW.id_role, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_role <=> NEW.id_role
	UNION
	# Changed id_permission
	SELECT NEW.id_link, 'id_permission', CONVERT(OLD.id_permission, CHAR), CONVERT(NEW.id_permission, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_permission <=> NEW.id_permission
    UNION
    */
    # Changed id_access_level
	SELECT NEW.id_link, 'id_access_level', CONVERT(OLD.id_access_level, CHAR), CONVERT(NEW.id_access_level, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_access_level <=> NEW.id_access_level
	UNION
	# Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;

# Shop User

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_User;
DROP TRIGGER IF EXISTS before_update_Shop_User;


DELIMITER //
CREATE TRIGGER before_insert_Shop_User
BEFORE INSERT ON Shop_User
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_User
BEFORE UPDATE ON Shop_User
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_User_Audit (
		id_user,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed name
	SELECT NEW.id_user, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT (OLD.name <=> NEW.name)
	UNION
	# Changed is_super_user
	SELECT NEW.id_user, 'is_super_user', CONVERT(CONVERT(OLD.is_super_user, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_super_user, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.is_super_user <=> NEW.is_super_user)
	UNION
    # Changed active
	SELECT NEW.id_user, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;
# Shop User Role Link

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_User_Role_Link;
DROP TRIGGER IF EXISTS before_update_Shop_User_Role_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_User_Role_Link
BEFORE INSERT ON Shop_User_Role_Link
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_User_Role_Link
BEFORE UPDATE ON Shop_User_Role_Link
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_User_Role_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;
# Shop Address

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_Address;
DROP TRIGGER IF EXISTS before_update_Shop_Address;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Address
BEFORE INSERT ON Shop_Address
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Address
BEFORE UPDATE ON Shop_Address
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Address_Audit (
		id_address,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed region
	SELECT NEW.id_address, 'id_region', OLD.id_region, NEW.id_region, NEW.id_change_set
		WHERE NOT OLD.id_region <=> NEW.id_region
    UNION
    # Changed name_full
	SELECT NEW.id_address, 'name_full', OLD.name_full, NEW.name_full, NEW.id_change_set
		WHERE NOT OLD.name_full <=> NEW.name_full
	UNION
    # Changed phone_number
	SELECT NEW.id_address, 'phone_number', OLD.phone_number, NEW.phone_number, NEW.id_change_set
		WHERE NOT OLD.phone_number <=> NEW.phone_number
    UNION
    # Changed postcode
	SELECT NEW.id_address, 'postcode', OLD.postcode, NEW.postcode, NEW.id_change_set
		WHERE NOT OLD.postcode <=> NEW.postcode
    UNION
    # Changed address_line_1
	SELECT NEW.id_address, 'address_line_1', OLD.address_line_1, NEW.address_line_1, NEW.id_change_set
		WHERE NOT OLD.address_line_1 <=> NEW.address_line_1
	UNION
    # Changed address_line_2
	SELECT NEW.id_address, 'address_line_2', OLD.address_line_2, NEW.address_line_2, NEW.id_change_set
		WHERE NOT OLD.address_line_2 <=> NEW.address_line_2
	UNION
    # Changed city
	SELECT NEW.id_address, 'city', OLD.city, NEW.city, NEW.id_change_set
		WHERE NOT OLD.city <=> NEW.city
    UNION
    # Changed county
	SELECT NEW.id_address, 'county', OLD.county, NEW.county, NEW.id_change_set
		WHERE NOT OLD.county <=> NEW.county
	UNION
	# Changed active
	SELECT NEW.id_address, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;
# Shop Product Variation Link

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_User_Basket;
DROP TRIGGER IF EXISTS before_update_Shop_User_Basket;


DELIMITER //
CREATE TRIGGER before_insert_Shop_User_Basket
BEFORE INSERT ON Shop_User_Basket
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_User_Basket
BEFORE UPDATE ON Shop_User_Basket
FOR EACH ROW
BEGIN
	IF NEW.id_change_set_user <=> OLD.id_change_set_user THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_User_Basket_Audit (
		id_item,
        name_field,
        value_prev,
        value_new,
        id_change_set_user
    )
    # Changed id_user
	SELECT NEW.id_item, 'id_user', OLD.id_user, NEW.id_user, NEW.id_change_set_user
		WHERE NOT OLD.id_user <=> NEW.id_user
	UNION
	# Changed id_product
	SELECT NEW.id_item, 'id_product', OLD.id_product, NEW.id_product, NEW.id_change_set_user
		WHERE NOT OLD.id_product <=> NEW.id_product
	UNION
	# Changed quantity
	SELECT NEW.id_item, 'quantity', CONVERT(OLD.quantity, CHAR), CONVERT(NEW.quantity, CHAR), NEW.id_change_set_user
		WHERE NOT (OLD.quantity <=> NEW.quantity)
	UNION
    # Changed active
	SELECT NEW.id_item, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set_user
		WHERE NOT (OLD.active <=> NEW.active)
	;
END //
DELIMITER ;
# Shop User Order Type

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_User_Order_Status;
DROP TRIGGER IF EXISTS before_update_Shop_User_Order_Status;


DELIMITER //
CREATE TRIGGER before_insert_Shop_User_Order_Status
BEFORE INSERT ON Shop_User_Order_Status
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_User_Order_Status
BEFORE UPDATE ON Shop_User_Order_Status
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_User_Order_Status_Audit (
		id_Status,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_Status, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_Status, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed name_plural
	SELECT NEW.id_Status, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
	UNION
	# Changed active
	SELECT NEW.id_Status, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_Status, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;
END //
DELIMITER ;
# Shop Product Variation Link

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_User_Order;
DROP TRIGGER IF EXISTS before_update_Shop_User_Order;


DELIMITER //
CREATE TRIGGER before_insert_Shop_User_Order
BEFORE INSERT ON Shop_User_Order
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_User_Order
BEFORE UPDATE ON Shop_User_Order
FOR EACH ROW
BEGIN
	IF OLD.id_change_set_user <=> NEW.id_change_set_user THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
	IF NOT (NEW.id_checkout_session <=> OLD.id_checkout_session) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Checkout session ID must not change.';
    END IF;
    
    INSERT INTO Shop_User_Order_Audit (
		id_order,
        name_field,
        value_prev,
        value_new,
        id_change_set_user
    )
    # Changed id_user
	SELECT NEW.id_order, 'id_user', OLD.id_user, NEW.id_user, NEW.id_change_set_user
		WHERE NOT OLD.id_user <=> NEW.id_user
	UNION
	# Changed value_total
	SELECT NEW.id_order, 'value_total', CONVERT(OLD.value_total, CHAR), CONVERT(NEW.value_total, CHAR), NEW.id_change_set_user
		WHERE NOT (OLD.value_total <=> NEW.value_total)
	UNION
	# Changed id_order_status
	SELECT NEW.id_order, 'id_order_status', CONVERT(OLD.id_order_status, CHAR), CONVERT(NEW.id_order_status, CHAR), NEW.id_change_set_user
		WHERE NOT (OLD.id_order_status <=> NEW.id_order_status)
	UNION
	# Changed id_checkout_session
	SELECT NEW.id_order, 'id_checkout_session', OLD.id_checkout_session, NEW.id_checkout_session, NEW.id_change_set_user
		WHERE NOT (OLD.id_checkout_session <=> NEW.id_checkout_session)
	UNION
    # Changed active
	SELECT NEW.id_order, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set_user
		WHERE NOT (OLD.active <=> NEW.active)
	;
END //
DELIMITER ;
# Shop User Order Product Link

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_Shop_User_Order_Product_Link;
DROP TRIGGER IF EXISTS before_update_Shop_User_Order_Product_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_User_Order_Product_Link
BEFORE INSERT ON Shop_User_Order_Product_Link
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_User_Order_Product_Link
BEFORE UPDATE ON Shop_User_Order_Product_Link
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_User_Order_Product_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed id_product
	SELECT NEW.id_link, 'active', CONVERT(OLD.id_product, CHAR), CONVERT(NEW.id_product, CHAR), NEW.id_change_set
		WHERE NOT (OLD.id_product <=> NEW.id_product)
    UNION
	# Changed quantity
	SELECT NEW.id_link, 'quantity', CONVERT(OLD.quantity, CHAR), CONVERT(NEW.quantity, CHAR), NEW.id_change_set
		WHERE NOT (OLD.quantity <=> NEW.quantity)
    UNION
	# Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;
USE PARTS;


/*

CALL p_shop_user_eval (
	UUID(), # a_guid
	'', 	# a_id_user
	0,		# a_get_inactive_users
    '1',	# a_ids_permission
    '',		# a_ids_access_level
	'1'		# a_ids_product
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_user_eval;

DELIMITER //
CREATE PROCEDURE p_shop_user_eval (
	IN a_guid VARCHAR(36),
    IN a_id_user VARCHAR(200),
    IN a_get_inactive_users BIT,
    IN a_ids_permission VARCHAR(500),
    IN a_ids_access_level VARCHAR(100),
    IN a_ids_permutation VARCHAR(4000)
)
BEGIN
	-- Variable declaration
    DECLARE v_has_filter_permission BIT;
    DECLARE v_has_filter_user BIT;
    DECLARE v_has_filter_access_level BIT;
    DECLARE v_has_filter_permutation BIT;
    DECLARE v_id_permission_product INT;
    DECLARE v_id_permission INT;
    -- DECLARE v_ids_product VARCHAR(500);
    DECLARE v_id_access_level_view INT;
    # DECLARE v_id_access_level_product_required INT;
    DECLARE v_priority_access_level_view INT;
    DECLARE v_priority_access_level_edit INT;
    DECLARE v_priority_access_level_admin INT;
    DECLARE v_id_access_level INT;
    DECLARE v_priority_access_level INT;
    DECLARE v_now DATETIME;
	DECLARE v_ids_row_delete VARCHAR(500);
    DECLARE v_code_error_data VARCHAR(200);
    DECLARE v_id_error_data INT;
    DECLARE v_code_error_permission VARCHAR(200);
    
    SET v_id_error_data = 1;
    SET v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = v_id_error_data);
    
    SET v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
    
	-- Clear previous proc results
	# DROP TABLE IF EXISTS tmp_User_Role_Link;
	# DROP TEMPORARY TABLE IF EXISTS tmp_User_Role_Link;
	DROP TABLE IF EXISTS tmp_Shop_Product_p_Shop_User_Eval;
	# DROP TABLE IF EXISTS Shop_User_Eval_Temp;
    
    
	-- Parse arguments + get default values
    /*
	IF a_guid IS NULL THEN
		SET a_guid = UUID();
	END IF;
    */
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_get_inactive_users IS NULL THEN
		SET a_get_inactive_users = 0;
    END IF;
    /*
	IF a_get_user_permissions IS NULL THEN
		SET a_get_user_permissions = 0;
    END IF;
    */
	IF a_ids_permission IS NULL THEN
		SET a_ids_permission = '';
	ELSE
		SET a_ids_permission = TRIM(a_ids_permission);
    END IF;
	IF a_ids_access_level IS NULL THEN
		SET a_ids_access_level = '';
	ELSE
		SET a_ids_access_level = TRIM(a_ids_access_level);
    END IF;
    IF a_ids_permutation IS NULL THEN
		SET a_ids_permutation = '';
	ELSE
		SET a_ids_permutation = TRIM(a_ids_permutation);
    END IF;
    
    -- Permanent Table
	CREATE TABLE IF NOT EXISTS Shop_User_Eval_Temp (
		id_row INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
		guid VARCHAR(36) NOT NULL,
		id_user VARCHAR(200),
		id_permission_required INT NOT NULL,
		CONSTRAINT FK_Shop_User_Eval_Temp_id_permission_required
			FOREIGN KEY (id_permission_required)
			REFERENCES Shop_Permission (id_permission),
		/*
		id_access_level_required INT NOT NULL,
		CONSTRAINT FK_Shop_User_Eval_Temp_id_access_level_required
			FOREIGN KEY (id_access_level_required)
			REFERENCES Shop_Access_Level (id_access_level),
		*/
		priority_access_level_required INT NOT NULL,
        /*
		CONSTRAINT FK_Shop_User_Eval_Temp_priority_access_level_required
			FOREIGN KEY (priority_access_level_required)
			REFERENCES Shop_Access_Level (priority),
		*/
		id_product INT NULL,
		CONSTRAINT FK_Shop_User_Eval_Temp_id_product
			FOREIGN KEY (id_product)
			REFERENCES parts.Shop_Product (id_product),
		id_permutation INT NULL,
		CONSTRAINT FK_Shop_User_Eval_Temp_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES parts.Shop_Product_Permutation (id_permutation),
		is_super_user BIT NULL,
		priority_access_level_user INT NULL,
        /*
		CONSTRAINT FK_Shop_User_Eval_Temp_priority_access_level_minimum
			FOREIGN KEY (priority_access_level_minimum)
			REFERENCES Shop_Access_Level (priority)
		*/
		can_view BIT,
		can_edit BIT,
		can_admin BIT -- DEFAULT 0
	);
		
	CREATE TABLE IF NOT EXISTS tmp_Shop_Product_p_Shop_User_Eval (
		id_row INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
		id_product INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Product_p_Shop_User_Eval_id_product FOREIGN KEY (id_product)
			REFERENCES parts.Shop_Product (id_product),
		id_permutation INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Product_p_Shop_User_Eval_id_permutation FOREIGN KEY (id_permutation)
			REFERENCES parts.Shop_Product_Permutation (id_permutation),
		id_access_level_required INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Product_p_Shop_User_Eval_id_access_level_required FOREIGN KEY (id_access_level_required)
			REFERENCES Shop_Access_Level (id_access_level),
		guid VARCHAR(36) NOT NULL,
        rank_permutation INT NOT NULL
	);
		
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid VARCHAR(36) NOT NULL,
		id_type INT NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
		code VARCHAR(50),
        msg VARCHAR(4000) NOT NULL
	);
		
    # select * from Shop_Msg_Error_Type;
    
    -- Parse filters
	IF a_guid IS NULL OR EXISTS (SELECT * FROM Shop_User_Eval_Temp WHERE a_guid = guid) THEN
		INSERT INTO tmp_Msg_Error (
			guid,
			code,
            msg
		)
        VALUES (
			a_guid,
			v_code_error_data, 
            'Invalid guid argument.'
		)
        ;
	END IF;
    SET v_has_filter_user = CASE WHEN a_id_user = '' THEN 0 ELSE 1 END;
	SET a_ids_permission = REPLACE(a_ids_permission, '|', ',');
    SET v_has_filter_permission = CASE WHEN a_ids_permission = '' THEN 0 ELSE 1 END;
	SET a_ids_access_level = REPLACE(a_ids_access_level, '|', ',');
    SET v_has_filter_access_level = CASE WHEN a_ids_access_level = '' THEN 0 ELSE 1 END;
	SET a_ids_permutation = REPLACE(a_ids_permutation, '|', ',');
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    SET v_id_access_level_view = (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_priority_access_level_view = (SELECT priority FROM Shop_Access_Level WHERE id_access_level = v_id_access_level_view);
    SET v_priority_access_level_edit = (SELECT priority FROM Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    SET v_priority_access_level_admin = (SELECT priority FROM Shop_Access_Level WHERE code = 'ADMIN' LIMIT 1);
    
    /*
    select v_priority_access_level_view,
		v_priority_access_level_edit,
        v_priority_access_level_admin
	;
    */
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
		IF v_has_filter_access_level THEN
			CALL p_split(a_ids_access_level, ',');
			SET v_id_access_level := (
				SELECT AL.id_access_level 
				FROM Split_Temp ST 
				INNER JOIN Shop_Access_Level AL 
					ON CONVERT(ST.substring, DECIMAL(10,0)) = AL.id_access_level
						AND AL.active 
				ORDER BY AL.priority ASC 
				LIMIT 1
			);
			DROP TABLE Split_Temp;
			IF 0 = v_id_access_level OR v_id_access_level <=> NULL THEN
				# SET v_has_filter_access_level = 0;
                INSERT INTO tmp_Msg_Error (
					guid,
					code,
					msg
				)
				VALUES (
					a_guid,	
					v_code_error_data, 
					'Access level ID not found.'
				)
				;
			END IF;
        /*
		END IF;
		IF NOT v_has_filter_access_level THEN
		*/
        ELSE
			SET v_id_access_level = v_id_access_level_view;
		END IF;
	END IF;
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
		IF v_has_filter_permutation THEN
			INSERT INTO tmp_Shop_Product_p_Shop_User_Eval (
				id_product,
                id_permutation,
				id_access_level_required,
				guid,
                rank_permutation
			)
			SELECT 
				PP.id_product,
                PP.id_permutation,
				PP.id_access_level_required,
				a_guid,
				RANK() OVER (ORDER BY PP.id_product, PP.id_permutation, AL.priority) AS rank_permutation
			FROM Shop_Product_Permutation PP
            INNER JOIN Shop_Access_Level AL
				ON PP.id_access_level_required = AL.id_access_level
					AND AL.active
			WHERE FIND_IN_SET(PP.id_permutation, a_ids_permutation) > 0
				# AND P.active # not worried as we want users to be able to see their order history
			;
            /*
            DELETE FROM tmp_Shop_Product_p_Shop_User_Eval
            WHERE rank_permutation > 1
            ;
            */
			SET v_has_filter_permutation = EXISTS (SELECT * FROM tmp_Shop_Product_p_Shop_User_Eval WHERE a_guid = guid);
		END IF;
        
		IF v_has_filter_permission THEN
            # Invalid permission IDs
            IF EXISTS (SELECT id_permission FROM Shop_Permission WHERE FIND_IN_SET(id_permission, a_ids_permission) > 0 AND NOT active) THEN
				INSERT INTO tmp_Msg_Error (
					guid,
					code,
					msg
				)
				VALUES (
					a_guid,
					v_code_error_data, 
					CONCAT('The following permissions are no longer active: ', (SELECT GROUP_CONCAT(name SEPARATOR ', ') FROM Shop_Permission WHERE FIND_IN_SET(id_permission, a_ids_permission) > 0 AND NOT active))
				)
				;
            END IF;
		END IF;
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
		IF v_has_filter_user THEN
			SET a_id_user := (SELECT id_user FROM Shop_User WHERE id_user LIKE a_id_user AND active);
            SET v_has_filter_user = NOT (a_id_user <=> NULL);
            IF NOT v_has_filter_user THEN
                INSERT INTO tmp_Msg_Error (
					guid,
					code,
					msg
				)
				VALUES (
					a_guid,
					v_code_error_data, 
					'User ID not found.'
				)
				;
            END IF;
        END IF;
	END IF;
    
    -- Get users
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
		INSERT INTO Shop_User_Eval_Temp (
			guid,
			id_user,
			id_permission_required,
			priority_access_level_required
            /*
            priority_access_level_user,
			is_super_user,
			can_view,
			can_edit,
			can_admin
            */
		)
		SELECT a_guid,
			a_id_user,
			P.id_permission,
			AL.priority
		FROM parts.Shop_Permission P
		INNER JOIN Shop_Access_Level AL
			ON P.id_access_level_required = AL.id_access_level
				AND AL.active
		WHERE FIND_IN_SET(P.id_permission, a_ids_permission) > 0
		;
        
		IF v_has_filter_permutation THEN
			SET v_ids_row_delete := (SELECT GROUP_CONCAT(id_row SEPARATOR ',') FROM Shop_User_Eval_Temp WHERE a_guid = guid);
            
			INSERT INTO Shop_User_Eval_Temp (
				guid,
				id_user,
				id_permission_required,
				id_product,
                id_permutation,
				priority_access_level_required
			)
			SELECT UE_T.guid, 
				UE_T.id_user, 
                UE_T.id_permission_required, 
                t_P.id_product, 
                t_P.id_permutation, 
                CASE WHEN UE_T.priority_access_level_required < AL.priority THEN UE_T.priority_access_level_required ELSE AL.priority END -- UE_T.priority_access_level_required
			FROM tmp_Shop_Product_p_Shop_User_Eval t_P
            INNER JOIN Shop_Access_Level AL
				ON t_P.id_access_leveL_required = AL.id_access_level
					AND AL.active
			CROSS JOIN Shop_User_Eval_Temp UE_T
				ON a_id_user = UE_T.id_user
				WHERE a_guid = t_P.guid
			;
            
			DELETE FROM Shop_User_Eval_Temp 
			WHERE FIND_IN_SET(id_row, v_ids_row_delete) > 0
			;
		END IF;
        
		/*
		INSERT INTO Shop_User_Eval_Temp (
			guid,
			id_user,
			id_permission_required,
			# id_access_level_required,
			priority_access_level_required,
			priority_access_level_user,
			is_super_user
			/*
			can_view,
			can_edit,
			can_admin
			*
		)
		SELECT a_guid,
			U.id_user,
			P.id_permission,
			AL.priority,
			/*
			v_id_permission,
			v_id_access_level,
			*
			MIN(AL.priority),
			U.is_super_user
			/*
			CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_view THEN 1 ELSE 0 END END,
			CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_edit THEN 1 ELSE 0 END END,
			CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_admin THEN 1 ELSE 0 END END
			*
		FROM parts.Shop_User U
		INNER JOIN Shop_User_Role_Link URL
			ON U.id_user = URL.id_user
				AND URL.active
		INNER JOIN Shop_Role_Permission_Link RPL
			ON URL.id_role = RPL.id_role
				AND RPL.active
		INNER JOIN Shop_Permission P
			ON RPL.id_permission = P.id_permission
				AND P.active
		INNER JOIN Shop_Access_Level AL
			ON RPL.id_access_level = AL.id_access_level
				AND AL.active
		WHERE U.id_user = a_id_user
			AND (a_get_inactive_users OR U.active)
			AND FIND_IN_SET(P.id_permission, a_ids_permission) > 0
			# AND v_id_permission = P.id_permission
			# AND v_id_access_level = AL.id_access_leveld
		GROUP BY U.id_user, P.id_permission # , is_super_user
		;
		*/
		
        IF v_has_filter_user THEN
			UPDATE Shop_User_Eval_Temp UE_T
			INNER JOIN Shop_User U
				ON UE_T.id_user = U.id_user
					AND U.active
			INNER JOIN Shop_User_Role_Link URL
				ON U.id_user = URL.id_user
					AND URL.active
			INNER JOIN Shop_Role_Permission_Link RPL
				ON URL.id_role = RPL.id_role
					AND RPL.active
			INNER JOIN Shop_Access_Level AL
				ON RPL.id_access_level = AL.id_access_level
					AND AL.active
			SET UE_T.priority_access_level_user = AL.priority,
				UE_T.is_super_user = U.is_super_user,
				UE_T.can_view = CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN ISNULL(AL.priority) THEN 1 ELSE CASE WHEN AL.priority <= v_priority_access_level_view AND AL.priority <= UE_T.priority_access_level_required THEN 1 ELSE 0 END END END,
				UE_T.can_edit = CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN NOT ISNULL(AL.priority) AND AL.priority <= v_priority_access_level_edit AND AL.priority <= UE_T.priority_access_level_required THEN 1 ELSE 0 END END,
				UE_T.can_admin = CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN NOT ISNULL(AL.priority) AND AL.priority <= v_priority_access_level_admin AND AL.priority <= UE_T.priority_access_level_required THEN 1 ELSE 0 END END
			WHERE UE_T.guid = a_guid
				AND UE_T.id_user = a_id_user
				AND RPL.id_permission = UE_T.id_permission_required
			# GROUP BY UE_T.id_user
			;
        ELSE
			UPDATE Shop_User_Eval_Temp UE_T
			SET UE_T.priority_access_level_user = v_priority_access_level_view,
				UE_T.is_super_user = 0,
				UE_T.can_view = (v_priority_access_level_view <= UE_T.priority_access_level_required),
				UE_T.can_edit = 0,
				UE_T.can_admin = 0
			WHERE UE_T.guid = a_guid
				AND UE_T.id_user = a_id_user
			# GROUP BY UE_T.id_user
			;
        END IF;
    END IF;
    
    -- Clean up
	DROP TABLE IF EXISTS tmp_Shop_Product_p_Shop_User_Eval;
    # DROP TEMPORARY TABLE IF EXISTS tmp_User_Role_Link;
    # DROP TABLE IF EXISTS tmp_Msg_Error;
END //
DELIMITER ;


-- DROP TABLE IF EXISTS Shop_User_Eval_Temp;


/*
CALL p_shop_user_eval (
	'56c9dfc1-e22f-11ee-aab4-b42e9986184a', # a_guid
	'', 	# a_id_user # 'auth0|6582b95c895d09a70ba10fef',
	false,		# a_get_inactive_users
    2,	# a_ids_permission
    1,		# a_ids_access_level
	-- null,		# a_ids_product
    '1,2,3'		# a_ids_permutation
);


SELECT *
FROM Shop_User_Eval_Temp
;

DROP TABLE Shop_User_Eval_Temp;


SELECT *
FROM Shop_Permission
;

SELECT *
FROM Shop_Access_Level
;

SELECT *
FROM Shop_Product
;

SELECT *
FROM Shop_Product_Permutation
;


*/

/*
SELECT 'NOODS' AS guid,
	U.id_user AS id_user,
	P.id_permission AS id_permission_required,
	AL.id_access_level AS id_access_level_required,
	/*
	v_id_permission,
	v_id_access_level,
	*
	AL.priority, # MIN(AL.priority),
	U.is_super_user
	/*
	CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_view THEN 1 ELSE 0 END END,
	CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_edit THEN 1 ELSE 0 END END,
	CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_admin THEN 1 ELSE 0 END END
	*
FROM parts.Shop_User U
INNER JOIN Shop_User_Role_Link URL
	ON U.id_user = URL.id_user
		AND URL.active
INNER JOIN Shop_Role_Permission_Link RPL
	ON URL.id_role = RPL.id_role
		AND RPL.active
INNER JOIN Shop_Permission P
	ON RPL.id_permission = P.id_permission
		AND P.active
inner JOIN Shop_Access_Level AL
	# ON P.id_access_level_required = AL.id_access_level
    ON RPL.id_access_level = AL.id_access_level
		AND AL.active
WHERE U.id_user = 'auth0|6582b95c895d09a70ba10fef'
	AND U.active
	AND FIND_IN_SET(P.id_permission, '1,2') > 0
	# AND v_id_access_level = AL.id_access_leveld
# GROUP BY U.id_user, P.id_permission, AL.id_access_level # , is_super_user

*/

USE PARTS;

/*

CALL p_shop_get_many_product (
	'', # a_id_user
    1, # a_get_all_category
	'', # a_ids_category
	0, # a_get_inactive_category
    1, # a_get_all_product
	'', # a_ids_product
	0, # a_get_inactive_product
    0, # a_get_first_product_only
    1, # a_get_all_product_permutation
	'', # a_ids_permutation
	0, # a_get_inactive_permutation
    0, # a_get_all_image
	'', # a_ids_image
    0, # a_get_inactive_image
    1, # a_get_first_image_only
    1, # a_get_all_delivery_region
	'', # a_ids_delivery_region
    0, # a_get_inactive_delivery_region
    1, # a_get_all_currency
	'', # a_ids_currency
    0, # a_get_inactive_currency
    1, # a_get_all_discount
	'', # a_ids_discount
    0 # a_get_inactive_discount
);

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_product;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_product (
	IN a_id_user VARCHAR(200),
    IN a_get_all_category BIT,
	IN a_ids_category VARCHAR(500),
	IN a_get_inactive_category BIT,
    IN a_get_all_product BIT,
	IN a_ids_product VARCHAR(500),
	IN a_get_inactive_product BIT,
    IN a_get_first_product_only BIT,
    IN a_get_all_product_permutation BIT,
	IN a_ids_permutation VARCHAR(4000),
	IN a_get_inactive_permutation BIT,
    IN a_get_all_image BIT,
    IN a_ids_image VARCHAR(4000),
	IN a_get_inactive_image BIT,
    IN a_get_first_image_only BIT,
    IN a_get_all_delivery_region BIT,
    IN a_ids_delivery_region VARCHAR(4000),
	IN a_get_inactive_delivery_region BIT,
    IN a_get_all_currency BIT,
    IN a_ids_currency VARCHAR(4000),
	IN a_get_inactive_currency BIT,
    IN a_get_all_discount BIT,
    IN a_ids_discount VARCHAR(4000),
	IN a_get_inactive_discount BIT
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_category BIT;
    DECLARE v_has_filter_product BIT;
    DECLARE v_has_filter_permutation BIT;
    DECLARE v_has_filter_image BIT;
    DECLARE v_has_filter_delivery_region BIT;
    DECLARE v_has_filter_currency BIT;
    DECLARE v_has_filter_discount BIT;
    DECLARE v_guid VARCHAR(36);
    # DECLARE v_id_user VARCHAR(100);
    DECLARE v_ids_permutation_unavailable VARCHAR(4000);
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission VARCHAR(4000);
    DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    DECLARE v_now DATETIME;
    DECLARE v_id_minimum INT;
    
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');
    
    
	-- Argument validation + default values
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_get_all_category IS NULL THEN
		SET a_get_all_category = 0;
    END IF;
	IF a_ids_category IS NULL THEN
		SET a_ids_category = '';
	ELSE
		SET a_ids_category = REPLACE(TRIM(a_ids_category), '|', ',');
    END IF;
	IF a_get_inactive_category IS NULL THEN
		SET a_get_inactive_category = 0;
    END IF;
	IF a_ids_product IS NULL THEN
		SET a_ids_product = '';
	ELSE
		SET a_ids_product = REPLACE(TRIM(a_ids_product), '|', ',');
    END IF;
	IF a_get_inactive_product IS NULL THEN
		SET a_get_inactive_product = 0;
    END IF;
	IF a_get_first_product_only IS NULL THEN
		SET a_get_first_product_only = 1;
    END IF;
	IF a_get_all_product IS NULL THEN
		SET a_get_all_product = 0;
    END IF;
	IF a_ids_permutation IS NULL THEN
		SET a_ids_permutation = '';
	ELSE
		SET a_ids_permutation = REPLACE(TRIM(a_ids_permutation), '|', ',');
    END IF;
	IF a_get_inactive_permutation IS NULL THEN
		SET a_get_inactive_permutation = 0;
    END IF;
	IF a_get_all_image IS NULL THEN
		SET a_get_all_image = 1;
    END IF;
	IF a_ids_image IS NULL THEN
		SET a_ids_image = '';
	ELSE
		SET a_ids_image = REPLACE(TRIM(a_ids_image), '|', ',');
    END IF;
	IF a_get_inactive_image IS NULL THEN
		SET a_get_inactive_image = 0;
    END IF;
    IF a_get_first_image_only IS NULL THEN
		SET a_get_first_image_only = 0;
    END IF;
	IF a_get_inactive_image IS NULL THEN
		SET a_get_inactive_image = 0;
    END IF;
	IF a_get_all_delivery_region IS NULL THEN
		SET a_get_all_delivery_region = 1;
    END IF;
	IF a_ids_delivery_region IS NULL THEN
		SET a_ids_delivery_region = '';
	ELSE
		SET a_ids_delivery_region = REPLACE(TRIM(a_ids_delivery_region), '|', ',');
    END IF;
	IF a_get_inactive_delivery_region IS NULL THEN
		SET a_get_inactive_delivery_region = 0;
    END IF;
	IF a_get_all_currency IS NULL THEN
		SET a_get_all_currency = 1;
    END IF;
	IF a_ids_currency IS NULL THEN
		SET a_ids_currency = '';
	ELSE
		SET a_ids_currency = REPLACE(TRIM(a_ids_currency), '|', ',');
    END IF;
	IF a_get_inactive_currency IS NULL THEN
		SET a_get_inactive_currency = 0;
    END IF;
	IF a_get_all_discount IS NULL THEN
		SET a_get_all_discount = 1;
    END IF;
	IF a_ids_discount IS NULL THEN
		SET a_ids_discount = '';
	ELSE
		SET a_ids_discount = REPLACE(TRIM(a_ids_discount), '|', ',');
    END IF;
	IF a_get_inactive_discount IS NULL THEN
		SET a_get_inactive_discount = 0;
    END IF;
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Discount;
    DROP TABLE IF EXISTS tmp_Currency;
    DROP TABLE IF EXISTS tmp_Delivery_Region;
    DROP TABLE IF EXISTS tmp_Shop_Image;
    DROP TABLE IF EXISTS tmp_Shop_Variation;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_Category;
    
    CREATE TABLE tmp_Shop_Category (
		id_category INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Category_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Category(id_category),
        active BIT NOT NULL,
        display_order INT NOT NULL, 
        can_view BIT, 
        can_edit BIT, 
        can_admin BIT
    );
    
    CREATE TABLE tmp_Shop_Product (
		id_category INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Category(id_category),
		id_product INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		-- product_has_variations BIT NOT NULL,
		id_permutation INT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
        active_category BIT NOT NULL,
        active_product BIT NOT NULL,
        active_permutation BIT NULL,
        display_order_category INT NOT NULL, 
        display_order_product INT NOT NULL, 
        display_order_permutation INT NULL, 
        rank_permutation INT NOT NULL, # _in_category
        name VARCHAR(255) NOT NULL,
        description VARCHAR(4000) NOT NULL,
		/*
        price_GBP_full FLOAT NOT NULL,
		price_GBP_min FLOAT NOT NULL,
		*/
        latency_manufacture INT NOT NULL,
		quantity_min FLOAT NOT NULL,
		quantity_max FLOAT NOT NULL,
		quantity_step FLOAT NOT NULL,
		quantity_stock FLOAT NOT NULL,
		is_subscription BIT NOT NULL,
		id_recurrence_interval INT,
		CONSTRAINT FK_tmp_Shop_Product_id_recurrence_interval
			FOREIGN KEY (id_recurrence_interval)
			REFERENCES Shop_Recurrence_Interval(id_interval),
		count_recurrence_interval INT,
        id_stripe_product VARCHAR(100),
        product_has_variations INT NOT NULL,
        can_view BIT, 
        can_edit BIT, 
        can_admin BIT
    );
    
    /*
    CREATE TEMPORARY TABLE tmp_Shop_Variation (
		id_variation INT NOT NULL,
		id_product INT NOT NULL,
        display_order INT NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Image (
		id_image INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Image_id_image
			FOREIGN KEY (id_image)
			REFERENCES Shop_Image(id_image),
		id_product INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Image_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		id_permutation INT NULL,
        CONSTRAINT FK_tmp_Shop_Image_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
        active BIT NOT NULL,
        display_order INT NOT NULL,
        rank_in_product_permutation INT NOT NULL
    );
    
    CREATE TABLE tmp_Delivery_Region (
		id_region INT NOT NULL,
        CONSTRAINT FK_tmp_Delivery_Region_id_region
			FOREIGN KEY (id_region)
			REFERENCES Shop_Region(id_region),
        active BIT NOT NULL,
        display_order INT NOT NULL
    );
    
    CREATE TABLE tmp_Currency (
		id_currency INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Currency_id_currency
			FOREIGN KEY (id_currency)
			REFERENCES Shop_Currency(id_currency),
        active BIT NOT NULL,
        display_order INT NOT NULL
    );
    
    CREATE TABLE tmp_Discount (
		id_discount INT NOT NULL,
        CONSTRAINT FK_tmp_Discount_id_discount
			FOREIGN KEY (id_discount)
			REFERENCES Shop_Discount(id_discount),
        active BIT NOT NULL,
        display_order INT NOT NULL
    );
    
    CREATE TABLE IF NOT EXISTS tmp_Msg_Error ( # IF NOT EXISTS 
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid VARCHAR(36) NOT NULL,
		# code VARCHAR(50) NOT NULL,
        # CONSTRAINT chk_tmp_Msg_Error_code CHECK (code IN (SELECT code FROM Shop_Msg_Error_Type)),
		id_type INT NOT NULL,
        CONSTRAINT FK_tmp_Msg_Error_id_type
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type(id_type),
		msg VARCHAR(4000) NOT NULL
    );
    
    
    -- Parse filters
    SET v_has_filter_category = CASE WHEN a_ids_category = '' THEN 0 ELSE 1 END;
    SET v_has_filter_product = CASE WHEN a_ids_product = '' THEN 0 ELSE 1 END;
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_image = CASE WHEN a_ids_image = '' THEN 0 ELSE 1 END;
    SET v_has_filter_delivery_region = CASE WHEN a_ids_delivery_region = '' THEN 0 ELSE 1 END;
    SET v_has_filter_currency = CASE WHEN a_ids_currency = '' THEN 0 ELSE 1 END;
    SET v_has_filter_discount = CASE WHEN a_ids_discount = '' THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
	INSERT INTO tmp_Shop_Product (
		id_category,
		id_product,
		id_permutation,
		active_category,
		active_product,
		active_permutation,
        display_order_category,
        display_order_product,
        display_order_permutation,
        rank_permutation,
        name,
        description,
        /*
		price_GBP_VAT_incl,
		price_GBP_VAT_excl,
		price_GBP_min,
		*/
        latency_manufacture,
		quantity_min,
		quantity_max,
		quantity_step,
		quantity_stock,
		is_subscription,
		id_recurrence_interval,
		count_recurrence_interval,
        id_stripe_product,
        product_has_variations
	)
    SELECT 
		P.id_category,
		P.id_product,
		-- P.has_variations AS product_has_variations,
		PP.id_permutation,
		C.active AS active_category,
		P.active AS active_product,
		PP.active AS active_permutation,
		C.display_order AS display_order_category,
		P.display_order AS display_order_product,
		PP.display_order AS display_order_permutation,
        RANK() OVER (ORDER BY C.display_order, P.display_order, PP.display_order) AS rank_permutation, #PARTITION BY P.id_category # _in_category
		P.name,
		PP.description,
        /*
		PP.price_GBP_VAT_incl,
		PP.price_GBP_VAT_excl,
		PP.price_GBP_min,
		*/
        PP.latency_manufacture,
		PP.quantity_min,
		PP.quantity_max,
		PP.quantity_step,
		PP.quantity_stock,
		PP.is_subscription,
		PP.id_recurrence_interval,
		PP.count_recurrence_interval,
		PP.id_stripe_product,
        P.has_variations
	FROM Shop_Product P
    INNER JOIN Shop_Product_Permutation PP
		ON P.id_product = PP.id_product
	INNER JOIN Shop_Category C
		ON P.id_category = C.id_category
	WHERE
		# permutations
		(
			(
				a_get_all_product_permutation 
				OR v_has_filter_permutation AND FIND_IN_SET(PP.id_permutation, a_ids_permutation) > 0
			)
			AND (a_get_inactive_permutation OR PP.active)
        )
		# categories
		AND (
			(
				a_get_all_category 
                OR v_has_filter_category AND FIND_IN_SET(P.id_category, a_ids_category) > 0
			)
			AND (a_get_inactive_category OR C.active)
		) 
		# products
		AND (
			(
				a_get_all_product 
				OR v_has_filter_product AND FIND_IN_SET(P.id_product, a_ids_product) > 0
			)
			AND (a_get_inactive_product OR P.active)
		)
    ;
    
    -- select * from tmp_Shop_Product;
    
    IF a_get_first_product_only THEN
		DELETE FROM tmp_Shop_Product t_P
			WHERE t_P.rank_permutation > 1
		;
    END IF;
    
    INSERT INTO tmp_Shop_Category (
		id_category, 
        active,
        display_order
	)
	SELECT DISTINCT C.id_category,
		C.active,
		C.display_order
	FROM tmp_Shop_Product t_P
    INNER JOIN Shop_Category C
		ON t_P.id_category = C.id_category
	ORDER BY C.display_order
	;
    
    /*
    INSERT INTO tmp_Shop_Variation (
		id_variation, id_product # , display_order
	)
    SELECT P.id_variation, P.id_product # , P.display_order
	FROM Shop_Variation V
    INNER JOIN tmp_Shop_Product t_P
		ON V.id_product = t_P.id_product
		WHERE V.active;
    */
    
    # Product Images
    INSERT INTO tmp_Shop_Image (
		id_product, 
        id_permutation,
        id_image, 
        active, 
        display_order,
        rank_in_product_permutation
	)
    SELECT id_product, 
		id_permutation,
		id_image, 
		active, 
		ROW_NUMBER() OVER (ORDER BY display_order_product_temp, display_order_image), 
		RANK() OVER (PARTITION BY id_product, id_permutation ORDER BY display_order_product_temp, display_order_image)
	FROM (
		SELECT t_P.id_product, 
			I.id_permutation,
			I.id_image, 
			I.active, 
			I.display_order AS display_order_image,
            t_P.rank_permutation AS display_order_product_temp
		FROM Shop_Image I
		INNER JOIN tmp_Shop_Product t_P
			ON I.id_product = t_P.id_product
				AND NOT t_P.product_has_variations
		UNION
		SELECT t_P.id_product, 
			I.id_permutation,
			I.id_image, 
			I.active, 
			I.display_order AS display_order_image,
            t_P.rank_permutation AS display_order_product_temp
		FROM Shop_Image I
		INNER JOIN tmp_Shop_Product t_P
			ON I.id_permutation = t_P.id_permutation
				AND t_P.product_has_variations
		) IPP
	WHERE (a_get_all_image OR a_get_first_image_only OR FIND_IN_SET(id_image, a_ids_image) > 0)
		AND (a_get_inactive_image OR IPP.active)
	;
    
    IF a_get_first_image_only THEN
		DELETE FROM tmp_Shop_Image
			WHERE rank_in_product_permutation > 1
		;
    END IF;
    
    /*
    IF v_has_filter_image THEN
		DELETE FROM tmp_Shop_Product
			WHERE id_product NOT IN (SELECT DISTINCT id_product FROM tmp_Shop_Image);
		DELETE FROM tmp_Shop_Category
			WHERE id_category NOT IN (SELECT DISTINCT id_category FROM tmp_Shop_Product);
    END IF;
    */
    
    # Delivery Regions
    INSERT INTO tmp_Delivery_Region (
		id_region,
        active,
        display_order
    )
    WITH RECURSIVE Recursive_CTE_Delivery_Region AS (
		SELECT 
			DR.id_region AS id_region_parent,
            NULL AS id_region_child
		FROM Shop_Region DR
		INNER JOIN Shop_Product_Delivery_Option_Link PDOL
			ON DR.id_region = PDOL.id_region
		INNER JOIN tmp_Shop_Product t_P
			ON PDOL.id_product = t_P.id_product
			AND PDOL.id_permutation <=> t_P.id_permutation
		WHERE 
			(
				a_get_all_delivery_region
				OR FIND_IN_SET(DR.id_region, a_ids_delivery_region) > 0
			)
			AND (
				a_get_inactive_delivery_region
				OR DR.active
			)
		UNION
        SELECT 
			DRB.id_region_parent,
			DRB.id_region_child
		FROM Shop_Region_Branch DRB
        INNER JOIN Recursive_CTE_Delivery_Region r_DR 
			ON DRB.id_region_parent = r_DR.id_region_child
            AND (
				a_get_inactive_delivery_region
                OR DRB.active
            )
	)
    SELECT
		DR.id_region,
        DR.active,
        DR.display_order
	FROM Shop_Region DR
    INNER JOIN Recursive_CTE_Delivery_Region r_DR 
		ON DR.id_region = r_DR.id_region_parent
		OR DR.id_region = r_DR.id_region_child
    ;
    
    IF v_has_filter_delivery_region THEN
		SET v_ids_permutation_unavailable = (
			SELECT GROUP_CONCAT(t_P.id_permutation SEPARATOR ', ')
			FROM tmp_Shop_Product t_P 
			INNER JOIN Shop_Product_Currency_Region_Link PCRL 
				ON t_P.id_permutation = PCRL.id_permutation
			LEFT JOIN tmp_Delivery_Region t_DR
				ON PCRL.id_region_purchase = t_DR.id_region
			WHERE ISNULL(t_DR.id_region)
		);
        IF NOT ISNULL(v_ids_permutation_unavailable) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				id_type,
				msg
			)
			VALUES (
				v_guid,
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'PRODUCT_AVAILABILITY' LIMIT 1),
				CONCAT('Error: The following permutation IDs are not available in this region: ', v_ids_permutation_unavailable)
			);
        END IF;
        /*
		DELETE FROM tmp_Shop_Product t_P
        WHERE t_P.id_permutation NOT IN (
			SELECT
				id_permutation
			FROM Shop_Product_Currency_Region_Link PCL
            INNER JOIN tmp_Delivery_Region t_DR
				ON PCRL.id_region_purchase = t_DR.id_region
		);
        */
    END IF;
    
    select * from tmp_Shop_Product;
    
    # Currencies
    INSERT INTO tmp_Currency (
		id_currency,
        active,
        display_order
    )
    SELECT
		C.id_currency,
        C.active,
        C.display_order
	FROM Shop_Product_Currency_Region_Link PCRL
    INNER JOIN Shop_Currency C ON PCRL.id_currency = C.id_currency
    /*
    LEFT JOIN Shop_Discount_Region_Currency_Link DRCL ON C.id_currency = DRCL.id_currency
    LEFT JOIN Shop_Discount D ON DRCL.id_discount = D.id_discount
    INNER JOIN tmp_Shop_Product t_P 
		ON D.id_product = t_P.id_product
        AND D.id_permutation <=> t_P.id_permutation
	INNER JOIN tmp_Delivery_Region t_DR ON DRCL.id_region = t_DR.id_region
    INNER JOIN Shop_Product_Currency_Region_Link PCRL ON C.id_currency = PCRL.id_currency
    */
    INNER JOIN tmp_Shop_Product t_P 
		ON PCRL.id_product <=> t_P.id_product
        AND PCRL.id_permutation <=> t_P.id_permutation
	INNER JOIN tmp_Delivery_Region t_DR ON PCRL.id_region_purchase = t_DR.id_region
    WHERE
		(
			a_get_all_currency
			OR FIND_IN_SET(C.id_currency, a_ids_currency) > 0
		)
		AND (
			a_get_inactive_currency
            OR (
				C.active
                AND PCRL.active
			)
		)
    ;
    
    select * from tmp_Currency;
    
    IF v_has_filter_currency THEN
		SET v_ids_permutation_unavailable = (
			SELECT GROUP_CONCAT(t_P.id_permutation SEPARATOR ', ')
			FROM tmp_Shop_Product t_P 
			LEFT JOIN (
				SELECT *
                FROM Shop_Product_Currency_Region_Link PCRL
                WHERE 
					(
						a_get_all_currency
						OR FIND_IN_SET(PCRL.id_currency, a_ids_currency) > 0
					)
			) PCRL
				ON t_P.id_permutation = PCRL.id_permutation
			LEFT JOIN tmp_Currency t_C
				ON PCRL.id_currency = t_C.id_currency
			WHERE ISNULL(t_C.id_currency) 
		);
        IF NOT ISNULL(v_ids_permutation_unavailable) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				id_type,
				msg
			)
			VALUES (
				v_guid,
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'PRODUCT_AVAILABILITY' LIMIT 1),
				CONCAT('Error: The following permutation IDs are not available in this currency: ', v_ids_permutation_unavailable)
			);
        END IF;
        /*
		DELETE FROM tmp_Shop_Product t_P
        WHERE t_P.id_permutation NOT IN (
			SELECT
				id_permutation
			FROM Shop_Product_Currency_Region_Link PCL
            INNER JOIN tmp_Currency t_C
				ON PCRL.id_currency = t_C.id_currency
		);
        */
    END IF;
    
    # Discounts
    INSERT INTO tmp_Discount (
		id_discount,
        active,
        display_order
    )
    SELECT
		D.id_discount,
        D.active,
        D.display_order
	FROM Shop_Discount D
    INNER JOIN tmp_Shop_Product t_P
		ON D.id_product = t_P.id_product
		AND D.id_permutation <=> t_P.id_permutation
    WHERE
		(
			a_get_all_discount
			OR FIND_IN_SET(D.id_discount, a_ids_discount) > 0
		)
		AND (
			a_get_inactive_discount
            OR D.active
		)
    ;
    
    # select 'pre-permission results';
    # select * from tmp_Shop_Product;
    
    -- Permissions
    IF EXISTS (SELECT * FROM tmp_Shop_Category LIMIT 1) THEN
        # SET v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER());
        SET v_id_permission_product := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
        -- SET v_ids_product_permission := (SELECT GROUP_CONCAT(id_product SEPARATOR ',') FROM tmp_Shop_Product);
        SET v_ids_permutation_permission := (SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
        -- select * from Shop_User_Eval_Temp;
        
        CALL p_shop_user_eval(v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission);
        
        -- select * from Shop_User_Eval_Temp;
        
        UPDATE tmp_Shop_Product t_P
        INNER JOIN Shop_User_Eval_Temp UE_T
			ON t_P.id_permutation = UE_T.id_permutation
			AND UE_T.GUID = v_guid
        SET t_P.can_view = UE_T.can_view,
			t_P.can_edit = UE_T.can_edit,
            t_P.can_admin = UE_T.can_admin;
		
        DELETE FROM tmp_Shop_Product t_P
		WHERE 
			FIND_IN_SET(t_P.id_product, (SELECT GROUP_CONCAT(UET.id_product SEPARATOR ',') FROM Shop_User_Eval_Temp UET)) = 0 # id_product NOT LIKE CONCAT('%', (SELECT GROUP_CONCAT(id_product SEPARATOR '|') FROM Shop_User_Eval_Temp), '%');
            OR (
				ISNULL(t_P.can_view)
				AND (
					NOT v_has_filter_category
                    OR FIND_IN_SET(t_P.id_category, a_ids_category) = 0
				)
                AND (
					NOT v_has_filter_product
                    OR FIND_IN_SET(t_P.id_product, a_ids_product) = 0
                )
                AND (
					NOT v_has_filter_permutation 
                    OR FIND_IN_SET(t_P.id_permutation, a_ids_permutation) = 0
				)
            )
        ;
        
        # CALL p_shop_user_eval_clear_temp(v_guid);
        # DROP TABLE IF EXISTS Shop_User_Eval_Temp;
        DELETE FROM Shop_User_Eval_Temp
        WHERE GUID = v_guid
        ;
    END IF;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns
    SET v_now := NOW();
    
    # Categories
    SELECT 
		DISTINCT t_C.id_category,
        C.name,
        C.description,
        C.display_order
    FROM tmp_Shop_Category t_C
    INNER JOIN Shop_Category C
		ON t_C.id_category = C.id_category
	INNER JOIN tmp_Shop_Product t_P
		ON t_C.id_category = t_P.id_category
	ORDER BY C.display_order
	;
    
    # Products
    SELECT 
		t_P.id_product,
		t_P.id_permutation,
        t_P.name,
        t_P.description,
        P.has_variations,
        P.id_category,
        t_P.latency_manufacture,
        t_P.quantity_min,
        t_P.quantity_max,
        t_P.quantity_step,
        t_P.quantity_stock,
        t_P.id_stripe_product,
        t_P.is_subscription,
        RI.name AS name_recurrence_interval,
        RI.name_plural AS name_plural_recurrence_interval,
        t_P.count_recurrence_interval,
        t_P.display_order_category,
        t_P.display_order_product,
        t_P.display_order_permutation,
        IFNULL(t_P.can_view, 0),
        IFNULL(t_P.can_edit, 0),
        IFNULL(t_P.can_admin, 0)
    FROM tmp_Shop_Product t_P
    INNER JOIN Shop_Product P
		ON t_P.id_product = P.id_product
	LEFT JOIN Shop_Recurrence_Interval RI
		ON t_P.id_recurrence_interval = RI.id_interval
	ORDER BY t_P.rank_permutation
	;
    
    # Variations
    SELECT 
		V.id_variation,
        t_P.id_product,
        t_P.id_permutation,
        t_P.id_category,
        VT.code AS code_variation_type,
        VT.name AS name_variation_type,
        V.code AS code_variation,
        V.name AS name_variation,
        RANK() OVER (ORDER BY t_P.rank_permutation, PPVL.display_order) AS display_order
    FROM Shop_Variation V
	INNER JOIN Shop_Variation_Type VT
		ON V.id_type = VT.id_type
    INNER JOIN Shop_Product_Permutation_Variation_Link PPVL ON V.id_variation = PPVL.id_variation
	INNER JOIN tmp_Shop_Product t_P ON PPVL.id_permutation <=> t_P.id_permutation
	WHERE V.active
		AND PPVL.active
	;
    
    /*
    # Permutation variations output
	SELECT t_P.id_permutation, 
		t_P.id_product,
		t_P.id_category,
		id_variation
	FROM Shop_Product_Permutation_Variation_Link PPVL
	INNER JOIN tmp_Shop_Product t_P
		ON t_P.id_permutation = PPVL.id_permutation
	ORDER BY t_P.display_order
	;
    */
    
    # Product Price
	SELECT 
		PCRL.id_link AS id_price,
        t_P.id_permutation, 
		t_P.id_product,
		t_P.id_category,
        t_C.id_currency,
        C.code AS code_currency,
        C.name AS name_currency,
        C.symbol AS symbol_currency,
        t_DR.id_region,
		PCRL.price_local_VAT_incl,
		PCRL.price_local_VAT_excl,
        ROW_NUMBER() OVER(ORDER BY t_P.rank_permutation, C.display_order) AS display_order
	FROM Shop_Product_Currency_Region_Link PCRL
	INNER JOIN tmp_Shop_Product t_P
		ON t_P.id_product = PCRL.id_product
		AND t_P.id_permutation <=> PCRL.id_permutation
	-- INNER JOIN Shop_Product P ON PCRL.id_product = P.id_product
	INNER JOIN tmp_Currency t_C ON PCRL.id_currency = t_C.id_currency
	INNER JOIN Shop_Currency C ON t_C.id_currency = C.id_currency
	INNER JOIN tmp_Delivery_Region t_DR ON PCRL.id_region_purchase = t_DR.id_region
    WHERE (
        a_get_inactive_product 
        AND a_get_inactive_permutation
        AND a_get_inactive_currency
        AND a_get_inactive_delivery_region
        OR PCRL.active
	)
	ORDER BY t_P.rank_permutation
	;
    
    /*
    # Currency
	SELECT
		DISTINCT C.id_currency,
        C.code,
        C.name,
        C.factor_from_GBP,
        t_C.display_order
	FROM Shop_Currency C
    INNER JOIN tmp_Currency t_C ON C.id_currency = t_C.id_currency
    GROUP BY C.id_currency, t_C.display_order
	ORDER BY t_C.display_order
	;
    */
    
    # Images
    SELECT 
		t_I.id_image,
        t_I.id_product,
		t_I.id_permutation,
        t_P.id_category,
        I.url,
        I.active,
        I.display_order
    FROM tmp_Shop_Image t_I
    INNER JOIN Shop_Image I
		ON t_I.id_image = I.id_image
	INNER JOIN tmp_Shop_Product t_P
		ON t_I.id_product = t_P.id_product
			AND t_I.id_permutation <=> t_P.id_permutation
	ORDER BY t_P.rank_permutation, I.display_order
	;
    
    # Delivery options
    SELECT 
		_DO.id_option,
		PDOL.id_product,
		PDOL.id_permutation,
		t_P.id_category,
		_DO.code,
		_DO.name,
		_DO.latency_delivery_min,
		_DO.latency_delivery_max,
		_DO.quantity_min,
		_DO.quantity_max,
		GROUP_CONCAT(DR.code SEPARATOR ',') AS codes_region,
		GROUP_CONCAT(DR.name SEPARATOR ',') AS names_region,
		PDOL.price_local,
		PDOL.display_order
	FROM Shop_Delivery_Option _DO
    INNER JOIN Shop_Product_Delivery_Option_Link PDOL
		ON _DO.id_option = PDOL.id_delivery_option
		AND (
			a_get_inactive_delivery_region
			OR PDOL.active
		)
	INNER JOIN tmp_Shop_Product t_P
		ON PDOL.id_product = t_P.id_product
		AND PDOL.id_permutation <=> t_P.id_permutation
	INNER JOIN tmp_Delivery_Region t_DR ON PDOL.id_region = t_DR.id_region
	INNER JOIN Shop_Region DR ON t_DR.id_region = DR.id_region
	WHERE (
		a_get_inactive_delivery_region
		OR _DO.active
	)
	GROUP BY t_P.id_category, t_P.id_product, PDOL.id_permutation, t_P.rank_permutation, DR.id_region, _DO.id_option, PDOL.id_link
	ORDER BY t_P.rank_permutation, PDOL.display_order
	;
    
    # Discounts
    SELECT 
		D.id_discount,
		P.id_category,
		D.id_product,
		D.id_permutation,
        DR.id_region,
        C.id_currency,
		D.code AS code_discount,
		D.name AS name_discount,
		D.multiplier,
        D.subtractor,
        D.apply_multiplier_first,
		D.quantity_min,
		D.quantity_max,
		D.date_start,
		D.date_end,
        GROUP_CONCAT(DR.code) AS codes_region,
        GROUP_CONCAT(DR.name) AS names_region,
        GROUP_CONCAT(C.code) AS codes_currency,
        GROUP_CONCAT(C.name) AS names_currency,
		ROW_NUMBER() OVER(ORDER BY D.display_order) AS display_order
	FROM tmp_Discount t_D
    INNER JOIN Shop_Discount D ON t_D.id_discount = D.id_discount
    INNER JOIN Shop_Product P ON D.id_product = P.id_product
	INNER JOIN tmp_Shop_Product t_P
		ON D.id_product = t_P.id_product
		-- AND D.id_permutation <=> t_P.id_permutation
	INNER JOIN Shop_Discount_Region_Currency_Link DRCL
		ON D.id_discount = DRCL.id_discount
	INNER JOIN tmp_Delivery_Region t_DR ON DRCL.id_region = t_DR.id_region
	INNER JOIN Shop_Region DR ON t_DR.id_region = DR.id_region
	INNER JOIN tmp_Currency t_C ON DRCL.id_currency = t_C.id_currency
	INNER JOIN Shop_Currency C ON t_C.id_currency = C.id_currency
    GROUP BY D.id_discount, DR.id_region, C.id_currency
    ORDER BY D.display_order, DR.display_order, C.display_order
	;
    
    /*
    # Delivery Regions
    SELECT 
		t_DR.id_region,
		t_P.id_category,
		t_P.id_product,
		t_P.id_permutation,
		DR.code,
		DR.name
	FROM tmp_Delivery_Region t_DR
    INNER JOIN Shop_Delivery_Region DR ON t_DR.id_region = DR.id_region
	INNER JOIN Shop_Product_Region_Currency_Link PDRL 
		ON DR.id_region = PDRL.id_region 
        AND (
			a_get_inactive_delivery_region 
            OR PDRL.active
		)
	INNER JOIN tmp_Shop_Product t_P
		ON PDRL.id_product = t_P.id_product
		AND PDRL.id_permutation <=> t_P.id_permutation
	INNER JOIN tmp_Currency t_C ON PDRL.id_currency = t_C.id_currency
	ORDER BY t_DR.display_order
	;
    */
    
    # Errors
    SELECT 
		t_ME.display_order,
		t_ME.guid,
        t_ME.id_type,
        t_ME.msg,
        MET.code, 
        MET.name,
        MET.description
    FROM tmp_Msg_Error t_ME
    INNER JOIN Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    WHERE guid = v_guid
    ;
    
    /*
    # Return arguments for test
    SELECT
	a_ids_category,
	a_get_inactive_category,
	a_ids_product,
	a_get_inactive_product,
    a_get_first_product_only,
    a_get_all_product,
	a_ids_image,
	a_get_inactive_image,
    a_get_first_image_only,
    a_get_all_image
    ;
    */
    
    # select 'other outputs';
    # select * from tmp_Shop_Product;
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Discount;
    DROP TABLE IF EXISTS tmp_Currency;
    DROP TABLE IF EXISTS tmp_Delivery_Region;
    DROP TABLE IF EXISTS tmp_Shop_Image;
    DROP TABLE IF EXISTS tmp_Shop_Variation;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_Category;
END //
DELIMITER ;


/*

CALL p_shop_get_many_product (
	'', # a_id_user
    1, # a_get_all_category
	'', # a_ids_category
	0, # a_get_inactive_category
    1, # a_get_all_product
	'', # a_ids_product
	0, # a_get_inactive_product
    0, # a_get_first_product_only
    1, # a_get_all_product_permutation
	'', # a_ids_permutation
	0, # a_get_inactive_permutation
    0, # a_get_all_image
	'', # a_ids_image
    0, # a_get_inactive_image
    1, # a_get_first_image_only
    0, # a_get_all_delivery_region
	'1', # a_ids_delivery_region
    0, # a_get_inactive_delivery_region
    0, # a_get_all_currency
	'2', # a_ids_currency
    0, # a_get_inactive_currency
    1, # a_get_all_discount
	'', # a_ids_discount
    0 # a_get_inactive_discount
);

select * from shop_image;
select * from shop_product;
select * from TMP_MSG_ERROR;
DROP TABLE TMP_MSG_ERROR;

insert into shop_product_change_set (comment)
    values ('set product not subscription - test bool output to python');
    update shop_product
    set is_subscription = 0,
		id_change_set = (select id_change_set from shop_product_change_set order by id_change_set desc limit 1)
    where id_product = 1
*/

USE PARTS;

/*

CALL p_shop_edit_user (
	'auth0|6582b95c895d09a70ba10fef', # a_id_user
	'', # a_name
	'', # a_email
    0 # a_email_verified
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_edit_user;


DELIMITER //
CREATE PROCEDURE p_shop_edit_user (
	IN a_id_user VARCHAR(200),
    IN a_name VARCHAR(255),
	IN a_email VARCHAR(254),
    IN a_email_verified BIT
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_user BIT;
    -- DECLARE v_now DATETIME;
    
    
	-- Argument validation + default values
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_name IS NULL THEN
		SET a_name = '';
	ELSE
		SET a_name = TRIM(a_name);
    END IF;
	IF a_email IS NULL THEN
		SET a_email = '';
	ELSE
		SET a_email = TRIM(a_email);
    END IF;
	IF a_email_verified IS NULL THEN
		SET a_email_verified = 0;
    END IF;
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Msg_Error;
    DROP TABLE IF EXISTS tmp_Shop_User;
    
    CREATE TABLE tmp_Shop_User (
		id_user VARCHAR(200) NOT NULL,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BIT NOT NULL
    );
    
    CREATE TABLE tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		id_type INT NOT NULL,
        # code VARCHAR(50) NOT NULL,
        # CONSTRAINT chk_tmp_Msg_Error_code CHECK (code IN (SELECT code FROM Shop_Msg_Error_Type)),
        CONSTRAINT FK_tmp_Msg_Error_id_type
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type(id_type),
		msg VARCHAR(4000) NOT NULL
    );
    
    
    -- Parse filters
    SET v_has_filter_user = CASE WHEN a_id_user = '' THEN 0 ELSE 1 END;
    
    
    -- User
    IF v_has_filter_user THEN
        INSERT INTO tmp_Shop_User (
			id_user,
			active
		)
        SELECT id_user,
			active
		FROM Shop_User
        WHERE id_user LIKE CONCAT('%', a_id_user, '%')
			AND active
		LIMIT 1
        ;
        
		IF NOT EXISTS (SELECT id_user FROM tmp_Shop_User LIMIT 1) THEN
			INSERT INTO Shop_User (
				id_user,
                name,
                email,
                email_verified
            )
            VALUES (
				a_id_user,
                a_name,
                a_email,
                a_email_verified
            );
            
            INSERT INTO tmp_Shop_User (
				id_user,
				active
			)
			SELECT id_user,
				active
			FROM Shop_User
			WHERE id_user LIKE CONCAT('%', a_id_user, '%')
				AND active
			LIMIT 1
            ;
        END IF;
        
        SET a_id_user := (SELECT id_user FROM tmp_Shop_User LIMIT 1);
	ELSE
		INSERT INTO tmp_Msg_Error (
			id_type,
            msg
		)
        VALUES (
			 (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
            'No user ID provided.'
		)
        ;
    END IF;
    
    
    /*
    IF NOT EXISTS (SELECT msg FROM tmp_Msg_Error LIMIT 1) THEN
    END IF;
    */
    
    
    -- Returns
    # User
    SELECT *
    FROM tmp_Shop_User
    ;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
    ;
    
    /*
    # Return arguments for test
    SELECT a_id_user,
		a_name,
        a_email,
        a_email_verified
    ;
    */
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Msg_Error;
    DROP TABLE IF EXISTS tmp_Shop_User;
END //
DELIMITER ;



/*

CALL p_shop_edit_user (
	'',
	'',
	'',
    0
)

*/

USE PARTS;

/*

CALL p_shop_get_many_currency (
	0 # a_get_inactive_currency
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_currency;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_currency (
	IN a_get_inactive_currency BIT
)
BEGIN
	IF a_get_inactive_currency IS NULL THEN
		SET a_get_inactive_currency = 0;
    END IF;
    
	SELECT 
		C.id_currency,
        C.code,
        C.name,
        C.factor_from_GBP,
        C.active,
        C.display_order
	FROM Shop_Currency C
	WHERE a_get_inactive_currency
		OR C.active
	ORDER BY C.display_order
	;
END //
DELIMITER ;


CALL p_shop_get_many_currency (
	0 # a_get_inactive_currency
);

USE PARTS;

/*

CALL p_shop_get_many_region (
	0 # a_get_inactive_region
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_region;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_region (
	IN a_get_inactive_region BIT
)
BEGIN
	IF a_get_inactive_region IS NULL THEN
		SET a_get_inactive_region = 0;
    END IF;
    
	SELECT 
		R.id_region,
        R.code,
        R.name,
        R.active,
        R.display_order
	FROM Shop_Region R
	WHERE a_get_inactive_region
		OR R.active
	ORDER BY R.display_order
	;
END //
DELIMITER ;

CALL p_shop_get_many_region (
	0 # a_get_inactive_region
);

USE PARTS;

/*

CALL p_shop_edit_user_basket (
	'', # a_id_user
	'', # a_ids_permutation_basket
	'', # a_quantities_permutation_basket
    1, # a_id_permutation_edit
	NULL, # a_quantity_permutation_edit
    1, # a_sum_not_edit
    1, # a_id_currency_edit
    1 # a_id_region_purchase
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_edit_user_basket;


DELIMITER //
CREATE PROCEDURE p_shop_edit_user_basket (
	IN a_id_user VARCHAR(200),
	IN a_ids_permutation_basket VARCHAR(4000),
	IN a_quantities_permutation_basket VARCHAR(4000),
	IN a_id_permutation_edit INT,
	IN a_quantity_permutation_edit INT,
    IN a_sum_not_edit BIT,
    IN a_id_currency INT,
    IN a_id_region_purchase INT
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_user BIT;
    DECLARE v_has_filter_permutation_basket BIT;
    DECLARE v_has_filter_permutation_edit BIT;
    DECLARE v_has_filter_region BIT;
    DECLARE v_has_filter_currency BIT;
    DECLARE v_n_id_permutation_basket INT;
    DECLARE v_n_quantity_permutation_basket INT;
    DECLARE v_row_number INT;
    DECLARE v_guid VARCHAR(36);
    # DECLARE v_id_user VARCHAR(100);
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_now DATETIME;
    # DECLARE v_quantity_new INT;
    DECLARE v_change_set_used BIT;
    DECLARE v_id_change_set INT;
    
    SET v_guid = UUID();
    
	-- Argument validation + default values
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_ids_permutation_basket IS NULL THEN
		SET a_ids_permutation_basket = '';
	ELSE
		SET a_ids_permutation_basket = TRIM(a_ids_permutation_basket);
    END IF;
	IF a_quantities_permutation_basket IS NULL THEN
		SET a_quantities_permutation_basket = '';
	ELSE
		SET a_quantities_permutation_basket = TRIM(a_quantities_permutation_basket);
    END IF;
	IF a_sum_not_edit IS NULL THEN
		SET a_sum_not_edit = 1;
    END IF;
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Msg_Error;
    DROP TABLE IF EXISTS tmp_Shop_Basket;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Quantity;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_User;
    
    CREATE TABLE tmp_Shop_User (
		id_user VARCHAR(200) NOT NULL,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BIT NOT NULL
    );
    
    CREATE TABLE tmp_Shop_Product (
		id_product INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		id_permutation INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
        display_order INT NOT NULL,
        active INT NOT NULL DEFAULT 1
	);
    
    CREATE TEMPORARY TABLE tmp_Shop_Quantity(
		quantity INT NOT NULL,
        display_order INT NOT NULL,
        active INT NOT NULL DEFAULT 1
	);
    
    CREATE TABLE tmp_Shop_Basket (
		id_category INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Basket_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Category(id_category),
        id_product INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Basket_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		id_permutation INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Basket_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
		id_region_purchase INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Basket_id_region_purchase
			FOREIGN KEY (id_region_purchase)
			REFERENCES Shop_Region(id_region),
		id_currency INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Basket_id_currency
			FOREIGN KEY (id_currency)
			REFERENCES Shop_Currency(id_currency),
        quantity INT NOT NULL,
        active BIT NOT NULL DEFAULT 1
        /*
        display_order_category INT NOT NULL,
        display_order_product INT NOT NULL
        */
    );
    
    CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid VARCHAR(36) NOT NULL,
		id_type INT NOT NULL,
        # code VARCHAR(50) NOT NULL,
        # CONSTRAINT chk_tmp_Msg_Error_code CHECK (code IN (SELECT code FROM Shop_Msg_Error_Type)),
        CONSTRAINT FK_tmp_Msg_Error_id_type
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type(id_type),
		msg VARCHAR(4000) NOT NULL
    );
    
    
    -- Parse filters
    SET v_has_filter_user = NOT (a_id_user = '');
    SET v_has_filter_permutation_basket = NOT (a_ids_permutation_basket = '');
    SET v_has_filter_permutation_edit = NOT ISNULL(a_id_permutation_edit);
    SET v_has_filter_currency = NOT ISNULL(a_id_currency);
    SET v_has_filter_region = NOT ISNULL(a_id_region_purchase);
    # SET v_quantity_new = CASE WHEN a_sum_not_edit THEN quantity + a_quantity_product_edit ELSE a_quantity_product_edit END;
    /*
    SELECT v_has_filter_user, v_has_filter_basket
    ;
    
    */
    
    -- Currency
    IF NOT v_has_filter_currency THEN
		INSERT INTO tmp_Msg_Error (
			id_type,
			guid,
			msg
		)
		VALUES (
			(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
			v_guid,
			'Currency ID not provided.'
		)
		;
    END IF;
    IF v_has_filter_currency AND NOT EXISTS ( SELECT * FROM Shop_Currency WHERE id_currency = a_id_currency) THEN
		INSERT INTO tmp_Msg_Error (
			id_type,
			guid,
			msg
		)
		VALUES (
			(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
			v_guid,
			CONCAT('Currency ID not found: ', a_id_currency, '.')
		)
		;
    END IF;
    
    -- Region
    IF NOT v_has_filter_region THEN
		INSERT INTO tmp_Msg_Error (
			id_type,
			guid,
			msg
		)
		VALUES (
			(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
			v_guid,
			'Region ID not provided.'
		)
		;
    END IF;
    IF v_has_filter_region AND NOT EXISTS ( SELECT * FROM Shop_Region WHERE id_region = a_id_region_purchase) THEN
		INSERT INTO tmp_Msg_Error (
			id_type,
			guid,
			msg
		)
		VALUES (
			(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
			v_guid,
			CONCAT('Region ID not found: ', a_id_region_purchase, '.')
		)
		;
    END IF;
    
    -- User
    IF v_has_filter_user THEN
        INSERT INTO tmp_Shop_User (
			id_user,
			active
		)
        SELECT id_user,
			active
		FROM Shop_User
        WHERE id_user LIKE CONCAT('%', a_id_user, '%')
			AND active
		LIMIT 1
        ;
        
		IF NOT EXISTS (SELECT id_user FROM tmp_Shop_User LIMIT 1) THEN
			SET v_has_filter_user = 0;
            
			INSERT INTO tmp_Msg_Error (
				id_type,
                guid,
				msg
			)
			VALUES (
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
                v_guid,
                CONCAT('User ID not found: ', a_id_user, '.')
			)
			;
        END IF;
        
        SET a_id_user := (SELECT id_user FROM tmp_Shop_User LIMIT 1);
    END IF;
    
    IF v_has_filter_user AND NOT EXISTS (SELECT msg FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		SET v_change_set_used = 0;
		INSERT INTO Shop_User_Change_Set (
			comment
		)
		VALUES (
			'edit basket'
		);
		SET v_id_change_set := (SELECT id_change_set FROM Shop_User_Change_Set ORDER BY id_change_set DESC LIMIT 1);
    END IF;
    
    -- Get basket
    -- User
    IF v_has_filter_user AND NOT EXISTS (SELECT msg FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		INSERT INTO tmp_Shop_Basket (
			id_category,
            id_product,
            id_permutation,
            id_region_purchase,
            id_currency,
            quantity,
            active
            /*
            display_order_category,
            display_order_product
            */
        )
        SELECT 
			C.id_category,
			UB.id_product,
			UB.id_permutation,
            UB.id_region_purchase,
            UB.id_currency,
            UB.quantity,
            UB.active
            /*
			C.display_order,
			P.display_order
            */
		FROM Shop_User_Basket UB
        /*
        INNER JOIN tmp_Shop_User t_U
			ON UB.id_user = t_U.id_user
		*/
		INNER JOIN Shop_Product_Permutation PP
			ON UB.id_product = PP.id_product
            AND PP.active
		INNER JOIN Shop_Product P
			ON PP.id_product = P.id_product
			AND P.active
        INNER JOIN Shop_Category C
			ON P.id_category = C.id_category
			AND C.active
		WHERE UB.id_user = a_id_user
        ;
    END IF;
    
    -- Currency
    IF EXISTS (SELECT * FROM tmp_Shop_Basket WHERE active LIMIT 1) 
		AND NOT EXISTS (SELECT msg FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		IF EXISTS (SELECT * FROM tmp_Shop_Basket WHERE active AND id_currency != a_id_currency) THEN
			INSERT INTO tmp_Msg_Error (
				id_type,
                guid,
				msg
			)
			VALUES (
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
                v_guid,
                CONCAT(
					'Currency ID does not match currency of other items in basket. Basket currency: ', 
					(SELECT code FROM Shop_Currency WHERE id_currency = (
						SELECT 
							id_currency 
						FROM tmp_Shop_Basket 
                        WHERE active 
							AND id_currency != a_id_currency 
						LIMIT 1
					)), 
                    ', new currency: ', 
                    (SELECT code FROM Shop_Currency WHERE id_currency = a_id_currency), 
                    '.'
				)
			)
			;
        END IF;
    END IF;
    
    -- Region
    IF EXISTS (SELECT * FROM tmp_Shop_Basket WHERE active LIMIT 1) 
		AND NOT EXISTS (SELECT msg FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Shop_Basket 
            WHERE 
				active 
                AND id_region_purchase != a_id_region_purchase
		) THEN
			INSERT INTO tmp_Msg_Error (
				id_type,
                guid,
				msg
			)
			VALUES (
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
                v_guid,
                CONCAT('Purchase region ID does not match region of other items in basket. Basket currency: ', 
					(SELECT code FROM Shop_Region WHERE id_region = (
						SELECT 
							id_region_purchase
						FROM tmp_Shop_Basket 
                        WHERE active 
							AND id_region != a_id_region_purchase 
						LIMIT 1
					)), 
                    ', new currency: ', 
                    (SELECT code FROM Shop_Region WHERE id_region = a_id_region_purchase), 
                    '.'
				)
			)
			;
        END IF;
    END IF;
    
    -- String product id, permutation id, quantity list
    IF NOT EXISTS (SELECT * FROM tmp_Shop_Basket WHERE active LIMIT 1) AND NOT EXISTS (SELECT msg FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN -- NOT v_has_filter_user AND
		# Get product ids
		CALL p_split(a_ids_permutation_basket, ',');
		INSERT INTO tmp_Shop_Product (
			id_product, id_permutation, display_order
		)
		SELECT PP.id_product, ST.substring, ST.display_order
		FROM Split_Temp ST
		INNER JOIN Shop_Product_Permutation PP
			ON ST.substring = PP.id_permutation
			-- AND PP.active
		;
        /*
		SELECT substring as id_product, display_order
		FROM Split_Temp
		;
        */
		DROP TABLE Split_Temp;
		
		# Get product quantities
		CALL p_split(a_quantities_permutation_basket, ',');
		INSERT INTO tmp_Shop_Quantity (
			quantity, display_order
		)
		SELECT substring, display_order
		FROM Split_Temp
		;
        /*
		SELECT substring AS quantity_product, display_order
		FROM Split_Temp
		;
        */
		DROP TABLE Split_Temp;
        
        # Compare number of product ids to number of quantities
        SET v_n_id_permutation_basket := (SELECT display_order FROM tmp_Shop_Product ORDER BY display_order DESC LIMIT 1);
        SET v_n_quantity_permutation_basket := (SELECT display_order FROM tmp_Shop_Quantity ORDER BY display_order DESC LIMIT 1);
        IF NOT v_n_id_permutation_basket = v_n_quantity_permutation_basket THEN
			INSERT INTO tmp_Msg_Error ( 
				id_type,
                guid,
                msg
			)
            VALUES (
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
                v_guid,
                CONCAT('Number of permutations (', v_n_id_permutation_basket, ') does not equal number of quantities (', v_n_quantity_permutation_basket, ') for basket.')
			)
            ;
		ELSE
			INSERT INTO tmp_Shop_Basket (
				id_category,
				id_product,
                id_permutation,
				id_region_purchase,
				id_currency,
				quantity
			)
			SELECT 
				C.id_category,
                P.id_product,
				t_P.id_permutation,
				a_id_region_purchase,
				a_id_currency,
				t_Q.quantity
			FROM tmp_Shop_Product t_P
			INNER JOIN tmp_Shop_Quantity t_Q
				ON t_P.display_order = t_Q.display_order
			INNER JOIN Shop_Product_Permutation PP
				ON t_P.id_permutation = PP.id_permutation
                AND PP.active
			INNER JOIN Shop_Product P
				ON PP.id_product = P.id_product
                AND P.active
			INNER JOIN Shop_Category C
				ON P.id_category = C.id_category
				AND C.active
			-- RIGHT JOIN tmp_Shop_Basket t_UB ON ISNULL(t_UB.id_product)
			-- WHERE t_P.id_product NOT IN (SELECT id_product FROM tmp_Shop_Basket)
			;
            
            /*
            IF EXISTS(
				SELECT * 
                FROM Shop_Product P 
                INNER JOIN Shop_Category C 
					ON P.id_category = C.id_category 
				INNER JOIN tmp_Shop_Basket t_B
					ON P.id_product = t_B.id_product 
				WHERE C.active = 0 OR P.active = 0 LIMIT 1
			) THEN
				INSERT INTO tmp_Msg_Error ( 
					id_type,
					guid,
					msg
				)
				VALUES (
					(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
					v_guid,
					CONCAT('No valid product IDs in list: ', a_ids_permutation_basket, '.')
				)
				;
            END IF;
            */
        END IF;
    END IF;
    
    /*
    select v_has_filter_edit;
    select * from tmp_Shop_Basket;
    select * from tmp_Msg_Error;
    */
    
    
    # Edit basket product
    IF v_has_filter_permutation_edit AND NOT EXISTS (SELECT msg FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		IF EXISTS (
			SELECT *
            FROM Shop_Product_Permutation PP
			INNER JOIN Shop_Product P 
				ON PP.id_product = P.id_product
            INNER JOIN Shop_Category C 
				ON P.id_category = C.id_category 
            WHERE 
				(
					C.active = 0 
					OR P.active = 0 
                    OR PP.active = 0
				)
				AND PP.id_permutation = a_id_permutation_edit
			LIMIT 1
		) THEN
			INSERT INTO tmp_Msg_Error ( 
				id_type,
                guid,
				msg
			)
			VALUES (
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
                v_guid,
				CONCAT('Invalid product ID to edit: ', a_id_product_edit, '.')
			)
			;
        END IF;
	END IF;
    IF v_has_filter_permutation_edit AND NOT EXISTS (SELECT msg FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
        IF EXISTS (
			SELECT * 
            FROM tmp_Shop_Basket 
            WHERE 
				id_permutation = a_id_permutation_edit
		) THEN
			UPDATE tmp_Shop_Basket
            SET quantity = CASE WHEN a_sum_not_edit = 1 THEN IFNULL(quantity, 0) + a_quantity_permutation_edit ELSE a_quantity_permutation_edit END,
				active = CASE WHEN CASE WHEN a_sum_not_edit = 1 THEN IFNULL(quantity, 0) + a_quantity_permutation_edit ELSE a_quantity_permutation_edit END = 0 THEN 0 ELSE 1 END
            WHERE id_permutation = a_id_permutation_edit
            ;
            
            IF EXISTS (
				SELECT *
                FROM tmp_Shop_Basket t_B
                WHERE t_B.quantity < 0
			) THEN
				INSERT INTO tmp_Msg_Error ( 
					id_type,
					guid,
					msg
				)
				VALUES (
					(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
					v_guid,
					'Invalid basket quantity.'
				)
				;
            END IF;
            
            IF v_has_filter_user AND NOT EXISTS (SELECT msg FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
				SET v_change_set_used = 1;
				
				UPDATE Shop_User_Basket UB
                INNER JOIN tmp_Shop_Basket t_UB
					ON UB.id_permutation = a_id_permutation_edit
				SET UB.quantity = t_UB.quantity,
					UB.active = t_UB.active,
					UB.id_change_set_user = v_id_change_set
				WHERE UB.id_permutation = a_id_permutation_edit
					AND id_user = a_id_user
				;
            END IF;
        ELSE
            IF a_quantity_permutation_edit < 0 THEN
				INSERT INTO tmp_Msg_Error ( 
					id_type,
					guid,
					msg
				)
				VALUES (
					(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
					v_guid,
					'Invalid basket quantity.'
				)
				;
			ELSE
				INSERT INTO tmp_Shop_Basket (
					id_category,
					id_product,
                    id_permutation,
                    id_region_purchase,
                    id_currency,
					quantity,
                    active
				)
				SELECT 
					P.id_category,
					P.id_product,
                    PP.id_permutation,
                    a_id_region_purchase,
                    a_id_currency,
					a_quantity_permutation_edit,
					CASE WHEN a_quantity_permutation_edit > 0 THEN 1 ELSE 0 END
				FROM Shop_Product_Permutation PP
                INNER JOIN Shop_Product P
					ON PP.id_product = P.id_product
				WHERE id_permutation = a_id_permutation_edit
				;
				IF v_has_filter_user THEN
					IF EXISTS (
						SELECT * 
                        FROM Shop_User_Basket UB
                        WHERE 
							UB.id_permutation = a_id_permutation_edit
					) THEN
						SET v_change_set_used = 1;
						
						UPDATE Shop_User_Basket
						INNER JOIN tmp_Shop_Basket t_UB ON UB.id_permutation = t_UB.id_permutation
						SET UB.quantity = t_UB.quantity,
							UB.active = t_UB.active,
							UB.id_change_set_user = v_id_change_set
						WHERE UB.id_permutation = a_id_permutation_edit
							AND id_user = a_id_user
						;
					ELSE
						INSERT INTO Shop_User_Basket (
							id_user,
							id_product,
                            id_permutation,
                            id_region_purchase,
                            id_currency,
							quantity,
                            active
						)
						SELECT a_id_user,
							t_UB.id_product,
							t_UB.id_permutation,
							t_UB.id_region_purchase,
							t_UB.id_currency,
							t_UB.quantity,
                            t_UB.active
						FROM tmp_Shop_Basket t_UB
						WHERE id_permutation = a_id_permutation_edit
						;
					END IF;
				END IF;
            END IF;
        END IF;
    END IF;
    
    
    -- Checks
    /*
    SELECT * FROM tmp_Shop_Basket;
    SELECT 
		GROUP_CONCAT(t_UB.id_product SEPARATOR ',') AS basket_product_ids
	FROM tmp_Shop_Basket t_UB
	-- WHERE ISNULL(t_UB.id_permutation)
    ;
    SELECT 
		GROUP_CONCAT(t_UB.id_permutation SEPARATOR ',') AS basket_permutation_ids
	FROM tmp_Shop_Basket t_UB
	WHERE NOT ISNULL(t_UB.id_permutation)
    ;
    */
    -- Returns
	CALL p_shop_get_many_product (
		a_id_user, # a_id_user
		1, # a_get_all_categories
		'', # a_ids_category
		0, # a_get_inactive_categories
		0, # a_get_all_products
		(
			SELECT 
				GROUP_CONCAT(t_B.id_product SEPARATOR ',') 
			FROM tmp_Shop_Basket t_B
            WHERE active = 1
		), # a_ids_product
		0, # a_get_inactive_products
		0, # a_get_first_product_only
		0, # a_get_all_product_permutations
		(
			SELECT 
				GROUP_CONCAT(t_B.id_permutation SEPARATOR ',') 
			FROM tmp_Shop_Basket t_B
            WHERE NOT ISNULL(t_B.id_permutation)
				AND active = 1
		), # a_ids_permutation
		0, # a_get_inactive_permutations
		0, # a_get_all_images
		'', # a_ids_image
		0, # a_get_inactive_images
		1, # a_get_first_image_only
		0, # a_get_all_delivery_region
		a_id_region_purchase, # a_ids_delivery_region
		0, # a_get_inactive_delivery_region
		0, # a_get_all_currency
		a_id_currency, # a_ids_currency
		0, # a_get_inactive_currency
		1, # a_get_all_discount
		'', # a_ids_discount
		0 # a_get_inactive_discount
	);
    
    # Basket
	SELECT t_UB.id_category,
		t_UB.id_product,
		t_UB.id_permutation,
		P.name,
		PCL.price_local_VAT_incl,
        PCL.price_local_VAT_excl,
        PCL.id_currency,
		t_UB.quantity
	FROM tmp_Shop_Basket t_UB
	INNER JOIN Shop_Product_Permutation PP
		ON t_UB.id_permutation = PP.id_permutation
	INNER JOIN Shop_Product P
		ON PP.id_product = P.id_product
	INNER JOIN Shop_Category C
		ON P.id_category = C.id_category
	INNER JOIN Shop_Product_Currency_Link PCL
		ON PP.id_permutation = PCL.id_permutation
        AND PCL.id_region_purchase = a_id_region_purchase
        AND PCL.id_currency = a_id_currency
	WHERE t_UB.active = 1
	ORDER BY C.display_order, P.display_order
	;
    
    # Errors
    /* Completed by product get many */
    SELECT 
		t_ME.display_order,
		t_ME.guid,
        t_ME.id_type,
        t_ME.msg,
        MET.code, 
        MET.name,
        MET.description
    FROM tmp_Msg_Error t_ME
    INNER JOIN Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    WHERE GUID = v_guid
    ;
    
    /*
    # Return arguments for test
    SELECT
	a_ids_category,
	a_get_inactive_categories,
	a_ids_product,
	a_get_inactive_products,
    a_get_first_product_only,
    a_get_all_products,
	a_ids_image,
	a_get_inactive_images,
    a_get_first_image_only,
    a_get_all_images
    ;
    */
    
    -- Clean up
    IF NOT v_change_set_used THEN
		DELETE FROM Shop_User_Change_Set
        WHERE id_change_set = v_id_change_set
        ;
    END IF;
    
    # DROP TABLE IF EXISTS tmp_Msg_Error;
    DELETE FROM tmp_Msg_Error WHERE guid = v_guid;
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN 
		DROP TABLE tmp_Msg_Error;
	END IF;
    DROP TABLE IF EXISTS tmp_Shop_Basket;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Quantity;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_User;
END //
DELIMITER ;


/*

CALL p_shop_edit_user_basket (
	'', # a_id_user
	'', # a_ids_permutation_basket
	'', # a_quantities_permutation_basket
    2, # a_id_permutation_edit
	1, # a_quantity_permutation_edit
    1, # a_sum_not_edit
    2, # a_id_currency_edit
    1 # a_id_region_purchase
);

CALL p_shop_edit_user_basket (
	'', # a_id_user
	'1', # a_ids_permutation_basket
	'9', # a_quantities_permutation_basket
    1, # a_id_permutation_edit
	69, # a_quantity_permutation_edit
    1, # a_sum_not_edit
    1, # a_id_currency_edit
    1 # a_id_region_purchase
);
CALL p_shop_edit_user_basket (
	'auth0|6582b95c895d09a70ba10feF', # a_id_user
	'2', # a_ids_permutation_basket
	'7', # a_quantities_permutation_basket
    2, # a_id_permutation_edit
	NULL, # a_quantity_permutation_edit
    1, # a_sum_not_edit
    1, # a_id_currency_edit
    1 # a_id_region_purchase
);


 {'a_id_user': 'auth0|6582b95c895d09a70ba10fef', 
 'a_ids_permutation_basket': '1', 
 '7', # a_quantities_permutation_basket
 'a_id_permutation_edit': 1, 
 'a_quantity_permutation_edit': 1, 
 'a_sum_not_edit': 1}
 
 select * from shop_user_basket;
 insert into shop_user_change_set (comment)
 values( 'deactivate duplicates');
 update SHOP_USER_BASKET
 set active = 0,
	id_change_set_user = (select id_change_set from shop_user_change_set order by id_change_set desc limit 1)
 where id_user = 'auth0|6582b95c895d09a70ba10fef'
	and id_product = 1
    ;
 select * from shop_user_basket;
*/

USE PARTS;

/*

CALL p_shop_get_many_user_order (
	'',
    '',
	1,
    ''
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_user_order;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_user_order (
	IN a_id_user VARCHAR(200),
    IN a_ids_order VARCHAR(4000),
    IN a_n_order_max INT,
	IN a_id_checkout_session VARCHAR(200)
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_user BIT;
    DECLARE v_has_filter_order BIT;
    DECLARE v_has_filter_session BIT;
    DECLARE v_code_error_data VARCHAR(200);
    DECLARE v_code_error_permission VARCHAR(200);
    DECLARE v_guid VARCHAR(36);
    
    SET v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 1);
    SET v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
	SET v_guid = UUID();
    
	-- Argument validation + default values
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_ids_order IS NULL THEN
		SET a_ids_order = '';
	ELSE
		SET a_ids_order = TRIM(a_ids_order);
    END IF;
	IF a_n_order_max IS NULL THEN
		SET a_n_order_max = 1;
    END IF;
	IF a_id_checkout_session IS NULL THEN
		SET a_id_checkout_session = '';
	ELSE
		SET a_id_checkout_session = TRIM(a_id_checkout_session);
    END IF;
    
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_User;
    DROP TABLE IF EXISTS tmp_Shop_Order;
    
    CREATE TABLE tmp_Shop_User(
		id_user VARCHAR(200) NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BIT NOT NULL
    );
    
    CREATE TABLE tmp_Shop_Order (
		id_order INT NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_Order_id_order
			FOREIGN KEY (id_order)
			REFERENCES Shop_User_Order(id_order),
        active BIT NOT NULL
    );
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid VARCHAR(36) NOT NULL,
		# id_type INT NOT NULL,
		# CONSTRAINT FK_tmp_Msg_Error_id_type FOREIGN KEY (id_type)
		# 	REFERENCES Shop_Msg_Error_Type (id_type),
		code VARCHAR(50),
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Parse filters
    SET v_has_filter_user = CASE WHEN a_id_user = '' THEN 0 ELSE 1 END;
	SET a_ids_order = REPLACE(a_ids_order, '|', ',');
    SET v_has_filter_order = CASE WHEN a_ids_order = '' THEN 0 ELSE 1 END;
    SET v_has_filter_session = CASE WHEN a_id_checkout_session = '' THEN 0 ELSE 1 END;
    
    -- User
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF v_has_filter_user THEN
			INSERT INTO tmp_Shop_User (
				id_user,
				active
			)
			SELECT id_user,
				active
			FROM Shop_User
			WHERE id_user LIKE CONCAT('%', a_id_user, '%')
				AND active
			LIMIT 1
			;
			
			SET v_has_filter_user = EXISTS (SELECT id_user FROM tmp_Shop_User LIMIT 1);
			SET a_id_user := (SELECT id_user FROM tmp_Shop_User LIMIT 1);
		END IF;
    END IF;
	IF NOT v_has_filter_user THEN
		INSERT INTO tmp_Msg_Error (
			guid,
			code,
			msg
		)
		VALUES (
			v_guid,
			v_code_error_data, 
			'User ID not valid.'
		)
		;
	END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		CALL p_shop_user_eval (
			v_guid, # a_guid
			a_id_user, 	# a_id_user
			0,		# a_get_inactive_users
			CONVERT((SELECT id_permission FROM Shop_Permission WHERE 'STORE_USER' = code), CHAR),		# a_ids_permission
			(SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' AND active),		# a_ids_access_level
			'',		# a_ids_product
            ''		# a_ids_permutation
		);
        
        IF NOT (SELECT can_edit FROM Shop_User_Eval_Temp WHERE guid = v_guid) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_code_error_permission, 
				'User ID does not have permission to access orders.'
			)
			;
        END IF;
        
        DELETE FROM Shop_User_Eval_Temp
        WHERE guid = v_guid
        ;
    END IF;
    
    -- Invalid Orders
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		# Invalid Order IDs
		IF EXISTS (SELECT * FROM Shop_User_Order WHERE NOT (id_user = a_id_user) AND v_has_filter_order AND FIND_IN_SET(id_order, a_ids_order) > 0) THEN  # id_order LIKE CONCAT('%', a_ids_order, '%') LIMIT 1) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
                msg
            )
            VALUES (
				v_guid,
				v_code_error_data, 
				CONCAT('You do not have access to the following order IDs: ', (SELECT GROUP_CONCAT(id_order SEPARATOR ', ') FROM Shop_User_Order WHERE NOT (id_user = a_id_user) AND FIND_IN_SET(id_order, a_ids_order) > 0)) # id_order LIKE CONCAT('%', a_ids_order, '%'))) # AND v_has_filter_order  # filtered by parent condition
			)
            ;
        END IF;
        # Invalid Checkout Session IDs
		IF EXISTS (SELECT * FROM Shop_User_Order WHERE NOT (id_user = a_id_user) AND v_has_filter_session AND id_checkout_session = a_id_checkout_session) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
                msg
            )
            VALUES (
				v_guid,
				v_code_error_data, 
				CONCAT('You do not have access to the following checkout session IDs: ', (SELECT GROUP_CONCAT(id_order SEPARATOR ', ') FROM Shop_User_Order WHERE NOT (id_user = a_id_user) AND id_checkout_session = a_id_checkout_session)) # AND v_has_filter_order  # filtered by parent condition
			)
            ;
        END IF;
    END IF;
    
    -- Valid Orders
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
    
		INSERT INTO tmp_Shop_Order (
			id_order, 
			active
		)
		SELECT UO.id_order,
			UO.active
		FROM Shop_User_Order UO
		INNER JOIN tmp_Shop_User t_U
			ON UO.id_user = t_U.id_user
				AND t_U.active
		WHERE ((NOT v_has_filter_order OR FIND_IN_SET(UO.id_order, a_ids_order) > 0) # UO.id_order LIKE CONCAT('%', a_ids_order, '%'))
			OR (NOT v_has_filter_session OR UO.id_checkout_session = a_id_checkout_session))
			AND UO.active
		;
    END IF;
    
    
    
    -- Returns
    /*
    SELECT *
    FROM tmp_Shop_User
    ;
    */
    
    SELECT t_O.id_order,
		UOPL.id_product,
		UOPL.id_permutation,
        UOPL.quantity
	FROM tmp_Shop_Order t_O
	INNER JOIN Shop_User_Order UO
		ON t_O.id_order = UO.id_order
	INNER JOIN Shop_User_Order_Product_Link UOPL
		ON UO.id_order = UOPL.id_order
	WHERE t_O.active
    ;
    
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
    WHERE guid = v_guid
    ;
    
    
    /*
    # Return arguments for test
    SELECT
		a_id_user,
		a_ids_order,
		a_n_order_max,
		a_id_checkout_session
    ;
    */
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_User;
    DROP TABLE IF EXISTS tmp_Shop_Order;
END //
DELIMITER ;


/*

CALL p_shop_get_many_user_order (
	'auth0|6582b95c895d09a70ba10fef',
    '1',
	0,
    ''
);

CALL p_shop_get_many_user_order (
	'',
    '1',
	0,
    ''
);

insert into shop_product_change_set (comment)
    values ('set product not subscription - test bool output to python');
    update shop_product
    set is_subscription = 0,
		id_change_set = (select id_change_set from shop_product_change_set order by id_change_set desc limit 1)
    where id_product = 1
select * from shop_User;
select * from shop_User_oRDER;
*/

USE PARTS;

/*

CALL p_shop_get_many_stripe_product_new (
	''
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_stripe_product_new;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_stripe_product_new (
	IN a_id_user VARCHAR(200)
)
BEGIN
    DECLARE v_has_filter_user BIT;
    DECLARE v_code_error_data VARCHAR(200);
    DECLARE v_code_error_permission VARCHAR(200);
    DECLARE v_guid VARCHAR(36);
    
    SET v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 1);
    SET v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
	SET v_guid = UUID();
    
    
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
    
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_User;
    
    CREATE TABLE tmp_Shop_User(
		id_user VARCHAR(200) NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BIT NOT NULL
    );
    
    CREATE TABLE tmp_Shop_Product (
		id_product INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		id_permutation INT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
        active BIT NOT NULL,
        display_order_product INT NOT NULL,
        display_order_permutation INT NOT NULL,
        name VARCHAR(200) NOT NULL,
        description VARCHAR(4000) NOT NULL
    );
    
    CREATE TABLE IF NOT EXISTS tmp_Msg_Error ( # IF NOT EXISTS 
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid VARCHAR(36) NOT NULL,
		code VARCHAR(50) NOT NULL,
        # CONSTRAINT chk_tmp_Msg_Error_code CHECK (code IN (SELECT code FROM Shop_Msg_Error_Type)),
		/*
        id_type INT NOT NULL,
        CONSTRAINT FK_tmp_Msg_Error_id_type
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type(id_type),
		*/
		msg VARCHAR(4000) NOT NULL
    );
    
    
    
    -- Parse filters
    SET v_has_filter_user = CASE WHEN a_id_user = '' THEN 0 ELSE 1 END;
    
    
    
    -- User
    IF v_has_filter_user THEN
        INSERT INTO tmp_Shop_User (
			id_user,
			active
		)
        SELECT id_user,
			active
		FROM Shop_User
        WHERE id_user LIKE CONCAT('%', a_id_user, '%')
			AND active
		LIMIT 1
        ;
        
        SET v_has_filter_user = EXISTS (SELECT id_user FROM tmp_Shop_User LIMIT 1);
        SET a_id_user := (SELECT id_user FROM tmp_Shop_User LIMIT 1);
    END IF;
    
    IF NOT v_has_filter_user THEN
		INSERT INTO tmp_Msg_Error (
			guid,
            code,
            msg
		)
        VALUES (
			v_guid,
			v_code_error_data, 
            'User ID not valid.'
		)
        ;
    END IF;
    
    -- Get products
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		INSERT INTO tmp_Shop_Product (
			id_product,
            id_permutation,
            active,
            display_order_product,
            display_order_permutation,
            name,
            description
		)
        SELECT id_product,
			id_permutation,
			active,
            display_order_product,
            display_order_permutation,
            name,
            description
		FROM (
			SELECT id_product,
				NULL AS id_permutation,
				active,
                display_order AS display_order_product,
                NULL AS display_order_permutation,
                name,
                description,
                id_stripe_product
			FROM Shop_Product P
			UNION
			SELECT t_PPPV.id_product,
				id_permutation,
				t_PPPV.active,
                display_order_product,
                display_order_permutation,
                CONCAT(P.name, ': ', names_variation) AS name,
                CONCAT(P.description, ' With variations: ', type_name_pairs_variation) AS description,
                t_PPPV.id_stripe_product
			FROM (
				SELECT P.id_product,
					PP.id_permutation,
					PP.active,
					P.display_order AS display_order_product,
					PP.display_order AS display_order_permutation,
					GROUP_CONCAT(V.name SEPARATOR ' ') AS names_variation,
					GROUP_CONCAT(CONCAT(VT.name, ': ', V.name) SEPARATOR ', ') AS type_name_pairs_variation,
					PP.id_stripe_product
                FROM Shop_Product_Permutation PP
				INNER JOIN Shop_Product P
					ON PP.id_product = P.id_product
						AND P.active
				INNER JOIN Shop_Product_Permutation_Variation_Link PPVL
					ON PP.id_permutation = PPVL.id_permutation
						AND PPVL.active
				INNER JOIN Shop_Variation V
					ON PPVL.id_variation = V.id_variation
						AND V.active
				INNER JOIN Shop_Variation_Type VT
					ON V.id_type = VT.id_type
						AND VT.active
				GROUP BY id_product, id_permutation -- , VT.id_type, V.id_variation
			) t_PPPV
			INNER JOIN Shop_Product P
				ON t_PPPV.id_product = P.id_product
		) t_PPP
		WHERE ISNULL(id_stripe_product)
			AND active
		;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		CALL p_shop_user_eval (
			v_guid, # a_guid
			a_id_user, 	# a_id_user
			0,		# a_get_inactive_users
			CONVERT((SELECT id_permission FROM Shop_Permission WHERE 'STORE_ADMIN' = code), CHAR),		# a_ids_permission
			(SELECT id_access_level FROM Shop_Access_Level WHERE code = 'ADMIN' AND active),		# a_ids_access_level
			(SELECT GROUP_CONCAT(id_product SEPARATOR ',') From tmp_Shop_Product),		# a_ids_product
			(SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') From tmp_Shop_Product)		# a_ids_permutation --  WHERE NOT ISNULL(id_permutation)
		);
        
        IF EXISTS (SELECT can_admin FROM Shop_User_Eval_Temp WHERE guid = v_guid AND NOT can_admin) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_code_error_permission, 
				'User ID does not have permission to get all new stripe products.'
			)
			;
        END IF;
        
        DELETE FROM Shop_User_Eval_Temp
        WHERE guid = v_guid
        ;
    END IF;
    
    
    
    
    -- Returns
    /*
    SELECT *
    FROM tmp_Shop_User
    ;
    */
    
    IF EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		DELETE FROM tmp_Shop_Product;
	END IF;
    
	SELECT id_product,
		id_permutation,
		name,
		description
	FROM tmp_Shop_Product
	ORDER BY display_order_product, display_order_permutation
	;
	SELECT PP.id_permutation,
		V.id_variation,
		V.name AS name_variation,
		VT.id_type AS id_type_variation,
		VT.name as name_variation_type
	FROM tmp_Shop_Product t_P
	INNER JOIN Shop_Product_Permutation PP
		ON t_P.id_permutation = PP.id_permutation
	INNER JOIN Shop_Product_Permutation_Variation_Link PPVL
		ON PP.id_permutation = PPVL.id_permutation
			AND PPVL.active
	INNER JOIN Shop_Variation V
		ON PPVL.id_variation = V.id_variation
			AND V.active
	INNER JOIN Shop_Variation_Type VT
		ON V.id_type = VT.id_type
			AND VT.active
	;
    
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
    WHERE guid = v_guid
    ;
    
    
    /*
    # Return arguments for test
    SELECT
		a_id_user
    ;
    */
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_User;
END //
DELIMITER ;


/*
CALL p_shop_get_many_stripe_product_new (
	''
);

CALL p_shop_get_many_stripe_product_new (
	'auth0|6582b95c895d09a70ba10fef'
);



select * from shop_product;
select * from shop_product_permutation_variation_link;

CALL p_shop_user_eval (
			'ead789a1-c7ac-11ee-a256-b42e9986184a', # a_guid
			'auth0|6582b95c895d09a70ba10fef', 	# a_id_user
			0,		# a_get_inactive_users
			'4',		# a_ids_permission
			'3',		# a_ids_access_level
			'1',		# a_ids_product
			'1'		# a_ids_permutation --  WHERE NOT ISNULL(id_permutation)
		);
        
*/

USE PARTS;

/*

CALL p_shop_get_many_stripe_price_new (
	''
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_stripe_price_new;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_stripe_price_new (
	IN a_id_user VARCHAR(200)
)
BEGIN
    DECLARE v_has_filter_user BIT;
    DECLARE v_code_error_data VARCHAR(200);
    DECLARE v_code_error_permission VARCHAR(200);
    DECLARE v_guid VARCHAR(36);
    
    SET v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 1);
    SET v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
	SET v_guid = UUID();
    

    
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
    
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Product_Currency_Link;
    DROP TABLE IF EXISTS tmp_Shop_User;
    
    CREATE TABLE tmp_Shop_User(
		id_user VARCHAR(200) NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BIT NOT NULL
    );
    
    CREATE TABLE tmp_Shop_Product_Currency_Link (
		id_link INT NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_Product_Currency_Link_id_link
			FOREIGN KEY (id_link)
			REFERENCES Shop_Product_Currency_Link(id_link),
        id_product INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_Currency_Link_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
        id_permutation INT NULL,
        CONSTRAINT FK_tmp_Shop_Product_Currency_Link_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
		id_currency INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_Currency_Link_id_currency
			FOREIGN KEY (id_currency)
			REFERENCES Shop_Currency(id_currency),
		active BIT NOT NULL
    );
    
    CREATE TABLE IF NOT EXISTS tmp_Msg_Error ( # IF NOT EXISTS 
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid VARCHAR(36) NOT NULL,
		code VARCHAR(50) NOT NULL,
        # CONSTRAINT chk_tmp_Msg_Error_code CHECK (code IN (SELECT code FROM Shop_Msg_Error_Type)),
		/*
        id_type INT NOT NULL,
        CONSTRAINT FK_tmp_Msg_Error_id_type
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type(id_type),
		*/
		msg VARCHAR(4000) NOT NULL
    );
    
    
    
    -- Parse filters
    SET v_has_filter_user = CASE WHEN a_id_user = '' THEN 0 ELSE 1 END;
    
    
    
    -- User permissions
    IF v_has_filter_user THEN
        INSERT INTO tmp_Shop_User (
			id_user,
			active
		)
        SELECT id_user,
			active
		FROM Shop_User
        WHERE id_user LIKE CONCAT('%', a_id_user, '%')
			AND active
		LIMIT 1
        ;
        
        SET v_has_filter_user = EXISTS (SELECT id_user FROM tmp_Shop_User LIMIT 1);
        SET a_id_user := (SELECT id_user FROM tmp_Shop_User LIMIT 1);
    END IF;
    IF NOT v_has_filter_user THEN
		INSERT INTO tmp_Msg_Error (
			guid,
			code,
            msg
		)
        VALUES (
			v_guid,
			v_code_error_data, 
            'Valid user ID not provided.'
		)
        ;
    END IF;
    
    -- Get products
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		INSERT INTO tmp_Shop_Product_Currency_Link (
			id_link,
            id_product,
            id_permutation,
            id_currency,
            active
		)
        SELECT id_link,
            id_product,
            id_permutation,
            id_currency,
            active
		FROM Shop_Product_Currency_Link
		WHERE ISNULL(id_stripe_price)
			AND active
		;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		# SELECT * FROM tmp_Msg_Error LIMIT 1;
		CALL p_shop_user_eval (
			v_guid, # a_guid
			a_id_user, 	# a_id_user
			0,		# a_get_inactive_users
			CONVERT((SELECT id_permission FROM Shop_Permission WHERE 'STORE_ADMIN' = code), CHAR),		# a_ids_permission
			(SELECT id_access_level FROM Shop_Access_Level WHERE code = 'ADMIN' AND active),		# a_ids_access_level
			(SELECT GROUP_CONCAT(DISTINCT id_product SEPARATOR ',') FROM tmp_Shop_Product_Currency_Link), #  (SELECT DISTINCT id_product FROM tmp_Shop_Product_Currency_Link) calc_PCL)		# a_ids_product
            (SELECT GROUP_CONCAT(DISTINCT id_permutation SEPARATOR ',') FROM tmp_Shop_Product_Currency_Link) # a_ids_permutation
		);
		# SELECT * FROM tmp_Msg_Error LIMIT 1;
        
        IF EXISTS (SELECT can_admin FROM Shop_User_Eval_Temp WHERE guid = v_guid AND NOT can_admin LIMIT 1) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_code_error_permission, 
				'User ID does not have permission to get all new stripe prices.'
			)
			;
        END IF;
        
        DELETE FROM Shop_User_Eval_Temp
        WHERE guid = v_guid
        ;
    END IF;
    
    
    
    -- Returns
    IF EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		DELETE FROM tmp_Shop_Product_Currency_Link;
	END IF;
    /*
    SELECT *
    FROM tmp_Shop_User
    ;
    */
    
    
	SELECT t_PCL.id_product,
		t_PCL.id_permutation,
		P.price_GBP_full * C.factor_from_GBP AS unit_price,
		C.code AS code_currency,
		P.id_stripe_product,
		P.is_subscription,
		LOWER(RI.code) AS name_recurring_interval,
		P.count_recurrence_interval
	FROM tmp_Shop_Product_Currency_Link t_PCL
	INNER JOIN Shop_Product P
		ON t_PCL.id_product = P.id_product
		AND P.active
	INNER JOIN Shop_Recurrence_Interval RI
		ON P.id_recurrence_interval = RI.id_interval
		AND RI.active
	INNER JOIN Shop_Currency C
		ON t_PCL.id_currency = C.id_currency
		AND C.active
	WHERE t_PCL.active
	;
    
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
    WHERE guid = v_guid
    ;
    
    
    /*
    # Return arguments for test
    SELECT
		a_id_user
    ;
    */
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_User;
    DROP TABLE IF EXISTS tmp_Shop_Product_Currency_Link;
END //
DELIMITER ;


/*
CALL p_shop_get_many_stripe_price_new (
	''
);

CALL p_shop_get_many_stripe_price_new (
	'auth0|6582b95c895d09a70ba10fef'
);

*/

USE PARTS;

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
    cost_local_manufacturing,
    id_currency_cost_manufacturing,
    profit_local_min,
    id_currency_profit_min,
    latency_manufacture,
	quantity_min,
	quantity_max,
	quantity_step,
	quantity_stock,
	is_subscription,
	id_recurrence_interval,
	count_recurrence_interval,
	id_access_level_required,
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
        1,
        14,
		1,
		3,
		1,
		99,
		0,
		NULL,
		NULL,
		1,
		NULL
	),
	(
		2, 
		1, 
		'Good Blue',
        6,
        1,
        4,
        1,
		14,
		1,
		3,
		1,
		99,
		0,
		NULL,
		NULL,
		1,
		NULL
	),
	(
		3, 
		2, 
		'Test product describes good',
        10,
        1,
        5,
        1,
		14,
		1,
		2,
		1,
		99,
		0,
		NULL,
		NULL,
		1,
		NULL
	),
	(
		4, 
		3, 
		'Phone describes good',
        10,
        1,
        5,
        1,
		14,
		1,
		2,
		1,
		99,
		0,
		NULL,
		NULL,
		1,
		NULL
	),
	(
		5, 
		4, 
		'Laptop describes good',
        10,
        1,
        5,
        1,
		14,
		1,
		2,
		1,
		99,
		0,
		NULL,
		NULL,
		1,
		NULL
	),
	(
		6, 
		5, 
		'Smart watch describes good',
        10,
        1,
        5,
        1,
		14,
		1,
		2,
		1,
		99,
		0,
		NULL,
		NULL,
		1,
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
	(3, 'USER', 'Store User')
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
SELECT U.id_user, 1, U.name, '07375 571430', 'NN6 6EB', 'The Laurels', 'Cold Ashby Road', 'Cold Ashby', 'Northamptonshire'
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

/*
    -- Clean up
END //
DELIMITER ;


-- Call
CALL p_populate_database();

-- Remove proc
DROP PROCEDURE IF EXISTS p_populate_database;
*/
USE PARTS;

# Product Change Sets
SELECT * FROM Shop_Product_Change_Set;

# User Change Sets
SELECT * FROM Shop_User_Change_Set;

# Access Levels
SELECT * FROM Shop_Access_Level;
SELECT * FROM Shop_Access_Level_Audit;

# Error Message type
SELECT * FROM Shop_Msg_Error_Type;

# File Types
SELECT * FROM File_Type;
SELECT * FROM File_Type_Audit;

# Generic / shared properties
SELECT * FROM Shop_General;
SELECT * FROM Shop_General_Audit;

# Categories
SELECT * FROM Shop_Category;
SELECT * FROM Shop_Category_Audit;

# Recurrence Interval
SELECT * FROM Shop_Recurrence_Interval;
SELECT * FROM Shop_Recurrence_Interval_Audit;

# Region
SELECT * FROM Shop_Region;
SELECT * FROM Shop_Region_Audit;

# Region Branch
SELECT * FROM Shop_Region_Branch;
SELECT * FROM Shop_Region_Branch_Audit;

# Currency
SELECT * FROM Shop_Currency;
SELECT * FROM Shop_Currency_Audit;

# Taxes and Surcharges
SELECT * FROM Shop_Tax_Or_Surcharge;
SELECT * FROM Shop_Tax_Or_Surcharge_Audit;

# Products
SELECT * FROM Shop_Product;
SELECT * FROM Shop_Product_Audit;

# Variation Types
SELECT * FROM Shop_Variation_Type;
SELECT * FROM Shop_Variation_Type_Audit;

# Variations
SELECT * FROM Shop_Variation;
SELECT * FROM Shop_Variation_Audit;

# Permutations
SELECT * FROM Shop_Product_Permutation;
SELECT * FROM Shop_Product_Permutation_Audit;

# Permutation Variation Links
SELECT * FROM Shop_Product_Permutation_Variation_Link;
SELECT * FROM Shop_Product_Permutation_Variation_Link_Audit;

# Product Currency Links
SELECT * FROM Shop_Product_Currency_Region_Link;
SELECT * FROM Shop_Product_Currency_Region_Link_Audit;

# Image Types
SELECT * FROM Shop_Image_Type;
SELECT * FROM Shop_Image_Type_Audit;

# Images
SELECT * FROM Shop_Image;
SELECT * FROM Shop_Image_Audit;

# Delivery Option Types
SELECT * FROM Shop_Delivery_Option;
SELECT * FROM Shop_Delivery_Option_Audit;

# Delivery Options
SELECT * FROM Shop_Product_Delivery_Option_Link;
SELECT * FROM Shop_Product_Delivery_Option_Link_Audit;

# Discounts
SELECT * FROM Shop_Discount;
SELECT * FROM Shop_Discount_Audit;

# Discount Delivery Region Links
SELECT * FROM Shop_Discount_Region_Currency_Link;
SELECT * FROM Shop_Discount_Region_Currency_Link_Audit;


# Permission Groups
SELECT * FROM Shop_Permission_Group;
SELECT * FROM Shop_Permission_Group_Audit;

# Permissions
SELECT * FROM Shop_Permission;
SELECT * FROM Shop_Permission_Audit;

# Roles
SELECT * FROM Shop_Role;
SELECT * FROM Shop_Role_Audit;

# Role Permission link
SELECT * FROM Shop_Role_Permission_Link;
SELECT * FROM Shop_Role_Permission_Link_Audit;

# Users
SELECT * FROM Shop_User;
SELECT * FROM Shop_User_Audit;

# User Role link
SELECT * FROM Shop_User_Role_Link;
SELECT * FROM Shop_User_Role_Link_Audit;


# Addresses
SELECT * FROM Shop_Address;
SELECT * FROM Shop_Address_Audit;

# Basket
SELECT * FROM Shop_User_Basket;
SELECT * FROM Shop_User_Basket_Audit;

# Order Statuses
SELECT * FROM Shop_User_Order_Status;
SELECT * FROM Shop_User_Order_Status_Audit;

# Orders
SELECT * FROM Shop_User_Order;
SELECT * FROM Shop_User_Order_Audit;

# Order Products
SELECT * FROM Shop_User_Order_Product_Link;
SELECT * FROM Shop_User_Order_Product_Link_Audit;
