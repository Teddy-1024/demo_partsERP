
/* Clear Store DataBase */



-- Drop dependencies
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
DROP TABLE IF EXISTS tmp_Shop_Product_Category;
DROP TABLE IF EXISTS tmp_Shop_Product_Currency_Region_Link;
DROP TABLE IF EXISTS tmp_Shop_Product_Currency_Link;
DROP TABLE IF EXISTS tmp_User_Role_Link;
DROP TABLE IF EXISTS tmp_Shop_Basket;
DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order;
DROP TABLE IF EXISTS tmp_Shop_Supplier;
DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order;
DROP TABLE IF EXISTS tmp_Shop_Customer;



-- Delete old tables
DROP TABLE IF EXISTS Shop_Customer_Sales_Order_Product_Link_Temp;
DROP TABLE IF EXISTS Shop_Customer_Sales_Order_Product_Link_Audit;
DROP TABLE IF EXISTS Shop_Customer_Sales_Order_Product_Link;

DROP TABLE IF EXISTS Shop_Customer_Sales_Order_Audit;
DROP TABLE IF EXISTS Shop_Customer_Sales_Order;

DROP TABLE IF EXISTS Shop_Customer_Audit;
DROP TABLE IF EXISTS Shop_Customer;

DROP TABLE IF EXISTS Shop_Manufacturing_Purchase_Order_Product_Link_Temp;
DROP TABLE IF EXISTS Shop_Manufacturing_Purchase_Order_Product_Link_Audit;
DROP TABLE IF EXISTS Shop_Manufacturing_Purchase_Order_Product_Link;

DROP TABLE IF EXISTS Shop_Manufacturing_Purchase_Order_Audit;
DROP TABLE IF EXISTS Shop_Manufacturing_Purchase_Order;

DROP TABLE IF EXISTS Shop_Supplier_Purchase_Order_Product_Link_Temp;
DROP TABLE IF EXISTS Shop_Supplier_Purchase_Order_Product_Link_Audit;
DROP TABLE IF EXISTS Shop_Supplier_Purchase_Order_Product_Link;

DROP TABLE IF EXISTS Shop_Supplier_Purchase_Order_Audit;
DROP TABLE IF EXISTS Shop_Supplier_Purchase_Order;

DROP TABLE IF EXISTS Shop_Unit_Measurement_Conversion_Audit;
DROP TABLE IF EXISTS Shop_Unit_Measurement_Conversion;

DROP TABLE IF EXISTS Shop_Unit_Measurement_Audit;
DROP TABLE IF EXISTS Shop_Unit_Measurement;

DROP TABLE IF EXISTS Shop_Supplier_Audit;
DROP TABLE IF EXISTS Shop_Supplier;

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

DROP TABLE IF EXISTS Shop_Product_Category_Audit;
DROP TABLE IF EXISTS Shop_Product_Category;

DROP TABLE IF EXISTS Shop_General_Audit;
DROP TABLE IF EXISTS Shop_General;

DROP TABLE IF EXISTS File_Type_Audit;
DROP TABLE IF EXISTS File_Type;

DROP TABLE IF EXISTS Msg_Error_Type;

DROP TABLE IF EXISTS Shop_Access_Level_Audit;
DROP TABLE IF EXISTS Shop_Access_Level;

DROP TABLE IF EXISTS Shop_Sales_And_Purchasing_Change_Set;
DROP TABLE IF EXISTS Shop_User_Change_Set;

DROP TABLE IF EXISTS Shop_Msg_Error_Type;

DROP TABLE IF EXISTS Shop_Product_Change_Set;

DO $$
BEGIN
	RAISE NOTICE 'TABLE DELETION COMPLETE';
END $$;


DROP FUNCTION IF EXISTS fn_shop_user_eval;
DROP FUNCTION IF EXISTS p_shop_user_eval;
DROP PROCEDURE IF EXISTS fn_shop_user_eval;
DROP PROCEDURE IF EXISTS p_shop_user_eval;

DROP FUNCTION IF EXISTS fn_shop_save_product;
DROP FUNCTION IF EXISTS p_shop_save_product;
DROP PROCEDURE IF EXISTS fn_shop_save_product;
DROP PROCEDURE IF EXISTS p_shop_save_product;

DROP FUNCTION IF EXISTS fn_shop_save_supplier;
DROP FUNCTION IF EXISTS p_shop_save_supplier;
DROP PROCEDURE IF EXISTS fn_shop_save_supplier;
DROP PROCEDURE IF EXISTS p_shop_save_supplier;

DROP FUNCTION IF EXISTS fn_shop_save_supplier_purchase_order;
DROP FUNCTION IF EXISTS p_shop_save_supplier_purchase_order;
DROP PROCEDURE IF EXISTS fn_shop_save_supplier_purchase_order;
DROP PROCEDURE IF EXISTS p_shop_save_supplier_purchase_order;

DROP FUNCTION IF EXISTS fn_shop_save_manufacturing_purchase_order;
DROP FUNCTION IF EXISTS p_shop_save_manufacturing_purchase_order;
DROP PROCEDURE IF EXISTS fn_shop_save_manufacturing_purchase_order;
DROP PROCEDURE IF EXISTS p_shop_save_manufacturing_purchase_order;

DROP FUNCTION IF EXISTS fn_shop_save_customer;
DROP FUNCTION IF EXISTS p_shop_save_customer;
DROP PROCEDURE IF EXISTS fn_shop_save_customer;
DROP PROCEDURE IF EXISTS p_shop_save_customer;

DROP FUNCTION IF EXISTS fn_shop_save_customer_sales_order;
DROP FUNCTION IF EXISTS p_shop_save_customer_sales_order;
DROP PROCEDURE IF EXISTS fn_shop_save_customer_sales_order;
DROP PROCEDURE IF EXISTS p_shop_save_customer_sales_order;

DROP FUNCTION IF EXISTS fn_shop_save_user;
DROP FUNCTION IF EXISTS p_shop_save_user;
DROP PROCEDURE IF EXISTS fn_shop_save_user;
DROP PROCEDURE IF EXISTS p_shop_save_user;

DROP FUNCTION IF EXISTS fn_shop_save_user_basket;
DROP FUNCTION IF EXISTS p_shop_save_user_basket;
DROP PROCEDURE IF EXISTS fn_shop_save_user_basket;
DROP PROCEDURE IF EXISTS p_shop_save_user_basket;

DROP FUNCTION IF EXISTS fn_shop_get_many_product;
DROP FUNCTION IF EXISTS p_shop_get_many_product;
DROP PROCEDURE IF EXISTS fn_shop_get_many_product;
DROP PROCEDURE IF EXISTS p_shop_get_many_product;

DROP FUNCTION IF EXISTS fn_shop_get_many_role_permission;
DROP FUNCTION IF EXISTS p_shop_get_many_role_permission;
DROP PROCEDURE IF EXISTS fn_shop_get_many_role_permission;
DROP PROCEDURE IF EXISTS p_shop_get_many_role_permission;

DROP FUNCTION IF EXISTS fn_shop_get_many_currency;
DROP FUNCTION IF EXISTS p_shop_get_many_currency;
DROP PROCEDURE IF EXISTS fn_shop_get_many_currency;
DROP PROCEDURE IF EXISTS p_shop_get_many_currency;

DROP FUNCTION IF EXISTS fn_shop_get_many_region;
DROP FUNCTION IF EXISTS p_shop_get_many_region;
DROP PROCEDURE IF EXISTS fn_shop_get_many_region;
DROP PROCEDURE IF EXISTS p_shop_get_many_region;

DROP FUNCTION IF EXISTS fn_shop_get_many_user_order;
DROP FUNCTION IF EXISTS p_shop_get_many_user_order;
DROP PROCEDURE IF EXISTS fn_shop_get_many_user_order;
DROP PROCEDURE IF EXISTS p_shop_get_many_user_order;

DROP FUNCTION IF EXISTS fn_shop_get_many_stripe_product_new;
DROP FUNCTION IF EXISTS p_shop_get_many_stripe_product_new;
DROP PROCEDURE IF EXISTS fn_shop_get_many_stripe_product_new;
DROP PROCEDURE IF EXISTS p_shop_get_many_stripe_product_new;

DROP FUNCTION IF EXISTS fn_shop_get_many_stripe_price_new;
DROP FUNCTION IF EXISTS p_shop_get_many_stripe_price_new;
DROP PROCEDURE IF EXISTS fn_shop_get_many_stripe_price_new;
DROP PROCEDURE IF EXISTS p_shop_get_many_stripe_price_new;

DROP FUNCTION IF EXISTS fn_shop_get_many_supplier;
DROP FUNCTION IF EXISTS p_shop_get_many_supplier;
DROP PROCEDURE IF EXISTS fn_shop_get_many_supplier;
DROP PROCEDURE IF EXISTS p_shop_get_many_supplier;

DROP FUNCTION IF EXISTS fn_shop_get_many_supplier_purchase_order;
DROP FUNCTION IF EXISTS p_shop_get_many_supplier_purchase_order;
DROP PROCEDURE IF EXISTS fn_shop_get_many_supplier_purchase_order;
DROP PROCEDURE IF EXISTS p_shop_get_many_supplier_purchase_order;

DROP FUNCTION IF EXISTS fn_shop_get_many_manufacturing_purchase_order;
DROP FUNCTION IF EXISTS p_shop_get_many_manufacturing_purchase_order;
DROP PROCEDURE IF EXISTS fn_shop_get_many_manufacturing_purchase_order;
DROP PROCEDURE IF EXISTS p_shop_get_many_manufacturing_purchase_order;

DROP FUNCTION IF EXISTS fn_shop_get_many_customer;
DROP FUNCTION IF EXISTS p_shop_get_many_customer;
DROP PROCEDURE IF EXISTS fn_shop_get_many_customer;
DROP PROCEDURE IF EXISTS p_shop_get_many_customer;

DROP FUNCTION IF EXISTS fn_shop_get_many_customer_sales_order;
DROP FUNCTION IF EXISTS p_shop_get_many_customer_sales_order;
DROP PROCEDURE IF EXISTS fn_shop_get_many_customer_sales_order;
DROP PROCEDURE IF EXISTS p_shop_get_many_customer_sales_order;
-- Product Change Sets



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Change_Set';

CREATE TABLE Shop_Product_Change_Set (
	id_change_set INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	comment VARCHAR(4000),
	updated_last_on TIMESTAMP,
	updated_last_by VARCHAR(100)
);
-- User Change Sets



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Change_Set';

CREATE TABLE IF NOT EXISTS Shop_User_Change_Set (
	id_change_set INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    comment VARCHAR(4000),
    updated_last_on TIMESTAMP,
    updated_last_by VARCHAR(100)
);
-- Access Levels



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Access_Level';

CREATE TABLE IF NOT EXISTS Shop_Access_Level (
    id_access_level INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    code VARCHAR(50),
    name VARCHAR(255),
    priority INTEGER NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    display_order INTEGER NOT NULL,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Access_Level_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_User_Change_Set(id_change_set)
);
-- Sales And Purchasing Change Sets



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Sales_And_Purchasing_Change_Set';

CREATE TABLE Shop_Sales_And_Purchasing_Change_Set (
	id_change_set INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	comment VARCHAR(4000),
	updated_last_on TIMESTAMP,
	updated_last_by VARCHAR(100)
);
-- Access Level Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Access_Level_Audit';

CREATE TABLE IF NOT EXISTS Shop_Access_Level_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_access_level INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Access_Level_Audit_id_access_level
		FOREIGN KEY (id_access_level)
        REFERENCES Shop_Access_Level(id_access_level)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(255),
    value_new VARCHAR(255),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Access_Level_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_User_Change_Set(id_change_set)
);
-- Error Message Type



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Msg_Error_Type';

CREATE TABLE IF NOT EXISTS Shop_Msg_Error_Type (
	id_type INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	code VARCHAR(50) NOT NULL,
	name VARCHAR(200) NOT NULL,
	description VARCHAR(1000)
);

-- File Types



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'File_Type';
	
CREATE TABLE IF NOT EXISTS File_Type (
	id_type INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	code VARCHAR(50),
	name VARCHAR(100),
	extension VARCHAR(50),
	created_on TIMESTAMP,
	created_by INT,
	updated_last_on TIMESTAMP,
	updated_last_by VARCHAR(100)
);

-- File Type Audit



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'File_Type_Audit';

CREATE TABLE IF NOT EXISTS File_Type_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_type INTEGER NOT NULL,
	CONSTRAINT FK_File_Type_Audit_id_type
		FOREIGN KEY (id_type)
		REFERENCES File_Type(id_type)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(100),
	value_new VARCHAR(100),
	created_on TIMESTAMP,
	created_by INT,
	updated_last_on TIMESTAMP,
	updated_last_by VARCHAR(100)
);
-- Generic / shared properties



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_General';

CREATE TABLE IF NOT EXISTS Shop_General (
	id_general INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	quantity_max REAL,
	created_on TIMESTAMP,
	created_by INT,
	id_change_set INTEGER,
	CONSTRAINT CHK_Shop_General_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
-- Shop General Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_General_Audit';

CREATE TABLE IF NOT EXISTS Shop_General_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_general INTEGER NOT NULL,
	CONSTRAINT FK_Shop_General_Audit_id_general
		FOREIGN KEY (id_general)
		REFERENCES Shop_General(id_general)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(100),
	value_new VARCHAR(100),
	id_change_set INTEGER NOT NULL,
	CONSTRAINT FK_Shop_General_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
-- Categories



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Category';

CREATE TABLE IF NOT EXISTS Shop_Product_Category (
	id_category INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	code VARCHAR(50),
	name VARCHAR(255),
	description VARCHAR(4000),
	active BOOLEAN NOT NULL DEFAULT TRUE,
	display_order INTEGER NOT NULL,
	created_on TIMESTAMP,
	created_by INT,
	id_change_set INTEGER,
	CONSTRAINT FK_Shop_Product_Category_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

-- Category Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Category_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Category_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_category INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Product_Category_Audit_id_category
		FOREIGN KEY (id_category)
		REFERENCES Shop_Product_Category(id_category)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(4000),
	value_new VARCHAR(4000),
	id_change_set INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Product_Category_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

-- Recurrence Interval



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Recurrence_Interval';

CREATE TABLE IF NOT EXISTS Shop_Recurrence_Interval (
	id_interval INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	code VARCHAR(50),
	name VARCHAR(255),
	name_plural VARCHAR(256),
    active BOOLEAN NOT NULL DEFAULT TRUE,
	created_on TIMESTAMP,
	created_by INT,
	id_change_set INTEGER,
	CONSTRAINT FK_Shop_Recurrence_Interval_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

-- Recurrence Interval Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Recurrence_Interval_Audit';

CREATE TABLE IF NOT EXISTS Shop_Recurrence_Interval_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_interval INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Recurrence_Interval_Audit_id_interval
		FOREIGN KEY (id_interval)
		REFERENCES Shop_Recurrence_Interval(id_interval)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(256),
	value_new VARCHAR(256),
	id_change_set INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Recurrence_Interval_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

-- Regions



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Region';

CREATE TABLE IF NOT EXISTS Shop_Region (
	id_region INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	code VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    display_order INTEGER NOT NULL,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Region_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
-- Region Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Region_Audit';

CREATE TABLE IF NOT EXISTS Shop_Region_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_region INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Region_Audit_id_region
		FOREIGN KEY (id_region)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    name_field VARCHAR(64) NOT NULL,
    value_prev VARCHAR(200),
    value_new VARCHAR(200),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Region_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
-- Region Branchs



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Region_Branch';

CREATE TABLE IF NOT EXISTS Shop_Region_Branch (
	id_branch INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_region_parent INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Region_Branch_id_region_parent
		FOREIGN KEY (id_region_parent)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    id_region_child INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Region_Branch_id_region_child
		FOREIGN KEY (id_region_child)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    -- depth INTEGER NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    display_order INTEGER NOT NULL,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Region_Branch_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
-- Region Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Region_Branch_Audit';

CREATE TABLE IF NOT EXISTS Shop_Region_Branch_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_branch INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Region_Branch_Audit_id_branch
		FOREIGN KEY (id_branch)
        REFERENCES Shop_Region_Branch(id_branch)
        ON UPDATE RESTRICT,
    name_field VARCHAR(64) NOT NULL,
    value_prev VARCHAR(10),
    value_new VARCHAR(10),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Region_Branch_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
-- Currencies



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Currency';

CREATE TABLE IF NOT EXISTS Shop_Currency (
    id_currency INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(255) NOT NULL,
    symbol VARCHAR(1) NOT NULL,
    factor_from_GBP REAL NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    display_order INTEGER NOT NULL,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Currency_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
-- Currency Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Currency_Audit';

CREATE TABLE IF NOT EXISTS Shop_Currency_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_currency INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Currency_Audit_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(255),
    value_new VARCHAR(255),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Currency_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
-- Taxes and Surcharges



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Tax_Or_Surcharge';

CREATE TABLE Shop_Tax_Or_Surcharge (
	id_tax INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
	id_region_buyer INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Tax_Or_Surcharge_id_region_buyer
		FOREIGN KEY (id_region_buyer) 
		REFERENCES Shop_Region(id_region),
	id_region_seller INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Tax_Or_Surcharge_id_region_seller
		FOREIGN KEY (id_region_seller) 
		REFERENCES Shop_Region(id_region),
    id_currency INTEGER,
    CONSTRAINT FK_Shop_Tax_Or_Surcharge_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
        ON UPDATE RESTRICT,
    fixed_fee REAL NOT NULL DEFAULT 0,
	multiplier REAL NOT NULL DEFAULT 1 CHECK (multiplier > 0),
    apply_fixed_fee_before_multiplier BOOLEAN NOT NULL DEFAULT TRUE,
	quantity_min REAL NOT NULL DEFAULT 0,
    quantity_max REAL NOT NULL,
	active BOOLEAN NOT NULL DEFAULT TRUE,
    display_order INTEGER NOT NULL,
	created_on TIMESTAMP,
	created_by INT,
	id_change_set INTEGER,
	CONSTRAINT FK_Shop_Tax_Or_Surcharge_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

-- Tax Or Surcharge Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Tax_Or_Surcharge_Audit';

CREATE TABLE IF NOT EXISTS Shop_Tax_Or_Surcharge_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_tax INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Tax_Or_Surcharge_Audit_id_discount
		FOREIGN KEY (id_tax)
        REFERENCES Shop_Tax_Or_Surcharge(id_tax)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(200),
    value_new VARCHAR(200),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Tax_Or_Surcharge_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
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
		REFERENCES Shop_Product_Category(id_category)
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
	created_by INT,
	id_change_set INTEGER,
	CONSTRAINT FK_Shop_Product_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

-- Products



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_product INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Product_Audit_id_product
		FOREIGN KEY (id_product)
		REFERENCES Shop_Product(id_product)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(255),
	value_new VARCHAR(255),
	id_change_set INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Product_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
-- Variation Types



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Variation_Type';

CREATE TABLE IF NOT EXISTS Shop_Variation_Type (
	id_type INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	code VARCHAR(50),
	name VARCHAR(255),
	name_plural VARCHAR(256),
	active BOOLEAN NOT NULL DEFAULT TRUE,
	display_order INTEGER NOT NULL,
	created_on TIMESTAMP,
	created_by INT,
	id_change_set INTEGER,
	CONSTRAINT FK_Shop_Variation_Type_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
-- Variation Type Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Variation_Type_Audit';

CREATE TABLE IF NOT EXISTS Shop_Variation_Type_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_type INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Variation_Type_Audit_id_type
		FOREIGN KEY (id_type)
		REFERENCES Shop_Variation_Type(id_type)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(256),
	value_new VARCHAR(256),
	id_change_set INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Variation_Type_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

-- Variations



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Variation';

CREATE TABLE Shop_Variation (
	id_variation INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
	id_type INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Variation_id_type
		FOREIGN KEY (id_type) 
		REFERENCES Shop_Variation_Type(id_type)
		ON UPDATE RESTRICT,
	code VARCHAR(50),
	name VARCHAR(255),
	active BOOLEAN NOT NULL DEFAULT TRUE,
	display_order INTEGER NOT NULL,
	created_on TIMESTAMP,
	created_by INT,
	id_change_set INTEGER,
	CONSTRAINT FK_Shop_Variation_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

-- Variation Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Variation_Audit';

CREATE TABLE IF NOT EXISTS Shop_Variation_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_variation INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Variation_Audit_id_variation
		FOREIGN KEY (id_variation)
		REFERENCES Shop_Variation(id_variation)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(255),
	value_new VARCHAR(255),
	id_change_set INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Variation_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

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
	latency_manufacture INTEGER NOT NULL,
	quantity_min REAL NOT NULL,
	quantity_max REAL NOT NULL,
	quantity_step REAL NOT NULL,
	quantity_stock REAL NOT NULL,
	is_subscription BOOLEAN NOT NULL,
	id_recurrence_interval INTEGER,
	CONSTRAINT FK_Shop_Product_Permutation_id_recurrence_interval
		FOREIGN KEY (id_recurrence_interval)
		REFERENCES Shop_Recurrence_Interval(id_interval),
	count_recurrence_interval INTEGER,
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

-- Product Permutation Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_permutation INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Product_Permutation_Audit_id_permutation
		FOREIGN KEY (id_permutation)
		REFERENCES Shop_Product_Permutation(id_permutation)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(4000),
	value_new VARCHAR(4000),
	id_change_set INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Product_Permutation_Audit_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
		ON UPDATE RESTRICT
);

-- Product Permutation Variation Link



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation_Variation_Link';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation_Variation_Link (
	id_link INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_permutation INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Product_Permutation_Variation_Link_id_permutation
		FOREIGN KEY (id_permutation)
		REFERENCES Shop_Product_Permutation(id_permutation)
		ON UPDATE RESTRICT,
	id_variation INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Product_Permutation_Variation_Link_id_variation
		FOREIGN KEY (id_variation)
		REFERENCES Shop_Variation(id_variation)
		ON UPDATE RESTRICT,
	active BOOLEAN NOT NULL DEFAULT TRUE,
	display_order INTEGER NOT NULL,
	created_on TIMESTAMP,
	created_by INT,
	id_change_set INTEGER,
	CONSTRAINT FK_Shop_Product_Permutation_Variation_Link_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

-- Product Permutation Variation Link Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation_Variation_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation_Variation_Link_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_link INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_Permutation_Variation_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Product_Permutation_Variation_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(10),
    value_new VARCHAR(10),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_Permutation_Variation_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
-- Product Currency Region link



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Currency_Region_Link';

CREATE TABLE IF NOT EXISTS Shop_Product_Currency_Region_Link (
    id_link INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_product INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Region_Link_id_product
		FOREIGN KEY (id_product)
        REFERENCES Shop_Product(id_product)
        ON UPDATE RESTRICT,
    id_permutation INTEGER NULL,
    CONSTRAINT FK_Shop_Product_Currency_Region_Link_id_permutation
		FOREIGN KEY (id_permutation)
        REFERENCES Shop_Product_Permutation(id_permutation)
        ON UPDATE RESTRICT,
    id_currency INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Region_Link_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
        ON UPDATE RESTRICT,
    id_region_purchase INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Region_Link_id_region_purchase
		FOREIGN KEY (id_region_purchase)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    price_local_VAT_incl REAL NULL,
    price_local_VAT_excl REAL NULL,
	id_stripe_price VARCHAR(200),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Product_Currency_Region_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
-- Product Currency Region Link Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Currency_Region_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Currency_Region_Link_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_link INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Region_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Product_Currency_Region_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(10),
    value_new VARCHAR(10),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_Currency_Region_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

-- Image Types



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Image_Type';

CREATE TABLE IF NOT EXISTS Shop_Image_Type (
	id_type INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	code VARCHAR(50),
	name VARCHAR(255),
	name_plural VARCHAR(256),
	active BOOLEAN NOT NULL DEFAULT TRUE,
	display_order INTEGER NOT NULL,
	created_on TIMESTAMP,
	created_by INT,
	id_change_set INTEGER,
	CONSTRAINT FK_Shop_Image_Type_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

-- Image Type Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Image_Type_Audit';

CREATE TABLE IF NOT EXISTS Shop_Image_Type_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_type INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Image_Type_Audit_id_type
		FOREIGN KEY (id_type)
        REFERENCES Shop_Image_Type(id_type)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(256),
    value_new VARCHAR(256),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Image_Type_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
-- Images



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Image';

CREATE TABLE IF NOT EXISTS Shop_Image (
    id_image INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_type_image INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Image_id_type_image
		FOREIGN KEY (id_type_image) 
        REFERENCES Shop_Image_Type(id_type),
    id_type_file INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Image_id_type_file
		FOREIGN KEY (id_type_file) 
        REFERENCES File_Type(id_type),
    id_product INTEGER NULL,
    CONSTRAINT FK_Shop_Image_id_product
		FOREIGN KEY (id_product) 
        REFERENCES Shop_Product(id_product),
    id_permutation INTEGER NULL,
    CONSTRAINT FK_Shop_Image_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    url VARCHAR(255),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    display_order INTEGER NOT NULL,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Image_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
-- Image Type Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Image_Audit';

CREATE TABLE IF NOT EXISTS Shop_Image_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_image INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Image_Audit_id_image
		FOREIGN KEY (id_image)
        REFERENCES Shop_Image(id_image),
    name_field VARCHAR(50),
    value_prev VARCHAR(10),
    value_new VARCHAR(10),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Image_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
-- Delivery Options



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Delivery_Option';

CREATE TABLE IF NOT EXISTS Shop_Delivery_Option (
	id_option INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	code VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(4000),
    latency_delivery_min INTEGER NOT NULL,
    latency_delivery_max INTEGER NOT NULL,
    quantity_min INTEGER NOT NULL,
    quantity_max INTEGER NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    display_order INTEGER NOT NULL,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Delivery_Option_Type_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

-- Delivery Option Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Delivery_Option_Audit';

CREATE TABLE IF NOT EXISTS Shop_Delivery_Option_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_option INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Delivery_Option_Audit_id_option
		FOREIGN KEY (id_option)
        REFERENCES Shop_Delivery_Option(id_option)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(4000),
    value_new VARCHAR(4000),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Delivery_Option_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
-- Delivery Option



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Delivery_Option_Link';

CREATE TABLE IF NOT EXISTS Shop_Product_Delivery_Option_Link (
    id_link INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_product INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_Delivery_Option_Link_id_product
		FOREIGN KEY (id_product)
        REFERENCES Shop_Product(id_product)
        ON UPDATE RESTRICT,
    id_permutation INTEGER,
    CONSTRAINT FK_Shop_Product_Delivery_Option_Link_id_permutation
		FOREIGN KEY (id_permutation)
        REFERENCES Shop_Product_Permutation(id_permutation)
        ON UPDATE RESTRICT,
    id_delivery_option INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_Delivery_Option_Link_id_delivery_option
		FOREIGN KEY (id_delivery_option)
        REFERENCES Shop_Delivery_Option(id_option)
        ON UPDATE RESTRICT,
    id_region INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_Delivery_Option_Link_id_region
		FOREIGN KEY (id_region)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    id_currency INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_Delivery_Option_Link_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
        ON UPDATE RESTRICT,
	price_local REAL NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    display_order INTEGER NOT NULL,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Product_Delivery_Option_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
-- Delivery Option Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Delivery_Option_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Delivery_Option_Link_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_link INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_Delivery_Option_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Product_Delivery_Option_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(64) NOT NULL,
    value_prev VARCHAR(10),
    value_new VARCHAR(10),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Product_Delivery_Option_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
-- Discounts



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Discount';

CREATE TABLE Shop_Discount (
	id_discount INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
	id_product INTEGER NOT NULL,
	CONSTRAINT FK_Shop_Discount_id_product
		FOREIGN KEY (id_product) 
		REFERENCES Shop_Product(id_product),
    id_permutation INTEGER,
    CONSTRAINT FK_Shop_Discount_id_permutation
		FOREIGN KEY (id_permutation)
        REFERENCES Shop_Product_Permutation(id_permutation)
        ON UPDATE RESTRICT,
	/*
     id_delivery_region INTEGER,
    CONSTRAINT FK_Shop_Discount_id_delivery_region
		FOREIGN KEY (id_delivery_region)
        REFERENCES Shop_Delivery_Region(id_region)
        ON UPDATE RESTRICT,
    id_currency INTEGER,
    CONSTRAINT FK_Shop_Discount_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
        ON UPDATE RESTRICT,
	*/
	multiplier REAL NOT NULL DEFAULT 1 CHECK (multiplier > 0),
    subtractor REAL NOT NULL DEFAULT 0,
    apply_multiplier_first BOOLEAN NOT NULL DEFAULT TRUE,
	quantity_min REAL NOT NULL DEFAULT 0,
    quantity_max REAL NOT NULL,
    date_start TIMESTAMP NOT NULL,
    date_end TIMESTAMP NOT NULL,
	active BOOLEAN NOT NULL DEFAULT TRUE,
    display_order INTEGER NOT NULL,
	created_on TIMESTAMP,
	created_by INT,
	id_change_set INTEGER,
	CONSTRAINT FK_Shop_Discount_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

-- Discount Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Discount_Audit';

CREATE TABLE IF NOT EXISTS Shop_Discount_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_discount INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Discount_Audit_id_discount
		FOREIGN KEY (id_discount)
        REFERENCES Shop_Discount(id_discount)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(200),
    value_new VARCHAR(200),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Discount_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
-- Discount Region Currency Link



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Discount_Region_Currency_Link';

CREATE TABLE IF NOT EXISTS Shop_Discount_Region_Currency_Link (
    id_link INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_discount INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Discount_Region_Currency_Link_id_discount
		FOREIGN KEY (id_discount)
        REFERENCES Shop_Discount(id_discount)
        ON UPDATE RESTRICT,
    id_region INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Discount_Region_Currency_Link_id_region
		FOREIGN KEY (id_region)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    id_currency INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Discount_Region_Currency_Link_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
        ON UPDATE RESTRICT,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Discount_Region_Currency_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
-- Discount Region Currency Link Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Discount_Region_Currency_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Discount_Region_Currency_Link_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_link INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Discount_Region_Currency_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Discount_Region_Currency_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(10),
    value_new VARCHAR(10),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Discount_Region_Currency_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
-- Permission Groups



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Permission_Group';

CREATE TABLE IF NOT EXISTS Shop_Permission_Group (
    id_group INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    code VARCHAR(50),
    name VARCHAR(255),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    display_order INTEGER NOT NULL,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Permission_Group_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
-- Permission Group Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Permission_Group_Audit';

CREATE TABLE IF NOT EXISTS Shop_Permission_Group_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_group INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Permission_Group_Audit_id_group
		FOREIGN KEY (id_group)
        REFERENCES Shop_Permission_Group(id_group)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(255),
    value_new VARCHAR(255),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Permission_Group_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
-- Permissions



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Permission';

CREATE TABLE IF NOT EXISTS Shop_Permission (
    id_permission INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    code VARCHAR(50),
    name VARCHAR(255),
    id_permission_group INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Permission_id_permission_group
		FOREIGN KEY (id_permission_group)
        REFERENCES Shop_Permission_Group(id_group)
        ON UPDATE RESTRICT,
    id_access_level_required INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Permission_id_access_level_required
		FOREIGN KEY (id_access_level_required)
        REFERENCES Shop_Access_Level(id_access_level),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    display_order INTEGER NOT NULL,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
	CONSTRAINT FK_Shop_Permission_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_User_Change_Set(id_change_set)
);
-- Permission Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Permission_Audit';

CREATE TABLE IF NOT EXISTS Shop_Permission_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_permission INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Permission_Audit_id_permission
		FOREIGN KEY (id_permission)
        REFERENCES Shop_Permission(id_permission)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(255),
    value_new VARCHAR(255),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Permission_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
-- Roles



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Role';

CREATE TABLE IF NOT EXISTS Shop_Role (
    id_role INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    code VARCHAR(50),
    name VARCHAR(255),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    display_order INTEGER NOT NULL,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Role_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_User_Change_Set(id_change_set)
);
-- Role Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Role_Audit';

CREATE TABLE Shop_Role_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_role INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Role_Audit_id_role
		FOREIGN KEY (id_role)
        REFERENCES Shop_Role(id_role)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(255),
    value_new VARCHAR(255),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Role_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
-- Role Permission link



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Role_Permission_Link';

CREATE TABLE IF NOT EXISTS Shop_Role_Permission_Link (
    id_link INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_role INTEGER,
    CONSTRAINT FK_Shop_Role_Permission_Link_id_role
		FOREIGN KEY (id_role)
        REFERENCES Shop_Role(id_role)
        ON UPDATE RESTRICT,
    id_permission INTEGER,
    CONSTRAINT FK_Shop_Role_Permission_Link_id_permission
		FOREIGN KEY (id_permission)
        REFERENCES Shop_Permission(id_permission)
        ON UPDATE RESTRICT,
    id_access_level INTEGER,
    CONSTRAINT FK_Shop_Role_Permission_Link_id_access_level
		FOREIGN KEY (id_access_level)
        REFERENCES Shop_Access_Level(id_access_level),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Role_Permission_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);
-- Role Permission link Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Role_Permission_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Role_Permission_Link_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_link INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Role_Permission_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Role_Permission_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(10),
    value_new VARCHAR(10),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Role_Permission_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);
-- Users



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User';

CREATE TABLE IF NOT EXISTS Shop_User (
    id_user INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_user_oauth VARCHAR(200) NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(254) NOT NULL,
    is_email_verified BOOLEAN NOT NULL DEFAULT FALSE,
    is_super_user BOOLEAN NOT NULL DEFAULT FALSE,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_User_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);

-- User Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Audit';

CREATE TABLE IF NOT EXISTS Shop_User_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_user INTEGER,
    CONSTRAINT FK_Shop_User_Audit_id_user
		FOREIGN KEY (id_user)
        REFERENCES Shop_User(id_user)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(255),
    value_new VARCHAR(255),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_User_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
-- User Role link



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Role_Link';

CREATE TABLE IF NOT EXISTS Shop_User_Role_Link (
    id_link INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_user INTEGER,
    CONSTRAINT FK_Shop_User_Role_Link_id_user
		FOREIGN KEY (id_user)
        REFERENCES Shop_User(id_user)
        ON UPDATE RESTRICT,
    id_role INTEGER NOT NULL,
    CONSTRAINT FK_Shop_User_Role_Link_id_role
		FOREIGN KEY (id_role)
        REFERENCES Shop_Role(id_role),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_User_Role_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);
-- User Role Link Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Role_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_User_Role_Link_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_link INTEGER NOT NULL,
    CONSTRAINT FK_Shop_User_Role_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_User_Role_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(200),
    value_new VARCHAR(200),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_User_Role_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);

-- Addresses



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Address';

CREATE TABLE Shop_Address (
    id_address INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    /*
    a_id_user INTEGER,
    CONSTRAINT FK_Shop_Address_id_user
		FOREIGN KEY (id_user)
        REFERENCES Shop_User(id_user)
        ON UPDATE RESTRICT,
    */
    -- region VARCHAR(100) NOT NULL,
    id_region INTEGER NOT NULL,
    name_full VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    postcode VARCHAR(20) NOT NULL,
    address_line_1 VARCHAR(100) NOT NULL,
    address_line_2 VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    county VARCHAR(100) NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Address_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);
-- Address Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Address_Audit';

CREATE TABLE IF NOT EXISTS Shop_Address_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_address INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Address_Audit_id_address
		FOREIGN KEY (id_address)
        REFERENCES Shop_Address(id_address)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(255),
    value_new VARCHAR(255),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Address_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
-- User Basket (Product Link)



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Basket';

CREATE TABLE IF NOT EXISTS Shop_User_Basket (
	id_item INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_user INTEGER,
	CONSTRAINT FK_Shop_User_Basket_id_user
		FOREIGN KEY (id_user)
		REFERENCES Shop_User(id_user)
		ON UPDATE RESTRICT,
	id_product INTEGER NOT NULL,
	CONSTRAINT FK_Shop_User_Basket_id_product
		FOREIGN KEY (id_product)
		REFERENCES Shop_Product(id_product)
		ON UPDATE RESTRICT,
	id_permutation INTEGER,
	CONSTRAINT FK_Shop_User_Basket_id_permutation
		FOREIGN KEY (id_permutation)
		REFERENCES Shop_Product_Permutation(id_permutation)
		ON UPDATE RESTRICT,
	quantity INTEGER NOT NULL,
	active BOOLEAN NOT NULL DEFAULT TRUE,
	created_on TIMESTAMP,
	created_by INT,
	id_change_set_user INTEGER,
	CONSTRAINT FK_Shop_User_Basket_id_change_set_user
		FOREIGN KEY (id_change_set_user)
		REFERENCES Shop_User_Change_Set(id_change_set)
        /*
	id_change_set_product INTEGER,
	CONSTRAINT FK_Shop_User_Basket_id_change_set_product
		FOREIGN KEY (id_change_set_product)
		REFERENCES Shop_Product_Change_Set(id_change_set)
        */
);

-- Product Basket Audits


SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Basket_Audit';

CREATE TABLE IF NOT EXISTS Shop_User_Basket_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_item INTEGER NOT NULL,
	CONSTRAINT FK_Shop_User_Basket_Audit_id_link
		FOREIGN KEY (id_item)
		REFERENCES Shop_User_Basket(id_item)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(200),
	value_new VARCHAR(200),
	id_change_set_user INTEGER,
	CONSTRAINT FK_Shop_User_Basket_Audit_id_change_set_user
		FOREIGN KEY (id_change_set_user)
		REFERENCES Shop_User_Change_Set(id_change_set)
	/*
	id_change_set_product INTEGER,
	CONSTRAINT FK_Shop_User_Basket_Audit_id_change_set_product
		FOREIGN KEY (id_change_set_product)
		REFERENCES Shop_Product_Change_Set(id_change_set)
	*/
);

-- User Order Types



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Order_Status';

CREATE TABLE IF NOT EXISTS Shop_User_Order_Status (
	id_status INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	code VARCHAR(50),
	name VARCHAR(255),
	name_plural VARCHAR(256),
	active BOOLEAN NOT NULL DEFAULT TRUE,
	display_order INTEGER NOT NULL,
	created_on TIMESTAMP,
	created_by INT,
	id_change_set INTEGER,
	CONSTRAINT FK_Shop_User_Order_Status_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_User_Change_Set(id_change_set)
);

-- Order Type Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Order_Status_Audit';

CREATE TABLE IF NOT EXISTS Shop_User_Order_Status_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_status INTEGER NOT NULL,
    CONSTRAINT FK_Shop_User_Order_Status_Audit_id_status
		FOREIGN KEY (id_status)
        REFERENCES Shop_User_Order_Status(id_status)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(256),
    value_new VARCHAR(256),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_User_Order_Status_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
-- Supplier



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier';

CREATE TABLE IF NOT EXISTS Shop_Supplier (
    id_supplier INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name_company VARCHAR(255) NOT NULL,
    name_contact VARCHAR(255) NULL,
    department_contact VARCHAR(255) NULL,
    id_address INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_id_address
		FOREIGN KEY (id_address)
        REFERENCES Shop_Address(id_address),
	phone_number VARCHAR(50) NULL,
    fax VARCHAR(50) NULL,
    email VARCHAR(255) NOT NULL,
    website VARCHAR(255) NULL,
    id_currency INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Supplier_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);

-- Supplier Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Audit';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_supplier INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Audit_id_supplier
		FOREIGN KEY (id_supplier)
        REFERENCES Shop_Supplier(id_supplier)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(255),
    value_new VARCHAR(255),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);

-- Unit of Measurement



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Unit_Measurement';

CREATE TABLE IF NOT EXISTS Shop_Unit_Measurement (
    id_unit_measurement INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name_singular VARCHAR(255) NOT NULL,
    name_plural VARCHAR(256) NOT NULL,
    symbol VARCHAR(50) NOT NULL,
    is_base_unit BOOLEAN NOT NULL DEFAULT FALSE,
	
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Unit_Measurement_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

-- Unit of Measurement Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Unit_Measurement_Audit';

CREATE TABLE IF NOT EXISTS Shop_Unit_Measurement_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_unit_measurement INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Unit_Measurement_Audit_id_unit_measurement
		FOREIGN KEY (id_unit_measurement)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(256),
    value_new VARCHAR(256),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Unit_Measurement_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

-- Unit of Measurement Conversion



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Unit_Measurement_Conversion';

CREATE TABLE IF NOT EXISTS Shop_Unit_Measurement_Conversion (
    id_conversion INTEGER NOT NULL PRIMARY KEY,
    id_unit_derived INTEGER NOT NULL,
    id_unit_base INTEGER NOT NULL,
    power_unit_base REAL NOT NULL,
    multiplier_unit_base REAL NOT NULL,
    increment_unit_base REAL NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Unit_Measurement_Conversion_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

-- Unit of Measurement Conversion Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Unit_Measurement_Conversion_Audit';

CREATE TABLE IF NOT EXISTS Shop_Unit_Measurement_Conversion_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_conversion INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Unit_Measurement_Conversion_Audit_id_conversion
		FOREIGN KEY (id_conversion)
        REFERENCES Shop_Unit_Measurement_Conversion(id_conversion)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(100),
    value_new VARCHAR(100),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Unit_Measurement_Conversion_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

-- Supplier Purchase Order



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Purchase_Order';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Purchase_Order (
	id_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_supplier_ordered INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_id_supplier_ordered
		FOREIGN KEY (id_supplier_ordered) 
        REFERENCES Shop_Supplier(id_supplier),
	/*
    id_supplier_fulfilled INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_id_supplier_fulfilled
		FOREIGN KEY (id_supplier_fulfilled) 
        REFERENCES Shop_Supplier(id_supplier),
	*/
    cost_total_local REAL NOT NULL,
    id_currency_cost INTEGER NOT NULL,
    /*
    latency_delivery INTEGER NOT NULL,
	quantity_ordered REAL NOT NULL,
	id_unit_quantity INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit),
    -- quantity_received INTEGER NULL,
	display_order INTEGER NOT NULL,
    */
    active BOOLEAN NOT NULL DEFAULT TRUE,
	created_on TIMESTAMP,
	created_by INT,
	updated_last_on TIMESTAMP NULL,
	created_last_by VARCHAR(100) NULL,
	id_change_set INTEGER NULL,
	CONSTRAINT FK_Shop_Supplier_Purchase_Order_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

-- Supplier Purchase Order Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Purchase_Order_Audit';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Purchase_Order_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_order INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_Audit_id_order
		FOREIGN KEY (id_order)
        REFERENCES Shop_Supplier_Purchase_Order(id_order)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(10),
    value_new VARCHAR(10),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

-- Supplier Purchase Order Product Link



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Purchase_Order_Product_Link';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Purchase_Order_Product_Link (
	id_link INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_order INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_Product_Link_id_order
		FOREIGN KEY (id_order) 
        REFERENCES Shop_Supplier_Purchase_Order(id_order),
    id_permutation INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_Product_Link_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    cost_total_local REAL NOT NULL,
    id_currency_cost INTEGER NOT NULL,
	quantity_ordered REAL NOT NULL,
	id_unit_quantity INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_Product_Link_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement),
    quantity_received REAL NULL,
    latency_delivery_days INTEGER NOT NULL,
	display_order INTEGER NOT NULL,
    active BOOLEAN NOT NULL,
	created_on TIMESTAMP,
	created_by INT,
	updated_last_on TIMESTAMP NULL,
	created_last_by VARCHAR(100) NULL,
	id_change_set INTEGER NULL,
	CONSTRAINT FK_Shop_Supplier_Purchase_Order_Product_Link_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

-- Supplier Purchase Order Product Link Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Purchase_Order_Product_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Purchase_Order_Product_Link_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_link INTEGER NOT NULL,
    CONSTRAINT FK_Supplier_Purch_Order_Product_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Supplier_Purchase_Order_Product_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(10),
    value_new VARCHAR(10),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Supplier_Purch_Order_Product_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

-- Supplier Purchase Order Product Link Temp



-- drop table Shop_Supplier_Purchase_Order_Product_Link_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Purchase_Order_Product_Link_Temp';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Purchase_Order_Product_Link_Temp (
	id_link INTEGER NOT NULL PRIMARY KEY,
    GUID UUID NOT NULL,
    id_order INTEGER NOT NULL,
    /*
    CONSTRAINT FK_Supplier_Purchase_Order_Product_Link_Temp_id_order
		FOREIGN KEY (id_order) 
        REFERENCES Shop_Supplier_Purchase_Order(id_order),
	*/
    id_permutation INTEGER NOT NULL,
    CONSTRAINT FK_Supplier_Purchase_Order_Product_Link_Temp_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    cost_total_local REAL NOT NULL,
    id_currency_cost INTEGER NOT NULL,
	quantity_ordered REAL NOT NULL,
	id_unit_quantity INTEGER NOT NULL,
    CONSTRAINT FK_Supplier_Purchase_Order_Product_Link_Temp_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement),
    quantity_received REAL NULL,
    latency_delivery_days INTEGER NOT NULL,
	display_order INTEGER NOT NULL,
    active BOOLEAN NOT NULL
);


-- Manufacturing Purchase Order



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order (
	id_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	cost_total_local REAL NOT NULL,
    id_currency_cost INTEGER NOT NULL,
    value_produced_total_local REAL NOT NULL,
    /*
    latency_delivery INTEGER NOT NULL,
	quantity_ordered REAL NOT NULL,
	id_unit_quantity INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Manufacturing_Purchase_Order_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit),
    quantity_received INTEGER NULL,
	display_order INTEGER NOT NULL,
    */
    active BOOLEAN NOT NULL DEFAULT TRUE,
	created_on TIMESTAMP,
	created_by INT,
	updated_last_on TIMESTAMP NULL,
	created_last_by VARCHAR(100) NULL,
	id_change_set INTEGER NULL,
	CONSTRAINT FK_Shop_Manufacturing_Purchase_Order_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

-- Manufacturing Purchase Order Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order_Audit';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_order INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Manufacturing_Purchase_Order_Audit_id_order
		FOREIGN KEY (id_order)
        REFERENCES Shop_Manufacturing_Purchase_Order(id_order)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(10),
    value_new VARCHAR(10),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Manufacturing_Purchase_Order_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

-- Manufacturing Purchase Order Product Link



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order_Product_Link';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order_Product_Link (
	id_link INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_order INTEGER NOT NULL,
    CONSTRAINT FK_Manufacturing_Purchase_Order_Product_Link_id_order
		FOREIGN KEY (id_order) 
        REFERENCES Shop_Manufacturing_Purchase_Order(id_order),
    id_permutation INTEGER NOT NULL,
    CONSTRAINT FK_Manufacturing_Purchase_Order_Product_Link_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    cost_total_local REAL NOT NULL,
    id_currency_cost INTEGER NOT NULL,
    value_produced_total_local REAL NOT NULL,
	quantity_used REAL NOT NULL,
	id_unit_quantity INTEGER NOT NULL,
    CONSTRAINT FK_Manufacturing_Purchase_Order_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement),
    latency_manufacture_days INTEGER NOT NULL,
	quantity_produced REAL NOT NULL,
	display_order INTEGER NOT NULL,
    active BOOLEAN NOT NULL,
	created_on TIMESTAMP,
	created_by INT,
	updated_last_on TIMESTAMP NULL,
	created_last_by VARCHAR(100) NULL,
	id_change_set INTEGER NULL,
	CONSTRAINT FK_Manufacturing_Purchase_Order_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

-- Manufacturing Purchase Order Product Link Temp



-- DROP TABLE Shop_Manufacturing_Purchase_Order_Product_Link_Temp;
-- SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order_Product_Link_Temp';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order_Product_Link_Temp (
	id_link INTEGER NOT NULL PRIMARY KEY,
    GUID UUID NOT NULL,
    id_order INTEGER NOT NULL,
    /*
    CONSTRAINT FK_Manuf_Purch_Order_Product_Link_Temp_id_order
		FOREIGN KEY (id_order) 
        REFERENCES Shop_Manufacturing_Purchase_Order(id_order),
	*/
    id_permutation INTEGER NOT NULL,
    CONSTRAINT FK_Manuf_Purch_Order_Product_Link_Temp_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    cost_total_local REAL NOT NULL,
    id_currency_cost INTEGER NOT NULL,
	quantity_used REAL NOT NULL,
	id_unit_quantity INTEGER NOT NULL,
    CONSTRAINT FK_Manuf_Purch_Order_Product_Link_Temp_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement),
    quantity_produced REAL NULL,
    latency_manufacture_days INTEGER NOT NULL,
	display_order INTEGER NOT NULL,
    active BOOLEAN NOT NULL
);

-- Manufacturing Purchase Order Product Link Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order_Product_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order_Product_Link_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_link INTEGER NOT NULL,
    CONSTRAINT FK_Manufacturing_Purch_Order_Product_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Manufacturing_Purchase_Order_Product_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(10),
    value_new VARCHAR(10),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Manufacturing_Purch_Order_Product_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);
-- Customer



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Customer';

CREATE TABLE IF NOT EXISTS Shop_Customer (
    id_customer INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name_company VARCHAR(255) NOT NULL,
    name_contact VARCHAR(255) NULL,
    department_contact VARCHAR(255) NULL,
    id_address INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Customer_id_address
		FOREIGN KEY (id_address)
        REFERENCES Shop_Address(id_address),
	phone_number VARCHAR(50) NULL,
    email VARCHAR(255) NOT NULL,
    id_currency INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Customer_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Customer_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

-- Customer Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Customer_Audit';

CREATE TABLE IF NOT EXISTS Shop_Customer_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_customer INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Customer_Audit_id_customer
		FOREIGN KEY (id_customer)
        REFERENCES Shop_Customer(id_customer)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(255),
    value_new VARCHAR(255),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Customer_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

-- Customer Sales Purchase Order



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Customer_Sales_Order';

CREATE TABLE IF NOT EXISTS Shop_Customer_Sales_Order (
	id_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_customer INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_id_customer
		FOREIGN KEY (id_customer)
        REFERENCES Shop_Customer(id_customer),
	price_total_local REAL NOT NULL,
    id_currency_price INTEGER NOT NULL,
    /*
    latency_delivery INTEGER NOT NULL,
	quantity_ordered REAL NOT NULL,
	id_unit_quantity INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit),
    quantity_received INTEGER NULL,
	display_order INTEGER NOT NULL,
    */
    active BOOLEAN NOT NULL DEFAULT TRUE,
	created_on TIMESTAMP,
	created_by INT,
	updated_last_on TIMESTAMP NULL,
	created_last_by VARCHAR(100) NULL,
	id_change_set INTEGER NULL,
	CONSTRAINT FK_Shop_Customer_Sales_Order_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

-- Customer Sales Order Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Customer_Sales_Order_Audit';

CREATE TABLE IF NOT EXISTS Shop_Customer_Sales_Order_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_order INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_Audit_id_order
		FOREIGN KEY (id_order)
        REFERENCES Shop_Customer_Sales_Order(id_order)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(10),
    value_new VARCHAR(10),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

-- Customer Sales Order Product Link



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Customer_Sales_Order_Product_Link';

CREATE TABLE IF NOT EXISTS Shop_Customer_Sales_Order_Product_Link (
	id_link INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_order INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_Product_Link_id_order
		FOREIGN KEY (id_order) 
        REFERENCES Shop_Customer_Sales_Order(id_order),
    id_permutation INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_Product_Link_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
	price_total_local REAL NOT NULL,
    id_currency_price INTEGER NOT NULL,
	quantity_ordered REAL NOT NULL,
	id_unit_quantity INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_Product_Link_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	quantity_delivered REAL NOT NULL,
    latency_delivery_days INTEGER NOT NULL,
	display_order INTEGER NOT NULL,
    
    active BOOLEAN NOT NULL,
	created_on TIMESTAMP,
	created_by INT,
	updated_last_on TIMESTAMP NULL,
	created_last_by VARCHAR(100) NULL,
	id_change_set INTEGER NULL,
	CONSTRAINT FK_Shop_Customer_Sales_Order_Product_Link_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

-- Customer Sales Order Product Link Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Customer_Sales_Order_Product_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Customer_Sales_Order_Product_Link_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_link INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_Product_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Customer_Sales_Order_Product_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(10),
    value_new VARCHAR(10),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_Product_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

-- Customer Sales Order Product Link Temp



-- DROP TABLE Shop_Customer_Sales_Order_Product_Link_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Customer_Sales_Order_Product_Link_Temp';

CREATE TABLE IF NOT EXISTS Shop_Customer_Sales_Order_Product_Link_Temp (
	id_link INTEGER NOT NULL PRIMARY KEY,
    GUID UUID NOT NULL,
    id_order INTEGER NOT NULL,
    /*
    CONSTRAINT FK_Customer_Sales_Order_Product_Link_Temp_id_order
		FOREIGN KEY (id_order) 
        REFERENCES Shop_Customer_Sales_Order(id_order),
	*/
    id_permutation INTEGER NOT NULL,
    CONSTRAINT FK_Customer_Sales_Order_Product_Link_Temp_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    price_total_local REAL NOT NULL,
    id_currency_price INTEGER NOT NULL,
	quantity_ordered REAL NOT NULL,
	id_unit_quantity INTEGER NOT NULL,
    CONSTRAINT FK_Customer_Sales_Order_Product_Link_Temp_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement),
    quantity_delivered REAL NULL,
    latency_delivery_days INTEGER NOT NULL,
	display_order INTEGER NOT NULL,
    active BOOLEAN NOT NULL
);

DO $$
BEGIN
	RAISE NOTICE 'TABLE CREATION COMPLETE';
END $$;

-- Product Change Set

CREATE OR REPLACE FUNCTION before_insert_Shop_Sales_And_Purchasing_Change_Set()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.updated_last_on IS NULL THEN
		NEW.updated_last_on = CURRENT_TIMESTAMP;
	END IF;
	IF NEW.updated_last_by IS NULL THEN
		NEW.updated_last_by = CURRENT_USER;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Sales_And_Purchasing_Change_Set
BEFORE INSERT ON Shop_Sales_And_Purchasing_Change_Set
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Sales_And_Purchasing_Change_Set();


-- Shop User Change Set

CREATE OR REPLACE FUNCTION before_insert_Shop_User_Change_Set()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.updated_last_on IS NULL THEN
		NEW.updated_last_on = CURRENT_TIMESTAMP;
	END IF;
	IF NEW.updated_last_by IS NULL THEN
		NEW.updated_last_by = CURRENT_USER;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_User_Change_Set
BEFORE INSERT ON Shop_User_Change_Set
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_User_Change_Set();

-- Shop Access Level

CREATE OR REPLACE FUNCTION before_insert_Shop_Access_Level()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Access_Level
BEFORE INSERT ON Shop_Access_Level
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Access_Level();


CREATE OR REPLACE FUNCTION before_update_Shop_Access_Level()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Access_Level_Audit (
		id_access_level,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_access_level, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT (OLD.code <=> NEW.code)
    UNION
    -- Changed name
	SELECT NEW.id_access_level, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT (OLD.name <=> NEW.name)
    UNION
    -- Changed priority
	SELECT NEW.id_access_level, 'priority', CONVERT(OLD.priority, CHAR), CONVERT(NEW.priority, CHAR), NEW.id_change_set
		WHERE NOT (OLD.priority <=> NEW.priority)
	UNION
	-- Changed active
	SELECT NEW.id_access_level, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    UNION
    -- Changed display_order
	SELECT NEW.id_access_level, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
	;
	
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Access_Level
BEFORE UPDATE ON Shop_Access_Level
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Access_Level();

-- Product Change Set



CREATE OR REPLACE FUNCTION before_insert_Shop_Product_Change_Set()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.updated_last_on IS NULL THEN
		NEW.updated_last_on = CURRENT_TIMESTAMP;
	END IF;
	IF NEW.updated_last_by IS NULL THEN
		NEW.updated_last_by = CURRENT_USER;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Product_Change_Set
BEFORE INSERT ON Shop_Product_Change_Set
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Product_Change_Set();

-- File Type

CREATE OR REPLACE FUNCTION before_insert_File_Type()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_File_Type
BEFORE INSERT ON File_Type
FOR EACH ROW
EXECUTE FUNCTION before_insert_File_Type();


CREATE OR REPLACE FUNCTION before_update_File_Type()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO File_Type_Audit (
		id_type,
        name_field,
        value_prev,
        value_new
    )
    -- Changed code
	SELECT NEW.id_type, 'code', OLD.code, NEW.code
		WHERE NOT OLD.code <=> NEW.code
	UNION
    -- Changed name
	SELECT NEW.id_type, 'name', OLD.name, NEW.name
		WHERE NOT OLD.name <=> NEW.name
    UNION
    -- Changed extension
	SELECT NEW.id_type, 'extension', CONVERT(OLD.extension, CHAR), CONVERT(NEW.extension, CHAR)
		WHERE NOT OLD.extension <=> NEW.extension
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_File_Type
BEFORE UPDATE ON File_Type
FOR EACH ROW
EXECUTE FUNCTION before_update_File_Type();

-- File Type Audits

CREATE OR REPLACE FUNCTION before_insert_File_Type_Audit()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_File_Type_Audit
BEFORE INSERT ON File_Type_Audit
FOR EACH ROW
EXECUTE FUNCTION before_insert_File_Type_Audit();


CREATE OR REPLACE FUNCTION before_update_File_Type_Audit()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_last_on = CURRENT_TIMESTAMP;
    NEW.updated_last_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_File_Type_Audit
BEFORE UPDATE ON File_Type_Audit
FOR EACH ROW
EXECUTE FUNCTION before_update_File_Type_Audit();
-- Shop General

CREATE OR REPLACE FUNCTION before_insert_Shop_General()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_General
BEFORE INSERT ON Shop_General
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_General();


CREATE OR REPLACE FUNCTION before_update_Shop_General()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_General_Audit (
		id_general,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed quantity max
	SELECT NEW.id_general, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
	;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_General
BEFORE UPDATE ON Shop_General
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_General();
-- Shop Category

CREATE OR REPLACE FUNCTION before_insert_Shop_Product_Category()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Product_Category
BEFORE INSERT ON Shop_Product_Category
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Product_Category();


CREATE OR REPLACE FUNCTION before_update_Shop_Product_Category()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Product_Category_Audit (
		id_category,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_category, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
    -- Changed name
	SELECT NEW.id_category, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	-- Changed description
	SELECT NEW.id_category, 'description', OLD.description, NEW.description, NEW.id_change_set
		WHERE NOT OLD.description <=> NEW.description
	UNION
	-- Changed active
	SELECT NEW.id_category, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
    -- Changed display_order
	SELECT NEW.id_category, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
	;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Product_Category
BEFORE UPDATE ON Shop_Product_Category
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Product_Category();

-- Shop Recurrence Interval

CREATE OR REPLACE FUNCTION before_insert_Shop_Recurrence_Interval()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Recurrence_Interval
BEFORE INSERT ON Shop_Recurrence_Interval
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Recurrence_Interval();


CREATE OR REPLACE FUNCTION before_update_Shop_Recurrence_Interval()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Recurrence_Interval_Audit (
		id_interval,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_interval, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    -- Changed name
	SELECT NEW.id_interval, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    -- Changed name_plural
	SELECT NEW.id_interval, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
    UNION
    -- Changed name
	SELECT NEW.id_interval, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
	;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Recurrence_Interval
BEFORE UPDATE ON Shop_Recurrence_Interval
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Recurrence_Interval();

-- Shop Delivery Region

CREATE OR REPLACE FUNCTION before_insert_Shop_Region()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Region
BEFORE INSERT ON Shop_Region
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Region();


CREATE OR REPLACE FUNCTION before_update_Shop_Region()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Region_Audit (
		id_region,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_region, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    -- Changed name
	SELECT NEW.id_region, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    -- Changed active
	SELECT NEW.id_region, 'active', CONVERT(OLD.active, CHAR), CONVERT(NEW.active, CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    UNION
    -- Changed display_order
	SELECT NEW.id_region, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Region
BEFORE UPDATE ON Shop_Region
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Region();

-- Shop Region Branch

CREATE OR REPLACE FUNCTION before_insert_Shop_Region_Branch()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Region_Branch
BEFORE INSERT ON Shop_Region_Branch
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Region_Branch();


CREATE OR REPLACE FUNCTION before_update_Shop_Region_Branch()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Region_Branch_Audit (
		id_branch,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    -- Changed depth
	SELECT NEW.id_branch, 'depth', CONVERT(OLD.depth, CHAR), CONVERT(NEW.depth, CHAR), NEW.id_change_set
		WHERE NOT OLD.depth <=> NEW.depth
    UNION
    */
    -- Changed active
	SELECT NEW.id_branch, 'active', CONVERT(OLD.active, CHAR), CONVERT(NEW.active, CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    UNION
    -- Changed display_order
	SELECT NEW.id_branch, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Region_Branch
BEFORE UPDATE ON Shop_Region_Branch
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Region_Branch(); 

-- Shop Currency

CREATE OR REPLACE FUNCTION before_insert_Shop_Currency()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Currency
BEFORE INSERT ON Shop_Currency
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Currency();


CREATE OR REPLACE FUNCTION before_update_Shop_Currency()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Currency_Audit (
		id_currency,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_currency, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
    -- Changed name
	SELECT NEW.id_currency, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
    -- Changed symbol
	SELECT NEW.id_currency, 'symbol', OLD.symbol, NEW.symbol, NEW.id_change_set
		WHERE NOT OLD.symbol <=> NEW.symbol
	UNION
    -- Changed ratio_2_GBP
	SELECT NEW.id_currency, 'factor_from_GBP', OLD.factor_from_GBP, NEW.factor_from_GBP, NEW.id_change_set
		WHERE NOT OLD.factor_from_GBP <=> NEW.factor_from_GBP
	UNION
	-- Changed active
	SELECT NEW.id_currency, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	-- Changed display_order
	SELECT NEW.id_currency, 'display_order', CONVERT(display_order, CHAR), CONVERT(display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Currency
BEFORE UPDATE ON Shop_Currency
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Currency();

-- Shop Tax_Or_Surcharge

CREATE OR REPLACE FUNCTION before_insert_Shop_Tax_Or_Surcharge()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Tax_Or_Surcharge
BEFORE INSERT ON Shop_Tax_Or_Surcharge
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Tax_Or_Surcharge();


CREATE OR REPLACE FUNCTION before_update_Shop_Tax_Or_Surcharge()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Tax_Or_Surcharge_Audit (
		id_tax,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_tax, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    -- Changed name
	SELECT NEW.id_tax, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    -- Changed fixed_fee
	SELECT NEW.id_tax, 'fixed_fee', OLD.fixed_fee, NEW.fixed_fee, NEW.id_change_set
		WHERE NOT OLD.fixed_fee <=> NEW.fixed_fee
    UNION
    -- Changed multiplier
	SELECT NEW.id_tax, 'multiplier', OLD.multiplier, NEW.multiplier, NEW.id_change_set
		WHERE NOT OLD.multiplier <=> NEW.multiplier
    UNION
    -- Changed apply_fixed_fee_before_multiplier
	SELECT NEW.id_tax, 'apply_fixed_fee_before_multiplier', CONVERT(CONVERT(OLD.apply_fixed_fee_before_multiplier, SIGNED), CHAR), CONVERT(CONVERT(NEW.apply_fixed_fee_before_multiplier, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.apply_fixed_fee_before_multiplier <=> NEW.apply_fixed_fee_before_multiplier
    UNION
    -- Changed quantity_min
	SELECT NEW.id_tax, 'quantity_min', OLD.quantity_min, NEW.quantity_min, NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
    UNION
    -- Changed quantity_max
	SELECT NEW.id_tax, 'quantity_max', OLD.quantity_max, NEW.quantity_max, NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
    UNION
    -- Changed display_order
	SELECT NEW.id_tax, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    UNION
    -- Changed active
	SELECT NEW.id_tax, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Tax_Or_Surcharge
BEFORE UPDATE ON Shop_Tax_Or_Surcharge
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Tax_Or_Surcharge();


-- Shop Product

CREATE OR REPLACE FUNCTION before_insert_Shop_Product()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Product
BEFORE INSERT ON Shop_Product
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Product();


CREATE OR REPLACE FUNCTION before_update_Shop_Product()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
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
    -- Changed name
	SELECT NEW.id_product, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    /*
    UNION
    -- Changed description
	SELECT NEW.id_product, 'description', OLD.description, NEW.description, NEW.id_change_set
		WHERE NOT OLD.description <=> NEW.description
    UNION
    -- Changed price_GBP_full
	SELECT NEW.id_product, 'price_GBP_full', CONVERT(OLD.price_GBP_full, CHAR), CONVERT(NEW.price_GBP_full, CHAR), NEW.id_change_set
		WHERE NOT OLD.price_GBP_full <=> NEW.price_GBP_full
	UNION
    -- Changed price_GBP_min
	SELECT NEW.id_product, 'price_GBP_min', CONVERT(OLD.price_GBP_min, CHAR), CONVERT(NEW.price_GBP_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.price_GBP_min <=> NEW.price_GBP_min
	UNION
    /
    -- Changed discount
	SELECT NEW.id_product, 'discount', CONVERT(OLD.discount, CHAR), CONVERT(NEW.discount, CHAR), NEW.id_change_set
		WHERE NOT OLD.discount <=> NEW.discount
    */
	UNION
    -- Changed id_category
	SELECT NEW.id_product, 'id_category', CONVERT(OLD.id_category, CHAR), CONVERT(NEW.id_category, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_category <=> NEW.id_category
	UNION
    -- Changed has_variations
	SELECT NEW.id_product, 'has_variations', CONVERT(CONVERT(NEW.has_variations, SIGNED), CHAR), CONVERT(CONVERT(NEW.has_variations, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.has_variations <=> NEW.has_variations
	/*
    UNION
    -- Changed latency_manuf
	SELECT NEW.id_product, 'latency_manuf', CONVERT(OLD.latency_manuf, CHAR), CONVERT(NEW.latency_manuf, CHAR), NEW.id_change_set
		WHERE NOT OLD.latency_manuf <=> NEW.latency_manuf
	UNION
    -- Changed quantity_min
	SELECT NEW.id_product, 'quantity_min', CONVERT(OLD.quantity_min, CHAR), CONVERT(NEW.quantity_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
	UNION
    -- Changed quantity_max
	SELECT NEW.id_product, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
	UNION
    -- Changed quantity_step
	SELECT NEW.id_product, 'quantity_step', CONVERT(OLD.quantity_step, CHAR), CONVERT(NEW.quantity_step, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_step <=> NEW.quantity_step
	UNION
    -- Changed quantity_stock
	SELECT NEW.id_product, 'quantity_stock', CONVERT(OLD.quantity_stock, CHAR), CONVERT(NEW.quantity_stock, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_stock <=> NEW.quantity_stock
    UNION
    -- Changed is_subscription
	SELECT NEW.id_product, 'is_subscription', CONVERT(CONVERT(OLD.is_subscription, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_subscription, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.is_subscription <=> NEW.is_subscription
	UNION
    -- Changed id_recurrence_interval
	SELECT NEW.id_product, 'id_recurrence_interval', CONVERT(OLD.id_recurrence_interval, CHAR), CONVERT(NEW.id_recurrence_interval, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_recurrence_interval <=> NEW.id_recurrence_interval
    UNION
    -- Changed count_recurrence_interval
	SELECT NEW.id_product, 'count_recurrence_interval', CONVERT(OLD.count_recurrence_interval, CHAR), CONVERT(NEW.count_recurrence_interval, CHAR), NEW.id_change_set
		WHERE NOT OLD.count_recurrence_interval <=> NEW.count_recurrence_interval
	UNION
    -- Changed id_stripe_product
	SELECT NEW.id_product, 'id_stripe_product', OLD.id_stripe_product, NEW.id_stripe_product, NEW.id_change_set
		WHERE NOT OLD.id_stripe_product <=> NEW.id_stripe_product
    /
    UNION
    -- Changed id_stripe_price
	SELECT NEW.id_product, 'id_stripe_price', OLD.id_stripe_price, NEW.id_stripe_price, NEW.id_change_set
		WHERE NOT OLD.id_stripe_price <=> NEW.id_stripe_price
	*/
	UNION
    -- Changed id_access_level_required
	SELECT NEW.id_product, 'id_access_level_required', CONVERT(OLD.id_access_level_required, CHAR), CONVERT(NEW.id_access_level_required, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_access_level_required <=> NEW.id_access_level_required
    UNION
	-- Changed active
	SELECT NEW.id_product, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	-- Changed display_order
	SELECT NEW.id_product, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Product
BEFORE UPDATE ON Shop_Product
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Product();

-- Shop Variation Type

CREATE OR REPLACE FUNCTION before_insert_Shop_Variation_Type()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Variation_Type
BEFORE INSERT ON Shop_Variation_Type
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Variation_Type();


CREATE OR REPLACE FUNCTION before_update_Shop_Variation_Type()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Variation_Type_Audit (
		id_type,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_type, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    -- Changed name
	SELECT NEW.id_type, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    -- Changed name_plural
	SELECT NEW.id_type, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
	UNION
	-- Changed active
	SELECT NEW.id_type, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	-- Changed display_order
	SELECT NEW.id_type, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
	;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Variation_Type
BEFORE UPDATE ON Shop_Variation_Type
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Variation_Type();

-- Shop Variation

CREATE OR REPLACE FUNCTION before_insert_Shop_Variation()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Variation
BEFORE INSERT ON Shop_Variation
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Variation();


CREATE OR REPLACE FUNCTION before_update_Shop_Variation()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Variation_Audit (
		id_variation,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_variation, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    -- Changed name
	SELECT NEW.id_variation, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	-- Changed active
	SELECT NEW.id_variation, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	-- Changed display_order
	SELECT NEW.id_variation, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Variation
BEFORE UPDATE ON Shop_Variation
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Variation();

-- Shop Product Permutation

CREATE OR REPLACE FUNCTION before_insert_Shop_Product_Permutation()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Product_Permutation
BEFORE INSERT ON Shop_Product_Permutation
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Product_Permutation();


CREATE OR REPLACE FUNCTION before_update_Shop_Product_Permutation()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Product_Permutation_Audit (
		id_permutation,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    -- Changed id_product
	SELECT NEW.id_permutation, 'id_product', OLD.id_product, NEW.id_product, NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
	UNION
    -- Changed id_variation
	SELECT NEW.id_permutation, 'id_variation', OLD.id_variation, NEW.id_variation, NEW.id_change_set
		WHERE NOT OLD.id_variation <=> NEW.id_variation
	UNION
	-- Changed name
	SELECT NEW.id_permutation, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT (OLD.name <=> NEW.name)
	UNION
	*/
	-- Changed description
	SELECT NEW.id_permutation, 'description', OLD.description, NEW.description, NEW.id_change_set
		WHERE NOT (OLD.description <=> NEW.description)
	UNION
	-- Changed cost_local
	SELECT NEW.id_permutation, 'cost_local', CONVERT(OLD.cost_local, CHAR), CONVERT(NEW.cost_local, CHAR), NEW.id_change_set
		WHERE NOT (OLD.cost_local <=> NEW.cost_local)
	UNION
	-- Changed id_currency_cost
	SELECT NEW.id_permutation, 'id_currency_cost', CONVERT(OLD.id_currency_cost, CHAR), CONVERT(NEW.id_currency_cost, CHAR), NEW.id_change_set
		WHERE NOT (OLD.id_currency_cost <=> NEW.id_currency_cost)
	UNION
	-- Changed profit_local_min
	SELECT NEW.id_permutation, 'profit_local_min', CONVERT(OLD.profit_local_min, CHAR), CONVERT(NEW.profit_local_min, CHAR), NEW.id_change_set
		WHERE NOT (OLD.profit_local_min <=> NEW.profit_local_min)
	UNION
    /*
	-- Changed id_currency_profit_min
	SELECT NEW.id_permutation, 'id_currency_profit_min', CONVERT(OLD.id_currency_profit_min, CHAR), CONVERT(NEW.id_currency_profit_min, CHAR), NEW.id_change_set
		WHERE NOT (OLD.id_currency_profit_min <=> NEW.id_currency_profit_min)
	UNION
    */ 
    /*
	-- Changed price_GBP_min
	SELECT NEW.id_permutation, 'price_GBP_min', CONVERT(OLD.price_GBP_min, CHAR), CONVERT(NEW.price_GBP_min, CHAR), NEW.id_change_set
		WHERE NOT (OLD.price_GBP_min <=> NEW.price_GBP_min)
	UNION
    */
    -- Changed latency_manufacture
	SELECT NEW.id_product, 'latency_manufacture', CONVERT(OLD.latency_manufacture, CHAR), CONVERT(NEW.latency_manufacture, CHAR), NEW.id_change_set
		WHERE NOT OLD.latency_manufacture <=> NEW.latency_manufacture
	UNION
    -- Changed quantity_min
	SELECT NEW.id_product, 'quantity_min', CONVERT(OLD.quantity_min, CHAR), CONVERT(NEW.quantity_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
	UNION
    -- Changed quantity_max
	SELECT NEW.id_product, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
	UNION
    -- Changed quantity_step
	SELECT NEW.id_product, 'quantity_step', CONVERT(OLD.quantity_step, CHAR), CONVERT(NEW.quantity_step, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_step <=> NEW.quantity_step
	UNION
    -- Changed quantity_stock
	SELECT NEW.id_product, 'quantity_stock', CONVERT(OLD.quantity_stock, CHAR), CONVERT(NEW.quantity_stock, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_stock <=> NEW.quantity_stock
    UNION
    -- Changed is_subscription
	SELECT NEW.id_product, 'is_subscription', CONVERT(CONVERT(OLD.is_subscription, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_subscription, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.is_subscription <=> NEW.is_subscription
	UNION
    -- Changed id_recurrence_interval
	SELECT NEW.id_product, 'id_recurrence_interval', CONVERT(OLD.id_recurrence_interval, CHAR), CONVERT(NEW.id_recurrence_interval, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_recurrence_interval <=> NEW.id_recurrence_interval
    UNION
    -- Changed count_recurrence_interval
	SELECT NEW.id_product, 'count_recurrence_interval', CONVERT(OLD.count_recurrence_interval, CHAR), CONVERT(NEW.count_recurrence_interval, CHAR), NEW.id_change_set
		WHERE NOT OLD.count_recurrence_interval <=> NEW.count_recurrence_interval
	UNION
    -- Changed id_stripe_product
	SELECT NEW.id_permutation, 'id_stripe_product', OLD.id_stripe_product, NEW.id_stripe_product, NEW.id_change_set
		WHERE NOT (OLD.id_stripe_product <=> NEW.id_stripe_product)
	UNION
    -- Changed active
	SELECT NEW.id_permutation, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	-- Changed display_order
	SELECT NEW.id_permutation, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Product_Permutation
BEFORE UPDATE ON Shop_Product_Permutation
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Product_Permutation();

-- Shop Product Permutation Variation Link

CREATE OR REPLACE FUNCTION before_insert_Shop_Product_Permutation_Variation_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Product_Permutation_Variation_Link
BEFORE INSERT ON Shop_Product_Permutation_Variation_Link
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Product_Permutation_Variation_Link();


CREATE OR REPLACE FUNCTION before_update_Shop_Product_Permutation_Variation_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Product_Permutation_Variation_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    -- Changed id_product
	SELECT NEW.id_link, 'id_product', OLD.id_product, NEW.id_product, NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
	UNION
    -- Changed id_variation
	SELECT NEW.id_link, 'id_variation', OLD.id_variation, NEW.id_variation, NEW.id_change_set
		WHERE NOT OLD.id_variation <=> NEW.id_variation
	UNION
	*/
    -- Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	-- Changed display_order
	SELECT NEW.id_link, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Product_Permutation_Variation_Link
BEFORE UPDATE ON Shop_Product_Permutation_Variation_Link
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Product_Permutation_Variation_Link();

-- Shop Product Currency Region Link

CREATE OR REPLACE FUNCTION before_insert_Shop_Product_Currency_Region_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;
    /*
    NEW.price_local = (
		SELECT PP.price_GBP_full * C.factor_from_GBP
        FROM Shop_Product_Permutation PP
        INNER JOIN Shop_Product P ON PP.id_product = P.id_product
		INNER JOIN Shop_Currency C ON NEW.id_currency = C.id_currency
        WHERE NEW.id_product = P.id_product
        LIMIT 1
	);
    */

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Product_Currency_Region_Link
BEFORE INSERT ON Shop_Product_Currency_Region_Link
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Product_Currency_Region_Link();


CREATE OR REPLACE FUNCTION before_update_Shop_Product_Currency_Region_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    /*
    NEW.price_local = (
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
    -- Changed id_product
	SELECT NEW.id_link, 'id_product', CONVERT(OLD.id_product, CHAR), CONVERT(NEW.id_product, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
	UNION
	-- Changed id_currency
	SELECT NEW.id_link, 'id_currency', CONVERT(OLD.id_currency, CHAR), CONVERT(NEW.id_currency, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_currency <=> NEW.id_currency
    UNION
	-- Changed price_local
	SELECT NEW.id_link, 'price_local', OLD.price_local, NEW.price_local, NEW.id_change_set
		WHERE NOT OLD.price_local <=> NEW.price_local
    UNION
    */ 
	-- Changed price_local_VAT_incl
	SELECT NEW.id_link, 'price_local_VAT_incl', OLD.price_local_VAT_incl, NEW.price_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.price_local_VAT_incl <=> NEW.price_local_VAT_incl
    UNION
	-- Changed price_local_VAT_excl
	SELECT NEW.id_link, 'price_local_VAT_excl', OLD.price_local_VAT_excl, NEW.price_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.price_local_VAT_excl <=> NEW.price_local_VAT_excl
    UNION
	-- Changed id_stripe_price
	SELECT NEW.id_link, 'id_stripe_price', OLD.id_stripe_price, NEW.id_stripe_price, NEW.id_change_set
		WHERE NOT OLD.id_stripe_price <=> NEW.id_stripe_price
    UNION
	-- Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Product_Currency_Region_Link
BEFORE UPDATE ON Shop_Product_Currency_Region_Link
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Product_Currency_Region_Link();

-- Shop Image Type

CREATE OR REPLACE FUNCTION before_insert_Shop_Image_Type()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Image_Type
BEFORE INSERT ON Shop_Image_Type
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Image_Type();


CREATE OR REPLACE FUNCTION before_update_Shop_Image_Type()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Image_Type_Audit (
		id_type,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_type, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    -- Changed name
	SELECT NEW.id_type, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    -- Changed name_plural
	SELECT NEW.id_type, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
	UNION
	-- Changed active
	SELECT NEW.id_type, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	-- Changed display_order
	SELECT NEW.id_type, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Image_Type
BEFORE UPDATE ON Shop_Image_Type
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Image_Type();

-- Shop Image

CREATE OR REPLACE FUNCTION before_insert_Shop_Image()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Image
BEFORE INSERT ON Shop_Image
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Image();


CREATE OR REPLACE FUNCTION before_update_Shop_Image()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    IF ISNULL(NEW.id_product) AND ISNULL(NEW.id_permutation) THEN
		RAISE EXCEPTION 'Image must NOT have ID for product AND product permutation.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Image_Audit (
		id_image,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed id_type_image
	SELECT NEW.id_image, 'id_type_image', CONVERT(OLD.id_type_image, CHAR), CONVERT(NEW.id_type_image, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_type_image <=> NEW.id_type_image
    UNION
    -- Changed id_type_file
	SELECT NEW.id_image, 'id_type_file', CONVERT(OLD.id_type_file, CHAR), CONVERT(NEW.id_type_file, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_type_file <=> NEW.id_type_file
    UNION
    -- Changed id_product
	SELECT NEW.id_image, 'id_product', CONVERT(OLD.id_product, CHAR), CONVERT(NEW.id_product, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
    UNION
    -- Changed id_permutation
	SELECT NEW.id_image, 'id_permutation', CONVERT(OLD.id_permutation, CHAR), CONVERT(NEW.id_permutation, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_permutation <=> NEW.id_permutation
    UNION
    -- Changed url
	SELECT NEW.id_image, 'url', OLD.url, NEW.url, NEW.id_change_set
		WHERE NOT OLD.url <=> NEW.url
	UNION
	-- Changed active
	SELECT NEW.id_image, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	-- Changed display_order
	SELECT NEW.id_image, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
	;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Image
BEFORE UPDATE ON Shop_Image
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Image();

-- Shop Delivery Option Type

CREATE OR REPLACE FUNCTION before_insert_Shop_Delivery_Option()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Delivery_Option
BEFORE INSERT ON Shop_Delivery_Option
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Delivery_Option();


CREATE OR REPLACE FUNCTION before_update_Shop_Delivery_Option()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Delivery_Option_Audit (
		id_option,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_option, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    -- Changed name
	SELECT NEW.id_option, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    -- Changed latency_delivery_min
	SELECT NEW.id_option, 'latency_delivery_min', CONVERT(OLD.latency_delivery_min, CHAR), CONVERT(NEW.latency_delivery_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.latency_delivery_min <=> NEW.latency_delivery_min
    UNION
    -- Changed latency_delivery_max
	SELECT NEW.id_option, 'latency_delivery_max', CONVERT(OLD.latency_delivery_max, CHAR), CONVERT(NEW.latency_delivery_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.latency_delivery_max <=> NEW.latency_delivery_max
    UNION
    -- Changed quantity_min
	SELECT NEW.id_option, 'quantity_min', CONVERT(OLD.quantity_min, CHAR), CONVERT(NEW.quantity_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
    UNION
    -- Changed quantity_max
	SELECT NEW.id_option, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
    UNION
    -- Changed active
	SELECT NEW.id_option, 'active', CONVERT(OLD.active, CHAR), CONVERT(NEW.active, CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    UNION
    -- Changed display_order
	SELECT NEW.id_option, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Delivery_Option
BEFORE UPDATE ON Shop_Delivery_Option
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Delivery_Option();

-- Shop Product Delivery Option Link

CREATE OR REPLACE FUNCTION before_insert_Shop_Product_Delivery_Option_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Product_Delivery_Option_Link
BEFORE INSERT ON Shop_Product_Delivery_Option_Link
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Product_Delivery_Option_Link();


CREATE OR REPLACE FUNCTION before_update_Shop_Product_Delivery_Option_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Product_Delivery_Option_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    -- Changed id_product
	SELECT NEW.id_link, 'id_product', CONVERT(OLD.id_product, CHAR), CONVERT(NEW.id_product, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
    UNION
    -- Changed id_permutation
	SELECT NEW.id_link, 'id_permutation', CONVERT(OLD.id_permutation, CHAR), CONVERT(NEW.id_permutation, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_permutation <=> NEW.id_permutation
    UNION
    -- Changed id_option
	SELECT NEW.id_link, 'id_option', CONVERT(OLD.id_option, CHAR), CONVERT(NEW.id_option, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_option <=> NEW.id_option
	UNION
    -- Changed id_region
	SELECT NEW.id_link, 'id_region', CONVERT(OLD.id_region, CHAR), CONVERT(NEW.id_region, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_region <=> NEW.id_region
	UNION
    */
    -- Changed price_local
	SELECT NEW.id_link, 'price_local', CONVERT(OLD.price_local, CHAR), CONVERT(NEW.price_local, CHAR), NEW.id_change_set
		WHERE NOT OLD.price_local <=> NEW.price_local
	UNION
	-- Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	-- Changed display_order
	SELECT NEW.id_link, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
	;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Product_Delivery_Option_Link
BEFORE UPDATE ON Shop_Product_Delivery_Option_Link
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Product_Delivery_Option_Link();

-- Shop Discount

CREATE OR REPLACE FUNCTION before_insert_Shop_Discount()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
  NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Discount
BEFORE INSERT ON Shop_Discount
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Discount();


CREATE OR REPLACE FUNCTION before_update_Shop_Discount()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Discount_Audit (
		id_discount,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_discount, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    -- Changed name
	SELECT NEW.id_discount, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    -- Changed multiplier
	SELECT NEW.id_discount, 'multiplier', OLD.multiplier, NEW.multiplier, NEW.id_change_set
		WHERE NOT OLD.multiplier <=> NEW.multiplier
    UNION
    -- Changed subtractor
	SELECT NEW.id_discount, 'subtractor', OLD.subtractor, NEW.subtractor, NEW.id_change_set
		WHERE NOT OLD.subtractor <=> NEW.subtractor
    UNION
    -- Changed apply_multiplier_first
	SELECT NEW.id_discount, 'apply_multiplier_first', CONVERT(CONVERT(OLD.apply_multiplier_first, SIGNED), CHAR), CONVERT(CONVERT(NEW.apply_multiplier_first, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.apply_multiplier_first <=> NEW.apply_multiplier_first
    UNION
    -- Changed quantity_min
	SELECT NEW.id_discount, 'quantity_min', OLD.quantity_min, NEW.quantity_min, NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
    UNION
    -- Changed quantity_max
	SELECT NEW.id_discount, 'quantity_max', OLD.quantity_max, NEW.quantity_max, NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
    UNION
    -- Changed date_start
	SELECT NEW.id_discount, 'date_start', OLD.date_start, NEW.date_start, NEW.id_change_set
		WHERE NOT OLD.date_start <=> NEW.date_start
    UNION
    -- Changed date_end
	SELECT NEW.id_discount, 'date_end', OLD.date_end, NEW.date_end, NEW.id_change_set
		WHERE NOT OLD.date_end <=> NEW.date_end
    UNION
    -- Changed display_order
	SELECT NEW.id_discount, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    UNION
    -- Changed active
	SELECT NEW.id_discount, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Discount
BEFORE UPDATE ON Shop_Discount
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Discount();

-- Shop Discount Region Currency Link

CREATE OR REPLACE FUNCTION before_insert_Shop_Discount_Region_Currency_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Discount_Region_Currency_Link
BEFORE INSERT ON Shop_Discount_Region_Currency_Link
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Discount_Region_Currency_Link();


CREATE OR REPLACE FUNCTION before_update_Shop_Discount_Region_Currency_Link()
RETURNS	TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Discount_Region_Currency_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    -- Changed id_discount
	SELECT NEW.id_link, 'id_discount', CONVERT(OLD.id_discount, CHAR), CONVERT(NEW.id_discount, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_discount <=> NEW.id_discount
    UNION
    -- Changed id_region
	SELECT NEW.id_link, 'id_region', CONVERT(OLD.id_region, CHAR), CONVERT(NEW.id_region, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_region <=> NEW.id_region
	UNION
	*/
    -- Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Discount_Region_Currency_Link
BEFORE UPDATE ON Shop_Discount_Region_Currency_Link
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Discount_Region_Currency_Link();

-- Shop Permission Group

CREATE OR REPLACE FUNCTION before_insert_Shop_Permission_Group()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Permission_Group
BEFORE INSERT ON Shop_Permission_Group
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Permission_Group();


CREATE OR REPLACE FUNCTION before_update_Shop_Permission_Group()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Permission_Group_Audit (
		id_group,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_group, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
    -- Changed name
	SELECT NEW.id_group, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	-- Changed active
	SELECT NEW.id_group, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    UNION
    -- Changed display_order
	SELECT NEW.id_group, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Permission_Group
BEFORE UPDATE ON Shop_Permission_Group
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Permission_Group();

-- Shop Permission

CREATE OR REPLACE FUNCTION before_insert_Shop_Permission()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Permission
BEFORE INSERT ON Shop_Permission
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Permission();


CREATE OR REPLACE FUNCTION before_update_Shop_Permission()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Permission_Audit (
		id_permission,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_permission, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
    -- Changed name
	SELECT NEW.id_permission, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	-- Changed id_permission_group
	SELECT NEW.id_permission, 'id_permission_group', CONVERT(OLD.id_permission_group, CHAR), CONVERT(NEW.id_permission_group, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_permission_group <=> NEW.id_permission_group
	UNION
	-- Changed Id_access_level_required
	SELECT NEW.id_permission, 'Id_access_level_required', CONVERT(OLD.Id_access_level_required, CHAR), CONVERT(NEW.Id_access_level_required, CHAR), NEW.id_change_set
		WHERE NOT OLD.Id_access_level_required <=> NEW.Id_access_level_required
	UNION
	-- Changed active
	SELECT NEW.id_permission, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    UNION
    -- Changed display_order
	SELECT NEW.id_permission, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
	;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Permission
BEFORE UPDATE ON Shop_Permission
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Permission();

-- Shop Role

CREATE OR REPLACE FUNCTION before_insert_Shop_Role()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Role
BEFORE INSERT ON Shop_Role
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Role();


CREATE OR REPLACE FUNCTION before_update_Shop_Role()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Role_Audit (
		id_role,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_role, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
	-- Changed name
	SELECT NEW.id_role, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	-- Changed active
	SELECT NEW.id_role, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    UNION
    -- Changed display_order
	SELECT NEW.id_role, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Role
BEFORE UPDATE ON Shop_Role
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Role();

-- Shop Role Permission Link

CREATE OR REPLACE FUNCTION before_insert_Shop_Role_Permission_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Role_Permission_Link
BEFORE INSERT ON Shop_Role_Permission_Link
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Role_Permission_Link();


CREATE OR REPLACE FUNCTION before_update_Shop_Role_Permission_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Role_Permission_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    /*
    -- Changed id_role
	SELECT NEW.id_link, 'id_role', CONVERT(OLD.id_role, CHAR), CONVERT(NEW.id_role, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_role <=> NEW.id_role
	UNION
	-- Changed id_permission
	SELECT NEW.id_link, 'id_permission', CONVERT(OLD.id_permission, CHAR), CONVERT(NEW.id_permission, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_permission <=> NEW.id_permission
    UNION
    */
    -- Changed id_access_level
	SELECT NEW.id_link, 'id_access_level', CONVERT(OLD.id_access_level, CHAR), CONVERT(NEW.id_access_level, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_access_level <=> NEW.id_access_level
	UNION
	-- Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Role_Permission_Link
BEFORE UPDATE ON Shop_Role_Permission_Link
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Role_Permission_Link();

-- Shop User

CREATE OR REPLACE FUNCTION before_insert_Shop_User()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_User
BEFORE INSERT ON Shop_User
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_User();


CREATE OR REPLACE FUNCTION before_update_Shop_User()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_User_Audit (
		id_user,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed id_user_oauth
	SELECT NEW.id_user, 'id_user_oauth', OLD.id_user_oauth, NEW.id_user_oauth, NEW.id_change_set
		WHERE NOT (OLD.id_user_oauth <=> NEW.id_user_oauth)
	UNION
    -- Changed name
	SELECT NEW.id_user, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT (OLD.name <=> NEW.name)
	UNION
    -- Changed email
	SELECT NEW.id_user, 'email', OLD.email, NEW.email, NEW.id_change_set
		WHERE NOT (OLD.email <=> NEW.email)
	UNION
    -- Changed is_email_verified
	SELECT NEW.id_user, 'is_email_verified', OLD.is_email_verified, NEW.is_email_verified, NEW.id_change_set
		WHERE NOT (OLD.is_email_verified <=> NEW.is_email_verified)
	UNION
	-- Changed is_super_user
	SELECT NEW.id_user, 'is_super_user', CONVERT(CONVERT(OLD.is_super_user, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_super_user, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.is_super_user <=> NEW.is_super_user)
	UNION
    -- Changed active
	SELECT NEW.id_user, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_User
BEFORE UPDATE ON Shop_User
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_User();

-- Shop User Role Link

CREATE OR REPLACE FUNCTION before_insert_Shop_User_Role_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_User_Role_Link
BEFORE INSERT ON Shop_User_Role_Link
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_User_Role_Link();


CREATE OR REPLACE FUNCTION before_update_Shop_User_Role_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_User_Role_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	-- Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_User_Role_Link
BEFORE UPDATE ON Shop_User_Role_Link
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_User_Role_Link();

-- Shop Address

CREATE OR REPLACE FUNCTION before_insert_Shop_Address()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Address
BEFORE INSERT ON Shop_Address
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Address();


CREATE OR REPLACE FUNCTION before_update_Shop_Address()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Address_Audit (
		id_address,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed region
	SELECT NEW.id_address, 'id_region', OLD.id_region, NEW.id_region, NEW.id_change_set
		WHERE NOT OLD.id_region <=> NEW.id_region
    UNION
    -- Changed name_full
	SELECT NEW.id_address, 'name_full', OLD.name_full, NEW.name_full, NEW.id_change_set
		WHERE NOT OLD.name_full <=> NEW.name_full
	UNION
    -- Changed phone_number
	SELECT NEW.id_address, 'phone_number', OLD.phone_number, NEW.phone_number, NEW.id_change_set
		WHERE NOT OLD.phone_number <=> NEW.phone_number
    UNION
    -- Changed postcode
	SELECT NEW.id_address, 'postcode', OLD.postcode, NEW.postcode, NEW.id_change_set
		WHERE NOT OLD.postcode <=> NEW.postcode
    UNION
    -- Changed address_line_1
	SELECT NEW.id_address, 'address_line_1', OLD.address_line_1, NEW.address_line_1, NEW.id_change_set
		WHERE NOT OLD.address_line_1 <=> NEW.address_line_1
	UNION
    -- Changed address_line_2
	SELECT NEW.id_address, 'address_line_2', OLD.address_line_2, NEW.address_line_2, NEW.id_change_set
		WHERE NOT OLD.address_line_2 <=> NEW.address_line_2
	UNION
    -- Changed city
	SELECT NEW.id_address, 'city', OLD.city, NEW.city, NEW.id_change_set
		WHERE NOT OLD.city <=> NEW.city
    UNION
    -- Changed county
	SELECT NEW.id_address, 'county', OLD.county, NEW.county, NEW.id_change_set
		WHERE NOT OLD.county <=> NEW.county
	UNION
	-- Changed active
	SELECT NEW.id_address, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Address
BEFORE UPDATE ON Shop_Address
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Address();
-- Shop Product Variation Link

CREATE OR REPLACE FUNCTION before_insert_Shop_User_Basket()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_User_Basket
BEFORE INSERT ON Shop_User_Basket
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_User_Basket();


CREATE OR REPLACE FUNCTION before_update_Shop_User_Basket()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.id_change_set_user <=> OLD.id_change_set_user THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_User_Basket_Audit (
		id_item,
        name_field,
        value_prev,
        value_new,
        id_change_set_user
    )
    -- Changed id_user
	SELECT NEW.id_item, 'id_user', OLD.id_user, NEW.id_user, NEW.id_change_set_user
		WHERE NOT OLD.id_user <=> NEW.id_user
	UNION
	-- Changed id_product
	SELECT NEW.id_item, 'id_product', OLD.id_product, NEW.id_product, NEW.id_change_set_user
		WHERE NOT OLD.id_product <=> NEW.id_product
	UNION
	-- Changed quantity
	SELECT NEW.id_item, 'quantity', CONVERT(OLD.quantity, CHAR), CONVERT(NEW.quantity, CHAR), NEW.id_change_set_user
		WHERE NOT (OLD.quantity <=> NEW.quantity)
	UNION
    -- Changed active
	SELECT NEW.id_item, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set_user
		WHERE NOT (OLD.active <=> NEW.active)
	;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_User_Basket
BEFORE UPDATE ON Shop_User_Basket
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_User_Basket();

-- Shop User Order Type

CREATE OR REPLACE FUNCTION before_insert_Shop_User_Order_Status()
RETURNS TRIGGER AS $$
BEGIN
	NEW.created_on = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_User_Order_Status
BEFORE INSERT ON Shop_User_Order_Status
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_User_Order_Status();


CREATE OR REPLACE FUNCTION before_update_Shop_User_Order_Status()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_User_Order_Status_Audit (
		id_Status,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed code
	SELECT NEW.id_Status, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    -- Changed name
	SELECT NEW.id_Status, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    -- Changed name_plural
	SELECT NEW.id_Status, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
	UNION
	-- Changed active
	SELECT NEW.id_Status, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	-- Changed display_order
	SELECT NEW.id_Status, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_User_Order_Status
BEFORE UPDATE ON Shop_User_Order_Status
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_User_Order_Status();

-- Shop Supplier

CREATE OR REPLACE FUNCTION before_insert_Shop_Supplier()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Supplier
BEFORE INSERT ON Shop_Supplier
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Supplier();


CREATE OR REPLACE FUNCTION before_update_Shop_Supplier()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Supplier_Audit (
		id_supplier,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	-- Changed name_company
	SELECT NEW.id_supplier, 'name_company', OLD.name_company, NEW.name_company, NEW.id_change_set
		WHERE NOT OLD.name_company <=> NEW.name_company
    UNION
	-- Changed name_contact
	SELECT NEW.id_supplier, 'name_contact', OLD.name_contact, NEW.name_contact, NEW.id_change_set
		WHERE NOT OLD.name_contact <=> NEW.name_contact
    UNION
	-- Changed department_contact
	SELECT NEW.id_supplier, 'department_contact', OLD.department_contact, NEW.department_contact, NEW.id_change_set
		WHERE NOT OLD.department_contact <=> NEW.department_contact
    UNION
	-- Changed id_address
	SELECT NEW.id_supplier, 'id_address', OLD.id_address, NEW.id_address, NEW.id_change_set
		WHERE NOT OLD.id_address <=> NEW.id_address
    UNION
	-- Changed phone_number
	SELECT NEW.id_supplier, 'phone_number', OLD.phone_number, NEW.phone_number, NEW.id_change_set
		WHERE NOT OLD.phone_number <=> NEW.phone_number
    UNION
	-- Changed fax
	SELECT NEW.id_supplier, 'fax', OLD.fax, NEW.fax, NEW.id_change_set
		WHERE NOT OLD.fax <=> NEW.fax
    UNION
	-- Changed email
	SELECT NEW.id_supplier, 'email', OLD.email, NEW.email, NEW.id_change_set
		WHERE NOT OLD.email <=> NEW.email
    UNION
	-- Changed website
	SELECT NEW.id_supplier, 'website', OLD.website, NEW.website, NEW.id_change_set
		WHERE NOT OLD.website <=> NEW.website
    UNION
	-- Changed id_currency
	SELECT NEW.id_supplier, 'id_currency', OLD.id_currency, NEW.id_currency, NEW.id_change_set
		WHERE NOT OLD.id_currency <=> NEW.id_currency
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Supplier
BEFORE UPDATE ON Shop_Supplier
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Supplier();

-- Shop Unit of Measurement

CREATE OR REPLACE FUNCTION before_insert_Shop_Unit_Measurement()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Unit_Measurement
BEFORE INSERT ON Shop_Unit_Measurement
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Unit_Measurement();


CREATE OR REPLACE FUNCTION before_update_Shop_Unit_Measurement()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Unit_Measurement_Audit (
		id_unit_measurement,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	-- Changed name_singular
	SELECT NEW.id_unit_measurement, 'name_singular', OLD.name_singular, NEW.name_singular, NEW.id_change_set
		WHERE NOT OLD.name_singular <=> NEW.name_singular
    UNION
	-- Changed name_plural
	SELECT NEW.id_unit_measurement, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
    UNION
	-- Changed symbol
	SELECT NEW.id_unit_measurement, 'symbol', OLD.symbol, NEW.symbol, NEW.id_change_set
		WHERE NOT OLD.symbol <=> NEW.symbol
    UNION
	-- Changed is_base_unit
	SELECT NEW.id_unit_measurement, 'is_base_unit', OLD.is_base_unit, NEW.is_base_unit, NEW.id_change_set
		WHERE NOT OLD.is_base_unit <=> NEW.is_base_unit
    UNION
	-- Changed active
	SELECT NEW.id_unit_measurement, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Unit_Measurement
BEFORE UPDATE ON Shop_Unit_Measurement
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Unit_Measurement();

-- Shop Unit of Measurement Conversion

CREATE OR REPLACE FUNCTION before_insert_Shop_Unit_Measurement_Conversion()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Unit_Measurement_Conversion
BEFORE INSERT ON Shop_Unit_Measurement_Conversion
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Unit_Measurement_Conversion();


CREATE OR REPLACE FUNCTION before_update_Shop_Unit_Measurement_Conversion()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Unit_Measurement_Conversion_Audit (
		id_conversion,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	-- Changed id_unit_derived
	SELECT NEW.id_conversion, 'id_unit_derived', OLD.id_unit_derived, NEW.id_unit_derived, NEW.id_change_set
		WHERE NOT OLD.id_unit_derived <=> NEW.id_unit_derived
    UNION
	-- Changed id_unit_base
	SELECT NEW.id_conversion, 'id_unit_base', OLD.id_unit_base, NEW.id_unit_base, NEW.id_change_set
		WHERE NOT OLD.id_unit_base <=> NEW.id_unit_base
    UNION
	-- Changed power_unit_base
	SELECT NEW.id_conversion, 'power_unit_base', OLD.power_unit_base, NEW.power_unit_base, NEW.id_change_set
		WHERE NOT OLD.power_unit_base <=> NEW.power_unit_base
    UNION
	-- Changed multiplier_unit_base
	SELECT NEW.id_conversion, 'multiplier_unit_base', OLD.multiplier_unit_base, NEW.multiplier_unit_base, NEW.id_change_set
		WHERE NOT OLD.multiplier_unit_base <=> NEW.multiplier_unit_base
    UNION
	-- Changed increment_unit_base
	SELECT NEW.id_conversion, 'active', OLD.increment_unit_base, NEW.increment_unit_base, NEW.id_change_set
		WHERE NOT OLD.increment_unit_base <=> NEW.increment_unit_base
    UNION
	-- Changed active
	SELECT NEW.id_conversion, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Unit_Measurement_Conversion
BEFORE UPDATE ON Shop_Unit_Measurement_Conversion
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Unit_Measurement_Conversion();

-- Shop Supplier Purchase Order

CREATE OR REPLACE FUNCTION before_insert_Shop_Supplier_Purchase_Order()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Supplier_Purchase_Order
BEFORE INSERT ON Shop_Supplier_Purchase_Order
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Supplier_Purchase_Order();


CREATE OR REPLACE FUNCTION before_update_Shop_Supplier_Purchase_Order()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Supplier_Purchase_Order_Audit (
		id_order,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	-- Changed id_supplier_ordered
	SELECT NEW.id_order, 'id_supplier_ordered', OLD.id_supplier_ordered, NEW.id_supplier_ordered, NEW.id_change_set
		WHERE NOT OLD.id_supplier_ordered <=> NEW.id_supplier_ordered
    UNION
	-- Changed cost_total_local
	SELECT NEW.id_order, 'cost_total_local', OLD.cost_total_local, NEW.cost_total_local, NEW.id_change_set
		WHERE NOT OLD.cost_total_local <=> NEW.cost_total_local
    UNION
	-- Changed id_currency_cost
	SELECT NEW.id_order, 'id_currency_cost', OLD.id_currency_cost, NEW.id_currency_cost, NEW.id_change_set
		WHERE NOT OLD.id_currency_cost <=> NEW.id_currency_cost
	/*
    UNION
	-- Changed latency_delivery
	SELECT NEW.id_order, 'latency_delivery', OLD.latency_delivery, NEW.latency_delivery, NEW.id_change_set
		WHERE NOT OLD.latency_delivery <=> NEW.latency_delivery
    UNION
	-- Changed quantity_ordered
	SELECT NEW.id_order, 'quantity_ordered', OLD.quantity_ordered, NEW.quantity_ordered, NEW.id_change_set
		WHERE NOT OLD.quantity_ordered <=> NEW.quantity_ordered
    UNION
	-- Changed id_unit_quantity
	SELECT NEW.id_order, 'id_unit_quantity', OLD.id_unit_quantity, NEW.id_unit_quantity, NEW.id_change_set
		WHERE NOT OLD.id_unit_quantity <=> NEW.id_unit_quantity
    UNION
	-- Changed quantity_received
	SELECT NEW.id_order, 'quantity_received', OLD.quantity_received, NEW.quantity_received, NEW.id_change_set
		WHERE NOT OLD.quantity_received <=> NEW.quantity_received
	*/
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Supplier_Purchase_Order
BEFORE UPDATE ON Shop_Supplier_Purchase_Order
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Supplier_Purchase_Order();


-- Shop Supplier Purchase Order Product Link

CREATE OR REPLACE FUNCTION before_insert_Shop_Supplier_Purchase_Order_Product_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Supplier_Purchase_Order_Product_Link
BEFORE INSERT ON Shop_Supplier_Purchase_Order_Product_Link
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Supplier_Purchase_Order_Product_Link();


CREATE OR REPLACE FUNCTION before_update_Shop_Supplier_Purchase_Order_Product_Link()
RETURNS	TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Supplier_Purchase_Order_Product_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	-- Changed id_order
	SELECT NEW.id_link, 'id_order', OLD.id_order, NEW.id_order, NEW.id_change_set
		WHERE NOT OLD.id_order <=> NEW.id_order
    UNION
	-- Changed id_permutation
	SELECT NEW.id_link, 'id_permutation', OLD.id_permutation, NEW.id_permutation, NEW.id_change_set
		WHERE NOT OLD.id_permutation <=> NEW.id_permutation
    UNION
	-- Changed cost_total_local
	SELECT NEW.id_link, 'cost_total_local', OLD.cost_total_local, NEW.cost_total_local, NEW.id_change_set
		WHERE NOT OLD.cost_total_local <=> NEW.cost_total_local
    UNION
	-- Changed id_currency_cost
	SELECT NEW.id_link, 'id_currency_cost', OLD.id_currency_cost, NEW.id_currency_cost, NEW.id_change_set
		WHERE NOT OLD.id_currency_cost <=> NEW.id_currency_cost
    UNION
	-- Changed quantity_ordered
	SELECT NEW.id_link, 'quantity_ordered', OLD.quantity_ordered, NEW.quantity_ordered, NEW.id_change_set
		WHERE NOT OLD.quantity_ordered <=> NEW.quantity_ordered
    UNION
	-- Changed id_unit_quantity
	SELECT NEW.id_link, 'id_unit_quantity', OLD.id_unit_quantity, NEW.id_unit_quantity, NEW.id_change_set
		WHERE NOT OLD.id_unit_quantity <=> NEW.id_unit_quantity
    UNION
	-- Changed quantity_received
	SELECT NEW.id_link, 'quantity_received', OLD.quantity_received, NEW.quantity_received, NEW.id_change_set
		WHERE NOT OLD.quantity_received <=> NEW.quantity_received
    UNION
	-- Changed latency_delivery_days
	SELECT NEW.id_link, 'latency_delivery_days', OLD.latency_delivery_days, NEW.latency_delivery_days, NEW.id_change_set
		WHERE NOT OLD.latency_delivery_days <=> NEW.latency_delivery_days
    UNION
	-- Changed display_order
	SELECT NEW.id_link, 'display_order', OLD.display_order, NEW.display_order, NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    UNION
	-- Changed active
	SELECT NEW.id_link, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Supplier_Purchase_Order_Product_Link
BEFORE UPDATE ON Shop_Supplier_Purchase_Order_Product_Link
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Supplier_Purchase_Order_Product_Link();

-- Shop Manufacturing Purchase Order

CREATE OR REPLACE FUNCTION before_insert_Shop_Manufacturing_Purchase_Order()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Manufacturing_Purchase_Order
BEFORE INSERT ON Shop_Manufacturing_Purchase_Order
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Manufacturing_Purchase_Order();


CREATE OR REPLACE FUNCTION before_update_Shop_Manufacturing_Purchase_Order()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Manufacturing_Purchase_Order_Audit (
		id_order,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	-- Changed cost_total_local
	SELECT NEW.id_order, 'cost_total_local', OLD.cost_total_local, NEW.cost_total_local, NEW.id_change_set
		WHERE NOT OLD.cost_total_local <=> NEW.cost_total_local
    UNION
	-- Changed value_produced_total_local
	SELECT NEW.id_order, 'value_produced_total_local', OLD.value_produced_total_local, NEW.value_produced_total_local, NEW.id_change_set
		WHERE NOT OLD.value_produced_total_local <=> NEW.value_produced_total_local
    UNION
	-- Changed id_currency_cost
	SELECT NEW.id_order, 'id_currency_cost', OLD.id_currency_cost, NEW.id_currency_cost, NEW.id_change_set
		WHERE NOT OLD.id_currency_cost <=> NEW.id_currency_cost
    UNION
	-- Changed active
	SELECT NEW.id_order, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Manufacturing_Purchase_Order
BEFORE UPDATE ON Shop_Manufacturing_Purchase_Order
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Manufacturing_Purchase_Order();

-- Shop Manufacturing Purchase Order Product Link

CREATE OR REPLACE FUNCTION before_insert_Shop_Manufacturing_Purchase_Order_Product_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Manufacturing_Purch_Order_Product_Link
BEFORE INSERT ON Shop_Manufacturing_Purchase_Order_Product_Link
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Manufacturing_Purchase_Order_Product_Link();


CREATE OR REPLACE FUNCTION before_update_Manufacturing_Purch_Order_Product_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Manufacturing_Purchase_Order_Product_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	-- Changed id_order
	SELECT NEW.id_link, 'id_order', OLD.id_order, NEW.id_order, NEW.id_change_set
		WHERE NOT OLD.id_order <=> NEW.id_order
    UNION
	-- Changed id_permutation
	SELECT NEW.id_link, 'id_permutation', OLD.id_permutation, NEW.id_permutation, NEW.id_change_set
		WHERE NOT OLD.id_permutation <=> NEW.id_permutation
    UNION
	-- Changed cost_total_local
	SELECT NEW.id_link, 'cost_total_local', OLD.cost_total_local, NEW.cost_total_local, NEW.id_change_set
		WHERE NOT OLD.cost_total_local <=> NEW.cost_total_local
    UNION
	-- Changed id_currency_cost
	SELECT NEW.id_link, 'id_currency_cost', OLD.id_currency_cost, NEW.id_currency_cost, NEW.id_change_set
		WHERE NOT OLD.id_currency_cost <=> NEW.id_currency_cost
    UNION
	-- Changed quantity_used
	SELECT NEW.id_link, 'quantity_used', OLD.quantity_used, NEW.quantity_used, NEW.id_change_set
		WHERE NOT OLD.quantity_used <=> NEW.quantity_used
    UNION
	-- Changed id_unit_quantity
	SELECT NEW.id_link, 'id_unit_quantity', OLD.id_unit_quantity, NEW.id_unit_quantity, NEW.id_change_set
		WHERE NOT OLD.id_unit_quantity <=> NEW.id_unit_quantity
    UNION
	-- Changed quantity_produced
	SELECT NEW.id_link, 'quantity_produced', OLD.quantity_produced, NEW.quantity_produced, NEW.id_change_set
		WHERE NOT OLD.quantity_produced <=> NEW.quantity_produced
    UNION
	-- Changed latency_manufacture_days
	SELECT NEW.id_link, 'latency_manufacture_days', OLD.latency_manufacture_days, NEW.latency_manufacture_days, NEW.id_change_set
		WHERE NOT OLD.latency_manufacture_days <=> NEW.latency_manufacture_days
    UNION
	-- Changed display_order
	SELECT NEW.id_link, 'display_order', OLD.display_order, NEW.display_order, NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    UNION
	-- Changed active
	SELECT NEW.id_link, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Manufacturing_Purch_Order_Product_Link
BEFORE UPDATE ON Shop_Manufacturing_Purchase_Order_Product_Link
FOR EACH ROW
EXECUTE FUNCTION before_update_Manufacturing_Purch_Order_Product_Link();


-- Shop Customer

CREATE OR REPLACE FUNCTION before_insert_Shop_Customer()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Customer
BEFORE INSERT ON Shop_Customer
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Customer();


CREATE OR REPLACE FUNCTION before_update_Shop_Customer()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Customer_Audit (
		id_customer,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	-- Changed name_company
	SELECT NEW.id_customer, 'name_company', OLD.name_company, NEW.name_company, NEW.id_change_set
		WHERE NOT OLD.name_company <=> NEW.name_company
    UNION
	-- Changed name_contact
	SELECT NEW.id_customer, 'name_contact', OLD.name_contact, NEW.name_contact, NEW.id_change_set
		WHERE NOT OLD.name_contact <=> NEW.name_contact
    UNION
	-- Changed department_contact
	SELECT NEW.id_customer, 'department_contact', OLD.department_contact, NEW.department_contact, NEW.id_change_set
		WHERE NOT OLD.department_contact <=> NEW.department_contact
    UNION
	-- Changed id_address
	SELECT NEW.id_customer, 'id_address', OLD.id_address, NEW.id_address, NEW.id_change_set
		WHERE NOT OLD.id_address <=> NEW.id_address
    UNION
	-- Changed phone_number
	SELECT NEW.id_customer, 'phone_number', OLD.phone_number, NEW.phone_number, NEW.id_change_set
		WHERE NOT OLD.phone_number <=> NEW.phone_number
    UNION
	-- Changed email
	SELECT NEW.id_customer, 'email', OLD.email, NEW.email, NEW.id_change_set
		WHERE NOT OLD.email <=> NEW.email
    UNION
	-- Changed id_currency
	SELECT NEW.id_customer, 'id_currency', OLD.id_currency, NEW.id_currency, NEW.id_change_set
		WHERE NOT OLD.id_currency <=> NEW.id_currency
    UNION
	-- Changed active
	SELECT NEW.id_customer, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Customer
BEFORE UPDATE ON Shop_Customer
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Customer();


-- Shop Customer Sales Order

CREATE OR REPLACE FUNCTION before_insert_Shop_Customer_Sales_Order()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Customer_Sales_Order
BEFORE INSERT ON Shop_Customer_Sales_Order
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Customer_Sales_Order();


CREATE OR REPLACE FUNCTION before_update_Shop_Customer_Sales_Order()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Customer_Sales_Order_Audit (
		id_order,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	-- Changed id_customer
	SELECT NEW.id_order, 'id_customer', OLD.id_customer, NEW.id_customer, NEW.id_change_set
		WHERE NOT OLD.id_customer <=> NEW.id_customer
    UNION
	-- Changed price_total_local
	SELECT NEW.id_order, 'price_total_local', OLD.price_total_local, NEW.price_total_local, NEW.id_change_set
		WHERE NOT OLD.price_total_local <=> NEW.price_total_local
    UNION
	-- Changed id_currency_price
	SELECT NEW.id_order, 'id_currency_price', OLD.id_currency_price, NEW.id_currency_price, NEW.id_change_set
		WHERE NOT OLD.id_currency_price <=> NEW.id_currency_price
	UNION
	-- Changed active
	SELECT NEW.id_order, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Customer_Sales_Order
BEFORE UPDATE ON Shop_Customer_Sales_Order
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Customer_Sales_Order();

-- Shop Customer Sales Order Product Link

CREATE OR REPLACE FUNCTION before_insert_Shop_Customer_Sales_Order_Product_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_Customer_Sales_Order_Product_Link
BEFORE INSERT ON Shop_Customer_Sales_Order_Product_Link
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_Customer_Sales_Order_Product_Link();


CREATE OR REPLACE FUNCTION before_update_Shop_Customer_Sales_Order_Product_Link()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_Customer_Sales_Order_Product_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	-- Changed id_order
	SELECT NEW.id_link, 'id_order', OLD.id_order, NEW.id_order, NEW.id_change_set
		WHERE NOT OLD.id_order <=> NEW.id_order
    UNION
	-- Changed id_permutation
	SELECT NEW.id_link, 'id_permutation', OLD.id_permutation, NEW.id_permutation, NEW.id_change_set
		WHERE NOT OLD.id_permutation <=> NEW.id_permutation
    UNION
	-- Changed price_total_local
	SELECT NEW.id_link, 'price_total_local', OLD.price_total_local, NEW.price_total_local, NEW.id_change_set
		WHERE NOT OLD.price_total_local <=> NEW.price_total_local
    UNION
	-- Changed id_currency_price
	SELECT NEW.id_link, 'id_currency_price', OLD.id_currency_price, NEW.id_currency_price, NEW.id_change_set
		WHERE NOT OLD.id_currency_price <=> NEW.id_currency_price
    UNION
	-- Changed quantity_ordered
	SELECT NEW.id_link, 'quantity_ordered', OLD.quantity_ordered, NEW.quantity_ordered, NEW.id_change_set
		WHERE NOT OLD.quantity_ordered <=> NEW.quantity_ordered
    UNION
	-- Changed id_unit_quantity
	SELECT NEW.id_link, 'id_unit_quantity', OLD.id_unit_quantity, NEW.id_unit_quantity, NEW.id_change_set
		WHERE NOT OLD.id_unit_quantity <=> NEW.id_unit_quantity
    UNION
	-- Changed quantity_delivered
	SELECT NEW.id_link, 'quantity_delivered', OLD.quantity_delivered, NEW.quantity_delivered, NEW.id_change_set
		WHERE NOT OLD.quantity_delivered <=> NEW.quantity_delivered
    UNION
	-- Changed latency_delivery_days
	SELECT NEW.id_link, 'latency_delivery_days', OLD.latency_delivery_days, NEW.latency_delivery_days, NEW.id_change_set
		WHERE NOT OLD.latency_delivery_days <=> NEW.latency_delivery_days
    UNION
	-- Changed display_order
	SELECT NEW.id_link, 'display_order', OLD.display_order, NEW.display_order, NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    UNION
	-- Changed active
	SELECT NEW.id_link, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_Customer_Sales_Order_Product_Link
BEFORE UPDATE ON Shop_Customer_Sales_Order_Product_Link
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_Customer_Sales_Order_Product_Link();

/*

CALL p_shop_user_eval (
	gen_random_uuid(), -- a_guid
	'', 	-- a_id_user
	0,		-- a_get_inactive_users
    '1',	-- a_ids_permission
    '',		-- a_ids_access_level
	'1'		-- a_ids_product
)

*/

CREATE OR REPLACE PROCEDURE p_shop_user_eval (
	IN a_guid UUID,
    IN a_id_user INTEGER,
    IN a_get_inactive_users BOOLEAN,
    IN a_ids_permission INTEGER[],
    IN a_ids_access_level INTEGER[],
    IN a_ids_product INTEGER[] -- VARCHAR(4000) -- IN a_ids_permutation VARCHAR(4000)
	/*
	OUT result_errors TABLE (
		guid UUID,
		id_type INTEGER,
		code VARCHAR(50),
		msg VARCHAR(4000)
	)
	*/
	-- INOUT a_error_msg TEXT
)
AS $$
DECLARE
	v_guid UUID;
    v_id_user INTEGER;
    v_get_inactive_users BOOLEAN;
    v_ids_permission INTEGER[];
    v_ids_access_level INTEGER[];
    v_ids_product INTEGER[]; -- TEXT; -- VARCHAR(4000); -- IN a_ids_permutation VARCHAR(4000)
    v_has_filter_user BOOLEAN;
    v_has_filter_permission BOOLEAN;
    v_has_filter_access_level BOOLEAN;
    -- v_has_filter_permutation BOOLEAN;
    v_has_filter_product BOOLEAN;
    v_id_permission_product INTEGER;
    v_id_permission INTEGER;
    -- v_ids_product UUID;
    v_id_access_level_view INTEGER;
    -- v_id_access_level_product_required INTEGER;
    v_priority_access_level_view INTEGER;
    v_priority_access_level_edit INTEGER;
    v_priority_access_level_admin INTEGER;
    v_id_access_level INTEGER;
    v_priority_access_level INTEGER;
    v_now TIMESTAMP;
	v_ids_row_delete UUID;
    v_code_error_data VARCHAR(200);
    v_id_error_data INTEGER;
    v_code_error_permission VARCHAR(200);
    -- result_errors REFCURSOR;
	-- v_error_msg TEXT := NULL;
BEGIN
	-- Parse arguments + get default values
    v_guid := COALESCE(a_guid, gen_random_uuid());
	v_id_user := CASE WHEN a_id_user IS NULL THEN '' ELSE TRIM(a_id_user) END;
	v_get_inactive_users := COALESCE(a_get_inactive_users, FALSE);
	v_ids_permission := COALESCE(a_ids_permission, ARRAY[]::INTEGER[]);
	v_ids_access_level := COALESCE(a_ids_access_level, ARRAY[]::INTEGER[]);
	-- v_ids_permutation := CASE WHEN a_ids_permutation IS NULL THEN '' ELSE TRIM(a_ids_permutation) END;
	v_ids_product := COALESCE(a_ids_product, ARRAY[]::INTEGER[]);
    
    v_id_error_data := 1;
    v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = v_id_error_data);
    
    v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
    
    v_has_filter_user := (v_id_user <= 0);
    v_has_filter_permission := (CARDINALITY(v_ids_permission) > 0);
    v_has_filter_access_level := (CARDINALITY(v_ids_access_level) > 0);
    /*
    v_has_filter_permutation := CASE WHEN v_ids_permutation = '' THEN FALSE ELSE TRUE END;
    */
    v_has_filter_product := (CARDINALITY(v_ids_product) = 0);
    v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    v_priority_access_level_view := (SELECT priority FROM Shop_Access_Level WHERE id_access_level = v_id_access_level_view);
    v_priority_access_level_edit := (SELECT priority FROM Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    v_priority_access_level_admin := (SELECT priority FROM Shop_Access_Level WHERE code = 'ADMIN' LIMIT 1);

	v_id_permission_product := (SELECT v_id_permission FROM Shop_Permission WHERE code = 'SHOP_PRODUCT' LIMIT 1);

	-- Clear previous proc results
	-- DROP TABLE IF EXISTS tmp_User_Role_Link;
	-- DROP TEMPORARY TABLE IF EXISTS tmp_User_Role_Link;
	DROP TABLE IF EXISTS tmp_Shop_Product_p_Shop_User_Eval;
	-- DROP TABLE IF EXISTS Shop_User_Eval_Temp;
    
    
    -- Permanent Table
	CREATE TABLE IF NOT EXISTS Shop_User_Eval_Temp (
		id_row INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
		guid UUID NOT NULL,
		id_user INTEGER,
		CONSTRAINT FK_Shop_User_Eval_Temp_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User (id_user),
		id_permission_required INTEGER NOT NULL,
		CONSTRAINT FK_Shop_User_Eval_Temp_id_permission_required
			FOREIGN KEY (id_permission_required)
			REFERENCES Shop_Permission (id_permission),
		/*
		id_access_level_required INTEGER NOT NULL,
		CONSTRAINT FK_Shop_User_Eval_Temp_id_access_level_required
			FOREIGN KEY (id_access_level_required)
			REFERENCES Shop_Access_Level (id_access_level),
		*/
		priority_access_level_required INTEGER NOT NULL,
        /*
		CONSTRAINT FK_Shop_User_Eval_Temp_priority_access_level_required
			FOREIGN KEY (priority_access_level_required)
			REFERENCES Shop_Access_Level (priority),
		*/
		id_product INTEGER NULL,
		CONSTRAINT FK_Shop_User_Eval_Temp_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product (id_product),
		/*
		id_permutation INTEGER NULL,
		CONSTRAINT FK_Shop_User_Eval_Temp_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES parts.Shop_Product_Permutation (id_permutation),
		*/
        is_super_user BOOLEAN NULL,
		priority_access_level_user INTEGER NULL,
        /*
		CONSTRAINT FK_Shop_User_Eval_Temp_priority_access_level_minimum
			FOREIGN KEY (priority_access_level_minimum)
			REFERENCES Shop_Access_Level (priority)
		*/
		can_view BOOLEAN,
		can_edit BOOLEAN,
		can_admin BOOLEAN, -- DEFAULT 0
		name_error VARCHAR(200) NULL
	);
	
	-- Temporary tables
	CREATE TEMPORARY TABLE tmp_Shop_Product_p_Shop_User_Eval (
		id_row INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
		id_product INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Product_p_Shop_User_Eval_id_product FOREIGN KEY (id_product)
			REFERENCES Shop_Product (id_product),
		/*
		id_permutation INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Product_p_Shop_User_Eval_id_permutation 
			FOREIGN KEY (id_permutation)
			REFERENCES parts.Shop_Product_Permutation (id_permutation),
		*/
        id_access_level_required INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Product_p_Shop_User_Eval_id_access_level_required 
			FOREIGN KEY (id_access_level_required)
			REFERENCES Shop_Access_Level (id_access_level),
		guid UUID NOT NULL,
        rank_product INTEGER NOT NULL
	);
	
	/*
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		id_type INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
	*/

    
    -- Permission IDs
	IF v_has_filter_permission THEN
		-- CALL p_split(v_ids_permission, ',');
		
		-- Invalid
		IF EXISTS (
			SELECT UNNEST(v_ids_permission) AS id_permission 
			EXCEPT 
			SELECT id_permission FROM Shop_Permission 
		) THEN -- (SELECT PERM.id_permission FROM Split_Temp ST LEFT JOIN Shop_Permission PERM ON ST.substring = PERM.id_permission WHERE ISNULL(PERM.id_permission)) THEN
			/*
			INSERT INTO tmp_Msg_Error (
				guid,
				id_type,
				code,
				msg
			)
			SELECT
				v_guid,
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
				v_code_error_data, 
				'Invalid permission IDs: ' || COALESCE(STRING_AGG(ST.substring, ', '), 'NULL')
			FROM Split_Temp ST 
			LEFT JOIN Shop_Permission PERM ON ST.substring = PERM.id_permission 
			WHERE ISNULL(PERM.id_permission)
			;
			*/
			RAISE EXCEPTION 'Invalid permission IDs: %', (
				SELECT STRING_AGG(id_permission, ', ') 
				FROM (
					SELECT UNNEST(v_ids_permission) AS id_permission 
					EXCEPT 
					SELECT id_permission FROM Shop_Permission 
				) Permission
			)
			USING ERRCODE = '22000'
			;
		END IF;
		
		-- Inactive
		IF EXISTS (
			SELECT UNNEST(v_ids_permission) AS id_permission 
			EXCEPT 
			SELECT id_permission FROM Shop_Permission 
			WHERE active
		) THEN -- (SELECT PERM.id_permission FROM Split_Temp ST INNER JOIN Shop_Permission PERM ON ST.substring = PERM.id_permission WHERE PERM.active = FALSE) THEN
			/*
			INSERT INTO tmp_Msg_Error (
				guid,
				id_type,
				code,
				msg
			)
			SELECT
				v_guid,
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
				v_code_error_data, 
				'The following permissions are not active: ' || COALESCE(STRING_AGG(ST.substring, ', '), 'NULL')
			FROM Split_Temp ST 
			INNER JOIN Shop_Permission PERM ON ST.substring = PERM.id_permission 
			WHERE PERM.active = FALSE
			;
			*/
			RAISE EXCEPTION 'Inactive permission IDs: %', (
				SELECT STRING_AGG(id_permission, ', ') 
				FROM (
					SELECT UNNEST(v_ids_permission) AS id_permission 
					EXCEPT 
					SELECT id_permission FROM Shop_Permission
					WHERE active
				) Permission
			)
			USING ERRCODE = '22000'
			;
		END IF;

		-- Get the permission with the highest priority access level required
		v_id_permission := (
			SELECT PERMS.id_permission 
			FROM (
				SELECT PERM2.id_permission
				FROM Split_Temp ST 
				INNER JOIN Shop_Permission PERM2 ON ST.substring = PERM2.id_permission
				WHERE PERM.active 
				UNION
				SELECT v_id_permission_product
			) PERMS
			INNER JOIN Shop_Permission PERM1 ON PERMS.id_permission = PERM1.id_permission
			INNER JOIN Shop_Access_Level AL ON PERM1.id_access_level_required = AL.id_access_level
			ORDER BY AL.priority ASC
			LIMIT 1
		);
		
		-- DROP TABLE Split_Temp;
	ELSIF v_has_filter_product THEN
		v_id_permission := v_id_permission_product;
	ELSE
		/*
		INSERT INTO tmp_Msg_Error (
			guid,
			id_type,
			code,
			msg
		)
		VALUES (
			v_guid,
			(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
			v_code_error_data, 
			'Permission ID required'
		)
		;
		*/
		RAISE EXCEPTION 'Permission ID required.'
		USING ERRCODE = '22000'
		;
	END IF;
    
	-- access level
	IF v_has_filter_access_level THEN
		IF EXISTS (
			/*
			SELECT ST.substring 
			FROM Split_Temp ST 
			LEFT JOIN Shop_Access_Level AL 
			ON ST.substring = AL.id_access_level
			WHERE 
				ISNULL(AL.id_access_level)
				OR AL.active = FALSE
			*/
			SELECT UNNEST(v_ids_access_level) AS id_access_level 
			EXCEPT
			SELECT id_access_level FROM Shop_Access_Level
		) THEN
			/*
			INSERT INTO tmp_Msg_Error (
				guid,
				id_type,
				code,
				msg
			)
			SELECT
				v_guid,	
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
				v_code_error_data, 
				'Invalid access level IDs: ' || STRING_AGG(ST.substring, ', ')
			FROM Split_Temp ST 
			LEFT JOIN Shop_Access_Level AL ON ST.substring = AL.id_access_level
			WHERE ISNULL(AL.id_access_level)
			;
			*/
			RAISE EXCEPTION 'Invalid access level IDs: %', (
				SELECT STRING_AGG(id_access_level, ', ') 
				FROM (
					SELECT UNNEST(v_ids_access_level) AS id_access_level 
					EXCEPT 
					SELECT id_access_level FROM Shop_Access_Level 
				) AL
			)
			USING ERRCODE = '22000'
			;
		END IF;
		
		IF EXISTS (
			SELECT UNNEST(v_ids_access_level) AS id_access_level 
			EXCEPT
			SELECT id_access_level FROM Shop_Access_Level
			WHERE active
		) THEN
			RAISE EXCEPTION 'Inactive access level IDs: %', (
				SELECT STRING_AGG(id_access_level, ', ') 
				FROM (
					SELECT UNNEST(v_ids_access_level) AS id_access_level 
					EXCEPT 
					SELECT id_access_level FROM Shop_Access_Level
				) AL
			)
			USING ERRCODE = '22000'
			;
		END IF;

		v_id_access_level := (
			SELECT AL.id_access_level 
			FROM Shop_Access_Level AL 
			WHERE 
				AL.active
				AND AL.id_access_level = ANY(v_ids_access_level)
			ORDER BY AL.priority ASC 
			LIMIT 1
		);
	ELSE
		v_id_access_level := (
			SELECT id_access_level_required AS id_access_level
			FROM (
				SELECT id_access_level 
				FROM Shop_Permission PERM
				WHERE 
					PERM.id_permission = v_id_permission
				UNION
				SELECT v_id_access_level_view AS id_access_level
			) PERMS
			INNER JOIN Shop_Access_Level AL ON PERMS.id_access_level = AL.id_access_level
			ORDER BY AL.priority ASC
			LIMIT 1
		); -- v_id_access_level_view;
	END IF;

	v_priority_access_level := (SELECT priority FROM Shop_Access_Level WHERE id_access_level = v_id_access_level);

    -- Invalid user ID
	IF v_has_filter_user THEN
		IF ISNULL((SELECT id_user FROM Shop_User WHERE id_user = v_id_user)) THEN -- NOT v_has_filter_user THEN
			/*
			INSERT INTO tmp_Msg_Error (
				guid,
				id_type,
				code,
				msg
			)
			VALUES (
				v_guid,
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
				v_code_error_data, 
				'Invalid user ID: ' || COALESCE(v_id_user, 'NULL')
			)
			;
			*/
			RAISE EXCEPTION 'Invalid user ID: %', v_id_user
			USING ERRCODE = '22000'
			;
		END IF;
		
		IF ISNULL((SELECT id_user FROM Shop_User WHERE id_user = v_id_user AND active)) THEN
			RAISE EXCEPTION 'Inactive user ID: %', v_id_user
			USING ERRCODE = '22000'
			;
		END IF;
	END IF;
    

	-- Invalid products
	IF v_has_filter_product THEN
		-- Invalid product IDs
		IF EXISTS (
			SELECT UNNEST(v_ids_product) AS id_product 
			EXCEPT 
			SELECT id_product FROM Shop_Product
		) THEN -- (SELECT * FROM Split_Temp ST LEFT JOIN Shop_Product P ON ST.substring = P.id_product WHERE ISNULL(P.id_product)) THEN 
			/*
			INSERT INTO tmp_Msg_Error (
				guid,
				id_type,
				code,
				msg
			)
			SELECT
				v_guid,
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
				v_code_error_data, 
				'Invalid product IDs: ' || COALESCE(STRING_AGG(ST.substring, ', '), 'NULL')
			FROM Split_Temp ST 
			LEFT JOIN Shop_Product P ON ST.substring = P.id_product 
			WHERE ISNULL(P.id_product)
			;
			*/
			RAISE EXCEPTION 'Invalid product IDs: %', (
				SELECT STRING_AGG(id_product, ', ') 
				FROM (
					SELECT UNNEST(v_ids_product) AS id_product 
					EXCEPT 
					SELECT id_product FROM Shop_Product 
				) Product
			)
			USING ERRCODE = '22000'
			;
		END IF;
		
		INSERT INTO tmp_Shop_Product_p_Shop_User_Eval (
			id_product,
			-- id_permutation,
			id_access_level_required,
			guid,
			rank_product -- rank_permutation
		)
		SELECT 
			DISTINCT P.id_product,
			-- PP.id_permutation,
			P.id_access_level_required,
			v_guid,
			RANK() OVER (ORDER BY C.display_order, P.display_order) AS rank_product
		FROM Shop_Product P -- ON ST.substring = P.id_product -- Shop_Product_Permutation PP
		INNER JOIN Shop_Product_Category C ON P.id_category = C.id_category
		INNER JOIN Shop_Access_Level AL
			ON P.id_access_level_required = AL.id_access_level
				AND AL.active
		WHERE -- FIND_IN_SET(P.id_product, v_ids_product) > 0 -- FIND_IN_SET(PP.id_permutation, v_ids_permutation) > 0
			P.id_product = ANY(v_ids_product)
			-- AND P.active -- not worried as we want users to be able to see their order history
		;
		/*
		DELETE FROM tmp_Shop_Product_p_Shop_User_Eval
		WHERE rank_permutation > 1
		;
		*/
		-- v_has_filter_product := EXISTS (SELECT * FROM tmp_Shop_Product_p_Shop_User_Eval WHERE v_guid = guid);
	END IF;

	-- User permissions
	/*
	IF v_has_filter_product THEN
		INSERT INTO Shop_User_Eval_Temp (
			guid,
			id_user,
			id_permission_required,
			id_product,
			-- id_permutation,
			priority_access_level_required,
			priority_access_level_user,
			is_super_user,
			can_view,
			can_edit,
			can_admin
		)
		SELECT 
			v_guid, 
			v_id_user, 
			v_id_permission AS id_permission_required,
			P.id_product, 
			-- t_P.id_permutation, 
			CASE WHEN v_priority_access_level <= AL_P.priority THEN v_priority_access_level ELSE AL_P.priority END AS priority_access_level_required,
			AL_U.priority AS priority_access_level_user,
			U.is_super_user,
			CASE WHEN U.is_super_user THEN TRUE ELSE CASE WHEN NOT ISNULL(AL_U.priority) AND AL_U.priority <= v_priority_access_level_view AND AL_U.priority <= priority_access_level_required THEN TRUE ELSE FALSE END END AS can_view,
			CASE WHEN U.is_super_user THEN TRUE ELSE CASE WHEN NOT ISNULL(AL_U.priority) AND AL_U.priority <= v_priority_access_level_edit AND AL_U.priority <= priority_access_level_required THEN TRUE ELSE FALSE END END AS can_edit,
			CASE WHEN U.is_super_user THEN TRUE ELSE CASE WHEN NOT ISNULL(AL_U.priority) AND AL_U.priority <= v_priority_access_level_admin AND AL_U.priority <= priority_access_level_required THEN TRUE ELSE FALSE END END AS can_admin
		FROM Shop_User U
			/*
			ON U.id_user = v_id_user
			AND U.active
			*/
		LEFT JOIN Shop_User_Role_Link URL
			ON U.id_user = URL.id_user
			AND URL.active
		LEFT JOIN Shop_Role_Permission_Link RPL
			ON URL.id_role = RPL.id_role
			AND RPL.active
		INNER JOIN Shop_Access_Level AL_U
			ON RPL.id_access_leveL = AL_U.id_access_level
			AND AL_U.active
		INNER JOIN tmp_Shop_Product_p_Shop_User_Eval t_P
			ON t_P.guid = v_guid
			AND AL.id_access_level = t_P.id_access_leveL_required
		INNER JOIN Shop_Access_Level AL_P
			ON t_P.id_access_leveL_required = AL_P.id_access_level
			AND AL_P.active
		WHERE 
			v_guid = t_P.guid
			AND U.active
			AND U.id_user = v_id_user
		;
	ELSE
		INSERT INTO Shop_User_Eval_Temp (--UE_T
			guid,
			id_user,
			id_permission_required,
			priority_access_level_required,
			priority_access_level_user,
			is_super_user,
			can_view,
			can_edit,
			can_admin
		)
		SELECT 
			v_guid,
			v_id_user,
			v_id_permission AS id_permission_required,
			v_priority_access_level AS priority_access_level_required,
			AL.priority AS priority_access_level_user,
			U.is_super_user,
			CASE WHEN U.is_super_user THEN TRUE ELSE CASE WHEN NOT ISNULL(AL.priority) AND AL.priority <= v_priority_access_level_view AND AL.priority <= v_priority_access_level THEN TRUE ELSE FALSE END END AS can_view,
			CASE WHEN U.is_super_user THEN TRUE ELSE CASE WHEN NOT ISNULL(AL.priority) AND AL.priority <= v_priority_access_level_edit AND AL.priority <= v_priority_access_level THEN TRUE ELSE FALSE END END AS can_edit,
			CASE WHEN U.is_super_user THEN TRUE ELSE CASE WHEN NOT ISNULL(AL.priority) AND AL.priority <= v_priority_access_level_admin AND AL.priority <= v_priority_access_level THEN TRUE ELSE FALSE END END AS can_admin
		FROM Shop_User U
		INNER JOIN Shop_User_Role_Link URL
			ON U.id_user = URL.id_user
			AND URL.active
		INNER JOIN Shop_Role_Permission_Link RPL
			ON URL.id_role = RPL.id_role
			AND RPL.active
		INNER JOIN Shop_Access_Level AL
			ON RPL.id_access_level = AL.id_access_level
			AND AL.active
		WHERE 
			U.id_user = v_id_user
			AND U.active
			AND RPL.id_permission = v_id_permission
		ORDER BY AL.priority ASC
		;
	END IF;
    */
	INSERT INTO Shop_User_Eval_Temp (--UE_T
		guid,
		id_user,
		id_permission_required,
		id_product,
		priority_access_level_required,
		priority_access_level_user,
		is_super_user,
		can_view,
		can_edit,
		can_admin,
		name_error
	)
	SELECT 
		v_guid,
		v_id_user,
		v_id_permission AS id_permission_required,
		t_P.id_product,
		MIN(v_priority_access_level, AL_P.priority) AS priority_access_level_required,
		AL_U.priority AS priority_access_level_user,
		U.is_super_user,
		(U.is_super_user AND NOT ISNULL(priority_access_level_user) AND priority_access_level_user <= v_priority_access_level_view AND priority_access_level_user <= priority_access_level_required) AS can_view,
		(U.is_super_user AND NOT ISNULL(priority_access_level_user) AND priority_access_level_user <= v_priority_access_level_edit AND priority_access_level_user <= priority_access_level_required) AS can_edit,
		(U.is_super_user AND NOT ISNULL(priority_access_level_user) AND priority_access_level_user <= v_priority_access_level_admin AND priority_access_level_user <= priority_access_level_required) AS can_admin,
		Permission.name || ' ' || (SELECT name FROM Shop_Access_Level WHERE priority = priority_access_level_required ORDER BY id_access_level ASC LIMIT 1) || ' permissions' || CASE WHEN ISNULL(t_P.id_product) THEN '' ELSE ' for product ' || P.name END AS name_error
	FROM Shop_User U
	INNER JOIN Shop_User_Role_Link URL
		ON U.id_user = URL.id_user
		AND URL.active
	INNER JOIN Shop_Role_Permission_Link RPL
		ON URL.id_role = RPL.id_role
		AND RPL.active
	INNER JOIN Shop_Access_Level AL_U
		ON RPL.id_access_level = AL_U.id_access_level
		AND AL_U.active
	INNER JOIN Shop_Permission Permission
		ON RPL.id_permission = Permission.id_permission
		AND Permission.active
	CROSS JOIN tmp_Shop_Product_p_Shop_User_Eval t_P -- ON t_P.guid = v_guid
	INNER JOIN Shop_Product P ON t_P.id_product = P.id_product
	INNER JOIN Shop_Access_Level AL_P
		ON t_P.id_access_level_required = AL_P.id_access_level
		-- AND AL_P.active
	WHERE 
		U.id_user = v_id_user
		AND U.active
		AND RPL.id_permission = v_id_permission
		AND t_P.guid = v_guid
	ORDER BY AL_P.priority ASC, t_P.rank_product ASC
	;

    -- IF EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = v_guid) THEN
	/*
	OPEN result_errors FOR
		SELECT * 
		FROM tmp_Msg_Error 
		WHERE GUID = v_guid
		;
	-- RETURN NEXT result_errors;
    -- result_errors 
	a_error_msg := (
		SELECT 
			-- GUID, id_type, code, 
			msg
		FROM tmp_Msg_Error
		WHERE GUID = v_guid
		LIMIT 1
	);
	*/

    -- select * from tmp_Shop_Product_p_Shop_User_Eval;
    -- Clean up
	DROP TABLE IF EXISTS tmp_Shop_Product_p_Shop_User_Eval;
    -- DROP TEMPORARY TABLE IF EXISTS tmp_User_Role_Link;
    -- DROP TABLE IF EXISTS tmp_Msg_Error;
END;
$$ LANGUAGE plpgsql;


/*

CALL p_shop_user_eval (
	'56c9dfc1-e22f-11ee-aab4-b42e9986184a', -- v_guid
	'', 	-- v_id_user -- 'auth0|6582b95c895d09a70ba10fef',
	false,		-- v_get_inactive_users
    '4,5',	-- v_ids_permission
    '1',		-- v_ids_access_level
	-- null,		-- v_ids_product
    '1,2,3'		-- v_ids_permutation
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
	*/
	AL.priority, -- MIN(AL.priority),
	U.is_super_user
	/*
	CASE WHEN U.is_super_user THEN TRUE ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_view THEN TRUE ELSE FALSE END END,
	CASE WHEN U.is_super_user THEN TRUE ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_edit THEN TRUE ELSE FALSE END END,
	CASE WHEN U.is_super_user THEN TRUE ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_admin THEN TRUE ELSE FALSE END END
	*/
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
	-- ON P.id_access_level_required = AL.id_access_level
    ON RPL.id_access_level = AL.id_access_level
		AND AL.active
WHERE U.id_user = 'auth0|6582b95c895d09a70ba10fef'
	AND U.active
	AND FIND_IN_SET(P.id_permission, '1,2') > 0
	-- AND v_id_access_level = AL.id_access_leveld
-- GROUP BY U.id_user, P.id_permission, AL.id_access_level -- , is_super_user

*/



-- DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order_Product_Link;
-- DROP TABLE IF EXISTS tmp_Msg_Error;

CREATE OR REPLACE PROCEDURE p_shop_save_supplier_purchase_order (
	IN a_guid UUID,
    IN a_id_user INTEGER,
    IN a_comment UUID,
    IN a_id_order INTEGER,
    IN a_id_supplier_ordered INTEGER,
    IN a_id_currency_cost INTEGER,
    IN a_active BOOLEAN
)
AS $$
DECLARE
	v_guid UUID;
    v_id_user INTEGER;
	v_comment VARCHAR(4000);
    v_id_order INTEGER;
    v_id_supplier_ordered INTEGER;
    v_id_currency_cost INTEGER;
    v_active BOOLEAN;
    v_id_error_type_bad_data INTEGER;
    v_code_error_type_bad_data VARCHAR(50);
    v_id_error_type_no_permission INTEGER;
    v_code_error_type_no_permission VARCHAR(50);
    v_guid_permission UUID;
    -- v_id_user VARCHAR(100);
    v_id_permission_supplier_purchase_order INTEGER;
	v_id_access_level_EDIT INTEGER;
    v_ids_product VARCHAR(4000);
    v_ids_product_no_permission VARCHAR(4000);
    -- v_id_order_new INTEGER;
    v_id_change_set INTEGER;
    v_is_new_supplier_purchase_order BOOLEAN;
	-- result_orders REFCURSOR;
	-- result_order_product_links REFCURSOR;
	-- result_errors REFCURSOR;
BEGIN
	-- SET SESSION sql_mode = sys.list_drop(@@session.sql_mode, 'ONLY_FULL_GROUP_BY');
    
	v_guid := COALESCE(a_guid, gen_random_uuid());
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_comment := TRIM(COALESCE(a_comment, ''));
	v_id_order := COALESCE(a_id_order, -1);
	v_id_supplier_ordered := a_id_supplier_ordered;
	v_id_currency_cost := a_id_currency_cost;
	v_active := COALESCE(a_active, FALSE); 
    
    v_code_error_type_bad_data = 'BAD_DATA';
    v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_bad_data LIMIT 1);
    v_code_error_type_no_permission = 'NO_PERMISSION';
    v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_no_permission LIMIT 1);
	v_guid_permission = gen_random_uuid();
	-- v_id_user = CURRENT_USER;
	v_id_permission_supplier_purchase_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_SUPPLIER_PURCHASE_ORDER' LIMIT 1);
	v_id_access_level_EDIT := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT');
		
	v_is_new_supplier_purchase_order := CASE WHEN v_id_order <= 0 THEN TRUE ELSE FALSE END;
    
    -- Temporary tables
    /*
    CREATE TABLE tmp_Shop_Supplier_Purchase_Order (
		id_order INTEGER NOT NULL PRIMARY KEY,
		id_supplier_ordered INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Supplier_Purchase_Order_id_supplier_ordered
			FOREIGN KEY (id_supplier_ordered) 
			REFERENCES Shop_Supplier(id_supplier),
		cost_total_local REAL NOT NULL,
		id_currency_cost INTEGER NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Supplier_Purchase_Order_Product_Link (
		id_link INTEGER NOT NULL PRIMARY KEY,
		id_order INTEGER NOT NULL,
        /*
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_Supplier_Purchase_Order(id_order),
		*/
        id_permutation INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		cost_total_local REAL NOT NULL,
		id_currency_cost INTEGER NOT NULL,
		quantity_ordered REAL NOT NULL,
		id_unit_quantity INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_received REAL NULL,
		latency_delivery_days INTEGER NOT NULL,
		display_order INTEGER NOT NULL,
        active BOOLEAN NOT NULL,
        name_error VARCHAR(200) NOT NULL
    );
    
	/*
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		id_type INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    */

    
    -- Argument validation
    -- User ID
	IF NOT EXISTS (SELECT * FROM Shop_User WHERE id_user = v_id_user) THEN
		RAISE EXCEPTION 'Invalid User ID: %', COALESCE(v_id_user, 'NULL')
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Order ID
	IF ((v_id_order > 0) AND NOT EXISTS (SELECT * FROM Shop_Supplier_Purchase_Order WHERE id_order = v_id_order)) THEN
		RAISE EXCEPTION 'Invalid Supplier Purchase Order ID: %', COALESCE(v_id_order, 'NULL')
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Supplier ID
	IF ISNULL(v_id_supplier_ordered) OR NOT EXISTS (SELECT * FROM Shop_Supplier WHERE id_supplier = v_id_supplier_ordered) THEN
		RAISE EXCEPTION 'Invalid Supplier ID: %', COALESCE(v_id_supplier_ordered, 'NULL')
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Currency ID
	IF ISNULL(v_id_currency_cost) OR NOT EXISTS (SELECT * FROM Shop_Currency WHERE id_currency = v_id_currency_cost) THEN
		RAISE EXCEPTION 'Invalid currency ID: %', COALESCE(v_id_currency, 'NULL')
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Comment
	IF v_comment = '' THEN
		RAISE EXCEPTION 'A comment must be provided.'
		USING ERRCODE = '22000'
		;
	END IF;
    

	-- Get data from Temp table		
	INSERT INTO tmp_Shop_Supplier_Purchase_Order_Product_Link (
		id_link, 
		id_order, 
		id_permutation, 
		cost_total_local, 
		id_currency_cost, 
		quantity_ordered, 
		id_unit_quantity, 
		quantity_received, 
		latency_delivery_days, 
		display_order, 
		active,
		name_error
	)
	SELECT 
		SPOPL_T.id_link, 
		SPOPL_T.id_order, 
		SPOPL_T.id_permutation, 
		PP.cost_local * quantity_ordered AS cost_total_local, 
		SPOPL_T.id_currency_cost, 
		SPOPL_T.quantity_ordered, 
		SPOPL_T.id_unit_quantity, 
		SPOPL_T.quantity_received, 
		SPOPL_T.latency_delivery_days, 
		SPOPL_T.display_order, 
		SPOPL_T.active,
		CAST(PP.id_permutation AS VARCHAR(10)) || ' - ' || COALESCE(PP.name ,'') AS name_error
	FROM Shop_Supplier_Purchase_Order_Product_Link_Temp SPOPL_T
	INNER JOIN Shop_Product_Permutation PP ON SPOPL_T.id_permutation = PP.id_permutation
	WHERE SPOPL_T.GUID = v_guid
	;
	DELETE FROM Shop_Supplier_Purchase_Order_Product_Link_Temp SPOPL_T
	WHERE SPOPL_T.GUID = v_guid
	;
	
	/*
	UPDATE tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
	
		cost_total_local
	*/
    
    -- Invalid quantity ordered
	IF EXISTS (
		SELECT * 
		FROM tmp_Shop_Supplier_Purchase_Order_Product_Link 
		WHERE 
			NOT ISNULL(quantity_ordered)
			AND quantity_ordered < 0
	) THEN
		RAISE EXCEPTION 'Invalid quantity ordered property for the following permutations: %', (
			SELECT STRING_AGG(t_SPOPL.name_error, ', ')
			FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
			-- INNER JOIN Shop_Product_Permutation PP ON t_SPOPL.id_permutation = PP.id_permutation
			WHERE t_SPOPL.quantity_ordered < 0
			)
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Duplicates
	IF EXISTS (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL GROUP BY id_permutation HAVING COUNT(*) > 1) THEN 
		RAISE EXCEPTION 'Duplicate records: %', || (
			SELECT STRING_AGG(t_SPOPLC.name_error, ', ')
			FROM (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL GROUP BY id_permutation HAVING COUNT(*) > 1) t_SPOPLC
		)
		USING ERRCODE = '22000'
		;
	END IF;
    
    
    
    -- Permissions
	v_ids_product := (
		SELECT STRING_AGG(DISTINCT PP.id_product, ',')
		FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPO
		INNER JOIN Shop_Product_Permutation PP ON t_SPO.id_permutation = PP.id_permutation
	);
	
	CALL p_shop_user_eval(v_guid_permission, v_id_user, 0, v_id_permission_supplier_purchase_order, v_id_access_level_edit, v_ids_product);
	
	/*
	UPDATE tmp_Shop_Supplier t_S
	INNER JOIN Shop_User_Eval_Temp TP
		ON TP.GUID = v_guid_permission
	SET tP.can_view = TP.can_view,
		tP.can_edit = TP.can_edit,
		tP.can_admin = TP.can_admin;
	*/
	/*
	v_has_permission := (
		SELECT can_edit 
		FROM Shop_User_Eval_Temp 
		WHERE 
			GUID = v_guid_permission
			AND can_edit = 0
	);
	
	IF v_has_permission = FALSE THEN
		v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
		SELECT
			v_guid, 
			v_id_error_type_no_permission, 
			CONCAT('You do not have ', name, ' permissions.')
		FROM Shop_Permission
		WHERE id_permission = v_id_permission_supplier_purchase_order
		;
	END IF;
	*/
	v_ids_product_no_permission := (
		SELECT STRING_AGG(PT.id_product, ',') 
		FROM Shop_User_Eval_Temp PT 
		WHERE 
			PT.can_edit = 0
			AND NOT ISNULL(PT.id_product)
	);
	IF NOT ISNULL(v_ids_product_no_permission) THEN
		RAISE EXCEPTION 'You do not have permission to edit the following product IDs: %', v_ids_product_no_permission
		USING ERRCODE = '42501'
		;
	END IF;
	
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid;
    
	-- Transaction
	START TRANSACTION;
		INSERT INTO Shop_Sales_And_Purchasing_Change_Set (
			comment,
			updated_last_by,
			updated_last_on
		)
		VALUES (
			'Save '
			|| CASE WHEN v_is_new_supplier_purchase_order = TRUE THEN 'new ' ELSE '' END
			|| 'Supplier Purchase Order - '
			|| v_comment,
			v_id_user,
			CURRENT_TIMESTAMP
		);
		
		v_id_change_set := (SELECT id_change_set FROM Shop_Sales_And_Purchasing_Change_Set ORDER BY id_change_set DESC LIMIT 1);
		
		IF (v_is_new_supplier_purchase_order = 1) THEN
			INSERT INTO Shop_Supplier_Purchase_Order (
				id_supplier_ordered,
				cost_total_local,
				id_currency_cost,
				created_by,
				id_change_set,
				active
			)
			SELECT
				v_id_supplier_ordered,
				SUM(t_SPOPL.cost_total_local),
				v_id_currency_cost,
				v_id_user,
				v_id_change_set,
				v_active
			FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
			;
			-- v_id_order_new 
			v_id_order := (SELECT id_order FROM Shop_Supplier_Purchase_Order ORDER BY id_order DESC LIMIT 1);
			INSERT INTO Shop_Supplier_Purchase_Order_Product_Link (
				id_order,
				id_permutation,
				cost_total_local,
				id_currency_cost,
				quantity_ordered,
				id_unit_quantity,
				quantity_received,
				latency_delivery_days,
				display_order,
				active,
				created_by,
				id_change_set
			)
			SELECT
				v_id_order, -- v_id_order_new,
				id_permutation,
				cost_total_local,
				id_currency_cost,
				quantity_ordered,
				id_unit_quantity,
				quantity_received,
				latency_delivery_days,
				display_order,
				active,
				v_id_user,
				v_id_change_set
			FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
			;
		ELSE
			UPDATE Shop_Supplier_Purchase_Order SPO
			SET
				SPO.id_supplier_ordered = v_id_supplier_ordered,
				SPO.cost_total_local = SUM(t_SPOPL.cost_total_local),
				SPO.id_currency = v_id_currency_cost,
				SPO.id_change_set = v_id_change_set,
				SPO.active = v_active
			FROM Shop_Supplier_Purchase_Order SPO
			INNER JOIN tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL ON SPO.id_order = t_SPOPL.id_order
			WHERE SPO.id_order = v_id_order
			;
			IF EXISTS (SELECT * FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL INNER JOIN Shop_Supplier_Purchase_Order_Product_Link SPOPL ON t_SPOPL.id_link = SPOPL.id_link) THEN
				UPDATE Shop_Supplier_Purchase_Order_Product_Link SPOPL
				SET
					SPOPL.id_order = t_SPOPL.id_order,
					SPOPL.id_permutation = t_SPOPL.id_permutation,
					SPOPL.cost_total_local = t_SPOPL.cost_total_local,
					SPOPL.id_currency_cost = t_SPOPL.id_currency_cost,
					SPOPL.quantity_ordered = t_SPOPL.quantity_ordered,
					SPOPL.id_unit_quantity = t_SPOPL.id_unit_quantity,
					SPOPL.quantity_received = t_SPOPL.quantity_received,
					SPOPL.latency_delivery_days = t_SPOPL.latency_delivery_days,
					SPOPL.display_order = t_SPOPL.display_order,
					SPOPL.active = t_SPOPL.active,
					SPOPL.id_change_set = v_id_change_set
				FROM Shop_Supplier_Purchase_Order_Product_Link SPOPL
				INNER JOIN tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
					ON SPOPL.id_link = t_SPOPL.id_link
				;
			ELSE
				INSERT INTO Shop_Supplier_Purchase_Order_Product_Link (
					id_order,
					id_permutation,
					cost_total_local,
					id_currency_cost,
					quantity_ordered,
					id_unit_quantity,
					quantity_received,
					latency_delivery_days,
					display_order,
					active,
					created_by,
					id_change_set
				)
				SELECT
					id_order,
					id_permutation,
					cost_total_local,
					id_currency_cost,
					quantity_ordered,
					id_unit_quantity,
					quantity_received,
					latency_delivery_days,
					display_order,
					active,
					v_id_user,
					v_id_change_set
				FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
				WHERE t_SPOPL.id_link < 0
				;
			END IF;
		END IF;
	
	COMMIT;
	/*
	IF EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		ROLLBACK;
	ELSE
		COMMIT;
	END IF;
	*/
    
    -- Returns
    -- v_now = CURRENT_TIMESTAMP;
    /*
    -- Supplier Purchase Orders
	OPEN result_orders FOR
		SELECT *
		FROM Shop_Supplier_Purchase_Order
		WHERE id_order = v_id_order
		;
    -- RETURN NEXT result_orders;
    
    -- Supplier Purchase Order Product Links
	OPEN result_order_product_links FOR
		SELECT *
		FROM Shop_Supplier_Purchase_Order_Product_Link
		WHERE id_order = v_id_order
		;
    -- RETURN NEXT result_order_product_links;
    */
    -- Errors
	/*
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
	*/

    -- DROP TABLE tmp_Shop_Supplier_Purchase_Order;
    DROP TABLE tmp_Shop_Supplier_Purchase_Order_Product_Link;
    DROP TABLE tmp_Msg_Error;
END;
$$ LANGUAGE plpgsql;


/*

DELETE FROM Shop_Supplier_Purchase_Order_Product_Link_Audit;
DELETE FROM Shop_Supplier_Purchase_Order_Product_Link;
DELETE FROM Shop_Supplier_Purchase_Order_Product_Link_Temp;
DELETE FROM Shop_Supplier_Purchase_Order_Audit;
DELETE FROM Shop_Supplier_Purchase_Order;

INSERT INTO Shop_Supplier_Purchase_Order_Product_Link_Temp (
	guid,
    id_link,
    id_order,
	id_permutation,
	cost_total_local,
	id_currency_cost,
	quantity_ordered,
	id_unit_quantity,
	quantity_received,
	latency_delivery_days,
	display_order,
    active
)
VALUES
	(
		'NIPS', -- guid
		-1, -- id_link,
		-1, -- id_order,
		1, -- id_permutation,
		100, -- cost_total_local,
		1, -- id_currency_cost,
		1, -- quantity_ordered,
		1, -- id_unit_quantity,
		1, -- quantity_received,
		14, -- latency_delivery_days ,
		1, -- display_order
        1 -- active
    )
;

SELECT * FROM Shop_Supplier_Purchase_Order_Product_Link_Temp;

CALL p_shop_save_supplier_purchase_order (
	'NIPS', -- a_guid
    'auth0|6582b95c895d09a70ba10fef', -- a_id_user
    -1, -- a_id_order
    1, -- a_id_supplier_ordered
    1 -- a_id_currency_cost
);

SELECT * FROM Shop_Supplier_Purchase_Order_Product_Link_Temp;

DELETE FROM Shop_Supplier_Purchase_Order_Product_Link_Audit;
DELETE FROM Shop_Supplier_Purchase_Order_Product_Link;
DELETE FROM Shop_Supplier_Purchase_Order_Product_Link_Temp;
DELETE FROM Shop_Supplier_Purchase_Order_Audit;
DELETE FROM Shop_Supplier_Purchase_Order;


*/





CREATE OR REPLACE PROCEDURE p_shop_save_supplier (
	IN a_guid UUID,
    IN a_id_user INTEGER,
    IN a_comment UUID,
    IN a_id_supplier INTEGER,
    IN a_name_company VARCHAR(256),
    IN a_name_contact VARCHAR(256),
    IN a_department_contact VARCHAR(256),
    IN a_id_address INTEGER,
    IN a_phone_number VARCHAR(20),
    IN a_fax VARCHAR(20),
    IN a_email VARCHAR(515),
    IN a_website VARCHAR(300),
    IN a_id_currency INTEGER,
    IN a_active BOOLEAN
)
AS $$
DECLARE
	v_guid UUID;
    v_id_user INTEGER;
	v_comment VARCHAR(4000);
    v_id_supplier INTEGER;
    v_name_company VARCHAR(256);
    v_name_contact VARCHAR(256);
    v_department_contact VARCHAR(256);
    v_id_address INTEGER;
    v_phone_number VARCHAR(256);
    v_fax VARCHAR(256);
    v_email VARCHAR(256);
    v_website VARCHAR(256);
    v_id_currency INTEGER;
    v_active BOOLEAN;
    v_id_error_type_bad_data INTEGER;
    v_id_error_type_no_permission INTEGER;
	v_guid_permission UUID;
    v_id_permission_supplier INTEGER;
    -- v_id_access_level_EDIT INTEGER;
    v_has_permission BOOLEAN;
    v_id_change_set INTEGER;
    v_is_new_supplier BOOLEAN;
	-- result_errors REFCURSOR;
BEGIN
	-- SET SESSION sql_mode = sys.list_drop(@@session.sql_mode, 'ONLY_FULL_GROUP_BY');
    
	v_guid := COALESCE(a_guid, gen_random_uuid());
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_comment := TRIM(COALESCE(a_comment, ''));
	v_id_supplier := COALESCE(a_id_supplier, -1);
	v_name_company := TRIM(COALESCE(a_name_company, ''));
	v_name_contact := TRIM(COALESCE(a_name_contact, ''));
	v_department_contact := TRIM(COALESCE(a_department_contact, ''));
	v_id_address := a_id_address;
	v_phone_number := TRIM(COALESCE(a_phone_number, ''));
	v_fax := TRIM(COALESCE(a_fax, ''));
	v_email := TRIM(COALESCE(a_email, ''));
	v_website := TRIM(COALESCE(a_website, ''));
	v_id_currency := a_id_currency;
	v_active := COALESCE(a_active, FALSE); 
    
    v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA');
	v_guid_permission = gen_random_uuid();
	v_id_user = CURRENT_USER;
	v_id_permission_supplier = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_SUPPLIER' LIMIT 1);
	-- v_id_access_level_EDIT = (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT');
	v_is_new_supplier := CASE WHEN v_id_supplier <= 0 THEN TRUE ELSE FALSE END;
    
    
    -- Temporary tables
    /*
    CREATE TABLE tmp_Shop_Supplier (
		id_supplier INTEGER NOT NULL,
		name_company VARCHAR(255) NOT NULL,
		name_contact VARCHAR(255) NULL,
		department_contact VARCHAR(255) NULL,
		id_address INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Supplier_id_address
			FOREIGN KEY (id_address)
			REFERENCES Shop_Address(id_address),
		phone_number VARCHAR(50) NULL,
		fax VARCHAR(50) NULL,
		email VARCHAR(255) NOT NULL,
		website VARCHAR(255) NULL,
		id_currency INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Supplier_id_currency
			FOREIGN KEY (id_currency)
			REFERENCES Shop_Currency(id_currency),
		active BOOLEAN NOT NULL,
        can_view BOOLEAN NOT NULL, 
        can_edit BOOLEAN NOT NULL, 
        can_admin BOOLEAN NOT NULL
    );
    */
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		id_type INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Argument validation
	IF v_name_company = '' THEN
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(v_guid, v_id_error_type_bad_data, 'Supplier company name must be provided')
        ;
		*/
		RAISE EXCEPTION 'Supplier company name must be provided'
		USING ERRCODE = '22000'
		;
    END IF;

	IF v_id_address IS NULL THEN
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(v_guid, v_id_error_type_bad_data, 'Address ID must be provided')
        ;
		*/
		RAISE EXCEPTION 'Address ID must be provided'
		USING ERRCODE = '22000'
		;
    END IF;

	IF v_email = '' THEN
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(v_guid, v_id_error_type_bad_data, 'Email must be provided')
        ;
		*/
		RAISE EXCEPTION 'Email must be provided.'
		USING ERRCODE = '22000'
		;
    END IF;

	IF v_comment = '' THEN
		RAISE EXCEPTION 'A comment must be provided.'
		USING ERRCODE = '22000'
		;
	END IF;
    
    		
	IF (v_is_new_supplier = FALSE AND NOT EXISTS (SELECT * FROM Shop_Supplier S WHERE S.id_supplier = v_id_supplier)) THEN
		RAISE EXCEPTION 'Invalid supplier ID: %', v_id_supplier
		USING ERRCODE = '22000'
		;
	END IF;
    
    /*
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		INSERT INTO tmp_Shop_Supplier (
			id_supplier, name_company, name_contact, department_contact, id_address, phone_number, fax, email, website, id_currency, active
		)
		VALUES 
			(v_id_supplier, v_name_company, v_name_contact, v_department_contact, v_id_address, v_phone_number, v_fax, v_email, v_website, v_id_currency, v_active)
		/*
		FROM Shop_Supplier S
		WHERE (NOT v_has_filter_category OR C.id_category LIKE '%' || v_ids_category || '%')
			AND (v_get_inactive_categories OR C.active)
		*/
        ;
    END IF;
    */
    
    -- Permissions
	CALL p_shop_user_eval(v_guid_permission, v_id_user, v_id_permission_supplier, '');
	
	/*
	UPDATE tmp_Shop_Supplier t_S
	INNER JOIN Shop_User_Eval_Temp TP
		ON TP.GUID = v_guid_permission
	SET tP.can_view = TP.can_view,
		tP.can_edit = TP.can_edit,
		tP.can_admin = TP.can_admin;
	*/
	v_has_permission := (SELECT can_edit FROM Shop_User_Eval_Temp WHERE GUID = v_guid_permission);
	
	IF v_has_permission = FALSE THEN
		v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
		SELECT
			v_guid, 
			v_id_error_type_no_permission, 
			'You do not have %' || name || ' permissions.'
		FROM Shop_Permission
		WHERE id_permission = v_id_permission_supplier
		;
		*/
		RAISE EXCEPTION 'No permission: %', (
			SELECT name_error
			FROM Shop_User_Eval_Temp
			WHERE GUID = v_guid_permission
		)
		USING ERRCODE = '42501'
		;
	END IF;
	
	-- CALL p_shop_user_eval_clear_temp(v_guid_permission);
	
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid;
    
    
	-- Transaction
	INSERT INTO Shop_Sales_And_Purchasing_Change_Set (
		comment,
		updated_last_by,
		updated_last_on
	)
	VALUES (
		'Save '
		|| CASE WHEN v_is_new_supplier = TRUE THEN 'new ' ELSE '' END
		|| 'Supplier - '
		|| v_comment,
		v_id_user,
		CURRENT_TIMESTAMP
	);
	
	v_id_change_set := (SELECT id_change_set FROM Shop_Sales_And_Purchasing_Change_Set ORDER BY id_change_set DESC LIMIT 1);
	
	START TRANSACTION;
		IF (v_is_new_supplier = TRUE) THEN
			INSERT INTO Shop_Supplier (
				-- id_supplier, 
				name_company, name_contact, department_contact, id_address, phone_number, fax, email, website, id_currency, active, id_change_set
			)
			VALUES 
				(
					-- v_id_supplier, 
					v_name_company, v_name_contact, v_department_contact, v_id_address, v_phone_number, v_fax, v_email, v_website, v_id_currency, v_active, v_id_change_set
				)
			/*
			FROM Shop_Supplier S
			WHERE (NOT v_has_filter_category OR C.id_category LIKE '%' || v_ids_category || '%')
				AND (v_get_inactive_categories OR C.active)
			*/
			;
		ELSE 
			UPDATE Shop_Supplier S
			-- INNER JOIN tmp_Shop_Supplier t_S ON S.id_supplier = t_S.id_supplier
			SET 
				/*
				S.name_company = t_S.name_company,
				S.name_contact = t_S.name_contact,
				S.department_contact = t_S.department_contact,
				S.id_address = t_S.id_address,
				S.phone_number = t_S.phone_number,
				S.fax = t_S.fax,
				S.email = t_S.email,
				S.website = t_S.website,
				S.id_currency = t_S.id_currency,
				S.active = t_S.active
				*/
				S.name_company = v_name_company,
				S.name_contact = v_name_contact,
				S.department_contact = v_department_contact,
				S.id_address = v_id_address,
				S.phone_number = v_phone_number,
				S.fax = v_fax,
				S.email = v_email,
				S.website = v_website,
				S.id_currency = v_id_currency,
				S.active = v_active,
				S.id_change_set = v_id_change_set
			;
		END IF;
	COMMIT;
    
    -- Returns
    -- v_now = CURRENT_TIMESTAMP;
    
    -- Errors
	/*
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
	*/

    DROP TABLE tmp_Shop_Supplier;
    -- DROP TABLE tmp_Msg_Error;
END;
$$ LANGUAGE plpgsql;






-- DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order_Product_Link;
-- DROP TABLE IF EXISTS tmp_Msg_Error;

CREATE OR REPLACE PROCEDURE p_shop_save_manufacturing_purchase_order (
	IN a_guid UUID,
    IN a_id_user INTEGER,
    IN a_id_order INTEGER,
    -- IN a_id_supplier_ordered INTEGER,
    IN a_id_currency_cost INTEGER,
    IN a_active BOOLEAN,
    IN a_comment UUID
)
AS $$
DECLARE
	v_guid UUID;
    v_id_user INTEGER;
	v_comment VARCHAR(4000);
    v_id_order INTEGER;
    v_id_currency_cost INTEGER;
    v_active BOOLEAN;
    v_id_error_type_bad_data INTEGER;
    v_code_error_type_bad_data VARCHAR(50);
    v_id_error_type_no_permission INTEGER;
    v_code_error_type_no_permission VARCHAR(50);
    v_guid_permission UUID;
    -- v_id_user VARCHAR(100);
    v_id_permission_manufacturing_purchase_order INTEGER;
	v_id_access_level_EDIT INTEGER;
    v_ids_product VARCHAR(4000);
    v_ids_product_no_permission VARCHAR(4000);
    -- v_id_order_new INTEGER;
    v_id_change_set INTEGER;
    v_is_new_manufacturing_purchase_order BOOLEAN;
	result_errors REFCURSOR;
BEGIN
	-- SET SESSION sql_mode = sys.list_drop(@@session.sql_mode, 'ONLY_FULL_GROUP_BY');
    
	v_guid := COALESCE(a_guid, gen_random_uuid());
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_comment := TRIM(COALESCE(a_comment, ''));
	v_id_order := COALESCE(a_id_order, -1);
	v_id_currency_cost := a_id_currency_cost;
	v_active := COALESCE(a_active, FALSE); 
    
    v_code_error_type_bad_data = 'BAD_DATA';
    v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_bad_data LIMIT 1);
    v_code_error_type_no_permission = 'NO_PERMISSION';
    v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_no_permission LIMIT 1);
	v_guid_permission = gen_random_uuid();
	-- v_id_user = CURRENT_USER;
	v_id_permission_manufacturing_purchase_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_MANUFACTURING_PURCHASE_ORDER' LIMIT 1);
	v_id_access_level_EDIT := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT');
	v_is_new_manufacturing_purchase_order := CASE WHEN v_id_order <= 0 THEN TRUE ELSE FALSE END;
    
    -- Temporary tables
    /*
    CREATE TABLE tmp_Shop_Supplier_Purchase_Order (
		id_order INTEGER NOT NULL PRIMARY KEY,
		id_supplier_ordered INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Supplier_Purchase_Order_id_supplier_ordered
			FOREIGN KEY (id_supplier_ordered) 
			REFERENCES Shop_Supplier(id_supplier),
		cost_total_local REAL NOT NULL,
		id_currency_cost INTEGER NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Manufacturing_Purchase_Order_Product_Link (
		id_link INTEGER NOT NULL PRIMARY KEY,
		id_order INTEGER NOT NULL,
        /*
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_Manufacturing_Purchase_Order(id_order),
		*/
        id_permutation INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Manuf_Purch_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		cost_total_local REAL NOT NULL,
		id_currency_cost INTEGER NOT NULL,
        value_produced_total_local REAL NOT NULL,
		quantity_used REAL NOT NULL,
		id_unit_quantity INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Manuf_Purch_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_produced REAL NULL,
		latency_manufacture_days INTEGER NOT NULL,
		display_order INTEGER NOT NULL,
        active BOOLEAN NOT NULL,
        name_error VARCHAR(200) NOT NULL
    );
    
	/*
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		id_type INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    */

    
    -- Argument validation
    -- User ID
	IF NOT EXISTS (SELECT * FROM Shop_User WHERE id_user = v_id_user) THEN
		RAISE EXCEPTION 'Invalid User ID: %', COALESCE(v_id_user, 'NULL')
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Order ID
	IF ((v_id_order > 0) AND NOT EXISTS (SELECT * FROM Shop_Manufacturing_Purchase_Order WHERE id_order = v_id_order)) THEN
		RAISE EXCEPTION 'Invalid Manufacturing Purchase Order ID: %', COALESCE(v_id_order, 'NULL')
		USING ERRCODE = '22000'
		;
	END IF;

    /*
    -- Supplier ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(v_id_supplier_ordered) OR NOT EXISTS (SELECT * FROM Shop_Supplier WHERE id_supplier = v_id_supplier_ordered) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(v_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid supplier ID: ', COALESCE(v_id_supplier_ordered, 'NULL')))
			;
		END IF;
    END IF;
    */
    
    -- Currency ID
	IF ISNULL(v_id_currency_cost) OR NOT EXISTS (SELECT * FROM Shop_Currency WHERE id_currency = v_id_currency_cost) THEN
		RAISE EXCEPTION 'Invalid currency ID: %', COALESCE(v_id_currency, 'NULL')
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Comment
	IF v_comment = '' THEN
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, code, msg
		)
		VALUES
			(v_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, 'A comment must be provided.')
		;
		*/
		RAISE EXCEPTION 'A comment must be provided.'
		USING ERRCODE = '22000'
		;
	END IF;
    

	-- Get data from Temp table	
	INSERT INTO tmp_Shop_Manufacturing_Purchase_Order_Product_Link (
		id_link, 
		id_order, 
		id_permutation, 
		cost_total_local, 
		id_currency_cost, 
		quantity_used, 
		id_unit_quantity, 
		quantity_produced, 
		value_produced_total_local,
		latency_manufacture_days, 
		display_order, 
		active,
		name_error
	)
	SELECT 
		MPOPL_T.id_link, 
		MPOPL_T.id_order, 
		MPOPL_T.id_permutation, 
		PP.cost_local * MPOPL_T.quantity_used AS cost_total_local, 
		MPOPL_T.id_currency_cost, 
		MPOPL_T.quantity_used, 
		MPOPL_T.id_unit_quantity, 
		MPOPL_T.quantity_produced, 
		(PP.cost_local + PP.profit_local_min) * MPOPL_T.quantity_produced AS value_produced_total_local,
		MPOPL_T.latency_manufacture_days, 
		MPOPL_T.display_order, 
		MPOPL_T.active,
		PP.id_permutation, ' - ' || COALESCE(P.name ,'') AS name_error
	FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp MPOPL_T
	INNER JOIN Shop_Product_Permutation PP ON MPOPL_T.id_permutation = PP.id_permutation
	INNER JOIN Shop_Product P ON PP.id_product = P.id_product
	WHERE MPOPL_T.GUID = v_guid
	-- GROUP BY MPOPL_T.id_order, name_error, MPOPL_T.id_link
	/*
	group by 
		MPOPL_T.id_link, 
		MPOPL_T.id_order, 
		MPOPL_T.id_permutation, 
		cost_total_local, 
		MPOPL_T.id_currency_cost, 
		MPOPL_T.quantity_used, 
		MPOPL_T.id_unit_quantity, 
		MPOPL_T.quantity_produced, 
		value_produced_total_local,
		MPOPL_T.latency_manufacture_days, 
		MPOPL_T.display_order, 
		MPOPL_T.active,
		name_error
	*/
	-- GROUP BY id_link, P.id_product, PP.id_permutation
	-- GROUP BY name_error, ID_LINK, cost_total_local, value_produced_total_local
	;
	DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp MPOPL_T
	WHERE MPOPL_T.GUID = v_guid
	;
    
    -- Invalid quantity used
	IF EXISTS (
		SELECT * 
		FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link 
		WHERE 
			NOT ISNULL(quantity_used)
			AND quantity_used < 0
	) THEN
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, code, msg
		)
		SELECT
			v_guid, 
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			'Invalid quantity used property for the following permutations: ' || STRING_AGG(t_MPOPL.name_error, ', ')
		FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE t_MPOPL.quantity_used < 0
		;
		*/
		RAISE EXCEPTION 'Invalid quantity used property for the following permutations: %', (
			SELECT STRING_AGG(t_MPOPL.name_error, ', ')
			FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
			WHERE t_MPOPL.quantity_used < 0
		)
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Invalid quantity produced
	IF EXISTS (
		SELECT * 
		FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link 
		WHERE 
			NOT ISNULL(quantity_produced)
			AND quantity_produced < 0
	) THEN
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, code, msg
		)
		SELECT
			v_guid, 
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			'Invalid quantity produced property for the following permutations: ' || STRING_AGG(t_MPOPL.name_error, ', ')
		FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE t_MPOPL.quantity_produced < 0
		;
		*/
		RAISE EXCEPTION 'Invalid quantity produced property for the following permutations: %', (
			SELECT STRING_AGG(t_MPOPL.name_error, ', ')
			FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
			WHERE t_MPOPL.quantity_produced < 0
		)
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Duplicates
	IF EXISTS (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL GROUP BY id_permutation HAVING COUNT(*) > 1) THEN
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, code, msg
		)
		SELECT
			v_guid, 
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			'Duplicate records: ' || STRING_AGG(t_MPOPLC.name_error, ', ')
		FROM (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL GROUP BY id_permutation HAVING COUNT(*) > 1) t_MPOPLC
		;
		*/
		RAISE EXCEPTION 'Duplicate records: %', (
			SELECT STRING_AGG(t_MPOPLC.name_error, ', ')
			FROM (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL GROUP BY id_permutation HAVING COUNT(*) > 1) t_MPOPLC
		)
		USING ERRCODE = '22000'
		;
	END IF;
    
    
    -- Permissions
	v_ids_product := (
		SELECT STRING_AGG(DISTINCT PP.id_product, ',')
		FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPO
		INNER JOIN Shop_Product_Permutation PP ON t_MPO.id_permutation = PP.id_permutation
	);
	
	CALL p_shop_user_eval(v_guid_permission, v_id_user, 0, v_id_permission_manufacturing_purchase_order, v_id_access_level_edit, v_ids_product);
	
	/*
	UPDATE tmp_Shop_Supplier t_S
	INNER JOIN Shop_User_Eval_Temp TP
		ON TP.GUID = v_guid_permission
	SET tP.can_view = TP.can_view,
		tP.can_edit = TP.can_edit,
		tP.can_admin = TP.can_admin;
	*/
	/*
	v_has_permission := (
		SELECT can_edit 
		FROM Shop_User_Eval_Temp 
		WHERE 
			GUID = v_guid_permission
			AND can_edit = 0
	);
	
	IF v_has_permission = FALSE THEN
		v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
		SELECT
			v_guid, 
			v_id_error_type_no_permission, 
			CONCAT('You do not have ', name, ' permissions.')
		FROM Shop_Permission
		WHERE id_permission = v_id_permission_manufacturing_purchase_order
		;
	END IF;
	*/
	v_ids_product_no_permission := (
		SELECT STRING_AGG(PT.id_product, ',') 
		FROM Shop_User_Eval_Temp PT 
		WHERE 
			PT.can_edit = 0
			AND NOT ISNULL(PT.id_product)
	);
	IF NOT ISNULL(v_ids_product_no_permission) THEN
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, code, msg
		)
		VALUES (
			v_guid, 
			v_id_error_type_no_permission, 
			v_code_error_type_no_permission,
		*/
		RAISE EXCEPTION 'You do not have permission to edit the following product IDs: %', v_ids_product_no_permission
		USING ERRCODE = '42501'
		;
	END IF;
    
	-- Transaction
	START TRANSACTION;
		INSERT INTO Shop_Sales_And_Purchasing_Change_Set (
			comment,
			updated_last_by,
			updated_last_on
		)
		VALUES (
			'Save '
			|| CASE WHEN v_is_new_manufacturing_purchase_order = TRUE THEN 'new ' ELSE '' END
			|| 'Manufacturing Purchase Order - '
			|| v_comment,
			v_id_user,
			CURRENT_TIMESTAMP
		);
		
		v_id_change_set := (SELECT id_change_set FROM Shop_Sales_And_Purchasing_Change_Set ORDER BY id_change_set DESC LIMIT 1);
		
		IF (v_is_new_manufacturing_purchase_order = 1) THEN
			INSERT INTO Shop_Manufacturing_Purchase_Order (
				-- id_supplier_ordered,
				cost_total_local,
				id_currency_cost,
				value_produced_total_local,
				created_by,
				id_change_set,
				active
			)
			SELECT
				-- v_id_supplier_ordered,
				SUM(t_MPOPL.cost_total_local),
				v_id_currency_cost,
				SUM(t_MPOPL.value_produced_total_local),
				v_id_user,
				v_id_change_set,
				v_active
			FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
			;
			-- v_id_order_new 
			v_id_order := (SELECT id_order FROM Shop_Manufacturing_Purchase_Order ORDER BY id_order DESC LIMIT 1);
			
			INSERT INTO Shop_Manufacturing_Purchase_Order_Product_Link (
				id_order,
				id_permutation,
				cost_total_local,
				value_produced_total_local,
				id_currency_cost,
				quantity_used,
				id_unit_quantity,
				quantity_produced,
				latency_manufacture_days,
				display_order,
				active,
				created_by,
				id_change_set
			)
			SELECT
				v_id_order, -- v_id_order_new,
				id_permutation,
				cost_total_local,
				value_produced_total_local,
				id_currency_cost,
				quantity_used,
				id_unit_quantity,
				quantity_produced,
				latency_manufacture_days,
				display_order,
				active,
				v_id_user,
				v_id_change_set
			FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
			;
		ELSE
			UPDATE Shop_Manufacturing_Purchase_Order MPO
			SET
				-- MPO.id_supplier_ordered = v_id_supplier_ordered,
				MPO.cost_total_local = SUM(t_MPOPL.cost_total_local),
				MPO.value_produced_total_local = SUM(t_MPOPL.value_produced_total_local),
				MPO.id_currency = v_id_currency_cost,
				MPO.id_change_set = v_id_change_set,
				MPO.active = v_active
			FROM Shop_Manufacturing_Purchase_Order MPO
			INNER JOIN tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL ON MPO.id_order = t_MPOPL.id_order
			WHERE MPO.id_order = v_id_order
			;
			IF EXISTS (SELECT * FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL INNER JOIN Shop_Manufacturing_Purchase_Order_Product_Link MPOPL ON t_MPOPL.id_link = MPOPL.id_link) THEN
				UPDATE Shop_Manufacturing_Purchase_Order_Product_Link MPOPL
				SET
					MPOPL.id_order = t_MPOPL.id_order,
					MPOPL.id_permutation = t_MPOPL.id_permutation,
					MPOPL.cost_total_local = t_MPOPL.cost_total_local,
					MPOPL.value_produced_total_local = t_MPOPL.value_produced_total_local,
					MPOPL.id_currency_cost = t_MPOPL.id_currency_cost,
					MPOPL.quantity_used = t_MPOPL.quantity_used,
					MPOPL.id_unit_quantity = t_MPOPL.id_unit_quantity,
					MPOPL.quantity_produced = t_MPOPL.quantity_produced,
					MPOPL.latency_manufacture_days = t_MPOPL.latency_manufacture_days,
					MPOPL.display_order = t_MPOPL.display_order,
					MPOPL.active = t_MPOPL.active,
					MPOPL.id_change_set = v_id_change_set
				FROM Shop_Manufacturing_Purchase_Order_Product_Link MPOPL
				INNER JOIN tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
					ON MPOPL.id_link = t_MPOPL.id_link
				;
			ELSE
				INSERT INTO Shop_Manufacturing_Purchase_Order_Product_Link (
					id_order,
					id_permutation,
					cost_total_local,
					value_produced_total_local,
					id_currency_cost,
					quantity_used,
					id_unit_quantity,
					quantity_produced,
					latency_manufacture_days,
					display_order,
					active,
					created_by,
					id_change_set
				)
				SELECT
					id_order,
					id_permutation,
					cost_total_local,
					value_produced_total_local,
					id_currency_cost,
					quantity_used,
					id_unit_quantity,
					quantity_produced,
					latency_manufacture_days,
					display_order,
					active,
					v_id_user,
					v_id_change_set
				FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
				WHERE t_MPOPL.id_link < 0
				;
			END IF;
		END IF;
	
	COMMIT;
    
    -- Returns
    -- v_now = CURRENT_TIMESTAMP;
    /*
    -- Manufacturing Purchase Orders
    SELECT *
    FROM Shop_Manufacturing_Purchase_Order
    WHERE 
		id_order = v_id_order
        -- GUID = v_guid
    ;
    
    -- Manufacturing Purchase Order Product Links
    SELECT *
    FROM Shop_Manufacturing_Purchase_Order_Product_Link
    WHERE
		id_order = v_id_order
        -- GUID = v_guid
    ;
    */

    -- Errors
	/*
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
    */

    -- DROP TABLE tmp_Shop_Manufacturing_Purchase_Order;
    DROP TABLE tmp_Shop_Manufacturing_Purchase_Order_Product_Link;
    -- DROP TABLE tmp_Msg_Error;
END;
$$ LANGUAGE plpgsql;


/*

DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;
DELETE FROM Shop_Manufacturing_Purchase_Order_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order;

INSERT INTO Shop_Manufacturing_Purchase_Order_Product_Link_Temp (
	guid,
    id_link,
    id_order,
	id_permutation,
	cost_total_local,
	id_currency_cost,
	quantity_used,
	id_unit_quantity,
	quantity_produced,
	latency_manufacture_days,
	display_order,
    active
)
VALUES
	(
		'NIPS', -- guid
		-1, -- id_link,
		-1, -- id_order,
		1, -- id_permutation,
		100, -- cost_total_local,
		1, -- id_currency_cost,
		1, -- quantity_used,
		1, -- id_unit_quantity,
		1, -- quantity_produced,
		14, -- latency_manufacture_days ,
		1, -- display_order
        1 -- active
    )
;

SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

CALL p_shop_save_manufacturing_purchase_order (
	'NIPS', -- a_guid
    'auth0|6582b95c895d09a70ba10fef', -- a_id_user
    -1, -- a_id_order
    1, -- a_id_currency_cost
    1, -- a_active
    'Initial data' -- a_comment
);

SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;
DELETE FROM Shop_Manufacturing_Purchase_Order_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order;


*/





CREATE OR REPLACE PROCEDURE p_shop_save_customer (
	IN a_guid UUID,
    IN a_id_user INTEGER,
    IN a_comment UUID,
    IN a_id_customer INTEGER,
    IN a_name_company VARCHAR(256),
    IN a_name_contact VARCHAR(256),
    IN a_department_contact VARCHAR(256),
    IN a_id_address INTEGER,
    IN a_phone_number VARCHAR(20),
    IN a_email VARCHAR(515),
    IN a_id_currency INTEGER,
    IN a_active BOOLEAN
)
AS $$
DECLARE
	v_guid UUID;
    v_id_user INTEGER;
	v_comment VARCHAR(4000);
    v_id_customer INTEGER;
    v_name_company VARCHAR(256);
    v_name_contact VARCHAR(256);
    v_department_contact VARCHAR(256);
    v_id_address INTEGER;
    v_phone_number VARCHAR(256);
    v_email VARCHAR(256);
    v_id_currency INTEGER;
    v_active BOOLEAN;
    v_id_error_type_bad_data INTEGER;
    v_id_error_type_no_permission INTEGER;
	v_guid_permission UUID;
    v_id_permission_customer INTEGER;
    v_id_access_level_EDIT INTEGER;
    v_has_permission BOOLEAN;
    v_id_change_set INTEGER;
    v_is_new_customer BOOLEAN;
	-- result_errors REFCURSOR;
BEGIN
	-- SET SESSION sql_mode = sys.list_drop(@@session.sql_mode, 'ONLY_FULL_GROUP_BY');
    
	v_guid := COALESCE(a_guid, gen_random_uuid());
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_comment := TRIM(COALESCE(a_comment, ''));
	v_id_customer := COALESCE(a_id_customer, -1);
	v_name_company := TRIM(COALESCE(a_name_company, ''));
	v_name_contact := TRIM(COALESCE(a_name_contact, ''));
	v_department_contact := TRIM(COALESCE(a_department_contact, ''));
	v_id_address := a_id_address;
	v_phone_number := TRIM(COALESCE(a_phone_number, ''));
	v_email := TRIM(COALESCE(a_email, ''));
	v_id_currency := a_id_currency;
	v_active := COALESCE(a_active, FALSE); 
    
    v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA');
	v_guid_permission = gen_random_uuid();
	v_id_permission_customer = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_CUSTOMER' LIMIT 1);
	v_id_access_level_EDIT = (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT');    
	v_is_new_customer := CASE WHEN v_id_customer <= 0 THEN TRUE ELSE FALSE END;
    
    -- Temporary tables
    /*
    CREATE TABLE tmp_Shop_Customer (
		id_customer INTEGER NOT NULL,
		name_company VARCHAR(255) NOT NULL,
		name_contact VARCHAR(255) NULL,
		department_contact VARCHAR(255) NULL,
		id_address INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Customer_id_address
			FOREIGN KEY (id_address)
			REFERENCES Shop_Address(id_address),
		phone_number VARCHAR(50) NULL,
		fax VARCHAR(50) NULL,
		email VARCHAR(255) NOT NULL,
		website VARCHAR(255) NULL,
		id_currency INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Customer_id_currency
			FOREIGN KEY (id_currency)
			REFERENCES Shop_Currency(id_currency),
		active BOOLEAN NOT NULL,
        can_view BOOLEAN NOT NULL, 
        can_edit BOOLEAN NOT NULL, 
        can_admin BOOLEAN NOT NULL
    );
    */
    /*
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		id_type INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    */
    
    -- Argument validation
	IF v_name_company = '' THEN
		RAISE EXCEPTION 'Customer company name must be provided'
		USING ERRCODE = '22000'
		;
    END IF;
	IF v_id_address IS NULL THEN
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(v_guid, v_id_error_type_bad_data, 'Customer address ID must be provided')
        ;
		*/
		RAISE EXCEPTION 'Customer address ID must be provided'
		USING ERRCODE = '22000'
		;
    END IF;
	IF v_email = '' THEN
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(v_guid, v_id_error_type_bad_data, 'Customer email must be provided')
        ;
		*/
		RAISE EXCEPTION 'Customer email must be provided'
		USING ERRCODE = '22000'
		;
    END IF;
    
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		/*		
        IF (v_is_new_customer = FALSE AND NOT EXISTS (SELECT * FROM Shop_Customer C WHERE C.id_customer = v_id_customer)) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, msg
			)
			VALUES
				(v_guid, v_id_error_type_bad_data, 'Invalid customer ID: ' || v_id_customer)
			;
		END IF;
		*/
		RAISE EXCEPTION 'Invalid customer ID: %', v_id_customer
		USING ERRCODE = '22000'
		;
    END IF;
    
    /*
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		INSERT INTO tmp_Shop_Customer (
			id_customer, name_company, name_contact, department_contact, id_address, phone_number, fax, email, website, id_currency, active
		)
		VALUES 
			(v_id_customer, v_name_company, v_name_contact, v_department_contact, v_id_address, v_phone_number, v_fax, v_email, v_website, v_id_currency, v_active)
		/*
		FROM Shop_Customer S
		WHERE (NOT v_has_filter_category OR C.id_category LIKE '%' || v_ids_category || '%')
			AND (v_get_inactive_categories OR C.active)
		*/
        ;
    END IF;
    */
    
    -- Permissions
	CALL p_shop_user_eval(v_guid_permission, v_id_user, 0, v_id_permission_customer, v_id_access_level_edit, '');
	
	/*
	UPDATE tmp_Shop_Customer t_S
	INNER JOIN Shop_User_Eval_Temp TP
		ON TP.GUID = v_guid_permission
	SET tP.can_view = TP.can_view,
		tP.can_edit = TP.can_edit,
		tP.can_admin = TP.can_admin;
	*/
	v_has_permission := (SELECT can_edit FROM Shop_User_Eval_Temp WHERE GUID = v_guid_permission);
	
	IF v_has_permission = FALSE THEN
		v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
		SELECT
			v_guid, 
			v_id_error_type_no_permission, 
			'You do not have ' || name || ' permissions.'
		FROM Shop_Permission
		WHERE id_permission = v_id_permission_customer
		;
		RAISE EXCEPTION 'You do not have ' || name || ' permissions.'
		FROM Shop_Permission
		WHERE id_permission = v_id_permission_customer
		USING ERRCODE = '22000'
		;
		*/
	END IF;
	
	-- CALL p_shop_user_eval_clear_temp(v_guid_permission);
	
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid;
    
    
	-- Transaction    
	INSERT INTO Shop_Sales_And_Purchasing_Change_Set (
		comment,
		updated_last_by,
		updated_last_on
	)
	VALUES (
			'Save '
			|| CASE WHEN v_is_new_customer = TRUE THEN 'new ' ELSE '' END
			|| 'Customer - '
			|| v_comment,
		v_id_user,
		CURRENT_TIMESTAMP
	);
	
	v_id_change_set := (SELECT id_change_set FROM Shop_Sales_And_Purchasing_Change_Set ORDER BY id_change_set DESC LIMIT 1);
	
	START TRANSACTION;
		IF (v_is_new_customer = TRUE) THEN
			INSERT INTO Shop_Customer (
				-- id_customer, 
				name_company, name_contact, department_contact, id_address, phone_number, email, id_currency, active, id_change_set
			)
			VALUES 
				(
					-- v_id_customer, 
					v_name_company, v_name_contact, v_department_contact, v_id_address, v_phone_number, v_email, v_id_currency, v_active, v_id_change_set
				)
			/*
			FROM Shop_Customer S
			WHERE (NOT v_has_filter_category OR C.id_category LIKE '%' || v_ids_category || '%')
				AND (v_get_inactive_categories OR C.active)
			*/
			;
		ELSE 
			UPDATE Shop_Customer C
			-- INNER JOIN tmp_Shop_Customer t_S ON S.id_customer = t_S.id_customer
			SET 
				/*
				S.name_company = t_S.name_company,
				S.name_contact = t_S.name_contact,
				S.department_contact = t_S.department_contact,
				S.id_address = t_S.id_address,
				S.phone_number = t_S.phone_number,
				S.fax = t_S.fax,
				S.email = t_S.email,
				S.website = t_S.website,
				S.id_currency = t_S.id_currency,
				S.active = t_S.active
				*/
				C.name_company = v_name_company,
				C.name_contact = v_name_contact,
				C.department_contact = v_department_contact,
				C.id_address = v_id_address,
				C.phone_number = v_phone_number,
				C.email = v_email,
				C.id_currency = v_id_currency,
				C.active = v_active,
				C.id_change_set = v_id_change_set
			;
		END IF;
	
	COMMIT;
    
    -- Returns
    -- v_now = CURRENT_TIMESTAMP;
    
    -- Errors
	/*
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
    */

    -- DROP TABLE tmp_Shop_Customer;
    -- DROP TABLE tmp_Msg_Error;
END;
$$ LANGUAGE plpgsql;


/*

CALL p_shop_save_customer (
	'NIPS', -- a_guid
    'auth0|6582b95c895d09a70ba10fef', -- a_id_user
    'Initial Customer', -- a_comment
    '-1', -- a_id_customer
    'good co', -- a_name_company
    'teddy', -- a_name_contact
    'manufacturing', -- a_department_contact
    1, -- a_id_address
    'BRING BRING', -- a_phone_number
    'e@mail.com', -- a_email
    1, -- a_id_currency_cost
    1 -- a_active
);

SELECT * FROM Shop_Customer
;

DELETE FROM Shop_Customer
;

*/

-- DROP TABLE IF EXISTS tmp_Shop_Customer_Sales_Order_Product_Link;
-- DROP TABLE IF EXISTS tmp_Msg_Error;

CREATE OR REPLACE PROCEDURE p_shop_save_customer_sales_order (
	IN a_guid UUID,
    IN a_id_user INTEGER,
    IN a_comment VARCHAR(4000),
    IN a_id_order INTEGER,
    IN a_id_customer INTEGER,
    IN a_id_currency_price INTEGER,
    IN a_active BOOLEAN
)
AS $$
DECLARE 
	v_guid UUID;
    v_id_user INTEGER;
	v_comment VARCHAR(4000);
    v_id_order INTEGER;
    v_id_customer INTEGER;
    v_id_currency_price INTEGER;
    v_active BOOLEAN;
	v_id_error_type_bad_data INTEGER;
    v_code_error_type_bad_data VARCHAR(50);
    v_id_error_type_no_permission INTEGER;
    v_code_error_type_no_permission VARCHAR(50);
    -- v_guid_permission UUID;
    v_id_permission_Customer_Sales_order INTEGER;
	v_id_access_level_EDIT INTEGER;
    v_ids_product VARCHAR(4000);
    v_ids_product_no_permission VARCHAR(4000);
    -- v_id_order_new INTEGER;
    v_id_change_set INTEGER;
    v_is_new_Customer_Sales_order BOOLEAN;
	result_errors REFCURSOR;
BEGIN
	-- SET SESSION sql_mode = sys.list_drop(@@session.sql_mode, 'ONLY_FULL_GROUP_BY');
    
	v_guid := COALESCE(a_guid, gen_random_uuid());
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_comment := TRIM(COALESCE(a_comment, ''));
	v_id_order := COALESCE(a_id_order, -1);
	v_id_customer := a_id_customer;
	v_id_currency_price := a_id_currency_price;
	v_active := COALESCE(a_active, FALSE); 

    v_code_error_type_bad_data := 'BAD_DATA';
    v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_bad_data LIMIT 1);
    v_code_error_type_no_permission := 'NO_PERMISSION';
    v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_no_permission LIMIT 1);
	-- v_guid_permission := gen_random_uuid();
	v_id_permission_Customer_Sales_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_CUSTOMER_SALES_ORDER' LIMIT 1);
	v_id_access_level_EDIT := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT');
    
	v_is_new_Customer_Sales_order := CASE WHEN v_id_order <= 0 THEN TRUE ELSE FALSE END;
	
    -- Temporary tables
    /*
    CREATE TABLE tmp_Shop_Customer_Sales_Order (
		id_order INTEGER NOT NULL PRIMARY KEY,
		id_supplier_ordered INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Customer_Sales_Order_id_supplier_ordered
			FOREIGN KEY (id_supplier_ordered) 
			REFERENCES Shop_Supplier(id_supplier),
		price_total_local REAL NOT NULL,
		id_currency_price INTEGER NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Customer_Sales_Order_Product_Link (
		id_link INTEGER NOT NULL PRIMARY KEY,
		id_order INTEGER NOT NULL,
        /*
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_Customer_Sales_Order(id_order),
		*/
        id_permutation INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		price_total_local REAL NOT NULL,
		id_currency_price INTEGER NOT NULL,
		quantity_ordered REAL NOT NULL,
		id_unit_quantity INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_delivered REAL NULL,
		latency_delivery_days INTEGER NOT NULL,
		display_order INTEGER NOT NULL,
        active BOOLEAN NOT NULL,
        name_error VARCHAR(200) NOT NULL
    );
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		id_type INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Argument validation
    -- User ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF NOT EXISTS (SELECT * FROM Shop_User WHERE id_user = v_id_user) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(v_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid User ID: ', COALESCE(v_id_user, 'NULL')))
			;
		END IF;
    END IF;
    
    -- Order ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF (v_id_order > 0) AND NOT EXISTS (SELECT * FROM Shop_Customer_Sales_Order WHERE id_order = v_id_order) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(v_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid Customer Sales Order ID: ', COALESCE(v_id_order, 'NULL')))
			;
		END IF;
    END IF;
    
    -- Customer ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(v_id_customer) OR NOT EXISTS (SELECT * FROM Shop_Customer WHERE id_customer = v_id_customer) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(v_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid Customer ID: ', COALESCE(v_id_customer, 'NULL')))
			;
		END IF;
    END IF;
    
    -- Currency ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(v_id_currency_price) OR NOT EXISTS (SELECT * FROM Shop_Currency WHERE id_currency = v_id_currency_price) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(v_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid currency ID: ', COALESCE(v_id_currency, 'NULL')))
			;
		END IF;
    END IF;
    
    -- Comment
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF v_comment = '' THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(v_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, 'A comment must be provided.')
			;
		END IF;
    END IF;
    

	-- Get data from Temp table
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN		
		INSERT INTO tmp_Shop_Customer_Sales_Order_Product_Link (
			id_link, 
            id_order, 
            id_permutation, 
            price_total_local, 
            id_currency_price, 
            quantity_ordered, 
            id_unit_quantity, 
            quantity_delivered, 
            latency_delivery_days, 
            display_order, 
            active,
            name_error
		)
		SELECT 
			CSOPL_T.id_link, 
            CSOPL_T.id_order, 
            CSOPL_T.id_permutation, 
			(PP.cost_local + PP.profit_local_min) * quantity_ordered AS price_total_local, 
			CSOPL_T.id_currency_price, 
            CSOPL_T.quantity_ordered, 
            CSOPL_T.id_unit_quantity, 
            CSOPL_T.quantity_delivered, 
            CSOPL_T.latency_delivery_days, 
            CSOPL_T.display_order, 
            CSOPL_T.active,
            PP.id_permutation || ' - ' || COALESCE(P.name ,'') AS name_error
        FROM Shop_Customer_Sales_Order_Product_Link_Temp CSOPL_T
        INNER JOIN Shop_Product_Permutation PP ON CSOPL_T.id_permutation = PP.id_permutation
        INNER JOIN Shop_Product P ON PP.id_product = P.id_product
		WHERE CSOPL_T.GUID = v_guid
        ;
        DELETE FROM Shop_Customer_Sales_Order_Product_Link_Temp CSOPL_T
		WHERE CSOPL_T.GUID = v_guid
        ;
        
        /*
        UPDATE tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL
        SET 
			price_total_local
		*/
    END IF;
    
    -- Invalid quantity ordered
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Shop_Customer_Sales_Order_Product_Link 
            WHERE 
				NOT ISNULL(quantity_ordered)
				AND quantity_ordered < 0
		) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			SELECT
				v_guid, 
                v_id_error_type_bad_data, 
                v_code_error_type_bad_data, 
                'Invalid quantity ordered property for the following permutations: ' || STRING_AGG(t_CSOPL.name_error, ', ')
			FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL
            -- INNER JOIN Shop_Product_Permutation PP ON t_CSOPL.id_permutation = PP.id_permutation
            WHERE t_CSOPL.quantity_ordered < 0
			;
        END IF;
    END IF;
    
    -- Duplicates
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF EXISTS (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL GROUP BY id_permutation HAVING COUNT(*) > 1) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			SELECT
				v_guid, 
                v_id_error_type_bad_data, 
                v_code_error_type_bad_data, 
                'Duplicate records: ' || STRING_AGG(t_CSOPLC.name_error, ', ')
			FROM (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL GROUP BY id_permutation HAVING COUNT(*) > 1) t_CSOPLC
			;
        END IF;
	END IF;
    
    
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
        v_ids_product := (
			SELECT STRING_AGG(DISTINCT PP.id_product, ',')
            FROM tmp_Shop_Customer_Sales_Order_Product_Link t_SPO
			INNER JOIN Shop_Product_Permutation PP ON t_SPO.id_permutation = PP.id_permutation
		);
        
        CALL p_shop_user_eval(v_guid_permission, v_id_user, 0, v_id_permission_Customer_Sales_order, v_id_access_level_edit, v_ids_product);
        
        /*
        UPDATE tmp_Shop_Supplier t_S
        INNER JOIN Shop_User_Eval_Temp TP
			ON TP.GUID = v_guid_permission
        SET tP.can_view = TP.can_view,
			tP.can_edit = TP.can_edit,
            tP.can_admin = TP.can_admin;
		*/
        /*
        SET v_has_permission := (
			SELECT can_edit 
            FROM Shop_User_Eval_Temp 
            WHERE 
				GUID = v_guid_permission
				AND can_edit = 0
        );
        
        IF v_has_permission = FALSE THEN
			v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, msg
			)
			SELECT
				v_guid, 
				v_id_error_type_no_permission, 
				CONCAT('You do not have ', name, ' permissions.')
			FROM Shop_Permission
            WHERE id_permission = v_id_permission_Customer_Sales_order
			;
        END IF;
        */
        v_ids_product_no_permission := (
			SELECT STRING_AGG(PT.id_product, ',') 
            FROM Shop_User_Eval_Temp PT 
            WHERE 
				PT.can_edit = 0
				AND NOT ISNULL(PT.id_product)
        );
        IF NOT ISNULL(v_ids_product_no_permission) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES (
				v_guid, 
				v_id_error_type_no_permission, 
                v_code_error_type_no_permission,
                'You do not have permission to edit the following product IDs: ' || v_ids_product_no_permission
			)
			;
        END IF;
        
        DELETE FROM Shop_User_Eval_Temp
        WHERE GUID = v_guid;
    END IF;
    
	-- Transaction    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		START TRANSACTION;
			INSERT INTO Shop_Sales_And_Purchasing_Change_Set (
				comment,
				updated_last_by,
				updated_last_on
			)
			VALUES (
				'Save '
				|| CASE WHEN v_is_new_Customer_Sales_order = TRUE THEN 'new ' ELSE '' END
				|| 'Customer Sales Order - '
				|| v_comment,
				v_id_user,
				CURRENT_TIMESTAMP
			);
			
			v_id_change_set := (SELECT id_change_set FROM Shop_Sales_And_Purchasing_Change_Set ORDER BY id_change_set DESC LIMIT 1);
			
			IF (v_is_new_Customer_Sales_order = 1) THEN
				INSERT INTO Shop_Customer_Sales_Order (
					id_customer,
					price_total_local,
					id_currency_price,
                    created_by,
                    id_change_set,
                    active
				)
                SELECT
					v_id_customer,
					SUM(t_CSOPL.price_total_local),
                    v_id_currency_price,
                    v_id_user,
                    v_id_change_set,
                    v_active
				FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL
				;
                -- v_id_order_new 
                v_id_order := (SELECT id_order FROM Shop_Customer_Sales_Order ORDER BY id_order DESC LIMIT 1);
				INSERT INTO Shop_Customer_Sales_Order_Product_Link (
					id_order,
					id_permutation,
					price_total_local,
					id_currency_price,
					quantity_ordered,
					id_unit_quantity,
					quantity_delivered,
					latency_delivery_days,
					display_order,
                    active,
                    created_by,
                    id_change_set
				)
                SELECT
					v_id_order, -- v_id_order_new,
					id_permutation,
					price_total_local,
					id_currency_price,
					quantity_ordered,
					id_unit_quantity,
					quantity_delivered,
					latency_delivery_days,
					display_order,
                    active,
                    v_id_user,
                    v_id_change_set
				FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL
				;
			ELSE
				UPDATE Shop_Customer_Sales_Order CSO
                SET
					CSO.id_customer = v_id_customer,
					CSO.price_total_local = SUM(t_CSOPL.price_total_local),
                    CSO.id_currency = v_id_currency_price,
                    CSO.id_change_set = v_id_change_set,
                    CSO.active = v_active
				FROM Shop_Customer_Sales_Order CSO
				INNER JOIN tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL ON CSO.id_order = t_CSOPL.id_order
				WHERE SPO.id_order = v_id_order
				;
                IF EXISTS (SELECT * FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL INNER JOIN Shop_Customer_Sales_Order_Product_Link CSOPL ON t_CSOPL.id_link = CSOPL.id_link) THEN
					UPDATE Shop_Customer_Sales_Order_Product_Link CSOPL
					SET
						CSOPL.id_order = t_CSOPL.id_order,
						CSOPL.id_permutation = t_CSOPL.id_permutation,
						CSOPL.price_total_local = t_CSOPL.price_total_local,
						CSOPL.id_currency_price = t_CSOPL.id_currency_price,
						CSOPL.quantity_ordered = t_CSOPL.quantity_ordered,
						CSOPL.id_unit_quantity = t_CSOPL.id_unit_quantity,
						CSOPL.quantity_delivered = t_CSOPL.quantity_delivered,
						CSOPL.latency_delivery_days = t_CSOPL.latency_delivery_days,
						CSOPL.display_order = t_CSOPL.display_order,
                        CSOPL.active = t_CSOPL.active,
						CSOPL.id_change_set = v_id_change_set
					FROM Shop_Customer_Sales_Order_Product_Link CSOPL
					INNER JOIN tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL
						ON CSOPL.id_link = t_CSOPL.id_link
					;
                ELSE
					INSERT INTO Shop_Customer_Sales_Order_Product_Link (
						id_order,
						id_permutation,
						price_total_local,
						id_currency_price,
						quantity_ordered,
						id_unit_quantity,
						quantity_delivered,
						latency_delivery_days,
						display_order,
                        active,
                        created_by,
						id_change_set
					)
					SELECT
						id_order,
						id_permutation,
						price_total_local,
						id_currency_price,
						quantity_ordered,
						id_unit_quantity,
						quantity_delivered,
						latency_delivery_days,
						display_order,
						active,
                        v_id_user,
						v_id_change_set
					FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL
                    WHERE t_CSOPL.id_link < 0
					;
                END IF;
			END IF;
		
		COMMIT;
		/*
		IF EXISTS (SELECT * FROM tmp_Msg_Error) THEN
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
		*/
    END IF;
    
    -- Returns
    -- v_now := CURRENT_TIMESTAMP;
    /*
    -- Supplier Purchase Orders
    SELECT *
    FROM Shop_Customer_Sales_Order
    WHERE id_order = v_id_order
    ;
    
    -- Supplier Purchase Order Product Links
    SELECT *
    FROM Shop_Customer_Sales_Order_Product_Link
    WHERE id_order = v_id_order
    ;
    */

    -- Errors
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
    
    -- DROP TABLE tmp_Shop_Customer_Sales_Order;
    DROP TABLE tmp_Shop_Customer_Sales_Order_Product_Link;
    DROP TABLE tmp_Msg_Error;
END;
$$ LANGUAGE plpgsql;


/*

DELETE FROM Shop_Customer_Sales_Order_Product_Link_Audit;
DELETE FROM Shop_Customer_Sales_Order_Product_Link;
DELETE FROM Shop_Customer_Sales_Order_Product_Link_Temp;
DELETE FROM Shop_Customer_Sales_Order_Audit;
DELETE FROM Shop_Customer_Sales_Order;

INSERT INTO Shop_Customer_Sales_Order_Product_Link_Temp (
	guid,
    id_link,
    id_order,
	id_permutation,
	price_total_local,
	id_currency_price,
	quantity_ordered,
	id_unit_quantity,
	quantity_delivered,
	latency_delivery_days,
	display_order,
    active
)
VALUES
	(
		'NIPS', -- guid
		-1, -- id_link,
		-1, -- id_order,
		1, -- id_permutation,
		100, -- price_total_local,
		1, -- id_currency_price,
		1, -- quantity_ordered,
		1, -- id_unit_quantity,
		1, -- quantity_delivered,
		14, -- latency_delivery_days ,
		1, -- display_order
        1 -- active
    )
;

SELECT * FROM Shop_Customer_Sales_Order_Product_Link_Temp;

CALL p_shop_save_customer_sales_order (
	'NIPS', -- a_guid
    'auth0|6582b95c895d09a70ba10fef', -- a_id_user
    'Initial customer', -- a_comment
    -1, -- a_id_order
    4, -- a_id_customer
    1, -- a_id_currency_price
    1 -- a_active
);

SELECT * FROM Shop_Customer_Sales_Order_Product_Link_Temp;

DELETE FROM Shop_Customer_Sales_Order_Product_Link_Audit;
DELETE FROM Shop_Customer_Sales_Order_Product_Link;
DELETE FROM Shop_Customer_Sales_Order_Product_Link_Temp;
DELETE FROM Shop_Customer_Sales_Order_Audit;
DELETE FROM Shop_Customer_Sales_Order;


*/




/*

CALL p_shop_save_user (
	'auth0|6582b95c895d09a70ba10fef', -- a_id_user
	'', -- a_name
	'', -- a_email
    0 -- a_email_verified
)

*/


CREATE OR REPLACE PROCEDURE p_shop_save_user (
	IN a_id_user INTEGER,
    IN a_name VARCHAR(255),
	IN a_email VARCHAR(254),
    IN a_email_verified BIT
)
AS $$
DECLARE
	v_id_user INTEGER;
	v_name VARCHAR(255);
    v_email VARCHAR(254);
    v_email_verified BIT;
    v_has_filter_user BOOLEAN;
    result_errors REFCURSOR;
BEGIN
    v_id_user := TRIM(COALESCE(a_id_user, ''));
    v_name := TRIM(COALESCE(a_name, ''));
    v_email := TRIM(COALESCE(a_email, ''));
    v_email_verified := COALESCE(a_email_verified, FALSE);

    v_has_filter_user = CASE WHEN v_id_user = '' THEN FALSE ELSE TRUE END;
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Msg_Error;
    DROP TABLE IF EXISTS tmp_Shop_User;
    
    CREATE TABLE tmp_Shop_User (
		id_user INTEGER,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BOOLEAN NOT NULL
    );
    
    CREATE TABLE tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
		id_type INTEGER NOT NULL,
        -- code VARCHAR(50) NOT NULL,
        -- CONSTRAINT chk_tmp_Msg_Error_code CHECK (code IN (SELECT code FROM Shop_Msg_Error_Type)),
        CONSTRAINT FK_tmp_Msg_Error_id_type
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type(id_type),
		msg VARCHAR(4000) NOT NULL
    );
    
    
    -- Parse filters
    
    
    -- User
    IF v_has_filter_user THEN
        INSERT INTO tmp_Shop_User (
			id_user,
			active
		)
        SELECT id_user,
			active
		FROM Shop_User
        WHERE id_user = v_id_user
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
				v_id_user,
                v_name,
                v_email,
                v_email_verified
            );
            
            INSERT INTO tmp_Shop_User (
				id_user,
				active
			)
			SELECT id_user,
				active
			FROM Shop_User
			WHERE id_user = v_id_user
				AND active
			LIMIT 1
            ;
        END IF;
        
        v_id_user := (SELECT id_user FROM tmp_Shop_User LIMIT 1);
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
    /*
    -- User
    SELECT *
    FROM tmp_Shop_User
    ;
    */

    -- Errors
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
    
    /*
    -- Return arguments for test
    SELECT a_id_user,
		a_name,
        a_email,
        a_email_verified
    ;
    */
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Msg_Error;
    DROP TABLE IF EXISTS tmp_Shop_User;
END;
$$ LANGUAGE plpgsql;


/*

CALL p_shop_save_user (
	'',
	'',
	'',
    0
)

*/



/*

CALL p_shop_edit_user_basket (
	'', -- a_id_user
	'', -- a_ids_permutation_basket
	'', -- a_quantities_permutation_basket
    1, -- a_id_permutation_edit
	NULL, -- a_quantity_permutation_edit
    1, -- a_sum_not_edit
    1, -- a_id_currency_edit
    1 -- a_id_region_purchase
)

*


CREATE OR REPLACE PROCEDURE p_shop_edit_user_basket (
	IN a_id_user INTEGER,
	IN a_ids_permutation_basket VARCHAR(4000),
	IN a_quantities_permutation_basket VARCHAR(4000),
	IN a_id_permutation_edit INTEGER,
	IN a_quantity_permutation_edit INTEGER,
    IN a_sum_not_edit BOOLEAN,
    IN a_id_currency INTEGER,
    IN a_id_region_purchase INT
)
AS $$
DECLARE
	v_guid UUID;
    v_id_user INTEGER;
    v_ids_permutation_basket BOOLEAN;
	v_quantities_permutation_basket VARCHAR -- REMAKE WITH TEMP TABLE
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_user BOOLEAN;
    DECLARE v_has_filter_permutation_basket BOOLEAN;
    DECLARE v_has_filter_permutation_edit BOOLEAN;
    DECLARE v_has_filter_region BOOLEAN;
    DECLARE v_has_filter_currency BOOLEAN;
    DECLARE v_n_id_permutation_basket INTEGER;
    DECLARE v_n_quantity_permutation_basket INTEGER;
    DECLARE v_row_number INTEGER;
    DECLARE v_guid UUID;
    -- DECLARE v_id_user VARCHAR(100);
    DECLARE v_id_permission_product INTEGER;
    DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_now TIMESTAMP;
    -- DECLARE v_quantity_new INTEGER;
    DECLARE v_change_set_used BOOLEAN;
    DECLARE v_id_change_set INTEGER;
    
    SET v_guid = gen_random_uuid();
    
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
		SET a_sum_not_edit = TRUE;
    END IF;
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Msg_Error;
    DROP TABLE IF EXISTS tmp_Shop_Basket;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Quantity;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_User;
    
    CREATE TABLE tmp_Shop_User (
		id_user INTEGER,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BOOLEAN NOT NULL
    );
    
    CREATE TABLE tmp_Shop_Product (
		id_product INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		id_permutation INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
        display_order INTEGER NOT NULL,
        active INTEGER NOT NULL DEFAULT 1
	);
    
    CREATE TEMPORARY TABLE tmp_Shop_Quantity(
		quantity INTEGER NOT NULL,
        display_order INTEGER NOT NULL,
        active INTEGER NOT NULL DEFAULT 1
	);
    
    CREATE TABLE tmp_Shop_Basket (
		id_category INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Basket_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Product_Category(id_category),
        id_product INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Basket_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		id_permutation INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Basket_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
		id_region_purchase INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Basket_id_region_purchase
			FOREIGN KEY (id_region_purchase)
			REFERENCES Shop_Region(id_region),
		id_currency INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Basket_id_currency
			FOREIGN KEY (id_currency)
			REFERENCES Shop_Currency(id_currency),
        quantity INTEGER NOT NULL,
        active BOOLEAN NOT NULL DEFAULT TRUE
        /*
        display_order_category INTEGER NOT NULL,
        display_order_product INTEGER NOT NULL
        */
    );
    
    CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		id_type INTEGER NOT NULL,
        -- code VARCHAR(50) NOT NULL,
        -- CONSTRAINT chk_tmp_Msg_Error_code CHECK (code IN (SELECT code FROM Shop_Msg_Error_Type)),
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
    -- SET v_quantity_new = CASE WHEN a_sum_not_edit THEN quantity + a_quantity_product_edit ELSE a_quantity_product_edit END;
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
			SET v_has_filter_user = FALSE;
            
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
		SET v_change_set_used = FALSE;
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
        INNER JOIN Shop_Product_Category C
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
		-- Get product ids
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
		
		-- Get product quantities
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
        
        -- Compare number of product ids to number of quantities
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
			INNER JOIN Shop_Product_Category C
				ON P.id_category = C.id_category
				AND C.active
			-- RIGHT JOIN tmp_Shop_Basket t_UB ON ISNULL(t_UB.id_product)
			-- WHERE t_P.id_product NOT IN (SELECT id_product FROM tmp_Shop_Basket)
			;
            
            /*
            IF EXISTS(
				SELECT * 
                FROM Shop_Product P 
                INNER JOIN Shop_Product_Category C 
					ON P.id_category = C.id_category 
				INNER JOIN tmp_Shop_Basket t_B
					ON P.id_product = t_B.id_product 
				WHERE C.active = FALSE OR P.active = FALSE LIMIT 1
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
    
    
    -- Edit basket product
    IF v_has_filter_permutation_edit AND NOT EXISTS (SELECT msg FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		IF EXISTS (
			SELECT *
            FROM Shop_Product_Permutation PP
			INNER JOIN Shop_Product P 
				ON PP.id_product = P.id_product
            INNER JOIN Shop_Product_Category C 
				ON P.id_category = C.id_category 
            WHERE 
				(
					C.active = FALSE 
					OR P.active = FALSE 
                    OR PP.active = FALSE
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
            SET quantity = CASE WHEN a_sum_not_edit = TRUE THEN COALESCE(quantity, 0) + a_quantity_permutation_edit ELSE a_quantity_permutation_edit END,
				active = CASE WHEN CASE WHEN a_sum_not_edit = TRUE THEN COALESCE(quantity, 0) + a_quantity_permutation_edit ELSE a_quantity_permutation_edit END = FALSE THEN FALSE ELSE TRUE END
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
				SET v_change_set_used = TRUE;
				
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
					CASE WHEN a_quantity_permutation_edit > 0 THEN TRUE ELSE FALSE END
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
						SET v_change_set_used = TRUE;
						
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
		STRING_AGG(t_UB.id_product, ',') AS basket_product_ids
	FROM tmp_Shop_Basket t_UB
	-- WHERE ISNULL(t_UB.id_permutation)
    ;
    SELECT 
		STRING_AGG(t_UB.id_permutation, ',') AS basket_permutation_ids
	FROM tmp_Shop_Basket t_UB
	WHERE NOT ISNULL(t_UB.id_permutation)
    ;
    */
    -- Returns
	CALL p_shop_get_many_product (
		a_id_user, -- a_id_user
		1, -- a_get_all_categories
		'', -- a_ids_category
		0, -- a_get_inactive_categories
		0, -- a_get_all_products
		(
			SELECT 
				STRING_AGG(t_B.id_product, ',') 
			FROM tmp_Shop_Basket t_B
            WHERE active = TRUE
		), -- a_ids_product
		0, -- a_get_inactive_products
		0, -- a_get_first_product_only
		0, -- a_get_all_product_permutations
		(
			SELECT 
				STRING_AGG(t_B.id_permutation, ',') 
			FROM tmp_Shop_Basket t_B
            WHERE NOT ISNULL(t_B.id_permutation)
				AND active = TRUE
		), -- a_ids_permutation
		0, -- a_get_inactive_permutations
		0, -- a_get_all_images
		'', -- a_ids_image
		0, -- a_get_inactive_images
		1, -- a_get_first_image_only
		0, -- a_get_all_delivery_region
		a_id_region_purchase, -- a_ids_delivery_region
		0, -- a_get_inactive_delivery_region
		0, -- a_get_all_currency
		a_id_currency, -- a_ids_currency
		0, -- a_get_inactive_currency
		1, -- a_get_all_discount
		'', -- a_ids_discount
		0 -- a_get_inactive_discount
	);
    
    -- Basket
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
	INNER JOIN Shop_Product_Category C
		ON P.id_category = C.id_category
	INNER JOIN Shop_Product_Currency_Link PCL
		ON PP.id_permutation = PCL.id_permutation
        AND PCL.id_region_purchase = a_id_region_purchase
        AND PCL.id_currency = a_id_currency
	WHERE t_UB.active = TRUE
	ORDER BY C.display_order, P.display_order
	;
    
    -- Errors
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
    -- Return arguments for test
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
    
    -- DROP TABLE IF EXISTS tmp_Msg_Error;
    DELETE FROM tmp_Msg_Error WHERE guid = v_guid;
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN 
		DROP TABLE tmp_Msg_Error;
	END IF;
    DROP TABLE IF EXISTS tmp_Shop_Basket;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Quantity;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_User;
END;
$$ LANGUAGE plpgsql;

*/


/*

CALL p_shop_edit_user_basket (
	'', -- a_id_user
	'', -- a_ids_permutation_basket
	'', -- a_quantities_permutation_basket
    2, -- a_id_permutation_edit
	1, -- a_quantity_permutation_edit
    1, -- a_sum_not_edit
    2, -- a_id_currency_edit
    1 -- a_id_region_purchase
);

CALL p_shop_edit_user_basket (
	'', -- a_id_user
	'1', -- a_ids_permutation_basket
	'9', -- a_quantities_permutation_basket
    1, -- a_id_permutation_edit
	69, -- a_quantity_permutation_edit
    1, -- a_sum_not_edit
    1, -- a_id_currency_edit
    1 -- a_id_region_purchase
);
CALL p_shop_edit_user_basket (
	'auth0|6582b95c895d09a70ba10feF', -- a_id_user
	'2', -- a_ids_permutation_basket
	'7', -- a_quantities_permutation_basket
    2, -- a_id_permutation_edit
	NULL, -- a_quantity_permutation_edit
    1, -- a_sum_not_edit
    1, -- a_id_currency_edit
    1 -- a_id_region_purchase
);


 {'a_id_user': 'auth0|6582b95c895d09a70ba10fef', 
 'a_ids_permutation_basket': '1', 
 '7', -- a_quantities_permutation_basket
 'a_id_permutation_edit': 1, 
 'a_quantity_permutation_edit': 1, 
 'a_sum_not_edit': 1}
 
 select * from shop_user_basket;
 insert into shop_user_change_set (comment)
 values( 'deactivate duplicates');
 update SHOP_USER_BASKET
 set active = FALSE,
	id_change_set_user = (select id_change_set from shop_user_change_set order by id_change_set desc limit 1)
 where id_user = 'auth0|6582b95c895d09a70ba10fef'
	and id_product = 1
    ;
 select * from shop_user_basket;
*/


CREATE OR REPLACE FUNCTION p_shop_get_many_product (
	IN a_id_user INTEGER,
    IN a_get_all_category BOOLEAN,
	IN a_get_inactive_category BOOLEAN,
    IN a_get_first_category_only BOOLEAN,
	IN a_ids_category INTEGER[],
    IN a_get_all_product BOOLEAN,
	IN a_get_inactive_product BOOLEAN,
    IN a_get_first_product_only BOOLEAN,
	IN a_ids_product INTEGER[],
    IN a_get_all_product_permutation BOOLEAN,
	IN a_get_inactive_permutation BOOLEAN,
    IN a_get_first_permutation_only BOOLEAN,
	IN a_ids_permutation INTEGER[],
    IN a_get_all_image BOOLEAN,
	IN a_get_inactive_image BOOLEAN,
    IN a_get_first_image_only BOOLEAN,
    IN a_ids_image INTEGER[],
    IN a_get_all_delivery_region BOOLEAN,
	IN a_get_inactive_delivery_region BOOLEAN,
    IN a_ids_delivery_region INTEGER[],
    IN a_get_all_currency BOOLEAN,
	IN a_get_inactive_currency BOOLEAN,
    IN a_ids_currency INTEGER[],
    IN a_get_all_discount BOOLEAN,
	IN a_get_inactive_discount BOOLEAN,
    IN a_ids_discount INTEGER[]
)
RETURNS SETOF REFCURSOR -- categories, SETOF products, SETOF variations, SETOF prices, SETOF images, SETOF delivery_options, SETOF discounts
AS $$
DECLARE
	v_id_user INTEGER;
	v_get_all_category BOOLEAN;
	v_get_inactive_category BOOLEAN;
	v_get_first_category_only BOOLEAN;
	v_ids_category INTEGER[];
	v_get_all_product BOOLEAN;
	v_get_inactive_product BOOLEAN;
	v_get_first_product_only BOOLEAN;
	v_ids_product INTEGER[];
	v_get_all_product_permutation BOOLEAN;
	v_get_inactive_permutation BOOLEAN;
	v_get_first_permutation_only BOOLEAN;
	v_ids_permutation INTEGER[];
	v_get_all_image BOOLEAN;
	v_get_inactive_image BOOLEAN;
	v_get_first_image_only BOOLEAN;
	v_ids_image INTEGER[];
	v_get_all_delivery_region BOOLEAN;
	v_get_inactive_delivery_region BOOLEAN;
	v_ids_delivery_region INTEGER[];
	v_get_all_currency BOOLEAN;
	v_get_inactive_currency BOOLEAN;
	v_ids_currency INTEGER[];
	v_get_all_discount BOOLEAN;
	v_get_inactive_discount BOOLEAN;
	v_ids_discount INTEGER[];

    v_has_filter_category BOOLEAN;
    v_has_filter_product BOOLEAN;
    v_has_filter_permutation BOOLEAN;
    v_has_filter_image BOOLEAN;
    v_has_filter_delivery_region BOOLEAN;
    v_has_filter_currency BOOLEAN;
    v_has_filter_discount BOOLEAN;
    v_guid UUID;
    -- v_id_user VARCHAR(100);
    v_ids_permutation_unavailable VARCHAR(4000);
    v_id_permission_product INTEGER;
    v_ids_product_permission VARCHAR(4000);
    -- v_ids_permutation_permission VARCHAR(4000);
    v_id_access_level_view INTEGER;
    -- v_now TIMESTAMP;
    v_id_minimum INTEGER;

	result_categories REFCURSOR;
	result_products REFCURSOR;
	result_variations REFCURSOR;
	result_prices REFCURSOR;
	result_images REFCURSOR;
	result_delivery_options REFCURSOR;
	result_discounts REFCURSOR;
	/*
	-- result_errors REFCURSOR;
	*/
BEGIN
	v_id_user := a_id_user;
	v_get_all_category := COALESCE(a_get_all_category, FALSE);
	v_get_inactive_category := COALESCE(a_get_inactive_category, FALSE);
	v_get_first_category_only := COALESCE(a_get_first_category_only, TRUE);
	v_ids_category := COALESCE(a_ids_category, ARRAY[]::INTEGER[]);
	v_get_all_product := COALESCE(a_get_all_product, FALSE);
	v_get_inactive_product := COALESCE(a_get_inactive_product, FALSE);
	v_get_first_product_only := COALESCE(a_get_first_product_only, TRUE);
	v_ids_product := COALESCE(a_ids_product, ARRAY[]::INTEGER[]);
	v_get_all_product_permutation := COALESCE(a_get_all_product_permutation, FALSE);
	v_get_inactive_permutation := COALESCE(a_get_inactive_permutation, FALSE);
	v_get_first_permutation_only := COALESCE(a_get_first_permutation_only, TRUE);
	v_ids_permutation := COALESCE(a_ids_permutation, ARRAY[]::INTEGER[]);
	v_get_all_image := COALESCE(a_get_all_image, TRUE);
	v_get_inactive_image := COALESCE(a_get_inactive_image, FALSE);
	v_get_first_image_only := COALESCE(a_get_first_image_only, FALSE);
	v_ids_image := COALESCE(a_ids_image, ARRAY[]::INTEGER[]);
	v_get_all_delivery_region := COALESCE(a_get_all_delivery_region, TRUE);
	v_get_inactive_delivery_region := COALESCE(a_get_inactive_delivery_region, FALSE);
	v_ids_delivery_region := COALESCE(a_ids_delivery_region, ARRAY[]::INTEGER[]);
	v_get_all_currency := COALESCE(a_get_all_currency, TRUE);
	v_get_inactive_currency := COALESCE(a_get_inactive_currency, FALSE);
	v_ids_currency := COALESCE(a_ids_currency, ARRAY[]::INTEGER[]);
	v_get_all_discount := COALESCE(a_get_all_discount, TRUE);
	v_get_inactive_discount := COALESCE(a_get_inactive_discount, FALSE);
	v_ids_discount := COALESCE(a_ids_discount, ARRAY[]::INTEGER[]);
	/* 
	ROLLBACK;
	*/
    v_guid := gen_random_uuid();
    v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');

    v_has_filter_category = (CARDINALITY(v_ids_category) > 0);
    v_has_filter_product = (CARDINALITY(v_ids_product) > 0);
    v_has_filter_permutation = (CARDINALITY(v_ids_permutation) > 0);
    v_has_filter_image = (CARDINALITY(v_ids_image) > 0);
    v_has_filter_delivery_region = (CARDINALITY(v_ids_delivery_region) > 0);
    v_has_filter_currency = (CARDINALITY(v_ids_currency) > 0);
    v_has_filter_discount = (CARDINALITY(v_ids_discount) > 0);
    
    /*
    SELECT v_id_user, v_get_all_category, v_ids_category, v_get_inactive_category, v_get_all_product, 
    v_ids_product, v_get_inactive_product, v_get_first_product_only, v_get_all_product_permutation, v_ids_permutation, 
    v_get_inactive_permutation, v_get_all_image, v_ids_image, v_get_inactive_image, v_get_first_image_only, 
    v_get_all_delivery_region, v_ids_delivery_region, v_get_inactive_delivery_region, v_get_all_currency, v_ids_currency, 
    v_get_inactive_currency, v_get_all_discount, v_ids_discount, v_get_inactive_discount
    ;
    */
    
    -- Temporary tables
	/*
    DROP TEMPORARY TABLE IF EXISTS tmp_Discount;
    DROP TEMPORARY TABLE IF EXISTS tmp_Currency;
    DROP TEMPORARY TABLE IF EXISTS tmp_Delivery_Region;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Image;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Variation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product_Category;
	*/
    DROP TABLE IF EXISTS tmp_Discount;
    DROP TABLE IF EXISTS tmp_Currency;
    DROP TABLE IF EXISTS tmp_Delivery_Region;
    DROP TABLE IF EXISTS tmp_Shop_Image;
    DROP TABLE IF EXISTS tmp_Shop_Variation;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_Product_Category;
    
    CREATE TEMPORARY TABLE tmp_Shop_Product_Category (
		id_category INTEGER NOT NULL,
		/*
        CONSTRAINT FK_tmp_Shop_Product_Category_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Product_Category(id_category),
		*/
        active BOOLEAN NOT NULL,
        display_order INTEGER NOT NULL, 
        can_view BOOLEAN, 
        can_edit BOOLEAN, 
        can_admin BIT
    );
    
    CREATE TEMPORARY TABLE tmp_Shop_Product (
		id_category INTEGER NOT NULL,
		/*
        CONSTRAINT FK_tmp_Shop_Product_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Product_Category(id_category),
		*/
		id_product INTEGER NOT NULL,
		/*
        CONSTRAINT FK_tmp_Shop_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		*/
		-- product_has_variations BOOLEAN NOT NULL,
		id_permutation INTEGER NULL,
		/*
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
		*/
        active_category BOOLEAN NOT NULL,
        active_product BOOLEAN NOT NULL,
        active_permutation BOOLEAN NULL,
        display_order_category INTEGER NOT NULL, 
        display_order_product INTEGER NOT NULL, 
        display_order_permutation INTEGER NULL, 
        -- rank_permutation INTEGER NOT NULL, -- _in_category
		rank_category INTEGER NOT NULL,
		rank_product INTEGER NOT NULL,
		rank_permutation INTEGER NOT NULL,
        name VARCHAR(255) NOT NULL,
        description VARCHAR(4000) NOT NULL,
		/*
        price_GBP_full REAL NOT NULL,
		price_GBP_min REAL NOT NULL,
		*/
        latency_manufacture INTEGER NOT NULL,
		quantity_min REAL NOT NULL,
		quantity_max REAL NOT NULL,
		quantity_step REAL NOT NULL,
		quantity_stock REAL NOT NULL,
		is_subscription BOOLEAN NOT NULL,
		id_recurrence_interval INTEGER,
		/*
		CONSTRAINT FK_tmp_Shop_Product_id_recurrence_interval
			FOREIGN KEY (id_recurrence_interval)
			REFERENCES Shop_Recurrence_Interval(id_interval),
		*/
		count_recurrence_interval INTEGER,
        id_stripe_product VARCHAR(100),
        product_has_variations BOOLEAN NOT NULL,
        can_view BOOLEAN, 
        can_edit BOOLEAN, 
        can_admin BOOLEAN
    );
    
    /*
    CREATE TEMPORARY TABLE tmp_Shop_Variation (
		id_variation INTEGER NOT NULL,
		id_product INTEGER NOT NULL,
        display_order INTEGER NOT NULL
    );
    */
    
    CREATE TEMPORARY TABLE tmp_Shop_Image (
		id_image INTEGER NOT NULL,
		/*
        CONSTRAINT FK_tmp_Shop_Image_id_image
			FOREIGN KEY (id_image)
			REFERENCES Shop_Image(id_image),
		*/
		id_product INTEGER NOT NULL,
		/*
        CONSTRAINT FK_tmp_Shop_Image_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		*/
		id_permutation INTEGER NULL,
		/*
        CONSTRAINT FK_tmp_Shop_Image_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
		*/
        active BOOLEAN NOT NULL,
        display_order INTEGER NOT NULL,
        rank_in_product_permutation INTEGER NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Delivery_Region (
		id_region INTEGER NOT NULL,
		/*
        CONSTRAINT FK_tmp_Delivery_Region_id_region
			FOREIGN KEY (id_region)
			REFERENCES Shop_Region(id_region),
		*/
        active BOOLEAN NOT NULL,
        display_order INTEGER NOT NULL,
        requires_delivery_option BOOLEAN NOT NULL DEFAULT FALSE
    );
    
    CREATE TEMPORARY TABLE tmp_Currency (
		id_currency INTEGER NOT NULL,
		/*
        CONSTRAINT FK_tmp_Shop_Currency_id_currency
			FOREIGN KEY (id_currency)
			REFERENCES Shop_Currency(id_currency),
		*/
        active BOOLEAN NOT NULL,
        display_order INTEGER NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Discount (
		id_discount INTEGER NOT NULL,
		/*
        CONSTRAINT FK_tmp_Discount_id_discount
			FOREIGN KEY (id_discount)
			REFERENCES Shop_Discount(id_discount),
		*/
        active BOOLEAN NOT NULL,
        display_order INTEGER NOT NULL
    );
    
	/*
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		id_type INTEGER NOT NULL,
		/*
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
		*/
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    */

    
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
        -- rank_permutation,
		rank_category,
		rank_product,
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
        -- RANK() OVER (ORDER BY C.display_order, P.display_order, PP.display_order) AS rank_permutation, -- PARTITION BY P.id_category -- _in_category
		RANK() OVER (ORDER BY C.display_order) AS rank_category,
		RANK() OVER (PARTITION BY P.id_category ORDER BY P.display_order) AS rank_product,
		RANK() OVER (PARTITION BY P.id_category, P.id_product ORDER BY PP.display_order) AS rank_permutation,
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
	INNER JOIN Shop_Product_Category C
		ON P.id_category = C.id_category
	WHERE
		-- permutations
		(
			(
				v_get_all_product_permutation 
				OR (
					v_has_filter_permutation 
					-- AND FIND_IN_SET(PP.id_permutation, v_ids_permutation) > 0
					AND PP.id_permutation = ANY(v_ids_permutation)
				)
			)
			AND (v_get_inactive_permutation OR PP.active)
        )
		-- categories
		AND (
			(
				v_get_all_category 
                OR (
					v_has_filter_category 
					-- AND FIND_IN_SET(P.id_category, v_ids_category) > 0
					AND C.id_category = ANY(v_ids_category)
				)
			)
			AND (v_get_inactive_category OR C.active)
		) 
		-- products
		AND (
			(
				v_get_all_product 
				OR (
					v_has_filter_product 
					-- AND FIND_IN_SET(P.id_product, v_ids_product) > 0
					AND P.id_product = ANY(v_ids_product)
				)
			)
			AND (v_get_inactive_product OR P.active)
		)
    ;
    
    -- select * from tmp_Shop_Product;
    
    IF v_get_first_category_only THEN
		DELETE FROM tmp_Shop_Product t_P
			WHERE t_P.rank_category > 1
		;
    END IF;
    
    IF v_get_first_product_only THEN
		DELETE FROM tmp_Shop_Product t_P
			WHERE t_P.rank_product > 1
		;
    END IF;
    
    IF v_get_first_permutation_only THEN
		DELETE FROM tmp_Shop_Product t_P
			WHERE t_P.rank_permutation > 1
		;
    END IF;

    
    INSERT INTO tmp_Shop_Product_Category (
		id_category, 
        active,
        display_order
	)
	SELECT DISTINCT C.id_category,
		C.active,
		C.display_order
	FROM tmp_Shop_Product t_P
    INNER JOIN Shop_Product_Category C
		ON t_P.id_category = C.id_category
	ORDER BY C.display_order
	;
    
    /*
    INSERT INTO tmp_Shop_Variation (
		id_variation, id_product -- , display_order
	)
    SELECT P.id_variation, P.id_product -- , P.display_order
	FROM Shop_Variation V
    INNER JOIN tmp_Shop_Product t_P
		ON V.id_product = t_P.id_product
		WHERE V.active;
    */
    
    -- Product Images
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
	WHERE 
		(
			v_get_all_image 
			OR v_get_first_image_only 
			-- OR FIND_IN_SET(id_image, v_ids_image) > 0
			OR IPP.id_image = ANY(v_ids_image)
		)
		AND (v_get_inactive_image OR IPP.active)
	;
    
    IF v_get_first_image_only THEN
		DELETE FROM tmp_Shop_Image
			WHERE rank_in_product_permutation > 1
		;
    END IF;
    
    /*
    IF v_has_filter_image THEN
		DELETE FROM tmp_Shop_Product
			WHERE id_product NOT IN (SELECT DISTINCT id_product FROM tmp_Shop_Image);
		DELETE FROM tmp_Shop_Product_Category
			WHERE id_category NOT IN (SELECT DISTINCT id_category FROM tmp_Shop_Product);
    END IF;
    */
    
    -- Delivery Regions
    INSERT INTO tmp_Delivery_Region (
		id_region,
        active,
        display_order,
		requires_delivery_option
    )
    WITH RECURSIVE Recursive_CTE_Delivery_Region AS (
		SELECT 
			CAST(NULL AS INTEGER) AS id_region_parent,
            DR.id_region AS id_region_child,
            -- CASE WHEN FIND_IN_SET(DR.id_region, v_ids_delivery_region) > 0 THEN TRUE ELSE FALSE END AS requires_delivery_option
			(DR.id_region = ANY(v_ids_delivery_region)) AS requires_delivery_option
		FROM Shop_Product_Currency_Region_Link PCRL
		INNER JOIN Shop_Currency C ON PCRL.id_currency = C.id_currency
		INNER JOIN tmp_Shop_Product t_P 
			ON PCRL.id_product = t_P.id_product
			AND PCRL.id_permutation = t_P.id_permutation
		INNER JOIN Shop_Region DR ON PCRL.id_region_purchase = DR.id_region
		WHERE 
			(
				v_get_all_delivery_region
				-- OR FIND_IN_SET(DR.id_region, v_ids_delivery_region) > 0
				OR DR.id_region = ANY(v_ids_delivery_region)
			)
			AND (
				v_get_inactive_delivery_region
				OR DR.active = TRUE
			)
		UNION
        SELECT 
			DRB.id_region_parent,
			DRB.id_region_child,
            FALSE AS requires_delivery_option
		FROM Shop_Region_Branch DRB
        INNER JOIN Recursive_CTE_Delivery_Region r_DR 
			ON DRB.id_region_parent = r_DR.id_region_child
		WHERE (
			v_get_inactive_delivery_region
			OR DRB.active = TRUE
		)
	)
    SELECT
		DR.id_region,
        DR.active,
        DR.display_order,
		requires_delivery_option
	FROM Shop_Region DR
    INNER JOIN Recursive_CTE_Delivery_Region r_DR 
		ON DR.id_region = r_DR.id_region_parent
		OR DR.id_region = r_DR.id_region_child
    ;
    /*
    select * from tmp_delivery_region;
    SELECT * 
	FROM tmp_Shop_Product t_P 
	WHERE 
		/*(
			v_get_all_category 
			OR v_get_all_product
			OR v_get_all_product_permutation
		) */
		FIND_IN_SET(t_P.id_category, v_ids_category) > 0
		OR FIND_IN_SET(t_P.id_product, v_ids_product) > 0
		OR FIND_IN_SET(t_P.id_permutation, v_ids_permutation) > 0
	;
    */
    
    IF v_has_filter_delivery_region THEN
		v_ids_permutation_unavailable = (
			SELECT STRING_AGG(t_P.id_permutation, ', ')
			FROM (
				SELECT * 
				FROM tmp_Shop_Product t_P 
				WHERE
					/*(
						v_get_all_category 
						OR v_get_all_produc
						OR v_get_all_product_permutation
					)
					FIND_IN_SET(t_P.id_category, v_ids_category) > 0
					OR FIND_IN_SET(t_P.id_product, v_ids_product) > 0
					OR FIND_IN_SET(t_P.id_permutation, v_ids_permutation) > 0
					*/
					t_P.id_category = ANY(v_ids_category)
					OR t_P.id_product = ANY(v_ids_product)
					OR t_P.id_permutation = ANY(v_ids_permutation)
			) t_P
			LEFT JOIN (
				SELECT *
				FROM Shop_Product_Currency_Region_Link PCRL
				WHERE 
					v_get_all_delivery_region
					-- OR FIND_IN_SET(PCRL.id_region_purchase, v_ids_delivery_region) > 0
					OR PCRL.id_region_purchase = ANY(v_ids_delivery_region)
			) PCRL
				ON t_P.id_product = PCRL.id_product
				AND t_P.id_permutation = PCRL.id_permutation
			LEFT JOIN tmp_Delivery_Region t_DR
				ON PCRL.id_region_purchase = t_DR.id_region
				AND t_DR.requires_delivery_option
			WHERE 
				ISNULL(t_DR.id_region)
		);
        IF NOT ISNULL(v_ids_permutation_unavailable) THEN
			/*
			INSERT INTO tmp_Msg_Error (
				guid,
				id_type,
                code,
				msg
			)
			VALUES (
				v_guid,
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'PRODUCT_AVAILABILITY' LIMIT 1),
                'PRODUCT_AVAILABILITY',
				'Error: The following permutation IDs are not available in this region: ' || COALESCE(v_ids_permutation_unavailable, 'NULL')
			);
			*/
			RAISE EXCEPTION 'The following permutation IDs are not available in this region: %', COALESCE(v_ids_permutation_unavailable, 'NULL')
			USING ERRCODE = '22000';
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
    
    -- select * from tmp_Shop_Product;
    
    -- Currencies
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
	INNER JOIN tmp_Shop_Product t_P 
		ON PCRL.id_product = t_P.id_product
		AND PCRL.id_permutation = t_P.id_permutation
	INNER JOIN tmp_Delivery_Region t_DR ON PCRL.id_region_purchase = t_DR.id_region
	WHERE
		(
			v_get_all_currency
			-- R FIND_IN_SET(C.id_currency, v_ids_currency) > 0
			OR C.id_currency = ANY(v_ids_currency)
		)
		AND (
			v_get_inactive_currency
			OR (
				C.active
				AND PCRL.active
			)
		)
	;
	
	-- select * from tmp_Currency;
	
	IF v_has_filter_currency THEN
		v_ids_permutation_unavailable = (
			SELECT STRING_AGG(t_P.id_permutation, ', ')
			FROM (
				SELECT * 
				FROM tmp_Shop_Product t_P 
				WHERE 
					/*(
						v_get_all_category 
						OR v_get_all_product
						OR v_get_all_product_permutation
					)
					FIND_IN_SET(t_P.id_category, v_ids_category) > 0
					OR FIND_IN_SET(t_P.id_product, v_ids_product) > 0
					OR FIND_IN_SET(t_P.id_permutation, v_ids_permutation) > 0
					*/
					t_P.id_category = ANY(v_ids_category)
					OR t_P.id_product = ANY(v_ids_product)
					OR t_P.id_permutation = ANY(v_ids_permutation)
			) t_P
			INNER JOIN (
				SELECT *
				FROM Shop_Product_Currency_Region_Link PCRL
				WHERE 
					(
						v_get_all_currency
						-- OR FIND_IN_SET(PCRL.id_currency, v_ids_currency) > 0
						OR PCRL.id_currency = ANY(v_ids_currency)
					)
			) PCRL
				ON t_P.id_permutation = PCRL.id_permutation
			LEFT JOIN tmp_Currency t_C
				ON PCRL.id_currency = t_C.id_currency
			WHERE ISNULL(t_C.id_currency) 
		);
		IF NOT ISNULL(v_ids_permutation_unavailable) THEN
			/*
			INSERT INTO tmp_Msg_Error (
				guid,
				id_type,
				code,
				msg
			)
			VALUES (
				v_guid,
				(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'PRODUCT_AVAILABILITY' LIMIT 1),
				'PRODUCT_AVAILABILITY',
				'Error: The following permutation IDs are not available in this currency: ' || COALESCE(v_ids_permutation_unavailable, 'NULL')
			);
			*/
			RAISE EXCEPTION 'The following permutation IDs are not available in this currency: %', COALESCE(v_ids_permutation_unavailable, 'NULL')
			USING ERRCODE = '22000';
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
    
    -- Discounts
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
		AND D.id_permutation = t_P.id_permutation
	WHERE
		(
			v_get_all_discount
			-- OR FIND_IN_SET(D.id_discount, v_ids_discount) > 0
			OR D.id_discount = ANY(v_ids_discount)
		)
		AND (
			v_get_inactive_discount
			OR D.active
		)
	;
    -- select 'pre-permission results';
    -- select * from tmp_Shop_Product;
    
    -- Permissions
    IF EXISTS (SELECT * FROM tmp_Shop_Product_Category LIMIT 1) THEN
        -- v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER);
        v_id_permission_product := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
        v_ids_product_permission := (SELECT STRING_AGG(id_product, ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_product));
        -- v_ids_permutation_permission := (SELECT STRING_AGG(id_permutation, ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
        
        -- SELECT v_guid, v_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission;
        -- select * from Shop_User_Eval_Temp;
        
        CALL p_shop_user_eval(v_guid, v_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission);
        
        -- select * from Shop_User_Eval_Temp;
        
        UPDATE tmp_Shop_Product t_P
        SET t_P.can_view = UE_T.can_view,
			t_P.can_edit = UE_T.can_edit,
            t_P.can_admin = UE_T.can_admin
		FROM tmp_Shop_Product t_P
        INNER JOIN Shop_User_Eval_Temp UE_T
			ON t_P.id_product = UE_T.id_product
			AND UE_T.GUID = v_guid
		;
		-- select * from Shop_User_Eval_Temp;
		-- select * from tmp_Shop_Product;
        
        DELETE FROM tmp_Shop_Product t_P
		WHERE 
			-- FIND_IN_SET(t_P.id_product, (SELECT STRING_AGG(UET.id_product, ',') FROM Shop_User_Eval_Temp UET)) = FALSE -- id_product NOT LIKE CONCAT('%', (SELECT STRING_AGG(id_product, '|') FROM Shop_User_Eval_Temp), '%');
			t_P.id_product NOT IN (
				SELECT id_product
				FROM Shop_User_Eval_Temp UET
				WHERE UET.GUID = v_guid
			)
			OR ISNULL(t_P.can_view)
			OR t_P.can_view = FALSE
        ;
        
        -- CALL p_shop_user_eval_clear_temp(v_guid);
        -- DROP TABLE IF EXISTS Shop_User_Eval_Temp;
        DELETE FROM Shop_User_Eval_Temp
        WHERE GUID = v_guid
        ;
    END IF;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns
    -- v_now := CURRENT_TIMESTAMP;
    
    -- Categories
	OPEN result_categories FOR
	-- RETURN QUERY
		SELECT 
			DISTINCT t_C.id_category,
			C.name,
			C.description,
			C.display_order
		FROM tmp_Shop_Product_Category t_C
		INNER JOIN Shop_Product_Category C
			ON t_C.id_category = C.id_category
		INNER JOIN tmp_Shop_Product t_P
			ON t_C.id_category = t_P.id_category
		ORDER BY C.display_order
		;
    RETURN NEXT result_categories;
	-- CLOSE result_categories;
    
    -- Products
	OPEN result_products FOR
	-- RETURN QUERY
		SELECT 
			t_P.id_product,
			t_P.id_permutation,
			t_P.name,
			t_P.description,
			P.has_variations,
			P.id_category,
			PP.cost_local,
			PP.id_currency_cost,
			PP.profit_local_min,
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
			COALESCE(t_P.can_view, FALSE),
			COALESCE(t_P.can_edit, FALSE),
			COALESCE(t_P.can_admin, FALSE)
		FROM tmp_Shop_Product t_P
		INNER JOIN Shop_Product P ON t_P.id_product = P.id_product
		INNER JOIN Shop_Product_Permutation PP ON t_P.id_permutation = PP.id_permutation
		LEFT JOIN Shop_Recurrence_Interval RI ON t_P.id_recurrence_interval = RI.id_interval
		ORDER BY t_P.rank_permutation
		;
    RETURN NEXT result_products;
	-- CLOSE result_products;
    
    -- Variations
	OPEN result_variations FOR
	-- RETURN QUERY
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
		INNER JOIN tmp_Shop_Product t_P ON PPVL.id_permutation = t_P.id_permutation
		WHERE V.active
			AND PPVL.active
		;
    RETURN NEXT result_variations;
	-- CLOSE result_variations;

    /*
    -- Permutation variations output
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
    -- select * from Shop_Product_Currency_Region_Link;
    -- select * from shop_currency;
    /*
    select * from tmp_Currency;
    select * from tmp_delivery_region;
    select * from tmp_shop_product;
    */
    
    -- Product Price
	OPEN result_prices FOR
	-- RETURN QUERY
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
			ON PCRL.id_product = t_P.id_product
			AND PCRL.id_permutation = t_P.id_permutation
		-- INNER JOIN Shop_Product P ON PCRL.id_product = P.id_product
		INNER JOIN tmp_Currency t_C ON PCRL.id_currency = t_C.id_currency
		INNER JOIN Shop_Currency C ON t_C.id_currency = C.id_currency
		INNER JOIN tmp_Delivery_Region t_DR ON PCRL.id_region_purchase = t_DR.id_region
		WHERE (
			v_get_inactive_product 
			AND v_get_inactive_permutation
			AND v_get_inactive_currency
			AND v_get_inactive_delivery_region
			OR PCRL.active
		)
		ORDER BY t_P.rank_permutation
		;
    RETURN NEXT result_prices;
	-- CLOSE result_prices;

    /*
    -- Currency
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
    
    -- Images
	OPEN result_images FOR
	-- RETURN QUERY
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
				AND t_I.id_permutation = t_P.id_permutation
		ORDER BY t_P.rank_permutation, I.display_order
		;
    RETURN NEXT result_images;
	-- CLOSE result_images;
    
    -- Delivery options
	OPEN result_delivery_options FOR
	-- RETURN QUERY
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
			STRING_AGG(DR.code, ',') AS codes_region,
			STRING_AGG(DR.name, ',') AS names_region,
			PDOL.price_local,
			PDOL.display_order
		FROM Shop_Delivery_Option _DO
		INNER JOIN Shop_Product_Delivery_Option_Link PDOL
			ON _DO.id_option = PDOL.id_delivery_option
			AND (
				v_get_inactive_delivery_region
				OR PDOL.active
			)
		INNER JOIN tmp_Shop_Product t_P
			ON PDOL.id_product = t_P.id_product
			AND PDOL.id_permutation = t_P.id_permutation
		INNER JOIN tmp_Delivery_Region t_DR ON PDOL.id_region = t_DR.id_region
		INNER JOIN Shop_Region DR ON t_DR.id_region = DR.id_region
		WHERE (
			v_get_inactive_delivery_region
			OR _DO.active
		)
		GROUP BY t_P.id_category, t_P.id_product, PDOL.id_permutation, t_P.rank_permutation, DR.id_region, _DO.id_option, PDOL.id_link
		ORDER BY t_P.rank_permutation, PDOL.display_order
		;
    RETURN NEXT result_delivery_options;
    -- CLOSE result_delivery_options;

    -- Discounts
	OPEN result_discounts FOR
	-- RETURN QUERY
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
			STRING_AGG(DR.code, ', ') OVER(PARTITION BY D.id_discount) AS codes_region,
			STRING_AGG(DR.name, ', ') OVER(PARTITION BY D.id_discount) AS names_region,
			STRING_AGG(C.code, ', ') OVER(PARTITION BY D.id_discount) AS codes_currency,
			STRING_AGG(C.name, ', ') OVER(PARTITION BY D.id_discount) AS names_currency,
			ROW_NUMBER() OVER(ORDER BY D.display_order) AS display_order
		FROM tmp_Discount t_D
		INNER JOIN Shop_Discount D ON t_D.id_discount = D.id_discount
		INNER JOIN Shop_Product P ON D.id_product = P.id_product
		INNER JOIN tmp_Shop_Product t_P
			ON D.id_product = t_P.id_product
			-- AND D.id_permutation = t_P.id_permutation
		INNER JOIN Shop_Discount_Region_Currency_Link DRCL
			ON D.id_discount = DRCL.id_discount
		INNER JOIN tmp_Delivery_Region t_DR ON DRCL.id_region = t_DR.id_region
		INNER JOIN Shop_Region DR ON t_DR.id_region = DR.id_region
		INNER JOIN tmp_Currency t_C ON DRCL.id_currency = t_C.id_currency
		INNER JOIN Shop_Currency C ON t_C.id_currency = C.id_currency
		GROUP BY D.id_discount, DR.id_region, C.id_currency, P.id_category, P.id_product, D.id_permutation
		ORDER BY D.display_order, DR.display_order, C.display_order
		;
    RETURN NEXT result_discounts;
	-- CLOSE result_discounts;
    /*
    -- Delivery Regions
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
			v_get_inactive_delivery_region 
            OR PDRL.active
		)
	INNER JOIN tmp_Shop_Product t_P
		ON PDRL.id_product = t_P.id_product
		AND PDRL.id_permutation = t_P.id_permutation
	INNER JOIN tmp_Currency t_C ON PDRL.id_currency = t_C.id_currency
	ORDER BY t_DR.display_order
	;
    */
    
    -- Errors
	/*
	OPEN result_errors FOR
	RETURN QUERY
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
    RETURN NEXT result_errors;
    */
	
    /*
    -- Return arguments for test
    SELECT
	v_ids_category,
	v_get_inactive_category,
	v_ids_product,
	v_get_inactive_product,
    v_get_first_product_only,
    v_get_all_product,
	v_ids_image,
	v_get_inactive_image,
    v_get_first_image_only,
    v_get_all_image
    ;
    */
    
    -- select 'other outputs';
    -- select * from tmp_Shop_Product;
    
    -- Clean up
	/*
    DROP TEMPORARY TABLE IF EXISTS tmp_Discount;
    DROP TEMPORARY TABLE IF EXISTS tmp_Currency;
    DROP TEMPORARY TABLE IF EXISTS tmp_Delivery_Region;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Image;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Variation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product_Category;
    DROP TABLE IF EXISTS tmp_Discount;
    DROP TABLE IF EXISTS tmp_Currency;
    DROP TABLE IF EXISTS tmp_Delivery_Region;
    DROP TABLE IF EXISTS tmp_Shop_Image;
    DROP TABLE IF EXISTS tmp_Shop_Variation;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_Product_Category;
	*/
END;
$$ LANGUAGE plpgsql;


/*

DROP FUNCTION IF EXISTS fetch_results;

CREATE OR REPLACE FUNCTION fetch_results()
RETURNS VOID AS $$
DECLARE
    curs refcursor;
    rec record;
    curs1 refcursor;
    rec1 record;
    curs2 refcursor;
    rec2 record;
BEGIN
    FOR curs IN SELECT p_shop_get_many_product (
		1, -- a_id_user
		TRUE, -- a_get_all_category
		FALSE, -- a_get_inactive_category
		FALSE, -- a_get_first_category_only
		ARRAY[]::INTEGER[], -- a_ids_category
		TRUE, -- a_get_all_product
		FALSE, -- a_get_inactive_product
		FALSE, -- a_get_first_product_only
		ARRAY[]::INTEGER[], -- a_ids_product
		TRUE, -- a_get_all_product_permutation
		FALSE, -- a_get_inactive_permutation
		FALSE, -- a_get_first_permutation_only
		ARRAY[1, 2, 3, 4, 5]::INTEGER[], -- a_ids_permutation
		FALSE, -- a_get_all_image
		FALSE, -- a_get_inactive_image
		TRUE, -- a_get_first_image_only
		ARRAY[]::INTEGER[], -- a_ids_image
		FALSE, -- a_get_all_delivery_region
		FALSE, -- a_get_inactive_delivery_region
		ARRAY[]::INTEGER[], -- a_ids_delivery_region
		FALSE, -- a_get_all_currency
		FALSE, -- a_get_inactive_currency
		ARRAY[]::INTEGER[], -- a_ids_currency
		TRUE, -- a_get_all_discount
		FALSE, -- a_get_inactive_discount
		ARRAY[]::INTEGER[] -- a_ids_discount
	) LOOP
        RAISE NOTICE 'Fetching from cursor: %', curs;
        LOOP
            FETCH curs INTO rec;
            EXIT WHEN NOT FOUND;
            RAISE NOTICE 'Record: %', rec;
        END LOOP;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT fetch_results();

*/


CREATE OR REPLACE FUNCTION p_shop_get_many_currency (
	IN a_get_inactive_currency BOOLEAN
)
RETURNS SETOF REFCURSOR
AS $$
DECLARE
	v_get_inactive_currency BOOLEAN;
	result_currency REFCURSOR;
BEGIN
	v_get_inactive_currency := COALESCE(a_get_inactive_currency, FALSE);
    
	OPEN result_currency FOR
		SELECT 
			C.id_currency,
			C.code,
			C.name,
			C.factor_from_GBP,
			C.active,
			C.display_order
		FROM Shop_Currency C
		WHERE v_get_inactive_currency
			OR C.active
		ORDER BY C.display_order
		;
	RETURN NEXT result_currency;
END;
$$ LANGUAGE plpgsql;


/*

DROP FUNCTION IF EXISTS fetch_results;

CREATE OR REPLACE FUNCTION fetch_results()
RETURNS VOID AS $$
DECLARE
    curs refcursor;
    rec record;
BEGIN
    FOR curs IN SELECT p_shop_get_many_currency (
		FALSE -- a_get_inactive_currency
	) LOOP
        RAISE NOTICE 'Fetching from cursor: %', curs;
        LOOP
            FETCH curs INTO rec;
            EXIT WHEN NOT FOUND;
            RAISE NOTICE 'Record: %', rec;
        END LOOP;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT fetch_results();

*/


CREATE OR REPLACE FUNCTION p_shop_get_many_region (
	IN a_get_inactive_region BOOLEAN
)
RETURNS SETOF REFCURSOR
AS $$
DECLARE
	v_get_inactive_region BOOLEAN;
	result_region REFCURSOR;
BEGIN
	v_get_inactive_region := COALESCE(a_get_inactive_region, FALSE);
    
    OPEN result_region FOR
		SELECT 
			R.id_region,
			R.code,
			R.name,
			R.active,
			R.display_order
		FROM Shop_Region R
		WHERE v_get_inactive_region
			OR R.active
		ORDER BY R.display_order
		;
	-- RETURN NEXT result_region;
END;
$$ LANGUAGE plpgsql;


/*

DROP FUNCTION IF EXISTS fetch_results;

CREATE OR REPLACE FUNCTION fetch_results()
RETURNS VOID AS $$
DECLARE
    curs refcursor;
    rec record;
    curs1 refcursor;
    rec1 record;
    curs2 refcursor;
    rec2 record;
BEGIN
    FOR curs IN SELECT p_shop_get_many_region (
		FALSE -- a_get_inactive_region
	) LOOP
        RAISE NOTICE 'Fetching from cursor: %', curs;
        LOOP
            FETCH curs INTO rec;
            EXIT WHEN NOT FOUND;
            RAISE NOTICE 'Record: %', rec;
        END LOOP;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT fetch_results();

*/


CREATE OR REPLACE FUNCTION p_shop_get_many_user_order (
	IN a_id_user INTEGER,
    IN a_ids_order VARCHAR(4000),
    IN a_n_order_max INTEGER,
	IN a_id_checkout_session VARCHAR(200)
)
RETURNS SETOF REFCURSOR
AS $$
DECLARE
	v_id_user INTEGER;
	v_ids_order VARCHAR(4000);
	v_n_order_max INTEGER;
	v_id_checkout_session VARCHAR(200);
	v_has_filter_user BOOLEAN;
	v_has_filter_order BOOLEAN;
	v_has_filter_session BOOLEAN;
	v_code_error_data VARCHAR(200);
	v_code_error_permission VARCHAR(200);
	v_guid UUID;
	result_orders REFCURSOR;
	-- result_errors REFCURSOR;
BEGIN
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_ids_order := TRIM(COALESCE(a_ids_order, ''));
	v_n_order_max := a_n_order_max;
	v_id_checkout_session := TRIM(COALESCE(a_id_checkout_session, ''));
    
    v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 1);
    v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
	v_guid = gen_random_uuid();

    v_has_filter_user = CASE WHEN v_id_user = '' THEN FALSE ELSE TRUE END;
	v_ids_order = REPLACE(v_ids_order, '|', ',');
    v_has_filter_order = CASE WHEN v_ids_order = '' THEN FALSE ELSE TRUE END;
    v_has_filter_session = CASE WHEN v_id_checkout_session = '' THEN FALSE ELSE TRUE END;
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_User;
    DROP TABLE IF EXISTS tmp_Shop_Order;
    
	/*
    CREATE TABLE tmp_Shop_User(
		id_user INTEGER PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BOOLEAN NOT NULL
    );
	*/
    
    CREATE TEMPORARY TABLE tmp_Shop_Order (
		id_order INTEGER NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_Order_id_order
			FOREIGN KEY (id_order)
			REFERENCES Shop_User_Order(id_order),
        active BOOLEAN NOT NULL
    );
    
	/*
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		-- id_type INTEGER NOT NULL,
		-- CONSTRAINT FK_tmp_Msg_Error_id_type FOREIGN KEY (id_type)
		-- 	REFERENCES Shop_Msg_Error_Type (id_type),
		code VARCHAR(50),
        msg VARCHAR(4000) NOT NULL
	);
    */
    
    -- User
	IF v_has_filter_user THEN
		INSERT INTO tmp_Shop_User (
			id_user,
			active
		)
		SELECT id_user,
			active
		FROM Shop_User
		WHERE id_user = v_id_user
			AND active
		LIMIT 1
		;
		
		v_has_filter_user = EXISTS (SELECT id_user FROM tmp_Shop_User LIMIT 1);
		v_id_user := (SELECT id_user FROM tmp_Shop_User LIMIT 1);
	ELSE
		RAISE EXCEPTION 'Valid user ID must be provided.'
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Permissions
	CALL p_shop_user_eval (
		v_guid, -- a_guid
		a_id_user, 	-- a_id_user
		0,		-- a_get_inactive_users
		CONVERT((SELECT id_permission FROM Shop_Permission WHERE 'STORE_USER' = code), CHAR),		-- a_ids_permission
		(SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' AND active),		-- a_ids_access_level
		'',		-- a_ids_product
		''		-- a_ids_permutation
	);
	
	IF NOT (SELECT can_edit FROM Shop_User_Eval_Temp WHERE guid = v_guid) THEN
		RAISE EXCEPTION 'User ID does not have permission to access orders.'
		USING ERRCODE = '42501'
		;
	END IF;
	
	DELETE FROM Shop_User_Eval_Temp
	WHERE guid = v_guid
	;
    
    -- Invalid Order IDs
	IF v_has_filter_order AND EXISTS (
		SELECT * 
		FROM Shop_User_Order 
		WHERE 
			NOT (id_user = v_id_user)
			AND id_order = ANY(v_ids_order)
		LIMIT 1
	) THEN  -- id_order LIKE CONCAT('%', v_ids_order, '%') LIMIT 1) THEN
		RAISE EXCEPTION 'You do not have access to the following order IDs: %', (
			SELECT STRING_AGG(id_order, ', ') 
			FROM Shop_User_Order 
			WHERE 
				NOT (id_user = v_id_user) 
				AND id_order = ANY(v_ids_order)
		)
		USING ERRCODE = '22000'
		;
	END IF;
	-- Invalid Checkout Session IDs
	IF v_has_filter_session AND EXISTS (
		SELECT * 
		FROM Shop_User_Order 
		WHERE 
			NOT (id_user = v_id_user)  
			AND id_checkout_session = v_id_checkout_session
	) THEN
		RAISE EXCEPTION 'You do not have access to the following checkout session IDs: %', (
			SELECT STRING_AGG(id_order, ', ') 
			FROM Shop_User_Order 
			WHERE 
				NOT (id_user = v_id_user) 
				AND id_checkout_session = v_id_checkout_session
		)
		USING ERRCODE = '22000'
		;
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
		WHERE ((NOT v_has_filter_order OR FIND_IN_SET(UO.id_order, v_ids_order) > 0) -- UO.id_order LIKE CONCAT('%', v_ids_order, '%'))
			OR (NOT v_has_filter_session OR UO.id_checkout_session = v_id_checkout_session))
			AND UO.active
		;
    END IF;
    
    
    
    -- Returns
    /*
    SELECT *
    FROM tmp_Shop_User
    ;
    */
    
	OPEN result_orders FOR
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
    RETURN NEXT result_orders;
    
	/*
    -- Errors
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
    */

    
    /*
    -- Return arguments for test
    SELECT
		v_id_user,
		v_ids_order,
		v_n_order_max,
		v_id_checkout_session
    ;
    */
    
    -- Clean up
    -- DROP TABLE IF EXISTS tmp_Shop_User;
    -- DROP TABLE IF EXISTS tmp_Shop_Order;
END;
$$ LANGUAGE plpgsql;


/*

DROP FUNCTION IF EXISTS fetch_results;

CREATE OR REPLACE FUNCTION fetch_results()
RETURNS VOID AS $$
DECLARE
    curs refcursor;
    rec record;
    curs1 refcursor;
    rec1 record;
    curs2 refcursor;
    rec2 record;
BEGIN
    FOR curs IN SELECT p_shop_get_many_user_order (
		'auth0|6582b95c895d09a70ba10fef', # a_id_user
		'1', # a_ids_order
		0, # a_n_order_max
		'' # a_id_checkout_session
	) LOOP
        RAISE NOTICE 'Fetching from cursor: %', curs;
        LOOP
            FETCH curs INTO rec;
            EXIT WHEN NOT FOUND;
            RAISE NOTICE 'Record: %', rec;
        END LOOP;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT fetch_results();

*/


/*

CALL p_shop_get_many_user_order (
	'auth0|6582b95c895d09a70ba10fef', # a_id_user
    '1', # a_ids_order
	0, # a_n_order_max
    '' # a_id_checkout_session
);

CALL p_shop_get_many_user_order (
	'', # a_id_user
    '1', # a_ids_order
	0, # a_n_order_max
    '' # a_id_checkout_session
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


/*

CALL p_shop_get_many_stripe_product_new (
	''
)

*/

CREATE OR REPLACE FUNCTION p_shop_get_many_stripe_product_new (
	IN a_id_user INTEGER
)
RETURNS SETOF REFCURSOR
AS $$
DECLARE
	v_id_user INTEGER;
	v_code_error_data VARCHAR(200);
	v_code_error_permission VARCHAR(200);
	v_guid UUID; 
	result_products REFCURSOR;
	result_product_variation_links REFCURSOR;
	-- result_errors REFCURSOR;
BEGIN
	v_id_user := a_id_user;
    v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 1);
    v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
	v_guid = gen_random_uuid();
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_User;
    
    CREATE TEMPORARY TABLE tmp_Shop_User(
		id_user INTEGER PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BOOLEAN NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Shop_Product (
		id_product INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		id_permutation INTEGER NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
        active BOOLEAN NOT NULL,
        display_order_product INTEGER NOT NULL,
        display_order_permutation INTEGER NOT NULL,
        name VARCHAR(200) NOT NULL,
        description VARCHAR(4000) NOT NULL
    );
    
	/*
    CREATE TABLE IF NOT EXISTS tmp_Msg_Error ( -- IF NOT EXISTS 
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		code VARCHAR(50) NOT NULL,
        -- CONSTRAINT chk_tmp_Msg_Error_code CHECK (code IN (SELECT code FROM Shop_Msg_Error_Type)),
		/*
        id_type INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Msg_Error_id_type
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type(id_type),
		*/
		msg VARCHAR(4000) NOT NULL
    );
    */

    
    -- User
    IF NOT EXISTS(
		SELECT *
		FROM Shop_User
		WHERE 
			id_user = v_id_user
			AND active
	) THEN
		RAISE EXCEPTION 'Valid user ID required.'
		USING ERRCODE = '22000'
        ;
    END IF;

	INSERT INTO tmp_Shop_User (
		id_user,
		active
	)
	SELECT id_user,
		active
	FROM Shop_User
	WHERE id_user = v_id_user
		AND active
	LIMIT 1
	;
    
    -- Get products
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
			P.name, ': ' || names_variation AS name,
			P.description || ' With variations: ' || type_name_pairs_variation AS description,
			t_PPPV.id_stripe_product
		FROM (
			SELECT P.id_product,
				PP.id_permutation,
				PP.active,
				P.display_order AS display_order_product,
				PP.display_order AS display_order_permutation,
				STRING_AGG(V.name, ' ') AS names_variation,
				STRING_AGG(VT.name || ': ' || V.name, ', ') AS type_name_pairs_variation,
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
    
    -- Permissions
	CALL p_shop_user_eval (
		v_guid, -- a_guid
		v_id_user, 	-- a_id_user
		0,		-- a_get_inactive_users
		CONVERT((SELECT id_permission FROM Shop_Permission WHERE 'STORE_ADMIN' = code), CHAR),		-- a_ids_permission
		(SELECT id_access_level FROM Shop_Access_Level WHERE code = 'ADMIN' AND active),		-- a_ids_access_level
		(SELECT STRING_AGG(id_product, ',') From tmp_Shop_Product),		-- a_ids_product
		(SELECT STRING_AGG(id_permutation, ',') From tmp_Shop_Product)		-- a_ids_permutation --  WHERE NOT ISNULL(id_permutation)
	);
	
	IF EXISTS (SELECT can_admin FROM Shop_User_Eval_Temp WHERE guid = v_guid AND NOT can_admin) THEN
		RAISE EXCEPTION 'User ID does not have permission to get all new stripe products.'
		USING ERRCODE = '42501'
        ;
	END IF;
	
	DELETE FROM Shop_User_Eval_Temp
	WHERE guid = v_guid
	;
    
    
    
    
    -- Returns
    /*
    SELECT *
    FROM tmp_Shop_User
    ;
    */
    
	/*
    IF EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		DELETE FROM tmp_Shop_Product;
	END IF;
    */

	OPEN result_products FOR
		SELECT id_product,
			id_permutation,
			name,
			description
		FROM tmp_Shop_Product
		ORDER BY display_order_product, display_order_permutation
		;
	RETURN NEXT result_products;

	OPEN result_product_variation_links FOR
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
    RETURN NEXT result_product_variation_links;
    
    -- Errors
	/*
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
    */

    
    /*
    -- Return arguments for test
    SELECT
		v_id_user
    ;
    */
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_User;
END;
$$ LANGUAGE plpgsql;


/*

DROP FUNCTION IF EXISTS fetch_results;

CREATE OR REPLACE FUNCTION fetch_results()
RETURNS VOID AS $$
DECLARE
    curs refcursor;
    rec record;
    curs1 refcursor;
    rec1 record;
    curs2 refcursor;
    rec2 record;
BEGIN
    FOR curs IN SELECT p_shop_get_many_stripe_product_new (
	'auth0|6582b95c895d09a70ba10fef'
	) LOOP
        RAISE NOTICE 'Fetching from cursor: %', curs;
        LOOP
            FETCH curs INTO rec;
            EXIT WHEN NOT FOUND;
            RAISE NOTICE 'Record: %', rec;
        END LOOP;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT fetch_results();

*/


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
			'ead789a1-c7ac-11ee-a256-b42e9986184a', -- a_guid
			'auth0|6582b95c895d09a70ba10fef', 	-- a_id_user
			0,		-- a_get_inactive_users
			'4',		-- a_ids_permission
			'3',		-- a_ids_access_level
			'1',		-- a_ids_product
			'1'		-- a_ids_permutation --  WHERE NOT ISNULL(id_permutation)
		);
        
*/



/*

CALL p_shop_get_many_stripe_price_new (
	''
)

*/



CREATE OR REPLACE FUNCTION p_shop_get_many_stripe_price_new (
	IN a_id_user INTEGER
)
RETURNS SETOF REFCURSOR
AS $$
DECLARE
	v_id_user INTEGER;
	v_has_filter_user BOOLEAN;
	v_code_error_data VARCHAR(200);
	v_code_error_permission VARCHAR(200);
	v_guid UUID;
	result_products REFCURSOR;
	-- result_errors REFCURSOR;
BEGIN
	v_id_user := TRIM(COALESCE(a_id_user, ''));
    v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 1);
    v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
	v_guid = gen_random_uuid();

    v_has_filter_user = CASE WHEN v_id_user = '' THEN FALSE ELSE TRUE END;
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Product_Currency_Link;
    DROP TABLE IF EXISTS tmp_Shop_User;
    
    CREATE TEMPORARY TABLE tmp_Shop_User(
		id_user INTEGER PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BOOLEAN NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Shop_Product_Currency_Link (
		id_link INTEGER NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_Product_Currency_Link_id_link
			FOREIGN KEY (id_link)
			REFERENCES Shop_Product_Currency_Region_Link(id_link),
        id_product INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_CurrencyLink_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
        id_permutation INTEGER NULL,
        CONSTRAINT FK_tmp_Shop_Product_Currency_Link_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
		id_currency INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_Currency_Link_id_currency
			FOREIGN KEY (id_currency)
			REFERENCES Shop_Currency(id_currency),
		active BOOLEAN NOT NULL
    );
    
	/*
    CREATE TABLE IF NOT EXISTS tmp_Msg_Error ( -- IF NOT EXISTS 
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		code VARCHAR(50) NOT NULL,
        -- CONSTRAINT chk_tmp_Msg_Error_code CHECK (code IN (SELECT code FROM Shop_Msg_Error_Type)),
		/*
        id_type INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Msg_Error_id_type
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type(id_type),
		*/
		msg VARCHAR(4000) NOT NULL
    );
    */

    
    -- User permissions
    IF NOT EXISTS(
		SELECT *
		FROM Shop_User
		WHERE 
			id_user = v_id_user
			AND active
	) THEN
		RAISE EXCEPTION 'Valid user ID required.'
		USING ERRCODE = '22000'
        ;
    END IF;

	INSERT INTO tmp_Shop_User (
		id_user,
		active
	)
	SELECT id_user,
		active
	FROM Shop_User
	WHERE id_user = v_id_user
		AND active
	LIMIT 1
	;
    
    -- Get products
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
	FROM Shop_Product_Currency_Region_Link
	WHERE ISNULL(id_stripe_price)
		AND active
	;
    
    -- Permissions
	-- SELECT * FROM tmp_Msg_Error LIMIT 1;
	CALL p_shop_user_eval (
		v_guid, -- a_guid
		v_id_user, 	-- a_id_user
		0,		-- a_get_inactive_users
		CONVERT((SELECT id_permission FROM Shop_Permission WHERE 'STORE_ADMIN' = code), CHAR),		-- a_ids_permission
		(SELECT id_access_level FROM Shop_Access_Level WHERE code = 'ADMIN' AND active),		-- a_ids_access_level
		(SELECT STRING_AGG(DISTINCT id_product, ',') FROM tmp_Shop_Product_Currency_Link), --  (SELECT DISTINCT id_product FROM tmp_Shop_Product_Currency_Link) calc_PCL)		-- a_ids_product
		(SELECT STRING_AGG(DISTINCT id_permutation, ',') FROM tmp_Shop_Product_Currency_Link) -- a_ids_permutation
	);
	-- SELECT * FROM tmp_Msg_Error LIMIT 1;
	
	IF EXISTS (SELECT can_admin FROM Shop_User_Eval_Temp WHERE guid = v_guid AND NOT can_admin LIMIT 1) THEN
		RAISE EXCEPTION 'User ID does not have permission to get all new stripe prices.'
		USING ERRCODE = '42501'
		;
	END IF;
	
	DELETE FROM Shop_User_Eval_Temp
	WHERE guid = v_guid
	;

    
    
    -- Returns
	/*
    IF EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		DELETE FROM tmp_Shop_Product_Currency_Link;
	END IF;
    */
	/*
    SELECT *
    FROM tmp_Shop_User
    ;
    */
    
    OPEN result_products FOR
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
    RETURN NEXT result_products;
    
    -- Errors
	/*
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
    */

    
    /*
    -- Return arguments for test
    SELECT
		v_id_user
    ;
    */
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_User;
    DROP TABLE IF EXISTS tmp_Shop_Product_Currency_Link;
END;
$$ LANGUAGE plpgsql;


/*

DROP FUNCTION IF EXISTS fetch_results;

CREATE OR REPLACE FUNCTION fetch_results()
RETURNS VOID AS $$
DECLARE
    curs refcursor;
    rec record;
    curs1 refcursor;
    rec1 record;
    curs2 refcursor;
    rec2 record;
BEGIN
    FOR curs IN SELECT p_shop_get_many_stripe_price_new (
		'auth0|6582b95c895d09a70ba10fef'
	) LOOP
        RAISE NOTICE 'Fetching from cursor: %', curs;
        LOOP
            FETCH curs INTO rec;
            EXIT WHEN NOT FOUND;
            RAISE NOTICE 'Record: %', rec;
        END LOOP;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT fetch_results();

*/


/*
CALL p_shop_get_many_stripe_price_new (
	''
);

CALL p_shop_get_many_stripe_price_new (
	'auth0|6582b95c895d09a70ba10fef'
);

*/


CREATE OR REPLACE FUNCTION p_shop_get_many_supplier (
	IN a_id_user INTEGER,
    IN a_get_all_supplier BOOLEAN,
	IN a_get_inactive_supplier BOOLEAN,
    IN a_get_first_supplier_only BOOLEAN,
	IN a_ids_supplier INTEGER[]
)
RETURNS SETOF REFCURSOR
AS $$
DECLARE
	v_id_user INTEGER;
	v_get_all_supplier BOOLEAN;
	v_get_inactive_supplier BOOLEAN;
	v_get_first_supplier_only BOOLEAN;
	v_ids_supplier INTEGER[];
	v_has_filter_supplier BOOLEAN;
	v_guid UUID;
	v_id_permission_supplier INTEGER;
	v_id_access_level_view INTEGER;
	v_id_minimum INTEGER;
	result_suppliers REFCURSOR;
	-- result_errors REFCURSOR;
BEGIN
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_get_all_supplier := COALESCE(a_get_all_supplier, TRUE);
	v_get_inactive_supplier := COALESCE(a_get_inactive_supplier, FALSE);
	v_get_first_supplier_only := COALESCE(a_get_first_supplier_only, FALSE);
	v_ids_supplier := TRIM(COALESCE(a_ids_supplier, ''));
    
    v_guid := gen_random_uuid();
    v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');
    v_has_filter_supplier = NOT (a_ids_supplier = '');
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Supplier;
    
    CREATE TABLE tmp_Shop_Supplier (
		id_supplier INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Supplier_id_supplier
			FOREIGN KEY (id_supplier)
			REFERENCES Shop_Supplier(id_supplier),
        active BOOLEAN NOT NULL,
        rank_supplier INTEGER NULL,
        can_view BOOLEAN, 
        can_edit BOOLEAN, 
        can_admin BIT
    );
    
	/*
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		id_type INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    */
	
	-- select v_has_filter_product, v_has_filter_permutation;
    
    IF v_has_filter_supplier THEN
		IF EXISTS (
			SELECT * 
			FROM UNNEST(v_ids_supplier) AS Supplier_Id
			LEFT JOIN Shop_Supplier S ON Supplier_Id = S.id_supplier
			WHERE ISNULL(S.id_supplier)
		) THEN 
			RAISE EXCEPTION 'Invalid supplier IDs: %', (
				SELECT STRING_AGG(Supplier_Id, ', ')
				FROM UNNEST(v_ids_supplier) AS Supplier_Id
				LEFT JOIN Shop_Supplier S ON Supplier_Id = S.id_supplier
				WHERE ISNULL(S.id_supplier)
				LIMIT 1
			)
			USING ERRCODE = '22000'
			;
		ELSE
			INSERT INTO tmp_Shop_Supplier (
				id_supplier,
                active,
                rank_supplier
			)
			SELECT 
				S.id_supplier,
                S.active,
                RANK() OVER (ORDER BY id_supplier ASC) AS rank_supplier
			FROM Shop_Supplier S
            WHERE
				(
					a_get_inactive_supplier
                    OR S.active = TRUE
                )
				AND (
					a_get_all_supplier
					OR S.id_supplier = ANY(v_ids_supplier)
				)
			;
        END IF;
		
		IF a_get_first_supplier_only THEN
			DELETE FROM tmp_Shop_Supplier t_S
				WHERE t_S.rank_supplier > (
					SELECT MIN(t_S.rank_supplier)
                    FROM tmp_Shop_Supplier t_S
				)
			;
		END IF;
    END IF;
    
    -- Permissions
	-- v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER);
	v_id_permission_supplier := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_SUPPLIER' LIMIT 1);
	
	-- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
	-- select * from Shop_User_Eval_Temp;
	
	CALL p_shop_user_eval(v_guid, a_id_user, FALSE, v_id_permission_supplier, v_id_access_level_view, '');
	
	-- select * from Shop_User_Eval_Temp;
	
	IF NOT EXISTS (SELECT can_view FROM Shop_User_Eval_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
		RAISE EXCEPTION 'You do not have view permissions for %', (
			SELECT name 
			FROM Shop_Permission 
			WHERE id_permission = v_id_permission_supplier 
			LIMIT 1
		)
		USING ERRCODE = '42501'
		;
	END IF;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns

    -- Suppliers
	OPEN result_suppliers FOR
		SELECT 
			t_S.id_supplier,
			S.name_company,
			name_contact,
			department_contact,
			id_address,
			phone_number,
			fax,
			email,
			website,
			id_currency,
			active
		FROM tmp_Shop_Supplier t_S
		INNER JOIN Shop_Supplier S
			ON t_S.id_supplier = S.id_supplier
		;
    RETURN NEXT result_suppliers;
    
    -- Errors
	/*
    SELECT 
		/*
        t_ME.display_order,
		t_ME.guid,
        t_ME.id_type,
        t_ME.msg,
        MET.code, 
        MET.name,
        MET.description
        */
        *
    FROM tmp_Msg_Error t_ME
    INNER JOIN Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    WHERE guid = v_guid
    ;
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
    */

    /*
    -- Return arguments for test
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
    
    -- select 'other outputs';
    -- select * from tmp_Shop_Product;
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Supplier;
        
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid
	;
END;
$$ LANGUAGE plpgsql;


/*

DROP FUNCTION IF EXISTS fetch_results;

CREATE OR REPLACE FUNCTION fetch_results()
RETURNS VOID AS $$
DECLARE
    curs refcursor;
    rec record;
BEGIN
    FOR curs IN SELECT p_shop_get_many_supplier (
		'', -- a_id_user
		TRUE, -- a_get_all_supplier
		FALSE, -- a_get_inactive_supplier
		FALSE, -- a_get_first_supplier_only
		'' -- a_ids_supplier
	) LOOP
        RAISE NOTICE 'Fetching from cursor: %', curs;
        LOOP
            FETCH curs INTO rec;
            EXIT WHEN NOT FOUND;
            RAISE NOTICE 'Record: %', rec;
        END LOOP;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT fetch_results();

*/



CREATE OR REPLACE FUNCTION p_shop_get_many_supplier_purchase_order (
	IN a_id_user INTEGER,
    IN a_get_all_supplier BOOLEAN,
	IN a_get_inactive_supplier BOOLEAN,
	IN a_get_first_supplier_only BOOLEAN,
	IN a_ids_supplier INTEGER[],
    IN a_get_all_order BOOLEAN,
	IN a_get_inactive_order BOOLEAN,
	IN a_get_first_order_only BOOLEAN,
	IN a_ids_order INTEGER[],
	IN a_get_inactive_category BOOLEAN,
	IN a_ids_category INTEGER[],
	IN a_get_inactive_product BOOLEAN,
	IN a_ids_product INTEGER[],
	IN a_get_inactive_permutation BOOLEAN,
	IN a_ids_permutation INTEGER[],
    IN a_date_from TIMESTAMP,
    IN a_date_to TIMESTAMP
)
RETURNS SETOF REFCURSOR
AS $$
DECLARE
	v_id_user INTEGER;
	v_get_all_supplier BOOLEAN;
	v_get_inactive_supplier BOOLEAN;
	v_get_first_supplier_only BOOLEAN;
	v_ids_supplier INTEGER[];
	v_get_all_order BOOLEAN;
	v_get_inactive_order BOOLEAN;
	v_get_first_order_only BOOLEAN;
	v_ids_order INTEGER[];
	v_get_inactive_category BOOLEAN;
	v_ids_category INTEGER[];
	v_get_inactive_product BOOLEAN;
	v_ids_product INTEGER[];
	v_get_inactive_permutation BOOLEAN;
	v_ids_permutation INTEGER[];
	v_date_from TIMESTAMP;
	v_date_to TIMESTAMP;
	v_has_filter_supplier BOOLEAN;
	v_has_filter_order BOOLEAN;
	v_has_filter_category BOOLEAN;
	v_has_filter_product BOOLEAN;
	v_has_filter_permutation BOOLEAN;
	v_has_filter_date_from BOOLEAN;
	v_has_filter_date_to BOOLEAN;
	v_guid UUID;
	v_ids_permission_supplier_purchase_order INTEGER[];
	v_ids_product_permission INTEGER[];
	v_id_access_level_view INTEGER;
	v_code_error_data VARCHAR(50);
	v_id_type_error_data INTEGER;
	result_suppliers REFCURSOR;
	result_orders REFCURSOR;
	result_order_product_links REFCURSOR;
	-- result_errors REFCURSOR;
BEGIN
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_get_all_supplier := COALESCE(a_get_all_supplier, TRUE);
	v_get_inactive_supplier := COALESCE(a_get_inactive_supplier, FALSE);
	v_get_first_supplier_only := COALESCE(a_get_first_supplier_only, FALSE);
	v_ids_supplier := TRIM(COALESCE(a_ids_supplier, ''));
	v_get_all_order := COALESCE(a_get_all_order, TRUE);
	v_get_inactive_order := COALESCE(a_get_inactive_order, FALSE);
	v_get_first_order_only := COALESCE(a_get_first_order_only, FALSE);
	v_ids_order := TRIM(COALESCE(a_ids_order, ''));
	v_get_inactive_category := COALESCE(a_get_inactive_category, FALSE);
	v_ids_category := TRIM(COALESCE(a_ids_category, ''));
	v_get_inactive_product := COALESCE(a_get_inactive_product, FALSE);
	v_ids_product := TRIM(COALESCE(a_ids_product, ''));
	v_get_inactive_permutation := COALESCE(a_get_inactive_permutation, FALSE);
	v_ids_permutation := TRIM(COALESCE(a_ids_permutation, ''));
	v_date_from := a_date_from;
	v_date_to := a_date_to;
    
    v_guid := gen_random_uuid();
    v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    -- v_ids_permission_supplier_purchase_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'SHOP_SUPPLIER_PURCHASE_ORDER' LIMIT 1);
    v_code_error_data = 'BAD_DATA';
    v_id_type_error_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data);
    v_has_filter_supplier = (CARDINALITY(v_ids_supplier) > 0);
    v_has_filter_order = (CARDINALITY(v_ids_order) > 0);
    v_has_filter_category = (CARDINALITY(v_ids_category) > 0);
    v_has_filter_product = (CARDINALITY(v_ids_product) > 0);
    v_has_filter_permutation = (CARDINALITY(v_ids_permutation) > 0);
    v_has_filter_date_from = CASE WHEN ISNULL(v_date_from) THEN FALSE ELSE TRUE END;
    v_has_filter_date_to = CASE WHEN ISNULL(v_date_to) THEN FALSE ELSE TRUE END;

    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order_Product_Link;
    DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order;
    DROP TABLE IF EXISTS tmp_Shop_Supplier;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    
    CREATE TABLE tmp_Shop_Supplier (
		id_supplier INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Supplier_id_supplier
			FOREIGN KEY (id_supplier)
			REFERENCES Shop_Supplier(id_supplier),
        active BOOLEAN NOT NULL,
        rank_supplier INTEGER NULL,
        can_view BOOLEAN, 
        can_edit BOOLEAN, 
        can_admin BIT
    );
    
    CREATE TABLE tmp_Shop_Supplier_Purchase_Order (
		id_order INTEGER NOT NULL PRIMARY KEY,
		id_supplier_ordered INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Supplier_Purchase_Order_id_supplier_ordered
			FOREIGN KEY (id_supplier_ordered) 
			REFERENCES Shop_Supplier(id_supplier),
		cost_total_local REAL NOT NULL,
		id_currency_cost INTEGER NOT NULL,
        active BOOLEAN NOT NULL,
        rank_order INTEGER NOT NULL
    );
    
    /*
    CREATE TABLE tmp_Shop_Supplier_Purchase_Order_Product_Link (
		id_link INTEGER NOT NULL PRIMARY KEY,
		id_order INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_Supplier_Purchase_Order(id_order),
		id_permutation INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		cost_total_local REAL NOT NULL,
		id_currency_cost INTEGER NOT NULL,
		quantity_ordered REAL NOT NULL,
		id_unit_quantity INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_received REAL NULL,
		latency_delivery_days INTEGER NOT NULL,
		display_order INTEGER NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Product (
		id_category INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Product_Category(id_category),
		id_product INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		-- product_has_variations BOOLEAN NOT NULL,
		id_permutation INTEGER NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
        active_category BOOLEAN NOT NULL,
        active_product BOOLEAN NOT NULL,
        active_permutation BOOLEAN NULL,
        display_order_category INTEGER NOT NULL, 
        display_order_product INTEGER NOT NULL, 
        display_order_permutation INTEGER NULL, 
        rank_permutation INTEGER NOT NULL, -- _in_category
        name VARCHAR(255) NOT NULL,
        description VARCHAR(4000) NOT NULL,
		/*
        price_GBP_full REAL NOT NULL,
		price_GBP_min REAL NOT NULL,
		*/
        latency_manufacture INTEGER NOT NULL,
		quantity_min REAL NOT NULL,
		quantity_max REAL NOT NULL,
		quantity_step REAL NOT NULL,
		quantity_stock REAL NOT NULL,
		is_subscription BOOLEAN NOT NULL,
		id_recurrence_interval INTEGER,
		CONSTRAINT FK_tmp_Shop_Product_id_recurrence_interval
			FOREIGN KEY (id_recurrence_interval)
			REFERENCES Shop_Recurrence_Interval(id_interval),
		count_recurrence_interval INTEGER,
        id_stripe_product VARCHAR(100),
        product_has_variations INTEGER NOT NULL,
        can_view BOOLEAN, 
        can_edit BOOLEAN, 
        can_admin BIT
    );
    
	/*
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		id_type INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    */

	-- select v_has_filter_product, v_has_filter_permutation;
    
    IF v_has_filter_supplier THEN
		IF EXISTS (
			SELECT * 
			FROM UNNEST(v_ids_supplier) AS Supplier_Id
			LEFT JOIN Shop_Supplier S ON Supplier_Id = S.id_supplier
			WHERE ISNULL(S.id_supplier)
			LIMIT 1
		) THEN 
			RAISE EXCEPTION 'Invalid supplier IDs: %', (
				SELECT STRING_AGG(Supplier_Id, ', ')
				FROM UNNEST(v_ids_supplier) AS Supplier_Id
				LEFT JOIN Shop_Supplier S ON Supplier_Id = S.id_supplier
				WHERE ISNULL(S.id_supplier)
				LIMIT 1
			)
			USING ERRCODE = '22000'
			;
		ELSE
			INSERT INTO tmp_Shop_Supplier (
				id_supplier,
                active,
                rank_supplier
			)
			SELECT 
				S.id_supplier,
                S.active,
                RANK() OVER (ORDER BY id_supplier ASC) AS rank_supplier
			FROM Shop_Supplier S
            INNER JOIN Split_Temp TS ON S.id_supplier = TS.substring
            WHERE
				(
					v_get_inactive_supplier
                    OR S.active = TRUE
                )
			;
        END IF;
		
		IF v_get_first_supplier_only THEN
			DELETE FROM tmp_Shop_Supplier t_S
				WHERE t_S.rank_supplier > (
					SELECT MIN(t_S.rank_supplier)
                    FROM tmp_Shop_Supplier t_S
				)
			;
		END IF;
    END IF;
    
    IF v_has_filter_category = TRUE THEN
		IF EXISTS (
			SELECT * 
			FROM UNNEST(v_ids_category) AS Category_Id
			LEFT JOIN Shop_Product_Category C ON Category_Id = C.id_category
			WHERE ISNULL(C.id_category)
		) THEN 
			RAISE EXCEPTION 'Invalid category IDs: %', (
				SELECT STRING_AGG(Category_Id, ', ')
				FROM UNNEST(v_ids_category) AS Category_Id
				LEFT JOIN Shop_Product_Category C ON Category_Id = C.id_category
				WHERE ISNULL(C.id_category)
			)
			USING ERRCODE = '22000'
			;
		END IF;
	END IF;
    
    IF v_has_filter_product = TRUE THEN
		IF EXISTS (
			SELECT *
			FROM UNNEST(v_ids_product) AS Product_Id
			LEFT JOIN Shop_Product P ON Product_Id = P.id_product
			WHERE ISNULL(P.id_product)
			LIMIT 1
		) THEN 
			RAISE EXCEPTION 'Invalid product IDs: %', (
				SELECT STRING_AGG(Product_Id, ', ')
				FROM UNNEST(v_ids_product) AS Product_Id
				LEFT JOIN Shop_Product P ON Product_Id = P.id_product
				WHERE ISNULL(P.id_product)
			)
			USING ERRCODE = '22000'
			;
		END IF;
	END IF;
    
    IF v_has_filter_permutation = TRUE THEN
		IF EXISTS (
			SELECT *
			FROM UNNEST(v_ids_permutation) AS Permutation_Id
			LEFT JOIN Shop_Product_Permutation PP ON Permutation_Id = PP.id_permutation
			WHERE ISNULL(PP.id_permutation)
			LIMIT 1
		) THEN 
			RAISE EXCEPTION 'Invalid permutation IDs: %', (
				SELECT STRING_AGG(Permutation_Id, ', ')
				FROM UNNEST(v_ids_permutation) AS Permutation_Id
				LEFT JOIN Shop_Product_Permutation PP ON Permutation_Id = PP.id_permutation
				WHERE ISNULL(PP.id_permutation)
			)
			USING ERRCODE = '22000'
			;
		END IF;
	END IF;
    
    IF v_has_filter_category = TRUE OR v_has_filter_product = TRUE OR v_has_filter_permutation = TRUE THEN
		INSERT INTO tmp_Shop_Product (
			id_category,
			id_product,
			id_permutation,
			active_category,
			active_product,
			active_permutation,
			display_order_category,
			display_order_product,
			display_order_permutation
			-- rank_permutation,
			/*
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
			*/
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
			PP.display_order AS display_order_permutation
			-- RANK() OVER (ORDER BY C.display_order, P.display_order, PP.display_order) AS rank_permutation, #PARTITION BY P.id_category -- _in_category
			/*
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
			*/
		FROM Shop_Product P
		INNER JOIN Shop_Product_Permutation PP
			ON P.id_product = PP.id_product
		INNER JOIN Shop_Product_Category C
			ON P.id_category = C.id_category
		WHERE
			-- permutations
			(
				(
					NOT v_has_filter_permutation 
					OR FIND_IN_SET(PP.id_permutation, v_ids_permutation) > 0
				)
				AND (
					v_get_inactive_permutation 
					OR PP.active = TRUE
				)
			)
			-- categories
			AND (
				(
					NOT v_has_filter_category 
					OR FIND_IN_SET(P.id_category, v_ids_category) > 0
				)
				AND (
					v_get_inactive_category 
					OR C.active = TRUE
				)
			) 
			-- products
			AND (
				(
					NOT v_has_filter_product 
					OR FIND_IN_SET(P.id_product, v_ids_product) > 0
				)
				AND (
					v_get_inactive_product 
					OR P.active = TRUE
				)
			)
		;
    END IF;
    
    -- Get orders
	IF v_has_filter_order AND EXISTS (
		-- SELECT * FROM Split_Temp TS LEFT JOIN Shop_Supplier_Purchase_Order SPO ON TS.substring = SPO.id_order WHERE ISNULL(SPO.id_order)
		SELECT *
		FROM UNNEST(v_ids_order) Order_Id
		
	) THEN 
		RAISE EXCEPTION 'Invalid order IDs: %', (
			SELECT STRING_AGG(TS.substring, ', ')
			FROM UNNEST(v_ids_order) 
			LEFT JOIN Shop_Supplier_Purchase_Order SPO ON TS.substring = SPO.id_order 
			WHERE ISNULL(SPO.id_order)
		)
		USING ERRCODE = '22000'
		;
	END IF;
	
	INSERT INTO tmp_Shop_Supplier_Purchase_Order ( -- _Product_Link
		id_order,
		-- active,
		rank_order
	)
	SELECT 
		SPO.id_order,
		-- SPO.active,
		RANK() OVER (ORDER BY SPO.id_order ASC) AS rank_order
	FROM Shop_Supplier_Purchase_Order SPO
	-- INNER JOIN Split_Temp TS ON SPO.id_order = TS.substring
	INNER JOIN Shop_Supplier_Purchase_Order_Product_Link SPOPL ON SPO.id_order = SPOPL.id_order
	INNER JOIN Shop_Supplier S ON SPO.id_supplier_ordered = S.id_supplier
	INNER JOIN Shop_Product_Permutation PP ON SPOPL.id_permutation = PP.id_permutation
	INNER JOIN Shop_Product P ON PP.id_product = P.id_product
	INNER JOIN Shop_Product_Category C ON P.id_category = C.id_category
	LEFT JOIN tmp_Shop_Product t_P ON SPOPL.id_permutation = t_P.id_permutation
	LEFT JOIN tmp_Shop_Supplier t_S ON SPO.id_supplier_ordered = t_S.id_supplier
	WHERE
		-- supplier
		(
			v_has_filter_supplier = FALSE
			OR NOT ISNULL(t_S.id_supplier) -- SPO.id_supplier_ordered IN (SELECT DISTINCT id_supplier FROM tmp_Shop_Supplier)
		)
		-- order
		AND (
			(
				v_has_filter_order = FALSE
				OR (
					-- ID
					-- FIND_IN_SET(SPO.id_order, v_ids_order) > 0
					SPO.id_order = ANY(v_ids_order)
					-- date
					AND (
						(
							v_has_filter_date_from = FALSE
							OR SPO.created_on > v_date_from
						)
						AND (
							v_has_filter_date_to = FALSE
							OR SPO.created_on < v_date_to
						)
					)
				)
			)
			-- active
			/*
			AND (
				v_get_inactive_order
				OR SPO.active = TRUE
			)
			*/
		)
		-- permutations
		AND (
			(
				v_has_filter_category = FALSE 
				AND v_has_filter_product = FALSE 
				AND v_has_filter_permutation = FALSE
			)
			OR NOT ISNULL(t_P.id_permutation) -- SPO.id_permutation IN (SELECT DISTINCT id_permutation FROM tmp_Shop_Product)
		)
	;
	
	IF v_get_first_order_only THEN
		DELETE FROM tmp_Shop_Supplier_Purchase_Order t_SPO
			WHERE t_SPO.rank_order > (
				SELECT MIN(t_SPO.rank_order)
				FROM tmp_Shop_Supplier_Purchase_Order t_SPO
			)
		;
	END IF;
    
    -- Permissions
	-- v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER);
	v_ids_permission_supplier_purchase_order := (SELECT STRING_AGG(id_permission, ',') FROM Shop_Permission WHERE code IN ('STORE_SUPPLIER', 'STORE_SUPPLIER_PURCHASE_ORDER'));
	-- v_ids_permutation_permission := (SELECT STRING_AGG(id_permutation, ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
	v_ids_product_permission := (SELECT STRING_AGG(DISTINCT t_P.id_product, ',') FROM tmp_Shop_Product t_P WHERE NOT ISNULL(t_P.id_product));
	
	-- SELECT v_guid, v_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
	-- select * from Shop_User_Eval_Temp;
	
	CALL p_shop_user_eval(v_guid, v_id_user, FALSE, v_ids_permission_supplier_purchase_order, v_id_access_level_view, v_ids_product_permission);
	
	-- select * from Shop_User_Eval_Temp;
	
	IF NOT EXISTS (SELECT can_view FROM Shop_User_Eval_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
		RAISE EXCEPTION 'You do not have view permissions for %', (
			SELECT STRING_AGG(name, ', ')
			FROM Shop_Permission 
			WHERE id_permission = v_ids_permission_supplier_purchase_order
		)
		USING ERRCODE = '42501'
		;
	END IF;
	
	
	UPDATE tmp_Shop_Product t_P
	SET t_P.can_view = UE_T.can_view,
		t_P.can_edit = UE_T.can_edit,
		t_P.can_admin = UE_T.can_admin
	FROM tmp_Shop_Product t_P
	INNER JOIN Shop_User_Eval_Temp UE_T
		ON t_P.id_product = UE_T.id_product -- t_P.id_permutation = UE_T.id_permutation
		AND UE_T.GUID = v_guid
	;
	
	-- CALL p_shop_user_eval_clear_temp(v_guid);
	-- DROP TABLE IF EXISTS Shop_User_Eval_Temp;
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid
	;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns
    -- v_now := CURRENT_TIMESTAMP;
    
    -- Suppliers
	OPEN result_suppliers FOR
		SELECT 
			t_S.id_supplier,
			S.name_company,
			S.name_contact,
			S.department_contact,
			S.id_address,
			S.phone_number,
			S.fax,
			S.email,
			S.website,
			S.id_currency,
			t_S.active
		FROM tmp_Shop_Supplier t_S
		INNER JOIN Shop_Supplier S
			ON t_S.id_supplier = S.id_supplier
		;
    RETURN NEXT result_suppliers;
    
    -- Supplier Purchase Order
	OPEN result_orders FOR
		SELECT -- *
			t_SPO.id_order,
			SPO.id_supplier_ordered,
			SPO.cost_total_local,
			SPO.id_currency_cost,
			t_SPO.active
		FROM Shop_Supplier_Purchase_Order SPO
		INNER JOIN tmp_Shop_Supplier_Purchase_Order t_SPO ON SPO.id_order = t_SPO.id_order
		;
    RETURN NEXT result_orders;
    
    -- Supplier Purchase Order Product Link
	OPEN result_order_product_links FOR
		SELECT
			SPOPL.id_link,
			SPOPL.id_order,
			SPOPL.id_permutation,
			P.name as name_product,
			SPOPL.cost_total_local,
			SPOPL.id_currency_cost,
			SPOPL.quantity_ordered,
			SPOPL.id_unit_quantity,
			SPOPL.quantity_received,
			SPOPL.latency_delivery_days,
			SPOPL.display_order
		FROM Shop_Supplier_Purchase_Order_Product_Link SPOPL
		-- INNER JOIN tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL ON SPOPL.id_link = t_SPOPL.id_link
		INNER JOIN tmp_Shop_Supplier_Purchase_Order t_SPO ON SPOPL.id_order = t_SPO.id_order
		INNER JOIN Shop_Product_Permutation PP ON SPOPL.id_permutation = PP.id_permutation
		INNER JOIN Shop_Product P ON PP.id_product = P.id_product
		INNER JOIN Shop_Product_Category C ON P.id_category = C.id_category
		ORDER BY SPOPL.id_order, C.display_order, P.display_order, PP.display_order
		;
    RETURN NEXT result_order_product_links;
    
    -- Errors
	/*
    SELECT 
		/*
        t_ME.display_order,
		t_ME.guid,
        t_ME.id_type,
        t_ME.msg,
        MET.code, 
        MET.name,
        MET.description
        */
        *
    FROM tmp_Msg_Error t_ME
    INNER JOIN Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    WHERE guid = v_guid
    ;
	*/

	/*
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
    */


    /*
    -- Return arguments for test
    SELECT
	v_ids_category,
	v_get_inactive_category,
	v_ids_product,
	v_get_inactive_product,
    v_get_first_product_only,
    v_get_all_product,
	v_ids_image,
	v_get_inactive_image,
    v_get_first_image_only,
    v_get_all_image
    ;
    */
    
    -- select 'other outputs';
    -- select * from tmp_Shop_Product;
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order_Product_Link;
    DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order;
    DROP TABLE IF EXISTS tmp_Shop_Supplier;
    DROP TABLE IF EXISTS tmp_Shop_Product;
        
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid
	;
END;
$$ LANGUAGE plpgsql;


/*

DROP FUNCTION IF EXISTS fetch_results;

CREATE OR REPLACE FUNCTION fetch_results()
RETURNS VOID AS $$
DECLARE
    curs refcursor;
    rec record;
BEGIN
    FOR curs IN SELECT p_shop_get_many_supplier_purchase_order (
		'', -- a_id_user
		TRUE, -- a_get_all_supplier
		FALSE, -- a_get_inactive_supplier
		FALSE, -- a_get_first_supplier_only
		'', -- a_ids_supplier
		TRUE, -- a_get_all_order
		-- FALSE, -- a_get_inactive_order
		FALSE, -- a_get_first_order_only
		'', -- a_ids_order
		FALSE, -- a_get_inactive_category
		'', -- a_ids_category
		FALSE, -- a_get_inactive_product
		'', -- a_ids_product
		FALSE, -- a_get_inactive_permutation
		'', -- a_ids_permutation
		NULL, -- a_date_from
		NULL -- a_date_to
	) LOOP
        RAISE NOTICE 'Fetching from cursor: %', curs;
        LOOP
            FETCH curs INTO rec;
            EXIT WHEN NOT FOUND;
            RAISE NOTICE 'Record: %', rec;
        END LOOP;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT fetch_results();

*/



CREATE OR REPLACE FUNCTION p_shop_get_many_manufacturing_purchase_order (
	IN a_id_user INTEGER,
    IN a_get_all_order BOOLEAN,
	IN a_get_inactive_order BOOLEAN,
	IN a_get_first_order_only BOOLEAN,
	IN a_ids_order INTEGER[],
	IN a_get_inactive_category BOOLEAN,
	IN a_ids_category INTEGER[],
	IN a_get_inactive_product BOOLEAN,
	IN a_ids_product INTEGER[],
	IN a_get_inactive_permutation BOOLEAN,
	IN a_ids_permutation INTEGER[],
    IN a_date_from TIMESTAMP,
    IN a_date_to TIMESTAMP
)
RETURNS SETOF REFCURSOR
AS $$
DECLARE
	v_id_user INTEGER;
	v_get_all_order BOOLEAN;
	v_get_inactive_order BOOLEAN;
	v_get_first_order_only BOOLEAN;
	v_ids_order INTEGER[];
	v_get_inactive_category BOOLEAN;
	v_ids_category INTEGER[];
	v_get_inactive_product BOOLEAN;
	v_ids_product INTEGER[];
	v_get_inactive_permutation BOOLEAN;
	v_ids_permutation INTEGER[];
	v_date_from TIMESTAMP;
	v_date_to TIMESTAMP;
	v_has_filter_order BOOLEAN;
	v_has_filter_category BOOLEAN;
	v_has_filter_product BOOLEAN;
	v_has_filter_permutation BOOLEAN;
	v_has_filter_date_from BOOLEAN;
	v_has_filter_date_to BOOLEAN;
	v_guid UUID;
	v_id_access_level_view INTEGER;
	v_code_error_data VARCHAR(50);
	v_id_type_error_data INTEGER;
	v_ids_permission_manufacturing_purchase_order VARCHAR(4000);
	v_ids_product_permission INTEGER[];
	result_orders REFCURSOR;
	result_order_product_links REFCURSOR;
	result_errors REFCURSOR;
BEGIN
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_get_all_order := COALESCE(a_get_all_order, TRUE);
	v_get_inactive_order := COALESCE(a_get_inactive_order, FALSE);
	v_get_first_order_only := COALESCE(a_get_first_order_only, FALSE);
	v_ids_order := TRIM(COALESCE(a_ids_order, ''));
	v_get_inactive_category := COALESCE(a_get_inactive_category, FALSE);
	v_ids_category := TRIM(COALESCE(a_ids_category, ''));
	v_get_inactive_product := COALESCE(a_get_inactive_product, FALSE);
	v_ids_product := TRIM(COALESCE(a_ids_product, ''));
	v_get_inactive_permutation := COALESCE(a_get_inactive_permutation, FALSE);
	v_ids_permutation := TRIM(COALESCE(a_ids_permutation, ''));
	v_date_from := a_date_from;
	v_date_to := a_date_to;
    
    v_guid := gen_random_uuid();
    v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    -- v_ids_permission_manufacturing_purchase_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'SHOP_manufacturing_PURCHASE_ORDER' LIMIT 1);
    v_code_error_data = 'BAD_DATA';
    v_id_type_error_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data);
	
    v_has_filter_order = CASE WHEN v_ids_order = '' THEN FALSE ELSE TRUE END;
    v_has_filter_category = CASE WHEN v_ids_category = '' THEN FALSE ELSE TRUE END;
    v_has_filter_product = CASE WHEN v_ids_product = '' THEN FALSE ELSE TRUE END;
    v_has_filter_permutation = CASE WHEN v_ids_permutation = '' THEN FALSE ELSE TRUE END;
    v_has_filter_date_from = CASE WHEN ISNULL(v_date_from) THEN FALSE ELSE TRUE END;
    v_has_filter_date_to = CASE WHEN ISNULL(v_date_to) THEN FALSE ELSE TRUE END;
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order_Product_Link;
    DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    
    CREATE TABLE tmp_Shop_Manufacturing_Purchase_Order (
		id_order INTEGER NOT NULL PRIMARY KEY,
		/*
        id_supplier_ordered INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Manufacturing_Purchase_Order_id_supplier_ordered
			FOREIGN KEY (id_supplier_ordered) 
			REFERENCES Shop_Supplier(id_supplier),
		*/
		cost_total_local REAL NOT NULL,
		id_currency_cost INTEGER NOT NULL,
        value_produced_total_local REAL NOT NULL,
        active BOOLEAN NOT NULL,
        rank_order INTEGER NOT NULL
    );
    
    /*
    CREATE TABLE tmp_Shop_Manufacturing_Purchase_Order_Product_Link (
		id_link INTEGER NOT NULL PRIMARY KEY,
		id_order INTEGER NOT NULL,
		CONSTRAINT FK_tmp_manufacturing_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_manufacturing_Purchase_Order(id_order),
		id_permutation INTEGER NOT NULL,
		CONSTRAINT FK_tmp_manufacturing_Purchase_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		cost_total_local REAL NOT NULL,
		id_currency_cost INTEGER NOT NULL,
		quantity_used REAL NOT NULL,
		id_unit_quantity INTEGER NOT NULL,
		CONSTRAINT FK_tmp_manufacturing_Purchase_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_produced REAL NULL,
		latency_delivery_days INTEGER NOT NULL,
		display_order INTEGER NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Product (
		id_category INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Product_Category(id_category),
		id_product INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		-- product_has_variations BOOLEAN NOT NULL,
		id_permutation INTEGER NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
        active_category BOOLEAN NOT NULL,
        active_product BOOLEAN NOT NULL,
        active_permutation BOOLEAN NULL,
        display_order_category INTEGER NOT NULL, 
        display_order_product INTEGER NOT NULL, 
        display_order_permutation INTEGER NULL, 
        rank_permutation INTEGER NOT NULL, -- _in_category
        -- name VARCHAR(255) NOT NULL,
        -- description VARCHAR(4000) NOT NULL,
		/*
        price_GBP_full REAL NOT NULL,
		price_GBP_min REAL NOT NULL,
		*/
        /*
        latency_manufacture INTEGER NOT NULL,
		quantity_min REAL NOT NULL,
		quantity_max REAL NOT NULL,
		quantity_step REAL NOT NULL,
		quantity_stock REAL NOT NULL,
		is_subscription BOOLEAN NOT NULL,
		id_recurrence_interval INTEGER,
		CONSTRAINT FK_tmp_Shop_Product_id_recurrence_interval
			FOREIGN KEY (id_recurrence_interval)
			REFERENCES Shop_Recurrence_Interval(id_interval),
		count_recurrence_interval INTEGER,
        id_stripe_product VARCHAR(100),
        product_has_variations INTEGER NOT NULL,
        */
        can_view BOOLEAN, 
        can_edit BOOLEAN, 
        can_admin BIT
    );
    
	/*
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		id_type INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    */

	-- select v_has_filter_product, v_has_filter_permutation;
    
    IF v_has_filter_category = TRUE AND EXISTS (
		SELECT * 
		FROM UNNEST(v_ids_category) AS Category_Id
		LEFT JOIN Shop_Product_Category C ON Category_Id = C.id_category
		WHERE ISNULL(C.id_category)
	) THEN 
		RAISE EXCEPTION 'Invalid category IDs: %', (
			SELECT COALESCE(STRING_AGG(Category_Id, ', ') ,'NULL')
			FROM UNNEST(v_ids_category) AS Category_Id
			LEFT JOIN Shop_Product_Category C ON Category_Id = C.id_category
			WHERE ISNULL(C.id_category)
		)
		USING ERRCODE = '22000'
		;
	END IF;
    
    IF v_has_filter_product = TRUE AND EXISTS (
		SELECT *
		FROM UNNEST(v_ids_product) AS Product_Id
		LEFT JOIN Shop_Product P ON Product_Id = P.id_product
		WHERE ISNULL(P.id_product)
		LIMIT 1
	) THEN 
		RAISE EXCEPTION 'Invalid product IDs: %', (
			SELECT COALESCE(STRING_AGG(Product_Id, ', ') ,'NULL')
			FROM UNNEST(v_ids_product) AS Product_Id
			LEFT JOIN Shop_Product P ON Product_Id = P.id_product
			WHERE ISNULL(P.id_product)
		)
		USING ERRCODE = '22000'
		;
	END IF;
    
    IF v_has_filter_permutation = TRUE AND EXISTS (
		SELECT *
		FROM UNNEST(v_ids_permutation) AS Permutation_Id
		LEFT JOIN Shop_Product_Permutation PP ON Permutation_Id = PP.id_permutation
		WHERE ISNULL(PP.id_permutation)
		LIMIT 1
	) THEN 
		RAISE EXCEPTION 'Invalid permutation IDs: %', (
			SELECT STRING_AGG(Permutation_Id, ', ')
			FROM UNNEST(v_ids_permutation) AS Permutation_Id
			LEFT JOIN Shop_Product_Permutation PP ON Permutation_Id = PP.id_permutation
			WHERE ISNULL(PP.id_permutation)
		)
		USING ERRCODE = '22000'
		;
	END IF;
    
    IF v_has_filter_category = TRUE OR v_has_filter_product = TRUE OR v_has_filter_permutation = TRUE THEN
		INSERT INTO tmp_Shop_Product (
			id_category,
			id_product,
			id_permutation,
			active_category,
			active_product,
			active_permutation,
			display_order_category,
			display_order_product,
			display_order_permutation
			-- rank_permutation,
			/*
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
			*/
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
			PP.display_order AS display_order_permutation
			-- RANK() OVER (ORDER BY C.display_order, P.display_order, PP.display_order) AS rank_permutation, #PARTITION BY P.id_category -- _in_category
			/*
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
			*/
		FROM Shop_Product P
		INNER JOIN Shop_Product_Permutation PP
			ON P.id_product = PP.id_product
		INNER JOIN Shop_Product_Category C
			ON P.id_category = C.id_category
		WHERE
			-- permutations
			(
				(
					NOT v_has_filter_permutation 
					OR FIND_IN_SET(PP.id_permutation, v_ids_permutation) > 0
				)
				AND (
					v_get_inactive_permutation 
					OR PP.active = TRUE
				)
			)
			-- categories
			AND (
				(
					NOT v_has_filter_category 
					OR FIND_IN_SET(P.id_category, v_ids_category) > 0
				)
				AND (
					v_get_inactive_category 
					OR C.active = TRUE
				)
			) 
			-- products
			AND (
				(
					NOT v_has_filter_product 
					OR FIND_IN_SET(P.id_product, v_ids_product) > 0
				)
				AND (
					v_get_inactive_product 
					OR P.active = TRUE
				)
			)
		;
    END IF;
    
    -- Get orders
	IF v_has_filter_order AND EXISTS (
		SELECT * 
		FROM UNNEST(v_ids_order) AS Order_Id
		LEFT JOIN Shop_Manufacturing_Purchase_Order MPO ON Order_Id = MPO.id_order
		WHERE ISNULL(MPO.id_order)
		LIMIT 1
	) THEN 
		RAISE EXCEPTION 'Invalid order IDs: %', (
			SELECT STRING_AGG(Order_Id, ', ')
			FROM UNNEST(v_ids_order) AS Order_Id
			LEFT JOIN Shop_Manufacturing_Purchase_Order MPO ON Order_Id = MPO.id_order
			WHERE ISNULL(MPO.id_order)
		)
		USING ERRCODE = '22000'
		;
	END IF;

	INSERT INTO tmp_Shop_Manufacturing_Purchase_Order ( -- _Product_Link
		id_order,
		-- active,
		rank_order
	)
	SELECT 
		MPO.id_order,
		-- MPO.active,
		RANK() OVER (ORDER BY MPO.id_order ASC) AS rank_order
	FROM Shop_Manufacturing_Purchase_Order MPO
	-- INNER JOIN Split_Temp TS ON MPO.id_order = TS.substring
	INNER JOIN Shop_manufacturing_Purchase_Order_Product_Link MPOPL ON MPO.id_order = MPOPL.id_order
	INNER JOIN Shop_Product_Permutation PP ON MPOPL.id_permutation = PP.id_permutation
	INNER JOIN Shop_Product P ON PP.id_product = P.id_product
	INNER JOIN Shop_Product_Category C ON P.id_category = C.id_category
	LEFT JOIN tmp_Shop_Product t_P ON MPOPL.id_permutation = t_P.id_permutation
	WHERE
		-- order
		(
			(
				v_has_filter_order = 0
				OR (
					-- ID
					-- FIND_IN_SET(MPO.id_order, v_ids_order) > 0
					MPO.id_order = ANY(v_ids_order)
					-- date
					AND (
						(
							v_has_filter_date_from = 0
							OR MPO.created_on > v_date_from
						)
						AND (
							v_has_filter_date_to = 0
							OR MPO.created_on < v_date_to
						)
					)
				)
			)
			-- active
			/*
			AND (
				v_get_inactive_order
				OR MPO.active = TRUE
			)
			*/
		)
		-- permutations
		AND (
			(
				v_has_filter_category = FALSE 
				AND v_has_filter_product = FALSE 
				AND v_has_filter_permutation = 0
			)
			OR NOT ISNULL(t_P.id_permutation) -- MPO.id_permutation IN (SELECT DISTINCT id_permutation FROM tmp_Shop_Product)
		)
	;
	
	IF v_get_first_order_only THEN
		DELETE FROM tmp_Shop_Manufacturing_Purchase_Order t_MPO
			WHERE t_MPO.rank_order > (
				SELECT MIN(t_MPO.rank_order)
				FROM tmp_Shop_Manufacturing_Purchase_Order t_MPO
			)
		;
	END IF;
    
    -- Permissions
	-- v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER);
	v_ids_permission_manufacturing_purchase_order := (SELECT STRING_AGG(id_permission, ',') FROM Shop_Permission WHERE code IN ('STORE_manufacturing', 'STORE_manufacturing_PURCHASE_ORDER'));
	-- v_ids_permutation_permission := (SELECT STRING_AGG(id_permutation, ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
	v_ids_product_permission := (SELECT STRING_AGG(P.id_product, ',') FROM (SELECT DISTINCT id_product FROM tmp_Shop_Product WHERE NOT ISNULL(id_product)) P);
	
	-- SELECT v_guid, v_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
	-- select * from Shop_User_Eval_Temp;
	
	CALL p_shop_user_eval(v_guid, v_id_user, FALSE, v_ids_permission_manufacturing_purchase_order, v_id_access_level_view, v_ids_product_permission);
	
	-- select * from Shop_User_Eval_Temp;
	
	IF NOT EXISTS (SELECT can_view FROM Shop_User_Eval_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
		RAISE EXCEPTION 'You do not have view permissions for %', (
			SELECT STRING_AGG(name, ', ') 
			FROM Shop_Permission 
			WHERE id_permission = v_ids_permission_manufacturing_purchase_order
		)
		USING ERRCODE = '42501'
		;
	END IF;
	
	
	UPDATE tmp_Shop_Product t_P
	SET t_P.can_view = UE_T.can_view,
		t_P.can_edit = UE_T.can_edit,
		t_P.can_admin = UE_T.can_admin
	FROM tmp_Shop_Product t_P
	INNER JOIN Shop_User_Eval_Temp UE_T
		ON t_P.id_product = UE_T.id_product -- t_P.id_permutation = UE_T.id_permutation
		AND UE_T.GUID = v_guid
	;
	
	-- CALL p_shop_user_eval_clear_temp(v_guid);
	-- DROP TABLE IF EXISTS Shop_User_Eval_Temp;
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid
	;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns
    
    -- manufacturing Purchase Order
	OPEN result_orders FOR
		SELECT -- *
			t_MPO.id_order,
			MPO.cost_total_local,
			MPO.id_currency_cost,
			MPO.value_produced_total_local,
			t_MPO.active
		FROM Shop_Manufacturing_Purchase_Order MPO
		INNER JOIN tmp_Shop_Manufacturing_Purchase_Order t_MPO ON MPO.id_order = t_MPO.id_order
		;
    RETURN NEXT result_orders;
    
    -- manufacturing Purchase Order Product Link
	OPEN result_order_product_links FOR
		SELECT
			MPOPL.id_link,
			MPOPL.id_order,
			MPOPL.id_permutation,
			P.name as name_product,
			MPOPL.cost_total_local,
			MPOPL.id_currency_cost,
			MPOPL.value_produced_total_local,
			MPOPL.quantity_used,
			MPOPL.id_unit_quantity,
			MPOPL.quantity_produced,
			MPOPL.latency_manufacture_days,
			MPOPL.display_order
		FROM Shop_manufacturing_Purchase_Order_Product_Link MPOPL
		-- INNER JOIN tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL ON MPOPL.id_link = t_MPOPL.id_link
		INNER JOIN tmp_Shop_Manufacturing_Purchase_Order t_MPO ON MPOPL.id_order = t_MPO.id_order
		INNER JOIN Shop_Product_Permutation PP ON MPOPL.id_permutation = PP.id_permutation
		INNER JOIN Shop_Product P ON PP.id_product = P.id_product
		INNER JOIN Shop_Product_Category C ON P.id_category = C.id_category
		ORDER BY MPOPL.id_order, C.display_order, P.display_order, PP.display_order
		;
    RETURN NEXT result_order_product_links;
    
    -- Errors
	/*
    SELECT 
		/*
        t_ME.display_order,
		t_ME.guid,
        t_ME.id_type,
        t_ME.msg,
        MET.code, 
        MET.name,
        MET.description
        */
        *
    FROM tmp_Msg_Error t_ME
    INNER JOIN Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    WHERE guid = v_guid
    ;
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
    */

    /*
    -- Return arguments for test
    SELECT
	v_ids_category,
	v_get_inactive_category,
	v_ids_product,
	v_get_inactive_product,
    v_get_first_product_only,
    v_get_all_product,
	v_ids_image,
	v_get_inactive_image,
    v_get_first_image_only,
    v_get_all_image
    ;
    */
    
    -- select 'other outputs';
    -- select * from tmp_Shop_Product;
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order_Product_Link;
    DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order;
    DROP TABLE IF EXISTS tmp_Shop_Product;
        
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid
	;
END;
$$ LANGUAGE plpgsql;


/*


DROP FUNCTION IF EXISTS fetch_results;

CREATE OR REPLACE FUNCTION fetch_results()
RETURNS VOID AS $$
DECLARE
    curs refcursor;
    rec record;
BEGIN
    FOR curs IN SELECT p_shop_get_many_manufacturing_purchase_order (
		'', -- a_id_user
		TRUE, -- a_get_all_order
		FALSE, -- a_get_inactive_order
		FALSE, -- a_get_first_order_only
		'', -- a_ids_order
		FALSE, -- a_get_inactive_category
		'', -- a_ids_category
		FALSE, -- a_get_inactive_product
		'', -- a_ids_product
		FALSE, -- a_get_inactive_permutation
		'', -- a_ids_permutation
		NULL, -- a_date_from
		NULL -- a_date_to
	) LOOP
        RAISE NOTICE 'Fetching from cursor: %', curs;
        LOOP
            FETCH curs INTO rec;
            EXIT WHEN NOT FOUND;
            RAISE NOTICE 'Record: %', rec;
        END LOOP;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT fetch_results();

*/



CREATE OR REPLACE FUNCTION p_shop_get_many_customer (
	IN a_id_user INTEGER,
    IN a_get_all_customer BOOLEAN,
	IN a_get_inactive_customer BOOLEAN,
    IN a_get_first_customer_only BOOLEAN,
	IN a_ids_customer INTEGER[]
)
RETURNS SETOF REFCURSOR
AS $$
DECLARE
	v_id_user INTEGER;
	v_get_all_customer BOOLEAN;
	v_get_inactive_customer BOOLEAN;
	v_get_first_customer_only BOOLEAN;
	v_ids_customer INTEGER[];
	v_has_filter_customer BOOLEAN;
	v_guid UUID;
	v_id_permission_customer INTEGER;
	v_id_access_level_view INTEGER;
	v_id_error_type_bad_data INTEGER;
	v_code_error_type_bad_data VARCHAR(50);
	result_customers REFCURSOR;
	-- result_errors REFCURSOR;
BEGIN
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_get_inactive_customer := COALESCE(a_get_inactive_customer, FALSE);
	v_get_first_customer_only := COALESCE(a_get_first_customer_only, FALSE);
	v_ids_customer := TRIM(COALESCE(a_ids_customer, ''));
	v_get_all_customer := COALESCE(a_get_all_customer, CASE WHEN v_ids_customer = '' THEN TRUE ELSE FALSE END);


    v_code_error_type_bad_data = 'BAD_DATA';
    v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_bad_data LIMIT 1);
    v_guid := gen_random_uuid();
    v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');
    
    v_has_filter_customer = CASE WHEN a_ids_customer = '' THEN FALSE ELSE TRUE END;

    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Customer;
    
    CREATE TABLE tmp_Shop_Customer (
		id_customer INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Customer_id_customer
			FOREIGN KEY (id_customer)
			REFERENCES Shop_Customer(id_customer),
        active BOOLEAN NOT NULL,
        rank_customer INTEGER NULL,
        can_view BOOLEAN, 
        can_edit BOOLEAN, 
        can_admin BIT
    );
    
	/*
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		id_type INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    */

	-- select v_has_filter_product, v_has_filter_permutation;
    
    IF v_has_filter_customer = TRUE OR a_get_all_customer = TRUE THEN
		IF EXISTS (
			SELECT * 
			FROM UNNEST(v_ids_customer) AS Customer_Id
			LEFT JOIN Shop_Customer C ON Customer_Id = C.id_customer 
			WHERE ISNULL(C.id_customer)
		) THEN 
			RAISE EXCEPTION 'Invalid customer IDs: %', (
				SELECT STRING_AGG(Customer_Id, ', ')
			FROM UNNEST(v_ids_customer) AS Customer_Id
			LEFT JOIN Shop_Customer C ON Customer_Id = C.id_customer 
			WHERE ISNULL(C.id_customer)
				LIMIT 1
			)
			USING ERRCODE = '22000'
			;
		ELSE
			INSERT INTO tmp_Shop_Customer (
				id_customer,
                active,
                rank_customer
			)
			SELECT 
				C.id_customer,
                C.active,
                RANK() OVER (ORDER BY C.id_customer ASC) AS rank_customer
			FROM Shop_Customer C
            LEFT JOIN Split_Temp S_T ON C.id_customer = S_T.substring
            WHERE
				(
					a_get_all_customer = 1
                    OR NOT ISNULL(S_T.substring)
				)
				AND (
					a_get_inactive_customer = 1
                    OR C.active = TRUE
                )
			;
        END IF;
		
		IF a_get_first_customer_only = TRUE THEN
			DELETE FROM tmp_Shop_Customer t_C
				WHERE t_C.rank_customer > (
					SELECT MIN(t_C.rank_customer)
                    FROM tmp_Shop_Customer t_C
				)
			;
		END IF;
    END IF;
    
    -- Permissions
	-- v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER);
	v_id_permission_customer := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_CUSTOMER' LIMIT 1);
	
	-- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
	-- select * from Shop_User_Eval_Temp;
	
	CALL p_shop_user_eval(v_guid, a_id_user, FALSE, v_id_permission_customer, v_id_access_level_view, '');
	
	-- select * from Shop_User_Eval_Temp;
	
	IF NOT EXISTS (SELECT can_view FROM Shop_User_Eval_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
		RAISE EXCEPTION 'You do not have view permissions for %', (
			SELECT COALESCE(STRING_AGG(name, ', '), 'NULL') 
			FROM Shop_Permission 
			WHERE id_permission = v_id_permission_customer
		)
		USING ERRCODE = '42501'
		;
	END IF;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns
    -- v_now := CURRENT_TIMESTAMP;
    
    -- customers
	OPEN result_customers FOR
		SELECT 
			t_C.id_customer,
			C.name_company,
			C.name_contact,
			C.department_contact,
			C.id_address,
			C.phone_number,
			C.email,
			C.id_currency,
			C.active
		FROM tmp_Shop_Customer t_C
		INNER JOIN Shop_Customer C ON t_C.id_customer = C.id_customer
		;
    RETURN NEXT result_customers;
    
    -- Errors
	/*
    SELECT 
		/*
        t_ME.display_order,
		t_ME.guid,
        t_ME.id_type,
        t_ME.msg,
        MET.code, 
        MET.name,
        MET.description
        */
        *
    FROM tmp_Msg_Error t_ME
    INNER JOIN Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    WHERE guid = v_guid
    ;
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
    */

    /*
    -- Return arguments for test
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
    
    -- select 'other outputs';
    -- select * from tmp_Shop_Product;
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_Customer;
        
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid
	;
END;
$$ LANGUAGE plpgsql;


/*

DROP FUNCTION IF EXISTS fetch_results;

CREATE OR REPLACE FUNCTION fetch_results()
RETURNS VOID AS $$
DECLARE
    curs refcursor;
    rec record;
BEGIN
    FOR curs IN SELECT p_shop_get_many_customer (
		'', -- a_id_user
		1, -- a_get_all_customer
		0, -- a_get_inactive_customer
		0, -- a_get_first_customer_only
		'' -- a_ids_customer
	) LOOP
        RAISE NOTICE 'Fetching from cursor: %', curs;
        LOOP
            FETCH curs INTO rec;
            EXIT WHEN NOT FOUND;
            RAISE NOTICE 'Record: %', rec;
        END LOOP;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT fetch_results();

*/



CREATE OR REPLACE FUNCTION p_shop_get_many_customer_sales_order (
	IN a_id_user INTEGER,
    IN a_get_all_customer BOOLEAN,
	IN a_get_inactive_customer BOOLEAN,
	IN a_get_first_customer_only BOOLEAN,
	IN a_ids_customer INTEGER[],
    IN a_get_all_order BOOLEAN,
	IN a_get_inactive_order BOOLEAN,
	IN a_get_first_order_only BOOLEAN,
	IN a_ids_order INTEGER[],
	IN a_get_inactive_category BOOLEAN,
	IN a_ids_category INTEGER[],
	IN a_get_inactive_product BOOLEAN,
	IN a_ids_product INTEGER[],
	IN a_get_inactive_permutation BOOLEAN,
	IN a_ids_permutation INTEGER[],
    IN a_date_from TIMESTAMP,
    IN a_date_to TIMESTAMP
)
RETURNS SETOF REFCURSOR
AS $$
DECLARE
	v_id_user INTEGER;
	v_get_all_customer BOOLEAN;
	v_get_inactive_customer BOOLEAN;
	v_get_first_customer_only BOOLEAN;
	v_ids_customer INTEGER[];
	v_get_all_order BOOLEAN;
	v_get_inactive_order BOOLEAN;
	v_get_first_order_only BOOLEAN;
	v_ids_order INTEGER[];
	v_get_inactive_category BOOLEAN;
	v_ids_category INTEGER[];
	v_get_inactive_product BOOLEAN;
	v_ids_product INTEGER[];
	v_get_inactive_permutation BOOLEAN;
	v_ids_permutation INTEGER[];
	v_date_from TIMESTAMP;
	v_date_to TIMESTAMP;
	-- Argument redeclaration
	-- Variable declaration
    v_has_filter_customer BOOLEAN;
    v_has_filter_order BOOLEAN;
    v_has_filter_category BOOLEAN;
    v_has_filter_product BOOLEAN;
    v_has_filter_permutation BOOLEAN;
    v_has_filter_date_from BOOLEAN;
    v_has_filter_date_to BOOLEAN;
    v_guid UUID;
    -- v_id_user VARCHAR(100);
    -- v_ids_permutation_unavailable VARCHAR(4000);
    v_ids_permission_customer_purchase_order VARCHAR(4000);
    v_ids_product_permission VARCHAR(4000);
    -- v_ids_permutation_permission VARCHAR(4000);
    v_id_access_level_view INTEGER;
    -- v_now TIMESTAMP;
    -- v_id_minimum INTEGER;
    v_code_error_data VARCHAR(50);
    v_id_type_error_data INTEGER;
	result_customers REFCURSOR;
	result_orders REFCURSOR;
	result_order_product_links REFCURSOR;
	-- result_errors REFCURSOR;
BEGIN
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_get_inactive_customer := COALESCE(a_get_inactive_customer, FALSE);
	v_get_first_customer_only := COALESCE(a_get_first_customer_only, FALSE);
	v_ids_customer := TRIM(COALESCE(a_ids_customer, ''));
	v_get_all_customer := COALESCE(a_get_all_customer, CASE WHEN v_ids_customer = '' THEN TRUE ELSE FALSE END);
    v_get_inactive_order := COALESCE(a_get_inactive_order, FALSE);
	v_get_first_order_only := COALESCE(a_get_first_order_only, FALSE);
	v_ids_order := TRIM(COALESCE(a_ids_order, ''));
	v_get_all_order := COALESCE(a_get_all_order, CASE WHEN v_ids_order = '' THEN TRUE ELSE FALSE END);
	v_get_inactive_category := COALESCE(a_get_inactive_category, FALSE);
	v_ids_category := TRIM(COALESCE(a_ids_category, ''));
	v_get_inactive_product := COALESCE(a_get_inactive_product, FALSE);
	v_ids_product := TRIM(COALESCE(a_ids_product, ''));
	v_get_inactive_permutation := COALESCE(a_get_inactive_permutation, FALSE);
	v_ids_permutation := TRIM(COALESCE(a_ids_permutation, ''));
	v_date_from := a_date_from;
	v_date_to := a_date_to;

    v_guid := gen_random_uuid();
    v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    -- v_ids_permission_customer_purchase_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'Shop_Customer_Sales_ORDER' LIMIT 1);
    v_code_error_data := 'BAD_DATA';
    v_id_type_error_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data);
	
    v_has_filter_category := CASE WHEN a_ids_category = '' THEN FALSE ELSE TRUE END;
    v_has_filter_product := CASE WHEN a_ids_product = '' THEN FALSE ELSE TRUE END;
    v_has_filter_permutation := CASE WHEN a_ids_permutation = '' THEN FALSE ELSE TRUE END;
    v_has_filter_date_from := CASE WHEN ISNULL(a_date_from) THEN FALSE ELSE TRUE END;
    v_has_filter_date_to := CASE WHEN ISNULL(a_date_to) THEN FALSE ELSE TRUE END;
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Customer_Sales_Order_Product_Link;
    DROP TABLE IF EXISTS tmp_Shop_Customer_Sales_Order;
    DROP TABLE IF EXISTS tmp_Shop_Customer;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    
    CREATE TABLE tmp_Shop_Customer (
		id_customer INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Customer_id_customer
			FOREIGN KEY (id_customer)
			REFERENCES Shop_Customer(id_customer),
        active BOOLEAN NOT NULL,
        rank_customer INTEGER NULL,
        can_view BOOLEAN, 
        can_edit BOOLEAN, 
        can_admin BIT
    );
    
    CREATE TABLE tmp_Shop_Customer_Sales_Order (
		id_order INTEGER NOT NULL PRIMARY KEY,
        /*
		id_customer INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Customer_Sales_Order_id_customer
			FOREIGN KEY (id_customer) 
			REFERENCES Shop_Customer(id_customer),
		price_total_local REAL NOT NULL,
		id_currency_price INTEGER NOT NULL,
        */
        active BOOLEAN NOT NULL,
        rank_order INTEGER NOT NULL
    );
    
    /*
    CREATE TABLE tmp_Shop_Customer_Sales_Order_Product_Link (
		id_link INTEGER NOT NULL PRIMARY KEY,
		id_order INTEGER NOT NULL,
		CONSTRAINT FK_tmp_customer_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_Customer_Sales_Order(id_order),
		id_permutation INTEGER NOT NULL,
		CONSTRAINT FK_tmp_customer_Purchase_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		price_total_local REAL NOT NULL,
		id_currency_price INTEGER NOT NULL,
		quantity_ordered REAL NOT NULL,
		id_unit_quantity INTEGER NOT NULL,
		CONSTRAINT FK_tmp_customer_Purchase_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_received REAL NULL,
		latency_delivery_days INTEGER NOT NULL,
		display_order INTEGER NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Product (
		id_category INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Product_Category(id_category),
		id_product INTEGER NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		-- product_has_variations BOOLEAN NOT NULL,
		id_permutation INTEGER NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
        active_category BOOLEAN NOT NULL,
        active_product BOOLEAN NOT NULL,
        active_permutation BOOLEAN NULL,
        display_order_category INTEGER NOT NULL, 
        display_order_product INTEGER NOT NULL, 
        display_order_permutation INTEGER NULL, 
        rank_permutation INTEGER NOT NULL, -- _in_category
        -- name VARCHAR(255) NOT NULL,
        -- description VARCHAR(4000) NOT NULL,
		/*
        price_GBP_full REAL NOT NULL,
		price_GBP_min REAL NOT NULL,
		*/
        /*
        latency_manufacture INTEGER NOT NULL,
		quantity_min REAL NOT NULL,
		quantity_max REAL NOT NULL,
		quantity_step REAL NOT NULL,
		quantity_stock REAL NOT NULL,
		is_subscription BOOLEAN NOT NULL,
		id_recurrence_interval INTEGER,
		CONSTRAINT FK_tmp_Shop_Product_id_recurrence_interval
			FOREIGN KEY (id_recurrence_interval)
			REFERENCES Shop_Recurrence_Interval(id_interval),
		count_recurrence_interval INTEGER,
        id_stripe_product VARCHAR(100),
        product_has_variations INTEGER NOT NULL,
        */
        can_view BOOLEAN, 
        can_edit BOOLEAN, 
        can_admin BIT
    );
    
	/*
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		id_type INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
	*/

	-- select v_has_filter_product, v_has_filter_permutation;
    
    IF v_has_filter_customer = TRUE OR a_get_all_customer = TRUE THEN
		IF EXISTS (
			SELECT * 
			FROM UNNEST(v_ids_customer) AS Customer_Id
			LEFT JOIN Shop_Customer C ON Customer_Id = C.id_customer
			WHERE ISNULL(C.id_customer)
			LIMIT 1
		) THEN 
			RAISE EXCEPTION 'Invalid customer IDs: %', (
				SELECT STRING_AGG(Customer_Id, ', ')
				FROM UNNEST(v_ids_customer) AS Customer_Id
				LEFT JOIN Shop_Customer C ON Customer_Id = C.id_customer
				WHERE ISNULL(C.id_customer)
			)
			USING ERRCODE = '22000'
			;
		ELSE
			INSERT INTO tmp_Shop_Customer (
				id_customer,
                active,
                rank_customer
			)
			SELECT 
				C.id_customer,
                C.active,
                RANK() OVER (ORDER BY id_customer ASC) AS rank_customer
			FROM Shop_Customer C
            -- LEFT JOIN Split_Temp S_T ON C.id_customer = S_T.substring
            WHERE
				(
					a_get_all_customer = TRUE
                    -- OR NOT ISNULL(S_T.substring)
					OR C.id_customer = ANY(v_ids_customer)
                )
				AND (
					a_get_inactive_customer
                    OR C.active = TRUE
                )
			;
        END IF;
		
		IF a_get_first_customer_only THEN
			DELETE FROM tmp_Shop_Customer t_C
				WHERE t_C.rank_customer > (
					SELECT MIN(t_C.rank_customer)
                    FROM tmp_Shop_Customer t_C
				)
			;
		END IF;
    END IF;
    
    IF v_has_filter_category = TRUE AND EXISTS (
		SELECT STRING_AGG(Category_Id, ', ')
		FROM UNNEST(v_ids_category) AS Category_Id
		LEFT JOIN Shop_Product_Category C ON Category_Id = C.id_customer
		WHERE ISNULL(C.id_customer)
		LIMIT 1
	) THEN 
		RAISE EXCEPTION 'Invalid category IDs: %', (
			SELECT STRING_AGG(Category_Id, ', ')
			FROM UNNEST(v_ids_category) AS Category_Id
			LEFT JOIN Shop_Product_Category C ON Category_Id = C.id_customer
			WHERE ISNULL(C.id_customer)
		)
		USING ERRCODE = '22000'
		;
	END IF;
    
    IF v_has_filter_product = TRUE AND EXISTS (
		SELECT *
		FROM UNNEST(v_ids_product) AS Product_Id
		LEFT JOIN Shop_Product P ON Product_Id = P.id_product
		WHERE ISNULL(P.id_product)
		LIMIT 1
	) THEN 
		RAISE EXCEPTION 'Invalid product IDs: %', (
			SELECT COALESCE(STRING_AGG(Product_Id, ', ') ,'NULL')
			FROM UNNEST(v_ids_product) AS Product_Id
			LEFT JOIN Shop_Product P ON Product_Id = P.id_product
			WHERE ISNULL(P.id_product)
		)
		USING ERRCODE = '22000'
		;
	END IF;
    
    IF v_has_filter_permutation = TRUE AND EXISTS (
		SELECT *
		FROM UNNEST(v_ids_permutation) AS Permutation_Id
		LEFT JOIN Shop_Product_Permutation PP ON Permutation_Id = PP.id_permutation
		WHERE ISNULL(PP.id_permutation)
		LIMIT 1
	) THEN 
		RAISE EXCEPTION 'Invalid permutation IDs: %', (
			SELECT STRING_AGG(Permutation_Id, ', ')
			FROM UNNEST(v_ids_permutation) AS Permutation_Id
			LEFT JOIN Shop_Product_Permutation PP ON Permutation_Id = PP.id_permutation
			WHERE ISNULL(PP.id_permutation)
		)
		USING ERRCODE = '22000'
		;
	END IF;
    
    IF v_has_filter_category = TRUE OR v_has_filter_product = TRUE OR v_has_filter_permutation = TRUE THEN
		INSERT INTO tmp_Shop_Product (
			id_category,
			id_product,
			id_permutation,
			active_category,
			active_product,
			active_permutation,
			display_order_category,
			display_order_product,
			display_order_permutation
			-- rank_permutation,
			/*
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
			*/
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
			PP.display_order AS display_order_permutation
			-- RANK() OVER (ORDER BY C.display_order, P.display_order, PP.display_order) AS rank_permutation, #PARTITION BY P.id_category -- _in_category
			/*
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
			*/
		FROM Shop_Product P
		INNER JOIN Shop_Product_Permutation PP
			ON P.id_product = PP.id_product
		INNER JOIN Shop_Product_Category C
			ON P.id_category = C.id_category
		WHERE
			-- permutations
			(
				(
					NOT v_has_filter_permutation 
					OR FIND_IN_SET(PP.id_permutation, a_ids_permutation) > 0
				)
				AND (
					a_get_inactive_permutation 
					OR PP.active = TRUE
				)
			)
			-- categories
			AND (
				(
					NOT v_has_filter_category 
					OR FIND_IN_SET(P.id_category, a_ids_category) > 0
				)
				AND (
					a_get_inactive_category 
					OR C.active = TRUE
				)
			) 
			-- products
			AND (
				(
					NOT v_has_filter_product 
					OR FIND_IN_SET(P.id_product, a_ids_product) > 0
				)
				AND (
					a_get_inactive_product 
					OR P.active = TRUE
				)
			)
		;
    END IF;
    
    -- Get orders
	IF v_has_filter_order AND EXISTS (
		SELECT * 
		FROM UNNEST(v_ids_order) AS Order_Id
		LEFT JOIN Shop_Customer_Sales_Order CSO ON Order_Id = CSO.id_order
		WHERE ISNULL(CSO.id_order)
		LIMIT 1
	) THEN 
		RAISE EXCEPTION 'Invalid order IDs: %', (
			SELECT STRING_AGG(Order_Id, ', ')
			FROM UNNEST(v_ids_order) AS Order_Id
			LEFT JOIN Shop_Customer_Sales_Order CSO ON Order_Id = CSO.id_order
			WHERE ISNULL(CSO.id_order)
		)
		USING ERRCODE = '22000'
		;
	END IF;
	
	INSERT INTO tmp_Shop_Customer_Sales_Order ( -- _Product_Link
		id_order,
		active,
		rank_order
	)
	SELECT 
		CSO.id_order,
		CSO.active,
		RANK() OVER (ORDER BY CSO.id_order ASC) AS rank_order
	FROM Shop_Customer_Sales_Order CSO
	-- LEFT JOIN Split_Temp S_T ON CSO.id_order = S_T.substring
	INNER JOIN Shop_Customer_Sales_Order_Product_Link CSOPL ON CSO.id_order = CSOPL.id_order
	INNER JOIN Shop_Customer S ON CSO.id_customer = S.id_customer
	INNER JOIN Shop_Product_Permutation PP ON CSOPL.id_permutation = PP.id_permutation
	INNER JOIN Shop_Product P ON PP.id_product = P.id_product
	INNER JOIN Shop_Product_Category C ON P.id_category = C.id_category
	LEFT JOIN tmp_Shop_Product t_P ON CSOPL.id_permutation = t_P.id_permutation
	LEFT JOIN tmp_Shop_Customer t_S ON CSO.id_customer = t_S.id_customer
	WHERE
		-- customer
		/*
		(
			a_get_all_customer = 1
			OR NOT ISNULL(t_S.id_customer) -- CSO.id_customer IN (SELECT DISTINCT id_customer FROM tmp_Shop_Customer)
		)
		*/
		NOT ISNULL(t_S.id_customer)
		-- order
		AND (
			(
				a_get_all_order = 1
				OR (
					-- ID
					-- FIND_IN_SET(CSO.id_order, a_ids_order) > 0
					-- NOT ISNULL(S_T.substring)
					CSO.id_order = ANY(v_ids_order)
					-- date
					AND (
						(
							v_has_filter_date_from = 0
							OR CSO.created_on > a_date_from
						)
						AND (
							v_has_filter_date_to = 0
							OR CSO.created_on < a_date_to
						)
					)
				)
			)
			-- active
			AND (
				a_get_inactive_order
				OR CSO.active = TRUE
			)
		)
		-- permutations
		AND (
			(
				v_has_filter_category = FALSE 
				AND v_has_filter_product = FALSE 
				AND v_has_filter_permutation = 0
			)
			OR NOT ISNULL(t_P.id_permutation) -- CSO.id_permutation IN (SELECT DISTINCT id_permutation FROM tmp_Shop_Product)
		)
	;
	
	IF a_get_first_order_only THEN
		DELETE FROM tmp_Shop_Customer_Sales_Order t_CSO
			WHERE t_CSO.rank_order > (
				SELECT MIN(t_CSO.rank_order)
				FROM tmp_Shop_Customer_Sales_Order t_CSO
			)
		;
	END IF;
    
    -- Permissions
	-- v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER);
	v_ids_permission_customer_purchase_order := (SELECT STRING_AGG(id_permission, ',') FROM Shop_Permission WHERE code IN ('STORE_customer', 'STORE_customer_PURCHASE_ORDER'));
	-- v_ids_permutation_permission := (SELECT STRING_AGG(id_permutation, ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
	v_ids_product_permission := (SELECT STRING_AGG(P.id_product, ',') FROM (SELECT DISTINCT id_product FROM tmp_Shop_Product WHERE NOT ISNULL(id_product)) P);
	
	-- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
	-- select * from Shop_User_Eval_Temp;
	
	CALL p_shop_user_eval(v_guid, a_id_user, FALSE, v_ids_permission_customer_purchase_order, v_id_access_level_view, v_ids_product_permission);
	
	-- select * from Shop_User_Eval_Temp;
	
	IF NOT EXISTS (SELECT can_view FROM Shop_User_Eval_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
		RAISE EXCEPTION 'You do not have view permissions for %', (
			SELECT COALESCE(STRING_AGG(name, ', '), 'NULL') 
			FROM Shop_Permission 
			WHERE id_permission = v_ids_permission_customer_purchase_order
		)
		USING ERRCODE = '42501'
		;
	END IF;
	
	
	UPDATE tmp_Shop_Product t_P
	SET t_P.can_view = UE_T.can_view,
		t_P.can_edit = UE_T.can_edit,
		t_P.can_admin = UE_T.can_admin
	FROM tmp_Shop_Product t_P
	INNER JOIN Shop_User_Eval_Temp UE_T
		ON t_P.id_product = UE_T.id_product -- t_P.id_permutation = UE_T.id_permutation
		AND UE_T.GUID = v_guid
	;
	
	-- CALL p_shop_user_eval_clear_temp(v_guid);
	-- DROP TABLE IF EXISTS Shop_User_Eval_Temp;
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid
	;
    
    
    -- select * from tmp_Shop_Customer;
    -- select * from tmp_Shop_Product;
    
    -- Returns
    -- v_now := CURRENT_TIMESTAMP;
    
    -- customers
	OPEN result_customers FOR
		SELECT 
			t_S.id_customer,
			S.name_company,
			S.name_contact,
			S.department_contact,
			S.id_address,
			S.phone_number,
			S.email,
			S.id_currency,
			t_S.active
		FROM tmp_Shop_Customer t_S
		INNER JOIN Shop_Customer S
			ON t_S.id_customer = S.id_customer
		;
    RETURN NEXT result_customers;
    
    -- Customer Sales Order
	OPEN result_orders FOR
		SELECT -- *
			t_CSO.id_order,
			CSO.id_customer,
			CSO.price_total_local,
			CSO.id_currency_price,
			t_CSO.active
		FROM Shop_Customer_Sales_Order CSO
		INNER JOIN tmp_Shop_Customer_Sales_Order t_CSO ON CSO.id_order = t_CSO.id_order
		;
    RETURN NEXT result_orders;
    
    -- Customer Sales Order Product Link
	OPEN result_order_product_links FOR
		SELECT
			CSOPL.id_link,
			CSOPL.id_order,
			CSOPL.id_permutation,
			P.name as name_product,
			CSOPL.price_total_local,
			CSOPL.id_currency_price,
			CSOPL.quantity_ordered,
			CSOPL.id_unit_quantity,
			CSOPL.quantity_delivered,
			CSOPL.latency_delivery_days,
			CSOPL.display_order
		FROM Shop_Customer_Sales_Order_Product_Link CSOPL
		-- INNER JOIN tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL ON CSOPL.id_link = t_CSOPL.id_link
		INNER JOIN tmp_Shop_Customer_Sales_Order t_CSO ON CSOPL.id_order = t_CSO.id_order
		INNER JOIN Shop_Product_Permutation PP ON CSOPL.id_permutation = PP.id_permutation
		INNER JOIN Shop_Product P ON PP.id_product = P.id_product
		INNER JOIN Shop_Product_Category C ON P.id_category = C.id_category
		ORDER BY CSOPL.id_order, C.display_order, P.display_order, PP.display_order
		;
    RETURN NEXT result_order_product_links;
    
    -- Errors
	/*
    SELECT 
		/*
        t_ME.display_order,
		t_ME.guid,
        t_ME.id_type,
        t_ME.msg,
        MET.code, 
        MET.name,
        MET.description
        */
        *
    FROM tmp_Msg_Error t_ME
    INNER JOIN Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    WHERE guid = v_guid
    ;
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
    */

    /*
    -- Return arguments for test
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
    
    -- select 'other outputs';
    -- select * from tmp_Shop_Product;
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_Customer_Sales_Order_Product_Link;
    DROP TABLE IF EXISTS tmp_Shop_Customer_Sales_Order;
    DROP TABLE IF EXISTS tmp_Shop_Customer;
    DROP TABLE IF EXISTS tmp_Shop_Product;
        
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid
	;
END;
$$ LANGUAGE plpgsql;


/*


DROP FUNCTION IF EXISTS fetch_results;

CREATE OR REPLACE FUNCTION fetch_results()
RETURNS VOID AS $$
DECLARE
    curs refcursor;
    rec record;
BEGIN
    FOR curs IN SELECT p_shop_get_many_customer_sales_order (
		'', -- a_id_user
		1, -- a_get_all_customer
		0, -- a_get_inactive_customer
		0, -- a_get_first_customer_only
		'', -- a_ids_customer
		1, -- a_get_all_order
		0, -- a_get_inactive_order
		0, -- a_get_first_order_only
		'', -- a_ids_order
		0, -- a_get_inactive_category
		'', -- a_ids_category
		0, -- a_get_inactive_product
		'', -- a_ids_product
		0, -- a_get_inactive_permutation
		'', -- a_ids_permutation
		NULL, -- a_date_from
		NULL -- a_date_to
	) LOOP
        RAISE NOTICE 'Fetching from cursor: %', curs;
        LOOP
            FETCH curs INTO rec;
            EXIT WHEN NOT FOUND;
            RAISE NOTICE 'Record: %', rec;
        END LOOP;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT fetch_results();

*/



DO $$
BEGIN
	RAISE NOTICE 'PROCEDURE CREATION COMPLETE';
END $$;

/*

CALL p_populate_database ()

*/

/*
-- Remove previous proc
DROP PROCEDURE IF EXISTS p_populate_database;


DELIMITER //
CREATE OR REPLACE PROCEDURE p_populate_database ()
BEGIN
*/


-- Access Levels
INSERT INTO Shop_Access_Level (
	display_order, code, name, priority
)
VALUES 
	(1, 'VIEW', 'View', 3),
	(2, 'EDIT', 'Edit', 2),
	(3, 'ADMIN', 'Admin', 1)
;

-- Error Message Types
INSERT INTO Shop_Msg_Error_Type (
	code, name, description
)
VALUES 
	('BAD_DATA', 'Invalid data', 'Rubbish data'),
	('NO_PERMISSION', 'No permission', 'Not authorised'),
    ('PRODUCT_AVAILABILITY', 'Product not available', 'Product not available')
;

-- File Types
INSERT INTO File_Type (
	code, name, extension
)
VALUES 
	('JPEG', 'Joint Photographic Export Group', 'jpg'),
	('PNG', 'Portable Network Graphic', 'png'),
	('GIF', 'GIF', 'gif'),
	('MPEG-4', 'Multimedia Photographic Export Group 4', 'mp4')
;

-- Generic / shared properties
INSERT INTO Shop_General (
	quantity_max
)
VALUES (
	10
);

-- Categories
INSERT INTO Shop_Product_Category (
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

-- Recurrence Interval
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

-- Currency
INSERT INTO Shop_Currency (
	display_order, code, name, symbol, factor_from_GBP
)
VALUES
	(1, 'GBP', 'Great British Pound', '£', 1),
	(2, 'EUR', 'Euro', '€', 1.17)
;

-- Taxes and Surcharges
INSERT INTO Shop_Tax_Or_Surcharge (
	display_order,
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
	(1, 'VAT', 'Value Added Tax', 1, 1, 0, 0.2, TRUE, 0, 1)
;

-- Products
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
        TRUE,
		3
	),
	(
		2,
		2,
		'Test product 1', 
		FALSE,
        3
	),
    (
		3,
		3,
		'Phone',
        FALSE,
		1
	),
	(
		4,
		3,
		'Laptop',
        FALSE,
		1
	),
	(
		5,
		3,
		'Smart Watch',
        FALSE,
		1
	)
;

-- Variation Types
INSERT INTO Shop_Variation_Type (
	display_order, code, name, name_plural
)
VALUES 
	(1, 'COLOUR', 'Colour', 'Colours')
;

-- Variations
INSERT INTO Shop_Variation (
	display_order, id_type, code, name
)
VALUES 
	(1, 1, 'RED', 'Red'),
	(2, 1, 'BLUE', 'Blue')
;

-- Product Permutations
INSERT INTO Shop_Product_Permutation (
	display_order,
	id_product,
	description,
    cost_local,
    id_currency_cost,
    profit_local_min,
    -- id_currency_profit_min,
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
        -- 1,
        14,
		1,
		3,
		1,
		99,
		FALSE,
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
        -- 1,
		14,
		1,
		3,
		1,
		99,
		FALSE,
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
        -- 1,
		14,
		1,
		2,
		1,
		99,
		FALSE,
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
        -- 1,
		14,
		1,
		2,
		1,
		99,
		FALSE,
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
        -- 1,
		14,
		1,
		2,
		1,
		99,
		FALSE,
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
        -- 1,
		14,
		1,
		2,
		1,
		99,
		FALSE,
		NULL,
		NULL,
		-- 1,
		NULL
	)
;

-- Product Permutation Variation Links
INSERT INTO Shop_Product_Permutation_Variation_Link (
	display_order, id_permutation, id_variation
)
VALUES
	(1, 1, 1),
	(2, 2, 2)
;

-- Product Currency Link
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
	-- (1, NULL, 1, 1, 1, '/static/images/prod_PB0NUOSEs06ymG.jpg'), 
	(2, 1, 2, 1, 1, '/static/images/prod_PB0NUOSEs06ymG.jpg'),
	-- (1, NULL, 2, 1, 1, '/static/images/prod_PB0NUOSEs06ymG.jpg')
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

-- Discounts
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
	(1, 1, 'CRIMBO50', 'Christmas 50% off sale!', 0.5, 3, 9, CURRENT_TIMESTAMP, '2023-12-31 23:59:59', 1),
	(1, 2, 'CRIMBO50', 'Christmas 50% off sale!', 0.5, 3, 9, CURRENT_TIMESTAMP, '2023-12-31 23:59:59', 1)
;

-- Discount Delivery Region Links
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

-- Permission Groups
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

-- Permissions
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

-- Roles
INSERT INTO Shop_Role (
	display_order,
	code,
	name
)
VALUES 
	(1, 'DIRECTOR', 'Director'),
	(2, 'USER', 'User')
;

-- Role Permission link
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

-- Users
INSERT INTO Shop_User (
	id_user_oauth,
	name,
	email,
	-- is_email_verified,
	is_super_user
)
VALUES 
	('auth0|6582b95c895d09a70ba10fef', 'Teddy', 'edward.middletonsmith@gmail.com', TRUE),
	('parts_guest', 'Guest', '', FALSE)
;

-- User Role link
INSERT INTO Shop_User_Role_Link (
	id_user, id_role
)
VALUES 
	(1, 1)
;

-- Addresses
INSERT INTO Shop_Address (
	-- id_user, 
	id_region, name_full, phone_number, postcode, address_line_1, address_line_2, city, county
)
VALUES (1, 'Edward M-S', '07375 571430', 'CV22 6DN', '53 Alfred Green Close', '', 'Rugby', 'Warwickshire')
/*
SELECT U.id_user, 1, U.name, '07375 571430', 'CV22 6DN', '53 Alfred Green Close', '', 'Rugby', 'Warwickshire'
	FROM Shop_User U
*/
;

-- User Basket
INSERT INTO Shop_User_Basket (
	id_user,
	id_product,
	id_permutation,
	quantity
)
VALUES
	(1, 1, 1, 69)
;

-- User Order Status
INSERT INTO Shop_User_Order_Status (
	display_order, code, name, name_plural
)
VALUES
	(1, 'SUCCESS', 'Success', 'Successes'),
	(2, 'FAIL', 'Failure', 'Failures')
;

/*
-- User Order
INSERT INTO Shop_User_Order (
	id_user, value_total, id_order_status, id_checkout_session, id_currency
)
VALUES
	(1, 25, 1, 'noods', 1),
	(1, 25, 1, 'noods', 1)
;

-- User Order Product Link
INSERT INTO Shop_User_Order_Product_Link (
	id_order, id_product, id_permutation, quantity
)
VALUES
	(1, 1, 1, 69),
	(1, 2, NULL, 69),
	(1, 1, 2, 69)
;
*/

-- Supplier
INSERT INTO Shop_Supplier (
	name_company, name_contact, department_contact, id_address, phone_number, fax, email, website, id_currency
)
VALUES
	('Precision And Research Technology Systems Limited', 'Teddy Middleton-Smith', 'Executive Management', 1, '07375571430', '', 'teddy@partsltd.co.uk', 'www.partsltd.co.uk', 1)
;

-- Unit of Measurement
INSERT INTO Shop_Unit_Measurement (
	name_singular, name_plural, symbol, is_base_unit
)
VALUES
	('metre', 'metres', 'm', TRUE),
    ('kilogram', 'kilograms', 'kg', TRUE),
    ('item', 'items', 'x', FALSE)
;

/*
-- Unit of Measurement Conversion
INSERT INTO Shop_Unit_Measurement_Conversion (
	id_unit_derived, id_unit_base, power_unit_base, multiplier_unit_base, increment_unit_base
)
VALUES
	
;
*/

/*
-- Supplier Purchase Order
INSERT INTO Shop_Supplier_Purchase_Order (
	id_supplier, value_total, id_order_status, id_checkout_session, id_currency
)
VALUES
;

-- Supplier Purchase Order Product Link
INSERT INTO Shop_Supplier_Purchase_Order_Product_Link (
	id_order, id_permutation, cost_total_local, id_currency_cost, quantity_ordered, id_unit_quantity, quantity_received, latency_delivery, display_order
)
VALUES
;
*/

/*
-- Manufacturing Purchase Order
INSERT INTO Shop_Manufacturing_Purchase_Order (
	cost_total_local, id_currency_cost
)
VALUES
;

-- Manufacturing Purchase Order Product Link
INSERT INTO Shop_Manufacturing_Purchase_Order_Product_Link (
	id_order, id_permutation, cost_total_local, id_currency_cost, quantity_used, id_unit_quantity, quantity_produced, latency_manufacturing_days, display_order
)
VALUES
;
*/

/*
-- Customer
INSERT INTO Shop_Customer (
	name_company, name_contact, department_contact, id_address, phone_number, email, id_currency
)
VALUES

;
*/

/*
-- Customer Sales Order
INSERT INTO Shop_Customer_Sales_Order (
	cost_total_local, id_currency_cost
)
VALUES
;

-- Customer Sales Order Product Link
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

DO $$
BEGIN
	RAISE NOTICE 'TABLE POPULATION COMPLETE';
END $$;

-- Product Change Sets
SELECT * FROM Shop_Product_Change_Set;

-- User Change Sets
SELECT * FROM Shop_User_Change_Set;

-- Access Levels
SELECT * FROM Shop_Access_Level;
SELECT * FROM Shop_Access_Level_Audit;

-- Error Message type
SELECT * FROM Shop_Msg_Error_Type;

-- File Types
SELECT * FROM File_Type;
SELECT * FROM File_Type_Audit;

-- Generic / shared properties
SELECT * FROM Shop_General;
SELECT * FROM Shop_General_Audit;

-- Categories
SELECT * FROM Shop_Product_Category;
SELECT * FROM Shop_Product_Category_Audit;

-- Recurrence Interval
SELECT * FROM Shop_Recurrence_Interval;
SELECT * FROM Shop_Recurrence_Interval_Audit;

-- Region
SELECT * FROM Shop_Region;
SELECT * FROM Shop_Region_Audit;

-- Region Branch
SELECT * FROM Shop_Region_Branch;
SELECT * FROM Shop_Region_Branch_Audit;

-- Currency
SELECT * FROM Shop_Currency;
SELECT * FROM Shop_Currency_Audit;

-- Taxes and Surcharges
SELECT * FROM Shop_Tax_Or_Surcharge;
SELECT * FROM Shop_Tax_Or_Surcharge_Audit;

-- Products
SELECT * FROM Shop_Product;
SELECT * FROM Shop_Product_Audit;

-- Variation Types
SELECT * FROM Shop_Variation_Type;
SELECT * FROM Shop_Variation_Type_Audit;

-- Variations
SELECT * FROM Shop_Variation;
SELECT * FROM Shop_Variation_Audit;

-- Permutations
SELECT * FROM Shop_Product_Permutation;
SELECT * FROM Shop_Product_Permutation_Audit;

-- Permutation Variation Links
SELECT * FROM Shop_Product_Permutation_Variation_Link;
SELECT * FROM Shop_Product_Permutation_Variation_Link_Audit;

-- Product Currency Links
SELECT * FROM Shop_Product_Currency_Region_Link;
SELECT * FROM Shop_Product_Currency_Region_Link_Audit;

-- Image Types
SELECT * FROM Shop_Image_Type;
SELECT * FROM Shop_Image_Type_Audit;

-- Images
SELECT * FROM Shop_Image;
SELECT * FROM Shop_Image_Audit;

-- Delivery Option Types
SELECT * FROM Shop_Delivery_Option;
SELECT * FROM Shop_Delivery_Option_Audit;

-- Delivery Options
SELECT * FROM Shop_Product_Delivery_Option_Link;
SELECT * FROM Shop_Product_Delivery_Option_Link_Audit;

-- Discounts
SELECT * FROM Shop_Discount;
SELECT * FROM Shop_Discount_Audit;

-- Discount Delivery Region Links
SELECT * FROM Shop_Discount_Region_Currency_Link;
SELECT * FROM Shop_Discount_Region_Currency_Link_Audit;


-- Permission Groups
SELECT * FROM Shop_Permission_Group;
SELECT * FROM Shop_Permission_Group_Audit;

-- Permissions
SELECT * FROM Shop_Permission;
SELECT * FROM Shop_Permission_Audit;

-- Roles
SELECT * FROM Shop_Role;
SELECT * FROM Shop_Role_Audit;

-- Role Permission link
SELECT * FROM Shop_Role_Permission_Link;
SELECT * FROM Shop_Role_Permission_Link_Audit;

-- Users
SELECT * FROM Shop_User;
SELECT * FROM Shop_User_Audit;

-- User Role link
SELECT * FROM Shop_User_Role_Link;
SELECT * FROM Shop_User_Role_Link_Audit;


-- Addresses
SELECT * FROM Shop_Address;
SELECT * FROM Shop_Address_Audit;

-- Basket
SELECT * FROM Shop_User_Basket;
SELECT * FROM Shop_User_Basket_Audit;

-- Order Statuses
SELECT * FROM Shop_User_Order_Status;
SELECT * FROM Shop_User_Order_Status_Audit;

/*
-- Orders
SELECT * FROM Shop_User_Order;
SELECT * FROM Shop_User_Order_Audit;

-- Order Products
SELECT * FROM Shop_User_Order_Product_Link;
SELECT * FROM Shop_User_Order_Product_Link_Audit;
*/

-- Supplier
SELECT * FROM Shop_Supplier;
SELECT * FROM Shop_Supplier_Audit;

-- Unit Of Measurement
SELECT * FROM Shop_Unit_Measurement;
SELECT * FROM Shop_Unit_Measurement_Audit;

-- Unit of Measurement Conversion
SELECT * FROM Shop_Unit_Measurement_Conversion;
SELECT * FROM Shop_Unit_Measurement_Conversion_Audit;

-- Supplier Purchase Order
SELECT * FROM Shop_Supplier_Purchase_Order;
SELECT * FROM Shop_Supplier_Purchase_Order_Audit;

-- Supplier Purchase Order Product Link
SELECT * FROM Shop_Supplier_Purchase_Order_Product_Link;
SELECT * FROM Shop_Supplier_Purchase_Order_Product_Link_Audit;

-- Manufacturing Purchase Order
SELECT * FROM Shop_Manufacturing_Purchase_Order;
SELECT * FROM Shop_Manufacturing_Purchase_Order_Audit;

-- Manufacturing Purchase Order Product Link
SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link;
SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Audit;

-- Customers
SELECT * FROM Shop_Customer;
SELECT * FROM Shop_Customer_Audit;

-- Customer Sales Order
SELECT * FROM Shop_Customer_Sales_Order;
SELECT * FROM Shop_Customer_Sales_Order_Audit;

-- Customer Sales Order Product Link
SELECT * FROM Shop_Customer_Sales_Order_Product_Link;
SELECT * FROM Shop_Customer_Sales_Order_Product_Link_Audit;

