
/* Clear Store DataBase */



# Drop dependencies
DROP TABLE IF EXISTS tmp_Shop_Calc_User;
DROP TABLE IF EXISTS tmp_Product_Calc_User;
DROP TABLE IF EXISTS tmp_Product_p_Shop_User_Eval;
DROP TABLE IF EXISTS tmp_Msg_Error;
DROP TABLE IF EXISTS tmp_Currency;
DROP TABLE IF EXISTS tmp_Delivery_Option;
DROP TABLE IF EXISTS tmp_Delivery_Region;
DROP TABLE IF EXISTS tmp_Region;
DROP TABLE IF EXISTS tmp_Price;
DROP TABLE IF EXISTS tmp_Shop_User;
DROP TABLE IF EXISTS tmp_Shop_Order;
DROP TABLE IF EXISTS tmp_Shop_Product;
DROP TABLE IF EXISTS tmp_Shop_Product_p_shop_calc_user;
DROP TABLE IF EXISTS tmp_Shop_Product_p_Shop_Calc_User;
DROP TABLE IF EXISTS tmp_Shop_Image;
DROP TABLE IF EXISTS tmp_Shop_Variation;
DROP TABLE IF EXISTS tmp_Shop_Discount;
DROP TABLE IF EXISTS tmp_Discount;
DROP TABLE IF EXISTS tmp_Shop_Category;
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
DROP TABLE IF EXISTS tmp_Shop_Customer_Sale_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Shop_Customer_Sale_Order;



# Delete old tables
DROP TABLE IF EXISTS Split_Temp;
DROP TABLE IF EXISTS Split_Key_Value_Pair_Csv_Temp;
DROP TABLE IF EXISTS Split_Key_Value_Pair_Temp;

DROP TABLE IF EXISTS Shop_User_Eval_Temp;
DROP TABLE IF EXISTS Shop_Calc_User_Temp;

DROP TABLE IF EXISTS Shop_Customer_Sales_Order_Product_Link_Temp;
DROP TABLE IF EXISTS Shop_Customer_Sales_Order_Product_Link_Audit;
DROP TABLE IF EXISTS Shop_Customer_Sales_Order_Product_Link;

DROP TABLE IF EXISTS Shop_Customer_Sales_Order_Audit;
DROP TABLE IF EXISTS Shop_Customer_Sales_Order;

DROP TABLE IF EXISTS Shop_Customer_Temp;
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

DROP TABLE IF EXISTS Shop_Supplier_Temp;
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

DROP TABLE IF EXISTS Shop_User_Address_Audit;
DROP TABLE IF EXISTS Shop_User_Address;

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

DROP TABLE IF EXISTS Shop_Product_Permutation_Delivery_Option_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Permutation_Delivery_Option_Link;
DROP TABLE IF EXISTS Shop_Product_Delivery_Option_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Delivery_Option_Link;

DROP TABLE IF EXISTS Shop_Delivery_Option_Audit;
DROP TABLE IF EXISTS Shop_Delivery_Option;

DROP TABLE IF EXISTS Shop_Product_Image_Audit;
DROP TABLE IF EXISTS Shop_Product_Image;
DROP TABLE IF EXISTS Shop_Image_Audit;
DROP TABLE IF EXISTS Shop_Image;

DROP TABLE IF EXISTS Shop_Product_Price_Temp;
DROP TABLE IF EXISTS Shop_Product_Price_Audit;
DROP TABLE IF EXISTS Shop_Product_Price;

DROP TABLE IF EXISTS Shop_Stock_Item_Temp;
DROP TABLE IF EXISTS Shop_Stock_Item_Audit;
DROP TABLE IF EXISTS Shop_Stock_Item;

DROP TABLE IF EXISTS Shop_Product_Currency_Region_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Currency_Region_Link;
DROP TABLE IF EXISTS Shop_Product_Currency_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Currency_Link;

DROP TABLE IF EXISTS Shop_Product_Variation_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Variation_Link;
DROP TABLE IF EXISTS Shop_Product_Permutation_Variation_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Permutation_Variation_Link;

DROP TABLE IF EXISTS Shop_Variation_Audit;
DROP TABLE IF EXISTS Shop_Variation;
DROP TABLE IF EXISTS Shop_Product_Variation_Type_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Variation_Type_Link;

DROP TABLE IF EXISTS Shop_Variation_Type_Audit;
DROP TABLE IF EXISTS Shop_Variation_Type;

DROP TABLE IF EXISTS Shop_Product_Permutation_Temp;
DROP TABLE IF EXISTS Shop_Product_Permutation_Audit;
DROP TABLE IF EXISTS Shop_Product_Permutation;

DROP TABLE IF EXISTS Shop_Interval_Recurrence_Audit;
DROP TABLE IF EXISTS Shop_Interval_Recurrence;

DROP TABLE IF EXISTS Shop_Product_Audit;
DROP TABLE IF EXISTS Shop_Product;

DROP TABLE IF EXISTS Shop_Product_Category_Temp;
DROP TABLE IF EXISTS Shop_Product_Category_Audit;
DROP TABLE IF EXISTS Shop_Product_Category;
DROP TABLE IF EXISTS Shop_Category_Audit;
DROP TABLE IF EXISTS Shop_Category;

DROP TABLE IF EXISTS Shop_Tax_Or_Surcharge_Temp;
DROP TABLE IF EXISTS Shop_Tax_Or_Surcharge_Audit;
DROP TABLE IF EXISTS Shop_Tax_Or_Surcharge;

DROP TABLE IF EXISTS Shop_Currency_Temp;
DROP TABLE IF EXISTS Shop_Currency_Audit;
DROP TABLE IF EXISTS Shop_Currency;

DROP TABLE IF EXISTS Shop_Storage_Location_Branch_Temp;
DROP TABLE IF EXISTS Shop_Storage_Location_Branch_Audit;
DROP TABLE IF EXISTS Shop_Storage_Location_Branch;

DROP TABLE IF EXISTS Shop_Storage_Location_Temp;
DROP TABLE IF EXISTS Shop_Storage_Location_Audit;
DROP TABLE IF EXISTS Shop_Storage_Location;

DROP TABLE IF EXISTS Shop_Plant_Temp;
DROP TABLE IF EXISTS Shop_Plant_Audit;
DROP TABLE IF EXISTS Shop_Plant;

DROP TABLE IF EXISTS Shop_Address_Audit;
DROP TABLE IF EXISTS Shop_Address;

DROP TABLE IF EXISTS Shop_Delivery_Region_Branch_Audit;
DROP TABLE IF EXISTS Shop_Delivery_Region_Branch;
DROP TABLE IF EXISTS Shop_Region_Branch_Temp;
DROP TABLE IF EXISTS Shop_Region_Branch_Audit;
DROP TABLE IF EXISTS Shop_Region_Branch;

DROP TABLE IF EXISTS Shop_Delivery_Region_Audit;
DROP TABLE IF EXISTS Shop_Delivery_Region;
DROP TABLE IF EXISTS Shop_Region_Temp;
DROP TABLE IF EXISTS Shop_Region_Audit;
DROP TABLE IF EXISTS Shop_Region;


DROP TABLE IF EXISTS Shop_Unit_Measurement_Conversion_Audit;
DROP TABLE IF EXISTS Shop_Unit_Measurement_Conversion;

DROP TABLE IF EXISTS Shop_Unit_Measurement_Audit;
DROP TABLE IF EXISTS Shop_Unit_Measurement;

DROP TABLE IF EXISTS Shop_Image_Type_Audit;
DROP TABLE IF EXISTS Shop_Image_Type;

DROP TABLE IF EXISTS Shop_General_Audit;
DROP TABLE IF EXISTS Shop_General;

DROP TABLE IF EXISTS File_Type_Audit;
DROP TABLE IF EXISTS File_Type;

DROP TABLE IF EXISTS Msg_Error_Type;
DROP TABLE IF EXISTS Shop_Msg_Error_Type;

DROP TABLE IF EXISTS Shop_Access_Level_Audit;
DROP TABLE IF EXISTS Shop_Access_Level;

DROP TABLE IF EXISTS Shop_Sales_And_Purchasing_Change_Set;
DROP TABLE IF EXISTS Shop_User_Change_Set;
DROP TABLE IF EXISTS Shop_Product_Change_Set;


-- Procedures
DROP PROCEDURE IF EXISTS p_split;
DROP PROCEDURE IF EXISTS p_clear_split_temp;
DROP PROCEDURE IF EXISTS p_split_key_value_pair_csv;
DROP PROCEDURE IF EXISTS p_clear_split_key_value_csv_temp;
DROP PROCEDURE IF EXISTS p_clear_split_key_value_pair_csv_temp;

DROP PROCEDURE IF EXISTS p_debug_timing_reporting;
DROP PROCEDURE IF EXISTS p_validate_guid;
DROP PROCEDURE IF EXISTS p_validate_guid_test;

DROP FUNCTION IF EXISTS fn_shop_get_product_permutation_name;

DROP PROCEDURE IF EXISTS p_shop_calc_user;
DROP PROCEDURE IF EXISTS p_shop_calc_user;
DROP PROCEDURE IF EXISTS p_shop_clear_user_eval_temp;
DROP PROCEDURE IF EXISTS p_shop_clear_calc_user;

DROP PROCEDURE IF EXISTS p_shop_get_many_access_level;
DROP PROCEDURE IF EXISTS p_shop_get_many_unit_measurement;

DROP PROCEDURE IF EXISTS p_shop_get_many_region;
DROP PROCEDURE IF EXISTS p_shop_get_many_plant;
DROP PROCEDURE IF EXISTS p_shop_get_many_storage_location;
DROP PROCEDURE IF EXISTS p_shop_get_many_currency;

DROP PROCEDURE IF EXISTS p_shop_save_category;
DROP PROCEDURE IF EXISTS p_shop_save_product_category;
DROP PROCEDURE IF EXISTS p_shop_save_product_category_test;
DROP PROCEDURE IF EXISTS p_shop_save_product;
DROP PROCEDURE IF EXISTS p_shop_save_product_test;
DROP PROCEDURE IF EXISTS p_shop_calc_product_permutation;
DROP PROCEDURE IF EXISTS p_shop_clear_calc_product_permutation;
DROP PROCEDURE IF EXISTS p_shop_get_many_product;
DROP PROCEDURE IF EXISTS p_shop_get_many_stripe_product_new;
DROP PROCEDURE IF EXISTS p_shop_save_permutation;
DROP PROCEDURE IF EXISTS p_shop_save_product_permutation;
DROP PROCEDURE IF EXISTS p_shop_get_many_product_variation;
DROP FUNCTION IF EXISTS fn_shop_get_id_product_permutation_from_variation_csv_list;
DROP PROCEDURE IF EXISTS p_shop_save_stock_item;
DROP PROCEDURE IF EXISTS p_shop_save_stock_item_test;
DROP PROCEDURE IF EXISTS p_shop_get_many_stock_item;
DROP PROCEDURE IF EXISTS p_shop_get_many_product_price_and_discount_and_delivery_option;
DROP PROCEDURE IF EXISTS p_shop_get_many_product_price_and_discount_and_delivery_option;
DROP PROCEDURE IF EXISTS p_shop_get_many_stripe_price_new;
DROP PROCEDURE IF EXISTS p_shop_save_user;
DROP PROCEDURE IF EXISTS p_shop_edit_user;
DROP PROCEDURE IF EXISTS p_shop_get_many_user;
DROP PROCEDURE IF EXISTS p_get_many_user;
DROP PROCEDURE IF EXISTS p_shop_get_many_user_basket;
DROP PROCEDURE IF EXISTS p_shop_edit_user_basket;
DROP PROCEDURE IF EXISTS p_shop_save_supplier;
DROP PROCEDURE IF EXISTS p_shop_get_many_supplier;
DROP PROCEDURE IF EXISTS p_shop_save_supplier_purchase_order;
DROP PROCEDURE IF EXISTS p_shop_get_many_supplier_purchase_order;
DROP PROCEDURE IF EXISTS p_shop_save_manufacturing_purchase_order;
DROP PROCEDURE IF EXISTS p_shop_get_many_manufacturing_purchase_order;
DROP PROCEDURE IF EXISTS p_shop_save_customer;
DROP PROCEDURE IF EXISTS p_shop_get_many_customer;
DROP PROCEDURE IF EXISTS p_shop_save_customer_sales_order;
DROP PROCEDURE IF EXISTS p_shop_get_many_customer_sales_order;

# Product Change Sets



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Change_Set';

CREATE TABLE Shop_Product_Change_Set (
	id_change_set INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	comment VARCHAR(500),
	updated_last_on DATETIME,
	updated_last_by VARCHAR(100)
);
# Split Staging
-- USE partsltd_prod;
-- DROP TABLE IF EXISTS Split_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Split_Temp';

CREATE TABLE Split_Temp (
	guid BINARY(36) NOT NULL
    , display_order INT NOT NULL
	, substring VARCHAR(4000) NOT NULL
);

# User Change Sets



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Change_Set';

CREATE TABLE IF NOT EXISTS Shop_User_Change_Set (
	id_change_set INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    comment VARCHAR(500),
    updated_last_on DATETIME,
    updated_last_by VARCHAR(100)
);
# Split Key Value Pair CSV Staging
-- USE partsltd_prod;
-- DROP TABLE IF EXISTS Split_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Split_Key_Value_Pair_Csv_Temp';

CREATE TABLE Split_Key_Value_Pair_Csv_Temp (
	guid BINARY(36) NOT NULL
    , id INT NOT NULL
	, key_column VARCHAR(4000) NULL
    , value_column VARCHAR(4000) NULL
);

# Sales And Purchasing Change Sets



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Sales_And_Purchasing_Change_Set';

CREATE TABLE Shop_Sales_And_Purchasing_Change_Set (
	id_change_set INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	comment VARCHAR(500),
	updated_last_on DATETIME,
	updated_last_by VARCHAR(100)
);
# Access Levels



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Access_Level';

CREATE TABLE IF NOT EXISTS Shop_Access_Level (
    id_access_level INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50),
    name VARCHAR(255),
    priority INT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Access_Level_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_User_Change_Set(id_change_set)
);



# Access Level Audits



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



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Msg_Error_Type';

CREATE TABLE IF NOT EXISTS Shop_Msg_Error_Type (
	id_type INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50) NOT NULL,
	name VARCHAR(500) NOT NULL,
	description VARCHAR(1000)
);

# File Types



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'File_Type';
	
CREATE TABLE IF NOT EXISTS File_Type (
	id_type INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50),
	name VARCHAR(100),
	extension VARCHAR(50),
	created_on DATETIME,
	created_by INT,
	updated_last_on DATETIME,
	updated_last_by VARCHAR(100)
);

# File Type Audit



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
	created_by INT,
	updated_last_on DATETIME,
	updated_last_by VARCHAR(100)
);
# Generic / shared properties



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_General';

CREATE TABLE IF NOT EXISTS Shop_General (
	id_general INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	quantity_max FLOAT,
	created_on DATETIME,
	created_by INT,
	id_change_set INT,
	CONSTRAINT CHK_Shop_General_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Shop General Audits



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
# Image Types



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Image_Type';

CREATE TABLE IF NOT EXISTS Shop_Image_Type (
	id_type INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	/*
    id_type_file INT NOT NULL,
    CONSTRAINT FK_Shop_Image_Type_id_type_file
		FOREIGN KEY (id_type_file)
        REFERENCES File_Type(id_type),
	*/
	code VARCHAR(50),
	name VARCHAR(255),
	name_plural VARCHAR(256),
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on DATETIME,
	created_by INT,
	id_change_set INT,
	CONSTRAINT FK_Shop_Image_Type_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Image Type Audits



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
# Regions

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Region';

CREATE TABLE IF NOT EXISTS Shop_Region (
	id_region INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Region_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Region Audits



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
# Region Temp



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Region_Temp';

CREATE TABLE IF NOT EXISTS Shop_Region_Temp (
	id_region INT NOT NULL PRIMARY KEY,
	code VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Region_Temp_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Region Branchs



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
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Region_Branch_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Region Audits



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
# Region Branch Temp



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Region_Branch_Temp';

CREATE TABLE IF NOT EXISTS Shop_Region_Branch_Temp (
	id_branch INT NOT NULL PRIMARY KEY,
    id_region_parent INT NOT NULL,
    id_region_child INT NOT NULL,
    -- depth INT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL
);
# Addresses


SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Address';

CREATE TABLE Shop_Address (
    id_address INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_region INT NOT NULL,
    postcode VARCHAR(20) NOT NULL,
    address_line_1 VARCHAR(256) NOT NULL,
    address_line_2 VARCHAR(256) NOT NULL,
    city VARCHAR(256) NOT NULL,
    county VARCHAR(256) NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Address_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);
# Plant

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Plant';

CREATE TABLE IF NOT EXISTS Shop_Plant (
	id_plant INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(500) NOT NULL,
    id_address INT NOT NULL,
    CONSTRAINT FK_Shop_Plant_id_address
		FOREIGN KEY (id_address)
        REFERENCES Shop_Address(id_address),
    id_user_manager INT NOT NULL,
	active BIT NOT NULL DEFAULT 1,
	created_on DATETIME,
	created_by INT,
	id_change_set INT,
	CONSTRAINT FK_Shop_Plant_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Address Audits



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
# Plant Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Plant_Audit';

CREATE TABLE IF NOT EXISTS Shop_Plant_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_plant INT NOT NULL,
	CONSTRAINT FK_Shop_Plant_Audit_id_plant
		FOREIGN KEY (id_plant)
		REFERENCES Shop_Plant(id_plant)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(500),
	value_new VARCHAR(500),
	id_change_set INT NOT NULL,
	CONSTRAINT FK_Shop_Plant_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Plant Temp



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Plant_Temp';

CREATE TABLE IF NOT EXISTS Shop_Plant_Temp (
	id_plant INT NOT NULL PRIMARY KEY
    , code VARCHAR(50) NOT NULL
    , name VARCHAR(500) NOT NULL
    , id_address INT NOT NULL
    , id_user_manager INT NOT NULL
	, active BIT NOT NULL DEFAULT 1
    , guid BINARY(36) NOT NULL
);

# Storage Location



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Storage_Location';

CREATE TABLE IF NOT EXISTS Shop_Storage_Location (
	id_location INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_plant INT NOT NULL,
    CONSTRAINT FK_Shop_Storage_Location_id_plant
		FOREIGN KEY (id_plant)
        REFERENCES Shop_Plant(id_plant),
    code VARCHAR(50) NOT NULL,
    name VARCHAR(500) NOT NULL,
	active BIT NOT NULL DEFAULT 1,
	created_on DATETIME,
	created_by INT,
	id_change_set INT,
	CONSTRAINT FK_Shop_Storage_Location_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Storage Location Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Storage_Location_Audit';

CREATE TABLE IF NOT EXISTS Shop_Storage_Location_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_location INT NOT NULL,
	CONSTRAINT FK_Shop_Storage_Location_Audit_id_location
		FOREIGN KEY (id_location)
		REFERENCES Shop_Storage_Location(id_location)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(500),
	value_new VARCHAR(500),
	id_change_set INT NOT NULL,
	CONSTRAINT FK_Shop_Storage_Location_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Storage Location Temp



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Storage_Location_Temp';

CREATE TABLE IF NOT EXISTS Shop_Storage_Location (
	id_location INT NOT NULL PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(500) NOT NULL,
	active BIT NOT NULL DEFAULT 1
);

# Storage Location Branch



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Storage_Location_Branch';

CREATE TABLE IF NOT EXISTS Shop_Storage_Location_Branch (
	id_branch INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_location_parent INT NOT NULL,
    CONSTRAINT FK_Shop_Storage_Location_Branch_id_location_parent
		FOREIGN KEY (id_location_parent)
        REFERENCES Shop_Storage_Location(id_location)
        ON UPDATE RESTRICT,
    id_location_child INT NOT NULL,
    CONSTRAINT FK_Shop_Storage_Location_Branch_id_location_child
		FOREIGN KEY (id_location_child)
        REFERENCES Shop_Storage_Location(id_location)
        ON UPDATE RESTRICT,
    -- depth INT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Storage_Location_Branch_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Storage Location Branch Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Storage_Location_Branch_Audit';

CREATE TABLE IF NOT EXISTS Shop_Storage_Location_Branch_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_branch INT NOT NULL,
	CONSTRAINT FK_Shop_Storage_Location_Branch_Audit_id_branch
		FOREIGN KEY (id_branch)
		REFERENCES Shop_Storage_Location_Branch(id_branch)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(500),
	value_new VARCHAR(500),
	id_change_set INT NOT NULL,
	CONSTRAINT FK_Shop_Storage_Location_Branch_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Storage Location Branch Temp



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Storage_Location_Branch_Temp';

CREATE TABLE IF NOT EXISTS Shop_Storage_Location_Branch_Temp (
	id_branch INT NOT NULL PRIMARY KEY,
    id_location_parent INT NOT NULL,
    id_location_child INT NOT NULL,
    -- depth INT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL
);
# Currencies



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Currency';

CREATE TABLE IF NOT EXISTS Shop_Currency (
    id_currency INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(255) NOT NULL,
    symbol VARCHAR(50) NOT NULL,
    factor_from_GBP FLOAT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Currency_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
# Currency Audits



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
# Currency Temp



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Currency_Temp';

CREATE TABLE IF NOT EXISTS Shop_Currency_Temp (
    id_currency INT NOT NULL PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(255) NOT NULL,
    symbol VARCHAR(1) NOT NULL,
    factor_from_GBP FLOAT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL
);
# Taxes and Surcharges



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
	created_by INT,
	id_change_set INT,
	CONSTRAINT FK_Shop_Tax_Or_Surcharge_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Tax Or Surcharge Audits



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
# Taxes and Surcharges Temp



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Tax_Or_Surcharge_Temp';

CREATE TABLE Shop_Tax_Or_Surcharge_Temp (
	id_tax INT NOT NULL PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
	id_region_buyer INT NOT NULL,
	id_region_seller INT NOT NULL,
    id_currency INT,
    fixed_fee FLOAT NOT NULL DEFAULT 0,
	multiplier FLOAT NOT NULL DEFAULT 1 CHECK (multiplier > 0),
    apply_fixed_fee_before_multiplier BIT DEFAULT 1,
	quantity_min FLOAT NOT NULL DEFAULT 0,
    quantity_max FLOAT NOT NULL,
	active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL
);

# Unit of Measurement



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Unit_Measurement';

CREATE TABLE IF NOT EXISTS Shop_Unit_Measurement (
    id_unit_measurement INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_singular VARCHAR(255) NOT NULL,
    name_plural VARCHAR(256) NOT NULL,
    symbol VARCHAR(50) NOT NULL,
    symbol_is_suffix_not_prefix BIT NOT NULL DEFAULT 1,
    is_base_unit BIT NOT NULL DEFAULT 0,
    is_unit_of_distance BIT NOT NULL DEFAULT 0,
    is_unit_of_mass BIT NOT NULL DEFAULT 0,
    is_unit_of_time BIT NOT NULL DEFAULT 0,
    is_unit_of_volume BIT NOT NULL DEFAULT 0,
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Unit_Measurement_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Unit of Measurement Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Unit_Measurement_Audit';

CREATE TABLE IF NOT EXISTS Shop_Unit_Measurement_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_unit_measurement INT NOT NULL,
    CONSTRAINT FK_Shop_Unit_Measurement_Audit_id_unit_measurement
		FOREIGN KEY (id_unit_measurement)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Unit_Measurement_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Unit of Measurement Conversion



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Unit_Measurement_Conversion';

CREATE TABLE IF NOT EXISTS Shop_Unit_Measurement_Conversion (
    id_conversion INT NOT NULL PRIMARY KEY,
    id_unit_derived INT NOT NULL,
    id_unit_base INT NOT NULL,
    power_unit_base FLOAT NOT NULL,
    multiplier_unit_base FLOAT NOT NULL,
    increment_unit_base FLOAT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Unit_Measurement_Conversion_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Unit of Measurement Conversion Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Unit_Measurement_Conversion_Audit';

CREATE TABLE IF NOT EXISTS Shop_Unit_Measurement_Conversion_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_conversion INT NOT NULL,
    CONSTRAINT FK_Shop_Unit_Measurement_Conversion_Audit_id_conversion
		FOREIGN KEY (id_conversion)
        REFERENCES Shop_Unit_Measurement_Conversion(id_conversion)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Unit_Measurement_Conversion_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Categories


SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Category';

CREATE TABLE IF NOT EXISTS Shop_Product_Category (
	id_category INT NOT NULL AUTO_INCREMENT PRIMARY KEY
	, code VARCHAR(50)
	, name VARCHAR(255)
	, description VARCHAR(4000)
	, active BIT NOT NULL DEFAULT 1
	, display_order INT NOT NULL
    , id_access_level_required INT NOT NULL
    , CONSTRAINT FK_Shop_Product_Category_id_access_level_required
		FOREIGN KEY (id_access_level_required)
        REFERENCES Shop_Access_Level(id_access_level)
	, created_on DATETIME
	, created_by INT NOT NULL
	, id_change_set INT
	, CONSTRAINT FK_Shop_Product_Category_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Category Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Category_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Category_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_category INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Category_Audit_id_category
		FOREIGN KEY (id_category)
		REFERENCES Shop_Product_Category(id_category)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(500),
	value_new VARCHAR(500),
	id_change_set INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Category_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Categories Temp

-- DROP TABLE Shop_Product_Category_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Category_Temp';

CREATE TABLE IF NOT EXISTS Shop_Product_Category_Temp (
	id_category INT NOT NULL
	, code VARCHAR(50) NOT NULL
	, name VARCHAR(255) NOT NULL
	, description VARCHAR(4000) NULL
    , id_access_level_required INT NOT NULL DEFAULT 1
	, display_order INT NOT NULL
	, active BIT NOT NULL
	, can_view BIT NULL DEFAULT NULL
	, can_edit BIT NULL DEFAULT NULL
	, can_admin BIT NULL DEFAULT NULL
    , guid BINARY(36) NOT NULL
);

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
	created_on DATETIME NOT NULL,
	created_by INT NOT NULL,
	id_change_set INT,
	CONSTRAINT FK_Shop_Product_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Products



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
# Products Temp

-- DROP TABLE IF EXISTS Shop_Product_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Temp';

CREATE TABLE IF NOT EXISTS Shop_Product_Temp (
	id_product INT NOT NULL
	, name VARCHAR(255) NOT NULL
	, id_category INT NOT NULL
    , has_variations BIT NOT NULL
    , id_access_level_required INT NOT NULL
	, display_order INT NOT NULL
	, active BIT NOT NULL DEFAULT 1
	, can_view BIT NULL DEFAULT NULL
	, can_edit BIT NULL DEFAULT NULL
	, can_admin BIT NULL DEFAULT NULL
    , guid BINARY(36) NOT NULL
);

# Product Permutation



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation (
	id_permutation INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_product INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Permutation_id_product
		FOREIGN KEY (id_product)
		REFERENCES Shop_Product(id_product)
		ON UPDATE RESTRICT,
	-- name VARCHAR(255) NOT NULL,
	description VARCHAR(4000) NOT NULL,
	cost_local FLOAT NOT NULL,
    id_currency_cost INT NOT NULL,
	profit_local_min FLOAT NOT NULL,
    -- id_currency_profit_min INT NOT NULL,
	latency_manufacture_days INT NOT NULL,
	id_unit_measurement_quantity INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Permutation_id_unit_quantity
		FOREIGN KEY (id_unit_measurement_quantity)
		REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	count_unit_measurement_per_quantity_step FLOAT NOT NULL,
	quantity_min FLOAT NOT NULL,
	quantity_max FLOAT NOT NULL,
	quantity_stock FLOAT NOT NULL,
	is_subscription BIT NOT NULL,
	id_unit_measurement_interval_recurrence INT,
	CONSTRAINT FK_Shop_Product_Permutation_id_unit_interval_recurrence
		FOREIGN KEY (id_unit_measurement_interval_recurrence)
		REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	/*
	CONSTRAINT CHECK_FK_Shop_Product_Permutation_id_unit_measurement_interval_recurrence
		CHECK (id_unit_measurement_interval_recurrence IN (SELECT id_unit_measurement FROM Shop_Unit_Measurement WHERE is_unit_of_time = 1)),
	*/
	count_interval_recurrence INT,
	id_stripe_product VARCHAR(100) NULL,
	does_expire_faster_once_unsealed BIT NOT NULL DEFAULT 0,
	id_unit_measurement_interval_expiration_unsealed INT,
	CONSTRAINT FK_Shop_Product_Permutation_id_unit_interval_expiration_unsealed
		FOREIGN KEY (id_unit_measurement_interval_expiration_unsealed)
		REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	/*
	CONSTRAINT CHECK_FK_Shop_Product_Permutation_id_interval_expiration_unsealed
		CHECK (id_interval_expiration_unsealed IN (SELECT id_unit_measurement FROM Shop_Unit_Measurement WHERE is_unit_of_time = 1)),
	*/
	count_interval_expiration_unsealed INT,
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on DATETIME,
	created_by INT,
	id_change_set INT,
	CONSTRAINT FK_Shop_Product_Permutation_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Product Permutation Audits



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

# Product Permutation Temp

-- DROP TABLE IF EXISTS Shop_Product_Permutation_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation_Temp';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation_Temp (
	id_permutation INT NOT NULL
	, id_product INT NOT NULL
	, description VARCHAR(4000) NOT NULL
	, cost_local FLOAT NOT NULL
    , id_currency_cost INT NOT NULL
	, profit_local_min FLOAT NOT NULL
	, latency_manufacture_days INT NOT NULL
	, id_unit_measurement_quantity INT NOT NULL
	, count_unit_measurement_per_quantity_step FLOAT NOT NULL
	, quantity_min FLOAT NOT NULL
	, quantity_max FLOAT NOT NULL
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

# Variation Types



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Variation_Type';

CREATE TABLE IF NOT EXISTS Shop_Variation_Type (
	id_type INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50),
	name VARCHAR(255),
	name_plural VARCHAR(256),
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on DATETIME,
	created_by INT,
	id_change_set INT,
	CONSTRAINT FK_Shop_Variation_Type_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Variation Type Audits



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
	created_by INT,
	id_change_set INT,
	CONSTRAINT FK_Shop_Variation_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Variation Audits



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

# Product Permutation Variation Link



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
	created_by INT,
	id_change_set INT,
	CONSTRAINT FK_Shop_Product_Permutation_Variation_Link_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Product Permutation Variation Link Audits



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
# Stock Stock Item

-- DROP TABLE IF EXISTS Shop_Stock_Item;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Stock_Item';

CREATE TABLE IF NOT EXISTS Shop_Stock_Item (
	id_stock INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_permutation INT NOT NULL,
	CONSTRAINT FK_Shop_Stock_Item_id_permutation
		FOREIGN KEY (id_permutation)
		REFERENCES Shop_Product_Permutation(id_permutation),
	date_purchased DATETIME NOT NULL,
    date_received DATETIME NULL,
    id_location_storage INT NOT NULL,
    CONSTRAINT FK_Shop_Stock_Item_id_location_storage
		FOREIGN KEY (id_location_storage)
        REFERENCES Shop_Storage_Location(id_location),
    id_currency_cost INT NOT NULL,
    CONSTRAINT FK_Shop_Stock_Item_id_currency
		FOREIGN KEY (id_currency_cost)
        REFERENCES Shop_Currency(id_currency),
    cost_local_VAT_incl FLOAT NULL,
    cost_local_VAT_excl FLOAT NULL,
    is_sealed BIT NOT NULL DEFAULT 1,
    date_unsealed DATETIME NULL,
	date_expiration DATETIME NOT NULL,
    is_consumed BIT NOT NULL DEFAULT 0,
    date_consumed DATETIME NULL,
	active BIT NOT NULL DEFAULT 1,
	created_on DATETIME,
	created_by INT,
	id_change_set INT,
	CONSTRAINT FK_Shop_Stock_Item_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Stock Item Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Stock_Item_Audit';

CREATE TABLE IF NOT EXISTS Shop_Stock_Item_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_stock INT NOT NULL,
	CONSTRAINT FK_Shop_Stock_Item_Audit_id_stock
		FOREIGN KEY (id_stock)
		REFERENCES Shop_Stock_Item(id_stock)
		ON UPDATE RESTRICT,
	name_field VARCHAR(50),
	value_prev VARCHAR(500),
	value_new VARCHAR(500),
	id_change_set INT NOT NULL,
	CONSTRAINT FK_Shop_Stock_Item_Audit_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
		ON UPDATE RESTRICT
);

# Stock Stock Item Temp

DROP TABLE IF EXISTS Shop_Stock_Item_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Stock_Item_Temp';

CREATE TABLE IF NOT EXISTS Shop_Stock_Item_Temp (
	id_stock INT NULL
    -- , id_category INT NULL
    , id_product INT NOT NULL
	, id_permutation INT NULL
    , id_pairs_variations VARCHAR(4000) NULL
	, date_purchased DATETIME NOT NULL
    , date_received DATETIME NULL
    , id_location_storage INT NOT NULL
    , id_currency_cost INT NOT NULL
    , cost_local_VAT_incl FLOAT NOT NULL
    , cost_local_VAT_excl FLOAT NOT NULL
    , is_sealed BIT NOT NULL
    , date_unsealed DATETIME NULL
	, date_expiration DATETIME NULL
    , is_consumed BIT NOT NULL
    , date_consumed DATETIME NULL
	, active BIT NOT NULL
    , guid BINARY(36) NOT NULL
);

# Product Price



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Price';

CREATE TABLE IF NOT EXISTS Shop_Product_Price (
    id_price INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_permutation INT NULL,
    CONSTRAINT FK_Shop_Product_Price_id_permutation
		FOREIGN KEY (id_permutation)
        REFERENCES Shop_Product_Permutation(id_permutation),
    id_currency INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Price_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency),
    id_region_purchase INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Price_id_region_purchase
		FOREIGN KEY (id_region_purchase)
        REFERENCES Shop_Region(id_region),
    price_local_VAT_incl FLOAT NULL,
    price_local_VAT_excl FLOAT NULL,
	id_stripe_price VARCHAR(200),
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Product_Price_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Product Price Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Price_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Price_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_price INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Price_Audit_id_price
		FOREIGN KEY (id_price)
        REFERENCES Shop_Product_Price(id_price)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Price_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Product Price Temp



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Price_Temp';

CREATE TABLE IF NOT EXISTS Shop_Product_Price_Temp (
    id_price INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_permutation INT NULL,
    id_currency INT NOT NULL,
    id_region_purchase INT NOT NULL,
    price_local_VAT_incl FLOAT NULL,
    price_local_VAT_excl FLOAT NULL,
	id_stripe_price VARCHAR(200),
    active BIT NOT NULL DEFAULT 1
);
# Product Permutation Images



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Image';

CREATE TABLE IF NOT EXISTS Shop_Product_Image (
    id_image INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_type_image INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Image_id_type_image
		FOREIGN KEY (id_type_image) 
        REFERENCES Shop_Image_Type(id_type),
    id_permutation INT NULL,
    CONSTRAINT FK_Shop_Product_Image_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    url VARCHAR(255),
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Product_Image_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Product Image Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Image_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Image_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_image INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Image_Audit_id_image
		FOREIGN KEY (id_image)
        REFERENCES Shop_Product_Image(id_image),
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Image_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Delivery Options



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Delivery_Option';

CREATE TABLE IF NOT EXISTS Shop_Delivery_Option (
	id_option INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(4000),
    latency_delivery_min INT NOT NULL,
    latency_delivery_max INT NOT NULL,
    /*
    quantity_min INT NOT NULL,
    quantity_max INT NOT NULL,
    */
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Delivery_Option_Type_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Delivery Option Audits



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



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation_Delivery_Option_Link';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation_Delivery_Option_Link (
    id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_product INT NOT NULL,
    CONSTRAINT FK_Shop_Permutation_Delivery_Option_Link_id_product
		FOREIGN KEY (id_product)
        REFERENCES Shop_Product(id_product)
        ON UPDATE RESTRICT,
    id_permutation INT,
    CONSTRAINT FK_Shop_Permutation_Delivery_Option_Link_id_permutation
		FOREIGN KEY (id_permutation)
        REFERENCES Shop_Product_Permutation(id_permutation)
        ON UPDATE RESTRICT,
    id_delivery_option INT NOT NULL,
    CONSTRAINT FK_Shop_Permutation_Delivery_Option_Link_id_delivery_option
		FOREIGN KEY (id_delivery_option)
        REFERENCES Shop_Delivery_Option(id_option)
        ON UPDATE RESTRICT,
    id_region INT NOT NULL,
    CONSTRAINT FK_Shop_Permutation_Delivery_Option_Link_id_region
		FOREIGN KEY (id_region)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    id_currency INT NOT NULL,
    CONSTRAINT FK_Shop_Permutation_Delivery_Option_Link_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
        ON UPDATE RESTRICT,
	price_local FLOAT NOT NULL,
  quantity_min FLOAT NULL,
  quantity_max FLOAT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Permutation_Delivery_Option_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Delivery Option Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation_Delivery_Option_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation_Delivery_Option_Link_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_link INT NOT NULL,
    CONSTRAINT FK_Shop_Permutation_Delivery_Option_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Product_Permutation_Delivery_Option_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(64) NOT NULL,
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Permutation_Delivery_Option_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Discounts



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
	created_by INT,
	id_change_set INT,
	CONSTRAINT FK_Shop_Discount_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Discount Audits



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
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Discount_Region_Currency_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Discount Region Currency Link Audits



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



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Permission_Group';

CREATE TABLE IF NOT EXISTS Shop_Permission_Group (
    id_group INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50),
    name VARCHAR(255),
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Permission_Group_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
# Permission Group Audits



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
    created_by INT,
    id_change_set INT,
	CONSTRAINT FK_Shop_Permission_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_User_Change_Set(id_change_set)
);
# Permission Audits



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



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Role';

CREATE TABLE IF NOT EXISTS Shop_Role (
    id_role INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50),
    name VARCHAR(255),
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Role_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_User_Change_Set(id_change_set)
);
# Role Audits



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
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Role_Permission_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);
# Role Permission link Audits



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



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User';

CREATE TABLE IF NOT EXISTS Shop_User (
    id_user INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user_auth0 VARCHAR(200) NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    email VARCHAR(254) NOT NULL,
    is_email_verified BIT NOT NULL DEFAULT 0,
    is_super_user BIT NOT NULL DEFAULT 0,
    id_currency_default INT NULL,
    id_region_default INT NULL,
    is_included_VAT_default BIT NOT NULL DEFAULT 1,
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_User_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);

# User Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Audit';

CREATE TABLE IF NOT EXISTS Shop_User_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
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



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Role_Link';

CREATE TABLE IF NOT EXISTS Shop_User_Role_Link (
    id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
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
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_User_Role_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);
# User Role Link Audits



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

# User Addresses

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Address';

CREATE TABLE Shop_User_Address (
    id_user_address INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    CONSTRAINT FK_Shop_Address_id_user
		FOREIGN KEY (id_user)
        REFERENCES Shop_User(id_user)
        ON UPDATE RESTRICT,
    -- region VARCHAR(100) NOT NULL,
    id_region INT NOT NULL,
    name_full VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    postcode VARCHAR(20) NOT NULL,
    address_line_1 VARCHAR(256) NOT NULL,
    address_line_2 VARCHAR(256) NOT NULL,
    city VARCHAR(256) NOT NULL,
    county VARCHAR(256) NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_User_Address_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);
# Address Audits

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Address_Audit';

CREATE TABLE IF NOT EXISTS Shop_User_Address_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user_address INT NOT NULL,
    CONSTRAINT FK_Shop_User_Address_Audit_id_address
		FOREIGN KEY (id_user_address)
        REFERENCES Shop_User_Address(id_user_address)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_User_Address_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);
# User Basket (Product Link)



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Basket';

CREATE TABLE IF NOT EXISTS Shop_User_Basket (
	id_item INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_user INT NOT NULL,
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
	created_by INT,
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



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Order_Status';

CREATE TABLE IF NOT EXISTS Shop_User_Order_Status (
	id_status INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50),
	name VARCHAR(255),
	name_plural VARCHAR(256),
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on DATETIME,
	created_by INT,
	id_change_set INT,
	CONSTRAINT FK_Shop_User_Order_Status_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_User_Change_Set(id_change_set)
);

# Order Type Audits



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
# Supplier



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier';

CREATE TABLE IF NOT EXISTS Shop_Supplier (
    id_supplier INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_company VARCHAR(255) NOT NULL,
    name_contact VARCHAR(255) NULL,
    department_contact VARCHAR(255) NULL,
    id_address INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_id_address
		FOREIGN KEY (id_address)
        REFERENCES Shop_Address(id_address),
	phone_number VARCHAR(50) NULL,
    fax VARCHAR(50) NULL,
    email VARCHAR(255) NOT NULL,
    website VARCHAR(255) NULL,
    id_currency INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency),
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Supplier_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);

# Supplier Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Audit';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_supplier INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Audit_id_supplier
		FOREIGN KEY (id_supplier)
        REFERENCES Shop_Supplier(id_supplier)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);

# Supplier Purchase Order



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Purchase_Order';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Purchase_Order (
	id_order INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_supplier_ordered INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_id_supplier_ordered
		FOREIGN KEY (id_supplier_ordered) 
        REFERENCES Shop_Supplier(id_supplier),
	/*
    id_supplier_fulfilled INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_id_supplier_fulfilled
		FOREIGN KEY (id_supplier_fulfilled) 
        REFERENCES Shop_Supplier(id_supplier),
	*/
    cost_total_local FLOAT NOT NULL,
    id_currency_cost INT NOT NULL,
    /*
    latency_delivery INT NOT NULL,
	quantity_ordered FLOAT NOT NULL,
	id_unit_quantity INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit),
    -- quantity_received INT NULL,
	display_order INT NOT NULL,
    */
    active BIT NOT NULL DEFAULT 1,
	created_on DATETIME,
	created_by INT,
	updated_last_on DATETIME NULL,
	created_last_by VARCHAR(100) NULL,
	id_change_set INT NULL,
	CONSTRAINT FK_Shop_Supplier_Purchase_Order_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

# Supplier Purchase Order Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Purchase_Order_Audit';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Purchase_Order_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_order INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_Audit_id_order
		FOREIGN KEY (id_order)
        REFERENCES Shop_Supplier_Purchase_Order(id_order)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

# Supplier Purchase Order Product Link



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Purchase_Order_Product_Link';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Purchase_Order_Product_Link (
	id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_order INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_Product_Link_id_order
		FOREIGN KEY (id_order) 
        REFERENCES Shop_Supplier_Purchase_Order(id_order),
    id_permutation INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_Product_Link_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    cost_total_local FLOAT NOT NULL,
    id_currency_cost INT NOT NULL,
	quantity_ordered FLOAT NOT NULL,
	id_unit_quantity INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_Product_Link_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement),
    quantity_received FLOAT NULL,
    latency_delivery_days INT NOT NULL,
	display_order INT NOT NULL,
    active BIT NOT NULL,
	created_on DATETIME,
	created_by INT,
	updated_last_on DATETIME NULL,
	created_last_by VARCHAR(100) NULL,
	id_change_set INT NULL,
	CONSTRAINT FK_Shop_Supplier_Purchase_Order_Product_Link_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

# Supplier Purchase Order Product Link Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Purchase_Order_Product_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Purchase_Order_Product_Link_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_link INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_Product_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Supplier_Purchase_Order_Product_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_Product_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

# Supplier Purchase Order Product Link Temp



-- drop table Shop_Supplier_Purchase_Order_Product_Link_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Purchase_Order_Product_Link_Temp';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Purchase_Order_Product_Link_Temp (
	id_link INT NOT NULL PRIMARY KEY,
    GUID BINARY(36) NOT NULL,
    id_order INT NOT NULL,
    /*
    CONSTRAINT FK_Supplier_Purchase_Order_Product_Link_Temp_id_order
		FOREIGN KEY (id_order) 
        REFERENCES Shop_Supplier_Purchase_Order(id_order),
	*/
    id_permutation INT NOT NULL,
    CONSTRAINT FK_Supplier_Purchase_Order_Product_Link_Temp_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    cost_total_local FLOAT NOT NULL,
    id_currency_cost INT NOT NULL,
	quantity_ordered FLOAT NOT NULL,
	id_unit_quantity INT NOT NULL,
    CONSTRAINT FK_Supplier_Purchase_Order_Product_Link_Temp_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement),
    quantity_received FLOAT NULL,
    latency_delivery_days INT NOT NULL,
	display_order INT NOT NULL,
    active BIT NOT NULL
);


# Manufacturing Purchase Order



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order (
	id_order INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cost_total_local FLOAT NOT NULL,
    id_currency_cost INT NOT NULL,
    value_produced_total_local FLOAT NOT NULL,
    /*
    latency_delivery INT NOT NULL,
	quantity_ordered FLOAT NOT NULL,
	id_unit_quantity INT NOT NULL,
    CONSTRAINT FK_Shop_Manufacturing_Purchase_Order_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit),
    quantity_received INT NULL,
	display_order INT NOT NULL,
    */
    active BIT NOT NULL DEFAULT 1,
	created_on DATETIME,
	created_by INT,
	updated_last_on DATETIME NULL,
	created_last_by VARCHAR(100) NULL,
	id_change_set INT NULL,
	CONSTRAINT FK_Shop_Manufacturing_Purchase_Order_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

# Manufacturing Purchase Order Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order_Audit';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_order INT NOT NULL,
    CONSTRAINT FK_Shop_Manufacturing_Purchase_Order_Audit_id_order
		FOREIGN KEY (id_order)
        REFERENCES Shop_Manufacturing_Purchase_Order(id_order)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Manufacturing_Purchase_Order_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

# Manufacturing Purchase Order Product Link



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order_Product_Link';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order_Product_Link (
	id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_order INT NOT NULL,
    CONSTRAINT FK_Manufacturing_Purchase_Order_Product_Link_id_order
		FOREIGN KEY (id_order) 
        REFERENCES Shop_Manufacturing_Purchase_Order(id_order),
    id_permutation INT NOT NULL,
    CONSTRAINT FK_Manufacturing_Purchase_Order_Product_Link_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    cost_total_local FLOAT NOT NULL,
    id_currency_cost INT NOT NULL,
    value_produced_total_local FLOAT NOT NULL,
	quantity_used FLOAT NOT NULL,
	id_unit_quantity INT NOT NULL,
    CONSTRAINT FK_Manufacturing_Purchase_Order_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement),
    latency_manufacture_days INT NOT NULL,
	quantity_produced FLOAT NOT NULL,
	display_order INT NOT NULL,
    active BIT NOT NULL,
	created_on DATETIME,
	created_by INT,
	updated_last_on DATETIME NULL,
	created_last_by VARCHAR(100) NULL,
	id_change_set INT NULL,
	CONSTRAINT FK_Manufacturing_Purchase_Order_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

# Manufacturing Purchase Order Product Link Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order_Product_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order_Product_Link_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_link INT NOT NULL,
    CONSTRAINT FK_Manufacturing_Purchase_Order_Product_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Manufacturing_Purchase_Order_Product_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Manufacturing_Purchase_Order_Product_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

# Manufacturing Purchase Order Product Link Temp



-- DROP TABLE Shop_Manufacturing_Purchase_Order_Product_Link_Temp;
-- SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order_Product_Link_Temp';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order_Product_Link_Temp (
	id_link INT NOT NULL PRIMARY KEY,
    GUID BINARY(36) NOT NULL,
    id_order INT NOT NULL,
    /*
    CONSTRAINT FK_Manuf_Purch_Order_Product_Link_Temp_id_order
		FOREIGN KEY (id_order) 
        REFERENCES Shop_Manufacturing_Purchase_Order(id_order),
	*/
    id_permutation INT NOT NULL,
    CONSTRAINT FK_Manuf_Purch_Order_Product_Link_Temp_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    cost_total_local FLOAT NOT NULL,
    id_currency_cost INT NOT NULL,
	quantity_used FLOAT NOT NULL,
	id_unit_quantity INT NOT NULL,
    CONSTRAINT FK_Manuf_Purch_Order_Product_Link_Temp_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement),
    quantity_produced FLOAT NULL,
    latency_manufacture_days INT NOT NULL,
	display_order INT NOT NULL,
    active BIT NOT NULL
);
# Customer



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Customer';

CREATE TABLE IF NOT EXISTS Shop_Customer (
    id_customer INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_company VARCHAR(255) NOT NULL,
    name_contact VARCHAR(255) NULL,
    department_contact VARCHAR(255) NULL,
    id_address INT NOT NULL,
    CONSTRAINT FK_Shop_Customer_id_address
		FOREIGN KEY (id_address)
        REFERENCES Shop_Address(id_address),
	phone_number VARCHAR(50) NULL,
    email VARCHAR(255) NOT NULL,
    id_currency INT NOT NULL,
    CONSTRAINT FK_Shop_Customer_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency),
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Customer_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

# Customer Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Customer_Audit';

CREATE TABLE IF NOT EXISTS Shop_Customer_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_customer INT NOT NULL,
    CONSTRAINT FK_Shop_Customer_Audit_id_customer
		FOREIGN KEY (id_customer)
        REFERENCES Shop_Customer(id_customer)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Customer_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

# Customer Sales Purchase Order



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Customer_Sales_Order';

CREATE TABLE IF NOT EXISTS Shop_Customer_Sales_Order (
	id_order INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_customer INT NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_id_customer
		FOREIGN KEY (id_customer)
        REFERENCES Shop_Customer(id_customer),
	price_total_local FLOAT NOT NULL,
    id_currency_price INT NOT NULL,
    /*
    latency_delivery INT NOT NULL,
	quantity_ordered FLOAT NOT NULL,
	id_unit_quantity INT NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit),
    quantity_received INT NULL,
	display_order INT NOT NULL,
    */
    active BIT NOT NULL DEFAULT 1,
	created_on DATETIME,
	created_by INT,
	updated_last_on DATETIME NULL,
	created_last_by VARCHAR(100) NULL,
	id_change_set INT NULL,
	CONSTRAINT FK_Shop_Customer_Sales_Order_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

# Customer Sales Order Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Customer_Sales_Order_Audit';

CREATE TABLE IF NOT EXISTS Shop_Customer_Sales_Order_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_order INT NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_Audit_id_order
		FOREIGN KEY (id_order)
        REFERENCES Shop_Customer_Sales_Order(id_order)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

# Customer Sales Order Product Link



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Customer_Sales_Order_Product_Link';

CREATE TABLE IF NOT EXISTS Shop_Customer_Sales_Order_Product_Link (
	id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_order INT NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_Product_Link_id_order
		FOREIGN KEY (id_order) 
        REFERENCES Shop_Customer_Sales_Order(id_order),
    id_permutation INT NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_Product_Link_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
	price_total_local FLOAT NOT NULL,
    id_currency_price INT NOT NULL,
	quantity_ordered FLOAT NOT NULL,
	id_unit_quantity INT NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_Product_Link_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	quantity_delivered FLOAT NOT NULL,
    latency_delivery_days INT NOT NULL,
	display_order INT NOT NULL,
    
    active BIT NOT NULL,
	created_on DATETIME,
	created_by INT,
	updated_last_on DATETIME NULL,
	created_last_by VARCHAR(100) NULL,
	id_change_set INT NULL,
	CONSTRAINT FK_Shop_Customer_Sales_Order_Product_Link_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

# Customer Sales Order Product Link Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Customer_Sales_Order_Product_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Customer_Sales_Order_Product_Link_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_link INT NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_Product_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Customer_Sales_Order_Product_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Customer_Sales_Order_Product_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);

# Customer Sales Order Product Link Temp



-- DROP TABLE Shop_Customer_Sales_Order_Product_Link_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Customer_Sales_Order_Product_Link_Temp';

CREATE TABLE IF NOT EXISTS Shop_Customer_Sales_Order_Product_Link_Temp (
	id_link INT NOT NULL PRIMARY KEY,
    GUID BINARY(36) NOT NULL,
    id_order INT NOT NULL,
    /*
    CONSTRAINT FK_Customer_Sales_Order_Product_Link_Temp_id_order
		FOREIGN KEY (id_order) 
        REFERENCES Shop_Customer_Sales_Order(id_order),
	*/
    id_permutation INT NOT NULL,
    CONSTRAINT FK_Customer_Sales_Order_Product_Link_Temp_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES Shop_Product_Permutation(id_permutation),
    price_total_local FLOAT NOT NULL,
    id_currency_price INT NOT NULL,
	quantity_ordered FLOAT NOT NULL,
	id_unit_quantity INT NOT NULL,
    CONSTRAINT FK_Customer_Sales_Order_Product_Link_Temp_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement),
    quantity_delivered FLOAT NULL,
    latency_delivery_days INT NOT NULL,
	display_order INT NOT NULL,
    active BIT NOT NULL
);

# Calc User Staging
-- USE partsltd_prod;
-- DROP TABLE IF EXISTS Shop_Calc_User_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Calc_User_Temp';

CREATE TABLE Shop_Calc_User_Temp (
	-- id_row INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	guid BINARY(36) NOT NULL,
	id_user INT NULL,
	id_permission_required INT NOT NULL,
	CONSTRAINT FK_Shop_Calc_User_Temp_id_permission_required
		FOREIGN KEY (id_permission_required)
		REFERENCES partsltd_prod.Shop_Permission (id_permission),
	priority_access_level_required INT NOT NULL,
	id_product INT NULL,
	CONSTRAINT FK_Shop_Calc_User_Temp_id_product
		FOREIGN KEY (id_product)
		REFERENCES partsltd_prod.Shop_Product (id_product),
	is_super_user BIT NULL,
	priority_access_level_user INT NULL,
	can_view BIT,
	can_edit BIT,
	can_admin BIT
);
# Shop Access Level



DROP TRIGGER IF EXISTS before_insert_Shop_Access_Level;
DROP TRIGGER IF EXISTS before_update_Shop_Access_Level;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Access_Level
BEFORE INSERT ON Shop_Access_Level
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
DELIMITER ;;

# Product Change Set



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
DELIMITER ;;

# Shop User Change Set



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
DELIMITER ;;
# Product Change Set



DROP TRIGGER IF EXISTS before_insert_Shop_Sales_And_Purchasing_Change_Set;

DELIMITER //
CREATE TRIGGER before_insert_Shop_Sales_And_Purchasing_Change_Set
BEFORE INSERT ON Shop_Sales_And_Purchasing_Change_Set
FOR EACH ROW
BEGIN
	IF NEW.updated_last_on <=> NULL THEN
		SET NEW.updated_last_on = NOW();
	END IF;
	IF NEW.updated_last_by <=> NULL THEN
		SET NEW.updated_last_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;;

# File Type



DROP TRIGGER IF EXISTS before_insert_File_Type;
DROP TRIGGER IF EXISTS before_update_File_Type;

DELIMITER //
CREATE TRIGGER before_insert_File_Type
BEFORE INSERT ON File_Type
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;

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
DELIMITER ;;

# File Type Audits



DROP TRIGGER IF EXISTS before_insert_File_Type_Audit;
DROP TRIGGER IF EXISTS before_update_File_Type_Audit;


DELIMITER //
CREATE TRIGGER before_insert_File_Type_Audit
BEFORE INSERT ON File_Type_Audit
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;

DELIMITER //
CREATE TRIGGER before_update_File_Type_Audit
BEFORE UPDATE ON File_Type_Audit
FOR EACH ROW
BEGIN
    SET NEW.updated_last_on = NOW();
    SET NEW.updated_last_by = CURRENT_USER();
END //
DELIMITER ;;
# Shop General



DROP TRIGGER IF EXISTS before_insert_Shop_General;
DROP TRIGGER IF EXISTS before_update_Shop_General;

DELIMITER //
CREATE TRIGGER before_insert_Shop_General
BEFORE INSERT ON Shop_General
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;

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
DELIMITER ;;
# Shop Image Type



DROP TRIGGER IF EXISTS before_insert_Shop_Image_Type;
DROP TRIGGER IF EXISTS before_update_Shop_Image_Type;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Image_Type
BEFORE INSERT ON Shop_Image_Type
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
	/*
    # Changed id_type_file
	SELECT NEW.id_type, 'id_type_file', OLD.id_type_file, NEW.id_type_file, NEW.id_change_set
		WHERE NOT OLD.id_type_file <=> NEW.id_type_file
    UNION
	*/
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
DELIMITER ;;
# Shop Delivery Region



DROP TRIGGER IF EXISTS before_insert_Shop_Region;
DROP TRIGGER IF EXISTS before_update_Shop_Region;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Region
BEFORE INSERT ON Shop_Region
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
DELIMITER ;;

# Shop Region Branch



DROP TRIGGER IF EXISTS before_insert_Shop_Region_Branch;
DROP TRIGGER IF EXISTS before_update_Shop_Region_Branch;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Region_Branch
BEFORE INSERT ON Shop_Region_Branch
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
DELIMITER ;;

# Shop Address



DROP TRIGGER IF EXISTS before_insert_Shop_Address;
DROP TRIGGER IF EXISTS before_update_Shop_Address;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Address
BEFORE INSERT ON Shop_Address
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
DELIMITER ;;
# Shop Storage Location



DROP TRIGGER IF EXISTS before_insert_Shop_Storage_Location;
DROP TRIGGER IF EXISTS before_update_Shop_Storage_Location;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Storage_Location
BEFORE INSERT ON Shop_Storage_Location
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Storage_Location
BEFORE UPDATE ON Shop_Storage_Location
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Storage_Location_Audit (
		id_location,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed id_plant
	SELECT NEW.id_location, 'id_plant', OLD.id_plant, NEW.id_plant, NEW.id_change_set
		WHERE NOT OLD.id_plant <=> NEW.id_plant
    UNION
    # Changed code
	SELECT NEW.id_location, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_location, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed active
	SELECT NEW.id_location, 'active', CONVERT(OLD.active, CHAR), CONVERT(NEW.active, CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;;

# Shop Currency



DROP TRIGGER IF EXISTS before_insert_Shop_Currency;
DROP TRIGGER IF EXISTS before_update_Shop_Currency;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Currency
BEFORE INSERT ON Shop_Currency
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
DELIMITER ;;
# Shop Tax_Or_Surcharge



DROP TRIGGER IF EXISTS before_insert_Shop_Tax_Or_Surcharge;
DROP TRIGGER IF EXISTS before_update_Shop_Tax_Or_Surcharge;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Tax_Or_Surcharge
BEFORE INSERT ON Shop_Tax_Or_Surcharge
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
  SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;

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
DELIMITER ;;


# Shop Category



DROP TRIGGER IF EXISTS before_insert_Shop_Product_Category;
DROP TRIGGER IF EXISTS before_update_Shop_Product_Category;

DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Category
BEFORE INSERT ON Shop_Product_Category
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;

DELIMITER //
CREATE TRIGGER before_update_Shop_Product_Category
BEFORE UPDATE ON Shop_Product_Category
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Product_Category_Audit (
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
	UNION
    # Changed id_access_level_required
	SELECT NEW.id_category, 'id_access_level_required', CONVERT(OLD.id_access_level_required, CHAR), CONVERT(NEW.id_access_level_required, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_access_level_required <=> NEW.id_access_level_required
    ;
END //
DELIMITER ;;

# Shop Product




DROP TRIGGER IF EXISTS before_insert_Shop_Product;
DROP TRIGGER IF EXISTS before_update_Shop_Product;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Product
BEFORE INSERT ON Shop_Product
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
		IF ISNULL(NEW.id_unit_measurement_interval_recurrence) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Product must have recurrence interval or variations (with recurrence intervals).';
		END IF;
		IF ISNULL(NEW.count_interval_recurrence) THEN
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
    /*
    # Changed discount
	SELECT NEW.id_product, 'discount', CONVERT(OLD.discount, CHAR), CONVERT(NEW.discount, CHAR), NEW.id_change_set
		WHERE NOT OLD.discount <=> NEW.discount
    */
	UNION
    # Changed id_category
	SELECT NEW.id_product, 'id_category', CONVERT(OLD.id_category, CHAR), CONVERT(NEW.id_category, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_category <=> NEW.id_category
	UNION
    # Changed has_variations
	SELECT NEW.id_product, 'has_variations', CONVERT(CONVERT(NEW.has_variations, SIGNED), CHAR), CONVERT(CONVERT(NEW.has_variations, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.has_variations <=> NEW.has_variations
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
    # Changed id_unit_measurement_interval_recurrence
	SELECT NEW.id_product, 'id_unit_measurement_interval_recurrence', CONVERT(OLD.id_unit_measurement_interval_recurrence, CHAR), CONVERT(NEW.id_unit_measurement_interval_recurrence, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_unit_measurement_interval_recurrence <=> NEW.id_unit_measurement_interval_recurrence
    UNION
    # Changed count_interval_recurrence
	SELECT NEW.id_product, 'count_interval_recurrence', CONVERT(OLD.count_interval_recurrence, CHAR), CONVERT(NEW.count_interval_recurrence, CHAR), NEW.id_change_set
		WHERE NOT OLD.count_interval_recurrence <=> NEW.count_interval_recurrence
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
    # Changed id_access_level_required
	SELECT NEW.id_product, 'id_access_level_required', CONVERT(OLD.id_access_level_required, CHAR), CONVERT(NEW.id_access_level_required, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_access_level_required <=> NEW.id_access_level_required
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
DELIMITER ;;

# Shop Product Permutation



DROP TRIGGER IF EXISTS before_insert_Shop_Product_Permutation;
DROP TRIGGER IF EXISTS before_update_Shop_Product_Permutation;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Permutation
BEFORE INSERT ON Shop_Product_Permutation
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Product_Permutation
BEFORE UPDATE ON Shop_Product_Permutation
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;

	IF (NOT (
		NEW.id_unit_measurement_interval_recurrence IS NULL
		OR NEW.id_unit_measurement_interval_recurrence NOT IN (SELECT id_unit_measurement FROM Shop_Unit_Measurement WHERE is_unit_of_time = 1)
	)) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Recurrence interval ID must be a unit of time.';
    END IF;

	IF (NOT (
		NEW.id_unit_measurement_interval_expiration_unsealed IS NULL
		OR NEW.id_unit_measurement_interval_expiration_unsealed NOT IN (SELECT id_unit_measurement FROM Shop_Unit_Measurement WHERE is_unit_of_time = 1)
	)) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Unsealed expiration interval ID must be a unit of time.';
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
	# Changed cost_local
	SELECT NEW.id_permutation, 'cost_local', CONVERT(OLD.cost_local, CHAR), CONVERT(NEW.cost_local, CHAR), NEW.id_change_set
		WHERE NOT (OLD.cost_local <=> NEW.cost_local)
	UNION
	# Changed id_currency_cost
	SELECT NEW.id_permutation, 'id_currency_cost', CONVERT(OLD.id_currency_cost, CHAR), CONVERT(NEW.id_currency_cost, CHAR), NEW.id_change_set
		WHERE NOT (OLD.id_currency_cost <=> NEW.id_currency_cost)
	UNION
    /*
	# Changed profit_local_min
	SELECT NEW.id_permutation, 'profit_local_min', CONVERT(OLD.profit_local_min, CHAR), CONVERT(NEW.profit_local_min, CHAR), NEW.id_change_set
		WHERE NOT (OLD.profit_local_min <=> NEW.profit_local_min)
	UNION
	# Changed id_currency_profit_min
	SELECT NEW.id_permutation, 'id_currency_profit_min', CONVERT(OLD.id_currency_profit_min, CHAR), CONVERT(NEW.id_currency_profit_min, CHAR), NEW.id_change_set
		WHERE NOT (OLD.id_currency_profit_min <=> NEW.id_currency_profit_min)
	UNION
    */ 
    /*
	# Changed price_GBP_min
	SELECT NEW.id_permutation, 'price_GBP_min', CONVERT(OLD.price_GBP_min, CHAR), CONVERT(NEW.price_GBP_min, CHAR), NEW.id_change_set
		WHERE NOT (OLD.price_GBP_min <=> NEW.price_GBP_min)
	UNION
    */
    # Changed latency_manufacture_days
	SELECT NEW.id_permutation, 'latency_manufacture_days', CONVERT(OLD.latency_manufacture_days, CHAR), CONVERT(NEW.latency_manufacture_days, CHAR), NEW.id_change_set
		WHERE NOT OLD.latency_manufacture_days <=> NEW.latency_manufacture_days
	UNION
    # Changed id_unit_measurement_quantity
	SELECT NEW.id_permutation, 'id_unit_measurement_quantity', CONVERT(OLD.id_unit_measurement_quantity, CHAR), CONVERT(NEW.id_unit_measurement_quantity, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_unit_measurement_quantity <=> NEW.id_unit_measurement_quantity
	UNION
    # Changed count_unit_measurement_per_quantity_step
	SELECT NEW.id_permutation, 'count_unit_measurement_per_quantity_step', CONVERT(OLD.count_unit_measurement_per_quantity_step, CHAR), CONVERT(NEW.count_unit_measurement_per_quantity_step, CHAR), NEW.id_change_set
		WHERE NOT OLD.count_unit_measurement_per_quantity_step <=> NEW.count_unit_measurement_per_quantity_step
	UNION
    # Changed quantity_min
	SELECT NEW.id_permutation, 'quantity_min', CONVERT(OLD.quantity_min, CHAR), CONVERT(NEW.quantity_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
	UNION
    # Changed quantity_max
	SELECT NEW.id_permutation, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
	UNION
    # Changed quantity_stock
	SELECT NEW.id_permutation, 'quantity_stock', CONVERT(OLD.quantity_stock, CHAR), CONVERT(NEW.quantity_stock, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_stock <=> NEW.quantity_stock
    UNION
    # Changed is_subscription
	SELECT NEW.id_permutation, 'is_subscription', CONVERT(CONVERT(OLD.is_subscription, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_subscription, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.is_subscription <=> NEW.is_subscription
	UNION
    # Changed id_unit_measurement_interval_recurrence
	SELECT NEW.id_permutation, 'id_unit_measurement_interval_recurrence', CONVERT(OLD.id_unit_measurement_interval_recurrence, CHAR), CONVERT(NEW.id_unit_measurement_interval_recurrence, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_unit_measurement_interval_recurrence <=> NEW.id_unit_measurement_interval_recurrence
    UNION
    # Changed count_interval_recurrence
	SELECT NEW.id_permutation, 'count_interval_recurrence', CONVERT(OLD.count_interval_recurrence, CHAR), CONVERT(NEW.count_interval_recurrence, CHAR), NEW.id_change_set
		WHERE NOT OLD.count_interval_recurrence <=> NEW.count_interval_recurrence
	UNION
    # Changed id_stripe_product
	SELECT NEW.id_permutation, 'id_stripe_product', OLD.id_stripe_product, NEW.id_stripe_product, NEW.id_change_set
		WHERE NOT (OLD.id_stripe_product <=> NEW.id_stripe_product)
	UNION
    # Changed does_expire_faster_once_unsealed
	SELECT NEW.id_permutation, 'does_expire_faster_once_unsealed', CONVERT(OLD.does_expire_faster_once_unsealed, CHAR), CONVERT(NEW.does_expire_faster_once_unsealed, CHAR), NEW.id_change_set
		WHERE NOT OLD.does_expire_faster_once_unsealed <=> NEW.does_expire_faster_once_unsealed
    UNION
    # Changed id_unit_measurement_interval_expiration_unsealed
	SELECT NEW.id_permutation, 'id_unit_measurement_interval_expiration_unsealed', CONVERT(OLD.id_unit_measurement_interval_expiration_unsealed, CHAR), CONVERT(NEW.id_unit_measurement_interval_expiration_unsealed, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_unit_measurement_interval_expiration_unsealed <=> NEW.id_unit_measurement_interval_expiration_unsealed
    UNION
    # Changed count_interval_expiration_unsealed
	SELECT NEW.id_permutation, 'count_interval_expiration_unsealed', CONVERT(OLD.count_interval_expiration_unsealed, CHAR), CONVERT(NEW.count_interval_expiration_unsealed, CHAR), NEW.id_change_set
		WHERE NOT OLD.count_interval_expiration_unsealed <=> NEW.count_interval_expiration_unsealed
	UNION
    # Changed active
	SELECT NEW.id_permutation, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	/*
    UNION
	# Changed display_order
	SELECT NEW.id_permutation, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    */
    ;
END //
DELIMITER ;;

# Shop Variation Type




DROP TRIGGER IF EXISTS before_insert_Shop_Variation_Type;
DROP TRIGGER IF EXISTS before_update_Shop_Variation_Type;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Variation_Type
BEFORE INSERT ON Shop_Variation_Type
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
DELIMITER ;;

# Shop Variation



DROP TRIGGER IF EXISTS before_insert_Shop_Variation;
DROP TRIGGER IF EXISTS before_update_Shop_Variation;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Variation
BEFORE INSERT ON Shop_Variation
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
DELIMITER ;;

# Shop Product Permutation Variation Link



DROP TRIGGER IF EXISTS before_insert_Shop_Product_Permutation_Variation_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Product_Permutation_Variation_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Permutation_Variation_Link
BEFORE INSERT ON Shop_Product_Permutation_Variation_Link
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
DELIMITER ;;
# Shop Product Permutation



DROP TRIGGER IF EXISTS before_insert_Shop_Stock_Item;
DROP TRIGGER IF EXISTS before_update_Shop_Stock_Item;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Stock_Item
BEFORE INSERT ON Shop_Stock_Item
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Stock_Item
BEFORE UPDATE ON Shop_Stock_Item
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Stock_Item_Audit (
		id_stock,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed id_permutation
	SELECT NEW.id_stock, 'id_permutation', OLD.id_permutation, NEW.id_permutation, NEW.id_change_set
		WHERE NOT (OLD.id_permutation <=> NEW.id_permutation)
	UNION
	# Changed date_purchased
	SELECT NEW.id_stock, 'date_purchased', OLD.date_purchased, NEW.date_purchased, NEW.id_change_set
		WHERE NOT (OLD.date_purchased <=> NEW.date_purchased)
	UNION
	# Changed date_received
	SELECT NEW.id_stock, 'date_received', OLD.date_received, NEW.date_received, NEW.id_change_set
		WHERE NOT (OLD.date_received <=> NEW.date_received)
	UNION
	# Changed id_location_storage
	SELECT NEW.id_stock, 'id_location_storage', OLD.id_location_storage, NEW.id_location_storage, NEW.id_change_set
		WHERE NOT (OLD.id_location_storage <=> NEW.id_location_storage)
	UNION
	# Changed id_currency_cost
	SELECT NEW.id_stock, 'id_currency_cost', OLD.id_currency_cost, NEW.id_currency_cost, NEW.id_change_set
		WHERE NOT (OLD.id_currency_cost <=> NEW.id_currency_cost)
	UNION
	# Changed cost_local_VAT_incl
	SELECT NEW.id_stock, 'cost_local_VAT_incl', OLD.cost_local_VAT_incl, NEW.cost_local_VAT_incl, NEW.id_change_set
		WHERE NOT (OLD.cost_local_VAT_incl <=> NEW.cost_local_VAT_incl)
	UNION
	# Changed cost_local_VAT_excl
	SELECT NEW.id_stock, 'cost_local_VAT_excl', OLD.cost_local_VAT_excl, NEW.cost_local_VAT_excl, NEW.id_change_set
		WHERE NOT (OLD.cost_local_VAT_excl <=> NEW.cost_local_VAT_excl)
	UNION
	# Changed is_sealed
	SELECT NEW.id_stock, 'is_sealed', OLD.is_sealed, NEW.is_sealed, NEW.id_change_set
		WHERE NOT (OLD.is_sealed <=> NEW.is_sealed)
	UNION
	# Changed date_unsealed
	SELECT NEW.id_stock, 'date_unsealed', OLD.date_unsealed, NEW.date_unsealed, NEW.id_change_set
		WHERE NOT (OLD.date_unsealed <=> NEW.date_unsealed)
	UNION
	# Changed date_expiration
	SELECT NEW.id_stock, 'date_expiration', OLD.date_expiration, NEW.date_expiration, NEW.id_change_set
		WHERE NOT (OLD.date_expiration <=> NEW.date_expiration)
	UNION
	# Changed is_consumed
	SELECT NEW.id_stock, 'is_consumed', OLD.is_consumed, NEW.is_consumed, NEW.id_change_set
		WHERE NOT (OLD.is_consumed <=> NEW.is_consumed)
	UNION
	# Changed date_consumed
	SELECT NEW.id_stock, 'date_consumed', OLD.date_consumed, NEW.date_consumed, NEW.id_change_set
		WHERE NOT (OLD.date_consumed <=> NEW.date_consumed)
	UNION
    # Changed active
	SELECT NEW.id_stock, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;;

# Shop Product Currency Link



DROP TRIGGER IF EXISTS before_insert_Shop_Product_Price;
DROP TRIGGER IF EXISTS before_update_Shop_Product_Price;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Price
BEFORE INSERT ON Shop_Product_Price
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
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
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Product_Price
BEFORE UPDATE ON Shop_Product_Price
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
    
    INSERT INTO Shop_Product_Price_Audit (
		id_price,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed id_permutation
	SELECT NEW.id_price, 'id_permutation', CONVERT(OLD.id_permutation, CHAR), CONVERT(NEW.id_permutation, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_permutation <=> NEW.id_permutation
	UNION
	# Changed id_currency
	SELECT NEW.id_price, 'id_currency', CONVERT(OLD.id_currency, CHAR), CONVERT(NEW.id_currency, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_currency <=> NEW.id_currency
    UNION
	# Changed id_region_purchase
	SELECT NEW.id_price, 'id_region_purchase', CONVERT(OLD.id_region_purchase, CHAR), CONVERT(NEW.id_region_purchase, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_region_purchase <=> NEW.id_region_purchase
    UNION
	# Changed price_local_VAT_incl
	SELECT NEW.id_price, 'price_local_VAT_incl', OLD.price_local_VAT_incl, NEW.price_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.price_local_VAT_incl <=> NEW.price_local_VAT_incl
    UNION
	# Changed price_local_VAT_excl
	SELECT NEW.id_price, 'price_local_VAT_excl', OLD.price_local_VAT_excl, NEW.price_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.price_local_VAT_excl <=> NEW.price_local_VAT_excl
    UNION
	# Changed id_stripe_price
	SELECT NEW.id_price, 'id_stripe_price', OLD.id_stripe_price, NEW.id_stripe_price, NEW.id_change_set
		WHERE NOT OLD.id_stripe_price <=> NEW.id_stripe_price
    UNION
	# Changed active
	SELECT NEW.id_price, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;;

# Shop Image



DROP TRIGGER IF EXISTS before_insert_Shop_Product_Image;
DROP TRIGGER IF EXISTS before_update_Shop_Product_Image;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Image
BEFORE INSERT ON Shop_Product_Image
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Product_Image
BEFORE UPDATE ON Shop_Product_Image
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change set ID must be provided.';
    END IF;
    IF ISNULL(NEW.id_permutation) THEN -- ISNULL(NEW.id_product) AND 
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Image must NOT have ID for product AND product permutation.';
    END IF;
    
    INSERT INTO Shop_Product_Image_Audit (
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
	/*
    # Changed id_type_file
	SELECT NEW.id_image, 'id_type_file', CONVERT(OLD.id_type_file, CHAR), CONVERT(NEW.id_type_file, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_type_file <=> NEW.id_type_file
    UNION
    # Changed id_product
	SELECT NEW.id_image, 'id_product', CONVERT(OLD.id_product, CHAR), CONVERT(NEW.id_product, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
    UNION
	*/
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
DELIMITER ;;
# Shop Delivery Option Type



DROP TRIGGER IF EXISTS before_insert_Shop_Delivery_Option;
DROP TRIGGER IF EXISTS before_update_Shop_Delivery_Option;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Delivery_Option
BEFORE INSERT ON Shop_Delivery_Option
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
    /*
    UNION
    # Changed quantity_min
	SELECT NEW.id_option, 'quantity_min', CONVERT(OLD.quantity_min, CHAR), CONVERT(NEW.quantity_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
    UNION
    # Changed quantity_max
	SELECT NEW.id_option, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
    */
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
DELIMITER ;;
# Shop Product Delivery Option Link



DROP TRIGGER IF EXISTS before_insert_Shop_Product_Permutation_Delivery_Option_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Product_Permutation_Delivery_Option_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Permutation_Delivery_Option_Link
BEFORE INSERT ON Shop_Product_Permutation_Delivery_Option_Link
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Product_Permutation_Delivery_Option_Link
BEFORE UPDATE ON Shop_Product_Permutation_Delivery_Option_Link
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Product_Permutation_Delivery_Option_Link_Audit (
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
	/*
	UNION
    # Changed quantity_min
	SELECT NEW.id_link, 'quantity_min', CONVERT(OLD.quantity_min, CHAR), CONVERT(NEW.quantity_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
	UNION
    # Changed quantity_max
	SELECT NEW.id_link, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
	*/
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
DELIMITER ;;
# Shop Discount



DROP TRIGGER IF EXISTS before_insert_Shop_Discount;
DROP TRIGGER IF EXISTS before_update_Shop_Discount;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Discount
BEFORE INSERT ON Shop_Discount
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;

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
DELIMITER ;;


# Shop Discount Region Currency Link



DROP TRIGGER IF EXISTS before_insert_Shop_Discount_Region_Currency_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Discount_Region_Currency_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Discount_Region_Currency_Link
BEFORE INSERT ON Shop_Discount_Region_Currency_Link
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
DELIMITER ;;
# Shop Permission Group



DROP TRIGGER IF EXISTS before_insert_Shop_Permission_Group;
DROP TRIGGER IF EXISTS before_update_Shop_Permission_Group;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Permission_Group
BEFORE INSERT ON Shop_Permission_Group
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
DELIMITER ;;
# Shop Permission



DROP TRIGGER IF EXISTS before_insert_Shop_Permission;
DROP TRIGGER IF EXISTS before_update_Shop_Permission;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Permission
BEFORE INSERT ON Shop_Permission
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
DELIMITER ;;
# Shop Role



DROP TRIGGER IF EXISTS before_insert_Shop_Role;
DROP TRIGGER IF EXISTS before_update_Shop_Role;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Role
BEFORE INSERT ON Shop_Role
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
DELIMITER ;;

# Shop Role Permission Link



DROP TRIGGER IF EXISTS before_insert_Shop_Role_Permission_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Role_Permission_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Role_Permission_Link
BEFORE INSERT ON Shop_Role_Permission_Link
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
DELIMITER ;;

# Shop User



DROP TRIGGER IF EXISTS before_insert_Shop_User;
DROP TRIGGER IF EXISTS before_update_Shop_User;


DELIMITER //
CREATE TRIGGER before_insert_Shop_User
BEFORE INSERT ON Shop_User
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
    # Changed id_user_auth0
	SELECT NEW.id_user, 'id_user_auth0', OLD.id_user_auth0, NEW.id_user_auth0, NEW.id_change_set
		WHERE NOT (OLD.id_user_auth0 <=> NEW.id_user_auth0)
	UNION
    # Changed firstname
	SELECT NEW.id_user, 'firstname', OLD.firstname, NEW.firstname, NEW.id_change_set
		WHERE NOT (OLD.firstname <=> NEW.firstname)
	UNION
    # Changed surname
	SELECT NEW.id_user, 'surname', OLD.surname, NEW.surname, NEW.id_change_set
		WHERE NOT (OLD.surname <=> NEW.surname)
	UNION 
	# Changed email
	SELECT NEW.id_user, 'email', OLD.email, NEW.email, NEW.id_change_set
		WHERE NOT (OLD.email <=> NEW.email)
	UNION
	# Changed is_email_verified
	SELECT NEW.id_user, 'is_email_verified', CONVERT(CONVERT(OLD.is_email_verified, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_email_verified, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.is_email_verified <=> NEW.is_email_verified)
	UNION
	# Changed is_super_user
	SELECT NEW.id_user, 'is_super_user', CONVERT(CONVERT(OLD.is_super_user, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_super_user, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.is_super_user <=> NEW.is_super_user)
	UNION
    # Changed active
	SELECT NEW.id_user, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
    # Changed id_currency_default
	SELECT NEW.id_user, 'id_currency_default', CONVERT(OLD.id_currency_default, CHAR), CONVERT(NEW.id_currency_default, CHAR), NEW.id_change_set
		WHERE NOT (OLD.id_currency_default <=> NEW.id_currency_default)
	UNION
    # Changed id_region_default
	SELECT NEW.id_user, 'id_region_default', CONVERT(OLD.id_region_default, CHAR), CONVERT(NEW.id_region_default, CHAR), NEW.id_change_set
		WHERE NOT (OLD.id_region_default <=> NEW.id_region_default)
	UNION
    # Changed is_included_VAT_default
	SELECT NEW.id_user, 'is_included_VAT_default', CONVERT(CONVERT(OLD.is_included_VAT_default, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_included_VAT_default, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.is_included_VAT_default <=> NEW.is_included_VAT_default)
    ;
END //
DELIMITER ;;
# Shop User Role Link



DROP TRIGGER IF EXISTS before_insert_Shop_User_Role_Link;
DROP TRIGGER IF EXISTS before_update_Shop_User_Role_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_User_Role_Link
BEFORE INSERT ON Shop_User_Role_Link
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
DELIMITER ;;
# Shop Address



DROP TRIGGER IF EXISTS before_insert_Shop_User_Address;
DROP TRIGGER IF EXISTS before_update_Shop_User_Address;


DELIMITER //
CREATE TRIGGER before_insert_Shop_User_Address
BEFORE INSERT ON Shop_User_Address
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_User_Address
BEFORE UPDATE ON Shop_User_Address
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_User_Address_Audit (
		id_user_address,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed region
	SELECT NEW.id_user_address, 'id_region', OLD.id_region, NEW.id_region, NEW.id_change_set
		WHERE NOT OLD.id_region <=> NEW.id_region
    UNION
    # Changed name_full
	SELECT NEW.id_user_address, 'name_full', OLD.name_full, NEW.name_full, NEW.id_change_set
		WHERE NOT OLD.name_full <=> NEW.name_full
	UNION
    # Changed phone_number
	SELECT NEW.id_user_address, 'phone_number', OLD.phone_number, NEW.phone_number, NEW.id_change_set
		WHERE NOT OLD.phone_number <=> NEW.phone_number
    UNION
    # Changed postcode
	SELECT NEW.id_user_address, 'postcode', OLD.postcode, NEW.postcode, NEW.id_change_set
		WHERE NOT OLD.postcode <=> NEW.postcode
    UNION
    # Changed address_line_1
	SELECT NEW.id_user_address, 'address_line_1', OLD.address_line_1, NEW.address_line_1, NEW.id_change_set
		WHERE NOT OLD.address_line_1 <=> NEW.address_line_1
	UNION
    # Changed address_line_2
	SELECT NEW.id_user_address, 'address_line_2', OLD.address_line_2, NEW.address_line_2, NEW.id_change_set
		WHERE NOT OLD.address_line_2 <=> NEW.address_line_2
	UNION
    # Changed city
	SELECT NEW.id_user_address, 'city', OLD.city, NEW.city, NEW.id_change_set
		WHERE NOT OLD.city <=> NEW.city
    UNION
    # Changed county
	SELECT NEW.id_user_address, 'county', OLD.county, NEW.county, NEW.id_change_set
		WHERE NOT OLD.county <=> NEW.county
	UNION
	# Changed active
	SELECT NEW.id_user_address, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;;
# Shop Product Variation Link



DROP TRIGGER IF EXISTS before_insert_Shop_User_Basket;
DROP TRIGGER IF EXISTS before_update_Shop_User_Basket;


DELIMITER //
CREATE TRIGGER before_insert_Shop_User_Basket
BEFORE INSERT ON Shop_User_Basket
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
DELIMITER ;;
# Shop User Order Type



DROP TRIGGER IF EXISTS before_insert_Shop_User_Order_Status;
DROP TRIGGER IF EXISTS before_update_Shop_User_Order_Status;


DELIMITER //
CREATE TRIGGER before_insert_Shop_User_Order_Status
BEFORE INSERT ON Shop_User_Order_Status
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


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
DELIMITER ;;
# Shop Supplier



DROP TRIGGER IF EXISTS before_insert_Shop_Supplier;
DROP TRIGGER IF EXISTS before_update_Shop_Supplier;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Supplier
BEFORE INSERT ON Shop_Supplier
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Supplier
BEFORE UPDATE ON Shop_Supplier
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Supplier_Audit (
		id_supplier,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed name_company
	SELECT NEW.id_supplier, 'name_company', OLD.name_company, NEW.name_company, NEW.id_change_set
		WHERE NOT OLD.name_company <=> NEW.name_company
    UNION
	# Changed name_contact
	SELECT NEW.id_supplier, 'name_contact', OLD.name_contact, NEW.name_contact, NEW.id_change_set
		WHERE NOT OLD.name_contact <=> NEW.name_contact
    UNION
	# Changed department_contact
	SELECT NEW.id_supplier, 'department_contact', OLD.department_contact, NEW.department_contact, NEW.id_change_set
		WHERE NOT OLD.department_contact <=> NEW.department_contact
    UNION
	# Changed id_address
	SELECT NEW.id_supplier, 'id_address', OLD.id_address, NEW.id_address, NEW.id_change_set
		WHERE NOT OLD.id_address <=> NEW.id_address
    UNION
	# Changed phone_number
	SELECT NEW.id_supplier, 'phone_number', OLD.phone_number, NEW.phone_number, NEW.id_change_set
		WHERE NOT OLD.phone_number <=> NEW.phone_number
    UNION
	# Changed fax
	SELECT NEW.id_supplier, 'fax', OLD.fax, NEW.fax, NEW.id_change_set
		WHERE NOT OLD.fax <=> NEW.fax
    UNION
	# Changed email
	SELECT NEW.id_supplier, 'email', OLD.email, NEW.email, NEW.id_change_set
		WHERE NOT OLD.email <=> NEW.email
    UNION
	# Changed website
	SELECT NEW.id_supplier, 'website', OLD.website, NEW.website, NEW.id_change_set
		WHERE NOT OLD.website <=> NEW.website
    UNION
	# Changed id_currency
	SELECT NEW.id_supplier, 'id_currency', OLD.id_currency, NEW.id_currency, NEW.id_change_set
		WHERE NOT OLD.id_currency <=> NEW.id_currency
    ;
END //
DELIMITER ;;

# Shop Unit of Measurement



DROP TRIGGER IF EXISTS before_insert_Shop_Unit_Measurement;
DROP TRIGGER IF EXISTS before_update_Shop_Unit_Measurement;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Unit_Measurement
BEFORE INSERT ON Shop_Unit_Measurement
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Unit_Measurement
BEFORE UPDATE ON Shop_Unit_Measurement
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Unit_Measurement_Audit (
		id_unit_measurement,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed name_singular
	SELECT NEW.id_unit_measurement, 'name_singular', OLD.name_singular, NEW.name_singular, NEW.id_change_set
		WHERE NOT OLD.name_singular <=> NEW.name_singular
    UNION
	# Changed name_plural
	SELECT NEW.id_unit_measurement, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
    UNION
	# Changed symbol
	SELECT NEW.id_unit_measurement, 'symbol', OLD.symbol, NEW.symbol, NEW.id_change_set
		WHERE NOT OLD.symbol <=> NEW.symbol
    UNION
	# Changed is_base_unit
	SELECT NEW.id_unit_measurement, 'is_base_unit', OLD.is_base_unit, NEW.is_base_unit, NEW.id_change_set
		WHERE NOT OLD.is_base_unit <=> NEW.is_base_unit
    UNION
	# Changed is_unit_of_distance
	SELECT NEW.id_unit_measurement, 'is_unit_of_distance', OLD.is_unit_of_distance, NEW.is_unit_of_distance, NEW.id_change_set
		WHERE NOT OLD.is_unit_of_distance <=> NEW.is_unit_of_distance
    UNION
	# Changed is_unit_of_mass
	SELECT NEW.id_unit_measurement, 'is_unit_of_mass', OLD.is_unit_of_mass, NEW.is_unit_of_mass, NEW.id_change_set
		WHERE NOT OLD.is_unit_of_mass <=> NEW.is_unit_of_mass
    UNION
	# Changed is_unit_of_time
	SELECT NEW.id_unit_measurement, 'is_unit_of_time', OLD.is_unit_of_time, NEW.is_unit_of_time, NEW.id_change_set
		WHERE NOT OLD.is_unit_of_time <=> NEW.is_unit_of_time
    UNION
	# Changed is_unit_of_volume
	SELECT NEW.id_unit_measurement, 'is_unit_of_volume', OLD.is_unit_of_volume, NEW.is_unit_of_volume, NEW.id_change_set
		WHERE NOT OLD.is_unit_of_volume <=> NEW.is_unit_of_volume
    UNION
	# Changed active
	SELECT NEW.id_unit_measurement, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;;


# Shop Unit of Measurement Conversion



DROP TRIGGER IF EXISTS before_insert_Shop_Unit_Measurement_Conversion;
DROP TRIGGER IF EXISTS before_update_Shop_Unit_Measurement_Conversion;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Unit_Measurement_Conversion
BEFORE INSERT ON Shop_Unit_Measurement_Conversion
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Unit_Measurement_Conversion
BEFORE UPDATE ON Shop_Unit_Measurement_Conversion
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Unit_Measurement_Conversion_Audit (
		id_conversion,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed id_unit_derived
	SELECT NEW.id_conversion, 'id_unit_derived', OLD.id_unit_derived, NEW.id_unit_derived, NEW.id_change_set
		WHERE NOT OLD.id_unit_derived <=> NEW.id_unit_derived
    UNION
	# Changed id_unit_base
	SELECT NEW.id_conversion, 'id_unit_base', OLD.id_unit_base, NEW.id_unit_base, NEW.id_change_set
		WHERE NOT OLD.id_unit_base <=> NEW.id_unit_base
    UNION
	# Changed power_unit_base
	SELECT NEW.id_conversion, 'power_unit_base', OLD.power_unit_base, NEW.power_unit_base, NEW.id_change_set
		WHERE NOT OLD.power_unit_base <=> NEW.power_unit_base
    UNION
	# Changed multiplier_unit_base
	SELECT NEW.id_conversion, 'multiplier_unit_base', OLD.multiplier_unit_base, NEW.multiplier_unit_base, NEW.id_change_set
		WHERE NOT OLD.multiplier_unit_base <=> NEW.multiplier_unit_base
    UNION
	# Changed increment_unit_base
	SELECT NEW.id_conversion, 'active', OLD.increment_unit_base, NEW.increment_unit_base, NEW.id_change_set
		WHERE NOT OLD.increment_unit_base <=> NEW.increment_unit_base
    UNION
	# Changed active
	SELECT NEW.id_conversion, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;;


# Shop Supplier Purchase Order



DROP TRIGGER IF EXISTS before_insert_Shop_Supplier_Purchase_Order;
DROP TRIGGER IF EXISTS before_update_Shop_Supplier_Purchase_Order;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Supplier_Purchase_Order
BEFORE INSERT ON Shop_Supplier_Purchase_Order
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Supplier_Purchase_Order
BEFORE UPDATE ON Shop_Supplier_Purchase_Order
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Supplier_Purchase_Order_Audit (
		id_order,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed id_supplier_ordered
	SELECT NEW.id_order, 'id_supplier_ordered', OLD.id_supplier_ordered, NEW.id_supplier_ordered, NEW.id_change_set
		WHERE NOT OLD.id_supplier_ordered <=> NEW.id_supplier_ordered
    UNION
	# Changed cost_total_local
	SELECT NEW.id_order, 'cost_total_local', OLD.cost_total_local, NEW.cost_total_local, NEW.id_change_set
		WHERE NOT OLD.cost_total_local <=> NEW.cost_total_local
    UNION
	# Changed id_currency_cost
	SELECT NEW.id_order, 'id_currency_cost', OLD.id_currency_cost, NEW.id_currency_cost, NEW.id_change_set
		WHERE NOT OLD.id_currency_cost <=> NEW.id_currency_cost
	/*
    UNION
	# Changed latency_delivery
	SELECT NEW.id_order, 'latency_delivery', OLD.latency_delivery, NEW.latency_delivery, NEW.id_change_set
		WHERE NOT OLD.latency_delivery <=> NEW.latency_delivery
    UNION
	# Changed quantity_ordered
	SELECT NEW.id_order, 'quantity_ordered', OLD.quantity_ordered, NEW.quantity_ordered, NEW.id_change_set
		WHERE NOT OLD.quantity_ordered <=> NEW.quantity_ordered
    UNION
	# Changed id_unit_quantity
	SELECT NEW.id_order, 'id_unit_quantity', OLD.id_unit_quantity, NEW.id_unit_quantity, NEW.id_change_set
		WHERE NOT OLD.id_unit_quantity <=> NEW.id_unit_quantity
    UNION
	# Changed quantity_received
	SELECT NEW.id_order, 'quantity_received', OLD.quantity_received, NEW.quantity_received, NEW.id_change_set
		WHERE NOT OLD.quantity_received <=> NEW.quantity_received
	*/
    ;
END //
DELIMITER ;;


# Shop Supplier Purchase Order Product Link



DROP TRIGGER IF EXISTS before_insert_Shop_Supplier_Purchase_Order_Product_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Supplier_Purchase_Order_Product_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Supplier_Purchase_Order_Product_Link
BEFORE INSERT ON Shop_Supplier_Purchase_Order_Product_Link
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Supplier_Purchase_Order_Product_Link
BEFORE UPDATE ON Shop_Supplier_Purchase_Order_Product_Link
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Supplier_Purchase_Order_Product_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed id_order
	SELECT NEW.id_link, 'id_order', OLD.id_order, NEW.id_order, NEW.id_change_set
		WHERE NOT OLD.id_order <=> NEW.id_order
    UNION
	# Changed id_permutation
	SELECT NEW.id_link, 'id_permutation', OLD.id_permutation, NEW.id_permutation, NEW.id_change_set
		WHERE NOT OLD.id_permutation <=> NEW.id_permutation
    UNION
	# Changed cost_total_local
	SELECT NEW.id_link, 'cost_total_local', OLD.cost_total_local, NEW.cost_total_local, NEW.id_change_set
		WHERE NOT OLD.cost_total_local <=> NEW.cost_total_local
    UNION
	# Changed id_currency_cost
	SELECT NEW.id_link, 'id_currency_cost', OLD.id_currency_cost, NEW.id_currency_cost, NEW.id_change_set
		WHERE NOT OLD.id_currency_cost <=> NEW.id_currency_cost
    UNION
	# Changed quantity_ordered
	SELECT NEW.id_link, 'quantity_ordered', OLD.quantity_ordered, NEW.quantity_ordered, NEW.id_change_set
		WHERE NOT OLD.quantity_ordered <=> NEW.quantity_ordered
    UNION
	# Changed id_unit_quantity
	SELECT NEW.id_link, 'id_unit_quantity', OLD.id_unit_quantity, NEW.id_unit_quantity, NEW.id_change_set
		WHERE NOT OLD.id_unit_quantity <=> NEW.id_unit_quantity
    UNION
	# Changed quantity_received
	SELECT NEW.id_link, 'quantity_received', OLD.quantity_received, NEW.quantity_received, NEW.id_change_set
		WHERE NOT OLD.quantity_received <=> NEW.quantity_received
    UNION
	# Changed latency_delivery_days
	SELECT NEW.id_link, 'latency_delivery_days', OLD.latency_delivery_days, NEW.latency_delivery_days, NEW.id_change_set
		WHERE NOT OLD.latency_delivery_days <=> NEW.latency_delivery_days
    UNION
	# Changed display_order
	SELECT NEW.id_link, 'display_order', OLD.display_order, NEW.display_order, NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    UNION
	# Changed active
	SELECT NEW.id_link, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;;

# Shop Manufacturing Purchase Order



DROP TRIGGER IF EXISTS before_insert_Shop_Manufacturing_Purchase_Order;
DROP TRIGGER IF EXISTS before_update_Shop_Manufacturing_Purchase_Order;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Manufacturing_Purchase_Order
BEFORE INSERT ON Shop_Manufacturing_Purchase_Order
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Manufacturing_Purchase_Order
BEFORE UPDATE ON Shop_Manufacturing_Purchase_Order
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Manufacturing_Purchase_Order_Audit (
		id_order,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed cost_total_local
	SELECT NEW.id_order, 'cost_total_local', OLD.cost_total_local, NEW.cost_total_local, NEW.id_change_set
		WHERE NOT OLD.cost_total_local <=> NEW.cost_total_local
    UNION
	# Changed value_produced_total_local
	SELECT NEW.id_order, 'value_produced_total_local', OLD.value_produced_total_local, NEW.value_produced_total_local, NEW.id_change_set
		WHERE NOT OLD.value_produced_total_local <=> NEW.value_produced_total_local
    UNION
	# Changed id_currency_cost
	SELECT NEW.id_order, 'id_currency_cost', OLD.id_currency_cost, NEW.id_currency_cost, NEW.id_change_set
		WHERE NOT OLD.id_currency_cost <=> NEW.id_currency_cost
    UNION
	# Changed active
	SELECT NEW.id_order, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;;

# Shop Manufacturing Purchase Order Product Link



DROP TRIGGER IF EXISTS before_insert_Shop_Manufacturing_Purchase_Order_Product_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Manufacturing_Purchase_Order_Product_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Manufacturing_Purchase_Order_Product_Link
BEFORE INSERT ON Shop_Manufacturing_Purchase_Order_Product_Link
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
    SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Manufacturing_Purchase_Order_Product_Link
BEFORE UPDATE ON Shop_Manufacturing_Purchase_Order_Product_Link
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Manufacturing_Purchase_Order_Product_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed id_order
	SELECT NEW.id_link, 'id_order', OLD.id_order, NEW.id_order, NEW.id_change_set
		WHERE NOT OLD.id_order <=> NEW.id_order
    UNION
	# Changed id_permutation
	SELECT NEW.id_link, 'id_permutation', OLD.id_permutation, NEW.id_permutation, NEW.id_change_set
		WHERE NOT OLD.id_permutation <=> NEW.id_permutation
    UNION
	# Changed cost_total_local
	SELECT NEW.id_link, 'cost_total_local', OLD.cost_total_local, NEW.cost_total_local, NEW.id_change_set
		WHERE NOT OLD.cost_total_local <=> NEW.cost_total_local
    UNION
	# Changed id_currency_cost
	SELECT NEW.id_link, 'id_currency_cost', OLD.id_currency_cost, NEW.id_currency_cost, NEW.id_change_set
		WHERE NOT OLD.id_currency_cost <=> NEW.id_currency_cost
    UNION
	# Changed quantity_used
	SELECT NEW.id_link, 'quantity_used', OLD.quantity_used, NEW.quantity_used, NEW.id_change_set
		WHERE NOT OLD.quantity_used <=> NEW.quantity_used
    UNION
	# Changed id_unit_quantity
	SELECT NEW.id_link, 'id_unit_quantity', OLD.id_unit_quantity, NEW.id_unit_quantity, NEW.id_change_set
		WHERE NOT OLD.id_unit_quantity <=> NEW.id_unit_quantity
    UNION
	# Changed quantity_produced
	SELECT NEW.id_link, 'quantity_produced', OLD.quantity_produced, NEW.quantity_produced, NEW.id_change_set
		WHERE NOT OLD.quantity_produced <=> NEW.quantity_produced
    UNION
	# Changed latency_manufacture_days
	SELECT NEW.id_link, 'latency_manufacture_days', OLD.latency_manufacture_days, NEW.latency_manufacture_days, NEW.id_change_set
		WHERE NOT OLD.latency_manufacture_days <=> NEW.latency_manufacture_days
    UNION
	# Changed display_order
	SELECT NEW.id_link, 'display_order', OLD.display_order, NEW.display_order, NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    UNION
	# Changed active
	SELECT NEW.id_link, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;;


# Shop Customer



DROP TRIGGER IF EXISTS before_insert_Shop_Customer;
DROP TRIGGER IF EXISTS before_update_Shop_Customer;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Customer
BEFORE INSERT ON Shop_Customer
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Customer
BEFORE UPDATE ON Shop_Customer
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Customer_Audit (
		id_customer,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed name_company
	SELECT NEW.id_customer, 'name_company', OLD.name_company, NEW.name_company, NEW.id_change_set
		WHERE NOT OLD.name_company <=> NEW.name_company
    UNION
	# Changed name_contact
	SELECT NEW.id_customer, 'name_contact', OLD.name_contact, NEW.name_contact, NEW.id_change_set
		WHERE NOT OLD.name_contact <=> NEW.name_contact
    UNION
	# Changed department_contact
	SELECT NEW.id_customer, 'department_contact', OLD.department_contact, NEW.department_contact, NEW.id_change_set
		WHERE NOT OLD.department_contact <=> NEW.department_contact
    UNION
	# Changed id_address
	SELECT NEW.id_customer, 'id_address', OLD.id_address, NEW.id_address, NEW.id_change_set
		WHERE NOT OLD.id_address <=> NEW.id_address
    UNION
	# Changed phone_number
	SELECT NEW.id_customer, 'phone_number', OLD.phone_number, NEW.phone_number, NEW.id_change_set
		WHERE NOT OLD.phone_number <=> NEW.phone_number
    UNION
	# Changed email
	SELECT NEW.id_customer, 'email', OLD.email, NEW.email, NEW.id_change_set
		WHERE NOT OLD.email <=> NEW.email
    UNION
	# Changed id_currency
	SELECT NEW.id_customer, 'id_currency', OLD.id_currency, NEW.id_currency, NEW.id_change_set
		WHERE NOT OLD.id_currency <=> NEW.id_currency
    UNION
	# Changed active
	SELECT NEW.id_customer, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;;


# Shop Customer Sales Order



DROP TRIGGER IF EXISTS before_insert_Shop_Customer_Sales_Order;
DROP TRIGGER IF EXISTS before_update_Shop_Customer_Sales_Order;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Customer_Sales_Order
BEFORE INSERT ON Shop_Customer_Sales_Order
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Customer_Sales_Order
BEFORE UPDATE ON Shop_Customer_Sales_Order
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Customer_Sales_Order_Audit (
		id_order,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed id_customer
	SELECT NEW.id_order, 'id_customer', OLD.id_customer, NEW.id_customer, NEW.id_change_set
		WHERE NOT OLD.id_customer <=> NEW.id_customer
    UNION
	# Changed price_total_local
	SELECT NEW.id_order, 'price_total_local', OLD.price_total_local, NEW.price_total_local, NEW.id_change_set
		WHERE NOT OLD.price_total_local <=> NEW.price_total_local
    UNION
	# Changed id_currency_price
	SELECT NEW.id_order, 'id_currency_price', OLD.id_currency_price, NEW.id_currency_price, NEW.id_change_set
		WHERE NOT OLD.id_currency_price <=> NEW.id_currency_price
	UNION
	# Changed active
	SELECT NEW.id_order, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;;

# Shop Customer Sales Order Product Link



DROP TRIGGER IF EXISTS before_insert_Shop_Customer_Sales_Order_Product_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Customer_Sales_Order_Product_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Customer_Sales_Order_Product_Link
BEFORE INSERT ON Shop_Customer_Sales_Order_Product_Link
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Customer_Sales_Order_Product_Link
BEFORE UPDATE ON Shop_Customer_Sales_Order_Product_Link
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Customer_Sales_Order_Product_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed id_order
	SELECT NEW.id_link, 'id_order', OLD.id_order, NEW.id_order, NEW.id_change_set
		WHERE NOT OLD.id_order <=> NEW.id_order
    UNION
	# Changed id_permutation
	SELECT NEW.id_link, 'id_permutation', OLD.id_permutation, NEW.id_permutation, NEW.id_change_set
		WHERE NOT OLD.id_permutation <=> NEW.id_permutation
    UNION
	# Changed price_total_local
	SELECT NEW.id_link, 'price_total_local', OLD.price_total_local, NEW.price_total_local, NEW.id_change_set
		WHERE NOT OLD.price_total_local <=> NEW.price_total_local
    UNION
	# Changed id_currency_price
	SELECT NEW.id_link, 'id_currency_price', OLD.id_currency_price, NEW.id_currency_price, NEW.id_change_set
		WHERE NOT OLD.id_currency_price <=> NEW.id_currency_price
    UNION
	# Changed quantity_ordered
	SELECT NEW.id_link, 'quantity_ordered', OLD.quantity_ordered, NEW.quantity_ordered, NEW.id_change_set
		WHERE NOT OLD.quantity_ordered <=> NEW.quantity_ordered
    UNION
	# Changed id_unit_quantity
	SELECT NEW.id_link, 'id_unit_quantity', OLD.id_unit_quantity, NEW.id_unit_quantity, NEW.id_change_set
		WHERE NOT OLD.id_unit_quantity <=> NEW.id_unit_quantity
    UNION
	# Changed quantity_delivered
	SELECT NEW.id_link, 'quantity_delivered', OLD.quantity_delivered, NEW.quantity_delivered, NEW.id_change_set
		WHERE NOT OLD.quantity_delivered <=> NEW.quantity_delivered
    UNION
	# Changed latency_delivery_days
	SELECT NEW.id_link, 'latency_delivery_days', OLD.latency_delivery_days, NEW.latency_delivery_days, NEW.id_change_set
		WHERE NOT OLD.latency_delivery_days <=> NEW.latency_delivery_days
    UNION
	# Changed display_order
	SELECT NEW.id_link, 'display_order', OLD.display_order, NEW.display_order, NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    UNION
	# Changed active
	SELECT NEW.id_link, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;;
-- USE partsltd_prod;

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_debug_timing_reporting;

DELIMITER //
CREATE PROCEDURE p_debug_timing_reporting (
	IN a_time_start TIMESTAMP(6)
)
BEGIN
/*
	PROCEDURE p_debug_timing_reporting
	Shared method timing reporting
*/
    DECLARE v_time_end TIMESTAMP(6);

	SET v_time_end := CURRENT_TIMESTAMP(6);
	SELECT
		a_time_start
		, UNIX_DATETIME(a_time_start)
		, MICROSECOND(a_time_start) / 1000
		, v_time_end
		, UNIX_DATETIME(v_time_end)
		, MICROSECOND(v_time_end) / 1000
		, v_time_end - a_time_start AS timestamp_delta
		, UNIX_DATETIME(v_time_end - a_time_start) AS UNIX_DATETIME_timestamp_delta
		, MICROSECOND(v_time_end - a_time_start) AS MICROSECOND_timestamp_delta
		-- , TIME_FORMAT(TIMEDIFF(v_time_end, a_time_start), '%H:%i:%s') AS time_difference
		, CONCAT(
			TIME_FORMAT(TIMEDIFF(v_time_end, a_time_start), '%H hours, %i minutes, %s seconds'),
			', ',
			DATETIMEDIFF(MICROSECOND, a_time_start, v_time_end) % 1000000 / 1000, ' milliseconds'
		) AS time_difference
	;
	
END //
DELIMITER ;;



/*
CALL partsltd_prod.p_debug_timing_reporting (
	CURRENT_TIMESTAMP(6)
);
*/

DROP PROCEDURE IF EXISTS p_split;

DELIMITER //
CREATE PROCEDURE p_split (
	IN a_guid BINARY(36)
	, IN a_string LONGTEXT
	, IN a_separator VARCHAR(1000)
    -- IN a_allow_empty BIT
    , IN a_debug BIT
)
BEGIN
    DECLARE v_has_string BIT;
    DECLARE v_has_separator BIT;
    DECLARE v_i_separator INT;
    DECLARE v_i_start INT;
    DECLARE v_i_end INT;
    DECLARE v_current_item VARCHAR(4000);
    DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET a_string := IFNULL(a_string, '');
    SET a_separator := IFNULL(a_separator, '');
    SET a_debug := IFNULL(a_debug, 0);
    
    IF a_debug = 1 THEN
		SELECT
			a_guid
            , a_string
            , a_separator
            , a_debug
		;
    END IF;
    
    CALL p_validate_guid ( a_guid );
    
    DROP TABLE IF EXISTS tmp_Split_Split;
    
    CREATE TEMPORARY TABLE tmp_Split_Split (
        display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		substring VARCHAR(4000) NOT NULL
    );
    
    SET v_has_string = CASE WHEN a_string = '' THEN 0 ELSE 1 END;
    SET v_has_separator = CASE WHEN a_separator = '' THEN 0 ELSE 1 END;
    
    IF v_has_string THEN

		SET v_i_start = 1;
		SET v_i_end = LOCATE(',', a_string);

		WHILE v_i_end > 0 DO
			SET v_current_item = SUBSTRING(a_string, v_i_start, v_i_end - v_i_start);
			INSERT INTO tmp_Split_Split (substring) VALUES (v_current_item);

			SET v_i_start = v_i_end + 1;
			SET v_i_end = LOCATE(',', a_string, v_i_start);
		END WHILE;

		SET v_current_item = SUBSTRING(a_string, v_i_start);
		INSERT INTO tmp_Split_Split (substring) VALUES (TRIM(v_current_item));
	END IF;

	IF EXISTS (SELECT * FROM tmp_Split_Split LIMIT 1) THEN
		START TRANSACTION;
			INSERT INTO Split_Temp (
				guid
				, display_order
                , substring
			)
            SELECT
				a_guid
				, display_order
                , substring
			FROM tmp_Split_Split
            ;
		COMMIT;
    END IF;
    
    DROP TABLE IF EXISTS tmp_Split_Split;
    
    IF a_debug = 1 THEN
		CALL p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;;


/*
CALL p_split (
	'nips'
	, 'noods, cheese ' # a_string
	, ',' # a_separator
	# '0', # a_allow_empty
    , 1
);

SELECT *
FROM Split_Temp
WHERE GUID = 'nips';

CALL p_clear_split_temp( 'nips' );
*/

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_clear_split_temp;


DELIMITER //
CREATE PROCEDURE p_clear_split_temp (
	IN a_guid BINARY(36)
)
BEGIN
	CALL p_validate_guid( a_guid );

	START TRANSACTION; 
	
	-- DROP TABLE IF EXISTS 
    DELETE FROM Split_Temp
    WHERE GUID = a_guid
    ;
	
	COMMIT;
END //
DELIMITER ;;

/*

CALL p_clear_split_temp ( 'nips' );


*/


DROP PROCEDURE IF EXISTS p_validate_guid;
DROP PROCEDURE IF EXISTS p_validate_guid_test;

DELIMITER //
CREATE PROCEDURE p_validate_guid (
	IN a_guid BINARY(36)
    -- , IN a_debug BIT
)
BEGIN
	/*
    DECLARE v_code_type_error_bad_data VARCHAR(200);
    DECLARE v_id_type_error_bad_data INT;
    
    IF ISNULL(a_guid) THEN
		SET v_code_type_error_bad_data := (SELECT code FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA');
		SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data);
		
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, 'GUID is required.'
		;
    END IF;
    */
    IF ISNULL(a_guid) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'GUID is required.'
        ;
	END IF;
END //
DELIMITER ;;


DELIMITER //
CREATE PROCEDURE p_validate_guid_test ()
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		id_type INT
        , code VARCHAR(200)
        , msg TEXT
	);
	
    CALL p_validate_guid ( 'nips' );
	CALL p_validate_guid ( NULL );
    
    SELECT * FROM tmp_Msg_Error;
    
    DROP TABLE tmp_Msg_Error;
END //
DELIMITER ;;

CALL p_validate_guid_test();

DROP PROCEDURE IF EXISTS p_split_key_value_pair_csv;

DELIMITER //
CREATE PROCEDURE p_split_key_value_pair_csv (
	IN a_guid BINARY(36)
	, IN a_string LONGTEXT
    , IN a_debug BIT
)
BEGIN
    DECLARE v_has_string BIT;
    DECLARE v_current_item VARCHAR(4000);
    DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET a_string := IFNULL(a_string, '');
    SET a_debug := IFNULL(a_debug, 0);
    
    SET v_has_string = CASE WHEN a_string = '' THEN 0 ELSE 1 END;
    
    IF a_debug = 1 THEN
		SELECT
			a_guid
            , a_string
            , a_debug
		;
    END IF;
    
    CALL p_validate_guid ( a_guid );
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Split_Input;
    DROP TEMPORARY TABLE IF EXISTS tmp_Split_Split;

    CREATE TEMPORARY TABLE tmp_Split_Input (
        input_string TEXT
    );

    CREATE TEMPORARY TABLE tmp_Split_Split (
        id INT AUTO_INCREMENT PRIMARY KEY
        , key_column VARCHAR(4000)
        , value_column VARCHAR(4000)
    );

    INSERT INTO tmp_Split_Input (
        input_string
    ) 
    VALUES (
        a_string
    );

    INSERT INTO tmp_Split_Split (key_column, value_column)
    SELECT 
        SUBSTRING_INDEX(SUBSTRING_INDEX(t.pair, ':', 1), ',', -1) AS key_column,
        SUBSTRING_INDEX(t.pair, ':', -1) AS value_column
    FROM (
        SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(input_string, ',', n), ',', -1) pair
        FROM temp_input
        CROSS JOIN (
            SELECT a.N + b.N * 10 + 1 n
            FROM (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
            CROSS JOIN (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
            ORDER BY n
        ) numbers
        WHERE n <= 1 + (LENGTH(input_string) - LENGTH(REPLACE(input_string, ',', '')))
    ) t;

	IF EXISTS (SELECT * FROM tmp_Split_Split LIMIT 1) THEN
		START TRANSACTION;
			INSERT INTO Split_Key_Value_Pair_Csv_Temp (
				guid
				, id
                , key_column
                , value_column
			)
            SELECT
				a_guid
				, id
                , key_column
                , value_column
			FROM tmp_Split_Split
            ;
		COMMIT;
    END IF;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Split_Input;
    DROP TEMPORARY TABLE IF EXISTS tmp_Split_Split;
    
    IF a_debug = 1 THEN
		CALL p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;;


/*
CALL p_split_key_value_pair_csv (
	'nipsnipsnipsnipsnipsnipsnipsnipsnips'
	, '1:100,2:200,3:300,4:400' # a_string
    , 1
);

SELECT *
FROM Split_key_value_pair_csv_Temp
WHERE GUID = 'nipsnipsnipsnipsnipsnipsnipsnipsnips';

CALL p_clear_split_key_value_pair_csv_temp( 'nipsnipsnipsnipsnipsnipsnipsnipsnips' );
*/

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_clear_split_key_value_pair_csv_temp;


DELIMITER //
CREATE PROCEDURE p_clear_split_key_value_pair_csv_temp (
	IN a_guid BINARY(36)
)
BEGIN
	CALL p_validate_guid( a_guid );

	START TRANSACTION; 
	
        -- DROP TABLE IF EXISTS 
        DELETE FROM Split_Key_Value_Pair_Csv_Temp
        WHERE GUID = a_guid
        ;
	
	COMMIT;
END //
DELIMITER ;;

/*

CALL p_clear_split_key_value_pair_csv_temp ( 'nipsnipsnipsnipsnipsnipsnipsnipsnips' );


*/

DROP FUNCTION IF EXISTS fn_shop_get_product_permutation_name;

DELIMITER //

CREATE FUNCTION fn_shop_get_product_permutation_name(id_product_permutation INT)
RETURNS VARCHAR(4000)
DETERMINISTIC
BEGIN
    DECLARE name VARCHAR(4000);
    
    SET name := (
        SELECT 
            CONCAT(
                P.name
                , CASE WHEN P.has_variations = 1 THEN
                    CONCAT(' - ', GROUP_CONCAT(CONCAT(VT.name, ': ', V.name) SEPARATOR ', '))
                ELSE '' END
            )
        FROM Shop_Product_Permutation PP
        INNER JOIN Shop_Product P ON PP.id_product = P.id_product
        INNER JOIN Shop_Product_Permutation_Variation_Link PPVL ON PP.id_permutation = PPVL.id_permutation
        INNER JOIN Shop_Variation V ON PPVL.id_variation = V.id_variation
        INNER JOIN Shop_Variation_Type VT ON V.id_type = VT.id_type
        WHERE PP.id_permutation = id_product_permutation
        GROUP BY P.id_product, P.name, P.has_variations, VT.display_order, VT.name, V.display_order, V.name
        LIMIT 1
    );
    
    RETURN name;
END //

DELIMITER ;

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_user_eval;
DROP PROCEDURE IF EXISTS p_shop_calc_user;

DELIMITER //
CREATE PROCEDURE p_shop_calc_user (
	IN a_guid BINARY(36)
    , IN a_ids_user TEXT
    , IN a_get_inactive_user BIT
    , IN a_ids_permission VARCHAR(4000)
    , IN a_ids_access_level VARCHAR(4000)
    , IN a_ids_product TEXT
    , IN a_debug BIT
)
BEGIN
	-- Variable declaration
    DECLARE v_has_filter_permission BIT;
    DECLARE v_has_filter_user BIT;
    DECLARE v_has_filter_access_level BIT;
    -- DECLARE v_has_filter_permutation BIT;
    DECLARE v_has_filter_product BIT;
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
    DECLARE v_time_start TIMESTAMP(6);
	DECLARE v_ids_row_delete VARCHAR(500);
    DECLARE v_code_type_error_bad_data VARCHAR(200);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_code_error_permission VARCHAR(200);
    DECLARE v_id_permission_required INT;
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_code_type_error_bad_data := (SELECT code FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA');
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data);
    
    SET v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
    
    CALL partsltd_prod.p_validate_guid ( a_guid );
    SET a_ids_user := TRIM(IFNULL(a_ids_user, ''));
    SET a_get_inactive_user := IFNULL(a_get_inactive_user, 0);
    SET a_ids_permission := TRIM(IFNULL(a_ids_permission, ''));
    SET a_ids_access_level := TRIM(IFNULL(a_ids_access_level, ''));
    SET a_ids_product := TRIM(IFNULL(a_ids_product, ''));
    SET a_debug := IFNULL(a_debug, 0);
    
    IF a_debug = 1 THEN
		SELECT
			a_guid
            , a_ids_user
            , a_get_inactive_user
            , a_ids_permission
            , a_ids_access_level
            , a_ids_product
            , a_debug
		;
    END IF;
    
	-- Clear previous proc results
	DROP TABLE IF EXISTS tmp_Calc_User;
	DROP TABLE IF EXISTS tmp_Shop_Calc_User;
	DROP TABLE IF EXISTS tmp_Product_Calc_User;
	DROP TABLE IF EXISTS tmp_Product_p_Shop_User_Eval_Temp;
	-- DROP TABLE IF EXISTS tmp_Split;
    
    -- Permanent Table
	CREATE TEMPORARY TABLE tmp_Calc_User (
		id_row INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
		id_user INT NULL,
		id_permission_required INT NOT NULL,
		priority_access_level_required INT NOT NULL,
		id_product INT NULL,
        is_super_user BIT NULL,
		priority_access_level_user INT NULL,
		can_view BIT,
		can_edit BIT,
		can_admin BIT
	);
	
	CREATE TEMPORARY TABLE tmp_Product_Calc_User (
		-- id_row INT PRIMARY KEY AUTO_INCREMENT NOT NULL
		id_product INT NULL
        , id_access_level_required INT NOT NULL
        , priority_access_level_required INT NOT NULL
		-- guid BINARY(36) NOT NULL,
        -- rank_product INT NOT NULL
	);
		
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        -- guid BINARY(36) NOT NULL,
		id_type INT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Split (
		substring VARCHAR(4000) NOT NULL
        , as_int INT NULL
	);
    DELETE FROM tmp_Split;
		
    SET v_has_filter_user = CASE WHEN a_ids_user = '' THEN 0 ELSE 1 END;
	SET a_ids_permission = REPLACE(a_ids_permission, '|', ',');
    SET v_has_filter_permission = CASE WHEN a_ids_permission = '' THEN 0 ELSE 1 END;
	SET a_ids_access_level = REPLACE(a_ids_access_level, '|', ',');
    SET v_has_filter_access_level = CASE WHEN a_ids_access_level = '' THEN 0 ELSE 1 END;
    /*
	SET a_ids_permutation = REPLACE(a_ids_permutation, '|', ',');
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    */
	SET a_ids_product = REPLACE(a_ids_product, '|', ',');
    SET v_has_filter_product = CASE WHEN a_ids_product = '' THEN 0 ELSE 1 END;
    SET v_id_access_level_view = (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_priority_access_level_view = (SELECT priority FROM partsltd_prod.Shop_Access_Level WHERE id_access_level = v_id_access_level_view);
    SET v_priority_access_level_edit = (SELECT priority FROM partsltd_prod.Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    SET v_priority_access_level_admin = (SELECT priority FROM partsltd_prod.Shop_Access_Level WHERE code = 'ADMIN' LIMIT 1);
    
    IF a_debug = 1 THEN
		SELECT 
			v_priority_access_level_view
			, v_priority_access_level_edit
			, v_priority_access_level_admin
		;
    END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF v_has_filter_access_level THEN
			CALL partsltd_prod.p_split(a_guid, a_ids_access_level, ',', a_debug);
            
            INSERT INTO tmp_Split (
				substring
                , as_int
			)
            SELECT 
				substring
                , CONVERT(substring, DECIMAL(10,0)) -- AS as_int
            FROM Split_Temp
            WHERE 1=1
				AND GUID = a_guid
                AND NOT ISNULL(substring)
                AND substring != ''
            ;
			
            CALL partsltd_prod.p_clear_split_temp( a_guid );
            
            # Invalid IDs
            IF EXISTS (
				SELECT t_S.substring 
                FROM tmp_Split t_S
                LEFT JOIN partsltd_prod.Shop_Access_Level AL ON t_S.as_int = AL.id_access_level
                WHERE 
					ISNULL(t_S.as_int)
                    OR ISNULL(AL.id_access_level)
                    OR AL.active = 0
			) THEN
                INSERT INTO tmp_Msg_Error (
					-- guid,
                    id_type,
					code,
					msg
				)
				SELECT
					-- a_guid,
					v_id_type_error_bad_data,
					v_code_type_error_bad_data, 
					CONCAT('Invalid or inactive access level IDs: ', GROUP_CONCAT(t_S.substring SEPARATOR ', '))
				FROM tmp_Split t_S 
				LEFT JOIN partsltd_prod.Shop_Access_Level AL ON t_S.as_int = AL.id_access_level
                WHERE 
					ISNULL(t_S.as_int)
                    OR ISNULL(AL.id_access_level)
                    OR AL.active = 0
				;
			END IF;
		END IF;
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF v_has_filter_access_level THEN
			SET v_id_access_level := (
				SELECT AL.id_access_level 
				FROM tmp_Split t_S
				INNER JOIN partsltd_prod.Shop_Access_Level AL 
					ON t_S.as_int = AL.id_access_level
					AND AL.active 
				ORDER BY AL.priority ASC 
				LIMIT 1
			);
        ELSE
			SET v_id_access_level = v_id_access_level_view;
		END IF;
        SET v_priority_access_level := (SELECT priority FROM partsltd_prod.Shop_Access_Level WHERE id_access_level = v_id_access_level LIMIT 1);
	END IF;
            
	DELETE FROM tmp_Split;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF v_has_filter_product = 1 THEN
			CALL partsltd_prod.p_split(a_guid, a_ids_product, ',', a_debug);
            
            INSERT INTO tmp_Split (
				substring
                , as_int
			)
            SELECT 
				substring
                , CONVERT(substring, DECIMAL(10,0)) AS as_int
            FROM Split_Temp
            WHERE 1=1
				AND GUID = a_guid
                AND NOT ISNULL(substring)
                AND substring != ''
            ;
			
            CALL partsltd_prod.p_clear_split_temp( a_guid );
                        
			# Invalid product IDs
            IF EXISTS (SELECT * FROM tmp_Split t_S LEFT JOIN partsltd_prod.Shop_Product P ON t_S.as_int = P.id_product WHERE ISNULL(t_S.as_int) OR ISNULL(P.id_product) OR P.active = 0) THEN 
				INSERT INTO tmp_Msg_Error (
					-- guid,
                    id_type,
					code,
					msg
				)
				SELECT
					-- a_guid,
					v_id_type_error_bad_data,
					v_code_type_error_bad_data, 
					CONCAT('Invalid or inactive product IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
				FROM tmp_Split t_S
                LEFT JOIN partsltd_prod.Shop_Product P ON t_S.as_int = P.id_product 
                WHERE 
					ISNULL(t_S.as_int)
                    OR ISNULL(P.id_product) 
                    OR P.active = 0
				;
            END IF;
		END IF;
	END IF;
	IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF (v_has_filter_product = 1 AND EXISTS (SELECT * FROM tmp_Split)) THEN
			INSERT INTO tmp_Product_Calc_User (
				id_product,
				-- id_permutation,
				id_access_level_required,
				priority_access_level_required
			)
			SELECT 
				DISTINCT P.id_product,
				-- PP.id_permutation,
				CASE WHEN AL_P.priority < AL_C.priority THEN AL_P.id_access_level ELSE AL_C.id_access_level END AS id_access_level_required,
				CASE WHEN AL_P.priority < AL_C.priority THEN AL_P.priority ELSE AL_C.priority END AS priority_access_level_required
			FROM tmp_Split t_S
			INNER JOIN partsltd_prod.Shop_Product P ON t_S.as_int = P.id_product # Shop_Product_Permutation PP
			INNER JOIN partsltd_prod.Shop_Access_Level AL_P
				ON P.id_access_level_required = AL_P.id_access_level
				AND AL_P.active
			INNER JOIN partsltd_prod.Shop_Product_Category C ON P.id_category = C.id_category
			INNER JOIN partsltd_prod.Shop_Access_Level AL_C
				ON C.id_access_level_required = AL_C.id_access_level
				AND AL_C.active
			;
			
			SET v_has_filter_product = EXISTS (SELECT * FROM tmp_Product_Calc_User);
			/*
			UPDATE tmp_Product_Calc_User t_P
			INNER JOIN partsltd_prod.Shop_Product P ON t_P.id_product = P.id_product
			INNER JOIN partsltd_prod.Shop_Product_Category PC ON P.id_category = PC.id_category
			INNER JOIN partsltd_prod.Shop_Access_Level AL ON PC.id_access_level_required = AL.id_access_level
			SET 
				t_P.id_access_level_required = CASE WHEN t_P.priority_access_level_required <= AL.priority THEN t_P.id_access_level_required ELSE AL.id_access_level END
				, t_P.priority_access_level_required = LEAST(t_P.priority_access_level_required, AL.priority)
			;
			*/
		ELSE
			INSERT INTO tmp_Product_Calc_User (
				id_product,
				-- id_permutation,
				id_access_level_required,
				priority_access_level_required
			)
			VALUES (
				NULL
				, v_id_access_level_view
				, v_priority_access_level_view
			);
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    -- Permission IDs
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF v_has_filter_permission THEN
			CALL partsltd_prod.p_split(a_guid, a_ids_permission, ',', a_debug);
            
            INSERT INTO tmp_Split (
				substring
                , as_int
			)
            SELECT 
				substring
                , CONVERT(substring, DECIMAL(10,0)) AS as_int
            FROM Split_Temp
            WHERE 1=1
				AND GUID = a_guid
                AND NOT ISNULL(substring)
                AND substring != ''
            ;
			
            CALL partsltd_prod.p_clear_split_temp( a_guid );
            
            # Invalid or inactive
            IF EXISTS (SELECT PERM.id_permission FROM tmp_Split t_S LEFT JOIN partsltd_prod.Shop_Permission PERM ON t_S.as_int = PERM.id_permission WHERE ISNULL(t_S.as_int) OR ISNULL(PERM.id_permission) OR PERM.active = 0) THEN
				INSERT INTO tmp_Msg_Error (
					-- guid,
                    id_type,
					code,
					msg
				)
				SELECT
					-- a_guid,
					v_id_type_error_bad_data,
					v_code_type_error_bad_data, 
					CONCAT('Invalid or inactive permission IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
				FROM tmp_Split t_S
				LEFT JOIN partsltd_prod.Shop_Permission PERM ON t_S.as_int = PERM.id_permission 
				WHERE 
					ISNULL(t_S.as_int)
                    OR ISNULL(PERM.id_permission)
                    OR PERM.active = 0
				;
			ELSE 
				SET v_id_permission_required := (
					SELECT PERM.id_permission
                    FROM partsltd_prod.Shop_Permission PERM
                    INNER JOIN partsltd_prod.Shop_Access_Level AL ON PERM.id_access_level_required = AL.id_access_level
                    ORDER BY AL.priority ASC
                    LIMIT 1
				);
            END IF;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    IF a_debug = 1 THEN
		SELECT * FROM tmp_Product_Calc_User;
    END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
    -- Invalid user ID
		CALL partsltd_prod.p_split(a_guid, a_ids_user, ',', a_debug);
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM Split_Temp
		WHERE 1=1
			AND GUID = a_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( a_guid );
		
		# Invalid or inactive
		IF EXISTS (SELECT U.id_user FROM tmp_Split t_S LEFT JOIN partsltd_prod.Shop_User U ON t_S.as_int = U.id_user WHERE ISNULL(t_S.as_int) OR ISNULL(U.id_user) OR U.active = 0) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- a_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive user IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_User U ON t_S.as_int = U.id_user 
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(U.id_user)
				OR U.active = 0
			;
		ELSE
			/*
			SET a_ids_user = (
				SELECT U.id_user 
				FROM tmp_Split t_S
				INNER JOIN partsltd_prod.Shop_User U ON t_S.as_int = U.id_user
			);
			SET v_has_filter_user = ISNULL(a_ids_user);
			*/
			IF NOT EXISTS (SELECT * FROM tmp_Split) THEN
				INSERT INTO tmp_Split (substring, as_int)
				VALUES ( '', NULL );
			END IF;
			
			IF a_debug = 1 THEN
				SELECT *
				FROM tmp_Split;
			END IF;
            
			INSERT INTO tmp_Calc_User (
				id_user
				, id_permission_required
				, priority_access_level_required
				, id_product
                , priority_access_level_user
                , is_super_user
			)
			SELECT 
				U.id_user
				, v_id_permission_required
				, CASE WHEN v_priority_access_level < AL_P.priority THEN v_priority_access_level ELSE AL_P.priority END AS priority_access_level_required
				, t_P.id_product
				, CASE WHEN MIN(IFNULL(AL_U.priority, 0)) = 0 THEN v_priority_access_level_view ELSE MIN(IFNULL(AL_U.priority, 0)) END AS priority_access_level_user
				, IFNULL(U.is_super_user, 0) AS is_super_user
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_User U
				ON t_S.as_int = U.id_user
				AND U.active
			LEFT JOIN partsltd_prod.Shop_User_Role_Link URL
				ON U.id_user = URL.id_user
				AND URL.active
			LEFT JOIN partsltd_prod.Shop_Role_Permission_Link RPL
				ON URL.id_role = RPL.id_role
				AND RPL.active
			LEFT JOIN partsltd_prod.Shop_Access_Level AL_U
				ON RPL.id_access_level = AL_U.id_access_level
				AND AL_U.active
			CROSS JOIN tmp_Product_Calc_User t_P
			LEFT JOIN partsltd_prod.Shop_Access_Level AL_P
				ON t_P.id_access_level_required = AL_P.id_access_level
				AND AL_P.active
            GROUP BY t_S.as_int, U.id_user, t_P.id_product, AL_P.priority
			;
		
			SET v_has_filter_user = EXISTS ( SELECT * FROM tmp_Calc_User LIMIT 1 );
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    -- Calculated fields
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		UPDATE tmp_Calc_User t_U
        SET
            t_U.can_view = t_U.is_super_user = 1 OR (t_U.priority_access_level_user <= v_priority_access_level_view AND t_U.priority_access_level_user <= t_U.priority_access_level_required)
			, t_U.can_edit = t_U.is_super_user = 1 OR (t_U.priority_access_level_user <= v_priority_access_level_edit AND t_U.priority_access_level_user <= t_U.priority_access_level_required)
			, t_U.can_admin = t_U.is_super_user = 1 OR (t_U.priority_access_level_user <= v_priority_access_level_admin AND t_U.priority_access_level_user <= t_U.priority_access_level_required)
		;
    END IF;
    
    -- Export data to staging table
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
        START TRANSACTION;
			INSERT INTO partsltd_prod.Shop_Calc_User_Temp (
				guid
				, id_user
				, id_permission_required
				, priority_access_level_required
				, id_product
				, is_super_user
				, priority_access_level_user
				, can_view
				, can_edit
				, can_admin
			)
			SELECT
				a_guid
				, id_user
				, id_permission_required
				, priority_access_level_required
				, id_product
				, is_super_user
				, priority_access_level_user
				, can_view
				, can_edit
				, can_admin
			FROM tmp_Calc_User
			;
		COMMIT;
    END IF;
    
    IF a_debug = 1 THEN
		SELECT * FROM tmp_Msg_Error;
		SELECT * FROM tmp_Calc_User;
		SELECT * FROM tmp_Product_Calc_User;
		SELECT * FROM partsltd_prod.Shop_Calc_User_Temp WHERE GUID = a_guid;
		CALL partsltd_prod.p_shop_clear_calc_user ( a_guid, a_debug );
    END IF;
    
    -- Clean up
	DROP TABLE IF EXISTS tmp_Calc_User;
	DROP TABLE IF EXISTS tmp_Shop_Calc_User;
	DROP TABLE IF EXISTS tmp_Product_Calc_User;
	DROP TABLE IF EXISTS tmp_Product_p_Shop_User_Eval_Temp;
	-- DROP TABLE IF EXISTS tmp_Split;
    
    IF a_debug = 1 THEN
        CALL partsltd_prod.p_debug_timing_reporting( v_time_start );
    END IF;
END //
DELIMITER ;;

/*	

CALL partsltd_prod.p_shop_calc_user (
	'chips                               '
	, NULL
	, 0
	, '2'
	, '1'
	, '1,2,3,4,5'
    , 0
);
        
        
        
-- SELECT * FROM partsltd_prod.Shop_Calc_User_Temp;
SELECT * FROM partsltd_prod.Shop_Calc_User_Temp WHERE GUID = 'chips                               ';
CALL partsltd_prod.p_shop_clear_calc_user ( 'chips                               ', 0 );
-- SELECT * FROM partsltd_prod.Shop_Calc_User_Temp;
DROP TABLE IF EXISTS tmp_Msg_Error;

        CALL p_shop_calc_user(
			'chips                               '
            , 1
            , FALSE -- a_get_inactive_users
            , 2
            , 1
            , '' -- a_ids_product
            , 0 -- a_debug
		);
SELECT * FROM partsltd_prod.Shop_Calc_User_Temp WHERE GUID = 'chips                               ';
CALL partsltd_prod.p_shop_clear_calc_user ( 'chips                               ', 0 );
DROP TABLE IF EXISTS tmp_Msg_Error;

SELECT * FROM partsltd_prod.shop_user_role_link;
SELECT * FROM partsltd_prod.shop_role_permission_link;

*/
-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_clear_Shop_Calc_User_Temp;
DROP PROCEDURE IF EXISTS p_clear_Shop_Calc_User_Temp;
DROP PROCEDURE IF EXISTS p_shop_clear_calc_user;


DELIMITER //
CREATE PROCEDURE p_shop_clear_calc_user (
	IN a_guid BINARY(36)
    , IN a_debug BIT
)
BEGIN
	DECLARE v_time_start TIMESTAMP(6);
    SET v_time_start := CURRENT_TIMESTAMP(6);
    
    CALL p_validate_guid ( a_guid );
    
	START TRANSACTION;
		
		DELETE FROM Shop_Calc_User_Temp
		WHERE GUID = a_guid
		;
	
	COMMIT;
    
    IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting( v_time_start );
    END IF;
END //
DELIMITER ;;

/*

CALL p_shop_clear_calc_user (
	'noods, cheese ' # a_guid
    , 1 -- debug
);

SELECT *
FROM Shop_Calc_User_Temp
WHERE GUID = 'noods, cheese '
;

*/



/*

CALL p_shop_get_many_access_level (
	0 # a_get_inactive_access_level
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_access_level;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_access_level (
	IN a_get_inactive_access_level BIT
)
BEGIN
	SET a_get_inactive_access_level = IFNULL(a_get_inactive_access_level, 0);
    
	SELECT 
		AL.id_access_level
		, AL.code
		, AL.name
		, AL.priority
		, AL.display_order
		, AL.active
	FROM Shop_Access_Level AL
	WHERE 
		a_get_inactive_access_level = 1
		OR AL.active = 1
	ORDER BY AL.display_order
	;
END //
DELIMITER ;;


/*
CALL p_shop_get_many_access_level (
	0 # a_get_inactive_access_level
);
*/



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
DELIMITER ;;


/*
CALL p_shop_get_many_region (
	0 # a_get_inactive_region
);
*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_plant;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_plant (
	IN a_get_inactive_plant BIT
)
BEGIN
	SET a_get_inactive_plant = IFNULL(a_get_inactive_plant, 0);
    
	SELECT 
		P.id_plant
        , P.id_address
        , A.id_region
        , P.id_user_manager
		, P.code
		, P.name
		, P.active
	FROM Shop_Plant P
    INNER JOIN Shop_Address A ON P.id_address = A.id_address
	WHERE 
		a_get_inactive_plant = 1
		OR P.active = 1
	;
END //
DELIMITER ;;


/*
CALL p_shop_get_many_plant (
	0 # a_get_inactive_plant
);
*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_storage_location;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_storage_location (
	IN a_get_inactive_storage_location BIT
)
BEGIN
	SET a_get_inactive_storage_location = IFNULL(a_get_inactive_storage_location, 0);
    
	SELECT 
		SL.id_storage_location
        , P.id_plant
        , P.id_address
        , A.id_region
		, SL.code
		, SL.name
		, P.active
	FROM Shop_Storage_Location SL
    INNER JOIN Shop_Plant P ON SL.id_plant = P.id_plant
    INNER JOIN Shop_Address A ON P.id_address = A.id_address
	WHERE 
		a_get_inactive_storage_location = 1
		OR SL.active = 1
	;
END //
DELIMITER ;;


/*
CALL p_shop_get_many_storage_location (
	0 # a_get_inactive_storage_location
);
*/



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
        C.symbol,
        C.factor_from_GBP,
        C.display_order,
        C.active
	FROM Shop_Currency C
	WHERE a_get_inactive_currency
		OR C.active
	ORDER BY C.display_order
	;
END //
DELIMITER ;;


/*
CALL p_shop_get_many_currency (
	0 # a_get_inactive_currency
);
*/

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_unit_measurement;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_unit_measurement (
	IN a_get_inactive_unit_measurement BIT
)
BEGIN
	SET a_get_inactive_unit_measurement := IFNULL(a_get_inactive_unit_measurement, 0);
    
	SELECT 
		UM.id_unit_measurement,
		UM.name_singular,
		UM.name_plural,
		UM.symbol,
		UM.symbol_is_suffix_not_prefix,
		UM.is_base_unit,
		UM.is_unit_of_distance,
		UM.is_unit_of_mass,
		UM.is_unit_of_time,
		UM.is_unit_of_volume,
		UM.active
	FROM Shop_Unit_Measurement UM
	WHERE 
		a_get_inactive_unit_measurement = 1
		OR UM.active = 1
	;
END //
DELIMITER ;;


/*
CALL p_shop_get_many_unit_measurement (
	0 # a_get_inactive_unit_measurement
);

select *
from shop_unit_measurement
*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_save_category;
DROP PROCEDURE IF EXISTS p_shop_save_category;
DROP PROCEDURE IF EXISTS p_shop_save_product_category;


DELIMITER //
CREATE PROCEDURE p_shop_save_product_category (
    IN a_comment VARCHAR(500),
	IN a_guid BINARY(36),
    IN a_id_user INT
)
BEGIN
	DECLARE v_code_type_error_bad_data VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission LONGTEXT;
    DECLARE v_id_change_set INT;
    DECLARE v_id_access_level_edit INT;
    DECLARE v_now DATETIME;
    
    DECLARE exit handler for SQLEXCEPTION
    BEGIN
        -- Get diagnostic information
        GET DIAGNOSTICS CONDITION 1
            @sqlstate = RETURNED_SQLSTATE
            , @errno = MYSQL_ERRNO
            , @text = MESSAGE_TEXT
		;
        
        -- Rollback the transaction
        ROLLBACK;
        
        -- Select the error information
        -- SELECT 'Error' AS status, @errno AS error_code, @sqlstate AS sql_state, @text AS message;
        
		CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
			display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
			, guid BINARY(36) NOT NULL
			, id_type INT NULL
			, code VARCHAR(50) NOT NULL
			, msg VARCHAR(4000) NOT NULL
		);
        INSERT INTO tmp_Msg_Error (
			guid
            , id_type
            , code
            , msg
		)
        SELECT 
			a_guid
            , NULL
            , @errno
            , @text
		;
        SELECT *
        FROM tmp_Msg_Error;
		DROP TABLE IF EXISTS tmp_Msg_Error;
    END;
    
    SET v_code_type_error_bad_data := 'BAD_DATA';
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_id_access_level_edit := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
    SET a_guid := IFNULL(a_guid, UUID());
    
    DROP TABLE IF EXISTS tmp_Category;
    
    CREATE TEMPORARY TABLE tmp_Category (
		id_category INT NOT NULL
        , code VARCHAR(50) NOT NULL
        , name VARCHAR(255) NOT NULL
        , description VARCHAR(4000) NULL
        , id_access_level_required INT NOT NULL
        , active BIT NOT NULL
        , display_order INT NOT NULL
        , can_view BIT NULL
        , can_edit BIT NULL
        , can_admin BIT NULL
        , name_error VARCHAR(255) NOT NULL
        , is_new BIT NOT NULL
    );
        
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
        , guid BINARY(36) NOT NULL
		, id_type INT NULL
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
        
    
    -- Get data from Temp table
    INSERT INTO tmp_Category (
		id_category
        , code
        , name
        , description
        , id_access_level_required
        , active
        , display_order
        , name_error
        , is_new
	)
    SELECT 
		IFNULL(PC_T.id_category, PC.id_category) AS id_category
        , IFNULL(PC_T.code, PC.code) AS code
        , IFNULL(PC_T.name, PC.code) AS name
        , IFNULL(PC_T.description, PC.description) AS description
        , IFNULL(PC_T.id_access_level_required, PC.id_access_level_required) AS id_access_level_required
        , IFNULL(PC_T.active, PC.active) AS active
        , IFNULL(PC_T.display_order, PC.display_order) AS display_order
        , IFNULL(PC_T.name, IFNULL(PC.name, IFNULL(PC_T.code, IFNULL(PC.code, IFNULL(PC_T.id_category, '(No Product Category)'))))) AS name_error
        , CASE WHEN IFNULL(PC_T.id_category, 0) < 1 THEN 1 ELSE 0 END AS is_new
	FROM Shop_Product_Category_Temp PC_T
    LEFT JOIN Shop_Product_Category PC ON PC_T.id_category = PC.id_category
    WHERE PC_T.guid = a_guid
    ;
    
    -- Validation
    -- Missing mandatory fields
    -- code
    IF EXISTS (SELECT * FROM tmp_Category t_C WHERE ISNULL(t_C.code) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, code
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following category(s) do not have a code: ', GROUP_CONCAT(IFNULL(t_C.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Category t_C
		WHERE ISNULL(t_C.code)
		;
    END IF;
    -- name
    IF EXISTS (SELECT * FROM tmp_Category t_C WHERE ISNULL(t_C.name) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, code
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following category(s) do not have a name: ', GROUP_CONCAT(IFNULL(t_C.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Category t_C
		WHERE ISNULL(t_C.name)
		;
    END IF;
    -- display_order
    IF EXISTS (SELECT * FROM tmp_Category t_C WHERE ISNULL(t_C.display_order) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, code
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following category(s) do not have a display order: ', GROUP_CONCAT(IFNULL(t_C.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Category t_C
		WHERE ISNULL(t_C.display_order)
		;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN -- (SELECT * FROM tmp_Product WHERE is_new = 0 LIMIT 1) THEN
        SET v_ids_product_permission := (
			SELECT GROUP_CONCAT(P.id_product SEPARATOR ',') 
            FROM Shop_Product P 
            INNER JOIN tmp_Category t_C
				ON P.id_category = t_C.id_category 
                AND t_C.is_new = 0
		);
        IF NOT ISNULL(v_ids_product_permission) THEN
			SET v_id_permission_product = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
			
			CALL p_shop_calc_user(a_guid, a_id_user, FALSE, v_id_permission_product, v_id_access_level_edit, v_ids_product_permission);
			
			UPDATE tmp_Category t_C
            INNER JOIN Shop_Product P ON t_C.id_category = P.id_product
			INNER JOIN Shop_Calc_User_Temp UE_T
				ON P.id_product = UE_T.id_product
				AND UE_T.GUID = a_guid
			SET 
				t_C.can_view = UE_T.can_view
				, t_C.can_edit = UE_T.can_edit
				, t_C.can_admin = UE_T.can_admin
			;
			
			CALL p_shop_clear_calc_user(a_guid);
		END IF;
    END IF;
    
    SET v_now := CURRENT_DATETIME();
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		START TRANSACTION;
			
			IF NOT ISNULL(v_ids_product_permission) THEN
				INSERT INTO Shop_Product_Change_Set ( comment )
				VALUES ( a_comment )
				;
				
				SET v_id_change_set := LAST_INSERT_ID();
				
				UPDATE Shop_Product_Category PC
				INNER JOIN tmp_Category t_C ON PC.id_category = t_C.id_category
				SET 
					PC.id_category = t_C.id_category
					, PC.code = t_C.code
					, PC.name = t_C.name
					, PC.description = t_C.description
					, PC.id_access_level_required = t_C.id_access_level_required
					, PC.active = t_C.active
					, PC.display_order = t_C.display_order
					, PC.id_change_set = v_id_change_set
				;
			END IF;
			
			INSERT INTO Shop_Product_Category (
				code
				, name
				, description
				, id_access_level_required
				, active
				, display_order
				, created_by
				, created_on
			)
			SELECT
				-- t_C.id_category AS id_category
				t_C.code AS code
				, t_C.name AS name
				, t_C.description AS description
				, t_C.id_access_level_required AS id_access_level_required
				, t_C.active AS active
				, t_C.display_order AS display_order
				, a_id_user AS created_by
				, v_now AS created_on
			FROM tmp_Category t_C
			WHERE is_new = 1
				AND active = 1
			;
		
			DELETE FROM Shop_Product_Category_Temp
			WHERE GUID = a_guid;
			
		COMMIT;
    END IF;
    
    SELECT * FROM tmp_Msg_Error;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Catgory;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
END //
DELIMITER ;;





-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_product_category_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_product_category_test (
	IN a_id_user INT,
	IN a_guid BINARY(36),
	IN a_comment VARCHAR(500)
)
BEGIN
	DECLARE v_code_type_error_bad_data VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission LONGTEXT;
    DECLARE v_id_change_set INT;
    
    DECLARE exit handler for SQLEXCEPTION
    BEGIN
        -- Get diagnostic information
        GET DIAGNOSTICS CONDITION 1
            @sqlstate = RETURNED_SQLSTATE
            , @errno = MYSQL_ERRNO
            , @text = MESSAGE_TEXT
		;
        
        -- Rollback the transaction
        ROLLBACK;
        
        -- Select the error information
        -- SELECT 'Error' AS status, @errno AS error_code, @sqlstate AS sql_state, @text AS message;
        
		CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
			display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
			, guid BINARY(36) NOT NULL
			, id_type INT NULL
			, code VARCHAR(50) NOT NULL
			, msg VARCHAR(4000) NOT NULL
		);
        INSERT INTO tmp_Msg_Error (
			guid
            , id_type
            , code
            , msg
		)
        SELECT 
			a_guid
            , NULL
            , @errno
            , @text
		;
        
        SELECT * FROM tmp_Msg_Error;
		DROP TABLE IF EXISTS tmp_Msg_Error;
    END;
    
	select 'p_shop_save_product_category_test';
    
    SET v_code_type_error_bad_data := 'BAD_DATA';
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    
    SET a_guid := IFNULL(a_guid, UUID());
    
    DROP TABLE IF EXISTS tmp_Category;
    
    CREATE TEMPORARY TABLE tmp_Category (
		id_category INT NOT NULL
        , code VARCHAR(50) NOT NULL
        , name VARCHAR(255) NOT NULL
        , description VARCHAR(4000) NULL
        , active BIT NOT NULL
        , display_order INT NOT NULL
        , can_view BIT NULL
        , can_edit BIT NULL
        , can_admin BIT NULL
        , name_error VARCHAR(255) NOT NULL
        , is_new BIT NOT NULL
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
        , guid BINARY(36) NOT NULL
		, id_type INT NULL
		/*
        CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        */
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
        
    
    -- Get data from Temp table
    INSERT INTO tmp_Category (
		id_category
        , code
        , name
        , description
        , active
        , display_order
        , name_error
        , is_new
	)
    SELECT 
		IFNULL(PC_T.id_category, PC.id_category) AS id_category
        , IFNULL(PC_T.code, PC.code) AS code
        , IFNULL(PC_T.name, PC.code) AS name
        , IFNULL(PC_T.description, PC.description) AS description
        , IFNULL(PC_T.active, PC.active) AS active
        , IFNULL(PC_T.display_order, PC.display_order) AS display_order
        , IFNULL(PC_T.name, IFNULL(PC.name, IFNULL(PC_T.code, IFNULL(PC.code, IFNULL(PC_T.id_category, '(No Product Category)'))))) AS name_error
        , CASE WHEN IFNULL(PC_T.id_category, 0) < 1 THEN 1 ELSE 0 END AS is_new
	FROM Shop_Product_Category_Temp PC_T
    LEFT JOIN Shop_Product_Category PC ON PC_T.id_category = PC.id_category
    WHERE PC_T.guid = a_guid
    ;
    
    -- Validation
    -- Missing mandatory fields
    -- code
    INSERT INTO tmp_Msg_Error (
		guid
        , id_type
        , code
        , msg
	)
    SELECT
		a_guid AS GUID
        , v_id_type_error_bad_data
        , v_code_type_error_bad_data
        , CONCAT('The following category(s) do not have a code: ', GROUP_CONCAT(t_C.name_error SEPARATOR ', ')) AS msg
	FROM tmp_Category t_C
    ;
    -- name
    INSERT INTO tmp_Msg_Error (
		guid
        , id_type
        , code
        , msg
	)
    SELECT
		a_guid AS GUID
        , v_id_type_error_bad_data
        , v_code_type_error_bad_data
        , CONCAT('The following category(s) do not have a name: ', GROUP_CONCAT(t_C.name_error SEPARATOR ', ')) AS msg
	FROM tmp_Category t_C
    ;
    -- display_order
    INSERT INTO tmp_Msg_Error (
		guid
        , id_type
        , code
        , msg
	)
    SELECT
		a_guid AS GUID
        , v_id_type_error_bad_data
        , v_code_type_error_bad_data
        , CONCAT('The following category(s) do not have a display order: ', GROUP_CONCAT(t_C.name_error SEPARATOR ', ')) AS msg
	FROM tmp_Category t_C
    ;
    
    SELECT * FROM tmp_Category;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN -- (SELECT * FROM tmp_Product WHERE is_new = 0 LIMIT 1) THEN
        SET v_ids_product_permission := (
			SELECT GROUP_CONCAT(P.id_product SEPARATOR ',') 
            FROM Shop_Product P 
            INNER JOIN Shop_Product_Category PC 
				ON P.id_category = PC.id_category 
                AND PC.is_new = 0
		);
        IF NOT ISNULL(v_ids_product_permission) THEN
			SET v_id_permission_product = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
			
			CALL p_shop_calc_user(a_guid, a_id_user, v_id_permission_product, v_ids_product_permission);
			
			UPDATE tmp_Category t_C
            INNER JOIN Shop_Product P ON t_C.id_category = P.id_product
			INNER JOIN Shop_Calc_User_Temp UE_T
				ON P.id_product = UE_T.id_product
				AND UE_T.GUID = a_guid
			SET 
				t_C.can_view = UE_T.can_view
				, t_C.can_edit = UE_T.can_edit
				, t_C.can_admin = UE_T.can_admin
			;
			
			CALL p_shop_clear_calc_user(a_guid);
		END IF;
    END IF;
    
    SELECT * FROM tmp_Category;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		START TRANSACTION;
		
		IF NOT ISNULL(v_ids_product_permission) THEN
			INSERT INTO Shop_Product_Change_Set ( comment )
			VALUES ( a_comment )
			;
			
			SET v_id_change_set := LAST_INSERT_ID();
			
			UPDATE Shop_Product_Category PC
			INNER JOIN tmp_Category t_C ON PC.id_category = t_C.id_category
			SET 
				PC.id_category = t_C.id_category
				, PC.code = t_C.code
				, PC.name = t_P.name
				, PC.description = t_C.description
				, PC.display_order = t_C.display_order
                , PC.active = t_C.active
				, P.id_change_set = v_id_change_set
			;
		END IF;
		
		INSERT INTO Shop_Product_Category (
			id_category
            , code
			, name
			, description
			, display_order
            , active
			, created_by
			, created_on
		)
		SELECT
			t_C.id_category AS id_category
            , t_C.code AS code
			, t_C.name AS name
			, t_C.description AS description
			, t_C.active AS active
			, t_P.display_order AS display_order
			, a_id_user AS created_by
			, v_now AS created_on
		FROM tmp_Category t_C
		WHERE is_new = 1
			AND active = 1
		;
		
		ROLLBACK;
    END IF;
    
    SELECT * FROM tmp_Msg_Error;
    SELECT * FROM tmp_Category;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Catgory;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
END //
DELIMITER ;;


select *
from shop_product_category;
select *
from shop_product_category_temp;

SELECT 'nips' as guid;

CALL p_shop_save_product_category_TEST  (1, 'nips', 'y');

select *
from shop_product_category;
select *
from shop_product_category_temp;



-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_clear_calc_product_permutation;


DELIMITER //
CREATE PROCEDURE p_shop_clear_calc_product_permutation (
	IN a_guid BINARY(36)
)
BEGIN
    IF ISNULL(a_guid) THEN
		
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'GUID is required.';
        
	ELSE
    
		START TRANSACTION;
            
            DELETE FROM Shop_Product_Category_Temp
            WHERE GUID = a_guid
            ;
            DELETE FROM Shop_Product_Temp
            WHERE GUID = a_guid
            ;
            DELETE FROM Shop_Product_Permutation_Temp
            WHERE GUID = a_guid
            ;
        
        COMMIT;
	END IF;
    
END //
DELIMITER ;;

/*

CALL p_shop_clear_calc_product_permutation (
	'noods, cheese ' # a_guid
);

SELECT * FROM Shop_Product_Category_Temp
WHERE GUID = a_guid
;
SELECT * FROM Shop_Product_Temp
WHERE GUID = a_guid
;
SELECT * FROM Shop_Product_Permutation_Temp
WHERE GUID = a_guid
;

*/




-- Clear previous proc
DROP PROCEDURE IF EXISTS p_save_product;
DROP PROCEDURE IF EXISTS p_shop_save_product;


DELIMITER //
CREATE PROCEDURE p_shop_save_product (
    IN a_comment VARCHAR(500),
	IN a_guid BINARY(36),
    IN a_id_user INT,
    IN a_debug BIT
)
BEGIN
	DECLARE v_code_type_error_bad_data VARCHAR(100);
    DECLARE v_id_access_level_edit INT;
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission LONGTEXT;
    DECLARE v_id_change_set INT;
    DECLARE v_time_start TIMESTAMP(6);
    
    DECLARE exit handler for SQLEXCEPTION
    BEGIN
        -- Get diagnostic information
        GET DIAGNOSTICS CONDITION 1
            @sqlstate = RETURNED_SQLSTATE
            , @errno = MYSQL_ERRNO
            , @text = MESSAGE_TEXT
		;
        
        -- Rollback the transaction
        ROLLBACK;
        
        -- Select the error information
        -- SELECT 'Error' AS status, @errno AS error_code, @sqlstate AS sql_state, @text AS message;
        INSERT INTO tmp_Msg_Error (
			-- guid
            id_type
            , code
            , msg
		)
        SELECT 
			-- a_guid
            (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'MYSQL_ERROR' LIMIT 1)
            , @errno
            , IFNULL(@text, 'NULL')
		;
        
        SELECT *
        FROM tmp_Msg_Error t_ME
        INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
        ;
        
        DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
        DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    END;
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_code_type_error_bad_data := (SELECT code FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_id_access_level_edit := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
    SET a_guid := IFNULL(a_guid, UUID());
    SET a_debug := IFNULL(a_debug, 0);
    
    IF a_debug = 1 THEN
		SELECT 
			v_code_type_error_bad_data
            , v_id_type_error_bad_data
        ;
    END IF;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    
    CREATE TEMPORARY TABLE tmp_Product (
		id_category INT NOT NULL
		, id_product INT NOT NULL
        , name VARCHAR(255) NOT NULL
		, has_variations BIT NOT NULL
		, id_access_level_required INT NOT NULL
        , active BIT NOT NULL
        , display_order INT NOT NULL
        , can_view BIT NULL
        , can_edit BIT NULL
        , can_admin BIT NULL
        , name_error VARCHAR(255) NOT NULL
        , is_new BIT NOT NULL
    );
        
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
        -- , guid BINARY(36) NOT NULL
		, id_type INT NOT NULL
		/*
        CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        */
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
        
    
    -- Get data from Temp table
    INSERT INTO tmp_Product (
		id_category
        , id_product
        , name
        , has_variations
        , id_access_level_required
        , active
        , display_order
        , name_error
        , is_new
	)
    SELECT 
		IFNULL(P_T.id_category, P.id_category) AS id_category
        , IFNULL(P_T.id_product, 0) AS id_product
        , IFNULL(P_T.name, P.name) AS name
        , IFNULL(P_T.has_variations, P.has_variations) AS has_variations
        , IFNULL(P_T.id_access_level_required, P.id_access_level_required) AS id_access_level_required
        , IFNULL(P_T.active, P.active) AS active
        , IFNULL(P_T.display_order, P.display_order) AS display_order
        , IFNULL(P_T.name, IFNULL(P.name, IFNULL(P_T.id_product, '(No Product)'))) AS name_error
        , CASE WHEN IFNULL(P_T.id_product, 0) < 1 THEN 1 ELSE 0 END AS is_new
	FROM partsltd_prod.Shop_Product_Temp P_T
    LEFT JOIN partsltd_prod.Shop_Product P ON P_T.id_product = P.id_product
    ;
    
    -- Validation
    -- Missing mandatory fields    
    -- id_category
    IF EXISTS (SELECT * FROM tmp_Product t_P WHERE ISNULL(t_P.id_category) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, IFNULL(CONCAT('The following product(s) do not have a category: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')), 'NULL')
		FROM tmp_Product t_P
		WHERE ISNULL(t_P.id_category)
		;
	END IF;
    
    -- name
    IF EXISTS (SELECT * FROM tmp_Product t_P WHERE ISNULL(t_P.name) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, IFNULL(CONCAT('The following product(s) do not have a name: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')), 'NULL')
		FROM tmp_Product t_P
		WHERE ISNULL(t_P.name)
		;
	END IF;
    
    -- has_variations
    IF EXISTS (SELECT * FROM tmp_Product t_P WHERE ISNULL(t_P.has_variations) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, IFNULL(CONCAT('The following product(s) do not have a has-variations setting: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')), 'NULL')
		FROM tmp_Product t_P
		WHERE ISNULL(t_P.has_variations)
		;
	END IF;
    
    -- id_access_level_required
    IF EXISTS (SELECT * FROM tmp_Product t_P WHERE ISNULL(t_P.id_access_level_required) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, IFNULL(CONCAT('The following product(s) do not have a required access level ID: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')), 'NULL')
		FROM tmp_Product t_P
		WHERE ISNULL(t_P.id_access_level_required)
		;
	END IF;
    
    -- display_order
    IF EXISTS (SELECT * FROM tmp_Product t_P WHERE ISNULL(t_P.display_order) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, IFNULL(CONCAT('The following product(s) do not have a display order: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')), 'NULL')
		FROM tmp_Product t_P
		WHERE ISNULL(t_P.display_order)
		;
	END IF;
    
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN -- (SELECT * FROM tmp_Product WHERE is_new = 0 LIMIT 1) THEN
        SET v_ids_product_permission := (SELECT GROUP_CONCAT(id_product SEPARATOR ',') FROM tmp_Product WHERE is_new = 0);
        IF NOT ISNULL(v_ids_product_permission) THEN
			SET v_id_permission_product = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
			
			CALL partsltd_prod.p_shop_calc_user(
				a_guid
                , a_id_user
                , FALSE -- get_inactive_users
                , v_id_permission_product
                , v_id_access_level_edit
                , v_ids_product_permission
                , 0 -- debug
			);
			
			UPDATE tmp_Product t_P
			INNER JOIN Shop_Calc_User_Temp UE_T
				ON t_P.id_product = UE_T.id_product
				AND UE_T.GUID = a_guid
			SET 
				t_P.can_view = UE_T.can_view
				, t_P.can_edit = UE_T.can_edit
				, t_P.can_admin = UE_T.can_admin
			;
			
			CALL partsltd_prod.p_shop_clear_calc_user(
				a_guid
                , 0 -- debug
			);
		END IF;
    END IF;
    
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		START TRANSACTION;
            IF NOT ISNULL(v_ids_product_permission) THEN
                INSERT INTO partsltd_prod.Shop_Product_Change_Set ( comment )
                VALUES ( a_comment )
                ;
                
                SET v_id_change_set := LAST_INSERT_ID();
                
                UPDATE partsltd_prod.Shop_Product P
                INNER JOIN tmp_Product t_P ON P.id_product = t_P.id_product
                SET 
                    P.id_category = t_P.id_category
                    , P.name = t_P.name
                    , P.has_variations = t_P.has_variations
                    , P.id_access_level_required = t_P.id_access_level_required
                    , P.display_order = t_P.display_order
                    , P.id_change_set = v_id_change_set
                ;
            END IF;
            
            INSERT INTO partsltd_prod.Shop_Product (
                id_category
                , name
                , has_variations
                , id_access_level_required
                , display_order
                , created_by
                , created_on
            )
            SELECT
                t_P.id_category AS id_category
                , t_P.name AS name
                , t_P.has_variations AS has_variations
                , t_P.id_access_level_required AS id_access_level_required
                , t_P.display_order AS display_order
                , a_id_user AS created_by
                , v_time_start AS created_on
            FROM tmp_Product t_P
            WHERE is_new = 1
            ;
        
            DELETE FROM partsltd_prod.Shop_Product_Category_Temp
            WHERE GUID = a_guid;
		COMMIT;
    END IF;
    
    SELECT * 
    FROM tmp_Msg_Error t_ME
    INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
    ;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    
    IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;;



-- Clear previous proc
DROP PROCEDURE IF EXISTS partsltd_prod.p_shop_save_product_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_product_test ()
BEGIN
	
	DECLARE v_guid BINARY(36);
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_guid := 'nips';

	SELECT *
	FROM partsltd_prod.Shop_Product
	;
	SELECT *
	FROM partsltd_prod.Shop_Product_Temp
	;

	START TRANSACTION;
		
		INSERT INTO partsltd_prod.Shop_Product_Temp (
			id_product
			, id_category
			, name
			, has_variations
			, id_access_level_required
			, display_order
			, active
			, guid
		)
		VALUES (
			4 -- id_product
			, 1 -- id_category
			, 'Laptops' -- name
			, 0 -- has_variations
			, 2 -- id_access_level_required
			, 2 -- display_order
			, 1 -- active
			, v_guid
		);
		
	COMMIT;
    
	SELECT *
	FROM partsltd_prod.Shop_Product_Temp
	WHERE GUID = v_guid
    ;
    
    CALL partsltd_prod.p_shop_save_product ( 
		'Test save product' -- comment
        , v_guid -- guid
        , 1 -- id_user
		, 1 -- debug
    );
    
	SELECT *
	FROM partsltd_prod.Shop_Product
	;
	SELECT *
	FROM partsltd_prod.Shop_Product_Temp
	;
    
	CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
END //
DELIMITER ;;

/*
CALL partsltd_prod.p_shop_save_product_test ();

DELETE FROM partsltd_prod.Shop_Product_Temp;

DROP TABLE IF EXISTS tmp_Msg_Error;
*/-- USE partsltd_prod;

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_calc_product_permutation;

DELIMITER //
CREATE PROCEDURE p_shop_calc_product_permutation (
	IN a_id_user INT
    , IN a_get_all_product_category BIT
	, IN a_get_inactive_product_category BIT
	, IN a_ids_product_category TEXT
    , IN a_get_all_product BIT
	, IN a_get_inactive_product BIT
	, IN a_ids_product TEXT
    , IN a_get_all_product_permutation BIT
	, IN a_get_inactive_permutation BIT
	, IN a_ids_permutation TEXT
    , IN a_get_products_quantity_stock_below_min BIT
    , IN a_guid BINARY(36)
    , IN a_debug BIT
)
BEGIN
/*
	PROCEDURE p_shop_calc_product_permutation
	Shared filtering for product permutations
    
    select * FROM partsltd_prod.Shop_msg_error_type;
*/
    DECLARE v_has_filter_product_category BIT;
    DECLARE v_has_filter_product BIT;
    DECLARE v_has_filter_permutation BIT;
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission TEXT;
    DECLARE v_id_access_level_view INT;
    DECLARE v_id_minimum INT;
    DECLARE v_ids_product_invalid TEXT;
    DECLARE v_ids_category_invalid TEXT;
    DECLARE v_time_start TIMESTAMP(6);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_code_type_error_bad_data VARCHAR(50);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_id_access_level_view := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'VIEW');
    
    SELECT 
		MET.id_type
		, MET.code
	INTO
		v_id_type_error_bad_data
		, v_code_type_error_bad_data
	FROM partsltd_prod.Shop_Msg_Error_Type MET
	WHERE MET.code = 'BAD_DATA'
	;
    
    SET a_id_user := TRIM(IFNULL(a_id_user, 0));
    SET a_get_all_product_category := IFNULL(a_get_all_product_category, 0);
    SET a_get_inactive_product_category := IFNULL(a_get_inactive_product_category, 0);
    SET a_ids_product_category := TRIM(IFNULL(a_ids_product_category, ''));
    SET a_get_all_product := IFNULL(a_get_all_product, 0);
    SET a_get_inactive_product := IFNULL(a_get_inactive_product, 0);
    SET a_ids_product := TRIM(IFNULL(a_ids_product, ''));
    SET a_get_all_product_permutation := IFNULL(a_get_all_product_permutation, 0);
    SET a_get_inactive_permutation := IFNULL(a_get_inactive_permutation, 0);
    SET a_ids_permutation := TRIM(IFNULL(a_ids_permutation, ''));
    SET a_get_products_quantity_stock_below_min := IFNULL(a_get_products_quantity_stock_below_min, 0);
    -- SET a_guid := IFNULL(a_guid, UUID());
    SET a_debug := IFNULL(a_debug, 0);
    
    IF a_debug = 1 THEN
		SELECT 
			a_id_user
            , a_get_all_product_category, a_ids_product_category, a_get_inactive_product_category
            , a_get_all_product, a_get_inactive_product, a_ids_product
            , a_get_all_product_permutation, a_get_inactive_permutation, a_ids_permutation
            , a_get_products_quantity_stock_below_min
            , a_debug
		;
    END IF;
    
    -- Temporary tables
    -- DROP TEMPORARY TABLE IF EXISTS tmp_Split;
    DROP TEMPORARY TABLE IF EXISTS tmp_Category_calc;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product_calc;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation_calc;
    
    
    CREATE TEMPORARY TABLE tmp_Category_calc (
		id_category INT NOT NULL
        -- , active BIT NOT NULL
        -- display_order INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Product_calc (
		id_category INT NOT NULL
		, id_product INT NOT NULL
        -- active BIT NOT NULL
        -- display_order INT NOT NULL
        , can_view BIT
        , can_edit BIT
        , can_admin BIT
    );
    
    CREATE TEMPORARY TABLE tmp_Permutation_calc (
		id_permutation INT NULL
        -- id_category INT NOT NULL
		, id_product INT NOT NULL
        -- , active BIT NOT NULL
        -- , display_order INT NOT NULL
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
        -- , guid BINARY(36) NOT NULL
		, id_type INT NULL
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Split (
		substring VARCHAR(4000) NOT NULL
        , as_int INT NULL
	);
    DELETE FROM tmp_Split;
    
    -- Parse filters
    SET v_has_filter_product_category = CASE WHEN a_ids_product_category = '' THEN 0 ELSE 1 END;
    SET v_has_filter_product = CASE WHEN a_ids_product = '' THEN 0 ELSE 1 END;
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    
    CALL p_validate_guid ( a_guid );

	IF a_debug = 1 THEN
		SELECT
			v_has_filter_product_category
            , v_has_filter_product
            , v_has_filter_permutation
		;
    END IF;
    
    -- Categories
    IF TRUE THEN -- NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		CALL partsltd_prod.p_split(a_guid, a_ids_product_category, ',', a_debug);
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = a_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( a_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Product_Category PC ON t_S.as_int = PC.id_category 
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(PC.id_category)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- a_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive category IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Product_Category PC ON t_S.as_int = PC.id_category
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(PC.id_category)
				-- OR PC.active = 0
			;
		ELSE
			INSERT INTO tmp_Category_calc (
				id_category
			)
			SELECT 
				PC.id_category
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_Product_Category PC ON t_S.as_int = PC.id_category
			WHERE (
					a_get_all_product_category = 1
					OR (
						v_has_filter_product_category = 1
						AND FIND_IN_SET(PC.id_category, a_ids_product_category) > 0
					)
				)
				AND (
					a_get_inactive_product_category = 1
					OR PC.active = 1
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    -- Products
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		CALL partsltd_prod.p_split(a_guid, a_ids_product, ',', a_debug);
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = a_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( a_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Product P ON t_S.as_int = P.id_product
			WHERE 
				ISNULL(t_S.as_int)
                OR ISNULL(P.id_product)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- a_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive product IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Product P ON t_S.as_int = P.id_product
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(P.id_product)
				-- OR PC.active = 0
			;
		ELSE
			INSERT INTO tmp_Product_calc (
				id_category
				, id_product
			)
			SELECT 
				P.id_category
				, P.id_product
			FROM tmp_Split t_S
            RIGHT JOIN partsltd_prod.Shop_Product P ON t_S.as_int = P.id_product
			INNER JOIN tmp_Category_calc t_C ON P.id_category = t_C.id_category
			WHERE (
					a_get_all_product = 1
					OR (
						v_has_filter_product = 1
						AND FIND_IN_SET(P.id_product, a_ids_product) > 0
					)
				)
				AND (
					a_get_inactive_product = 1
					OR P.active = 1
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
        
	-- Permutations
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		CALL partsltd_prod.p_split(a_guid, a_ids_product, ',', a_debug);
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = a_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( a_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_S.as_int = PP.id_permutation
			WHERE 
				ISNULL(t_S.as_int)
                OR ISNULL(PP.id_permutation)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- a_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive permutation IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_S.as_int = PP.id_permutation
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(PP.id_permutation)
				-- OR PC.active = 0
			;
		ELSE
			INSERT INTO tmp_Permutation_calc (
				id_permutation
				-- id_category,
				, id_product
			)
			SELECT 
				PP.id_permutation
				-- P.id_category,
				, PP.id_product
			FROM tmp_Split t_S 
            RIGHT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_S.as_int = PP.id_permutation
			INNER JOIN tmp_Product_calc t_P ON PP.id_product = t_P.id_product
			WHERE (
					a_get_all_product_permutation = 1
					OR (
						v_has_filter_permutation = 1
						AND FIND_IN_SET(PP.id_permutation, a_ids_permutation) > 0
					)
					OR (
						a_get_products_quantity_stock_below_min = 1
						AND PP.quantity_stock < PP.quantity_min
					)
				)
				AND (
					a_get_inactive_permutation = 1
					OR PP.active = 1
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
	-- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (SELECT * FROM tmp_Product_calc LIMIT 1) THEN
			SET v_id_permission_product := (SELECT id_permission FROM partsltd_prod.Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
			SET v_ids_product_permission := (SELECT GROUP_CONCAT(id_product SEPARATOR ',') FROM tmp_Product_calc WHERE NOT ISNULL(id_product));
			
			IF a_debug = 1 THEN
				SELECT 
					a_guid AS a_guid
					, a_id_user
					, false AS a_get_inactive_user
					, v_id_permission_product AS a_ids_permission
					, v_id_access_level_view AS a_ids_access_level
					, v_ids_product_permission AS a_ids_product
				;
			END IF;
			
			CALL p_shop_calc_user(
				a_guid
                , a_id_user
                , false -- a_get_inactive_user
                , v_id_permission_product -- a_ids_permission
                , v_id_access_level_view -- a_ids_access_level
                , v_ids_product_permission -- a_ids_permutation
                , false -- a_debug
			);
			
			
			UPDATE tmp_Product_calc t_P
			INNER JOIN partsltd_prod.Shop_Calc_User_Temp UE_T
				ON t_P.id_product = UE_T.id_product
				AND UE_T.GUID = a_guid
			SET t_P.can_view = UE_T.can_view,
				t_P.can_edit = UE_T.can_edit,
				t_P.can_admin = UE_T.can_admin
			;
			
			IF a_debug = 1 THEN
				SELECT * 
                FROM partsltd_prod.Shop_Calc_User_Temp
                WHERE GUID = a_guid
                ;
			END IF;
			
			SET v_ids_product_invalid := (
				SELECT GROUP_CONCAT(t_P.id_product SEPARATOR ',') 
				FROM tmp_Product_calc t_P
				WHERE ISNULL(t_P.can_view)
			);
			SET v_ids_category_invalid := (
				SELECT GROUP_CONCAT(t_P.id_category SEPARATOR ',') 
				FROM (SELECT DISTINCT id_category, id_product, can_view FROM tmp_Product_calc) t_P
				WHERE ISNULL(t_P.can_view)
			);
			
			DELETE 
			FROM tmp_Category_calc t_C
			WHERE FIND_IN_SET(t_C.id_category, v_ids_category_invalid) > 0
			;
			
			DELETE 
			FROM tmp_Product_calc t_P
			WHERE FIND_IN_SET(t_P.id_product, v_ids_product_invalid) > 0
			;
			
			DELETE
			FROM tmp_Permutation_calc t_PP
			WHERE FIND_IN_SET(t_PP.id_product, v_ids_product_invalid) > 0
			;
			
			CALL p_shop_clear_calc_user( a_guid, a_debug );
		END IF;
    END IF;
    
	IF a_debug = 1 THEN
		SELECT * FROM tmp_Category_calc;
		SELECT * FROM tmp_Product_calc;
		SELECT * FROM tmp_Permutation_calc;
	END IF;
    
    -- Transaction
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
	/*
	DELETE FROM tmp_Category_calc;
		DELETE FROM tmp_Product_calc;
		DELETE FROM tmp_Permutation_calc;
    ELSE
    */
		START TRANSACTION; 
		
			# Categories
			INSERT INTO Shop_Product_Category_Temp (
				id_category
				, code
				, name
				, description
				, id_access_level_required
				, display_order
				, active
				, can_view
				, can_edit
				, can_admin
				, guid
			)
			SELECT 
				t_C.id_category
				, PC.code
				, PC.name
				, PC.description
				, PC.id_access_level_required
				, PC.display_order
				, PC.active
				, MIN(IFNULL(t_P.can_view, 0)) AS can_view
				, MIN(IFNULL(t_P.can_edit, 0)) AS can_edit
				, MIN(IFNULL(t_P.can_admin, 0)) AS can_admin
				, a_guid
			FROM tmp_Category_calc t_C
			INNER JOIN partsltd_prod.Shop_Product_Category PC ON t_C.id_category = PC.id_category
			LEFT JOIN tmp_Product_calc t_P ON t_C.id_category = t_P.id_product
			GROUP BY PC.id_category
			;
			
			# Products
			INSERT INTO Shop_Product_Temp (
				id_product
				, id_category
				, name
				, has_variations
				, id_access_level_required
				, display_order
				, active
				, can_view
				, can_edit
				, can_admin
				, guid
			)
			SELECT 
				t_P.id_product
				, P.id_category
				, P.name
				, P.has_variations
				, P.id_access_level_required
				, P.display_order
				, P.active
				, t_P.can_view
				, t_P.can_edit
				, t_P.can_admin
				, a_guid
			FROM tmp_Product_calc t_P
			INNER JOIN partsltd_prod.Shop_Product P ON t_P.id_product = P.id_product
			INNER JOIN tmp_Category_calc t_C ON t_P.id_category = t_C.id_category
			INNER JOIN partsltd_prod.Shop_Access_Level AL ON P.id_access_level_required = AL.id_access_level
			GROUP BY P.id_product, t_P.can_view, t_P.can_edit, t_P.can_admin
			;
			
			# Product Permutations
			INSERT INTO Shop_Product_Permutation_Temp (
				id_permutation
				, id_product
				, description
				, cost_local
				, id_currency_cost
				, profit_local_min
				, latency_manufacture_days
				, id_unit_measurement_quantity
				, count_unit_measurement_per_quantity_step
				, quantity_min
				, quantity_max
				, quantity_stock
				, is_subscription
				, id_unit_measurement_interval_recurrence
				, count_interval_recurrence
				, id_stripe_product
				, does_expire_faster_once_unsealed
				, id_unit_measurement_interval_expiration_unsealed
				, count_interval_expiration_unsealed
				, active
				, can_view
				, can_edit
				, can_admin
				, guid
			)
			SELECT 
				t_PP.id_permutation
				, PP.id_product
				, PP.description
				, PP.cost_local
				, PP.id_currency_cost
				, PP.profit_local_min
				, PP.latency_manufacture_days
				, PP.id_unit_measurement_quantity
				, PP.count_unit_measurement_per_quantity_step
				, PP.quantity_min
				, PP.quantity_max
				, PP.quantity_stock
				, PP.is_subscription
				, PP.id_unit_measurement_interval_recurrence
				, PP.count_interval_recurrence
				, PP.id_stripe_product
				, PP.does_expire_faster_once_unsealed
				, PP.id_unit_measurement_interval_expiration_unsealed
				, PP.count_interval_expiration_unsealed
				, PP.active
				, IFNULL(t_P.can_view, 0) AS can_view
				, IFNULL(t_P.can_edit, 0) AS can_edit
				, IFNULL(t_P.can_admin, 0) AS can_admin
				, a_guid
			FROM tmp_Permutation_calc t_PP
			INNER JOIN partsltd_prod.Shop_Product_Permutation PP ON t_PP.id_permutation = PP.id_permutation
			INNER JOIN tmp_Product_calc t_P ON t_PP.id_product = t_P.id_product
			INNER JOIN partsltd_prod.Shop_Product P ON t_PP.id_product = P.id_product
			INNER JOIN partsltd_prod.Shop_Product_Category PC ON P.id_category = PC.id_category
			LEFT JOIN partsltd_prod.Shop_Product_Permutation_Variation_Link PPVL ON PP.id_permutation = PPVL.id_permutation
			LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM_Q ON PP.id_unit_measurement_quantity = UM_Q.id_unit_measurement
			LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM_R ON PP.id_unit_measurement_interval_recurrence = UM_R.id_unit_measurement
			LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM_X ON PP.id_unit_measurement_interval_expiration_unsealed = UM_X.id_unit_measurement
			INNER JOIN partsltd_prod.Shop_Currency C ON PP.id_currency_cost = C.id_currency
			GROUP BY PP.id_permutation, t_P.can_view, t_P.can_edit, t_P.can_admin
			;
			
		COMMIT;
    END IF;
    
    /*
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
    INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    WHERE guid = a_guid
    ;
    */
    
    IF a_debug = 1 THEN
		SELECT *
        FROM tmp_Msg_Error
        ;
        
        SELECT *
        FROM partsltd_prod.Shop_Product_Category_Temp
        WHERE GUID = a_guid
        ;
        SELECT *
        FROM partsltd_prod.Shop_Product_Temp
        WHERE GUID = a_guid
        ;
        SELECT *
        FROM partsltd_prod.Shop_Product_Permutation_Temp
        WHERE GUID = a_guid
        ;
        
        CALL p_shop_clear_calc_product_permutation ( a_guid );
    END IF;
    
    -- Clean up
    -- DROP TEMPORARY TABLE IF EXISTS tmp_Split;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation_calc;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product_calc;
    DROP TEMPORARY TABLE IF EXISTS tmp_Category_calc;
    
    IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;;


/*

CALL partsltd_prod.p_shop_calc_product_permutation (
	1 #'auth0|6582b95c895d09a70ba10fef', # a_id_user
    , 1 # a_get_all_product_category
	, 0 # a_get_inactive_product_category
	, '' # a_ids_product_category
    , 1 # a_get_all_product
	, 0 # a_get_inactive_product
	, '' # a_ids_product
    , 1 # a_get_all_product_permutation
	, 0 # a_get_inactive_permutation
	, '' # a_ids_permutation
    , 0 # a_get_products_quantity_stock_below_minimum
    , 'NIPS                                ' # a_guid
    , 0 # a_debug
);


        SELECT *
        FROM partsltd_prod.Shop_Product_Category_Temp
        WHERE GUID = 'NIPS                                '
        ;
        SELECT *
        FROM partsltd_prod.Shop_Product_Temp
        WHERE GUID = 'NIPS                                '
        ;
        SELECT *
        FROM partsltd_prod.Shop_Product_Permutation_Temp
        WHERE GUID = 'NIPS                                '
        ;
        
        CALL p_shop_clear_calc_product_permutation ( 'NIPS                                ' );
        
        SELECT *
        FROM partsltd_prod.Shop_Product_Category_Temp
        WHERE GUID = 'NIPS                                '
        ;
        SELECT *
        FROM partsltd_prod.Shop_Product_Temp
        WHERE GUID = 'NIPS                                '
        ;
        SELECT *
        FROM partsltd_prod.Shop_Product_Permutation_Temp
        WHERE GUID = 'NIPS                                '
        ;
        
*/-- 
USE partsltd_prod;

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_product;

DELIMITER //
CREATE PROCEDURE p_shop_get_many_product (
	IN a_id_user INT
    , IN a_get_all_product_category BIT
	, IN a_get_inactive_product_category BIT
	, IN a_ids_product_category VARCHAR(500)
    , IN a_get_all_product BIT
	, IN a_get_inactive_product BIT
	, IN a_ids_product VARCHAR(500)
    , IN a_get_all_product_permutation BIT
	, IN a_get_inactive_permutation BIT
	, IN a_ids_permutation VARCHAR(4000)
    , IN a_get_all_image BIT
	, IN a_get_inactive_image BIT
    , IN a_ids_image VARCHAR(4000)
    , IN a_get_products_quantity_stock_below_min BIT
    , IN a_debug BIT
)
BEGIN
    
	-- Argument redeclaration
	-- Variable declaration
    # DECLARE v_has_filter_product_category BIT;
    # DECLARE v_has_filter_product BIT;
    # DECLARE v_has_filter_permutation BIT;
    DECLARE v_has_filter_image BIT;
    DECLARE v_guid BINARY(36);
    # DECLARE v_id_user VARCHAR(100);
    -- DECLARE v_ids_permutation_unavailable VARCHAR(4000);
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission VARCHAR(4000);
    -- DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    -- DECLARE v_now DATETIME;
    DECLARE v_id_minimum INT;
    DECLARE v_ids_product_invalid VARCHAR(4000);
    DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'VIEW');
    
    
	-- Argument validation + default values
    SET a_id_user := IFNULL(a_id_user, 0);
    SET a_get_all_product_category := IFNULL(a_get_all_product_category, 0);
    SET a_get_inactive_product_category := IFNULL(a_get_inactive_product_category, 0);
    SET a_ids_product_category := TRIM(IFNULL(a_ids_product_category, ''));
    SET a_get_all_product := IFNULL(a_get_all_product, 0);
    SET a_get_inactive_product := IFNULL(a_get_inactive_product, 0);
    SET a_ids_product := TRIM(IFNULL(a_ids_product, ''));
    SET a_get_all_product_permutation := IFNULL(a_get_all_product_permutation, 0);
    SET a_get_inactive_permutation := IFNULL(a_get_inactive_permutation, 0);
    SET a_ids_permutation := TRIM(IFNULL(a_ids_permutation, ''));
    SET a_get_all_image := IFNULL(a_get_all_image, 0);
    SET a_get_inactive_image := IFNULL(a_get_inactive_image, 0);
    SET a_ids_image := TRIM(IFNULL(a_ids_image, ''));
    SET a_get_products_quantity_stock_below_min := IFNULL(a_get_products_quantity_stock_below_min, 0);
    SET a_debug := IFNULL(a_debug, 0);
    
    IF a_debug = 1 THEN
		SELECT 
			a_id_user
            , a_get_all_product_category, a_ids_product_category, a_get_inactive_product_category
            , a_get_all_product, a_get_inactive_product, a_ids_product
            , a_get_all_product_permutation, a_get_inactive_permutation, a_ids_permutation
            , a_get_all_image, a_get_inactive_image, a_ids_image
            , a_get_products_quantity_stock_below_min
            , a_debug
		;
    END IF;
    
    -- Temporary tables
    DROP TEMPORARY TABLE IF EXISTS tmp_Split;
    DROP TEMPORARY TABLE IF EXISTS tmp_Image;
    DROP TEMPORARY TABLE IF EXISTS tmp_Category;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    
    CREATE TEMPORARY TABLE tmp_Category (
		id_category INT NOT NULL
        /*
        active BIT NOT NULL
        */
        , display_order INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Product (
		id_category INT NOT NULL
		, id_product INT NOT NULL
        , display_order INT NOT NULL
        /*
        active BIT NOT NULL,
        */
        , can_view BIT
        , can_edit BIT
        , can_admin BIT
    );
    
    CREATE TEMPORARY TABLE tmp_Permutation (
		id_permutation INT NULL
        -- id_category INT NOT NULL,
		, id_product INT NOT NULL
        -- , active BIT NOT NULL
        -- , display_order INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Image (
		id_image INT NOT NULL
		-- id_product INT NOT NULL,
		, id_permutation INT NULL
        /*
        active BIT NOT NULL
        display_order INT NOT NULL
        -- rank_in_product_permutation INT NOT NULL
        */
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        -- guid BINARY(36) NOT NULL,
		id_type INT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Split (
		substring VARCHAR(4000) NOT NULL
        , as_int INT NULL
	);
    DELETE FROM tmp_Split;
    
    
    -- Parse filters
    -- CALL p_validate_guid ( v_guid );
    -- SET v_has_filter_product_category = CASE WHEN a_ids_product_category = '' THEN 0 ELSE 1 END;
    -- SET v_has_filter_product = CASE WHEN a_ids_product = '' THEN 0 ELSE 1 END;
    -- SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_image = CASE WHEN a_ids_image = '' THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
    CALL partsltd_prod.p_shop_calc_product_permutation (
		a_id_user
		, a_get_all_product_category
		, a_get_inactive_product_category
		, a_ids_product_category
		, a_get_all_product
		, a_get_inactive_product
		, a_ids_product
		, a_get_all_product_permutation
		, a_get_inactive_permutation
		, a_ids_permutation
		, a_get_products_quantity_stock_below_min 
		, v_guid -- a_guid
		, 0 -- a_debug 
    );
    
	INSERT INTO tmp_Category (
		id_category
        /*
        active,
        */
        , display_order
	)
    SELECT 
		PC.id_category
        /*
        PC.active,
		*/
        , PC.display_order
	FROM (SELECT * FROM partsltd_prod.Shop_Product_Category_Temp WHERE GUID = v_guid) PC_T 
    INNER JOIN partsltd_prod.Shop_Product_Category PC ON PC_T.id_category = PC.id_category
    ;
    
	INSERT INTO tmp_Product (
		id_product
		, id_category
        /*
        active
        */
        , display_order
	)
    SELECT 
		P.id_product
		, P.id_category
        -- P.active,
        , P.display_order
	FROM (SELECT * FROM partsltd_prod.Shop_Product_Temp WHERE GUID = v_guid) P_T 
    INNER JOIN partsltd_prod.Shop_Product P ON P.id_product = P_T.id_product
    ;
    
	INSERT INTO tmp_Permutation (
		id_permutation
		-- id_category,
		, id_product
        -- , active
        -- , display_order
	)
    SELECT 
		PP.id_permutation
		-- P.id_category,
		, PP.id_product
        -- , PP.active
        -- , RANK() OVER (ORDER BY VT.display_order, V.display_order)
	FROM (SELECT * FROM partsltd_prod.Shop_Product_Permutation_Temp WHERE GUID = v_guid) PP_T
    INNER JOIN partsltd_prod.Shop_Product_Permutation PP ON PP_T.id_permutation = PP.id_permutation
    ;
    
    # Product Images
    IF (v_has_filter_image = 1 AND NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1)) THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_image, ',', a_debug);
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( v_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Product_Image I ON t_S.as_int = I.id_image
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(I.id_image)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- v_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive image IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Product_Image I ON t_S.as_int = I.id_image
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(I.id_image)
				-- OR PC.active = 0
			;
		ELSE
			INSERT INTO tmp_Image (
				id_image
                , id_permutation
			)
			SELECT 
				I.id_image
                , I.id_permutation
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_Product_Image I ON t_S.as_int = I.id_image
            INNER JOIN tmp_Permutation t_PP ON I.id_permutation = t_PP.id_permutation
			WHERE 
				(
					a_get_all_image = 1
					OR NOT ISNULL(t_S.as_int)
				)
				AND (
					a_get_inactive_image = 1
					OR I.active = 1
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    -- Outputs
    # Categories
    SELECT 
		-- DISTINCT 
        t_C.id_category
        , PC.code
        , PC.name
        , PC.description
        , PC.id_access_level_required
		, AL.name AS name_access_level_required
        , PC.display_order
        , PC.active
        , MIN(t_P.can_view) AS can_view
        , MIN(t_P.can_edit) AS can_edit
        , MIN(t_P.can_admin) AS can_admin
    FROM tmp_Category t_C
    INNER JOIN partsltd_prod.Shop_Product_Category PC ON t_C.id_category = PC.id_category
    LEFT JOIN tmp_Product t_P ON t_C.id_category = t_P.id_product
    INNER JOIN partsltd_prod.Shop_Access_Level AL ON PC.id_access_level_required = AL.id_access_level
	GROUP BY t_C.id_category -- , t_P.id_product
	ORDER BY PC.display_order
	;
    
    # Products
    SELECT 
		t_P.id_product,
        P.id_category,
        P.name,
        P.has_variations,
        P.id_access_level_required,
		AL.name AS name_access_level_required,
        P.active,
        P.display_order,
        t_P.can_view,
        t_P.can_edit,
        t_P.can_admin
    FROM tmp_Product t_P
    INNER JOIN partsltd_prod.Shop_Product P ON t_P.id_product = P.id_product
    INNER JOIN tmp_Category t_C ON t_P.id_category = t_C.id_category
    INNER JOIN partsltd_prod.Shop_Access_Level AL ON P.id_access_level_required = AL.id_access_level
    GROUP BY t_P.id_category, t_C.display_order, t_P.id_product, t_P.can_view, t_P.can_edit, t_P.can_admin
	ORDER BY t_C.display_order, P.display_order
	;
    
    # Product Permutations
    SELECT 
		t_PP.id_permutation,
		PP.id_product,
        P.id_category,
        PP.description,
        PP.cost_local,
        PP.id_currency_cost,
        C.code AS code_currency_cost,
        C.symbol AS symbol_currency_cost,
        PP.profit_local_min,
        PP.latency_manufacture_days,
        PP.id_unit_measurement_quantity,
        UM_Q.symbol AS symbol_unit_measurement_quantity,
        UM_Q.symbol_is_suffix_not_prefix AS symbol_is_suffix_not_prefix_unit_measurement_quantity,
        UM_Q.name_singular AS name_singular_unit_measurement_quantity,
        UM_Q.name_plural AS name_plural_unit_measurement_quantity,
        PP.count_unit_measurement_per_quantity_step,
        PP.quantity_min,
        PP.quantity_max,
        PP.quantity_stock,
        PP.is_subscription,
        PP.id_unit_measurement_interval_recurrence,
        UM_R.symbol AS symbol_unit_measurement_interval_recurrence,
        UM_R.symbol_is_suffix_not_prefix AS symbol_is_suffix_not_prefix_unit_measurement_interval_recurrence,
        UM_R.name_singular AS name_singular_unit_measurement_interval_recurrence,
        UM_R.name_plural AS name_plural_unit_measurement_interval_recurrence,
        PP.count_interval_recurrence,
        PP.id_stripe_product,
        PP.does_expire_faster_once_unsealed,
        PP.id_unit_measurement_interval_expiration_unsealed,
        UM_X.symbol AS symbol_unit_measurement_interval_expiration_unsealed,
        UM_X.symbol_is_suffix_not_prefix AS symbol_is_suffix_not_prefix_unit_measurement_interval_expiration_unsealed,
        UM_X.name_singular AS name_singular_unit_measurement_interval_expiration_unsealed,
        UM_X.name_plural AS name_plural_unit_measurement_interval_expiration_unsealed,
        PP.count_interval_expiration_unsealed,
        NOT ISNULL(PPVL.id_permutation) AS has_variations,
        PP.active,
        -- PP.display_order,
        IFNULL(t_P.can_view, 0) AS can_view,
        IFNULL(t_P.can_edit, 0) AS can_edit,
        IFNULL(t_P.can_admin, 0) AS can_admin
    FROM tmp_Permutation t_PP
    INNER JOIN partsltd_prod.Shop_Product_Permutation PP ON t_PP.id_permutation = PP.id_permutation
    INNER JOIN tmp_Product t_P ON t_PP.id_product = t_P.id_product
    INNER JOIN partsltd_prod.Shop_Product P ON t_PP.id_product = P.id_product
    INNER JOIN partsltd_prod.Shop_Product_Category PC ON P.id_category = PC.id_category
    LEFT JOIN partsltd_prod.Shop_Product_Permutation_Variation_Link PPVL ON PP.id_permutation = PPVL.id_permutation
	LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM_Q ON PP.id_unit_measurement_quantity = UM_Q.id_unit_measurement
	LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM_R ON PP.id_unit_measurement_interval_recurrence = UM_R.id_unit_measurement
	LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM_X ON PP.id_unit_measurement_interval_expiration_unsealed = UM_X.id_unit_measurement
    INNER JOIN partsltd_prod.Shop_Currency C ON PP.id_currency_cost = C.id_currency
    GROUP BY PC.id_category, P.id_product, PP.id_permutation, t_P.can_view, t_P.can_edit, t_P.can_admin
	ORDER BY PC.display_order, P.display_order -- , t_PP.display_order
	;
    
    # Variations
    SELECT 
		V.id_variation
        , V.id_type
        , V.code AS code_variation
        , V.name AS name_variation
		, V.display_order AS display_order_variation
        , V.active AS active_variation
        , VT.code AS code_variation_type
        , VT.name AS name_variation_type
        , VT.name_plural AS name_plural_variation_type
		, VT.display_order AS display_order_variation_type
        , VT.active AS active_variation_type
        , t_P.id_product
        , t_PP.id_permutation
        , t_C.id_category
    FROM partsltd_prod.Shop_Variation V
	INNER JOIN partsltd_prod.Shop_Variation_Type VT ON V.id_type = VT.id_type
    INNER JOIN partsltd_prod.Shop_Product_Permutation_Variation_Link PPVL ON V.id_variation = PPVL.id_variation
	INNER JOIN tmp_Permutation t_PP ON PPVL.id_permutation = t_PP.id_permutation
	INNER JOIN tmp_Product t_P ON t_PP.id_product = t_P.id_product
	INNER JOIN tmp_Category t_C ON t_P.id_category = t_C.id_category
	WHERE 
		V.active
		AND PPVL.active
	;
    
    # Images
    SELECT 
		t_I.id_image,
        t_PP.id_product,
		t_I.id_permutation,
        t_C.id_category,
        I.url,
        I.active,
        I.display_order
    FROM tmp_Image t_I
    INNER JOIN partsltd_prod.Shop_Product_Image I ON t_I.id_image = I.id_image
	INNER JOIN tmp_Permutation t_PP ON t_I.id_permutation = t_PP.id_permutation
    INNER JOIN tmp_Product t_P ON t_PP.id_product = t_P.id_product
    INNER JOIN tmp_Category t_C ON t_P.id_category = t_C.id_category
	ORDER BY t_C.display_order, t_P.display_order, I.display_order
	;
    
    # Errors
    SELECT *
    /*
		t_ME.display_order,
		t_ME.guid,
        t_ME.id_type,
        t_ME.msg,
        MET.code, 
        MET.name,
        MET.description
	*/
    FROM tmp_Msg_Error t_ME
    INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
    -- WHERE guid = v_guid
    ;
    
    
    -- Clean up
    DROP TEMPORARY TABLE IF EXISTS tmp_Split;
    DROP TEMPORARY TABLE IF EXISTS tmp_Image;
    DROP TEMPORARY TABLE IF EXISTS tmp_Category;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    
	CALL partsltd_prod.p_shop_clear_calc_product_permutation ( v_guid );
    
    IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;;


/*

CALL partsltd_prod.p_shop_get_many_product (
	1 #'auth0|6582b95c895d09a70ba10fef', # a_id_user
    , 1 # a_get_all_product_category
	, 0 # a_get_inactive_product_category
	, '' # a_ids_product_category
    , 1 # a_get_all_product
	, 0 # a_get_inactive_product
	, '' # a_ids_product
    , 1 # a_get_all_product_permutation
	, 0 # a_get_inactive_permutation
	, '' # a_ids_permutation
    , 1 # a_get_all_image
    , 0 # a_get_inactive_image
	, '' # a_ids_image
    , 0 # a_get_products_quantity_stock_below_minimum
    , 0 # a_debug
);

select * FROM partsltd_prod.Shop_Calc_User_Temp;

select * FROM partsltd_prod.Shop_Product_Category;
select * FROM partsltd_prod.Shop_Product_Permutation;
select * FROM partsltd_prod.Shop_product_change_set;
insert into shop_product_change_set ( comment ) values ('set stock quantities below minimum for testing');
update shop_product_permutation
set quantity_stock = 0,
	id_change_set = (select id_change_set FROM partsltd_prod.Shop_product_change_set order by id_change_set desc limit 1)
where id_permutation < 5

DROP TABLE IF EXISTS tmp_Msg_Error;

select * FROM partsltd_prod.Shop_image;
select * FROM partsltd_prod.Shop_product;
select * from TMP_MSG_ERROR;
DROP TABLE TMP_MSG_ERROR;

insert into shop_product_change_set (comment)
    values ('set product not subscription - test bool output to python');
    update shop_product
    set is_subscription = 0,
		id_change_set = (select id_change_set FROM partsltd_prod.Shop_product_change_set order by id_change_set desc limit 1)
    where id_product = 1

select * FROM partsltd_prod.Shop_Calc_User_Temp;
select distinct guid 
-- DELETE
FROM partsltd_prod.Shop_Calc_User_Temp;
*/



/*

CALL p_shop_get_many_stripe_product_new (
	''
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_stripe_product_new;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_stripe_product_new (
	IN a_id_user INT
)
BEGIN
    DECLARE v_has_filter_user BIT;
    DECLARE v_code_error_data VARCHAR(200);
    DECLARE v_code_error_permission VARCHAR(200);
    DECLARE v_guid BINARY(36);
    
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
		id_user INT NOT NULL PRIMARY KEY,
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
        guid BINARY(36) NOT NULL,
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
		CALL p_shop_calc_user (
			v_guid, # a_guid
			a_id_user, 	# a_id_user
			0,		# a_get_inactive_users
			CONVERT((SELECT id_permission FROM Shop_Permission WHERE 'STORE_ADMIN' = code), CHAR),		# a_ids_permission
			(SELECT id_access_level FROM Shop_Access_Level WHERE code = 'ADMIN' AND active),		# a_ids_access_level
			(SELECT GROUP_CONCAT(id_product SEPARATOR ',') From tmp_Shop_Product),		# a_ids_product
			(SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') From tmp_Shop_Product)		# a_ids_permutation --  WHERE NOT ISNULL(id_permutation)
		);
        
        IF EXISTS (SELECT can_admin FROM Shop_Calc_User_Temp WHERE guid = v_guid AND NOT can_admin) THEN
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
        
        DELETE FROM Shop_Calc_User_Temp
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
DELIMITER ;;


/*
CALL p_shop_get_many_stripe_product_new (
	''
);

CALL p_shop_get_many_stripe_product_new (
	'auth0|6582b95c895d09a70ba10fef'
);



select * from shop_product;
select * from shop_product_permutation_variation_link;

CALL p_shop_calc_user (
			'ead789a1-c7ac-11ee-a256-b42e9986184a', # a_guid
			'auth0|6582b95c895d09a70ba10fef', 	# a_id_user
			0,		# a_get_inactive_users
			'4',		# a_ids_permission
			'3',		# a_ids_access_level
			'1',		# a_ids_product
			'1'		# a_ids_permutation --  WHERE NOT ISNULL(id_permutation)
		);
        
*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_permutation;
DROP PROCEDURE IF EXISTS p_shop_save_product_permutation;

DELIMITER //
CREATE PROCEDURE p_shop_save_product_permutation (
    IN a_comment VARCHAR(500),
	IN a_guid BINARY(36),
    IN a_id_user INT
)
BEGIN
    
	DECLARE v_code_type_error_bad_data VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission LONGTEXT;
    DECLARE v_id_change_set INT;
    DECLARE v_id_access_level_edit INT;
    DECLARE v_now DATETIME;
    
    DECLARE exit handler for SQLEXCEPTION
    BEGIN
        -- Get diagnostic information
        GET DIAGNOSTICS CONDITION 1
            @sqlstate = RETURNED_SQLSTATE
            , @errno = MYSQL_ERRNO
            , @text = MESSAGE_TEXT
		;
        
        -- Rollback the transaction
        ROLLBACK;
        
        -- Select the error information
        -- SELECT 'Error' AS status, @errno AS error_code, @sqlstate AS sql_state, @text AS message;
        
		CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
			display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
			, guid BINARY(36) NOT NULL
			, id_type INT NULL
			, code VARCHAR(50) NOT NULL
			, msg VARCHAR(4000) NOT NULL
		);
        INSERT INTO tmp_Msg_Error (
			guid
            , id_type
            , code
            , msg
		)
        SELECT 
			a_guid
            , NULL
            , @errno
            , @text
		;
        SELECT *
        FROM tmp_Msg_Error;
		DROP TABLE IF EXISTS tmp_Msg_Error;
    END;
    
    SET v_code_type_error_bad_data := 'BAD_DATA';
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_id_access_level_edit := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
    SET a_guid := IFNULL(a_guid, UUID());
    
    DROP TABLE IF EXISTS tmp_Permutation;
    
    CREATE TEMPORARY TABLE tmp_Permutation (
		id_permutation INT NOT NULL
		, id_product INT NOT NULL
		, description VARCHAR(4000) NOT NULL
		, cost_local FLOAT NOT NULL
		, id_currency_cost INT NOT NULL
		, profit_local_min FLOAT NOT NULL
		, latency_manufacture_days INT NOT NULL
		, id_unit_measurement_quantity INT NOT NULL
		, count_unit_measurement_per_quantity_step FLOAT NOT NULL
		, quantity_min FLOAT NOT NULL
		, quantity_max FLOAT NOT NULL
		, quantity_stock FLOAT NOT NULL
		, is_subscription BIT NOT NULL
		, id_unit_measurement_interval_recurrence INT
		, count_interval_recurrence INT
		, id_stripe_product VARCHAR(100) NULL
		, does_expire_faster_once_unsealed BIT NOT NULL
		, id_unit_measurement_interval_expiration_unsealed INT
		, count_interval_expiration_unsealed INT
		, active BIT NOT NULL DEFAULT 1
        , can_view BIT NULL
        , can_edit BIT NULL
        , can_admin BIT NULL
        , name_error VARCHAR(255) NOT NULL
        , is_new BIT NOT NULL
    );
        
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
        , guid BINARY(36) NOT NULL
		, id_type INT NULL
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
        
    
    -- Get data from Temp table
    INSERT INTO tmp_Permutation (
		id_permutation
		, id_product
		, description
		, cost_local
		, id_currency_cost
		, profit_local_min
		, latency_manufacture_days
		, id_unit_measurement_quantity
		, count_unit_measurement_per_quantity_step
		, quantity_min
		, quantity_max
		, quantity_stock
		, is_subscription
		, id_unit_measurement_interval_recurrence
		, count_interval_recurrence
		, id_stripe_product
		, does_expire_faster_once_unsealed
		, id_unit_measurement_interval_expiration_unsealed
		, count_interval_expiration_unsealed
		, active
        , name_error
        , is_new
	)
    SELECT 
		PP_T.id_permutation
		, IFNULL(PP_T.id_product, PP.id_product) AS id_product
        , IFNULL(PP_T.description, PP.description) AS description
		, IFNULL(PP_T.cost_local, PP.cost_local) AS cost_local
		, IFNULL(PP_T.id_currency_cost, PP.id_currency_cost) AS a_id_currency_cost
		, IFNULL(PP_T.profit_local_min, PP.profit_local_min) AS profit_local_min
		, IFNULL(PP_T.latency_manufacture_days, PP.latency_manufacture_days) AS latency_manufacture_days
		, IFNULL(PP_T.id_unit_measurement_quantity, PP.id_unit_measurement_quantity) AS id_unit_measurement_quantity
		, IFNULL(PP_T.count_unit_measurement_per_quantity_step, PP.count_unit_measurement_per_quantity_step) AS count_unit_measurement_per_quantity_step
		, IFNULL(PP_T.quantity_min, PP.quantity_min) AS quantity_min
		, IFNULL(PP_T.quantity_max, PP.quantity_max) AS quantity_max
		, IFNULL(PP_T.quantity_stock, PP.quantity_stock) AS quantity_stock
		, IFNULL(PP_T.is_subscription, PP.is_subscription) AS is_subscription
		, IFNULL(PP_T.id_unit_measurement_interval_recurrence, PP.id_unit_measurement_interval_recurrence) AS id_unit_measurement_interval_recurrence
		, IFNULL(PP_T.count_interval_recurrence, PP.count_interval_recurrence) AS count_interval_recurrence
		, IFNULL(PP_T.id_stripe_product, PP.id_stripe_product) AS id_stripe_product
		, IFNULL(PP_T.does_expire_faster_once_unsealed, PP.does_expire_faster_once_unsealed) AS does_expire_faster_once_unsealed
		, IFNULL(PP_T.id_unit_measurement_interval_expiration_unsealed, PP.id_unit_measurement_interval_expiration_unsealed) AS id_unit_measurement_interval_expiration_unsealed
		, IFNULL(PP_T.count_interval_expiration_unsealed, PP.count_interval_expiration_unsealed) AS count_interval_expiration_unsealed
        , IFNULL(PP_T.active, PP.active) AS active
		, fn_shop_get_product_permutation_name(PP_T.id_permutation)
        , CASE WHEN IFNULL(PP_T.id_permutation, 0) < 1 THEN 1 ELSE 0 END AS is_new
	FROM Shop_Product_Permutation_Temp PP_T
    LEFT JOIN Shop_Product_Permutation PP ON PP_T.id_permutation = PP.id_permutation
    WHERE PP_T.guid = a_guid
    ;
    
    -- Validation
    -- Missing mandatory fields
    -- id_product
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.id_product) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, id_product
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a product: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.id_product)
		;
    END IF;
    -- cost_local
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.cost_local) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, cost_local
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a local cost: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.cost_local)
		;
    END IF;
    -- profit_local_min 
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.profit_local_min) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, profit_local_min
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a local minimum profit: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.profit_local_min)
		;
    END IF;
    -- 	latency_manufacture_days
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.latency_manufacture_days) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, latency_manufacture_days
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a manufacturing latency: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.latency_manufacture_days)
		;
    END IF;
    -- id_unit_measurement_quantity
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.id_unit_measurement_quantity) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, id_unit_measurement_quantity
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a unit measurement for stock quantities: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.id_unit_measurement_quantity)
		;
    END IF;
    -- 	count_unit_measurement_per_quantity_step
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.count_unit_measurement_per_quantity_step) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, count_unit_measurement_per_quantity_step
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a count unit measurement per quantity step: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.count_unit_measurement_per_quantity_step)
		;
    END IF;
    -- quantity_min
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.quantity_min) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, quantity_min
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a minimum quantity: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.quantity_min)
		;
    END IF;
    -- 	quantity_max
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.quantity_max) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, quantity_max
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a maximum quantity: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.quantity_max)
		;
    END IF;
    -- is_subscription
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.is_subscription) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, is_subscription
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have an is subscription?: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.is_subscription)
		;
    END IF;
    -- does_expire_faster_once_unsealed
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.does_expire_faster_once_unsealed) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, does_expire_faster_once_unsealed
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a does expire faster once unsealed: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.does_expire_faster_once_unsealed)
		;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN -- (SELECT * FROM tmp_Product WHERE is_new = 0 LIMIT 1) THEN
        SET v_ids_product_permission := (
			SELECT GROUP_CONCAT(P.id_product SEPARATOR ',') 
            FROM Shop_Product P 
            INNER JOIN tmp_Permutation t_P
				ON P.id_product = t_P.id_product 
                -- AND t_P.is_new = 0
		);
        IF NOT ISNULL(v_ids_product_permission) THEN
			SET v_id_permission_product = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
			
			CALL p_shop_calc_user(a_guid, a_id_user, FALSE, v_id_permission_product, v_id_access_level_edit, v_ids_product_permission);
			
			UPDATE tmp_Permutation t_P
            INNER JOIN Shop_Product P ON t_P.id_product = P.id_product
			INNER JOIN Shop_Calc_User_Temp UE_T
				ON P.id_product = UE_T.id_product
				AND UE_T.GUID = a_guid
			SET 
				t_P.can_view = UE_T.can_view
				, t_P.can_edit = UE_T.can_edit
				, t_P.can_admin = UE_T.can_admin
			;
			
			CALL p_shop_clear_calc_user(a_guid);

			IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.can_edit) LIMIT 1) THEN
				INSERT INTO tmp_Msg_Error (
					guid
					, id_type
					, code
					, msg
				)
				SELECT
					a_guid AS GUID
					, v_id_type_error_bad_data
					, v_code_type_error_bad_data
					, CONCAT('The following product permutation(s) do not have product edit permission: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
				FROM tmp_Permutation t_P
				WHERE ISNULL(t_P.can_edit)
				;
			END IF;
		END IF;
    END IF;
    
    SET v_now := CURRENT_DATETIME();
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		START TRANSACTION;
		
		IF NOT ISNULL(v_ids_product_permission) THEN
			INSERT INTO Shop_Product_Change_Set ( comment )
			VALUES ( a_comment )
			;
			
			SET v_id_change_set := LAST_INSERT_ID();
			
			UPDATE Shop_Product_Permutation PP
			INNER JOIN tmp_Permutation t_P ON PP.id_permutation = t_P.id_permutation
			SET 
				PP.id_product = t_P.id_product
				, PP.description = t_P.description
				, PP.cost_local = t_P.cost_local
				, PP.id_currency_cost = t_P.id_currency_cost
				, PP.profit_local_min = t_P.profit_local_min
				, PP.latency_manufacture_days = t_P.latency_manufacture_days
				, PP.id_unit_measurement_quantity = t_P.id_unit_measurement_quantity
				, PP.count_unit_measurement_per_quantity_step = t_P.count_unit_measurement_per_quantity_step
				, PP.quantity_min = t_P.quantity_min
				, PP.quantity_max = t_P.quantity_max
				, PP.quantity_stock = t_P.quantity_stock
				, PP.is_subscription = t_P.is_subscription
				, PP.id_unit_measurement_interval_recurrence = t_P.id_unit_measurement_interval_recurrence
				, PP.count_interval_recurrence = t_P.count_interval_recurrence
				, PP.id_stripe_product = t_P.id_stripe_product
				, PP.does_expire_faster_once_unsealed = t_P.does_expire_faster_once_unsealed
				, PP.id_unit_measurement_interval_expiration_unsealed = t_P.id_unit_measurement_interval_expiration_unsealed
				, PP.count_interval_expiration_unsealed = t_P.count_interval_expiration_unsealed
				, PP.active = t_P.active
				, PP.id_change_set = v_id_change_set
			;
		END IF;
		
		INSERT INTO Shop_Product_Permutation (
			id_product
			, description
			, cost_local
			, id_currency_cost
			, profit_local_min
			, latency_manufacture_days
			, id_unit_measurement_quantity
			, count_unit_measurement_per_quantity_step
			, quantity_min
			, quantity_max
			, quantity_stock
			, is_subscription
			, id_unit_measurement_interval_recurrence
			, count_interval_recurrence
			, id_stripe_product
			, does_expire_faster_once_unsealed
			, id_unit_measurement_interval_expiration_unsealed
			, count_interval_expiration_unsealed
            , active
			, created_by
			, created_on
		)
		SELECT
			t_P.id_product AS id_product
			, t_P.description AS description
			, t_P.cost_local AS cost_local
			, t_P.id_currency_cost AS id_currency_cost
			, t_P.profit_local_min AS profit_local_min
			, t_P.latency_manufacture_days AS latency_manufacture_days
			, t_P.id_unit_measurement_quantity AS id_unit_measurement_quantity
			, t_P.count_unit_measurement_per_quantity_step AS count_unit_measurement_per_quantity_step
			, t_P.quantity_min AS quantity_min
			, t_P.quantity_max AS quantity_max
			, t_P.quantity_stock AS quantity_stock
			, t_P.is_subscription AS is_subscription
			, t_P.id_unit_measurement_interval_recurrence AS id_unit_measurement_interval_recurrence
			, t_P.count_interval_recurrence AS count_interval_recurrence
			, t_P.id_stripe_product AS id_stripe_product
			, t_P.does_expire_faster_once_unsealed AS does_expire_faster_once_unsealed
			, t_P.id_unit_measurement_interval_expiration_unsealed AS id_unit_measurement_interval_expiration_unsealed
			, t_P.count_interval_expiration_unsealed AS count_interval_expiration_unsealed
			, t_P.active AS active
			, a_id_user AS created_by
			, v_now AS created_on
		FROM tmp_Permutation t_P
		WHERE 
			is_new = 1
			AND active = 1
		;
    
		DELETE FROM Shop_Product_Permutation_Temp
		WHERE GUID = a_guid;
		
		COMMIT;
    END IF;
    
    SELECT * FROM tmp_Msg_Error;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
END //
DELIMITER ;;


/*

DELETE FROM Shop_Product_Permutation_Temp
WHERE id_permutation = 1
;

INSERT INTO Shop_Product_Permutation_Temp (
	id_permutation, 
	id_product, 
	description, 
	cost_local, 
	id_currency_cost, 
	profit_local_min, 
	latency_manufacture_days,
	id_unit_measurement_quantity,
	count_unit_measurement_per_quantity_step,
	quantity_min, 
	quantity_max, 
	quantity_stock, 
	is_subscription, 
	id_unit_measurement_interval_recurrence, 
	count_interval_recurrence, 
	id_stripe_product,
	does_expire_faster_once_unsealed,
	id_unit_measurement_interval_expiration_unsealed,
	count_interval_expiration_unsealed,
	active,
	guid
)
VALUES
	(
		1 -- id_permutation, 
		, 1 -- id_product, 
		, 'Good Reddy Teddy' -- description, 
		, 5.0 -- cost_local, 
		, 1 -- id_currency_cost, 
		, 3.0 -- profit_local_min, 
		, 14 -- latency_manufacture_days,
		, 1 -- id_unit_measurement_quantity,
		, 1.0 -- count_unit_measurement_quantity,
		, 3.0 -- quantity_min, 
		, 99.0 -- quantity_max, 
		, 1.0 -- quantity_stock, 
		, False -- is_subscription, 
		, null -- id_unit_measurement_interval_recurrence, 
		, null -- count_interval_recurrence, 
		, null -- id_stripe_product,
		, False -- does_expire_faster_once_unsealed,
		, null -- id_unit_measurement_interval_expiration_unsealed,
		, null -- count_interval_expiration_unsealed,
		, True -- active,
		, 'NIPS' -- guid
    )
;

select 'Shop_Product_Permutation_Temp before call';
SELECT * FROM Shop_Product_Permutation_Temp;

SELECT 'Shop_Product_Permutation before call' AS result_name;
select * FROM Shop_Product_Permutation;

CALL p_shop_save_product_permutation (
    1, -- 'auth0|6582b95c895d09a70ba10fef', # a_id_user
    'Initial data', # a_comment
	'NIPS' # a_guid
);

SELECT 'Shop_Product_Permutation_Temp after call' AS result_name;
select * FROM Shop_Product_Permutation_Temp;

SELECT 'Shop_Product_Permutation after call' AS result_name;
select * FROM Shop_Product_Permutation;


DELETE FROM Shop_Product_Permutation_Temp
WHERE id_permutation = 1;


*/


DROP FUNCTION IF EXISTS fn_shop_get_id_product_permutation_from_variation_csv_list;

DELIMITER //

CREATE FUNCTION fn_shop_get_id_product_permutation_from_variation_csv_list (
	a_id_product INT
	, a_variation_csv TEXT
) 
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_id_permutation INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_id_variation_type INT;
    DECLARE v_id_variation INT;
    DECLARE v_id_permutation_tmp INT;
    DECLARE cur CURSOR FOR 
        SELECT 
            CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(t.pair, ':', 1), ',', -1) AS UNSIGNED) AS id_variation_type,
            CAST(SUBSTRING_INDEX(t.pair, ':', -1) AS UNSIGNED) AS id_variation
        FROM (
            SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(a_variation_csv, ',', n), ',', -1) pair
            FROM (
                SELECT a.N + b.N * 10 + 1 n
                FROM (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
                CROSS JOIN (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
                ORDER BY n
            ) numbers
            WHERE n <= 1 + (LENGTH(a_variation_csv) - LENGTH(REPLACE(a_variation_csv, ',', '')))
        ) t;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    SET v_id_permutation = NULL;

    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO v_id_variation_type, v_id_variation;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        IF v_id_permutation IS NULL THEN
            -- First iteration: find initial v_id_permutations
            SELECT PPVL.id_permutation INTO v_id_permutation
            FROM partsltd_prod.Shop_Product_Permutation_Variation_Link PPVL
            INNER JOIN partsltd_prod.Shop_Product_Permutation PP ON PPVL.id_permutation = PP.id_permutation
            INNER JOIN partsltd_prod.Shop_Variation PV ON PPVL.id_variation = PV.id_variation
            WHERE 1=1
				AND PP.id_product = a_id_product
				AND PPVL.id_variation = v_id_variation
				AND PV.id_type = v_id_variation_type
			;
        ELSE
            -- Subsequent iterations: narrow down the v_id_permutation
            SELECT PPVL.id_permutation INTO v_id_permutation_tmp
            FROM partsltd_prod.Shop_Product_Permutation_Variation_Link PPVL
            INNER JOIN partsltd_prod.Shop_Product_Permutation PP ON PPVL.id_permutation = PP.id_permutation
            INNER JOIN partsltd_prod.Shop_Variation PV ON PPVL.id_variation = PV.id_variation
            WHERE 1=1
				AND PP.id_product = a_id_product
				AND PPVL.v_id_permutation = v_id_permutation
				AND PPVL.id_variation = v_id_variation
				AND PV.id_type = v_id_variation_type
			;
            
            IF v_id_permutation_tmp IS NULL THEN
                -- If no match found, exit the loop
                SET v_id_permutation := NULL;
                LEAVE read_loop;
            ELSE
                SET v_id_permutation := v_id_permutation_tmp;
            END IF;
        END IF;
    END LOOP;

    CLOSE cur;

    RETURN v_id_permutation;
END //

DELIMITER ;

/*
SELECT fn_shop_get_id_product_permutation_from_variation_csv_list ( 1, '1:1' ) AS id_permutation;
SELECT fn_shop_get_id_product_permutation_from_variation_csv_list ( 3, '' ) AS id_permutation;
*/


/*
-- Update the table using the function
UPDATE product_permutation_input
SET v_id_permutation = find_v_id_permutation(variation_csv)
WHERE v_id_permutation IS NULL;
*/

/*
select * from partsltd_prod.Shop_Variation

DROP PROCEDURE IF EXISTS p_shop_get_id_product_permutation_from_variation_csv_list;

DELIMITER //
CREATE PROCEDURE p_shop_get_id_product_permutation_from_variation_csv_list (
	IN a_guid BINARY(36)
    , IN a_debug BIT
)
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE v_id INT;
    DECLARE v_row_id INT;
    DECLARE v_variation_csv TEXT;
    DECLARE v_id_permutation INT;
    DECLARE v_time_start TIMESTAMP(6);

    -- Cursor to iterate through unprocessed rows
    DECLARE cur CURSOR FOR 
        SELECT id, session_guid, row_id, variation_csv 
        FROM product_permutation_input 
        WHERE v_id_permutation IS NULL;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET a_debug := IFNULL(a_debug, 0);
    
    IF a_debug = 1 THEN
		SELECT
			a_guid
            , a_debug
		;
    END IF;
    
    CALL p_validate_guid ( a_guid );

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO v_id, v_session_guid, v_row_id, v_variation_csv;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Find matching v_id_permutation
        SET v_id_permutation = NULL;

        SELECT ppvl.v_id_permutation INTO v_id_permutation
        FROM (
            SELECT 
                SUBSTRING_INDEX(SUBSTRING_INDEX(t.pair, ':', 1), ',', -1) AS id_variation_type,
                SUBSTRING_INDEX(t.pair, ':', -1) AS id_variation
            FROM (
                SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(v_variation_csv, ',', numbers.n), ',', -1) pair
                FROM (
                    SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 -- add more if needed
                ) numbers
                WHERE CHAR_LENGTH(v_variation_csv) - CHAR_LENGTH(REPLACE(v_variation_csv, ',', '')) >= numbers.n - 1
            ) t
        ) parsed
        INNER JOIN product_permutation_variation_link ppvl
            ON parsed.id_variation_type = ppvl.id_variation_type
            AND parsed.id_variation = ppvl.id_variation
        GROUP BY ppvl.v_id_permutation
        HAVING COUNT(*) = (LENGTH(v_variation_csv) - LENGTH(REPLACE(v_variation_csv, ',', '')) + 1)
        LIMIT 1;

        -- Update the v_id_permutation in the input table
        UPDATE product_permutation_input
        SET v_id_permutation = v_id_permutation
        WHERE id = v_id;

    END LOOP;

    CLOSE cur;
    
    
    IF EXISTS ( SELECT * FROM Shop_Get_Id_Product_Permutation_From_Variation_Csv_List_Temp WHERE GUID = a_guid LIMIT 1 ) THEN
		IF EXISTS (SELECT * FROM tmp_Split_Split LIMIT 1) THEN
			START TRANSACTION;
				INSERT INTO Split_Key_Value_Pair_Csv_Temp (
					guid
					, id
					, key_column
					, value_column
				)
				SELECT
					a_guid
					, id
					, key_column
					, value_column
				FROM tmp_Split_Split
				;
			COMMIT;
		END IF;
    END IF;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Split_Input;
    DROP TEMPORARY TABLE IF EXISTS tmp_Split_Split;
    
    IF a_debug = 1 THEN
		CALL p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;;
*/

/*
CALL p_shop_get_id_product_permutation_from_variation_csv_list (
	'nipsnipsnipsnipsnipsnipsnipsnipsnips'
	, '1:100,2:200,3:300,4:400' # a_string
    , 1
);

SELECT *
FROM Split_key_value_pair_csv_Temp
WHERE GUID = 'nipsnipsnipsnipsnipsnipsnipsnipsnips';

CALL p_clear_split_key_value_pair_csv_temp( 'nipsnipsnipsnipsnipsnipsnipsnipsnips' );
*/

DROP PROCEDURE IF EXISTS p_shop_get_many_product_variation;

DELIMITER //
CREATE PROCEDURE p_shop_get_many_product_variation (
	IN a_id_user INT
    , IN a_get_all_variation_type BIT
	, IN a_get_inactive_variation_type BIT
	, IN a_ids_variation_type VARCHAR(4000)
    , IN a_get_all_variation BIT
	, IN a_get_inactive_variation BIT
	, IN a_ids_variation TEXT
    , IN a_debug BIT
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_variation BIT;
    DECLARE v_has_filter_variation_type BIT;
    DECLARE v_guid BINARY(36);
    # DECLARE v_id_user VARCHAR(100);
    # DECLARE v_ids_permutation_unavailable VARCHAR(4000);
    DECLARE v_id_permission_variation INT;
    # DECLARE v_ids_product_permission VARCHAR(4000);
    # DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    DECLARE v_time_start TIMESTAMP(6);
    DECLARE v_id_minimum INT;
    DECLARE v_code_error_bad_data VARCHAR(50);
    DECLARE v_id_type_error_bad_data INT;
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_code_error_bad_data := (SELECT code FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_bad_data LIMIT 1);
    
	-- Argument validation + default values
	SET a_id_user = IFNULL(a_id_user, 0);
    SET a_get_all_variation = IFNULL(a_get_all_variation, 1);
    SET a_get_inactive_variation = IFNULL(a_get_inactive_variation, 0);
    SET a_ids_variation = TRIM(REPLACE(IFNULL(a_ids_variation, ''), '|', ','));
    SET a_get_all_variation_type = IFNULL(a_get_all_variation_type, 1);
    SET a_get_inactive_variation_type = IFNULL(a_get_inactive_variation_type, 0);
    SET a_ids_variation_type = TRIM(REPLACE(IFNULL(a_ids_variation_type, ''), '|', ','));
    
    IF a_debug = 1 THEN
		SELECT
			a_id_user
			, a_get_all_variation_type
			, a_get_inactive_variation_type
			, a_ids_variation_type
			, a_get_all_variation
			, a_get_inactive_variation
			, a_ids_variation
			, a_debug
		;
    END IF;
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Variation;
    DROP TABLE IF EXISTS tmp_Variation_Type;
    
    CREATE TEMPORARY TABLE tmp_Variation_Type (
		id_type INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Variation (
		id_variation INT NOT NULL
        , id_type INT NOT NULL
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        -- guid BINARY(36) NOT NULL,
		id_type INT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Split (
		substring VARCHAR(4000) NOT NULL
        , as_int INT NULL
	);
    DELETE FROM tmp_Split;
    
    
    -- Parse filters
    SET v_has_filter_variation = CASE WHEN a_ids_variation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_variation_type = CASE WHEN a_ids_variation_type = '' THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
    IF v_has_filter_variation_type THEN -- NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_variation_type, ',', a_debug);
        
        DELETE FROM tmp_Split;
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( v_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Variation_Type VT ON t_S.as_int = VT.id_type
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(VT.id_type)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- v_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive variation type IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Variation_Type VT ON t_S.as_int = VT.id_type
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(VT.id_type)
			;
		ELSE
            INSERT INTO tmp_Variation_Type (
				id_type
			)
            SELECT
				DISTINCT VT.id_type
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_Variation_Type VT ON t_S.as_int = VT.id_type
			WHERE 
				(
					a_get_all_variation_type = 1
					OR (
						v_has_filter_variation_type = 1
						AND NOT ISNULL(t_S.as_int)
					)
				)
				AND (
					a_get_inactive_variation_type = 1
					OR VT.active = 1
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    IF (v_has_filter_variation AND NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1)) THEN -- NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_variation, ',', a_debug);
        
        DELETE FROM tmp_Split;
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( v_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Variation V ON t_S.as_int = V.id_variation
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(V.id_variation)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- v_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive variation IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Variation V ON t_S.as_int = V.id_variation
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(VT.id_type)
			;
		ELSE
            INSERT INTO tmp_Variation (
				id_variation
                , id_type
			)
            SELECT
				DISTINCT V.id_variation
				, V.id_type
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_Variation V ON t_S.as_int = V.id_variation
			WHERE 
				(
					a_get_all_variation = 1
					OR (
						v_has_filter_variation = 1
						AND NOT ISNULL(t_S.as_int)
					)
				)
				AND (
					a_get_inactive_variation = 1
					OR V.active = 1
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
        # SET v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER());
        SET v_id_permission_variation := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
        
        IF a_debug = 1 THEN
			SELECT 
				v_guid
				, a_id_user
				, FALSE AS a_get_inactive_users
				, v_id_permission_variation
				, v_id_access_level_view
				, '' AS a_ids_product
				, 0 AS a_debug
			;
			-- select * from Shop_Calc_User_Temp;
		END IF;
        
        CALL p_shop_calc_user(
			v_guid
            , a_id_user
            , FALSE -- a_get_inactive_users
            , v_id_permission_variation
            , v_id_access_level_view
            , '' -- a_ids_product
            , 0 -- a_debug
		);
        
        IF a_debug = 1 THEN
			select * from Shop_Calc_User_Temp;
		END IF;
        
        IF NOT EXISTS (SELECT can_view FROM Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
                id_type,
				code,
				msg
			)
			VALUES (
				-- v_guid,
				v_id_type_error_bad_data, 
				v_code_error_bad_data, 
				CONCAT('You do not have view permissions for ', (SELECT name FROM Shop_Permission WHERE id_permission = v_id_permission_variation LIMIT 1))
			)
			;
        END IF;
        
        CALL p_shop_clear_calc_user( v_guid, 0 );
	END IF;
    
    IF EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		DELETE FROM tmp_Variation;
        DELETE FROM tmp_Variation_Type;
    END IF;
    
    -- Returns
    # Variation Types
    SELECT 
		t_VT.id_type
        , VT.code
        , VT.name
        , VT.name_plural
        , VT.display_order
        , VT.active
    FROM tmp_Variation_Type t_VT
    INNER JOIN Shop_Variation_Type VT ON t_VT.id_type = VT.id_type
	;
    
    # Variations
    SELECT 
		t_V.id_variation
        , t_V.id_type
        , V.code AS code_variation
        , V.name AS name_variation
		, V.display_order
        , V.active AS active_variation
        /*
        , VT.code AS code_variation_type
        , VT.name AS name_variation_type
        , VT.name_plural AS name_plural_variation_type
        , VT.active AS active_variation_type
		, VT.display_order
        */
    FROM tmp_Variation t_V
    INNER JOIN Shop_Variation V ON t_V.id_variation = V.id_variation
    INNER JOIN tmp_Variation_Type t_VT ON V.id_type = t_VT.id_type
    INNER JOIN Shop_Variation_Type VT ON t_VT.id_type = VT.id_type
    ORDER BY VT.display_order, V.display_order
	;
    
    # Errors
    SELECT 
        *
    FROM tmp_Msg_Error t_ME
    INNER JOIN Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
    -- WHERE guid = v_guid
    ;
    
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Variation;
    DROP TABLE IF EXISTS tmp_Variation_Type;
    
	CALL partsltd_prod.p_shop_clear_calc_product_permutation ( v_guid );
    
    IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;;


/*

CALL p_shop_get_many_product_variation (
	1 # 'auth0|6582b95c895d09a70ba10fef', # a_id_user
    , 1 # a_get_all_variation_type
	, 0 # a_get_inactive_variation_type
	, '' # a_ids_variation_type
    , 1 # a_get_all_variation
	, 0 # a_get_inactive_variation
	, '' # a_ids_variation
    , 1 # a_debug
);

select * from TMP_MSG_ERROR;
DROP TABLE TMP_MSG_ERROR;

select * from shop_variation;
select * from shop_variation_type;
*/
/*
select * from shop_supplier;
select * from shop_product;

insert into shop_product_change_set (comment)
    values ('set product not subscription - test bool output to python');
    update shop_product
    set is_subscription = 0,
		id_change_set = (select id_change_set from shop_product_change_set order by id_change_set desc limit 1)
    where id_product = 1

			INSERT INTO tmp_Variation_Type (
				id_type,
                active,
                rank_type
			)
			SELECT 
				VT.id_type,
                S.active,
                RANK() OVER (ORDER BY id_type ASC) AS rank_type
			FROM Shop_Variation_Type VT
            LEFT JOIN Split_Temp S_T ON VT.id_type = S_T.substring
            WHERE
				(
					a_get_all_variation_type = 1
                    OR NOT ISNULL(S_T.substring)
				)
				AND (
					a_get_inactive_variation_type
                    OR VT.active = 1
                )
			;
        END IF;

		
		IF a_get_first_variation_type_only THEN
			DELETE t_VT
			FROM tmp_Shop_Variation_Type t_VT
			WHERE t_VT.rank_type > 1
			;
		END IF;
*/

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_stock_item;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_stock_item (
	IN a_id_user INT,
    IN a_get_all_product_permutation BIT,
	IN a_get_inactive_product_permutation BIT,
    IN a_ids_product_permutation TEXT,
    IN a_get_all_stock_item BIT,
	IN a_get_inactive_stock_item BIT,
	IN a_ids_stock_item LONGTEXT,
    IN a_get_all_region_storage BIT,
	IN a_get_inactive_region_storage BIT,
    IN a_ids_region_storage TEXT,
    IN a_get_all_plant_storage BIT,
	IN a_get_inactive_plant_storage BIT,
    IN a_ids_plant_storage TEXT,
    IN a_get_all_location_storage BIT,
	IN a_get_inactive_location_storage BIT,
    IN a_ids_location_storage TEXT,
    IN a_date_received_to DATETIME,
	IN a_get_sealed_stock_item_only BIT,
	IN a_get_unsealed_stock_item_only BIT,
	IN a_get_expired_stock_item_only BIT,
	IN a_get_nonexpired_stock_item_only BIT,
	IN a_get_consumed_stock_item_only BIT,
	IN a_get_nonconsumed_stock_item_only BIT,
    IN a_debug BIT
)
BEGIN
    DECLARE v_has_filter_permutation BIT;
    DECLARE v_has_filter_stock_item BIT;
    DECLARE v_has_filter_region_storage BIT;
    DECLARE v_has_filter_plant_storage BIT;
    DECLARE v_has_filter_location_storage BIT;
    DECLARE v_guid BINARY(36);
    -- DECLARE v_ids_permutation_unavailable LONGTEXT;
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission LONGTEXT;
    -- DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    -- DECLARE v_now DATETIME;
    -- DECLARE v_id_minimum INT;
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'VIEW');
    SET v_time_start := CURRENT_TIMESTAMP(6);

    
	-- Argument validation + default values
	SET a_id_user := TRIM(IFNULL(a_id_user, ''));
	SET a_get_all_product_permutation := IFNULL(a_get_all_product_permutation, 0);
	-- SET a_guid_permutations := IFNULL(a_guid_permutations, '');
	SET a_get_inactive_product_permutation := IFNULL(a_get_inactive_product_permutation, 0);
	SET a_ids_product_permutation := IFNULL(a_ids_product_permutation, '');
	SET a_get_all_stock_item := IFNULL(a_get_all_stock_item, 0);
	SET a_get_inactive_stock_item := IFNULL(a_get_inactive_stock_item, 0);
	SET a_ids_stock_item := TRIM(IFNULL(a_ids_stock_item, ''));
	SET a_get_all_region_storage := IFNULL(a_get_all_region_storage, 0);
	SET a_get_inactive_region_storage := IFNULL(a_get_inactive_region_storage, 0);
	SET a_ids_region_storage := TRIM(IFNULL(a_ids_region_storage, ''));
	SET a_get_all_plant_storage := IFNULL(a_get_all_plant_storage, 0);
	SET a_get_inactive_plant_storage := IFNULL(a_get_inactive_plant_storage, 0);
	SET a_ids_plant_storage := TRIM(IFNULL(a_ids_plant_storage, ''));
	SET a_get_all_location_storage := IFNULL(a_get_all_location_storage, 0);
	SET a_get_inactive_location_storage := IFNULL(a_get_inactive_location_storage, 0);
	SET a_ids_location_storage := TRIM(IFNULL(a_ids_location_storage, ''));
	SET a_date_received_to := a_date_received_to; -- IFNULL(a_date_received_to, NOW());
	SET a_get_sealed_stock_item_only := IFNULL(a_get_sealed_stock_item_only, 0);
	SET a_get_unsealed_stock_item_only := IFNULL(a_get_unsealed_stock_item_only, 0);
	SET a_get_expired_stock_item_only := IFNULL(a_get_expired_stock_item_only, 0);
	SET a_get_nonexpired_stock_item_only := IFNULL(a_get_nonexpired_stock_item_only, 0);
	SET a_get_consumed_stock_item_only := IFNULL(a_get_consumed_stock_item_only, 0);
	SET a_get_nonconsumed_stock_item_only := IFNULL(a_get_nonconsumed_stock_item_only, 0);
	
    -- Temporary tables
    DROP TEMPORARY TABLE IF EXISTS tmp_Region_Storage;
    DROP TEMPORARY TABLE IF EXISTS tmp_Plant_Storage;
    DROP TEMPORARY TABLE IF EXISTS tmp_Location_Storage;
	DROP TEMPORARY TABLE IF EXISTS tmp_Stock_Item;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
	-- DROP TABLE IF EXISTS tmp_Msg_Error;
    DROP TEMPORARY TABLE IF EXISTS tmp_Category;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    
    CREATE TEMPORARY TABLE tmp_Category (
		id_category INT NOT NULL
        , display_order INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Product (
		id_category INT NOT NULL
		, id_product INT NOT NULL
        , display_order INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Permutation (
		id_permutation INT NULL
		, id_product INT NOT NULL
        , can_view BIT
        , can_edit BIT
        , can_admin BIT
    );
	
	CREATE TEMPORARY TABLE tmp_Stock_Item (
		id_stock INT NOT NULL PRIMARY KEY
        , id_permutation INT NOT NULL
        , id_product INT NOT NULL
		, id_location_storage INT NOT NULL
        , can_view BIT NULL
        , can_edit BIT NULL
		, can_admin BIT NULL
	);

	CREATE TEMPORARY TABLE tmp_Region_Storage (
		id_region INT NOT NULL PRIMARY KEY
        /*
		CONSTRAINT FK_tmp_Region_Storage_id_region
			FOREIGN KEY (id_region)
			REFERENCES Shop_Region(id_region)
		*/
        -- , rank_region INT NOT NULL
	);

	CREATE TEMPORARY TABLE tmp_Plant_Storage (
		id_plant INT NOT NULL PRIMARY KEY
        /*
		CONSTRAINT FK_tmp_Plant_Storage_id_plant
			FOREIGN KEY (id_plant)
			REFERENCES Shop_Plant(id_plant)
		*/
        -- , rank_plant INT NOT NULL
        , id_region INT NOT NULL
	);

	CREATE TEMPORARY TABLE tmp_Location_Storage (
		id_location INT NOT NULL PRIMARY KEY
        /*
		CONSTRAINT FK_tmp_Location_Storage_id_location
			FOREIGN KEY (id_location)
			REFERENCES Shop_Location_Storage(id_location)
		*/
        -- , rank_location INT NOT NULL
        , id_plant INT NOT NULL
	);
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        -- guid BINARY(36) NOT NULL,
		id_type INT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Split (
		substring VARCHAR(4000) NOT NULL
        , as_int INT NULL
	);
    DELETE FROM tmp_Split;
    
    
    -- Parse filters
    SET v_has_filter_permutation = CASE WHEN a_ids_product_permutation = '' THEN 0 ELSE 1 END; -- CASE WHEN a_guid_permutations = '' THEN 0 ELSE 1 END;
    SET v_has_filter_stock_item = CASE WHEN a_ids_stock_item = '' THEN 0 ELSE 1 END;
    SET v_has_filter_region_storage = CASE WHEN a_ids_region_storage = '' THEN 0 ELSE 1 END;
    SET v_has_filter_plant_storage = CASE WHEN a_ids_plant_storage = '' THEN 0 ELSE 1 END;
    SET v_has_filter_location_storage = CASE WHEN a_ids_location_storage = '' THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
    CALL partsltd_prod.p_shop_calc_product_permutation (
		a_id_user
		, 1 -- a_get_all_product_category
		, 0 -- a_get_inactive_product_category
		, '' -- a_ids_product_category
		, 1 -- a_get_all_product
		, 0 -- a_get_inactive_product
		, '' -- a_ids_product
		, a_get_all_product_permutation
		, a_get_inactive_product_permutation
		, a_ids_product_permutation
		, 0 
		, v_guid -- a_guid
		, 0 -- a_debug 
    );
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		INSERT INTO tmp_Category (
			id_category
			, display_order
		)
		SELECT 
			PC.id_category
			, PC.display_order
		FROM (SELECT * FROM partsltd_prod.Shop_Product_Category_Temp WHERE GUID = v_guid) PC_T 
		INNER JOIN partsltd_prod.Shop_Product_Category PC ON PC_T.id_category = PC.id_category
		;
		
		INSERT INTO tmp_Product (
			id_product
			, id_category
			, display_order
		)
		SELECT 
			P.id_product
			, P.id_category
			, P.display_order
		FROM (SELECT * FROM partsltd_prod.Shop_Product_Temp WHERE GUID = v_guid) P_T 
		INNER JOIN partsltd_prod.Shop_Product P ON P.id_product = P_T.id_product
		;
		
		INSERT INTO tmp_Permutation (
			id_permutation
			, id_product
            , can_view
            , can_edit
            , can_admin
		)
		SELECT 
			PP.id_permutation
			, PP.id_product
            , PP_T.can_view
            , PP_T.can_edit
            , PP_T.can_admin
		FROM (SELECT * FROM partsltd_prod.Shop_Product_Permutation_Temp WHERE GUID = v_guid) PP_T
		INNER JOIN partsltd_prod.Shop_Product_Permutation PP ON PP_T.id_permutation = PP.id_permutation
		;
    
    # Stock Items
		CALL partsltd_prod.p_split(v_guid, a_ids_stock_item, ',', a_debug);
        
        DELETE FROM tmp_Split;
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( v_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Stock_Item SI ON t_S.as_int = SI.id_stock
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(SI.id_stock)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- v_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive stock item IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Stock_Item SI ON t_S.as_int = SI.id_stock
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(SI.id_stock)
			;
		ELSE
			INSERT INTO tmp_Stock_Item (
				id_stock
                , id_permutation
                , id_product
                , id_location_storage
			)
			SELECT 
				SI.id_stock
                , SI.id_permutation
                , t_PP.id_product
                , SI.id_location_storage
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_Stock_Item SI ON t_S.as_int = SI.id_stock
            INNER JOIN tmp_Permutation t_PP ON SI.id_permutation = t_PP.id_permutation
			WHERE 
				(
					a_get_all_stock_item = 1
					OR (
						v_has_filter_stock_item = 1
						AND NOT ISNULL(t_S.as_int)
					)
				)
				AND (
					a_get_inactive_stock_item = 1
					OR SI.active = 1
				)
				AND (
					ISNULL(a_date_received_to)
					OR SI.date_received <= a_date_received_to
				)
				AND (
					a_get_unsealed_stock_item_only = 0
					OR SI.is_sealed = 0
				)
				AND (
					a_get_sealed_stock_item_only = 0
					OR SI.is_sealed = 1
				)
				AND (
					a_get_nonexpired_stock_item_only = 0
					OR SI.date_expiration > v_time_start
				)
				AND (
					a_get_expired_stock_item_only = 0
					OR SI.date_expiration <= v_time_start
				)
				AND (
					a_get_consumed_stock_item_only = 0
					OR SI.is_consumed = 1
				)
				AND (
					a_get_nonconsumed_stock_item_only = 0
					OR SI.is_consumed = 0
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
	-- Storage Regions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_region_storage, ',', a_debug);
        
        DELETE FROM tmp_Split;
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( v_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Region R ON t_S.as_int = R.id_region
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(R.id_region)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- v_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive region IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Region R ON t_S.as_int = R.id_region
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(R.id_region)
			;
		ELSE
			INSERT INTO tmp_Region_Storage (
				id_region
			)
			WITH RECURSIVE Recursive_CTE_Region_Storage AS (
				SELECT 
					R.id_region AS id_region_parent,
					NULL AS id_region_child
				FROM tmp_Split t_S
				RIGHT JOIN partsltd_prod.Shop_Region R 
					ON t_S.as_int = R.id_region
					AND (
						a_get_all_region_storage = 1
						OR NOT ISNULL(t_S.as_int)
					)
					AND (
						a_get_inactive_region_storage = 1
						OR R.active = 1
					)			
                INNER JOIN (
					SELECT
						A.id_region
					FROM tmp_Stock_Item t_SI
					-- INNER JOIN tmp_Stock_Item t_SI ON SL.id_location = t_SI.id_location_storage
					INNER JOIN partsltd_prod.Shop_Storage_Location SL ON t_SI.id_location_storage = SL.id_location
					INNER JOIN partsltd_prod.Shop_Plant P ON SL.id_plant = P.id_plant
					INNER JOIN partsltd_prod.Shop_Address A ON P.id_address = A.id_address
				) A_SI ON R.id_region = A_SI.id_region
				UNION
				SELECT 
					RB.id_region_parent,
					RB.id_region_child
				FROM partsltd_prod.Shop_Region_Branch RB
				INNER JOIN Recursive_CTE_Region_Storage r_RS
					ON RB.id_region_parent = r_RS.id_region_child
					AND (
						a_get_inactive_region_storage = 1
						OR RB.active = 1
					)
			)
			SELECT
				DISTINCT R.id_region
			FROM partsltd_prod.Shop_Region R
			INNER JOIN Recursive_CTE_Region_Storage r_RS
				ON R.id_region = r_RS.id_region_parent
				OR R.id_region = r_RS.id_region_child
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
	-- Plants
    INSERT INTO tmp_Plant_Storage (
		id_plant
        , id_region
	)
	SELECT 
		DISTINCT P.id_plant
        , A.id_region
	FROM tmp_Stock_Item t_SI
	INNER JOIN partsltd_prod.Shop_Storage_Location SL ON t_SI.id_location_storage = SL.id_location
	INNER JOIN partsltd_prod.Shop_Plant P ON SL.id_plant = P.id_plant
    INNER JOIN partsltd_prod.Shop_Address A ON P.id_address = A.id_address
	;
    
	-- Storage Locations
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_location_storage, ',', a_debug);
        
        DELETE FROM tmp_Split;
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( v_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Region R ON t_S.as_int = R.id_region
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(R.id_region)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- v_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive region IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Region R ON t_S.as_int = R.id_region
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(R.id_region)
			;
		ELSE
			INSERT INTO tmp_Location_Storage (
				id_location
				, id_plant
			)
			WITH RECURSIVE Recursive_CTE_Location_Storage AS (
				SELECT 
					SL.id_location AS id_location_parent,
					NULL AS id_location_child
				FROM tmp_Split t_S
				RIGHT JOIN partsltd_prod.Shop_Storage_Location SL 
					ON t_S.as_int = SL.id_location
					AND (
						a_get_all_location_storage = 1
						OR NOT ISNULL(t_S.as_int)
					)
					AND (
						a_get_inactive_location_storage = 1
						OR SL.active = 1
					)
                INNER JOIN tmp_Stock_Item t_SI ON SL.id_location = t_SI.id_location_storage
				UNION
				SELECT 
					SLB.id_location_parent,
					SLB.id_location_child
				FROM partsltd_prod.Shop_Storage_Location_Branch SLB
				INNER JOIN Recursive_CTE_Location_Storage r_LS
					ON SLB.id_location_parent = r_LS.id_location_child
					AND (
						a_get_inactive_location_storage
						OR SLB.active = 1
					)
			)
			SELECT
				DISTINCT SL.id_location
				, SL.id_plant
			FROM partsltd_prod.Shop_Storage_Location SL
			INNER JOIN Recursive_CTE_Location_Storage r_LS
				ON SL.id_location = r_LS.id_location_parent
				OR SL.id_location = r_LS.id_location_child
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    /*
    -- Permissions
    IF EXISTS (SELECT * FROM tmp_Stock_Item LIMIT 1) THEN
        SET v_id_permission_product := (SELECT id_permission FROM partsltd_prod.Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
        SET v_ids_product_permission := (SELECT GROUP_CONCAT(id_product SEPARATOR ',') FROM tmp_Permutation WHERE NOT ISNULL(id_product));
        -- SET v_ids_permutation_permission := (SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission;
        -- select * FROM partsltd_prod.Shop_Calc_User_Temp;
        
        CALL p_shop_calc_user(
			v_guid
            , a_id_user
            , false -- a_get_inactive_users
            , v_id_permission_product
            , v_id_access_level_view
            , v_ids_product_permission
            , 0 -- a_debug
		);
        
        -- select * FROM partsltd_prod.Shop_Calc_User_Temp;
        
        UPDATE tmp_Stock_Item t_SI
        INNER JOIN partsltd_prod.Shop_Calc_User_Temp UE_T
			ON t_SI.id_product = UE_T.id_product
			AND UE_T.GUID = v_guid
        SET t_SI.can_view = UE_T.can_view,
			t_SI.can_edit = UE_T.can_edit,
            t_SI.can_admin = UE_T.can_admin
		;
        
        DELETE t_SI
		FROM tmp_Stock_Item t_SI
        / *
		LEFT JOIN partsltd_prod.Shop_Calc_User_Temp UE_T
			ON t_SI.id_product = UE_T.id_product
			AND UE_T.GUID = v_guid
		* /
		WHERE 
			/ *
			FIND_IN_SET(t_SI.id_product, (
				SELECT GROUP_CONCAT(UET.id_product SEPARATOR ',') 
				FROM partsltd_prod.Shop_Calc_User_Temp UET)
			) = 0 # id_product NOT LIKE CONCAT('%', (SELECT GROUP_CONCAT(id_product SEPARATOR '|') FROM partsltd_prod.Shop_Calc_User_Temp), '%');
			* /
            / *
			ISNULL(UE_T.id_product)
			OR IFNULL(UE_T.can_view, 0) = 0
            * /
            t_SI.id_product NOT IN (
				SELECT id_product 
                FROM partsltd_prod.Shop_Calc_User_Temp UE_T
                WHERE
					GUID = v_guid
					AND IFNULL(can_view, 0) = 1
			)
        ;
        
        # CALL p_shop_clear_calc_user(v_guid);
        # DROP TABLE IF EXISTS Shop_Calc_User_Temp;
        DELETE FROM partsltd_prod.Shop_Calc_User_Temp
        WHERE GUID = v_guid
        ;
    END IF;
    */
    
    /*
    select * FROM partsltd_prod.Shop_stock_item;
    select * from tmp_Stock_Item;
    select * from tmp_Permutation;
    select * from tmp_Location_Storage;
    select * from Shop_Storage_Location;
    select * from tmp_Plant_Storage;
    select * from tmp_Region_Storage;
    */
    
    -- Returns
    -- SET v_now := NOW();
    # Stock Items
    SELECT 
		t_SI.id_stock,
		t_SI.id_permutation,
		P.id_product,
		P.id_category,
		t_SI.id_location_storage,
        t_PS.id_plant,
        PLANT.id_address AS id_address_plant,
        t_RS.id_region AS id_region_plant,
        SL.code AS code_storage_location,
        SL.name AS name_storage_location,
        PLANT.code AS code_plant,
        PLANT.name AS name_plant,
		SI.id_currency_cost,
		CURRENCY.symbol AS symbol_currency_cost,
		CURRENCY.code AS code_currency_cost,
		SI.cost_local_VAT_excl,
		SI.cost_local_VAT_incl,
		SI.date_purchased,
		SI.date_received,
		SI.is_sealed,
		SI.date_unsealed,
		SI.date_expiration,
		SI.is_consumed,
		SI.date_consumed,
		SI.active,
		/*
        t_SI.active_permutation,
		t_SI.active_product,
		t_SI.active_category,
		*/
        t_PP.can_view,
        t_PP.can_edit,
        t_PP.can_admin
    FROM tmp_Stock_Item t_SI
    INNER JOIN partsltd_prod.Shop_Stock_Item SI ON t_SI.id_stock = SI.id_stock
	INNER JOIN tmp_Permutation t_PP ON t_SI.id_permutation = t_PP.id_permutation
    INNER JOIN partsltd_prod.Shop_Product P ON t_PP.id_product = P.id_product
	INNER JOIN tmp_Location_Storage t_LS ON t_SI.id_location_storage = t_LS.id_location
	INNER JOIN tmp_Plant_Storage t_PS ON t_LS.id_plant = t_PS.id_plant
    INNER JOIN partsltd_prod.Shop_Plant PLANT ON t_PS.id_plant = PLANT.id_plant
	INNER JOIN partsltd_prod.Shop_Address A ON PLANT.id_address = A.id_address
	INNER JOIN tmp_Region_Storage t_RS ON A.id_region = t_RS.id_region
	INNER JOIN partsltd_prod.Shop_Storage_Location SL ON t_LS.id_location = SL.id_location
    INNER JOIN partsltd_prod.Shop_Currency CURRENCY ON SI.id_currency_cost = CURRENCY.id_currency
	WHERE
		IFNULL(t_PP.can_view, 0) = 1
	;
    
    # Errors
    SELECT 
		t_ME.display_order,
		-- t_ME.guid,
        t_ME.id_type,
        t_ME.msg,
        MET.code, 
        MET.name,
        MET.description
    FROM tmp_Msg_Error t_ME
    INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    -- WHERE guid = v_guid
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
    
    
    -- Clean up
    DROP TEMPORARY TABLE IF EXISTS tmp_Region_Storage;
    DROP TEMPORARY TABLE IF EXISTS tmp_Plant_Storage;
    DROP TEMPORARY TABLE IF EXISTS tmp_Location_Storage;
	DROP TEMPORARY TABLE IF EXISTS tmp_Stock_Item;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
	-- DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    
	CALL partsltd_prod.p_shop_clear_calc_product_permutation ( v_guid );
    
    IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;;


/*
CALL p_shop_get_many_stock_item (
	1, # a_id_user
    1, # a_get_all_product_permutation
	-- 'nips', # a_guid_permutations
    0, # a_get_inactive_product_permutation
    '', # a_ids_product_permutation
	1, # a_get_all_stock_item
	0, # a_get_inactive_stock_item
	'', # a_ids_stock_item
    1, # a_get_all_region_storage
    0, # a_get_inactive_delivery_region
	'', # a_ids_region_storage
	1, # a_get_all_plant_storage
	0, # a_get_inactive_plant_storage
	'', # a_ids_plant_storage
	1, # a_get_all_location_storage
	0, # a_get_inactive_location_storage
	'', # a_ids_location_storage
	NULL, # a_date_received_to
	0, # a_get_sealed_stock_item_only
	0, # a_get_unsealed_stock_item_only
	0, # a_get_expired_stock_item_only
	0, # a_get_nonexpired_stock_item_only
	0, # a_get_consumed_stock_item_only
	0 # a_get_nonconsumed_stock_item_only
    , 0 # a_debug
);



DROP TABLE IF EXISTS tmp_Msg_Error;

select * FROM partsltd_prod.Shop_Storage_Location;
select * FROM partsltd_prod.Shop_product;
select * from TMP_MSG_ERROR;
DROP TABLE TMP_MSG_ERROR;

insert into shop_product_change_set (comment)
    values ('set product not subscription - test bool output to python');
    update shop_product
    set is_subscription = 0,
		id_change_set = (select id_change_set FROM partsltd_prod.Shop_product_change_set order by id_change_set desc limit 1)
    where id_product = 1
*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_stock_item;

DELIMITER //
CREATE PROCEDURE p_shop_save_stock_item (
    IN a_comment VARCHAR(500)
	, IN a_guid BINARY(36)
    , IN a_id_user INT
	, IN a_debug BIT
)
BEGIN
    
	DECLARE v_code_type_error_bad_data VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission LONGTEXT;
    DECLARE v_id_change_set INT;
    DECLARE v_id_access_level_edit INT;
    DECLARE v_time_start TIMESTAMP(6);
	DECLARE v_time_expire DATETIME;
    
    DECLARE exit handler for SQLEXCEPTION
    BEGIN
        -- Get diagnostic information
        GET DIAGNOSTICS CONDITION 1
            @sqlstate = RETURNED_SQLSTATE
            , @errno = MYSQL_ERRNO
            , @text = MESSAGE_TEXT
		;
        
        -- Rollback the transaction
        ROLLBACK;
        
        -- Select the error information
        -- SELECT 'Error' AS status, @errno AS error_code, @sqlstate AS sql_state, @text AS message;
        
		CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
			display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
			, guid BINARY(36) NOT NULL
			, id_type INT NULL
			, code VARCHAR(50) NOT NULL
			, msg VARCHAR(4000) NOT NULL
		);
        INSERT INTO tmp_Msg_Error (
			guid
            , id_type
            , code
            , msg
		)
        SELECT 
			a_guid
            , NULL
            , @errno
            , @text
		;
        SELECT *
        FROM tmp_Msg_Error;
		DROP TABLE IF EXISTS tmp_Msg_Error;
    END;
    
	SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_time_expire := DATE_ADD(v_time_start, INTERVAL 1000 YEAR);
    SET v_code_type_error_bad_data := 'BAD_DATA';
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_id_access_level_edit := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
    SET a_guid := IFNULL(a_guid, UUID());
    
    DROP TABLE IF EXISTS tmp_Stock_Item;
    
    CREATE TEMPORARY TABLE tmp_Stock_Item (
		id_stock INT NOT NULL
		, id_category INT NULL
		, id_product INT NOT NULL
		, id_permutation INT NULL
		, id_pairs_variations VARCHAR(4000) NULL
        , has_variations BIT NULL
		, date_purchased DATETIME NOT NULL
		, date_received DATETIME NULL
		, id_location_storage INT NOT NULL
		, id_currency_cost INT NOT NULL
		, cost_local_VAT_incl FLOAT NOT NULL
		, cost_local_VAT_excl FLOAT NOT NULL
		, is_sealed BIT NOT NULL
		, date_unsealed DATETIME NULL
		, date_expiration DATETIME NOT NULL
		, is_consumed BIT NOT NULL
		, date_consumed DATETIME NULL
		, active BIT NOT NULL
        , can_view BIT NULL
        , can_edit BIT NULL
        , can_admin BIT NULL
        , name_error VARCHAR(255) NOT NULL
        , is_new BIT NOT NULL
    );
        
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
		, id_type INT NULL
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
        
    
    -- Get data from Temp table
    INSERT INTO tmp_Stock_Item (
		id_stock
		-- , id_category
		, id_product
		, id_permutation
		, id_pairs_variations
        , has_variations
		, date_purchased
		, date_received
		, id_location_storage
		, id_currency_cost
		, cost_local_VAT_incl
		, cost_local_VAT_excl
		, is_sealed
		, date_unsealed
		, date_expiration
		, is_consumed
		, date_consumed
		, active
        # , name_error
        , is_new
	)
    SELECT 
		SI_T.id_stock
		-- , IFNULL(SI_T.id_category, P.id_category) AS id_category
		, IFNULL(IFNULL(SI_T.id_product, PP.id_product), 0) AS id_product
		, IFNULL(IFNULL(SI_T.id_permutation, PP.id_permutation), 0) AS id_permutation
		, TRIM(IFNULL(SI_T.id_pairs_variations, ''))
        , CASE WHEN TRIM(IFNULL(SI_T.id_pairs_variations, '')) = '' THEN 0 ELSE 1 END AS has_variations
		, IFNULL(IFNULL(SI_T.date_purchased, PP.date_purchased), v_time_start) AS date_purchased
		, IFNULL(SI_T.date_received, PP.date_received) AS date_received
		, IFNULL(IFNULL(SI_T.id_location_storage, PP.id_location_storage), 0) AS id_location_storage
		, IFNULL(IFNULL(SI_T.id_currency_cost, PP.id_currency_cost), 0) AS id_currency_cost
		, IFNULL(SI_T.cost_local_VAT_incl, PP.cost_local_VAT_incl) AS cost_local_VAT_incl
		, IFNULL(SI_T.cost_local_VAT_excl, PP.cost_local_VAT_excl) AS cost_local_VAT_excl
		, IFNULL(IFNULL(SI_T.is_sealed, PP.is_sealed), 1) AS is_sealed
		, IFNULL(SI_T.date_unsealed, PP.date_unsealed) AS date_unsealed
		, IFNULL(IFNULL(SI_T.date_expiration, PP.date_expiration), v_time_expire) AS date_expiration
		, IFNULL(IFNULL(SI_T.is_consumed, PP.is_consumed), 0) AS is_consumed
		, IFNULL(SI_T.date_consumed, PP.date_consumed) AS date_consumed
        , IFNULL(IFNULL(SI_T.active, PP.active), 1) AS active
		# , fn_shop_get_product_permutation_name(SI_T.id_permutation)
        , CASE WHEN IFNULL(SI_T.id_stock, 0) < 1 THEN 1 ELSE 0 END AS is_new
	FROM Shop_Stock_Item_Temp SI_T
    LEFT JOIN Shop_Product_Permutation PP ON SI_T.id_permutation = PP.id_permutation
	-- LEFT JOIN Shop_Product P ON PP.id_product = P.id_product
    WHERE SI_T.guid = a_guid
    ;
    
    -- Missing Permutation IDs for setting new permutation for stock item 
    -- With variations
	UPDATE tmp_Stock_Item t_SI
	INNER JOIN partsltd_prod.Shop_Product P ON t_SI.id_product = P.id_product
	SET t_SI.id_permutation = IFNULL(fn_shop_get_id_product_permutation_from_variation_csv_list ( t_SI.id_product, t_SI.id_pairs_variations ), 0)
    WHERE 1=1
		AND t_SI.id_permutation = 0
        AND t_SI.has_variations = 1
    ;
    -- Without variations
	UPDATE tmp_Stock_Item t_SI
	-- INNER JOIN Shop_Product P ON t_SI.id_product = P.id_product
    INNER JOIN partsltd_prod.Shop_Product_Permutation PP ON t_SI.id_product = PP.id_product
	SET t_SI.id_permutation = IFNULL(PP.id_permutation, 0)
    WHERE 1=1
		AND t_SI.id_permutation = 0
        AND t_SI.has_variations = 0
    ;
    
    -- Add stock item error names
	UPDATE tmp_Stock_Item t_SI
	INNER JOIN partsltd_prod.Shop_Product P ON t_SI.id_product = P.id_product
    INNER JOIN partsltd_prod.Shop_Category PC ON P.id_category = PC.id_category
    -- INNER JOIN Shop_Product_Permutation PP ON t_SI.id_product = PP.id_product
	SET t_SI.name_error = CONCAT(
			C.name,
            ' - ',
            P.name,
            ' - ',
			CASE WHEN IFNULL(t_SI.id_permutation, 0) = 0 THEN '(No permutation)' ELSE fn_shop_get_product_permutation_name ( t_SI.id_permutation ) END
		)
    ;
    
    
    -- Validation
    -- Missing mandatory fields
    -- id_product
    IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE t_SI.id_product = 0 LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, code
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a product: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Stock_Item t_SI
		WHERE t_SI.id_product = 0
		;
    END IF;
    -- id_permutation
    IF EXISTS (
		SELECT * 
        FROM tmp_Stock_Item t_SI 
        LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_SI.id_permutation = PP.id_permutation 
        WHERE 1=1
			AND (
				t_SI.id_permutation = 0
                OR PP.active = 0
			)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, code
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('A valid permutation could not be found for the variations selected for the following stock item(s): ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Stock_Item t_SI
        LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_SI.id_permutation = PP.id_permutation 
        WHERE 1=1
			AND (
				t_SI.id_permutation = 0
                OR PP.active = 0
			)
		;
    END IF;
    -- date_purchased
    IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE ISNULL(t_SI.date_purchased) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, code
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have an purchase date: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Stock_Item t_SI
		WHERE ISNULL(t_SI.date_purchased)
		;
    END IF;
    -- id_location_storage
    IF EXISTS (
		SELECT * 
        FROM tmp_Stock_Item t_SI
        INNER JOIN partsltd_prod.Shop_Storage_Location SL 
			ON t_SI.id_location_storage = SL.id_location
            AND SL.active = 1
        WHERE ISNULL(SL.id_location)
        LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, code
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid storage location: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
        FROM tmp_Stock_Item t_SI
        INNER JOIN partsltd_prod.Shop_Storage_Location SL 
			ON t_SI.id_location_storage = SL.id_location
            AND SL.active = 1
        WHERE ISNULL(SL.id_location)
		;
    END IF;
    -- id_currency_cost
    IF EXISTS (
		SELECT * 
        FROM tmp_Stock_Item t_SI
        INNER JOIN partsltd_prod.Shop_Currency C
			ON t_SI.id_curency_cost = C.id_currency
            AND C.active = 1
        WHERE ISNULL(C.id_currency)
        LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, code
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid cost currency: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
        FROM tmp_Stock_Item t_SI
        INNER JOIN partsltd_prod.Shop_Currency C
			ON t_SI.id_curency_cost = C.id_currency
            AND C.active = 1
        WHERE ISNULL(C.id_currency)
		;
    END IF;
    -- cost_local_VAT_excl
    IF EXISTS (
		SELECT * 
        FROM tmp_Stock_Item t_SI
        WHERE 1=1
			AND (
				ISNULL(t_SI.cost_local_VAT_excl)
                OR t_SI.cost_local_VAT_excl < 0
			)
        LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, code
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid cost excluding VAT: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
        FROM tmp_Stock_Item t_SI
        WHERE 1=1
			AND (
				ISNULL(t_SI.cost_local_VAT_excl)
                OR t_SI.cost_local_VAT_excl < 0
			)
		;
    END IF;
    -- cost_local_VAT_incl
    IF EXISTS (
		SELECT * 
        FROM tmp_Stock_Item t_SI
        WHERE 1=1
			AND (
				ISNULL(t_SI.cost_local_VAT_incl)
                OR t_SI.cost_local_VAT_incl < 0
			)
        LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, code
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid cost including VAT: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
        FROM tmp_Stock_Item t_SI
        WHERE 1=1
			AND (
				ISNULL(t_SI.cost_local_VAT_incl)
                OR t_SI.cost_local_VAT_incl < t_SI.cost_local_VAT_excl
			)
		;
    END IF;
    -- date_received
    IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE ISNULL(t_SI.date_received) OR t_SI.date_received < t_SI.date_purchased LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, code
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid received date: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Stock_Item t_SI
		WHERE 1=1
			AND (
				ISNULL(t_SI.date_received)
				OR t_SI.date_received < t_SI.date_purchased
			)
		;
    END IF;
    -- date_unsealed
    IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE ISNULL(t_SI.date_unsealed) OR t_SI.date_unsealed < t_SI.date_purchased LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, code
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid unsealed date: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Stock_Item t_SI
		WHERE 1=1
			AND (
				ISNULL(t_SI.date_unsealed)
				OR t_SI.date_unsealed < t_SI.date_purchased
			)
		;
    END IF;
    -- date_expiration
    IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE ISNULL(t_SI.date_expiration) OR t_SI.date_expiration < t_SI.date_purchased LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, code
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid expiration date: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Stock_Item t_SI
		WHERE 1=1
			AND (
				ISNULL(t_SI.date_expiration)
				OR t_SI.date_expiration < t_SI.date_purchased
			)
		;
    END IF;
    -- date_consumed
    IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE ISNULL(t_SI.date_consumed) OR t_SI.date_consumed < t_SI.date_purchased LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, code
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid consumed date: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Stock_Item t_SI
		WHERE 1=1
			AND (
				ISNULL(t_SI.date_consumed)
				OR t_SI.date_consumed < t_SI.date_purchased
			)
		;
    END IF;
    
    -- Permissions
	SET v_ids_product_permission := ( SELECT GROUP_CONCAT(t_SI.id_product SEPARATOR ',') FROM tmp_Stock_Item t_SI );
    
	IF NOT ISNULL(v_ids_product_permission) THEN
		SET v_id_permission_product = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
		
		CALL p_shop_calc_user(a_guid, a_id_user, FALSE, v_id_permission_product, v_id_access_level_edit, v_ids_product_permission);
		
		UPDATE tmp_Stock_Item t_SI
		INNER JOIN Shop_Product P ON t_SI.id_product = P.id_product
		INNER JOIN Shop_Calc_User_Temp UE_T
			ON P.id_product = UE_T.id_product
			AND UE_T.GUID = a_guid
		SET 
			t_SI.can_view = UE_T.can_view
			, t_SI.can_edit = UE_T.can_edit
			, t_SI.can_admin = UE_T.can_admin
		;
		
		CALL p_shop_clear_calc_user(a_guid);

		IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE IFNULL(t_SI.can_edit, 0) = 0 LIMIT 1) THEN
			INSERT INTO tmp_Msg_Error (
				guid
				, id_type
				, code
				, msg
			)
			SELECT
				a_guid AS GUID
				, v_id_type_error_bad_data
				, v_code_type_error_bad_data
				, CONCAT('The following stock item(s) do not have product edit permission: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
			FROM tmp_Stock_Item t_SI
			WHERE IFNULL(t_SI.can_edit, 0) = 0
			;
		END IF;
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		START TRANSACTION;
			
			IF NOT ISNULL(v_ids_product_permission) THEN
				INSERT INTO Shop_Product_Change_Set ( comment )
				VALUES ( a_comment )
				;
				
				SET v_id_change_set := LAST_INSERT_ID();
				-- select * from partsltd_prod.Shop_Stock_Item
				UPDATE partsltd_prod.Shop_Stock_Item
				INNER JOIN tmp_Stock_Item t_SI ON SI.id_stock = t_SI.id_stock
				SET 
					SI.id_permutation = t_SI.id_permutation
					, SI.date_purchased = t_SI.date_purchased
					, SI.date_received = t_SI.date_received
					, SI.id_location_storage = t_SI.id_location_storage
					, SI.id_currency_cost = t_SI.id_currency_cost
					, SI.cost_local_VAT_excl = t_SI.cost_local_VAT_excl
					, SI.cost_local_VAT_incl = t_SI.cost_local_VAT_incl
					, SI.is_sealed = t_SI.is_sealed
					, SI.date_unsealed = t_SI.date_unsealed
					, SI.date_expiration = t_SI.date_expiration
					, SI.is_consumed = t_SI.is_consumed
					, SI.date_consumed = t_SI.date_consumed
					, SI.active = t_SI.active
					, SI.id_change_set = v_id_change_set
				;
			END IF;
			
			INSERT INTO partsltd_prod.Shop_Stock_Item (
				id_permutation
				, date_purchased
				, date_received
				, id_location_storage
				, id_currency_cost
				, cost_local_VAT_excl
				, cost_local_VAT_incl
				, is_sealed
				, date_unsealed
				, date_expiration
				, is_consumed
				, date_consumed
				, active
				, created_by
				, created_on
			)
			SELECT
				t_SI.id_permutation
				, t_SI.date_purchased
				, t_SI.date_received
				, t_SI.id_location_storage
				, t_SI.id_currency_cost
				, t_SI.cost_local_VAT_excl
				, t_SI.cost_local_VAT_incl
				, t_SI.is_sealed
				, t_SI.date_unsealed
				, t_SI.date_expiration
				, t_SI.is_consumed
				, t_SI.date_consumed
				, t_SI.active
				, a_id_user AS created_by
				, v_time_start AS created_on
			FROM tmp_Stock_Item t_SI
			WHERE 
				is_new = 1
				AND active = 1
			;
		
			DELETE FROM partsltd_prod.Shop_Stock_Item_Temp
			WHERE GUID = a_guid;
			
		COMMIT;
    END IF;
    
    SELECT * FROM tmp_Msg_Error;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Stock_Item;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
END //
DELIMITER ;;


/*

DELETE FROM Shop_Product_Permutation_Temp
WHERE id_permutation = 1
;

INSERT INTO Shop_Product_Permutation_Temp (
	id_permutation, 
	id_product, 
	description, 
	cost_local, 
	id_currency_cost, 
	profit_local_min, 
	latency_manufacture_days,
	id_unit_measurement_quantity,
	count_unit_measurement_per_quantity_step,
	quantity_min, 
	quantity_max, 
	quantity_stock, 
	is_subscription, 
	id_unit_measurement_interval_recurrence, 
	count_interval_recurrence, 
	id_stripe_product,
	does_expire_faster_once_unsealed,
	id_unit_measurement_interval_expiration_unsealed,
	count_interval_expiration_unsealed,
	active,
	guid
)
VALUES
	(
		1 -- id_permutation, 
		, 1 -- id_product, 
		, 'Good Reddy Teddy' -- description, 
		, 5.0 -- cost_local, 
		, 1 -- id_currency_cost, 
		, 3.0 -- profit_local_min, 
		, 14 -- latency_manufacture_days,
		, 1 -- id_unit_measurement_quantity,
		, 1.0 -- count_unit_measurement_quantity,
		, 3.0 -- quantity_min, 
		, 99.0 -- quantity_max, 
		, 1.0 -- quantity_stock, 
		, False -- is_subscription, 
		, null -- id_unit_measurement_interval_recurrence, 
		, null -- count_interval_recurrence, 
		, null -- id_stripe_product,
		, False -- does_expire_faster_once_unsealed,
		, null -- id_unit_measurement_interval_expiration_unsealed,
		, null -- count_interval_expiration_unsealed,
		, True -- active,
		, 'NIPS' -- guid
    )
;

select 'Shop_Product_Permutation_Temp before call';
SELECT * FROM Shop_Product_Permutation_Temp;

SELECT 'Shop_Product_Permutation before call' AS result_name;
select * FROM Shop_Product_Permutation;

CALL p_shop_save_product_permutation (
    1, -- 'auth0|6582b95c895d09a70ba10fef', # a_id_user
    'Initial data', # a_comment
	'NIPS' # a_guid
);

SELECT 'Shop_Product_Permutation_Temp after call' AS result_name;
select * FROM Shop_Product_Permutation_Temp;

SELECT 'Shop_Product_Permutation after call' AS result_name;
select * FROM Shop_Product_Permutation;


DELETE FROM Shop_Product_Permutation_Temp
WHERE id_permutation = 1;


*/



-- Clear previous proc
DROP PROCEDURE IF EXISTS partsltd_prod.p_shop_save_stock_item_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_stock_item_test ()
BEGIN
	
	DECLARE v_guid BINARY(36);
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_guid := 'nips';

	SELECT *
	FROM partsltd_prod.Shop_Stock_Item
	;
	SELECT *
	FROM partsltd_prod.Shop_Stock_Item_Temp
	;

	START TRANSACTION;
		
		INSERT INTO partsltd_prod.Shop_Stock_Item_Temp (
			id_stock
			-- id_category
			, id_product
			, id_permutation
			, id_pairs_variations
			-- , has_variations
			, date_purchased
			, date_received
			, id_location_storage
			, id_currency_cost
			, cost_local_VAT_incl
			, cost_local_VAT_excl
			, is_sealed
			, date_unsealed
			, date_expiration
			, is_consumed
			, date_consumed
			, active
			, guid
		)
		VALUES (
			-1 -- id_stock
			-- 1 -- id_category
			, 4 -- id_product
            , NULL -- id_permutation
            , NULL -- id_pairs_variations
            -- , FALSE -- 0 -- has_variations
			, '05-09-2025' -- date_purchased
			, NULL -- date_received
			, 1 -- id_location_storage
			, 1 -- id_currency_cost
			, 10  -- cost_local_VAT_incl
			, 12 -- cost_local_VAT_excl
			, 1 -- is_sealed
			, NULL -- date_unsealed
			, NULL -- date_expiration
			, FALSE -- 0 -- is_consumed
			, NULL -- date_consumed
			, 1 -- active
			, v_guid
		);
		
	COMMIT;
    
	SELECT *
	FROM partsltd_prod.Shop_Stock_Item_Temp
	WHERE GUID = v_guid
    ;
    
    CALL partsltd_prod.p_shop_save_Stock_Item ( 
		'Test save Stock_Item' -- comment
        , v_guid -- guid
        , 1 -- id_user
		, 1 -- debug
    );
    
	SELECT *
	FROM partsltd_prod.Shop_Stock_Item
	;
	SELECT *
	FROM partsltd_prod.Shop_Stock_Item_Temp
	;
    
	CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
END //
DELIMITER ;;

/*
CALL partsltd_prod.p_shop_save_stock_item_test ();

DELETE FROM partsltd_prod.Shop_Stock_Item_Temp;

update shop_product p set p.has_variations = 0 where id_product = 4
DROP TABLE IF EXISTS tmp_Msg_Error;
*/-- USE partsltd_prod;

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_product_price_and_discount_and_delivery_option;

DELIMITER //
CREATE PROCEDURE p_shop_get_many_product_price_and_discount_and_delivery_option (
	IN a_id_user INT
    , IN a_get_all_product_permutation BIT
	, IN a_get_inactive_product_permutation BIT
	, IN a_ids_product_permutation TEXT
    , IN a_get_all_product_price BIT
	, IN a_get_inactive_product_price BIT
	, IN a_ids_product_price TEXT
    , IN a_product_price_min FLOAT
    , IN a_product_price_max FLOAT
    , IN a_get_all_currency BIT
	, IN a_get_inactive_currency BIT
    , IN a_ids_currency VARCHAR(4000)
    , IN a_get_all_discount BIT
	, IN a_get_inactive_discount BIT
    , IN a_ids_discount TEXT
    , IN a_get_all_delivery_option BIT
	, IN a_get_inactive_delivery_option BIT
    , IN a_ids_delivery_option TEXT
    , IN a_get_all_delivery_region BIT
	, IN a_get_inactive_delivery_region BIT
    , IN a_ids_delivery_region TEXT
    , IN a_debug BIT
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_product_permutation BIT;
    DECLARE v_has_filter_product_price BIT;
    DECLARE v_has_filter_currency BIT;
    DECLARE v_has_filter_discount BIT;
    DECLARE v_has_filter_delivery_option BIT;
    DECLARE v_has_filter_delivery_region BIT;
    DECLARE v_guid BINARY(36);
    # DECLARE v_id_user VARCHAR(100);
    DECLARE v_ids_permutation_unavailable VARCHAR(4000);
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission VARCHAR(4000);
    -- DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    -- DECLARE v_now DATETIME;
    DECLARE v_id_minimum INT;
    DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');
    
    
	-- Argument validation + default values
    SET a_id_user := TRIM(IFNULL(a_id_user, ''));
	SET a_get_all_product_permutation := TRIM(IFNULL(a_get_all_product_permutation, 1));
	SET a_get_inactive_product_permutation := TRIM(IFNULL(a_get_inactive_product_permutation, 0));
	SET a_ids_product_permutation := TRIM(IFNULL(a_ids_product_permutation, ''));
	SET a_get_all_delivery_region := TRIM(IFNULL(a_get_all_delivery_region, 1));
	SET a_get_inactive_delivery_region := TRIM(IFNULL(a_get_inactive_delivery_region, 0));
	SET a_ids_delivery_region := TRIM(IFNULL(a_ids_delivery_region, ''));
	SET a_get_all_currency := TRIM(IFNULL(a_get_all_currency, 1));
	SET a_get_inactive_currency := TRIM(IFNULL(a_get_inactive_currency, 0));
	SET a_ids_currency := TRIM(IFNULL(a_ids_currency, ''));
	SET a_get_all_discount := TRIM(IFNULL(a_get_all_discount, 1));
	SET a_get_inactive_discount := TRIM(IFNULL(a_get_inactive_discount, 0));
	SET a_ids_discount := TRIM(IFNULL(a_ids_discount, ''));
    SET a_debug := IFNULL(a_debug, 0);
    
    IF a_debug = 1 THEN
		SELECT
			a_id_user
			, a_get_all_variation_type
			, a_get_inactive_variation_type
			, a_get_first_variation_type_only
			, a_ids_variation_type
			, a_get_all_variation
			, a_get_inactive_variation
			, a_get_first_variation_only
			, a_ids_variation
			, a_debug
		;
    END IF;
    
    -- Temporary tables
    DROP TEMPORARY TABLE IF EXISTS tmp_Discount;
    DROP TEMPORARY TABLE IF EXISTS tmp_Currency;
    DROP TEMPORARY TABLE IF EXISTS tmp_Delivery_Region;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Image;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Variation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product_2;
    DROP TEMPORARY TABLE IF EXISTS tmp_Category;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    
    CREATE TEMPORARY TABLE tmp_Category (
		id_category INT NOT NULL
        , display_order INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Product (
		id_category INT NOT NULL
		, id_product INT NOT NULL
        , display_order INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Permutation (
		id_permutation INT NULL
		, id_product INT NOT NULL
        , can_view BIT
        , can_edit BIT
        , can_admin BIT
    );
    
    CREATE TEMPORARY TABLE tmp_Price (
		id_price INT
        , id_permutation INT
    );
    
    CREATE TEMPORARY TABLE tmp_Currency (
		id_currency INT NOT NULl
        /*
        active BIT NOT NULL
        display_order INT NOT NULL
        */
    );
    
    CREATE TEMPORARY TABLE tmp_Discount (
		id_discount INT NOT NULL
        /*
        active BIT NOT NULL,
        display_order INT NOT NULL
        */
    );
    
    CREATE TEMPORARY TABLE tmp_Delivery_Option (
		id_option INT NOT NULL
        /*
        active BIT NOT NULL,
        display_order INT NOT NULL,
        requires_delivery_option BIT NOT NULL DEFAULT 0
        */
    );
    
    CREATE TEMPORARY TABLE tmp_Delivery_Region (
		id_region INT NOT NULL
        /*
        active BIT NOT NULL,
        display_order INT NOT NULL,
        requires_delivery_option BIT NOT NULL DEFAULT 0
        */
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        -- guid BINARY(36) NOT NULL,
		id_type INT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Split (
		substring VARCHAR(4000) NOT NULL
        , as_int INT NULL
	);
    DELETE FROM tmp_Split;
    
    
    -- Parse filters
    SET v_has_filter_product_permutation = CASE WHEN a_ids_product_permutation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_product_price = CASE WHEN a_ids_product_price = '' THEN 0 ELSE 1 END;
    SET v_has_filter_currency = CASE WHEN a_ids_currency = '' THEN 0 ELSE 1 END;
    SET v_has_filter_discount = CASE WHEN a_ids_discount = '' THEN 0 ELSE 1 END;
    SET v_has_filter_delivery_option = CASE WHEN a_ids_delivery_option = '' THEN 0 ELSE 1 END;
    SET v_has_filter_delivery_region = CASE WHEN a_ids_delivery_region = '' THEN 0 ELSE 1 END;

	IF a_debug = 1 THEN
		SELECT
            v_has_filter_product_permutation
            , v_has_filter_product_price
            , v_has_filter_currency
            , v_has_filter_discount
            , v_has_filter_delivery_option
            , v_has_filter_delivery_region
		;
    END IF;
    
    CALL partsltd_prod.p_shop_calc_product_permutation (
		a_id_user
		, 1 -- a_get_all_product_category
		, 0 -- a_get_inactive_product_category
		, '' -- a_ids_product_category
		, 1 -- a_get_all_product
		, 0 -- a_get_inactive_product
		, '' -- a_ids_product
		, a_get_all_product_permutation
		, a_get_inactive_product_permutation
		, a_ids_product_permutation
		, 0 
		, v_guid -- a_guid
		, 0 -- a_debug 
    );
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		INSERT INTO tmp_Category (
			id_category
			, display_order
		)
		SELECT 
			PC.id_category
			, PC.display_order
		FROM (SELECT * FROM partsltd_prod.Shop_Product_Category_Temp WHERE GUID = v_guid) PC_T 
		INNER JOIN partsltd_prod.Shop_Product_Category PC ON PC_T.id_category = PC.id_category
		;
		
		INSERT INTO tmp_Product (
			id_product
			, id_category
			, display_order
		)
		SELECT 
			P.id_product
			, P.id_category
			, P.display_order
		FROM (SELECT * FROM partsltd_prod.Shop_Product_Temp WHERE GUID = v_guid) P_T 
		INNER JOIN partsltd_prod.Shop_Product P ON P.id_product = P_T.id_product
		;
		
		INSERT INTO tmp_Permutation (
			id_permutation
			, id_product
            , can_view
            , can_edit
            , can_admin
		)
		SELECT 
			PP.id_permutation
			, PP.id_product
            , PP_T.can_view
            , PP_T.can_edit
            , PP_T.can_admin
		FROM (SELECT * FROM partsltd_prod.Shop_Product_Permutation_Temp WHERE GUID = v_guid) PP_T
		INNER JOIN partsltd_prod.Shop_Product_Permutation PP ON PP_T.id_permutation = PP.id_permutation
		;
    
    # Product Prices
		CALL partsltd_prod.p_split(v_guid, a_ids_product_price, ',', a_debug);
        
        DELETE FROM tmp_Split;
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( v_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Product_Price PRICE ON t_S.as_int = PRICE.id_price
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(PRICE.id_price)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- v_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive product price IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Product_Price PRICE ON t_S.as_int = PRICE.id_price
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(PRICE.id_price)
			;
		ELSE
			INSERT INTO tmp_Price (
				id_price
                , id_permutation
			)
			SELECT 
				PRICE.id_price
                , PRICE.id_permutation
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_Product_Price PRICE ON t_S.as_int = PRICE.id_price
            INNER JOIN tmp_Permutation t_PP ON SI.id_permutation = t_PP.id_permutation
			WHERE 
				(
					a_get_all_stock_item = 1
					OR (
						v_has_filter_stock_item = 1
						AND NOT ISNULL(t_S.as_int)
					)
				)
				AND (
					a_get_inactive_stock_item = 1
					OR SI.active = 1
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    
	INSERT INTO tmp_Shop_Product (
		id_permutation,
		active_permutation,
        display_order_permutation
	)
    SELECT 
		PP.id_permutation,
		PP.active AS active_permutation,
		PP.display_order AS display_order_permutation
	FROM Shop_Product P
    INNER JOIN Shop_Product_Permutation PP
		ON P.id_product = PP.id_product
	INNER JOIN Shop_Product_Category C
		ON P.id_category = C.id_category
	WHERE
		# permutations
		(
			a_get_all_product_permutation 
			OR (
				v_has_filter_product_permutation 
				AND FIND_IN_SET(PP.id_permutation, a_ids_product_permutation) > 0
			)
			OR (
				a_get_products_quantity_stock_below_min = 1
				AND PP.quantity_stock < PP.quantity_min
			)
		)
		AND (
			a_get_inactive_product_permutation 
			OR PP.active
		)
    ;
    
    # Delivery Regions
    INSERT INTO tmp_Delivery_Region (
		id_region,
        active,
        display_order,
		requires_delivery_option
    )
    WITH RECURSIVE Recursive_CTE_Delivery_Region AS (
		SELECT 
			DR.id_region AS id_region_parent,
            NULL AS id_region_child,
            CASE WHEN FIND_IN_SET(DR.id_region, a_ids_delivery_region) > 0 THEN 1 ELSE 0 END AS requires_delivery_option
		FROM Shop_Product_Currency_Region_Link PCRL
		INNER JOIN Shop_Currency C ON PCRL.id_currency = C.id_currency
		INNER JOIN tmp_Shop_Product t_P 
			ON PCRL.id_product <=> t_P.id_product
			AND PCRL.id_permutation <=> t_P.id_permutation
		INNER JOIN Shop_Region DR ON PCRL.id_region_purchase = DR.id_region
		WHERE 
			(
				a_get_all_delivery_region
				OR FIND_IN_SET(DR.id_region, a_ids_delivery_region) > 0
			)
			AND (
				a_get_inactive_delivery_region
				OR DR.active = 1
			)
		UNION
        SELECT 
			DRB.id_region_parent,
			DRB.id_region_child,
            0 AS requires_delivery_option
		FROM Shop_Region_Branch DRB
        INNER JOIN Recursive_CTE_Delivery_Region r_DR 
			ON DRB.id_region_parent = r_DR.id_region_child
            AND (
				a_get_inactive_delivery_region
                OR DRB.active = 1
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
			a_get_all_category 
			OR a_get_all_product
			OR a_get_all_product_permutation
		)*
		FIND_IN_SET(t_P.id_category, a_ids_category) > 0
		OR FIND_IN_SET(t_P.id_product, a_ids_product) > 0
		OR FIND_IN_SET(t_P.id_permutation, a_ids_product_permutation) > 0
	;
    */
    
    IF v_has_filter_delivery_region THEN
		SET v_ids_permutation_unavailable = (
			SELECT GROUP_CONCAT(t_P.id_permutation SEPARATOR ', ')
			FROM (
				SELECT * 
				FROM tmp_Shop_Product t_P 
				WHERE
					/*(
						a_get_all_category 
						OR a_get_all_produc
						OR a_get_all_product_permutation
					)*/
					FIND_IN_SET(t_P.id_category, a_ids_category) > 0
					OR FIND_IN_SET(t_P.id_product, a_ids_product) > 0
					OR FIND_IN_SET(t_P.id_permutation, a_ids_product_permutation) > 0
			) t_P
			LEFT JOIN (
				SELECT *
				FROM Shop_Product_Currency_Region_Link PCRL
				WHERE 
					(
						a_get_all_delivery_region
						OR FIND_IN_SET(PCRL.id_region_purchase, a_ids_delivery_region) > 0
					)
			) PCRL
				ON t_P.id_product <=> PCRL.id_product
				AND t_P.id_permutation <=> PCRL.id_permutation
			LEFT JOIN tmp_Delivery_Region t_DR
				ON PCRL.id_region_purchase = t_DR.id_region
				AND t_DR.requires_delivery_option = 1
			WHERE 
				ISNULL(t_DR.id_region)
		);
        IF NOT ISNULL(v_ids_permutation_unavailable) THEN
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
				CONCAT('Error: The following permutation IDs are not available in this region: ', IFNULL(v_ids_permutation_unavailable, 'NULL'))
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
    
    -- select * from tmp_Shop_Product;
    
    # Currencies
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid) THEN
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
		
		-- select * from tmp_Currency;
		
		IF v_has_filter_currency THEN
			SET v_ids_permutation_unavailable = (
				SELECT GROUP_CONCAT(t_P.id_permutation SEPARATOR ', ')
				FROM (
					SELECT * 
					FROM tmp_Shop_Product t_P 
					WHERE 
						/*(
							a_get_all_category 
							OR a_get_all_product
							OR a_get_all_product_permutation
						)*/
						FIND_IN_SET(t_P.id_category, a_ids_category) > 0
						OR FIND_IN_SET(t_P.id_product, a_ids_product) > 0
						OR FIND_IN_SET(t_P.id_permutation, a_ids_product_permutation) > 0
				) t_P
				INNER JOIN (
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
                    code,
					msg
				)
				VALUES (
					v_guid,
					(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'PRODUCT_AVAILABILITY' LIMIT 1),
					'PRODUCT_AVAILABILITY',
					CONCAT('Error: The following permutation IDs are not available in this currency: ', IFNULL(v_ids_permutation_unavailable, 'NULL'))
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
    END IF;
    
    # Discounts
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid) THEN
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
    END IF;
    # select 'pre-permission results';
    # select * from tmp_Shop_Product;
    
    -- Permissions
    IF EXISTS (SELECT * FROM tmp_Shop_Product_Category LIMIT 1) THEN
        # SET v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER());
        SET v_id_permission_product := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
        SET v_ids_product_permission := (SELECT GROUP_CONCAT(id_product SEPARATOR ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_product));
        -- SET v_ids_permutation_permission := (SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission;
        -- select * from Shop_Calc_User_Temp;
        
        CALL p_shop_calc_user(v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission);
        
        -- select * from Shop_Calc_User_Temp;
        
        UPDATE tmp_Shop_Product t_P
        INNER JOIN Shop_Calc_User_Temp UE_T
			ON t_P.id_product = UE_T.id_product
			AND UE_T.GUID = v_guid
        SET t_P.can_view = UE_T.can_view,
			t_P.can_edit = UE_T.can_edit,
            t_P.can_admin = UE_T.can_admin
		;
		-- select * from Shop_Calc_User_Temp;
		-- select * from tmp_Shop_Product;
        
        DELETE -- t_P
        FROM tmp_Shop_Product t_P
		WHERE 
			FIND_IN_SET(t_P.id_product, (SELECT GROUP_CONCAT(UET.id_product SEPARATOR ',') FROM Shop_Calc_User_Temp UET)) = 0 # id_product NOT LIKE CONCAT('%', (SELECT GROUP_CONCAT(id_product SEPARATOR '|') FROM Shop_Calc_User_Temp), '%');
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
					NOT v_has_filter_product_permutation 
                    OR FIND_IN_SET(t_P.id_permutation, a_ids_product_permutation) = 0
				)
            )
        ;
        
        CALL p_shop_clear_calc_user(v_guid);
        # DROP TABLE IF EXISTS Shop_Calc_User_Temp;
        /*
        DELETE FROM Shop_Calc_User_Temp UE_T
        WHERE UE_T.GUID = v_guid
        ;
        */
    END IF;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns
    -- SET v_now := NOW();
    
    # Categories
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
    
    # Products
    SELECT 
		t_P.id_product,
		t_P.id_permutation,
        t_P.name,
        t_P.description,
        P.has_variations,
        P.id_category,
        PP.cost_local,
        PP.id_currency_cost,
        CURRENCY.code AS code_currency_cost,
        CURRENCY.symbol AS symbol_currency_cost,
        PP.profit_local_min,
        t_P.latency_manufacture_days,
        t_P.quantity_min,
        t_P.quantity_max,
        t_P.quantity_step,
        t_P.quantity_stock,
        t_P.id_stripe_product,
        t_P.is_subscription,
        UM.name_singular AS name_interval_recurrence,
        UM.name_plural AS name_plural_interval_recurrence,
        PP.count_interval_recurrence,
        t_P.display_order_category,
        t_P.display_order_product,
        t_P.display_order_permutation,
        IFNULL(t_P.can_view, 0) AS can_view,
        IFNULL(t_P.can_edit, 0) AS can_edit,
        IFNULL(t_P.can_admin, 0) AS can_admin
    FROM tmp_Shop_Product t_P
    INNER JOIN Shop_Product P ON t_P.id_product = P.id_product
    INNER JOIN Shop_Product_Permutation PP ON t_P.id_permutation = PP.id_permutation
	-- LEFT JOIN Shop_Interval_Recurrence RI ON t_P.id_unit_measurement_interval_recurrence = RI.id_interval
	LEFT JOIN Shop_Unit_Measurement UM ON PP.id_unit_measurement_interval_recurrence = UM.id_unit_measurement
    INNER JOIN Shop_Currency CURRENCY ON PP.id_currency_cost = CURRENCY.id_currency
	ORDER BY t_P.rank_permutation
	;
    
    # Variations
    SELECT 
		V.id_variation
        , V.code AS code_variation
        , V.name AS name_variation
        , V.active AS active_variation
		, V.display_order
        , V.id_type
        , VT.code AS code_variation_type
        , VT.name AS name_variation_type
        , VT.name_plural AS name_plural_variation_type
        , VT.active AS active_variation_type
		, VT.display_order
        , t_P.id_product
        , t_P.id_permutation
        , t_P.id_category
    FROM Shop_Variation V
	INNER JOIN Shop_Variation_Type VT ON V.id_type = VT.id_type
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
    -- select * from Shop_Product_Currency_Region_Link;
    -- select * from shop_currency;
    /*
    select * from tmp_Currency;
    select * from tmp_delivery_region;
    select * from tmp_shop_product;
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
		ON PCRL.id_product <=> t_P.id_product
		AND PCRL.id_permutation <=> t_P.id_permutation
	-- INNER JOIN Shop_Product P ON PCRL.id_product = P.id_product
	INNER JOIN tmp_Currency t_C ON PCRL.id_currency = t_C.id_currency
	INNER JOIN Shop_Currency C ON t_C.id_currency = C.id_currency
	INNER JOIN tmp_Delivery_Region t_DR ON PCRL.id_region_purchase = t_DR.id_region
    WHERE (
        a_get_inactive_product 
        AND a_get_inactive_product_permutation
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
    INNER JOIN Shop_Product_Image I
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
    INNER JOIN Shop_Product_Permutation_Delivery_Option_Link PDOL
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
        *
    FROM tmp_Msg_Error t_ME
    INNER JOIN Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
    -- WHERE guid = v_guid
    ;
    
    
    -- Clean up
    DROP TEMPORARY TABLE IF EXISTS tmp_Discount;
    DROP TEMPORARY TABLE IF EXISTS tmp_Currency;
    DROP TEMPORARY TABLE IF EXISTS tmp_Delivery_Region;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Image;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Variation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product_2;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product_Category;
    DROP TEMPORARY TABLE IF EXISTS tmp_Category;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    
    
	CALL partsltd_prod.p_shop_clear_calc_product_permutation ( v_guid );
    
    IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;;


/*

CALL partsltd_prod.p_shop_get_many_product_price_and_discount_and_delivery_option (
	IN a_id_user INT,
    IN a_get_all_product_permutation BIT,
	IN a_get_inactive_product_permutation BIT,
	IN a_ids_product_permutation VARCHAR(4000),
    IN a_get_all_delivery_region BIT,
	IN a_get_inactive_delivery_region BIT,
    IN a_ids_delivery_region VARCHAR(4000),
    IN a_get_all_currency BIT,
	IN a_get_inactive_currency BIT,
    IN a_ids_currency VARCHAR(4000),
    IN a_get_all_discount BIT,
	IN a_get_inactive_discount BIT,
    IN a_ids_discount VARCHAR(4000)
);

select * FROM Shop_Calc_User_Temp;

select * from Shop_Product_Permutation;
select * from shop_product_change_set;
insert into shop_product_change_set ( comment ) values ('set stock quantities below minimum for testing');
update shop_product_permutation
set quantity_stock = 0,
	id_change_set = (select id_change_set from shop_product_change_set order by id_change_set desc limit 1)
where id_permutation < 5

DROP TABLE IF EXISTS tmp_Msg_Error;

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

select * FROM Shop_Calc_User_Temp;
select distinct guid 
-- DELETE
FROM Shop_Calc_User_Temp;
*/



/*

CALL p_shop_get_many_stripe_price_new (
	''
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_stripe_price_new;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_stripe_price_new (
	IN a_id_user INT
)
BEGIN
    DECLARE v_has_filter_user BIT;
    DECLARE v_code_error_data VARCHAR(200);
    DECLARE v_code_error_permission VARCHAR(200);
    DECLARE v_guid BINARY(36);
    
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
		id_user INT NOT NULL PRIMARY KEY,
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
        guid BINARY(36) NOT NULL,
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
		CALL p_shop_calc_user (
			v_guid, # a_guid
			a_id_user, 	# a_id_user
			0,		# a_get_inactive_users
			CONVERT((SELECT id_permission FROM Shop_Permission WHERE 'STORE_ADMIN' = code), CHAR),		# a_ids_permission
			(SELECT id_access_level FROM Shop_Access_Level WHERE code = 'ADMIN' AND active),		# a_ids_access_level
			(SELECT GROUP_CONCAT(DISTINCT id_product SEPARATOR ',') FROM tmp_Shop_Product_Currency_Link), #  (SELECT DISTINCT id_product FROM tmp_Shop_Product_Currency_Link) calc_PCL)		# a_ids_product
            (SELECT GROUP_CONCAT(DISTINCT id_permutation SEPARATOR ',') FROM tmp_Shop_Product_Currency_Link) # a_ids_permutation
		);
		# SELECT * FROM tmp_Msg_Error LIMIT 1;
        
        IF EXISTS (SELECT can_admin FROM Shop_Calc_User_Temp WHERE guid = v_guid AND NOT can_admin LIMIT 1) THEN
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
        
        DELETE FROM Shop_Calc_User_Temp
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
		P.count_interval_recurrence
	FROM tmp_Shop_Product_Currency_Link t_PCL
	INNER JOIN Shop_Product P
		ON t_PCL.id_product = P.id_product
		AND P.active
	INNER JOIN Shop_Interval_Recurrence RI
		ON P.id_unit_measurement_interval_recurrence = RI.id_interval
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
DELIMITER ;;


/*
CALL p_shop_get_many_stripe_price_new (
	''
);

CALL p_shop_get_many_stripe_price_new (
	'auth0|6582b95c895d09a70ba10fef'
);

*/



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
	IN a_id_user INT,
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
		id_user INT NOT NULL,
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
DELIMITER ;;



/*

CALL p_shop_edit_user (
	'',
	'',
	'',
    0
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_get_many_user;


DELIMITER //
CREATE PROCEDURE p_get_many_user (
	IN a_id_user INT
    , IN a_id_user_auth0 VARCHAR(200)
	, IN a_get_all_user BIT
	, IN a_get_inactive_user BIT
    , IN a_get_first_user_only BIT
	, IN a_ids_user LONGTEXT
    , IN a_ids_user_auth0 LONGTEXT
    , IN a_debug BIT
)
BEGIN
    DECLARE v_id_access_level_admin INT;
    DECLARE v_id_access_level_view INT;
    DECLARE v_id_permission_store_admin INT;
    DECLARE v_id_permission_user INT;
    DECLARE v_id_permission_user_admin INT;
    DECLARE v_ids_permission_required VARCHAR(4000);
    DECLARE v_now DATETIME;
    DECLARE v_id_minimum INT;
    DECLARE v_code_error_bad_data VARCHAR(50);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_has_filter_user BIT;
    DECLARE v_has_filter_user_auth0 BIT;
    DECLARE v_guid BINARY(36);
    DECLARE v_rank_max INT;
    DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_guid := UUID();
    SET v_id_access_level_admin := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'ADMIN' LIMIT 1);
    SET v_id_access_level_view := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_id_permission_store_admin := (SELECT id_permission FROM partsltd_prod.Shop_Permission WHERE code = 'STORE_ADMIN' LIMIT 1);
    SET v_id_permission_user := (SELECT id_permission FROM partsltd_prod.Shop_Permission WHERE code = 'STORE_USER' LIMIT 1);
    SET v_id_permission_user_admin := (SELECT id_permission FROM partsltd_prod.Shop_Permission WHERE code = 'STORE_USER_ADMIN' LIMIT 1);
    SET v_code_error_bad_data := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_bad_data := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_error_bad_data LIMIT 1);
    SET v_ids_permission_required := CONCAT(v_id_permission_user, ',', v_id_permission_user_admin, ',', v_id_permission_store_admin);
    
    SET a_get_all_user := IFNULL(a_get_all_user, 1);
    SET a_get_inactive_user := IFNULL(a_get_inactive_user, 0);
    SET a_get_first_user_only := IFNULL(a_get_first_user_only, 0);
    SET a_ids_user := TRIM(IFNULL(a_ids_user, ''));
    SET a_ids_user_auth0 := TRIM(IFNULL(a_ids_user_auth0, ''));
    SET a_debug := IFNULL(a_debug, 0);
    
    IF a_debug = 1 THEN
		SELECT
			a_id_user
			, a_id_user_auth0
			, a_get_all_user
			, a_get_inactive_user
			, a_get_first_user_only
			, a_ids_user
			, a_ids_user_auth0
			, a_debug
		;
    END IF;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_User;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    
    CREATE TEMPORARY TABLE tmp_User (
		id_user INT NULL
        , rank_user INT NULL
        , can_admin_store BIT NULL
        , can_admin_user BIT NULL
    );
    
	CREATE TEMPORARY TABLE tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        -- guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Split (
		substring VARCHAR(4000) NOT NULL
        , as_int INT NULL
	);
    
    IF ISNULL(a_id_user) AND NOT ISNULL(a_id_user_auth0) THEN
		SET a_id_user := (SELECT U.id_user FROM partsltd_prod.Shop_User U WHERE U.id_user_auth0 = a_id_user_auth0 LIMIT 1); -- LIKE CONCAT('%', a_id_user_auth0, '%') LIMIT 1);
    END IF;
    
    IF ISNULL(a_id_user) THEN
		INSERT INTO tmp_Msg_Error (
			guid,
			id_type,
			code,
			msg
		)
		VALUES (
			v_guid,
			v_id_type_error_bad_data,
			v_code_error_bad_data, 
			CONCAT('User ID required for authorisation.')
		)
		;
    END IF;
    
    SET v_has_filter_user := CASE WHEN a_ids_user = '' THEN 0 ELSE 1 END;
    SET v_has_filter_user_auth0 := CASE WHEN a_ids_user_auth0 = '' THEN 0 ELSE 1 END;
    
	IF a_debug = 1 THEN
		SELECT
            v_has_filter_user
            , v_has_filter_user_auth0
		;
    END IF;
    
    -- User IDs
    IF (NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) AND v_has_filter_user = 1) THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_user, ',', FALSE);
        
        DELETE FROM tmp_Split;
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( v_guid );
	END IF;
    
    IF (NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) AND v_has_filter_user = 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_User U ON t_S.as_int = U.id_user
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(U.id_user)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- v_guid,
				v_id_type_error_bad_data,
				v_code_error_bad_data, 
				CONCAT('Invalid or inactive User IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_User U ON t_S.as_int = U.id_user
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(U.id_user)
			;
		ELSE
			INSERT INTO tmp_User (
				id_user
                , rank_user
			)
			SELECT 
				U.id_user
                , RANK() OVER (ORDER BY U.id_user DESC) AS rank_user
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_User U ON t_S.as_int = U.id_user
			WHERE 
				(
					a_get_all_user = 1
					OR (
						v_has_filter_user = 1
						AND NOT ISNULL(t_S.as_int)
					)
				)
				AND (
					a_get_inactive_user = 1
					OR U.active = 1
				)
			;
		END IF;
	END IF;
    
    -- Auth0 User IDs
    IF (NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) AND v_has_filter_user_auth0 = 1) THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_user_auth0, ',', FALSE);
        
        DELETE FROM tmp_Split;
		
		INSERT INTO tmp_Split (
			substring
		)
		SELECT 
			substring
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( v_guid );
	END IF;
    
    IF (NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) AND v_has_filter_user_auth0 = 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_User U ON t_S.substring = U.id_user_auth0
			WHERE 
				ISNULL(t_S.substring) 
                OR ISNULL(U.id_user_auth0)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- v_guid,
				v_id_type_error_bad_data,
				v_code_error_bad_data, 
				CONCAT('Invalid or inactive Auth0 User IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_User U ON t_S.substring = U.id_user_auth0
			WHERE 
				ISNULL(t_S.substring) 
				OR ISNULL(U.id_user_auth0)
			;
		ELSE
			SET v_rank_max := IFNULL((SELECT rank_user FROM tmp_User ORDER BY rank_user DESC LIMIT 1), 0);
        
			INSERT INTO tmp_User (
				id_user
                , rank_user
			)
			SELECT 
				U.id_user
                , v_rank_max + (RANK() OVER (ORDER BY U.id_user DESC)) AS rank_user
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_User U ON t_S.substring = U.id_user_auth0
			WHERE 
				(
					a_get_all_user = 1
					OR (
						v_has_filter_user_auth0 = 1
						AND NOT ISNULL(t_S.substring)
					)
				)
				AND (
					a_get_inactive_user = 1
					OR U.active = 1
				)
			;
		END IF;
	END IF;
    
    IF a_debug = 1 THEN
		SELECT * FROM tmp_User;
    END IF;

    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN    
		IF a_get_first_user_only THEN
			DELETE t_U
			FROM tmp_User t_U
			WHERE t_U.rank_user > 1
			;
		END IF;
	END IF;
    
    IF a_debug = 1 THEN
		SELECT * FROM tmp_User;
    END IF;
    
    -- Can admin store
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
        IF a_debug = 1 THEN
			SELECT 
				v_guid -- guid
				, a_id_user -- ids_user
				, FALSE -- get_inactive_user
				, v_id_permission_store_admin -- ids_permission
				, v_id_access_level_admin -- ids_access_level
				, '' -- ids_product
				, 0 -- a_debug
			;
			SELECT * FROM partsltd_prod.Shop_Calc_User_Temp;
        END IF;
        
        CALL partsltd_prod.p_shop_calc_user(
			v_guid -- guid
            , a_id_user -- ids_user
            , FALSE -- get_inactive_user
            , v_id_permission_store_admin -- ids_permission
            , v_id_access_level_admin -- ids_access_level
            , '' -- ids_product
            , 0 -- a_debug
		);
        
        IF a_debug = 1 THEN
			SELECT * FROM partsltd_prod.Shop_Calc_User_Temp WHERE GUID = v_guid;
        END IF;
        
        UPDATE tmp_User t_U
        INNER JOIN partsltd_prod.Shop_Calc_User_Temp CUT 
			ON CUT.GUID = v_guid
            AND t_U.id_user = CUT.id_user
        SET t_U.can_admin_store = CUT.can_admin
        ;
        
		CALL partsltd_prod.p_shop_clear_calc_user( v_guid, FALSE );
	END IF;
    
    -- Can admin user
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
        IF a_debug = 1 THEN
			SELECT 
				v_guid -- guid
				, a_id_user -- ids_user
				, FALSE -- get_inactive_user
				, v_id_permission_user_admin -- ids_permission
				, v_id_access_level_admin -- ids_access_level
				, '' -- ids_product
				, 0 -- a_debug
			;
			SELECT * FROM partsltd_prod.Shop_Calc_User_Temp;
        END IF;
        
        CALL partsltd_prod.p_shop_calc_user(
			v_guid -- guid
            , a_id_user -- ids_user
            , FALSE -- get_inactive_user
            , v_id_permission_user_admin -- ids_permission
            , v_id_access_level_admin -- ids_access_level
            , '' -- ids_product
            , 0 -- a_debug
		);
        
        IF a_debug = 1 THEN
			SELECT * FROM partsltd_prod.Shop_Calc_User_Temp WHERE GUID = v_guid;
        END IF;
        
        UPDATE tmp_User t_U
        INNER JOIN partsltd_prod.Shop_Calc_User_Temp CUT 
			ON CUT.GUID = v_guid
            AND t_U.id_user = CUT.id_user
        SET t_U.can_admin_user = CUT.can_admin
        ;
        
		CALL partsltd_prod.p_shop_clear_calc_user( v_guid, FALSE );
	END IF;

    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
        IF a_debug = 1 THEN
			SELECT 
				v_guid -- guid
				, a_id_user -- ids_user
				, FALSE -- get_inactive_user
				, v_ids_permission_required -- ids_permission
				, v_id_access_level_view -- ids_access_level
				, '' -- ids_product
				, 0 -- a_debug
			;
			SELECT * FROM partsltd_prod.Shop_Calc_User_Temp;
        END IF;
        
        CALL partsltd_prod.p_shop_calc_user(
			v_guid -- guid
            , a_id_user -- ids_user
            , FALSE -- get_inactive_user
            , v_ids_permission_required -- ids_permission
            , v_id_access_level_view -- ids_access_level
            , '' -- ids_product
            , 0 -- a_debug
		);
        
        IF a_debug = 1 THEN
			SELECT * FROM partsltd_prod.Shop_Calc_User_Temp WHERE GUID = v_guid;
        END IF;
        
        IF NOT EXISTS (
			SELECT can_view 
            FROM partsltd_prod.Shop_Calc_User_Temp CUT 
            WHERE 1=1
				AND CUT.GUID = v_guid
                AND can_view = 1
                -- AND FIND_IN_SET(v_ids_permission_required, CUT.id_permission_required) > 0
		) THEN
			INSERT INTO tmp_Msg_Error (
                id_type,
				code,
				msg
			)
			VALUES (
                v_id_type_error_bad_data,
				v_code_error_bad_data, 
                -- CONCAT('You do not have view permissions for ', (SELECT name FROM partsltd_prod.Shop_Permission WHERE id_permission = v_id_permission_user LIMIT 1))
 				-- CONCAT('You do not have view permissions for ', (SELECT GROUP_CONCAT(name SEPARATOR ', ') FROM partsltd_prod.Shop_Permission WHERE FIND_IN_SET(v_id_permission_user, id_permission) > 0))
				CONCAT('You do not have view permissions for ', (SELECT name FROM partsltd_prod.Shop_Permission P INNER JOIN partsltd_prod.Shop_Calc_User_Temp CUT ON P.id_permission = CUT.id_permission_required WHERE GUID = v_guid AND IFNULL(can_view, 0) = 0 LIMIT 1)) --  WHERE IFNULL(CUT.can_view, 0) = 0
			)
			;
		ELSE
			-- INSERT INTO 
            SET a_debug := a_debug;
        END IF;
        
		CALL partsltd_prod.p_shop_clear_calc_user( v_guid, FALSE );
	END IF;
    
    
    -- Returns
    /* NULL record required for flask sql_alchemy to detect result set */
    IF EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		DELETE FROM tmp_User;
        INSERT INTO tmp_User ( id_user )
        VALUES ( NULL );
    END IF;
    
    
	SELECT 
		U.id_user
		, U.id_user_auth0
		, U.firstname
		, U.surname
		, U.email
		, U.is_email_verified
		, U.id_currency_default
		, U.id_region_default
		, U.is_included_VAT_default
		, U.is_super_user
		, t_U.can_admin_store
		, t_U.can_admin_user
	FROM tmp_User t_U
	INNER JOIN partsltd_prod.Shop_User U ON t_U.id_user = U.id_user
	;
    
    # Errors
    SELECT 
        t_ME.display_order,
        MET.code, 
        t_ME.msg,
        MET.name,
        MET.description
    FROM tmp_Msg_Error t_ME
    INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    ;
    
    
    IF a_debug = 1 THEN
		SELECT * FROM tmp_User;
    END IF;
    
    -- Clean up
    DROP TEMPORARY TABLE IF EXISTS tmp_User;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
	
	/*
	DELETE FROM partsltd_prod.Shop_Calc_User_Temp
	WHERE GUID = v_guid;
	*/
    
    IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;;


/*

CALL p_get_many_user (
	NULL # a_id_user
    , 'auth0|6582b95c895d09a70ba10fef' # a_id_user_auth0
    , 0 # a_get_all_user
	, 0 # a_get_inactive_user
    , 0 # a_get_first_user_only
	, NULL # a_ids_user
	, 'auth0|6582b95c895d09a70ba10fef' # a_ids_user_auth0
    , 1 -- a_debug
);

select * FROM partsltd_prod.Shop_Calc_User_Temp;
delete FROM partsltd_prod.Shop_Calc_User_Temp;

SELECT * 
FROM partsltd_prod.Shop_USER;

CALL p_get_many_user(
	NULL -- :a_id_user, 
    , 'auth0|6582b95c895d09a70ba10fef' -- :a_id_user_auth0, 
    , 1 -- :a_get_all_user,
    , 0 --  :a_get_inactive_user,
    , 0 --  :a_get_first_user_only,
    , NULL --  :a_ids_user,
    , 'auth0|6582b95c895d09a70ba10fef' --  :a_ids_user_auth0
);

*/



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
	IN a_id_user INT,
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
    DECLARE v_guid BINARY(36);
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
		id_user INT NOT NULL,
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
			REFERENCES Shop_Product_Category(id_category),
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
        guid BINARY(36) NOT NULL,
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
		# Get product ids
		CALL p_split(a_guid, a_ids_permutation_basket, ',');
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
		CALL p_split(a_guid, a_quantities_permutation_basket, ',');
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
            INNER JOIN Shop_Product_Category C 
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
	INNER JOIN Shop_Product_Category C
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
DELIMITER ;;


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




-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_supplier;


DELIMITER //
CREATE PROCEDURE p_shop_save_supplier (
	IN a_guid VARCHAR(500),
    IN a_id_user INT,
    IN a_comment VARCHAR(500),
    IN a_id_supplier INT,
    IN a_name_company VARCHAR(256),
    IN a_name_contact VARCHAR(256),
    IN a_department_contact VARCHAR(256),
    IN a_id_address INT,
    IN a_phone_number VARCHAR(20),
    IN a_fax VARCHAR(20),
    IN a_email VARCHAR(515),
    IN a_website VARCHAR(300),
    IN a_id_currency INT,
    IN a_active BIT
)
BEGIN
    DECLARE v_id_error_type_bad_data INT;
    DECLARE v_id_error_type_no_permission INT;
	DECLARE v_guid_permission BINARY(36);
    DECLARE v_id_user VARCHAR(100);
    DECLARE v_id_permission_supplier INT;
    -- DECLARE v_id_access_level_EDIT INT;
    DECLARE v_has_permission BIT;
    DECLARE v_id_change_set INT;
    DECLARE v_is_new_supplier BIT;
    
    SET v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA');
	SET v_guid_permission = UUID();
	SET v_id_user = CURRENT_USER();
	SET v_id_permission_supplier = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_SUPPLIER' LIMIT 1);
	-- SET v_id_access_level_EDIT = (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT');
    
	-- Argument default values
    IF a_guid IS NULL THEN 
		SET a_guid = UUID();
	END IF;
    
    
    -- Temporary tables
    /*
    CREATE TABLE tmp_Shop_Supplier (
		id_supplier INT NOT NULL,
		name_company VARCHAR(255) NOT NULL,
		name_contact VARCHAR(255) NULL,
		department_contact VARCHAR(255) NULL,
		id_address INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Supplier_id_address
			FOREIGN KEY (id_address)
			REFERENCES Shop_Address(id_address),
		phone_number VARCHAR(50) NULL,
		fax VARCHAR(50) NULL,
		email VARCHAR(255) NOT NULL,
		website VARCHAR(255) NULL,
		id_currency INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Supplier_id_currency
			FOREIGN KEY (id_currency)
			REFERENCES Shop_Currency(id_currency),
		active BIT NOT NULL,
        can_view BIT NOT NULL, 
        can_edit BIT NOT NULL, 
        can_admin BIT NOT NULL
    );
    */
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Argument validation
	IF a_id_supplier IS NULL THEN
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(a_guid, v_id_error_type_bad_data, 'Supplier ID must not be null')
        ;
    END IF;
	IF a_name_company IS NULL THEN
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(a_guid, v_id_error_type_bad_data, 'Supplier company name must not be null')
        ;
    END IF;
	IF a_id_address IS NULL THEN
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(a_guid, v_id_error_type_bad_data, 'Address ID must not be null')
        ;
    END IF;
	IF a_email IS NULL THEN
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(a_guid, v_id_error_type_bad_data, 'Email must not be null')
        ;
    END IF;
	IF a_active IS NULL THEN
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(a_guid, v_id_error_type_bad_data, 'Active must not be null')
        ;
    END IF;
    
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		SET v_is_new_supplier := CASE WHEN a_id_supplier <= 0 THEN 1 ELSE 0 END;
		
        IF (v_is_new_supplier = 0 AND NOT EXISTS (SELECT * FROM Shop_Supplier S WHERE S.id_supplier = a_id_supplier)) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, CONCAT('Invalid supplier ID: ', a_id_supplier))
			;
		END IF;
    END IF;
    
    /*
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		INSERT INTO tmp_Shop_Supplier (
			id_supplier, name_company, name_contact, department_contact, id_address, phone_number, fax, email, website, id_currency, active
		)
		VALUES 
			(a_id_supplier, a_name_company, a_name_contact, a_department_contact, a_id_address, a_phone_number, a_fax, a_email, a_website, a_id_currency, a_active)
		/*
		FROM Shop_Supplier S
		WHERE (NOT v_has_filter_category OR C.id_category LIKE '%' || a_ids_category || '%')
			AND (a_get_inactive_categories OR C.active)
		*
        ;
    END IF;
    */
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
        CALL p_shop_calc_user(v_guid_permission, v_id_user, v_id_permission_supplier, '');
        
        /*
        UPDATE tmp_Shop_Supplier t_S
        INNER JOIN Shop_Calc_User_Temp TP
			ON TP.GUID = v_guid_permission
        SET tP.can_view = TP.can_view,
			tP.can_edit = TP.can_edit,
            tP.can_admin = TP.can_admin;
		*/
        SET v_has_permission := (SELECT can_edit FROM Shop_Calc_User_Temp WHERE GUID = v_guid_permission);
        
        IF v_has_permission = 0 THEN
			SET v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, msg
			)
			SELECT
				a_guid, 
				v_id_error_type_no_permission, 
				CONCAT('You do not have ', name, ' permissions.')
			FROM Shop_Permission
            WHERE id_permission = v_id_permission_supplier
			;
        END IF;
        
        -- CALL p_shop_clear_calc_user(v_guid_permission);
        
        DELETE FROM Shop_Calc_User_Temp
        WHERE GUID = a_guid;
    END IF;
    
    
	-- Transaction    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		INSERT INTO Shop_Sales_And_Purchasing_Change_Set (
			comment,
			updated_last_by,
			updated_last_on
		)
		VALUES (
			CONCAT(
				'Save ',
                CASE WHEN v_is_new_supplier = 1 THEN 'new ' ELSE '' END,
                'Supplier - ',
                a_comment
			),
			a_id_user,
			CURRENT_TIME()
		);
		
        SET v_id_change_set := (SELECT id_change_set FROM Shop_Sales_And_Purchasing_Change_Set ORDER BY id_change_set DESC LIMIT 1);
        
		START TRANSACTION;
			IF (v_is_new_supplier = 1) THEN
				INSERT INTO Shop_Supplier (
					-- id_supplier, 
                    name_company, name_contact, department_contact, id_address, phone_number, fax, email, website, id_currency, active, id_change_set
				)
				VALUES 
					(
						-- a_id_supplier, 
						a_name_company, a_name_contact, a_department_contact, a_id_address, a_phone_number, a_fax, a_email, a_website, a_id_currency, a_active, v_id_change_set
                    )
				/*
				FROM Shop_Supplier S
				WHERE (NOT v_has_filter_category OR C.id_category LIKE '%' || a_ids_category || '%')
					AND (a_get_inactive_categories OR C.active)
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
					S.name_company = a_name_company,
					S.name_contact = a_name_contact,
					S.department_contact = a_department_contact,
					S.id_address = a_id_address,
					S.phone_number = a_phone_number,
					S.fax = a_fax,
					S.email = a_email,
					S.website = a_website,
					S.id_currency = a_id_currency,
					S.active = a_active,
                    S.id_change_set = v_id_change_set
				;
			END IF;
		
		IF EXISTS (SELECT * FROM tmp_Msg_Error) THEN
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
    END IF;
    
    -- Returns
    -- SET v_now = NOW();
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
	;
    
    DROP TABLE tmp_Shop_Supplier;
    DROP TABLE tmp_Msg_Error;
END //
DELIMITER ;;


-- SELECT * FROM Shop_Supplier;




/*

CALL p_shop_get_many_supplier (
	'', # a_id_user
    1, # a_get_all_supplier
	0, # a_get_inactive_supplier
    0, # a_get_first_supplier_only
	'', # a_ids_supplier
);

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_supplier;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_supplier (
	IN a_id_user INT,
    IN a_get_all_supplier BIT,
	IN a_get_inactive_supplier BIT,
    IN a_get_first_supplier_only BIT,
	IN a_ids_supplier VARCHAR(4000)
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_supplier BIT;
    DECLARE v_guid BINARY(36);
    # DECLARE v_id_user VARCHAR(100);
    # DECLARE v_ids_permutation_unavailable VARCHAR(4000);
    DECLARE v_id_permission_supplier INT;
    # DECLARE v_ids_product_permission VARCHAR(4000);
    # DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    DECLARE v_now DATETIME;
    DECLARE v_id_minimum INT;
    DECLARE v_code_error_data VARCHAR(50);
    
    
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    
	-- Argument validation + default values
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_get_all_supplier IS NULL THEN
		SET a_get_all_supplier = 1;
    END IF;
	IF a_get_inactive_supplier IS NULL THEN
		SET a_get_inactive_supplier = 0;
    END IF;
	IF a_get_first_supplier_only IS NULL THEN
		SET a_get_first_supplier_only = 0;
    END IF;
	IF a_ids_supplier IS NULL THEN
		SET a_ids_supplier = '';
	ELSE
		SET a_ids_supplier = TRIM(REPLACE(a_ids_supplier, '|', ','));
    END IF;
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Supplier;
    
    CREATE TABLE tmp_Shop_Supplier (
		id_supplier INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Supplier_id_supplier
			FOREIGN KEY (id_supplier)
			REFERENCES Shop_Supplier(id_supplier),
        active BIT NOT NULL,
        rank_supplier INT NULL
    );
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Parse filters
    SET v_has_filter_supplier = CASE WHEN a_ids_supplier = '' THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
    IF v_has_filter_supplier = 1 OR a_get_all_supplier = 1 THEN
		CALL p_split(a_guid, a_ids_supplier, ',');
        
		IF EXISTS (SELECT * FROM Split_Temp S_T LEFT JOIN Shop_Supplier S ON S_T.substring = S.id_supplier WHERE ISNULL(S.id_supplier)) THEN 
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_code_error_data, 
				CONCAT('Invalid supplier IDs: ', (SELECT GROUP_CONCAT(S.id_supplier) FROM Temp_Split TS LEFT JOIN Shop_Supplier S ON TS.substring = S.id_supplier WHERE ISNULL(S.id_supplier)))
			)
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
            LEFT JOIN Split_Temp S_T ON S.id_supplier = S_T.substring
            WHERE
				(
					a_get_all_supplier = 1
                    OR NOT ISNULL(S_T.substring)
				)
				AND (
					a_get_inactive_supplier
                    OR S.active = 1
                )
			;
        END IF;
        
        DROP TABLE Split_Temp;
		
		IF a_get_first_supplier_only THEN
			DELETE t_S
			FROM tmp_Shop_Supplier t_S
			WHERE t_S.rank_supplier > 1 /*(
					SELECT MIN(t_S.rank_supplier)
                    FROM tmp_Shop_Supplier t_S
				) */
			;
		END IF;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
        # SET v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER());
        SET v_id_permission_supplier := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_SUPPLIER' LIMIT 1);
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
        -- select * from Shop_Calc_User_Temp;
        
        CALL p_shop_calc_user(v_guid, a_id_user, FALSE, v_id_permission_supplier, v_id_access_level_view, '');
        
        -- select * from Shop_Calc_User_Temp;
        
        IF NOT EXISTS (SELECT can_view FROM Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_code_error_data, 
				CONCAT('You do not have view permissions for ', (SELECT name FROM Shop_Permission WHERE id_permission = v_id_permission_supplier LIMIT 1))
			)
			;
        END IF;
	END IF;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns
    SET v_now := NOW();
    
    # Suppliers
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
		t_S.active
    FROM tmp_Shop_Supplier t_S
    INNER JOIN Shop_Supplier S
		ON t_S.id_supplier = S.id_supplier
	;
    
    # Errors
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
    DROP TABLE IF EXISTS tmp_Supplier;
END //
DELIMITER ;;


/*

CALL p_shop_get_many_supplier (
	'auth0|6582b95c895d09a70ba10fef', # a_id_user
    1, # a_get_all_supplier
	0, # a_get_inactive_supplier
    0, # a_get_first_supplier_only
	'' # a_ids_supplier
);

select * from shop_supplier;
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



-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_supplier_purchase_order;

DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Msg_Error;

DELIMITER //
CREATE PROCEDURE p_shop_save_supplier_purchase_order (
	IN a_guid VARCHAR(500),
    IN a_id_user INT,
    IN a_comment VARCHAR(500),
    IN a_id_order INT,
    IN a_id_supplier_ordered INT,
    IN a_id_currency_cost INT
    -- IN a_active BIT
)
BEGIN
    DECLARE v_id_error_type_bad_data INT;
    DECLARE v_code_error_type_bad_data VARCHAR(50);
    DECLARE v_id_error_type_no_permission INT;
    DECLARE v_code_error_type_no_permission VARCHAR(50);
    DECLARE v_guid_permission BINARY(36);
    -- DECLARE v_id_user VARCHAR(100);
    DECLARE v_id_permission_supplier_purchase_order INT;
	DECLARE v_id_access_level_EDIT INT;
    DECLARE v_ids_product VARCHAR(4000);
    DECLARE v_ids_product_no_permission VARCHAR(4000);
    -- DECLARE v_id_order_new INT;
    DECLARE v_id_change_set INT;
    DECLARE v_is_new_supplier_purchase_order BIT;
    
	-- SET SESSION sql_mode = sys.list_drop(@@session.sql_mode, 'ONLY_FULL_GROUP_BY');
    
    SET v_code_error_type_bad_data = 'BAD_DATA';
    SET v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_bad_data LIMIT 1);
    SET v_code_error_type_no_permission = 'NO_PERMISSION';
    SET v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_no_permission LIMIT 1);
	SET v_guid_permission = UUID();
	-- SET v_id_user = CURRENT_USER();
	SET v_id_permission_supplier_purchase_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_SUPPLIER_PURCHASE_ORDER' LIMIT 1);
	SET v_id_access_level_EDIT := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT');
    
	-- Argument default values
    IF a_guid IS NULL THEN 
		SET a_guid = UUID();
	END IF;
    /*
	IF a_active IS NULL THEN
		SET a_active = 0;
    END IF;
    */
    
    -- Temporary tables
    /*
    CREATE TABLE tmp_Shop_Supplier_Purchase_Order (
		id_order INT NOT NULL PRIMARY KEY,
		id_supplier_ordered INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Supplier_Purchase_Order_id_supplier_ordered
			FOREIGN KEY (id_supplier_ordered) 
			REFERENCES Shop_Supplier(id_supplier),
		cost_total_local FLOAT NOT NULL,
		id_currency_cost INT NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Supplier_Purchase_Order_Product_Link (
		id_link INT NOT NULL PRIMARY KEY,
		id_order INT NOT NULL,
        /*
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_Supplier_Purchase_Order(id_order),
		*/
        id_permutation INT NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		cost_total_local FLOAT NOT NULL,
		id_currency_cost INT NOT NULL,
		quantity_ordered FLOAT NOT NULL,
		id_unit_quantity INT NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_received FLOAT NULL,
		latency_delivery_days INT NOT NULL,
		display_order INT NOT NULL,
        active BIT NOT NULL,
        name_error VARCHAR(200) NOT NULL
    );
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Argument validation
    # User ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_id_user) OR NOT EXISTS (SELECT * FROM Shop_User WHERE id_user = a_id_user) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid User ID: ', IFNULL(a_id_user, 'NULL')))
			;
		END IF;
    END IF;
    
    # Order ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_id_order) OR ((a_id_order > 0) AND NOT EXISTS (SELECT * FROM Shop_Supplier_Purchase_Order WHERE id_order = a_id_order)) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid Supplier Purchase Order ID: ', IFNULL(a_id_order, 'NULL')))
			;
		END IF;
    END IF;
    
    # Supplier ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_id_supplier_ordered) OR NOT EXISTS (SELECT * FROM Shop_Supplier WHERE id_supplier = a_id_supplier_ordered) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid Supplier ID: ', IFNULL(a_id_supplier_ordered, 'NULL')))
			;
		END IF;
    END IF;
    
    # Currency ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_id_currency_cost) OR NOT EXISTS (SELECT * FROM Shop_Currency WHERE id_currency = a_id_currency_cost) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid currency ID: ', IFNULL(a_id_currency, 'NULL')))
			;
		END IF;
    END IF;
    
    # Comment
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_comment) OR TRIM(a_comment) = '' THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, 'A comment must be provided.')
			;
		END IF;
    END IF;
    

	-- Get data from Temp table
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		SET v_is_new_supplier_purchase_order := CASE WHEN a_id_order <= 0 THEN 1 ELSE 0 END;
		
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
        /*
		VALUES 
			(a_id_supplier, a_name_company, a_name_contact, a_department_contact, a_id_address, a_phone_number, a_fax, a_email, a_website, a_id_currency, a_active)
		*/
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
            CONCAT(PP.id_permutation, ' - ', IFNULL(PP.name ,'')) AS name_error
        FROM Shop_Supplier_Purchase_Order_Product_Link_Temp SPOPL_T
        INNER JOIN Shop_Product_Permutation PP ON SPOPL_T.id_permutation = PP.id_permutation
		WHERE SPOPL_T.GUID = a_guid
        ;
        DELETE SPOPL_T
		FROM Shop_Supplier_Purchase_Order_Product_Link_Temp SPOPL_T
		WHERE SPOPL_T.GUID = a_guid
        ;
        
        /*
        UPDATE tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
        SET 
			cost_total_local
		*/
    END IF;
    
    -- Invalid quantity ordered
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Shop_Supplier_Purchase_Order_Product_Link 
            WHERE 
				NOT ISNULL(quantity_ordered)
				AND quantity_ordered < 0
		) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			SELECT
				a_guid, 
                v_id_error_type_bad_data, 
                v_code_error_type_bad_data, 
                CONCAT('Invalid quantity ordered property for the following permutations: ', GROUP_CONCAT(t_SPOPL.name_error SEPARATOR ', '))
			FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
            -- INNER JOIN Shop_Product_Permutation PP ON t_SPOPL.id_permutation = PP.id_permutation
            WHERE t_SPOPL.quantity_ordered < 0
			;
        END IF;
    END IF;
    
    -- Duplicates
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF EXISTS (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL GROUP BY id_permutation HAVING COUNT(*) > 1) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			SELECT
				a_guid, 
                v_id_error_type_bad_data, 
                v_code_error_type_bad_data, 
                CONCAT('Duplicate records: ', GROUP_CONCAT(t_SPOPLC.name_error SEPARATOR ', '))
			FROM (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL GROUP BY id_permutation HAVING COUNT(*) > 1) t_SPOPLC
			;
        END IF;
	END IF;
    
    
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
        SET v_ids_product := (
			SELECT GROUP_CONCAT(G.id_product SEPARATOR ',')
            FROM (
				SELECT DISTINCT PP.id_product
				FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPO
				INNER JOIN Shop_Product_Permutation PP ON t_SPO.id_permutation = PP.id_permutation
			) G
		);
        
        CALL p_shop_calc_user(v_guid_permission, a_id_user, 0, v_id_permission_supplier_purchase_order, v_id_access_level_edit, v_ids_product);
        
        /*
        UPDATE tmp_Shop_Supplier t_S
        INNER JOIN Shop_Calc_User_Temp TP
			ON TP.GUID = v_guid_permission
        SET tP.can_view = TP.can_view,
			tP.can_edit = TP.can_edit,
            tP.can_admin = TP.can_admin;
		*/
        /*
        SET v_has_permission := (
			SELECT can_edit 
            FROM Shop_Calc_User_Temp 
            WHERE 
				GUID = v_guid_permission
				AND can_edit = 0
        );
        
        IF v_has_permission = 0 THEN
			SET v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, msg
			)
			SELECT
				a_guid, 
				v_id_error_type_no_permission, 
				CONCAT('You do not have ', name, ' permissions.')
			FROM Shop_Permission
            WHERE id_permission = v_id_permission_supplier_purchase_order
			;
        END IF;
        */
        SET v_ids_product_no_permission := (
			SELECT GROUP_CONCAT(PT.id_product SEPARATOR ',') 
            FROM Shop_Calc_User_Temp PT 
            WHERE 
				PT.can_edit = 0
				AND NOT ISNULL(PT.id_product)
        );
        IF NOT ISNULL(v_ids_product_no_permission) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES (
				a_guid, 
				v_id_error_type_no_permission, 
                v_code_error_type_no_permission,
                CONCAT('You do not have permission to edit the following product IDs: ', v_ids_product_no_permission)
			)
			;
        END IF;
        
        DELETE FROM Shop_Calc_User_Temp
        WHERE GUID = a_guid;
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
				CONCAT(
					'Save ',
					CASE WHEN v_is_new_supplier_purchase_order = 1 THEN 'new ' ELSE '' END,
					'Supplier Purchase Order - ', 
					a_comment
				),
				a_id_user,
				CURRENT_TIME()
			);
			
			SET v_id_change_set := (SELECT id_change_set FROM Shop_Sales_And_Purchasing_Change_Set ORDER BY id_change_set DESC LIMIT 1);
			
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
					a_id_supplier_ordered,
					SUM(t_SPOPL.cost_total_local),
                    a_id_currency_cost,
                    a_id_user,
                    v_id_change_set,
                    a_active
				FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
				;
                -- SET v_id_order_new 
                SET a_id_order := (SELECT id_order FROM Shop_Supplier_Purchase_Order ORDER BY id_order DESC LIMIT 1);
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
					a_id_order, -- v_id_order_new,
					id_permutation,
					cost_total_local,
					id_currency_cost,
					quantity_ordered,
					id_unit_quantity,
					quantity_received,
					latency_delivery_days,
					display_order,
                    active,
                    a_id_user,
                    v_id_change_set
				FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
				;
			ELSE
				UPDATE Shop_Supplier_Purchase_Order SPO
				INNER JOIN tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL ON SPO.id_order = t_SPOPL.id_order
                SET
					SPO.id_supplier_ordered = a_id_supplier_ordered,
					SPO.cost_total_local = SUM(t_SPOPL.cost_total_local),
                    SPO.id_currency = a_id_currency_cost,
                    SPO.id_change_set = v_id_change_set,
                    SPO.active = a_active
				WHERE SPO.id_order = a_id_order
				;
                IF EXISTS (SELECT * FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL INNER JOIN Shop_Supplier_Purchase_Order_Product_Link SPOPL ON t_SPOPL.id_link = SPOPL.id_link) THEN
					UPDATE Shop_Supplier_Purchase_Order_Product_Link SPOPL
					INNER JOIN tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
						ON SPOPL.id_link = t_SPOPL.id_link
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
                        a_id_user,
						v_id_change_set
					FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
                    WHERE t_SPOPL.id_link < 0
					;
                END IF;
			END IF;
		
		IF EXISTS (SELECT * FROM tmp_Msg_Error) THEN
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
    END IF;
    
    -- Returns
    # SET v_now = NOW();
    
    # Supplier Purchase Orders
    SELECT *
    FROM Shop_Supplier_Purchase_Order
    WHERE id_order = a_id_order
    ;
    
    # Supplier Purchase Order Product Links
    SELECT *
    FROM Shop_Supplier_Purchase_Order_Product_Link
    WHERE id_order = a_id_order
    ;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
	;
    
    # DROP TABLE tmp_Shop_Supplier_Purchase_Order;
    DROP TABLE tmp_Shop_Supplier_Purchase_Order_Product_Link;
    DROP TABLE tmp_Msg_Error;
END //
DELIMITER ;;


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
		'NIPS', # guid
		-1, # id_link,
		-1, # id_order,
		1, # id_permutation,
		100, # cost_total_local,
		1, # id_currency_cost,
		1, # quantity_ordered,
		1, # id_unit_quantity,
		1, # quantity_received,
		14, # latency_delivery_days ,
		1, # display_order
        1 # active
    )
;

SELECT * FROM Shop_Supplier_Purchase_Order_Product_Link_Temp;

CALL p_shop_save_supplier_purchase_order (
	'NIPS', # a_guid
    'auth0|6582b95c895d09a70ba10fef', # a_id_user
    -1, # a_id_order
    1, # a_id_supplier_ordered
    1 # a_id_currency_cost
);

SELECT * FROM Shop_Supplier_Purchase_Order_Product_Link_Temp;

DELETE FROM Shop_Supplier_Purchase_Order_Product_Link_Audit;
DELETE FROM Shop_Supplier_Purchase_Order_Product_Link;
DELETE FROM Shop_Supplier_Purchase_Order_Product_Link_Temp;
DELETE FROM Shop_Supplier_Purchase_Order_Audit;
DELETE FROM Shop_Supplier_Purchase_Order;


*/





-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_supplier_purchase_order;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_supplier_purchase_order (
	IN a_id_user INT,
    IN a_get_all_supplier BIT,
	IN a_get_inactive_supplier BIT,
	IN a_get_first_supplier_only BIT,
	IN a_ids_supplier VARCHAR(4000),
    IN a_get_all_order BIT,
	-- IN a_get_inactive_order BIT,
	IN a_get_first_order_only BIT,
	IN a_ids_order VARCHAR(4000),
	IN a_get_inactive_category BIT,
	IN a_ids_category VARCHAR(4000),
	IN a_get_inactive_product BIT,
	IN a_ids_product VARCHAR(4000),
	IN a_get_inactive_permutation BIT,
	IN a_ids_permutation VARCHAR(4000),
    IN a_date_from DATETIME,
    IN a_date_to DATETIME
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_supplier BIT;
    DECLARE v_has_filter_order BIT;
    DECLARE v_has_filter_category BIT;
    DECLARE v_has_filter_product BIT;
    DECLARE v_has_filter_permutation BIT;
    DECLARE v_has_filter_date_from BIT;
    DECLARE v_has_filter_date_to BIT;
    DECLARE v_guid BINARY(36);
    # DECLARE v_id_user VARCHAR(100);
    # DECLARE v_ids_permutation_unavailable VARCHAR(4000);
    DECLARE v_ids_permission_supplier_purchase_order VARCHAR(4000);
    DECLARE v_ids_product_permission VARCHAR(4000);
    # DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    -- DECLARE v_now DATETIME;
    -- DECLARE v_id_minimum INT;
    DECLARE v_code_error_data VARCHAR(50);
    DECLARE v_id_type_error_data INT;
    
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    -- SET v_ids_permission_supplier_purchase_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'SHOP_SUPPLIER_PURCHASE_ORDER' LIMIT 1);
    SET v_code_error_data = 'BAD_DATA';
    SET v_id_type_error_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data);
    
	-- Argument validation + default values
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_get_all_supplier IS NULL THEN
		SET a_get_all_supplier = 1;
    END IF;
	IF a_get_inactive_supplier IS NULL THEN
		SET a_get_inactive_supplier = 0;
    END IF;
	IF a_get_first_supplier_only IS NULL THEN
		SET a_get_first_supplier_only = 0;
    END IF;
	IF a_ids_supplier IS NULL THEN
		SET a_ids_supplier = '';
	ELSE
		SET a_ids_supplier = TRIM(REPLACE(a_ids_supplier, '|', ','));
    END IF;
	IF a_get_all_order IS NULL THEN
		SET a_get_all_order = 1;
    END IF;
    /*
	IF a_get_inactive_order IS NULL THEN
		SET a_get_inactive_order = 0;
    END IF;
	*/
    IF a_get_first_order_only IS NULL THEN
		SET a_get_first_order_only = 0;
    END IF;
	IF a_ids_order IS NULL THEN
		SET a_ids_order = '';
	ELSE
		SET a_ids_order = TRIM(REPLACE(a_ids_order, '|', ','));
    END IF;
	IF a_get_inactive_category IS NULL THEN
		SET a_get_inactive_category = 0;
    END IF;
	IF a_ids_category IS NULL THEN
		SET a_ids_category = '';
	ELSE
		SET a_ids_category = TRIM(REPLACE(a_ids_category, '|', ','));
    END IF;
	IF a_get_inactive_product IS NULL THEN
		SET a_get_inactive_product = 0;
    END IF;
	IF a_ids_product IS NULL THEN
		SET a_ids_product = '';
	ELSE
		SET a_ids_product = TRIM(REPLACE(a_ids_product, '|', ','));
    END IF;
	IF a_get_inactive_permutation IS NULL THEN
		SET a_get_inactive_permutation = 0;
    END IF;
	IF a_ids_permutation IS NULL THEN
		SET a_ids_permutation = '';
	ELSE
		SET a_ids_permutation = TRIM(REPLACE(a_ids_permutation, '|', ','));
    END IF;
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order_Product_Link;
    DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order;
    DROP TABLE IF EXISTS tmp_Shop_Supplier;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    
    CREATE TABLE tmp_Shop_Supplier (
		id_supplier INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Supplier_id_supplier
			FOREIGN KEY (id_supplier)
			REFERENCES Shop_Supplier(id_supplier),
        active BIT NOT NULL,
        rank_supplier INT NULL,
        can_view BIT, 
        can_edit BIT, 
        can_admin BIT
    );
    
    CREATE TABLE tmp_Shop_Supplier_Purchase_Order (
		id_order INT NOT NULL PRIMARY KEY,
		id_supplier_ordered INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Supplier_Purchase_Order_id_supplier_ordered
			FOREIGN KEY (id_supplier_ordered) 
			REFERENCES Shop_Supplier(id_supplier),
		cost_total_local FLOAT NOT NULL,
		id_currency_cost INT NOT NULL,
        active BIT NOT NULL,
        rank_order INT NOT NULL
    );
    
    /*
    CREATE TABLE tmp_Shop_Supplier_Purchase_Order_Product_Link (
		id_link INT NOT NULL PRIMARY KEY,
		id_order INT NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_Supplier_Purchase_Order(id_order),
		id_permutation INT NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		cost_total_local FLOAT NOT NULL,
		id_currency_cost INT NOT NULL,
		quantity_ordered FLOAT NOT NULL,
		id_unit_quantity INT NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_received FLOAT NULL,
		latency_delivery_days INT NOT NULL,
		display_order INT NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Product (
		id_category INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Product_Category(id_category),
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
        latency_manufacture_days INT NOT NULL,
		quantity_min FLOAT NOT NULL,
		quantity_max FLOAT NOT NULL,
		quantity_step FLOAT NOT NULL,
		quantity_stock FLOAT NOT NULL,
		is_subscription BIT NOT NULL,
		id_unit_measurement_interval_recurrence INT,
		CONSTRAINT FK_tmp_Shop_Product_id_unit_measurement_interval_recurrence
			FOREIGN KEY (id_unit_measurement_interval_recurrence)
			REFERENCES Shop_Interval_Recurrence(id_interval),
		count_interval_recurrence INT,
        id_stripe_product VARCHAR(100),
        product_has_variations INT NOT NULL,
        can_view BIT, 
        can_edit BIT, 
        can_admin BIT
    );
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Parse filters
    SET v_has_filter_supplier = CASE WHEN a_ids_supplier = '' THEN 0 ELSE 1 END;
    SET v_has_filter_order = CASE WHEN a_ids_order = '' THEN 0 ELSE 1 END;
    SET v_has_filter_category = CASE WHEN a_ids_category = '' THEN 0 ELSE 1 END;
    SET v_has_filter_product = CASE WHEN a_ids_product = '' THEN 0 ELSE 1 END;
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_date_from = CASE WHEN ISNULL(a_date_from) THEN 0 ELSE 1 END;
    SET v_has_filter_date_to = CASE WHEN ISNULL(a_date_to) THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
    IF v_has_filter_supplier THEN
		CALL p_split(a_guid, a_ids_supplier, ',');
        
		IF EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Supplier S ON TS.substring = S.id_supplier WHERE ISNULL(S.id_supplier)) THEN 
			INSERT INTO tmp_Msg_Error (
				guid,
                id_type,
				code,
				msg
			)
			SELECT
				v_guid,
                v_id_type_error_data,
				v_code_error_data, 
				CONCAT('Invalid supplier IDs: ', IFNULL(GROUP_CONCAT(TS.substring SEPARATOR ', '), 'NULL'))
			FROM Split_Temp TS 
            LEFT JOIN Shop_Supplier S ON TS.substring = S.id_supplier 
            WHERE ISNULL(S.id_supplier)
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
					a_get_inactive_supplier
                    OR S.active = 1
                )
			;
        END IF;
        
        DROP TABLE Split_Temp;
		
		IF a_get_first_supplier_only THEN
			DELETE t_S
			FROM tmp_Shop_Supplier t_S
			WHERE t_S.rank_supplier > (
				SELECT MIN(t_S.rank_supplier)
				FROM tmp_Shop_Supplier t_S
			)
			;
		END IF;
    END IF;
    
    IF v_has_filter_category = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
			CALL p_split(a_guid, a_ids_category, ',');
			
			IF EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Product_Category C ON TS.substring = C.id_category WHERE ISNULL(C.id_category)) THEN 
				INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					v_guid,
					v_id_type_error_data,
					v_code_error_data, 
					CONCAT('Invalid category IDs: ', IFNULL(GROUP_CONCAT(TS.substring SEPARATOR ', ') ,'NULL')) 
				FROM Split_Temp TS 
				LEFT JOIN Shop_Product_Category C ON TS.substring = C.id_category 
				WHERE ISNULL(C.id_category)
				;
			END IF;
			
			DROP TABLE Split_Temp;
		END IF;
	END IF;
    
    IF v_has_filter_product = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
			CALL p_split(a_guid, a_ids_product, ',');
			
			IF EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Product ON TS.substring = P.id_product WHERE ISNULL(P.id_product)) THEN 
				INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					v_guid,
					v_id_type_error_data,
					v_code_error_data, 
					CONCAT('Invalid product IDs: ', IFNULL(GROUP_CONCAT(TS.substring SEPARATOR ', ') ,'NULL'))
				FROM Split_Temp TS
                LEFT JOIN Shop_Product ON TS.substring = P.id_product 
                WHERE ISNULL(P.id_product)
				;
			END IF;
			
			DROP TABLE Split_Temp;
		END IF;
	END IF;
    
    IF v_has_filter_permutation = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
			CALL p_split(a_guid, a_ids_permutation, ',');
			
			IF EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Product_Permutation PP ON TS.substring = PP.id_permutation WHERE ISNULL(PP.id_permutation)) THEN 
				INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					v_guid,
					v_id_type_error_data,
					v_code_error_data, 
					CONCAT('Invalid permutation IDs: ', IFNULL(GROUP_CONCAT(TS.substring SEPARATOR ', ') ,'NULL')) 
				FROM Split_Temp TS 
                LEFT JOIN Shop_Product_Permutation PP ON TS.substring = PP.id_permutation 
                WHERE ISNULL(PP.id_permutation)
				;
			END IF;
			
			DROP TABLE Split_Temp;
		END IF;
	END IF;
    
    IF v_has_filter_category = 1 OR v_has_filter_product = 1 OR v_has_filter_permutation = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
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
				*
				latency_manufacture_days,
				quantity_min,
				quantity_max,
				quantity_step,
				quantity_stock,
				is_subscription,
				id_unit_measurement_interval_recurrence,
				count_interval_recurrence,
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
				-- RANK() OVER (ORDER BY C.display_order, P.display_order, PP.display_order) AS rank_permutation, #PARTITION BY P.id_category # _in_category
				/*
				P.name,
				PP.description,
				/*
				PP.price_GBP_VAT_incl,
				PP.price_GBP_VAT_excl,
				PP.price_GBP_min,
				*
				PP.latency_manufacture_days,
				PP.quantity_min,
				PP.quantity_max,
				PP.quantity_step,
				PP.quantity_stock,
				PP.is_subscription,
				PP.id_unit_measurement_interval_recurrence,
				PP.count_interval_recurrence,
				PP.id_stripe_product,
				P.has_variations
				*/
			FROM Shop_Product P
			INNER JOIN Shop_Product_Permutation PP
				ON P.id_product = PP.id_product
			INNER JOIN Shop_Product_Category C
				ON P.id_category = C.id_category
			WHERE
				# permutations
				(
					(
						NOT v_has_filter_permutation 
						OR FIND_IN_SET(PP.id_permutation, a_ids_permutation) > 0
					)
					AND (
						a_get_inactive_permutation 
						OR PP.active = 1
					)
				)
				# categories
				AND (
					(
						NOT v_has_filter_category 
						OR FIND_IN_SET(P.id_category, a_ids_category) > 0
					)
					AND (
						a_get_inactive_category 
						OR C.active = 1
					)
				) 
				# products
				AND (
					(
						NOT v_has_filter_product 
						OR FIND_IN_SET(P.id_product, a_ids_product) > 0
					)
                    AND (
						a_get_inactive_product 
						OR P.active = 1
					)
				)
			;
        END IF;
    END IF;
    
    -- Get orders
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		CALL p_split(a_guid, a_ids_order, ',');
        
		IF v_has_filter_order AND EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Supplier_Purchase_Order SPO ON TS.substring = SPO.id_order WHERE ISNULL(SPO.id_order)) THEN 
			INSERT INTO tmp_Msg_Error (
				guid,
                id_type,
				code,
				msg
			)
			SELECT
				v_guid,
                v_id_type_error_data,
				v_code_error_data, 
				CONCAT('Invalid order IDs: ', IFNULL(GROUP_CONCAT(TS.substring SEPARATOR ', '), 'NULL'))
			FROM Split_Temp TS 
            LEFT JOIN Shop_Supplier_Purchase_Order SPO ON TS.substring = SPO.id_order 
            WHERE ISNULL(SPO.id_order)
			;
		END IF;
		
        IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
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
			INNER JOIN Split_Temp TS ON SPO.id_order = TS.substring
            INNER JOIN Shop_Supplier_Purchase_Order_Product_Link SPOPL ON SPO.id_order = SPOPL.id_order
            INNER JOIN Shop_Supplier S ON SPO.id_supplier_ordered = S.id_supplier
            INNER JOIN Shop_Product_Permutation PP ON SPOPL.id_permutation = PP.id_permutation
            INNER JOIN Shop_Product P ON PP.id_product = P.id_product
            INNER JOIN Shop_Product_Category C ON P.id_category = C.id_category
            LEFT JOIN tmp_Shop_Product t_P ON SPOPL.id_permutation = t_P.id_permutation
            LEFT JOIN tmp_Shop_Supplier t_S ON SPO.id_supplier_ordered = t_S.id_supplier
			WHERE
				# supplier
				(
					v_has_filter_supplier = 0
					OR NOT ISNULL(t_S.id_supplier) -- SPO.id_supplier_ordered IN (SELECT DISTINCT id_supplier FROM tmp_Shop_Supplier)
				)
				# order
				AND (
					(
						v_has_filter_order = 0
						OR (
							# ID
							FIND_IN_SET(SPO.id_order, a_ids_order) > 0
                            # date
                            AND (
								(
									v_has_filter_date_from = 0
									OR SPO.created_on > a_date_from
								)
								AND (
									v_has_filter_date_to = 0
									OR SPO.created_on < a_date_to
								)
							)
						)
					)
                    # active
                    /*
					AND (
						a_get_inactive_order
						OR SPO.active = 1
					)
                    */
				)
				# permutations
				AND (
					(
						v_has_filter_category = 0 
                        AND v_has_filter_product = 0 
                        AND v_has_filter_permutation = 0
					)
					OR NOT ISNULL(t_P.id_permutation) -- SPO.id_permutation IN (SELECT DISTINCT id_permutation FROM tmp_Shop_Product)
				)
			;
		END IF;
        
        DROP TABLE Split_Temp;
		
		IF a_get_first_order_only THEN
			DELETE t_SPO
            FROM tmp_Shop_Supplier_Purchase_Order t_SPO
			WHERE t_SPO.rank_order > (
				SELECT MIN(t_SPO.rank_order)
				FROM tmp_Shop_Supplier_Purchase_Order t_SPO
			)
			;
		END IF;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
        # SET v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER());
        SET v_ids_permission_supplier_purchase_order := (SELECT GROUP_CONCAT(id_permission SEPARATOR ',') FROM Shop_Permission WHERE code IN ('STORE_SUPPLIER', 'STORE_SUPPLIER_PURCHASE_ORDER'));
        -- SET v_ids_permutation_permission := (SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
        SET v_ids_product_permission := (SELECT GROUP_CONCAT(P.id_product SEPARATOR ',') FROM (SELECT DISTINCT id_product FROM tmp_Shop_Product WHERE NOT ISNULL(id_product)) P);
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
        -- select * from Shop_Calc_User_Temp;
        
        CALL p_shop_calc_user(v_guid, a_id_user, FALSE, v_ids_permission_supplier_purchase_order, v_id_access_level_view, v_ids_product_permission);
        
        -- select * from Shop_Calc_User_Temp;
        
        IF NOT EXISTS (SELECT can_view FROM Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
                id_type,
				code,
				msg
			)
			SELECT
				v_guid,
                v_id_type_error_data,
				v_code_error_data, 
				CONCAT('You do not have view permissions for ', GROUP_CONCAT(name SEPARATOR ', ')) 
			FROM Shop_Permission 
            WHERE id_permission = v_ids_permission_supplier_purchase_order
			;
        END IF;
        
        
        UPDATE tmp_Shop_Product t_P
        INNER JOIN Shop_Calc_User_Temp UE_T
			ON t_P.id_product = UE_T.id_product -- t_P.id_permutation = UE_T.id_permutation
			AND UE_T.GUID = v_guid
        SET t_P.can_view = UE_T.can_view,
			t_P.can_edit = UE_T.can_edit,
            t_P.can_admin = UE_T.can_admin
		;
        
        # CALL p_shop_clear_calc_user(v_guid);
        # DROP TABLE IF EXISTS Shop_Calc_User_Temp;
        DELETE FROM Shop_Calc_User_Temp
        WHERE GUID = v_guid
        ;
	END IF;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns
    -- SET v_now := NOW();
    
    # Suppliers
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
    
    # Supplier Purchase Order
    SELECT # *
		t_SPO.id_order,
		SPO.id_supplier_ordered,
		SPO.cost_total_local,
		SPO.id_currency_cost,
        t_SPO.active
    FROM Shop_Supplier_Purchase_Order SPO
    INNER JOIN tmp_Shop_Supplier_Purchase_Order t_SPO ON SPO.id_order = t_SPO.id_order
    ;
    
    # Supplier Purchase Order Product Link
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
    
    # Errors
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
    DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order_Product_Link;
    DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order;
    DROP TABLE IF EXISTS tmp_Shop_Supplier;
    DROP TABLE IF EXISTS tmp_Shop_Product;
        
	DELETE FROM Shop_Calc_User_Temp
	WHERE GUID = v_guid
	;
END //
DELIMITER ;;


/*

CALL p_shop_get_many_supplier_purchase_order (
	'', # a_id_user
    1, # a_get_all_supplier
	0, # a_get_inactive_supplier
	0, # a_get_first_supplier_only
    '', # a_ids_supplier
	1, # a_get_all_order
	-- 0, # a_get_inactive_order
    0, # a_get_first_order_only
    '', # a_ids_order
	0, # a_get_inactive_category
	'', # a_ids_category
    0, # a_get_inactive_product
	'', # a_ids_product
    0, # a_get_inactive_permutation
    '', # a_ids_permutation
    NULL, # a_date_from
	NULL # a_date_to
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




-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_manufacturing_purchase_order;

DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Msg_Error;

DELIMITER //
CREATE PROCEDURE p_shop_save_manufacturing_purchase_order (
	IN a_guid VARCHAR(500),
    IN a_id_user INT,
    IN a_id_order INT,
    -- IN a_id_supplier_ordered INT,
    IN a_id_currency_cost INT,
    IN a_active BIT,
    IN a_comment VARCHAR(500)
)
BEGIN
    DECLARE v_id_error_type_bad_data INT;
    DECLARE v_code_error_type_bad_data VARCHAR(50);
    DECLARE v_id_error_type_no_permission INT;
    DECLARE v_code_error_type_no_permission VARCHAR(50);
    DECLARE v_guid_permission BINARY(36);
    -- DECLARE v_id_user VARCHAR(100);
    DECLARE v_id_permission_manufacturing_purchase_order INT;
	DECLARE v_id_access_level_EDIT INT;
    DECLARE v_ids_product VARCHAR(4000);
    DECLARE v_ids_product_no_permission VARCHAR(4000);
    -- DECLARE v_id_order_new INT;
    DECLARE v_id_change_set INT;
    DECLARE v_is_new_manufacturing_purchase_order BIT;
    
	SET SESSION sql_mode = sys.list_drop(@@session.sql_mode, 'ONLY_FULL_GROUP_BY');
    
    SET v_code_error_type_bad_data = 'BAD_DATA';
    SET v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_bad_data LIMIT 1);
    SET v_code_error_type_no_permission = 'NO_PERMISSION';
    SET v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_no_permission LIMIT 1);
	SET v_guid_permission = UUID();
	-- SET v_id_user = CURRENT_USER();
	SET v_id_permission_manufacturing_purchase_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_MANUFACTURING_PURCHASE_ORDER' LIMIT 1);
	SET v_id_access_level_EDIT := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT');
    
	-- Argument default values
    IF a_guid IS NULL THEN 
		SET a_guid = UUID();
	END IF;
	IF a_active IS NULL THEN
		SET a_active = 0;
    END IF;
    
    -- Temporary tables
    /*
    CREATE TABLE tmp_Shop_Supplier_Purchase_Order (
		id_order INT NOT NULL PRIMARY KEY,
		id_supplier_ordered INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Supplier_Purchase_Order_id_supplier_ordered
			FOREIGN KEY (id_supplier_ordered) 
			REFERENCES Shop_Supplier(id_supplier),
		cost_total_local FLOAT NOT NULL,
		id_currency_cost INT NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Manufacturing_Purchase_Order_Product_Link (
		id_link INT NOT NULL PRIMARY KEY,
		id_order INT NOT NULL,
        /*
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_Manufacturing_Purchase_Order(id_order),
		*/
        id_permutation INT NOT NULL,
		CONSTRAINT FK_tmp_Manuf_Purch_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		cost_total_local FLOAT NOT NULL,
		id_currency_cost INT NOT NULL,
        value_produced_total_local FLOAT NOT NULL,
		quantity_used FLOAT NOT NULL,
		id_unit_quantity INT NOT NULL,
		CONSTRAINT FK_tmp_Manuf_Purch_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_produced FLOAT NULL,
		latency_manufacture_days INT NOT NULL,
		display_order INT NOT NULL,
        active BIT NOT NULL,
        name_error VARCHAR(200) NOT NULL
    );
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Argument validation
    # User ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_id_user) OR NOT EXISTS (SELECT * FROM Shop_User WHERE id_user = a_id_user) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid User ID: ', IFNULL(a_id_user, 'NULL')))
			;
		END IF;
    END IF;
    
    # Order ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_id_order) OR ((a_id_order > 0) AND NOT EXISTS (SELECT * FROM Shop_Manufacturing_Purchase_Order WHERE id_order = a_id_order)) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid Manufacturing Purchase Order ID: ', IFNULL(a_id_order, 'NULL')))
			;
		END IF;
    END IF;
    
    /*
    # Supplier ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_id_supplier_ordered) OR NOT EXISTS (SELECT * FROM Shop_Supplier WHERE id_supplier = a_id_supplier_ordered) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid supplier ID: ', IFNULL(a_id_supplier_ordered, 'NULL')))
			;
		END IF;
    END IF;
    */
    
    # Currency ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_id_currency_cost) OR NOT EXISTS (SELECT * FROM Shop_Currency WHERE id_currency = a_id_currency_cost) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid currency ID: ', IFNULL(a_id_currency, 'NULL')))
			;
		END IF;
    END IF;
    
    # Comment
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_comment) OR TRIM(a_comment) = '' THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, 'A comment must be provided.')
			;
		END IF;
    END IF;
    

	-- Get data from Temp table
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		SET v_is_new_manufacturing_purchase_order := CASE WHEN a_id_order <= 0 THEN 1 ELSE 0 END;
		
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
        /*
		VALUES 
			(a_id_supplier, a_name_company, a_name_contact, a_department_contact, a_id_address, a_phone_number, a_fax, a_email, a_website, a_id_currency, a_active)
		*/
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
            CONCAT(PP.id_permutation, ' - ', IFNULL(P.name ,'')) AS name_error
        FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp MPOPL_T
        INNER JOIN Shop_Product_Permutation PP ON MPOPL_T.id_permutation = PP.id_permutation
        INNER JOIN Shop_Product P ON PP.id_product = P.id_product
		WHERE MPOPL_T.GUID = a_guid
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
        DELETE MPOPL_T
		FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp MPOPL_T
		WHERE MPOPL_T.GUID = a_guid
        ;
    END IF;
    
    -- Invalid quantity used
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link 
            WHERE 
				NOT ISNULL(quantity_used)
				AND quantity_used < 0
		) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			SELECT
				a_guid, 
                v_id_error_type_bad_data, 
                v_code_error_type_bad_data, 
                CONCAT('Invalid quantity used property for the following permutations: ', GROUP_CONCAT(t_MPOPL.name_error SEPARATOR ', '))
			FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
            WHERE t_MPOPL.quantity_used < 0
			;
        END IF;
    END IF;
    
    -- Invalid quantity produced
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link 
            WHERE 
				NOT ISNULL(quantity_produced)
				AND quantity_produced < 0
		) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			SELECT
				a_guid, 
                v_id_error_type_bad_data, 
                v_code_error_type_bad_data, 
                CONCAT('Invalid quantity produced property for the following permutations: ', GROUP_CONCAT(t_MPOPL.name_error SEPARATOR ', '))
			FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
            WHERE t_MPOPL.quantity_produced < 0
			;
        END IF;
    END IF;
    
    -- Duplicates
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF EXISTS (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL GROUP BY id_permutation HAVING COUNT(*) > 1) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			SELECT
				a_guid, 
                v_id_error_type_bad_data, 
                v_code_error_type_bad_data, 
                CONCAT('Duplicate records: ', GROUP_CONCAT(t_MPOPLC.name_error SEPARATOR ', '))
			FROM (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL GROUP BY id_permutation HAVING COUNT(*) > 1) t_MPOPLC
			;
        END IF;
	END IF;
    
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
        SET v_ids_product := (
			SELECT GROUP_CONCAT(G.id_product SEPARATOR ',')
            FROM (
				SELECT DISTINCT PP.id_product
				FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPO
				INNER JOIN Shop_Product_Permutation PP ON t_MPO.id_permutation = PP.id_permutation
			) G
		);
        
        CALL p_shop_calc_user(v_guid_permission, a_id_user, 0, v_id_permission_manufacturing_purchase_order, v_id_access_level_edit, v_ids_product);
        
        /*
        UPDATE tmp_Shop_Supplier t_S
        INNER JOIN Shop_Calc_User_Temp TP
			ON TP.GUID = v_guid_permission
        SET tP.can_view = TP.can_view,
			tP.can_edit = TP.can_edit,
            tP.can_admin = TP.can_admin;
		*/
        /*
        SET v_has_permission := (
			SELECT can_edit 
            FROM Shop_Calc_User_Temp 
            WHERE 
				GUID = v_guid_permission
				AND can_edit = 0
        );
        
        IF v_has_permission = 0 THEN
			SET v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, msg
			)
			SELECT
				a_guid, 
				v_id_error_type_no_permission, 
				CONCAT('You do not have ', name, ' permissions.')
			FROM Shop_Permission
            WHERE id_permission = v_id_permission_manufacturing_purchase_order
			;
        END IF;
        */
        SET v_ids_product_no_permission := (
			SELECT GROUP_CONCAT(PT.id_product SEPARATOR ',') 
            FROM Shop_Calc_User_Temp PT 
            WHERE 
				PT.can_edit = 0
				AND NOT ISNULL(PT.id_product)
        );
        IF NOT ISNULL(v_ids_product_no_permission) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES (
				a_guid, 
				v_id_error_type_no_permission, 
                v_code_error_type_no_permission,
                CONCAT('You do not have permission to edit the following product IDs: ', v_ids_product_no_permission)
			)
			;
        END IF;
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
				CONCAT(
					'Save ',
					CASE WHEN v_is_new_manufacturing_purchase_order = 1 THEN 'new ' ELSE '' END,
					'Manufacturing Purchase Order - ', 
					a_comment
				),
				a_id_user,
				CURRENT_TIME()
			);
			
			SET v_id_change_set := (SELECT id_change_set FROM Shop_Sales_And_Purchasing_Change_Set ORDER BY id_change_set DESC LIMIT 1);
			
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
					-- a_id_supplier_ordered,
					SUM(t_MPOPL.cost_total_local),
                    a_id_currency_cost,
					SUM(t_MPOPL.value_produced_total_local),
                    a_id_user,
                    v_id_change_set,
                    a_active
				FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
				;
                -- SET v_id_order_new 
                SET a_id_order := (SELECT id_order FROM Shop_Manufacturing_Purchase_Order ORDER BY id_order DESC LIMIT 1);
                
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
					a_id_order, -- v_id_order_new,
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
                    a_id_user,
                    v_id_change_set
				FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
				;
			ELSE
				UPDATE Shop_Manufacturing_Purchase_Order MPO
				INNER JOIN tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL ON MPO.id_order = t_MPOPL.id_order
                SET
					-- MPO.id_supplier_ordered = a_id_supplier_ordered,
					MPO.cost_total_local = SUM(t_MPOPL.cost_total_local),
                    MPO.value_produced_total_local = SUM(t_MPOPL.value_produced_total_local),
                    MPO.id_currency = a_id_currency_cost,
                    MPO.id_change_set = v_id_change_set,
                    MPO.active = a_active
				WHERE MPO.id_order = a_id_order
				;
                IF EXISTS (SELECT * FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL INNER JOIN Shop_Manufacturing_Purchase_Order_Product_Link MPOPL ON t_MPOPL.id_link = MPOPL.id_link) THEN
					UPDATE Shop_Manufacturing_Purchase_Order_Product_Link MPOPL
					INNER JOIN tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
						ON MPOPL.id_link = t_MPOPL.id_link
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
                        a_id_user,
						v_id_change_set
					FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
                    WHERE t_MPOPL.id_link < 0
					;
                END IF;
			END IF;
		
		IF EXISTS (SELECT * FROM tmp_Msg_Error) THEN
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
    END IF;
    
    -- Returns
    # SET v_now = NOW();
    
    # Manufacturing Purchase Orders
    SELECT *
    FROM Shop_Manufacturing_Purchase_Order
    WHERE 
		id_order = a_id_order
        -- GUID = a_guid
    ;
    
    # Manufacturing Purchase Order Product Links
    SELECT *
    FROM Shop_Manufacturing_Purchase_Order_Product_Link
    WHERE
		id_order = a_id_order
        -- GUID = a_guid
    ;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
	;
    
    # DROP TABLE tmp_Shop_Manufacturing_Purchase_Order;
    DROP TABLE tmp_Shop_Manufacturing_Purchase_Order_Product_Link;
    DROP TABLE tmp_Msg_Error;
END //
DELIMITER ;;


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
		'NIPS', # guid
		-1, # id_link,
		-1, # id_order,
		1, # id_permutation,
		100, # cost_total_local,
		1, # id_currency_cost,
		1, # quantity_used,
		1, # id_unit_quantity,
		1, # quantity_produced,
		14, # latency_manufacture_days ,
		1, # display_order
        1 # active
    )
;

SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

CALL p_shop_save_manufacturing_purchase_order (
	'NIPS', # a_guid
    'auth0|6582b95c895d09a70ba10fef', # a_id_user
    -1, # a_id_order
    1, # a_id_currency_cost
    1, # a_active
    'Initial data' # a_comment
);

SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;
DELETE FROM Shop_Manufacturing_Purchase_Order_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order;


*/





-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_manufacturing_purchase_order;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_manufacturing_purchase_order (
	IN a_id_user INT,
    IN a_get_all_order BIT,
	-- IN a_get_inactive_order BIT,
	IN a_get_first_order_only BIT,
	IN a_ids_order VARCHAR(4000),
	IN a_get_inactive_category BIT,
	IN a_ids_category VARCHAR(4000),
	IN a_get_inactive_product BIT,
	IN a_ids_product VARCHAR(4000),
	IN a_get_inactive_permutation BIT,
	IN a_ids_permutation VARCHAR(4000),
    IN a_date_from DATETIME,
    IN a_date_to DATETIME
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_order BIT;
    DECLARE v_has_filter_category BIT;
    DECLARE v_has_filter_product BIT;
    DECLARE v_has_filter_permutation BIT;
    DECLARE v_has_filter_date_from BIT;
    DECLARE v_has_filter_date_to BIT;
    DECLARE v_guid BINARY(36);
    # DECLARE v_id_user VARCHAR(100);
    # DECLARE v_ids_permutation_unavailable VARCHAR(4000);
    DECLARE v_ids_permission_manufacturing_purchase_order VARCHAR(4000);
    DECLARE v_ids_product_permission VARCHAR(4000);
    # DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    -- DECLARE v_now DATETIME;
    -- DECLARE v_id_minimum INT;
    DECLARE v_code_error_data VARCHAR(50);
    DECLARE v_id_type_error_data INT;
    
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    -- SET v_ids_permission_manufacturing_purchase_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'SHOP_manufacturing_PURCHASE_ORDER' LIMIT 1);
    SET v_code_error_data = 'BAD_DATA';
    SET v_id_type_error_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data);
    
	-- Argument validation + default values
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_get_all_order IS NULL THEN
		SET a_get_all_order = 1;
    END IF;
    /*
	IF a_get_inactive_order IS NULL THEN
		SET a_get_inactive_order = 0;
    END IF;
	*/
    IF a_get_first_order_only IS NULL THEN
		SET a_get_first_order_only = 0;
    END IF;
	IF a_ids_order IS NULL THEN
		SET a_ids_order = '';
	ELSE
		SET a_ids_order = TRIM(REPLACE(a_ids_order, '|', ','));
    END IF;
	IF a_get_inactive_category IS NULL THEN
		SET a_get_inactive_category = 0;
    END IF;
	IF a_ids_category IS NULL THEN
		SET a_ids_category = '';
	ELSE
		SET a_ids_category = TRIM(REPLACE(a_ids_category, '|', ','));
    END IF;
	IF a_get_inactive_product IS NULL THEN
		SET a_get_inactive_product = 0;
    END IF;
	IF a_ids_product IS NULL THEN
		SET a_ids_product = '';
	ELSE
		SET a_ids_product = TRIM(REPLACE(a_ids_product, '|', ','));
    END IF;
	IF a_get_inactive_permutation IS NULL THEN
		SET a_get_inactive_permutation = 0;
    END IF;
	IF a_ids_permutation IS NULL THEN
		SET a_ids_permutation = '';
	ELSE
		SET a_ids_permutation = TRIM(REPLACE(a_ids_permutation, '|', ','));
    END IF;
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order_Product_Link;
    DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    
    CREATE TABLE tmp_Shop_Manufacturing_Purchase_Order (
		id_order INT NOT NULL PRIMARY KEY,
		/*
        id_supplier_ordered INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Manufacturing_Purchase_Order_id_supplier_ordered
			FOREIGN KEY (id_supplier_ordered) 
			REFERENCES Shop_Supplier(id_supplier),
		*/
		cost_total_local FLOAT NOT NULL,
		id_currency_cost INT NOT NULL,
        value_produced_total_local FLOAT NOT NULL,
        active BIT NOT NULL,
        rank_order INT NOT NULL
    );
    
    /*
    CREATE TABLE tmp_Shop_Manufacturing_Purchase_Order_Product_Link (
		id_link INT NOT NULL PRIMARY KEY,
		id_order INT NOT NULL,
		CONSTRAINT FK_tmp_manufacturing_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_manufacturing_Purchase_Order(id_order),
		id_permutation INT NOT NULL,
		CONSTRAINT FK_tmp_manufacturing_Purchase_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		cost_total_local FLOAT NOT NULL,
		id_currency_cost INT NOT NULL,
		quantity_used FLOAT NOT NULL,
		id_unit_quantity INT NOT NULL,
		CONSTRAINT FK_tmp_manufacturing_Purchase_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_produced FLOAT NULL,
		latency_delivery_days INT NOT NULL,
		display_order INT NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Product (
		id_category INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Product_Category(id_category),
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
        # name VARCHAR(255) NOT NULL,
        # description VARCHAR(4000) NOT NULL,
		/*
        price_GBP_full FLOAT NOT NULL,
		price_GBP_min FLOAT NOT NULL,
		*/
        /*
        latency_manufacture_days INT NOT NULL,
		quantity_min FLOAT NOT NULL,
		quantity_max FLOAT NOT NULL,
		quantity_step FLOAT NOT NULL,
		quantity_stock FLOAT NOT NULL,
		is_subscription BIT NOT NULL,
		id_unit_measurement_interval_recurrence INT,
		CONSTRAINT FK_tmp_Shop_Product_id_unit_measurement_interval_recurrence
			FOREIGN KEY (id_unit_measurement_interval_recurrence)
			REFERENCES Shop_Interval_Recurrence(id_interval),
		count_interval_recurrence INT,
        id_stripe_product VARCHAR(100),
        product_has_variations INT NOT NULL,
        */
        can_view BIT, 
        can_edit BIT, 
        can_admin BIT
    );
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Parse filters
    SET v_has_filter_order = CASE WHEN a_ids_order = '' THEN 0 ELSE 1 END;
    SET v_has_filter_category = CASE WHEN a_ids_category = '' THEN 0 ELSE 1 END;
    SET v_has_filter_product = CASE WHEN a_ids_product = '' THEN 0 ELSE 1 END;
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_date_from = CASE WHEN ISNULL(a_date_from) THEN 0 ELSE 1 END;
    SET v_has_filter_date_to = CASE WHEN ISNULL(a_date_to) THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
    IF v_has_filter_category = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
			CALL p_split(a_guid, a_ids_category, ',');
			
			IF EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Product_Category C ON TS.substring = C.id_category WHERE ISNULL(C.id_category)) THEN 
				INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					v_guid,
					v_id_type_error_data,
					v_code_error_data, 
					CONCAT('Invalid category IDs: ', IFNULL(GROUP_CONCAT(TS.substring SEPARATOR ', ') ,'NULL')) 
				FROM Split_Temp TS 
				LEFT JOIN Shop_Product_Category C ON TS.substring = C.id_category 
				WHERE ISNULL(C.id_category)
				;
			END IF;
			
			DROP TABLE Temp_Split;
		END IF;
	END IF;
    
    IF v_has_filter_product = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
			CALL p_split(a_guid, a_ids_product, ',');
			
			IF EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Product ON TS.substring = P.id_product WHERE ISNULL(P.id_product)) THEN 
				INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					v_guid,
					v_id_type_error_data,
					v_code_error_data, 
					CONCAT('Invalid product IDs: ', IFNULL(GROUP_CONCAT(TS.substring SEPARATOR ', ') ,'NULL'))
				FROM Split_Temp TS
                LEFT JOIN Shop_Product ON TS.substring = P.id_product 
                WHERE ISNULL(P.id_product)
				;
			END IF;
			
			DROP TABLE Temp_Split;
		END IF;
	END IF;
    
    IF v_has_filter_permutation = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
			CALL p_split(a_guid, a_ids_permutation, ',');
			
			IF EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Product_Permutation PP ON TS.substring = PP.id_permutation WHERE ISNULL(PP.id_permutation)) THEN 
				INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					v_guid,
					v_id_type_error_data,
					v_code_error_data, 
					CONCAT('Invalid permutation IDs: ', IFNULL(GROUP_CONCAT(TS.substring SEPARATOR ', ') ,'NULL')) 
				FROM Split_Temp TS 
                LEFT JOIN Shop_Product_Permutation PP ON TS.substring = PP.id_permutation 
                WHERE ISNULL(PP.id_permutation)
				;
			END IF;
			
			DROP TABLE Temp_Split;
		END IF;
	END IF;
    
    IF v_has_filter_category = 1 OR v_has_filter_product = 1 OR v_has_filter_permutation = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
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
				*
				latency_manufacture_days,
				quantity_min,
				quantity_max,
				quantity_step,
				quantity_stock,
				is_subscription,
				id_unit_measurement_interval_recurrence,
				count_interval_recurrence,
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
				-- RANK() OVER (ORDER BY C.display_order, P.display_order, PP.display_order) AS rank_permutation, #PARTITION BY P.id_category # _in_category
				/*
				P.name,
				PP.description,
				/*
				PP.price_GBP_VAT_incl,
				PP.price_GBP_VAT_excl,
				PP.price_GBP_min,
				*
				PP.latency_manufacture_days,
				PP.quantity_min,
				PP.quantity_max,
				PP.quantity_step,
				PP.quantity_stock,
				PP.is_subscription,
				PP.id_unit_measurement_interval_recurrence,
				PP.count_interval_recurrence,
				PP.id_stripe_product,
				P.has_variations
				*/
			FROM Shop_Product P
			INNER JOIN Shop_Product_Permutation PP
				ON P.id_product = PP.id_product
			INNER JOIN Shop_Product_Category C
				ON P.id_category = C.id_category
			WHERE
				# permutations
				(
					(
						NOT v_has_filter_permutation 
						OR FIND_IN_SET(PP.id_permutation, a_ids_permutation) > 0
					)
					AND (
						a_get_inactive_permutation 
						OR PP.active = 1
					)
				)
				# categories
				AND (
					(
						NOT v_has_filter_category 
						OR FIND_IN_SET(P.id_category, a_ids_category) > 0
					)
					AND (
						a_get_inactive_category 
						OR C.active = 1
					)
				) 
				# products
				AND (
					(
						NOT v_has_filter_product 
						OR FIND_IN_SET(P.id_product, a_ids_product) > 0
					)
                    AND (
						a_get_inactive_product 
						OR P.active = 1
					)
				)
			;
        END IF;
    END IF;
    
    -- Get orders
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		CALL p_split(a_guid, a_ids_order, ',');
        
		IF v_has_filter_order AND EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Manufacturing_Purchase_Order MPO ON TS.substring = MPO.id_order WHERE ISNULL(MPO.id_order)) THEN 
			INSERT INTO tmp_Msg_Error (
				guid,
                id_type,
				code,
				msg
			)
			SELECT
				v_guid,
                v_id_type_error_data,
				v_code_error_data, 
				CONCAT('Invalid order IDs: ', IFNULL(GROUP_CONCAT(TS.substring SEPARATOR ', '), 'NULL'))
			FROM Split_Temp TS 
            LEFT JOIN Shop_Manufacturing_Purchase_Order MPO ON TS.substring = MPO.id_order 
            WHERE ISNULL(MPO.id_order)
			;
		END IF;
		
        IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
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
			INNER JOIN Split_Temp TS ON MPO.id_order = TS.substring
            INNER JOIN Shop_manufacturing_Purchase_Order_Product_Link MPOPL ON MPO.id_order = MPOPL.id_order
            INNER JOIN Shop_Product_Permutation PP ON MPOPL.id_permutation = PP.id_permutation
            INNER JOIN Shop_Product P ON PP.id_product = P.id_product
            INNER JOIN Shop_Product_Category C ON P.id_category = C.id_category
            LEFT JOIN tmp_Shop_Product t_P ON MPOPL.id_permutation = t_P.id_permutation
			WHERE
				# order
				(
					(
						v_has_filter_order = 0
						OR (
							# ID
							FIND_IN_SET(MPO.id_order, a_ids_order) > 0
                            # date
                            AND (
								(
									v_has_filter_date_from = 0
									OR MPO.created_on > a_date_from
								)
								AND (
									v_has_filter_date_to = 0
									OR MPO.created_on < a_date_to
								)
							)
						)
					)
                    # active
                    /*
					AND (
						a_get_inactive_order
						OR MPO.active = 1
					)
                    */
				)
				# permutations
				AND (
					(
						v_has_filter_category = 0 
                        AND v_has_filter_product = 0 
                        AND v_has_filter_permutation = 0
					)
					OR NOT ISNULL(t_P.id_permutation) -- MPO.id_permutation IN (SELECT DISTINCT id_permutation FROM tmp_Shop_Product)
				)
			;
		END IF;
        
        DROP TABLE Split_Temp;
		
		IF a_get_first_order_only THEN
			DELETE t_MPO
            FROM tmp_Shop_Manufacturing_Purchase_Order t_MPO
			WHERE t_MPO.rank_order > (
				SELECT MIN(t_MPO.rank_order)
				FROM tmp_Shop_Manufacturing_Purchase_Order t_MPO
			)
			;
		END IF;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
        # SET v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER());
        SET v_ids_permission_manufacturing_purchase_order := (SELECT GROUP_CONCAT(id_permission SEPARATOR ',') FROM Shop_Permission WHERE code IN ('STORE_manufacturing', 'STORE_manufacturing_PURCHASE_ORDER'));
        -- SET v_ids_permutation_permission := (SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
        SET v_ids_product_permission := (SELECT GROUP_CONCAT(P.id_product SEPARATOR ',') FROM (SELECT DISTINCT id_product FROM tmp_Shop_Product WHERE NOT ISNULL(id_product)) P);
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
        -- select * from Shop_Calc_User_Temp;
        
        CALL p_shop_calc_user(v_guid, a_id_user, FALSE, v_ids_permission_manufacturing_purchase_order, v_id_access_level_view, v_ids_product_permission);
        
        -- select * from Shop_Calc_User_Temp;
        
        IF NOT EXISTS (SELECT can_view FROM Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
                id_type,
				code,
				msg
			)
			SELECT
				v_guid,
                v_id_type_error_data,
				v_code_error_data, 
				CONCAT('You do not have view permissions for ', GROUP_CONCAT(name SEPARATOR ', ')) 
			FROM Shop_Permission 
            WHERE id_permission = v_ids_permission_manufacturing_purchase_order
			;
        END IF;
        
        
        UPDATE tmp_Shop_Product t_P
        INNER JOIN Shop_Calc_User_Temp UE_T
			ON t_P.id_product = UE_T.id_product -- t_P.id_permutation = UE_T.id_permutation
			AND UE_T.GUID = v_guid
        SET t_P.can_view = UE_T.can_view,
			t_P.can_edit = UE_T.can_edit,
            t_P.can_admin = UE_T.can_admin
		;
        
        # CALL p_shop_clear_calc_user(v_guid);
        # DROP TABLE IF EXISTS Shop_Calc_User_Temp;
        DELETE FROM Shop_Calc_User_Temp
        WHERE GUID = v_guid
        ;
	END IF;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns
    -- SET v_now := NOW();
    
    # manufacturing Purchase Order
    SELECT # *
		t_MPO.id_order,
		MPO.cost_total_local,
		MPO.id_currency_cost,
        MPO.value_produced_total_local,
        t_MPO.active
    FROM Shop_Manufacturing_Purchase_Order MPO
    INNER JOIN tmp_Shop_Manufacturing_Purchase_Order t_MPO ON MPO.id_order = t_MPO.id_order
    ;
    
    # manufacturing Purchase Order Product Link
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
    
    # Errors
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
    DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order_Product_Link;
    DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order;
    DROP TABLE IF EXISTS tmp_Shop_Product;
        
	DELETE FROM Shop_Calc_User_Temp
	WHERE GUID = v_guid
	;
END //
DELIMITER ;;


/*

CALL p_shop_get_many_manufacturing_purchase_order (
	'', # a_id_user
	1, # a_get_all_order
	-- 0, # a_get_inactive_order
    0, # a_get_first_order_only
    '', # a_ids_order
	0, # a_get_inactive_category
	'', # a_ids_category
    0, # a_get_inactive_product
	'', # a_ids_product
    0, # a_get_inactive_permutation
    '', # a_ids_permutation
    NULL, # a_date_from
	NULL # a_date_to
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




-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_customer;


DELIMITER //
CREATE PROCEDURE p_shop_save_customer (
	IN a_guid VARCHAR(500),
    IN a_id_user INT,
    IN a_comment VARCHAR(500),
    IN a_id_customer INT,
    IN a_name_company VARCHAR(256),
    IN a_name_contact VARCHAR(256),
    IN a_department_contact VARCHAR(256),
    IN a_id_address INT,
    IN a_phone_number VARCHAR(20),
    IN a_email VARCHAR(515),
    IN a_id_currency INT,
    IN a_active BIT
)
BEGIN
    DECLARE v_id_error_type_bad_data INT;
    DECLARE v_id_error_type_no_permission INT;
	DECLARE v_guid_permission BINARY(36);
    DECLARE v_id_permission_customer INT;
    DECLARE v_id_access_level_EDIT INT;
    DECLARE v_has_permission BIT;
    DECLARE v_id_change_set INT;
    DECLARE v_is_new_customer BIT;
    
    SET v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA');
	SET v_guid_permission = UUID();
	SET v_id_permission_customer = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_CUSTOMER' LIMIT 1);
	SET v_id_access_level_EDIT = (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT');
    
	-- Argument default values
    IF a_guid IS NULL THEN 
		SET a_guid = UUID();
	END IF;
    
    
    -- Temporary tables
    /*
    CREATE TABLE tmp_Shop_Customer (
		id_customer INT NOT NULL,
		name_company VARCHAR(255) NOT NULL,
		name_contact VARCHAR(255) NULL,
		department_contact VARCHAR(255) NULL,
		id_address INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Customer_id_address
			FOREIGN KEY (id_address)
			REFERENCES Shop_Address(id_address),
		phone_number VARCHAR(50) NULL,
		fax VARCHAR(50) NULL,
		email VARCHAR(255) NOT NULL,
		website VARCHAR(255) NULL,
		id_currency INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Customer_id_currency
			FOREIGN KEY (id_currency)
			REFERENCES Shop_Currency(id_currency),
		active BIT NOT NULL,
        can_view BIT NOT NULL, 
        can_edit BIT NOT NULL, 
        can_admin BIT NOT NULL
    );
    */
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Argument validation
	IF a_id_customer IS NULL THEN
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(a_guid, v_id_error_type_bad_data, 'Customer ID must not be null')
        ;
    END IF;
	IF a_name_company IS NULL THEN
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(a_guid, v_id_error_type_bad_data, 'Customer company name must not be null')
        ;
    END IF;
	IF a_id_address IS NULL THEN
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(a_guid, v_id_error_type_bad_data, 'Customer address ID must not be null')
        ;
    END IF;
	IF a_email IS NULL THEN
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(a_guid, v_id_error_type_bad_data, 'Customer email must not be null')
        ;
    END IF;
	IF a_active IS NULL THEN
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
        VALUES
			(a_guid, v_id_error_type_bad_data, 'Customer active status must not be null')
        ;
    END IF;
    
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		SET v_is_new_customer := CASE WHEN a_id_customer <= 0 THEN 1 ELSE 0 END;
		
        IF (v_is_new_customer = 0 AND NOT EXISTS (SELECT * FROM Shop_Customer C WHERE C.id_customer = a_id_customer)) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, CONCAT('Invalid customer ID: ', a_id_customer))
			;
		END IF;
    END IF;
    
    /*
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		INSERT INTO tmp_Shop_Customer (
			id_customer, name_company, name_contact, department_contact, id_address, phone_number, fax, email, website, id_currency, active
		)
		VALUES 
			(a_id_customer, a_name_company, a_name_contact, a_department_contact, a_id_address, a_phone_number, a_fax, a_email, a_website, a_id_currency, a_active)
		/*
		FROM Shop_Customer S
		WHERE (NOT v_has_filter_category OR C.id_category LIKE '%' || a_ids_category || '%')
			AND (a_get_inactive_categories OR C.active)
		*
        ;
    END IF;
    */
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
        CALL p_shop_calc_user(v_guid_permission, a_id_user, 0, v_id_permission_customer, v_id_access_level_edit, '');
        
        /*
        UPDATE tmp_Shop_Customer t_S
        INNER JOIN Shop_Calc_User_Temp TP
			ON TP.GUID = v_guid_permission
        SET tP.can_view = TP.can_view,
			tP.can_edit = TP.can_edit,
            tP.can_admin = TP.can_admin;
		*/
        SET v_has_permission := (SELECT can_edit FROM Shop_Calc_User_Temp WHERE GUID = v_guid_permission);
        
        IF v_has_permission = 0 THEN
			SET v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, msg
			)
			SELECT
				a_guid, 
				v_id_error_type_no_permission, 
				CONCAT('You do not have ', name, ' permissions.')
			FROM Shop_Permission
            WHERE id_permission = v_id_permission_customer
			;
        END IF;
        
        -- CALL p_shop_clear_calc_user(v_guid_permission);
        
        DELETE FROM Shop_Calc_User_Temp
        WHERE GUID = a_guid;
    END IF;
    
    
	-- Transaction    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		INSERT INTO Shop_Sales_And_Purchasing_Change_Set (
			comment,
			updated_last_by,
			updated_last_on
		)
		VALUES (
			CONCAT(
				'Save ',
                CASE WHEN v_is_new_customer = 1 THEN 'new ' ELSE '' END,
                'Customer - ',
                a_comment
			),
			a_id_user,
			CURRENT_TIME()
		);
		
        SET v_id_change_set := (SELECT id_change_set FROM Shop_Sales_And_Purchasing_Change_Set ORDER BY id_change_set DESC LIMIT 1);
        
		START TRANSACTION;
			IF (v_is_new_customer = 1) THEN
				INSERT INTO Shop_Customer (
					-- id_customer, 
                    name_company, name_contact, department_contact, id_address, phone_number, email, id_currency, active, id_change_set
				)
				VALUES 
					(
						-- a_id_customer, 
						a_name_company, a_name_contact, a_department_contact, a_id_address, a_phone_number, a_email, a_id_currency, a_active, v_id_change_set
                    )
				/*
				FROM Shop_Customer S
				WHERE (NOT v_has_filter_category OR C.id_category LIKE '%' || a_ids_category || '%')
					AND (a_get_inactive_categories OR C.active)
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
					C.name_company = a_name_company,
					C.name_contact = a_name_contact,
					C.department_contact = a_department_contact,
					C.id_address = a_id_address,
					C.phone_number = a_phone_number,
					C.email = a_email,
					C.website = a_website,
					C.id_currency = a_id_currency,
					C.active = a_active,
                    C.id_change_set = v_id_change_set
				;
			END IF;
		
		IF EXISTS (SELECT * FROM tmp_Msg_Error) THEN
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
    END IF;
    
    -- Returns
    -- SET v_now = NOW();
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
	;
    
    -- DROP TABLE tmp_Shop_Customer;
    DROP TABLE tmp_Msg_Error;
END //
DELIMITER ;;


/*

CALL p_shop_save_customer (
	'NIPS', # a_guid
    'auth0|6582b95c895d09a70ba10fef', # a_id_user
    'Initial Customer', # a_comment
    '-1', # a_id_customer
    'good co', # a_name_company
    'teddy', # a_name_contact
    'manufacturing', # a_department_contact
    1, # a_id_address
    'BRING BRING', # a_phone_number
    'e@mail.com', # a_email
    1, # a_id_currency_cost
    1 # a_active
);

SELECT * FROM Shop_Customer
;

DELETE FROM Shop_Customer
;

*/



/*

CALL p_shop_get_many_customer (
	'', # a_id_user
    1, # a_get_all_customer
	0, # a_get_inactive_customer
    0, # a_get_first_customer_only
	'', # a_ids_customer
);

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_customer;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_customer (
	IN a_id_user INT,
    IN a_get_all_customer BIT,
	IN a_get_inactive_customer BIT,
    IN a_get_first_customer_only BIT,
	IN a_ids_customer VARCHAR(4000)
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_id_error_type_bad_data INT;
    DECLARE v_code_error_type_bad_data VARCHAR(50);
    DECLARE v_has_filter_customer BIT;
    DECLARE v_guid BINARY(36);
    # DECLARE v_id_user VARCHAR(100);
    # DECLARE v_ids_permutation_unavailable VARCHAR(4000);
    DECLARE v_id_permission_customer INT;
    # DECLARE v_ids_product_permission VARCHAR(4000);
    # DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    DECLARE v_now DATETIME;
    DECLARE v_id_minimum INT;
    
    SET v_code_error_type_bad_data = 'BAD_DATA';
    SET v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_bad_data LIMIT 1);
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');
    
    
	-- Argument validation + default values
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_get_inactive_customer IS NULL THEN
		SET a_get_inactive_customer = 0;
    END IF;
	IF a_get_first_customer_only IS NULL THEN
		SET a_get_first_customer_only = 0;
    END IF;
	IF a_ids_customer IS NULL THEN
		SET a_ids_customer = '';
	ELSE
		SET a_ids_customer = TRIM(REPLACE(a_ids_customer, '|', ','));
    END IF;
    
    SET v_has_filter_customer = CASE WHEN a_ids_customer = '' THEN 0 ELSE 1 END;
    
	IF a_get_all_customer IS NULL THEN
		SET a_get_all_customer = NOT v_has_filter_customer;
    END IF;
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Customer;
    
    CREATE TABLE tmp_Shop_Customer (
		id_customer INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Customer_id_customer
			FOREIGN KEY (id_customer)
			REFERENCES Shop_Customer(id_customer),
        active BIT NOT NULL,
        rank_customer INT NULL,
        can_view BIT, 
        can_edit BIT, 
        can_admin BIT
    );
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Parse filters
    SET v_has_filter_customer = CASE WHEN a_ids_customer = '' THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
    IF v_has_filter_customer = 1 OR a_get_all_customer = 1 THEN
		CALL p_split(a_guid, a_ids_customer, ',');
        
		IF EXISTS (SELECT * FROM Split_Temp S_T LEFT JOIN Shop_Customer C ON S_T.substring = C.id_customer WHERE ISNULL(C.id_customer)) THEN 
			INSERT INTO tmp_Msg_Error (
				guid,
                id_type,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_id_error_type_bad_data,
				v_code_error_type_bad_data, 
				CONCAT('Invalid customer IDs: ', (SELECT GROUP_CONCAT(C.id_customer) FROM Split_Temp S_T LEFT JOIN Shop_Customer C ON S_T.substring = C.id_customer WHERE ISNULL(C.id_customer)))
			)
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
                    OR C.active = 1
                )
			;
        END IF;
        
        DROP TABLE Split_Temp;
		
		IF a_get_first_customer_only = 1 THEN
			DELETE t_C
			FROM tmp_Shop_Customer t_C
			WHERE t_C.rank_customer > (
				SELECT MIN(t_C.rank_customer)
				FROM tmp_Shop_Customer t_C
			)
			;
		END IF;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
        # SET v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER());
        SET v_id_permission_customer := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_CUSTOMER' LIMIT 1);
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
        -- select * from Shop_Calc_User_Temp;
        
        CALL p_shop_calc_user(v_guid, a_id_user, FALSE, v_id_permission_customer, v_id_access_level_view, '');
        
        -- select * from Shop_Calc_User_Temp;
        
        IF NOT EXISTS (SELECT can_view FROM Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
                id_type,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_id_error_type_bad_data,
				v_code_error_type_bad_data, 
				CONCAT('You do not have view permissions for ', IFNULL((SELECT name FROM Shop_Permission WHERE id_permission = v_id_permission_customer LIMIT 1), 'Permission not found'))
			)
			;
        END IF;
	END IF;
    
    
    -- select * from tmp_Shop_Product;
    
    -- Returns
    -- SET v_now := NOW();
    
    # customers
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
    
    # Errors
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
    DROP TABLE IF EXISTS tmp_Shop_Customer;
        
	DELETE FROM Shop_Calc_User_Temp
	WHERE GUID = v_guid
	;
END //
DELIMITER ;;


/*
CALL p_shop_get_many_customer (
	'', # a_id_user
    1, # a_get_all_customer
	0, # a_get_inactive_customer
    0, # a_get_first_customer_only
	'' # a_ids_customer
);

SELECT *
FROM Shop_Customer;

*/




-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_customer_sales_order;

DROP TABLE IF EXISTS tmp_Shop_Customer_Sales_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Msg_Error;

DELIMITER //
CREATE PROCEDURE p_shop_save_customer_sales_order (
	IN a_guid VARCHAR(500),
    IN a_id_user INT,
    IN a_comment VARCHAR(500),
    IN a_id_order INT,
    IN a_id_customer INT,
    IN a_id_currency_price INT,
    IN a_active BIT
)
BEGIN
    DECLARE v_id_error_type_bad_data INT;
    DECLARE v_code_error_type_bad_data VARCHAR(50);
    DECLARE v_id_error_type_no_permission INT;
    DECLARE v_code_error_type_no_permission VARCHAR(50);
    DECLARE v_guid_permission BINARY(36);
    -- DECLARE v_id_user VARCHAR(100);
    DECLARE v_id_permission_Customer_Sales_order INT;
	DECLARE v_id_access_level_EDIT INT;
    DECLARE v_ids_product VARCHAR(4000);
    DECLARE v_ids_product_no_permission VARCHAR(4000);
    -- DECLARE v_id_order_new INT;
    DECLARE v_id_change_set INT;
    DECLARE v_is_new_Customer_Sales_order BIT;
    
	SET SESSION sql_mode = sys.list_drop(@@session.sql_mode, 'ONLY_FULL_GROUP_BY');
    
    SET v_code_error_type_bad_data = 'BAD_DATA';
    SET v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_bad_data LIMIT 1);
    SET v_code_error_type_no_permission = 'NO_PERMISSION';
    SET v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_no_permission LIMIT 1);
	SET v_guid_permission = UUID();
	-- SET v_id_user = CURRENT_USER();
	SET v_id_permission_Customer_Sales_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_CUSTOMER_SALES_ORDER' LIMIT 1);
	SET v_id_access_level_EDIT := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT');
    
	-- Argument default values
    IF a_guid IS NULL THEN 
		SET a_guid = UUID();
	END IF;
	IF a_active IS NULL THEN
		SET a_active = 0;
    END IF;
    
    -- Temporary tables
    /*
    CREATE TABLE tmp_Shop_Customer_Sales_Order (
		id_order INT NOT NULL PRIMARY KEY,
		id_supplier_ordered INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Customer_Sales_Order_id_supplier_ordered
			FOREIGN KEY (id_supplier_ordered) 
			REFERENCES Shop_Supplier(id_supplier),
		price_total_local FLOAT NOT NULL,
		id_currency_price INT NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Customer_Sales_Order_Product_Link (
		id_link INT NOT NULL PRIMARY KEY,
		id_order INT NOT NULL,
        /*
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_Customer_Sales_Order(id_order),
		*/
        id_permutation INT NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		price_total_local FLOAT NOT NULL,
		id_currency_price INT NOT NULL,
		quantity_ordered FLOAT NOT NULL,
		id_unit_quantity INT NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_delivered FLOAT NULL,
		latency_delivery_days INT NOT NULL,
		display_order INT NOT NULL,
        active BIT NOT NULL,
        name_error VARCHAR(200) NOT NULL
    );
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Argument validation
    # User ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_id_user) OR NOT EXISTS (SELECT * FROM Shop_User WHERE id_user = a_id_user) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid User ID: ', IFNULL(a_id_user, 'NULL')))
			;
		END IF;
    END IF;
    
    # Order ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_id_order) OR ((a_id_order > 0) AND NOT EXISTS (SELECT * FROM Shop_Customer_Sales_Order WHERE id_order = a_id_order)) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid Customer Sales Order ID: ', IFNULL(a_id_order, 'NULL')))
			;
		END IF;
    END IF;
    
    # Customer ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_id_customer) OR NOT EXISTS (SELECT * FROM Shop_Customer WHERE id_customer = a_id_customer) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid Customer ID: ', IFNULL(a_id_customer, 'NULL')))
			;
		END IF;
    END IF;
    
    # Currency ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_id_currency_price) OR NOT EXISTS (SELECT * FROM Shop_Currency WHERE id_currency = a_id_currency_price) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid currency ID: ', IFNULL(a_id_currency, 'NULL')))
			;
		END IF;
    END IF;
    
    # Comment
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_comment) OR TRIM(a_comment) = '' THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, 'A comment must be provided.')
			;
		END IF;
    END IF;
    

	-- Get data from Temp table
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		SET v_is_new_Customer_Sales_order := CASE WHEN a_id_order <= 0 THEN 1 ELSE 0 END;
		
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
        /*
		VALUES 
			(a_id_supplier, a_name_company, a_name_contact, a_department_contact, a_id_address, a_phone_number, a_fax, a_email, a_website, a_id_currency, a_active)
		*/
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
            CONCAT(PP.id_permutation, ' - ', IFNULL(P.name ,'')) AS name_error
        FROM Shop_Customer_Sales_Order_Product_Link_Temp CSOPL_T
        INNER JOIN Shop_Product_Permutation PP ON CSOPL_T.id_permutation = PP.id_permutation
        INNER JOIN Shop_Product P ON PP.id_product = P.id_product
		WHERE CSOPL_T.GUID = a_guid
        ;
        DELETE CSOPL_T
		FROM Shop_Customer_Sales_Order_Product_Link_Temp CSOPL_T
		WHERE CSOPL_T.GUID = a_guid
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
				a_guid, 
                v_id_error_type_bad_data, 
                v_code_error_type_bad_data, 
                CONCAT('Invalid quantity ordered property for the following permutations: ', GROUP_CONCAT(t_CSOPL.name_error SEPARATOR ', '))
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
				a_guid, 
                v_id_error_type_bad_data, 
                v_code_error_type_bad_data, 
                CONCAT('Duplicate records: ', GROUP_CONCAT(t_CSOPLC.name_error SEPARATOR ', '))
			FROM (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL GROUP BY id_permutation HAVING COUNT(*) > 1) t_CSOPLC
			;
        END IF;
	END IF;
    
    
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
        SET v_ids_product := (
			SELECT GROUP_CONCAT(G.id_product SEPARATOR ',')
            FROM (
				SELECT DISTINCT PP.id_product
				FROM tmp_Shop_Customer_Sales_Order_Product_Link t_SPO
				INNER JOIN Shop_Product_Permutation PP ON t_SPO.id_permutation = PP.id_permutation
			) G
		);
        
        CALL p_shop_calc_user(v_guid_permission, a_id_user, 0, v_id_permission_Customer_Sales_order, v_id_access_level_edit, v_ids_product);
        
        /*
        UPDATE tmp_Shop_Supplier t_S
        INNER JOIN Shop_Calc_User_Temp TP
			ON TP.GUID = v_guid_permission
        SET tP.can_view = TP.can_view,
			tP.can_edit = TP.can_edit,
            tP.can_admin = TP.can_admin;
		*/
        /*
        SET v_has_permission := (
			SELECT can_edit 
            FROM Shop_Calc_User_Temp 
            WHERE 
				GUID = v_guid_permission
				AND can_edit = 0
        );
        
        IF v_has_permission = 0 THEN
			SET v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, msg
			)
			SELECT
				a_guid, 
				v_id_error_type_no_permission, 
				CONCAT('You do not have ', name, ' permissions.')
			FROM Shop_Permission
            WHERE id_permission = v_id_permission_Customer_Sales_order
			;
        END IF;
        */
        SET v_ids_product_no_permission := (
			SELECT GROUP_CONCAT(PT.id_product SEPARATOR ',') 
            FROM Shop_Calc_User_Temp PT 
            WHERE 
				PT.can_edit = 0
				AND NOT ISNULL(PT.id_product)
        );
        IF NOT ISNULL(v_ids_product_no_permission) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES (
				a_guid, 
				v_id_error_type_no_permission, 
                v_code_error_type_no_permission,
                CONCAT('You do not have permission to edit the following product IDs: ', v_ids_product_no_permission)
			)
			;
        END IF;
        
        DELETE FROM Shop_Calc_User_Temp
        WHERE GUID = a_guid;
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
				CONCAT(
					'Save ',
					CASE WHEN v_is_new_Customer_Sales_order = 1 THEN 'new ' ELSE '' END,
					'Customer Sales Order - ', 
					a_comment
				),
				a_id_user,
				CURRENT_TIME()
			);
			
			SET v_id_change_set := (SELECT id_change_set FROM Shop_Sales_And_Purchasing_Change_Set ORDER BY id_change_set DESC LIMIT 1);
			
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
					a_id_customer,
					SUM(t_CSOPL.price_total_local),
                    a_id_currency_price,
                    a_id_user,
                    v_id_change_set,
                    a_active
				FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL
				;
                -- SET v_id_order_new 
                SET a_id_order := (SELECT id_order FROM Shop_Customer_Sales_Order ORDER BY id_order DESC LIMIT 1);
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
					a_id_order, -- v_id_order_new,
					id_permutation,
					price_total_local,
					id_currency_price,
					quantity_ordered,
					id_unit_quantity,
					quantity_delivered,
					latency_delivery_days,
					display_order,
                    active,
                    a_id_user,
                    v_id_change_set
				FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL
				;
			ELSE
				UPDATE Shop_Customer_Sales_Order CSO
				INNER JOIN tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL ON CSO.id_order = t_CSOPL.id_order
                SET
					CSO.id_customer = a_id_customer,
					CSO.price_total_local = SUM(t_CSOPL.price_total_local),
                    CSO.id_currency = a_id_currency_price,
                    CSO.id_change_set = v_id_change_set,
                    CSO.active = a_active
				WHERE SPO.id_order = a_id_order
				;
                IF EXISTS (SELECT * FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL INNER JOIN Shop_Customer_Sales_Order_Product_Link CSOPL ON t_CSOPL.id_link = CSOPL.id_link) THEN
					UPDATE Shop_Customer_Sales_Order_Product_Link CSOPL
					INNER JOIN tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL
						ON CSOPL.id_link = t_CSOPL.id_link
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
                        a_id_user,
						v_id_change_set
					FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL
                    WHERE t_CSOPL.id_link < 0
					;
                END IF;
			END IF;
		
		IF EXISTS (SELECT * FROM tmp_Msg_Error) THEN
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
    END IF;
    
    -- Returns
    # SET v_now = NOW();
    
    # Supplier Purchase Orders
    SELECT *
    FROM Shop_Customer_Sales_Order
    WHERE id_order = a_id_order
    ;
    
    # Supplier Purchase Order Product Links
    SELECT *
    FROM Shop_Customer_Sales_Order_Product_Link
    WHERE id_order = a_id_order
    ;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
	;
    
    # DROP TABLE tmp_Shop_Customer_Sales_Order;
    DROP TABLE tmp_Shop_Customer_Sales_Order_Product_Link;
    DROP TABLE tmp_Msg_Error;
END //
DELIMITER ;;


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
		'NIPS', # guid
		-1, # id_link,
		-1, # id_order,
		1, # id_permutation,
		100, # price_total_local,
		1, # id_currency_price,
		1, # quantity_ordered,
		1, # id_unit_quantity,
		1, # quantity_delivered,
		14, # latency_delivery_days ,
		1, # display_order
        1 # active
    )
;

SELECT * FROM Shop_Customer_Sales_Order_Product_Link_Temp;

CALL p_shop_save_customer_sales_order (
	'NIPS', # a_guid
    'auth0|6582b95c895d09a70ba10fef', # a_id_user
    'Initial customer', # a_comment
    -1, # a_id_order
    4, # a_id_customer
    1, # a_id_currency_price
    1 # a_active
);

SELECT * FROM Shop_Customer_Sales_Order_Product_Link_Temp;

DELETE FROM Shop_Customer_Sales_Order_Product_Link_Audit;
DELETE FROM Shop_Customer_Sales_Order_Product_Link;
DELETE FROM Shop_Customer_Sales_Order_Product_Link_Temp;
DELETE FROM Shop_Customer_Sales_Order_Audit;
DELETE FROM Shop_Customer_Sales_Order;


*/





-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_customer_sales_order;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_customer_sales_order (
	IN a_id_user INT,
    IN a_get_all_customer BIT,
	IN a_get_inactive_customer BIT,
	IN a_get_first_customer_only BIT,
	IN a_ids_customer VARCHAR(4000),
    IN a_get_all_order BIT,
	IN a_get_inactive_order BIT,
	IN a_get_first_order_only BIT,
	IN a_ids_order VARCHAR(4000),
	IN a_get_inactive_category BIT,
	IN a_ids_category VARCHAR(4000),
	IN a_get_inactive_product BIT,
	IN a_ids_product VARCHAR(4000),
	IN a_get_inactive_permutation BIT,
	IN a_ids_permutation VARCHAR(4000),
    IN a_date_from DATETIME,
    IN a_date_to DATETIME
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_customer BIT;
    DECLARE v_has_filter_order BIT;
    DECLARE v_has_filter_category BIT;
    DECLARE v_has_filter_product BIT;
    DECLARE v_has_filter_permutation BIT;
    DECLARE v_has_filter_date_from BIT;
    DECLARE v_has_filter_date_to BIT;
    DECLARE v_guid BINARY(36);
    # DECLARE v_id_user VARCHAR(100);
    # DECLARE v_ids_permutation_unavailable VARCHAR(4000);
    DECLARE v_ids_permission_customer_purchase_order VARCHAR(4000);
    DECLARE v_ids_product_permission VARCHAR(4000);
    # DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    -- DECLARE v_now DATETIME;
    -- DECLARE v_id_minimum INT;
    DECLARE v_code_error_data VARCHAR(50);
    DECLARE v_id_type_error_data INT;
    
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    -- SET v_ids_permission_customer_purchase_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'Shop_Customer_Sales_ORDER' LIMIT 1);
    SET v_code_error_data = 'BAD_DATA';
    SET v_id_type_error_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data);
    
	-- Argument validation + default values
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_get_inactive_customer IS NULL THEN
		SET a_get_inactive_customer = 0;
    END IF;
	IF a_get_first_customer_only IS NULL THEN
		SET a_get_first_customer_only = 0;
    END IF;
	IF a_ids_customer IS NULL THEN
		SET a_ids_customer = '';
	ELSE
		SET a_ids_customer = TRIM(REPLACE(a_ids_customer, '|', ','));
    END IF;
    
    SET v_has_filter_customer = CASE WHEN a_ids_customer = '' THEN 0 ELSE 1 END;
    
	IF a_get_all_customer IS NULL THEN
		SET a_get_all_customer = NOT v_has_filter_customer;
    END IF;
	IF a_get_inactive_order IS NULL THEN
		SET a_get_inactive_order = 0;
    END IF;
    IF a_get_first_order_only IS NULL THEN
		SET a_get_first_order_only = 0;
    END IF;
	IF a_ids_order IS NULL THEN
		SET a_ids_order = '';
	ELSE
		SET a_ids_order = TRIM(REPLACE(a_ids_order, '|', ','));
    END IF;
    
    SET v_has_filter_order = CASE WHEN a_ids_order = '' THEN 0 ELSE 1 END;
    
	IF a_get_all_order IS NULL THEN
		SET a_get_all_order = NOT v_has_filter_customer;
    END IF;
	IF a_get_inactive_category IS NULL THEN
		SET a_get_inactive_category = 0;
    END IF;
	IF a_ids_category IS NULL THEN
		SET a_ids_category = '';
	ELSE
		SET a_ids_category = TRIM(REPLACE(a_ids_category, '|', ','));
    END IF;
	IF a_get_inactive_product IS NULL THEN
		SET a_get_inactive_product = 0;
    END IF;
	IF a_ids_product IS NULL THEN
		SET a_ids_product = '';
	ELSE
		SET a_ids_product = TRIM(REPLACE(a_ids_product, '|', ','));
    END IF;
	IF a_get_inactive_permutation IS NULL THEN
		SET a_get_inactive_permutation = 0;
    END IF;
	IF a_ids_permutation IS NULL THEN
		SET a_ids_permutation = '';
	ELSE
		SET a_ids_permutation = TRIM(REPLACE(a_ids_permutation, '|', ','));
    END IF;
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Customer_Sales_Order_Product_Link;
    DROP TABLE IF EXISTS tmp_Shop_Customer_Sales_Order;
    DROP TABLE IF EXISTS tmp_Shop_Customer;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    
    CREATE TABLE tmp_Shop_Customer (
		id_customer INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Customer_id_customer
			FOREIGN KEY (id_customer)
			REFERENCES Shop_Customer(id_customer),
        active BIT NOT NULL,
        rank_customer INT NULL,
        can_view BIT, 
        can_edit BIT, 
        can_admin BIT
    );
    
    CREATE TABLE tmp_Shop_Customer_Sales_Order (
		id_order INT NOT NULL PRIMARY KEY,
        /*
		id_customer INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Customer_Sales_Order_id_customer
			FOREIGN KEY (id_customer) 
			REFERENCES Shop_Customer(id_customer),
		price_total_local FLOAT NOT NULL,
		id_currency_price INT NOT NULL,
        */
        active BIT NOT NULL,
        rank_order INT NOT NULL
    );
    
    /*
    CREATE TABLE tmp_Shop_Customer_Sales_Order_Product_Link (
		id_link INT NOT NULL PRIMARY KEY,
		id_order INT NOT NULL,
		CONSTRAINT FK_tmp_customer_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_Customer_Sales_Order(id_order),
		id_permutation INT NOT NULL,
		CONSTRAINT FK_tmp_customer_Purchase_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		price_total_local FLOAT NOT NULL,
		id_currency_price INT NOT NULL,
		quantity_ordered FLOAT NOT NULL,
		id_unit_quantity INT NOT NULL,
		CONSTRAINT FK_tmp_customer_Purchase_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_received FLOAT NULL,
		latency_delivery_days INT NOT NULL,
		display_order INT NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Product (
		id_category INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Product_Category(id_category),
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
        -- name VARCHAR(255) NOT NULL,
        -- description VARCHAR(4000) NOT NULL,
		/*
        price_GBP_full FLOAT NOT NULL,
		price_GBP_min FLOAT NOT NULL,
		*/
        /*
        latency_manufacture_days INT NOT NULL,
		quantity_min FLOAT NOT NULL,
		quantity_max FLOAT NOT NULL,
		quantity_step FLOAT NOT NULL,
		quantity_stock FLOAT NOT NULL,
		is_subscription BIT NOT NULL,
		id_unit_measurement_interval_recurrence INT,
		CONSTRAINT FK_tmp_Shop_Product_id_unit_measurement_interval_recurrence
			FOREIGN KEY (id_unit_measurement_interval_recurrence)
			REFERENCES Shop_Interval_Recurrence(id_interval),
		count_interval_recurrence INT,
        id_stripe_product VARCHAR(100),
        product_has_variations INT NOT NULL,
        */
        can_view BIT, 
        can_edit BIT, 
        can_admin BIT
    );
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Parse filters
    SET v_has_filter_category = CASE WHEN a_ids_category = '' THEN 0 ELSE 1 END;
    SET v_has_filter_product = CASE WHEN a_ids_product = '' THEN 0 ELSE 1 END;
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_date_from = CASE WHEN ISNULL(a_date_from) THEN 0 ELSE 1 END;
    SET v_has_filter_date_to = CASE WHEN ISNULL(a_date_to) THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
    IF v_has_filter_customer = 1 OR a_get_all_customer = 1 THEN
		CALL p_split(a_guid, a_ids_customer, ',');
        
		IF EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Customer S ON TS.substring = S.id_customer WHERE ISNULL(S.id_customer)) THEN 
			INSERT INTO tmp_Msg_Error (
				guid,
                id_type,
				code,
				msg
			)
			SELECT
				v_guid,
                v_id_type_error_data,
				v_code_error_data, 
				CONCAT('Invalid customer IDs: ', IFNULL(GROUP_CONCAT(TS.substring SEPARATOR ', '), 'NULL'))
			FROM Split_Temp TS 
            LEFT JOIN Shop_Customer C ON TS.substring = C.id_customer 
            WHERE ISNULL(C.id_customer)
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
            LEFT JOIN Split_Temp S_T ON C.id_customer = S_T.substring
            WHERE
				(
					a_get_all_customer = 1
                    OR NOT ISNULL(S_T.substring)
                )
				AND (
					a_get_inactive_customer
                    OR C.active = 1
                )
			;
        END IF;
        
        DROP TABLE Split_Temp;
		
		IF a_get_first_customer_only THEN
			DELETE t_C
			FROM tmp_Shop_Customer t_C
			WHERE t_C.rank_customer > (
				SELECT MIN(t_C.rank_customer)
				FROM tmp_Shop_Customer t_C
			)
			;
		END IF;
    END IF;
    
    IF v_has_filter_category = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
			CALL p_split(a_guid, a_ids_category, ',');
			
			IF EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Product_Category C ON TS.substring = C.id_category WHERE ISNULL(C.id_category)) THEN 
				INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					v_guid,
					v_id_type_error_data,
					v_code_error_data, 
					CONCAT('Invalid category IDs: ', IFNULL(GROUP_CONCAT(TS.substring SEPARATOR ', ') ,'NULL')) 
				FROM Split_Temp TS 
				LEFT JOIN Shop_Product_Category C ON TS.substring = C.id_category 
				WHERE ISNULL(C.id_category)
				;
			END IF;
			
			DROP TABLE Temp_Split;
		END IF;
	END IF;
    
    IF v_has_filter_product = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
			CALL p_split(a_guid, a_ids_product, ',');
			
			IF EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Product ON TS.substring = P.id_product WHERE ISNULL(P.id_product)) THEN 
				INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					v_guid,
					v_id_type_error_data,
					v_code_error_data, 
					CONCAT('Invalid product IDs: ', IFNULL(GROUP_CONCAT(TS.substring SEPARATOR ', ') ,'NULL'))
				FROM Split_Temp TS
                LEFT JOIN Shop_Product ON TS.substring = P.id_product 
                WHERE ISNULL(P.id_product)
				;
			END IF;
			
			DROP TABLE Temp_Split;
		END IF;
	END IF;
    
    IF v_has_filter_permutation = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
			CALL p_split(a_guid, a_ids_permutation, ',');
			
			IF EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Product_Permutation PP ON TS.substring = PP.id_permutation WHERE ISNULL(PP.id_permutation)) THEN 
				INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					v_guid,
					v_id_type_error_data,
					v_code_error_data, 
					CONCAT('Invalid permutation IDs: ', IFNULL(GROUP_CONCAT(TS.substring SEPARATOR ', ') ,'NULL')) 
				FROM Split_Temp TS 
                LEFT JOIN Shop_Product_Permutation PP ON TS.substring = PP.id_permutation 
                WHERE ISNULL(PP.id_permutation)
				;
			END IF;
			
			DROP TABLE Temp_Split;
		END IF;
	END IF;
    
    IF v_has_filter_category = 1 OR v_has_filter_product = 1 OR v_has_filter_permutation = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
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
				/ *
				price_GBP_VAT_incl,
				price_GBP_VAT_excl,
				price_GBP_min,
				*
				latency_manufacture_days,
				quantity_min,
				quantity_max,
				quantity_step,
				quantity_stock,
				is_subscription,
				id_unit_measurement_interval_recurrence,
				count_interval_recurrence,
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
				-- RANK() OVER (ORDER BY C.display_order, P.display_order, PP.display_order) AS rank_permutation, #PARTITION BY P.id_category # _in_category
				/*
				P.name,
				PP.description,
				/ *
				PP.price_GBP_VAT_incl,
				PP.price_GBP_VAT_excl,
				PP.price_GBP_min,
				*
				PP.latency_manufacture_days,
				PP.quantity_min,
				PP.quantity_max,
				PP.quantity_step,
				PP.quantity_stock,
				PP.is_subscription,
				PP.id_unit_measurement_interval_recurrence,
				PP.count_interval_recurrence,
				PP.id_stripe_product,
				P.has_variations
				*/
			FROM Shop_Product P
			INNER JOIN Shop_Product_Permutation PP
				ON P.id_product = PP.id_product
			INNER JOIN Shop_Product_Category C
				ON P.id_category = C.id_category
			WHERE
				# permutations
				(
					(
						NOT v_has_filter_permutation 
						OR FIND_IN_SET(PP.id_permutation, a_ids_permutation) > 0
					)
					AND (
						a_get_inactive_permutation 
						OR PP.active = 1
					)
				)
				# categories
				AND (
					(
						NOT v_has_filter_category 
						OR FIND_IN_SET(P.id_category, a_ids_category) > 0
					)
					AND (
						a_get_inactive_category 
						OR C.active = 1
					)
				) 
				# products
				AND (
					(
						NOT v_has_filter_product 
						OR FIND_IN_SET(P.id_product, a_ids_product) > 0
					)
                    AND (
						a_get_inactive_product 
						OR P.active = 1
					)
				)
			;
        END IF;
    END IF;
    
    -- Get orders
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		CALL p_split(a_guid, a_ids_order, ',');
        
		IF v_has_filter_order AND EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Customer_Sales_Order CSO ON TS.substring = CSO.id_order WHERE ISNULL(CSO.id_order)) THEN 
			INSERT INTO tmp_Msg_Error (
				guid,
                id_type,
				code,
				msg
			)
			SELECT
				v_guid,
                v_id_type_error_data,
				v_code_error_data, 
				CONCAT('Invalid order IDs: ', IFNULL(GROUP_CONCAT(TS.substring SEPARATOR ', '), 'NULL'))
			FROM Split_Temp TS 
            LEFT JOIN Shop_Customer_Sales_Order CSO ON TS.substring = CSO.id_order 
            WHERE ISNULL(CSO.id_order)
			;
		END IF;
		
        IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
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
			LEFT JOIN Split_Temp S_T ON CSO.id_order = S_T.substring
            INNER JOIN Shop_Customer_Sales_Order_Product_Link CSOPL ON CSO.id_order = CSOPL.id_order
            INNER JOIN Shop_Customer S ON CSO.id_customer = S.id_customer
            INNER JOIN Shop_Product_Permutation PP ON CSOPL.id_permutation = PP.id_permutation
            INNER JOIN Shop_Product P ON PP.id_product = P.id_product
            INNER JOIN Shop_Product_Category C ON P.id_category = C.id_category
            LEFT JOIN tmp_Shop_Product t_P ON CSOPL.id_permutation = t_P.id_permutation
            LEFT JOIN tmp_Shop_Customer t_S ON CSO.id_customer = t_S.id_customer
			WHERE
				# customer
                /*
				(
					a_get_all_customer = 1
					OR NOT ISNULL(t_S.id_customer) -- CSO.id_customer IN (SELECT DISTINCT id_customer FROM tmp_Shop_Customer)
				)
                */
                NOT ISNULL(t_S.id_customer)
				# order
				AND (
					(
						a_get_all_order = 1
						OR (
							# ID
							-- FIND_IN_SET(CSO.id_order, a_ids_order) > 0
                            NOT ISNULL(S_T.substring)
                            # date
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
                    # active
					AND (
						a_get_inactive_order
						OR CSO.active = 1
					)
				)
				# permutations
				AND (
					(
						v_has_filter_category = 0 
                        AND v_has_filter_product = 0 
                        AND v_has_filter_permutation = 0
					)
					OR NOT ISNULL(t_P.id_permutation) -- CSO.id_permutation IN (SELECT DISTINCT id_permutation FROM tmp_Shop_Product)
				)
			;
		END IF;
        
        DROP TABLE Split_Temp;
		
		IF a_get_first_order_only THEN
			DELETE t_CSO
			FROM tmp_Shop_Customer_Sales_Order t_CSO
			WHERE t_CSO.rank_order > (
				SELECT MIN(t_CSO.rank_order)
				FROM tmp_Shop_Customer_Sales_Order t_CSO
			)
			;
		END IF;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
        # SET v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER());
        SET v_ids_permission_customer_purchase_order := (SELECT GROUP_CONCAT(id_permission SEPARATOR ',') FROM Shop_Permission WHERE code IN ('STORE_customer', 'STORE_customer_PURCHASE_ORDER'));
        -- SET v_ids_permutation_permission := (SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
        SET v_ids_product_permission := (SELECT GROUP_CONCAT(P.id_product SEPARATOR ',') FROM (SELECT DISTINCT id_product FROM tmp_Shop_Product WHERE NOT ISNULL(id_product)) P);
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
        -- select * from Shop_Calc_User_Temp;
        
        CALL p_shop_calc_user(v_guid, a_id_user, FALSE, v_ids_permission_customer_purchase_order, v_id_access_level_view, v_ids_product_permission);
        
        -- select * from Shop_Calc_User_Temp;
        
        IF NOT EXISTS (SELECT can_view FROM Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
                id_type,
				code,
				msg
			)
			SELECT
				v_guid,
                v_id_type_error_data,
				v_code_error_data, 
				CONCAT('You do not have view permissions for ', GROUP_CONCAT(name SEPARATOR ', ')) 
			FROM Shop_Permission 
            WHERE id_permission = v_ids_permission_customer_purchase_order
			;
        END IF;
        
        
        UPDATE tmp_Shop_Product t_P
        INNER JOIN Shop_Calc_User_Temp UE_T
			ON t_P.id_product = UE_T.id_product -- t_P.id_permutation = UE_T.id_permutation
			AND UE_T.GUID = v_guid
        SET t_P.can_view = UE_T.can_view,
			t_P.can_edit = UE_T.can_edit,
            t_P.can_admin = UE_T.can_admin
		;
        
        # CALL p_shop_clear_calc_user(v_guid);
        # DROP TABLE IF EXISTS Shop_Calc_User_Temp;
        DELETE FROM Shop_Calc_User_Temp
        WHERE GUID = v_guid
        ;
	END IF;
    
    
    -- select * from tmp_Shop_Customer;
    -- select * from tmp_Shop_Product;
    
    -- Returns
    -- SET v_now := NOW();
    
    # customers
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
    
    # Customer Sales Order
    SELECT # *
		t_CSO.id_order,
		CSO.id_customer,
		CSO.price_total_local,
		CSO.id_currency_price,
        t_CSO.active
    FROM Shop_Customer_Sales_Order CSO
    INNER JOIN tmp_Shop_Customer_Sales_Order t_CSO ON CSO.id_order = t_CSO.id_order
    ;
    
    # Customer Sales Order Product Link
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
    
    # Errors
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
    DROP TABLE IF EXISTS tmp_Shop_Customer_Sales_Order_Product_Link;
    DROP TABLE IF EXISTS tmp_Shop_Customer_Sales_Order;
    DROP TABLE IF EXISTS tmp_Shop_Customer;
    DROP TABLE IF EXISTS tmp_Shop_Product;
        
	DELETE FROM Shop_Calc_User_Temp
	WHERE GUID = v_guid
	;
END //
DELIMITER ;;


/*

CALL p_shop_get_many_customer_sales_order (
	'', # a_id_user
    1, # a_get_all_customer
	0, # a_get_inactive_customer
	0, # a_get_first_customer_only
    '', # a_ids_customer
	1, # a_get_all_order
	0, # a_get_inactive_order
    0, # a_get_first_order_only
    '', # a_ids_order
	0, # a_get_inactive_category
	'', # a_ids_category
    0, # a_get_inactive_product
	'', # a_ids_product
    0, # a_get_inactive_permutation
    '', # a_ids_permutation
    NULL, # a_date_from
	NULL # a_date_to
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
	('Malt Kiln Farm Shop', NULL, NULL, 1, '01788 832640', NULL, 'farmshop@maltkilnfarmshop.co.uk', 'https://www.maltkilnfarmshop.co.uk/', 1)
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


# Product Change Sets
SELECT * FROM Shop_Product_Change_Set;

# User Change Sets
SELECT * FROM Shop_User_Change_Set;

# User Change Sets
SELECT * FROM Shop_Sales_And_Purchasing_Change_Set;

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

# Image Types
SELECT * FROM Shop_Image_Type;
SELECT * FROM Shop_Image_Type_Audit;


# Regions
SELECT * FROM Shop_Region;
SELECT * FROM Shop_Region_Audit;

# Region branches
SELECT * FROM Shop_Region_Branch;
SELECT * FROM Shop_Region_Branch_Audit;

# Plants
SELECT * FROM Shop_Plant;
SELECT * FROM Shop_Plant_Audit;

# Storage Locations
SELECT * FROM Shop_Storage_Location;
SELECT * FROM Shop_Storage_Location_Audit;

# Storage Location branches
SELECT * FROM Shop_Storage_Location_Branch;
SELECT * FROM Shop_Storage_Location_Branch_Audit;

# Currencies
SELECT * FROM Shop_Currency;
SELECT * FROM Shop_Currency_Audit;

# Taxes and Surcharges
SELECT * FROM Shop_Tax_Or_Surcharge;
SELECT * FROM Shop_Tax_Or_Surcharge_Audit;

# Unit of Measurement
SELECT * FROM Shop_Unit_Measurement;
SELECT * FROM Shop_Unit_Measurement_Audit;

# Unit of Measurement Conversion
SELECT * FROM Shop_Unit_Measurement_Conversion;
SELECT * FROM Shop_Unit_Measurement_Conversion_Audit;

/*
# Recurrence Interval
SELECT * FROM Shop_Interval_Recurrence;
SELECT * FROM Shop_Interval_Recurrence_Audit;
*/


# Categories
SELECT * FROM Shop_Product_Category;
SELECT * FROM Shop_Product_Category_Audit;

# Products
SELECT * FROM Shop_Product;
SELECT * FROM Shop_Product_Audit;

# Permutations
SELECT * FROM Shop_Product_Permutation;
SELECT * FROM Shop_Product_Permutation_Audit;

# Variation Types
SELECT * FROM Shop_Variation_Type;
SELECT * FROM Shop_Variation_Type_Audit;

# Variations
SELECT * FROM Shop_Variation;
SELECT * FROM Shop_Variation_Audit;

# Permutation Variation Links
SELECT * FROM Shop_Product_Permutation_Variation_Link;
SELECT * FROM Shop_Product_Permutation_Variation_Link_Audit;

# Stock Items
SELECT * FROM Shop_Stock_Item;
SELECT * FROM Shop_Stock_Item_Audit;

# Product Currency Links
SELECT * FROM Shop_Product_Price;
SELECT * FROM Shop_Product_Price;

# Images
SELECT * FROM Shop_Product_Image;
SELECT * FROM Shop_Product_Image_Audit;

# Delivery Option Types
SELECT * FROM Shop_Delivery_Option;
SELECT * FROM Shop_Delivery_Option_Audit;

# Delivery Options
SELECT * FROM Shop_Product_Permutation_Delivery_Option_Link;
SELECT * FROM Shop_Product_Permutation_Delivery_Option_Link_Audit;

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

/*
# Orders
SELECT * FROM Shop_User_Order;
SELECT * FROM Shop_User_Order_Audit;

# Order Products
SELECT * FROM Shop_User_Order_Product_Link;
SELECT * FROM Shop_User_Order_Product_Link_Audit;
*/

# Supplier
SELECT * FROM Shop_Supplier;
SELECT * FROM Shop_Supplier_Audit;

# Supplier Purchase Order
SELECT * FROM Shop_Supplier_Purchase_Order;
SELECT * FROM Shop_Supplier_Purchase_Order_Audit;

# Supplier Purchase Order Product Link
SELECT * FROM Shop_Supplier_Purchase_Order_Product_Link;
SELECT * FROM Shop_Supplier_Purchase_Order_Product_Link_Audit;

# Manufacturing Purchase Order
SELECT * FROM Shop_Manufacturing_Purchase_Order;
SELECT * FROM Shop_Manufacturing_Purchase_Order_Audit;

# Manufacturing Purchase Order Product Link
SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link;
SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Audit;

# Customers
SELECT * FROM Shop_Customer;
SELECT * FROM Shop_Customer_Audit;

# Customer Sales Order
SELECT * FROM Shop_Customer_Sales_Order;
SELECT * FROM Shop_Customer_Sales_Order_Audit;

# Customer Sales Order Product Link
SELECT * FROM Shop_Customer_Sales_Order_Product_Link;
SELECT * FROM Shop_Customer_Sales_Order_Product_Link_Audit;



/*

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME LIKE '%SHOP%'
	OR TABLE_NAME LIKE '%FILE_TYPE%';


SELECT FOUND_ROWS();



SELECT
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE,
    TABLE_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM
    INFORMATION_SCHEMA.TABLES
WHERE
    TABLE_SCHEMA = 'PARTS'
    -- AND TABLE_NAME = 'your_table_name'
;

*/
