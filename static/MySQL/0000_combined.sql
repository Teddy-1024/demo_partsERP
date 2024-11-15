-- File: 0001_destroy.sql

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
DROP TABLE IF EXISTS tmp_Product;
DROP TABLE IF EXISTS tmp_Product_Permutation;
DROP TABLE IF EXISTS tmp_Permutation_Variation_Link;
DROP TABLE IF EXISTS tmp_Permutation;
DROP TABLE IF EXISTS tmp_Shop_Product_p_shop_calc_user;
DROP TABLE IF EXISTS tmp_Shop_Product_p_Shop_Calc_User;
DROP TABLE IF EXISTS tmp_Shop_Image;
DROP TABLE IF EXISTS tmp_Image;
DROP TABLE IF EXISTS tmp_Product_Image;
DROP TABLE IF EXISTS tmp_Shop_Variation;
DROP TABLE IF EXISTS tmp_Variation;
DROP TABLE IF EXISTS tmp_Variation_Type;
DROP TABLE IF EXISTS tmp_Shop_Discount;
DROP TABLE IF EXISTS tmp_Discount;
DROP TABLE IF EXISTS tmp_Shop_Category;
DROP TABLE IF EXISTS tmp_Category;
DROP TABLE IF EXISTS tmp_Shop_Product_Category;
DROP TABLE IF EXISTS tmp_Product_Category;
DROP TABLE IF EXISTS tmp_Shop_Product_Currency_Region_Link;
DROP TABLE IF EXISTS tmp_Shop_Product_Currency_Link;
DROP TABLE IF EXISTS tmp_User_Role_Link;
DROP TABLE IF EXISTS tmp_Shop_Basket;
DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Supplier_Purchase_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order;
DROP TABLE IF EXISTS tmp_Supplier_Purchase_Order;
DROP TABLE IF EXISTS tmp_Shop_Supplier;
DROP TABLE IF EXISTS tmp_Supplier;
DROP TABLE IF EXISTS tmp_Supplier_Address;
DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Manufacturing_Purchase_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order;
DROP TABLE IF EXISTS tmp_Manufacturing_Purchase_Order;
DROP TABLE IF EXISTS tmp_Shop_Customer;
DROP TABLE IF EXISTS tmp_Shop_Customer_Sale_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Shop_Customer_Sale_Order;
DROP TABLE IF EXISTS tmp_Get_Variation_From_Csv_Variations;


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

DROP TABLE IF EXISTS Shop_Manufacturing_Purchase_Order_Temp;
DROP TABLE IF EXISTS Shop_Manufacturing_Purchase_Order_Audit;
DROP TABLE IF EXISTS Shop_Manufacturing_Purchase_Order;

DROP TABLE IF EXISTS Shop_Supplier_Purchase_Order_Product_Link_Temp;
DROP TABLE IF EXISTS Shop_Supplier_Purchase_Order_Product_Link_Audit;
DROP TABLE IF EXISTS Shop_Supplier_Purchase_Order_Product_Link;

DROP TABLE IF EXISTS Shop_Supplier_Purchase_Order_Temp;
DROP TABLE IF EXISTS Shop_Supplier_Purchase_Order_Audit;
DROP TABLE IF EXISTS Shop_Supplier_Purchase_Order;

DROP TABLE IF EXISTS Shop_Supplier_Address_Temp;
DROP TABLE IF EXISTS Shop_Supplier_Address_Audit;
DROP TABLE IF EXISTS Shop_Supplier_Address;

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
DROP TABLE IF EXISTS Shop_Product_Permutation_Variation_Link_Temp;
DROP TABLE IF EXISTS Shop_Product_Permutation_Variation_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Permutation_Variation_Link;

DROP TABLE IF EXISTS Shop_Variation_Temp;
DROP TABLE IF EXISTS Shop_Variation_Audit;
DROP TABLE IF EXISTS Shop_Variation;
DROP TABLE IF EXISTS Shop_Product_Variation_Type_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Variation_Type_Link;
DROP TABLE IF EXISTS Shop_Product_Variation_Temp;
DROP TABLE IF EXISTS Shop_Product_Variation;

DROP TABLE IF EXISTS Shop_Variation_Type_Temp;
DROP TABLE IF EXISTS Shop_Variation_Type_Audit;
DROP TABLE IF EXISTS Shop_Variation_Type;
DROP TABLE IF EXISTS Shop_Product_Variation_Type_Temp;
DROP TABLE IF EXISTS Shop_Product_Variation_Type;

DROP TABLE IF EXISTS Shop_Product_Permutation_Temp;
DROP TABLE IF EXISTS Shop_Product_Permutation_Audit;
DROP TABLE IF EXISTS Shop_Product_Permutation;

DROP TABLE IF EXISTS Shop_Interval_Recurrence_Audit;
DROP TABLE IF EXISTS Shop_Interval_Recurrence;

DROP TABLE IF EXISTS Shop_Product_Audit;
DROP TABLE IF EXISTS Shop_Product;
DROP TABLE IF EXISTS Shop_Product_Temp;

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
DROP PROCEDURE IF EXISTS p_shop_save_category_test;
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
DROP PROCEDURE IF EXISTS p_shop_save_product_permutation_test;
DROP PROCEDURE IF EXISTS p_shop_save_product_variation;
DROP PROCEDURE IF EXISTS p_shop_save_product_variation_test;
DROP PROCEDURE IF EXISTS p_shop_get_many_product_variation;
DROP FUNCTION IF EXISTS fn_shop_get_id_product_permutation_from_variation_csv_list;
DROP FUNCTION IF EXISTS fn_shop_get_product_variations_from_id_csv_list;
DROP FUNCTION IF EXISTS fn_shop_get_product_permutation_variations_csv;
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
DROP PROCEDURE IF EXISTS p_shop_save_supplier_test;
DROP PROCEDURE IF EXISTS p_shop_get_many_supplier;
DROP PROCEDURE IF EXISTS p_shop_save_supplier_purchase_order;
DROP PROCEDURE IF EXISTS p_shop_save_supplier_purchase_order_test;
DROP PROCEDURE IF EXISTS p_shop_get_many_supplier_purchase_order;
DROP PROCEDURE IF EXISTS p_shop_save_manufacturing_purchase_order;
DROP PROCEDURE IF EXISTS p_shop_save_manufacturing_purchase_order_test;
DROP PROCEDURE IF EXISTS p_shop_get_many_manufacturing_purchase_order;
DROP PROCEDURE IF EXISTS p_shop_save_customer;
DROP PROCEDURE IF EXISTS p_shop_get_many_customer;
DROP PROCEDURE IF EXISTS p_shop_save_customer_sales_order;
DROP PROCEDURE IF EXISTS p_shop_get_many_customer_sales_order;


-- File: 1000_tbl_Shop_Product_Change_Set.sql

# Product Change Sets



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Change_Set';

CREATE TABLE Shop_Product_Change_Set (
	id_change_set INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	comment VARCHAR(500),
	updated_last_on DATETIME,
	updated_last_by VARCHAR(100)
);

-- File: 1000_tbl_Split_Temp.sql

# Split Staging
-- USE partsltd_prod;
-- DROP TABLE IF EXISTS Split_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Split_Temp';

CREATE TABLE Split_Temp (
	guid BINARY(36) NOT NULL
    , display_order INT NOT NULL
	, substring VARCHAR(4000) NOT NULL
);


-- File: 1001_tbl_Shop_User_Change_Set.sql

# User Change Sets



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Change_Set';

CREATE TABLE IF NOT EXISTS Shop_User_Change_Set (
	id_change_set INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    comment VARCHAR(500),
    updated_last_on DATETIME,
    updated_last_by VARCHAR(100)
);

-- File: 1001_tbl_Split_Key_Value_Pair_Csv_Temp.sql

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


-- File: 1002_tbl_Shop_Sales_And_Purchasing_Change_Set.sql

# Sales And Purchasing Change Sets



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Sales_And_Purchasing_Change_Set';

CREATE TABLE Shop_Sales_And_Purchasing_Change_Set (
	id_change_set INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	comment VARCHAR(500),
	updated_last_on DATETIME,
	updated_last_by VARCHAR(100)
);

-- File: 1003_tbl_Shop_Access_Level.sql

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




-- File: 1004_tbl_Shop_Access_Level_Audit.sql

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

-- File: 1005_tbl_Msg_Error_Type.sql

# Error Message Type



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Msg_Error_Type';

CREATE TABLE IF NOT EXISTS Shop_Msg_Error_Type (
	id_type INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50) NOT NULL,
	name VARCHAR(500) NOT NULL,
	description VARCHAR(1000)
);


-- File: 1010_tbl_File_Type.sql

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


-- File: 1011_tbl_File_Type_Audit.sql

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

-- File: 1012_tbl_Shop_General.sql

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

-- File: 1013_tbl_Shop_General_Audit.sql

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

-- File: 1014_tbl_Shop_Image_Type.sql

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


-- File: 1015_tbl_Shop_Image_Type_Audit.sql

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

-- File: 1100_tbl_Shop_Region.sql

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

-- File: 1101_tbl_Shop_Region_Audit.sql

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

-- File: 1102_tbl_Shop_Region_Temp.sql

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

-- File: 1103_tbl_Shop_Region_Branch.sql

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

-- File: 1104_tbl_Shop_Region_Branch_Audit.sql

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

-- File: 1105_tbl_Shop_Region_Branch_Temp.sql

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

-- File: 1106_tbl_Shop_Address.sql

# Addresses


SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Address';

CREATE TABLE Shop_Address (
    id_address INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    , id_region INT NOT NULL
    , CONSTRAINT FK_Shop_Address_id_region
		FOREIGN KEY (id_region)
        REFERENCES partsltd_prod.Shop_Region(id_region)
	/*
    , id_supplier INT NULL
    , CONSTRAINT FK_Shop_Address_id_supplier
		FOREIGN KEY (id_supplier)
        REFERENCES partsltd_prod.Shop_Supplier(id_supplier)
    */
    , postcode VARCHAR(20) NOT NULL
    , address_line_1 VARCHAR(256) NOT NULL
    , address_line_2 VARCHAR(256) NOT NULL
    , city VARCHAR(256) NOT NULL
    , county VARCHAR(256) NOT NULL
    , active BIT NOT NULL DEFAULT 1
    , created_on DATETIME
    , created_by INT
    , id_change_set INT
    , CONSTRAINT FK_Shop_Address_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES partsltd_prod.Shop_User_Change_Set(id_change_set)
);

-- File: 1106_tbl_Shop_Plant.sql

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


-- File: 1107_tbl_Shop_Address_Audit.sql

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

-- File: 1107_tbl_Shop_Plant_Audit.sql

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


-- File: 1108_tbl_Shop_Plant_Temp.sql

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


-- File: 1109_tbl_Shop_Storage_Location.sql

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


-- File: 1110_tbl_Shop_Storage_Location_Audit.sql

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


-- File: 1111_tbl_Shop_Storage_Location_Temp.sql

# Storage Location Temp



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Storage_Location_Temp';

CREATE TABLE IF NOT EXISTS Shop_Storage_Location (
	id_location INT NOT NULL PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(500) NOT NULL,
	active BIT NOT NULL DEFAULT 1
);


-- File: 1112_tbl_Shop_Storage_Location_Branch.sql

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

-- File: 1113_tbl_Shop_Storage_Location_Branch_Audit.sql

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


-- File: 1114_tbl_Shop_Storage_Location_Branch_Temp.sql

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

-- File: 1115_tbl_Shop_Currency.sql

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

-- File: 1116_tbl_Shop_Currency_Audit.sql

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

-- File: 1117_tbl_Shop_Currency_Temp.sql

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

-- File: 1118_tbl_Shop_Tax_Or_Surcharge.sql

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


-- File: 1119_tbl_Shop_Tax_Or_Surcharge_Audit.sql

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

-- File: 1120_tbl_Shop_Tax_Or_Surcharge_Temp.sql

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


-- File: 1121_tbl_Shop_Unit_Measurement.sql

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


-- File: 1122_tbl_Shop_Unit_Measurement_Audit.sql

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


-- File: 1124_tbl_Shop_Unit_Measurement_Conversion.sql

# Unit of Measurement Conversion



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Unit_Measurement_Conversion';

CREATE TABLE IF NOT EXISTS Shop_Unit_Measurement_Conversion (
    id_conversion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_unit_derived INT NOT NULL,
    id_unit_base INT NOT NULL,
    multiplier_unit_base FLOAT NOT NULL,
    increment_unit_base FLOAT NOT NULL,
    apply_multiplier_before_increment BIT NOT NULL DEFAULT 1,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Unit_Measurement_Conversion_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);


-- File: 1125_tbl_Shop_Unit_Measurement_Conversion_Audit.sql

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


-- File: 1200_tbl_Shop_Product_Category.sql

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


-- File: 1201_tbl_Shop_Product_Category_Audit.sql

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


-- File: 1202_tbl_Shop_Product_Category_Temp.sql

# Categories Temp

-- DROP TABLE Shop_Product_Category_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Category_Temp';

CREATE TABLE IF NOT EXISTS Shop_Product_Category_Temp (
	id_temp INT NOT NULL PRIMARY KEY AUTO_INCREMENT
	, id_category INT NOT NULL
	, code VARCHAR(50) NOT NULL
	, name VARCHAR(255) NOT NULL
	, description VARCHAR(4000) NULL
    , id_access_level_required INT NOT NULL DEFAULT 1
	, display_order INT NOT NULL
	, active BIT NULL
	, can_view BIT NULL
	, can_edit BIT NULL
	, can_admin BIT NULL
    , guid BINARY(36) NOT NULL
);


-- File: 1203_tbl_Shop_Product.sql

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


-- File: 1204_tbl_Shop_Product_Audit.sql

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

-- File: 1205_tbl_Shop_Product_Temp.sql

# Products Temp

-- DROP TABLE IF EXISTS Shop_Product_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Temp';

CREATE TABLE IF NOT EXISTS Shop_Product_Temp (
	id_temp INT NOT NULL PRIMARY KEY AUTO_INCREMENT
	, id_product INT NOT NULL
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


-- File: 1206_tbl_Shop_Product_Permutation.sql

# Product Permutation

-- DROP TABLE partsltd_prod.Shop_Product_Permutation;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation (
	id_permutation INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_permutation_temp INT NOT NULL,
	id_product INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Permutation_id_product
		FOREIGN KEY (id_product)
		REFERENCES Shop_Product(id_product)
		ON UPDATE RESTRICT,
	-- name VARCHAR(255) NOT NULL,
	description VARCHAR(4000) NOT NULL,
	cost_local_VAT_excl FLOAT NULL,
    cost_local_VAT_incl FLOAT NULL,
    id_currency_cost INT NOT NULL,
	profit_local_min FLOAT NULL,
    -- id_currency_profit_min INT NOT NULL,
	latency_manufacture INT NOT NULL,
	id_unit_measurement_quantity INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Permutation_id_unit_quantity
		FOREIGN KEY (id_unit_measurement_quantity)
		REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	count_unit_measurement_per_quantity_step FLOAT NOT NULL,
	quantity_min FLOAT NULL,
	quantity_max FLOAT NULL,
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
	-- display_order INT NOT NULL,
	created_on DATETIME,
	created_by INT,
	id_change_set INT,
	CONSTRAINT FK_Shop_Product_Permutation_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
);


-- File: 1207_tbl_Shop_Product_Permutation_Audit.sql

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


-- File: 1208_tbl_Shop_Product_Permutation_Temp.sql

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


-- File: 1209_tbl_Shop_Variation_Type.sql

# Variation Types



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Variation_Type';

CREATE TABLE IF NOT EXISTS Shop_Variation_Type (
	id_type INT NOT NULL AUTO_INCREMENT PRIMARY KEY
	, id_type_temp INT NULL
	, code VARCHAR(50)
	, name VARCHAR(255)
	, name_plural VARCHAR(256)
	, active BIT NOT NULL DEFAULT 1
	, display_order INT NOT NULL
	, created_on DATETIME
	, created_by INT
	, id_change_set INT
	, CONSTRAINT FK_Shop_Variation_Type_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

-- File: 1210_tbl_Shop_Variation_Type_Audit.sql

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


-- File: 1211_tbl_Shop_Variation_Type_Temp.sql

# Variation Types Temp

-- DROP TABLE partsltd_prod.Shop_Variation_Type_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Variation_Type_Temp';

CREATE TABLE IF NOT EXISTS Shop_Variation_Type_Temp (
	id_temp INT NOT NULL PRIMARY KEY AUTO_INCREMENT
	, id_type INT NOT NULL
	-- , id_type_temp INT NOT NULL
	, code VARCHAR(50)
	, name VARCHAR(255)
	, name_plural VARCHAR(256)
	, active BIT NULL
	, display_order INT NOT NULL
	, created_on DATETIME
	, created_by INT
    , guid BINARY(36) NOT NULL
);

-- File: 1212_tbl_Shop_Variation.sql

# Variations



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Variation';

CREATE TABLE Shop_Variation (
	id_variation INT NOT NULL AUTO_INCREMENT PRIMARY KEY
	, id_type INT NOT NULL
	, CONSTRAINT FK_Shop_Variation_id_type
		FOREIGN KEY (id_type) 
		REFERENCES partsltd_prod.Shop_Variation_Type(id_type)
		ON UPDATE RESTRICT
    , id_unit_measurement INT NULL
	, CONSTRAINT FK_Shop_Unit_Measurement_id_unit_measurement
		FOREIGN KEY (id_unit_measurement) 
		REFERENCES partsltd_prod.Shop_Unit_Measurement(id_unit_measurement)
    , count_unit_measurement INT NULL
	, code VARCHAR(50)
	, name VARCHAR(255)
	, active BIT NOT NULL DEFAULT 1
	, display_order INT NOT NULL
	, created_on DATETIME
	, created_by INT
	, id_change_set INT
	, CONSTRAINT FK_Shop_Variation_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES partsltd_prod.Shop_Product_Change_Set(id_change_set)
);


-- File: 1213_tbl_Shop_Variation_Audit.sql

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


-- File: 1214_tbl_Shop_Variation_Temp.sql

# Variations Temp

-- DROP TABLE partsltd_prod.Shop_Variation_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Variation_Temp';

CREATE TABLE Shop_Variation_Temp (
	id_temp INT NOT NULL PRIMARY KEY AUTO_INCREMENT
	, id_variation INT NOT NULL
	, id_type INT NOT NULL
    , id_unit_measurement INT NULL
    , count_unit_measurement INT NULL
	, code VARCHAR(50)
	, name VARCHAR(255)
	, active BIT
	, display_order INT NOT NULL
	, created_on DATETIME
	, created_by INT
	, guid BINARY(36)
);


-- File: 1215_tbl_Shop_Product_Permutation_Variation_Link.sql

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


-- File: 1216_tbl_Shop_Product_Permutation_Variation_Link_Audit.sql

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

-- File: 1217_tbl_Shop_Product_Permutation_Variation_Link_Temp.sql

# Product Permutation Variation Link

-- DROP TABLE IF EXISTS Shop_Product_Permutation_Variation_Link_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation_Variation_Link_Temp';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation_Variation_Link_Temp (
	id_temp INT NOT NULL AUTO_INCREMENT PRIMARY KEY
	, id_link INT NOT NULL
	, id_permutation INT NOT NULL
	, id_variation INT NOT NULL
	, active BIT NOT NULL
	, display_order INT NOT NULL
    , GUID BINARY(36) NOT NULL
);


-- File: 1218_tbl_Shop_Stock_Item.sql

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


-- File: 1219_tbl_Shop_Stock_Item_Audit.sql

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


-- File: 1220_tbl_Shop_Stock_Item_Temp.sql

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


-- File: 1221_tbl_Shop_Product_Price.sql

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

-- File: 1222_tbl_Shop_Product_Price_Audit.sql

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


-- File: 1223_tbl_Shop_Product_Price_Temp.sql

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

-- File: 1224_tbl_Shop_Product_Image.sql

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

-- File: 1225_tbl_Shop_Product_Image_Audit.sql

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

-- File: 1227_tbl_Shop_Delivery_Option.sql

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


-- File: 1228_tbl_Shop_Delivery_Option_Audit.sql

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

-- File: 1230_tbl_Shop_Product_Permutation_Delivery_Option_Link.sql

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

-- File: 1231_tbl_Shop_Product_Permutation_Delivery_Option_Link_Audit.sql

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

-- File: 1233_tbl_Shop_Discount.sql

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


-- File: 1234_tbl_Shop_Discount_Audit.sql

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

-- File: 1236_tbl_Shop_Discount_Region_Currency_Link.sql

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

-- File: 1237_tbl_Shop_Discount_Region_Currency_Link_Audit.sql

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

-- File: 1300_tbl_Shop_Permission_Group.sql

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

-- File: 1301_tbl_Shop_Permission_Group_Audit.sql

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

-- File: 1303_tbl_Shop_Permission.sql

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

-- File: 1304_tbl_Shop_Permission_Audit.sql

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

-- File: 1306_tbl_Shop_Role.sql

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

-- File: 1307_tbl_Shop_Role_Audit.sql

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

-- File: 1309_tbl_Shop_Role_Permission_Link.sql

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

-- File: 1310_tbl_Shop_Role_Permission_Link_Audit.sql

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

-- File: 1312_tbl_Shop_User.sql

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


-- File: 1313_tbl_Shop_User_Audit.sql

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

-- File: 1315_tbl_Shop_User_Role_Link.sql

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

-- File: 1316_tbl_Shop_User_Role_Link_Audit.sql

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


-- File: 1318_tbl_Shop_User_Address.sql

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

-- File: 1319_tbl_Shop_User_Address_Audit.sql

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

-- File: 1321_tbl_Shop_User_Basket.sql

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


-- File: 1322_tbl_Shop_User_Basket_Audit.sql

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


-- File: 1397_tbl_Shop_Order_Status.sql

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


-- File: 1398_tbl_Shop_Order_Status_Audit.sql

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

-- File: 1400_tbl_Shop_Supplier.sql

# Supplier

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier';

CREATE TABLE IF NOT EXISTS Shop_Supplier (
    id_supplier INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    , name_company VARCHAR(255) NOT NULL
    , name_contact VARCHAR(255) NULL
    , department_contact VARCHAR(255) NULL
    /*
    id_address INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_id_address
        FOREIGN KEY (id_address)
        REFERENCES Shop_Address(id_address),
    */
    , phone_number VARCHAR(50) NULL
    , fax VARCHAR(50) NULL
    , email VARCHAR(255) NOT NULL
    , website VARCHAR(255) NULL
    , id_currency INT NOT NULL
    , CONSTRAINT FK_Shop_Supplier_id_currency
        FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
    , active BIT NOT NULL DEFAULT 1
    , created_on DATETIME
    , created_by INT
    , id_change_set INT
    , CONSTRAINT FK_Shop_Supplier_id_change_set
        FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
	, id_supplier_temp INT NOT NULL
);


-- File: 1401_tbl_Shop_Supplier_Audit.sql

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


-- File: 1402_tbl_Shop_Supplier_Temp.sql

# Supplier Staging

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Temp';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Temp (
    id_temp INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_supplier INT NOT NULL,
    name_company VARCHAR(255) NOT NULL,
    name_contact VARCHAR(255) NULL,
    department_contact VARCHAR(255) NULL,
    -- id_address INT NOT NULL,
    phone_number VARCHAR(50) NULL,
    fax VARCHAR(50) NULL,
    email VARCHAR(255) NOT NULL,
    website VARCHAR(255) NULL,
    id_currency INT NOT NULL,
    active BIT NULL,
    GUID BINARY(36) NOT NULL
);


-- File: 1403_tbl_Shop_Supplier_Address.sql

# Supplier Addresses

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Address';

CREATE TABLE Shop_Supplier_Address (
    id_address INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    , id_supplier INT NOT NULL
    , CONSTRAINT FK_Shop_Supplier_Address_id_supplier
		FOREIGN KEY (id_supplier)
        REFERENCES partsltd_prod.Shop_Supplier(id_supplier)
        ON UPDATE RESTRICT
    , id_region INT NOT NULL
    , CONSTRAINT FK_Shop_Supplier_Address_id_region
		FOREIGN KEY (id_region)
        REFERENCES partsltd_prod.Shop_Region(id_region)
    , postcode VARCHAR(20) NOT NULL
    , address_line_1 VARCHAR(256) NOT NULL
    , address_line_2 VARCHAR(256) NOT NULL
    , city VARCHAR(256) NOT NULL
    , county VARCHAR(256) NOT NULL
    , active BIT NOT NULL DEFAULT 1
    , created_on DATETIME
    , created_by INT
    , id_change_set INT
    , CONSTRAINT FK_Shop_Supplier_Address_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES partsltd_prod.Shop_User_Change_Set(id_change_set)
);

-- File: 1404_tbl_Shop_Supplier_Address_Audit.sql

# Supplier Address Audits

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Address_Audit';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Address_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_address INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Address_Audit_id_address
		FOREIGN KEY (id_address)
        REFERENCES Shop_Supplier_Address(id_address)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Address_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);

-- File: 1405_tbl_Shop_Supplier_Address_Temp.sql

# Supplier Addresses Staging

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Address_Temp';

CREATE TABLE Shop_Supplier_Address_Temp (
    id_address INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    , id_supplier INT NOT NULL
    , id_region INT NOT NULL
    , postcode VARCHAR(20) NOT NULL
    , address_line_1 VARCHAR(256) NOT NULL
    , address_line_2 VARCHAR(256) NOT NULL
    , city VARCHAR(256) NOT NULL
    , county VARCHAR(256) NOT NULL
    , active BIT NOT NULL DEFAULT 1
    , GUID BINARY(36) NOT NULL
);

-- File: 1409_tbl_Shop_Supplier_Purchase_Order.sql

# Supplier Purchase Order



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Purchase_Order';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Purchase_Order (
	id_order INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_order_temp INT NULL,
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
    id_currency_cost INT NOT NULL,
    cost_total_local_VAT_excl FLOAT NOT NULL,
    cost_total_local_VAT_incl FLOAT NOT NULL,
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


-- File: 1410_tbl_Shop_Supplier_Purchase_Order_Audit.sql

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


-- File: 1411_tbl_Shop_Supplier_Purchase_Order_Temp.sql

# Supplier Purchase Order Staging

DROP TABLE IF EXISTS Shop_Supplier_Purchase_Order_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Purchase_Order_Temp';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Purchase_Order_Temp (
    id_temp INT NOT NULL AUTO_INCREMENT PRIMARY KEY
	, id_order INT NOT NULL
    , id_supplier_ordered INT NOT NULL
    , id_currency_cost INT NOT NULL
    , active BIT NULL
    , GUID BINARY(36) NOT NULL
);


-- File: 1412_tbl_Shop_Supplier_Purchase_Order_Product_Link.sql

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
    -- id_currency_cost INT NOT NULL,
	id_unit_quantity INT NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Purchase_Order_Product_Link_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	quantity_ordered FLOAT NOT NULL,
    quantity_received FLOAT NULL,
    latency_delivery_days INT NOT NULL,
	display_order INT NOT NULL,
    active BIT NOT NULL,
    cost_total_local_VAT_excl FLOAT NOT NULL,
	cost_total_local_VAT_incl FLOAT NOT NULL,
	cost_unit_local_VAT_excl FLOAT NOT NULL,
	cost_unit_local_VAT_incl FLOAT NOT NULL,
	created_on DATETIME,
	created_by INT,
	updated_last_on DATETIME NULL,
	created_last_by VARCHAR(100) NULL,
	id_change_set INT NULL,
	CONSTRAINT FK_Shop_Supplier_Purchase_Order_Product_Link_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);


-- File: 1413_tbl_Shop_Supplier_Purchase_Order_Product_Link_Audit.sql

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


-- File: 1414_tbl_Shop_Supplier_Purchase_Order_Product_Link_Temp.sql

# Supplier Purchase Order Product Link Temp



-- drop table Shop_Supplier_Purchase_Order_Product_Link_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Purchase_Order_Product_Link_Temp';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Purchase_Order_Product_Link_Temp (
    id_temp INT NOT NULL AUTO_INCREMENT PRIMARY KEY
	, id_link INT NOT NULL
    , id_order INT NOT NULL
    , id_product INT NULL
    , id_permutation INT NULL
    , csv_list_variations VARCHAR(4000) NULL
	, id_unit_quantity INT NOT NULL
	, quantity_ordered FLOAT NOT NULL
    , quantity_received FLOAT NULL
    , latency_delivery_days INT NOT NULL
	, display_order INT NOT NULL
    , active BIT NOT NULL
    , cost_total_local_VAT_excl FLOAT NOT NULL
    , cost_total_local_VAT_incl FLOAT NOT NULL
    , GUID BINARY(36) NOT NULL
);


-- File: 1415_tbl_Shop_Manufacturing_Purchase_Order.sql

# Manufacturing Purchase Order

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order (
	id_order INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_order_temp INT NULL,
    /*
	cost_total_local FLOAT NOT NULL,
    id_currency_cost INT NOT NULL,
    */
    id_currency INT NOT NULL,
    CONSTRAINT FK_Manufacturing_Purchase_Order_id_currency
		FOREIGN KEY (id_currency) 
        REFERENCES Shop_Currency(id_currency),
    cost_total_local_VAT_excl FLOAT NULL,
    cost_total_local_VAT_incl FLOAT NULL,
    price_total_local_VAT_excl FLOAT NULL,
    price_total_local_VAT_incl FLOAT NULL,
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


-- File: 1416_tbl_Shop_Manufacturing_Purchase_Order_Audit.sql

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


-- File: 1417_tbl_Shop_Manufacturing_Purchase_Order_Temp.sql

# Manufacturing Purchase Order Temp

-- DROP TABLE Shop_Manufacturing_Purchase_Order_Temp

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order_Temp';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order_Temp (
    id_temp INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_order INT NOT NULL,
    /*
	cost_total_local FLOAT NOT NULL,
    */
    id_currency INT NOT NULL,
    cost_total_local_VAT_excl FLOAT NULL,
    cost_total_local_VAT_incl FLOAT NULL,
    price_total_local_VAT_excl FLOAT NULL,
    price_total_local_VAT_incl FLOAT NULL,
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
    GUID BINARY(36) NOT NULL
);


-- File: 1418_tbl_Shop_Manufacturing_Purchase_Order_Product_Link.sql

# Manufacturing Purchase Order Product Link

-- DROP TABLE partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Audit
-- DROP TABLE partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order_Product_Link';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order_Product_Link (
	id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    , id_order INT NOT NULL
    , CONSTRAINT FK_Manufacturing_Purchase_Order_Product_Link_id_order
		FOREIGN KEY (id_order) 
        REFERENCES partsltd_prod.Shop_Manufacturing_Purchase_Order(id_order)
    , id_permutation INT NOT NULL
    , CONSTRAINT FK_Manufacturing_Purchase_Order_Product_Link_id_permutation
		FOREIGN KEY (id_permutation) 
        REFERENCES partsltd_prod.Shop_Product_Permutation(id_permutation)
    , cost_unit_local_VAT_excl FLOAT NULL
    , cost_unit_local_VAT_incl FLOAT NULL
    , price_unit_local_VAT_excl FLOAT NULL
    , price_unit_local_VAT_incl FLOAT NULL
	, id_unit_quantity INT NOT NULL
    , CONSTRAINT FK_Manufacturing_Purchase_Order_id_unit_quantity
		FOREIGN KEY (id_unit_quantity)
        REFERENCES partsltd_prod.Shop_Unit_Measurement(id_unit_measurement)
	, quantity_used FLOAT NULL
	, quantity_produced FLOAT NULL
	, id_unit_latency_manufacture INT NULL
	, CONSTRAINT FK_MPO_id_unit_latency_manufacture
		FOREIGN KEY (id_unit_latency_manufacture)
		REFERENCES partsltd_prod.Shop_Unit_Measurement(id_unit_measurement)
    , latency_manufacture INT NULL
	, display_order INT NOT NULL
    , active BIT NOT NULL
	, created_on DATETIME
	, created_by INT
	, updated_last_on DATETIME NULL
	, created_last_by VARCHAR(100) NULL
	, id_change_set INT NULL
	, CONSTRAINT FK_Manufacturing_Purchase_Order_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES partsltd_prod.Shop_Sales_And_Purchasing_Change_Set(id_change_set)
);


-- File: 1419_tbl_Shop_Manufacturing_Purchase_Order_Product_Link_Audit.sql

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


-- File: 1420_tbl_Shop_Manufacturing_Purchase_Order_Product_Link_Temp.sql

# Manufacturing Purchase Order Product Link Temp

-- DROP TABLE Shop_Manufacturing_Purchase_Order_Product_Link_Temp;
-- SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Manufacturing_Purchase_Order_Product_Link_Temp';

CREATE TABLE IF NOT EXISTS Shop_Manufacturing_Purchase_Order_Product_Link_Temp (
    id_temp INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_link INT NOT NULL,
    id_order INT NOT NULL,
    id_product INT NULL,
    id_permutation INT NULL,
    csv_list_variations VARCHAR(4000) NULL,
	id_unit_quantity INT NOT NULL,
	quantity_used FLOAT NULL,
	quantity_produced FLOAT NULL,
    id_unit_latency_manufacture INT NULL,
    latency_manufacture INT NULL,
	display_order INT NOT NULL,
    active BIT NOT NULL,
    cost_unit_local_VAT_excl FLOAT NULL,
    cost_unit_local_VAT_incl FLOAT NULL,
    price_unit_local_VAT_excl FLOAT NULL,
    price_unit_local_VAT_incl FLOAT NULL,
    GUID BINARY(36) NOT NULL
);


-- File: 1421_tbl_Shop_Customer.sql
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


-- File: 1422_tbl_Shop_Customer_Audit.sql

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


-- File: 1424_tbl_Shop_Customer_Sales_Order.sql

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


-- File: 1425_tbl_Shop_Customer_Sales_Order_Audit.sql

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


-- File: 1427_tbl_Shop_Customer_Sales_Order_Product_Link.sql

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


-- File: 1428_tbl_Shop_Customer_Sales_Order_Product_Link_Audit.sql

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


-- File: 1429_tbl_Shop_Customer_Sales_Order_Product_Link_Temp.sql

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


-- File: 1500_tbl_Shop_Calc_User_Temp.sql

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

-- File: 3000_tri_Shop_Access_Level.sql

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


-- File: 3000_tri_Shop_Product_Change_Set.sql

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


-- File: 3001_tri_Shop_User_Change_Set.sql

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

-- File: 3002_tri_Shop_Sales_And_Purchasing_Change_Set.sql

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


-- File: 3010_tri_File_Type.sql

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


-- File: 3011_tri_File_Type_Audit.sql

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

-- File: 3012_tri_Shop_General.sql

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

-- File: 3014_tri_Shop_Image_Type.sql

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

-- File: 3100_tri_Shop_Region.sql

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


-- File: 3103_tri_Shop_Region_Branch.sql

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


-- File: 3106_tri_Shop_Address.sql

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

-- File: 3109_tri_Shop_Storage_Location.sql

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


-- File: 3115_tri_Shop_Currency.sql

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

-- File: 3118_tri_Shop_Tax_Or_Surcharge.sql

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



-- File: 3200_tri_Shop_Category.sql

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


-- File: 3203_tri_Shop_Product.sql

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


-- File: 3206_tri_Shop_Product_Permutation.sql

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
	DECLARE v_msg VARCHAR(4000);

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
        SET v_msg := CONCAT('Unsealed expiration interval ID must be a unit of time. Invalid value: ', CAST(NEW.id_unit_measurement_interval_expiration_unsealed AS CHAR));
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = v_msg
        ;
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
	# Changed cost_local_VAT_excl
	SELECT NEW.id_permutation, 'cost_local_VAT_excl', CONVERT(OLD.cost_local_VAT_excl, CHAR), CONVERT(NEW.cost_local_VAT_excl, CHAR), NEW.id_change_set
		WHERE NOT (OLD.cost_local_VAT_excl <=> NEW.cost_local_VAT_excl)
	UNION
	# Changed cost_local_VAT_incl
	SELECT NEW.id_permutation, 'cost_local_VAT_incl', CONVERT(OLD.cost_local_VAT_incl, CHAR), CONVERT(NEW.cost_local_VAT_incl, CHAR), NEW.id_change_set
		WHERE NOT (OLD.cost_local_VAT_incl <=> NEW.cost_local_VAT_incl)
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
    # Changed latency_manufacture
	SELECT NEW.id_permutation, 'latency_manufacture', CONVERT(OLD.latency_manufacture, CHAR), CONVERT(NEW.latency_manufacture, CHAR), NEW.id_change_set
		WHERE NOT OLD.latency_manufacture <=> NEW.latency_manufacture
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


-- File: 3209_tri_Shop_Variation_Type.sql

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


-- File: 3212_tri_Shop_Variation.sql

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
    # Changed id_unit_measurement
	SELECT NEW.id_variation, 'id_unit_measurement', OLD.id_unit_measurement, NEW.id_unit_measurement, NEW.id_change_set
		WHERE NOT OLD.id_unit_measurement <=> NEW.id_unit_measurement
    UNION
    # Changed count_unit_measurement
	SELECT NEW.id_variation, 'count_unit_measurement', OLD.count_unit_measurement, NEW.count_unit_measurement, NEW.id_change_set
		WHERE NOT OLD.count_unit_measurement <=> NEW.count_unit_measurement
    UNION
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


-- File: 3215_tri_Shop_Product_Permutation_Variation_Link.sql

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

-- File: 3218_tri_Shop_Stock_Item.sql

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


-- File: 3221_tri_Shop_Product_Price.sql

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


-- File: 3224_tri_Shop_Product_Image.sql

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

-- File: 3227_tri_Shop_Delivery_Option.sql

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

-- File: 3230_tri_Shop_Product_Permutation_Delivery_Option_Link.sql

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

-- File: 3233_tri_Shop_Discount.sql

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



-- File: 3236_tri_Shop_Discount_Region_Currency_Link.sql

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

-- File: 3300_tri_Shop_Permission_Group.sql

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

-- File: 3303_tri_Shop_Permission.sql

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

-- File: 3306_tri_Shop_Role.sql

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


-- File: 3309_tri_Shop_Role_Permission_Link.sql

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


-- File: 3312_tri_Shop_User.sql

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

-- File: 3315_tri_Shop_User_Role_Link.sql

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

-- File: 3318_tri_Shop_User_Address.sql

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

-- File: 3321_tri_Shop_User_Basket.sql

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

-- File: 3324_tri_Shop_User_Order_Status.sql

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

-- File: 3400_tri_Shop_Supplier.sql

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
    /*
	# Changed id_address
	SELECT NEW.id_supplier, 'id_address', OLD.id_address, NEW.id_address, NEW.id_change_set
		WHERE NOT OLD.id_address <=> NEW.id_address
    UNION
    */
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
    UNION
	# Changed id_supplier_temp
	SELECT NEW.id_supplier, 'id_supplier_temp', OLD.id_supplier_temp, NEW.id_supplier_temp, NEW.id_change_set
		WHERE NOT OLD.id_supplier_temp <=> NEW.id_supplier_temp
    ;
END //
DELIMITER ;;


-- File: 3403_tri_Shop_Supplier_Address.sql

# Shop Supplier Address

DROP TRIGGER IF EXISTS before_insert_Shop_Supplier_Address;
DROP TRIGGER IF EXISTS before_update_Shop_Supplier_Address;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Supplier_Address
BEFORE INSERT ON Shop_Supplier_Address
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Supplier_Address
BEFORE UPDATE ON Shop_Supplier_Address
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_Supplier_Address_Audit (
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

-- File: 3403_tri_Shop_Unit_Measurement.sql

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



-- File: 3406_tri_Shop_Unit_Of_Measurement_Conversion.sql

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
	# Changed multiplier_unit_base
	SELECT NEW.id_conversion, 'multiplier_unit_base', OLD.multiplier_unit_base, NEW.multiplier_unit_base, NEW.id_change_set
		WHERE NOT OLD.multiplier_unit_base <=> NEW.multiplier_unit_base
    UNION
	# Changed increment_unit_base
	SELECT NEW.id_conversion, 'active', OLD.increment_unit_base, NEW.increment_unit_base, NEW.id_change_set
		WHERE NOT OLD.increment_unit_base <=> NEW.increment_unit_base
    UNION
	# Changed apply_multiplier_before_increment
	SELECT NEW.id_conversion, 'apply_multiplier_before_increment', OLD.apply_multiplier_before_increment, NEW.apply_multiplier_before_increment, NEW.id_change_set
		WHERE NOT OLD.apply_multiplier_before_increment <=> NEW.apply_multiplier_before_increment
    UNION
	# Changed active
	SELECT NEW.id_conversion, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;;



-- File: 3409_tri_Shop_Supplier_Purchase_Order.sql

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
	# Changed id_order_temp
	SELECT NEW.id_order, 'id_order_temp', OLD.id_order_temp, NEW.id_order_temp, NEW.id_change_set
		WHERE NOT OLD.id_order_temp <=> NEW.id_order_temp
    UNION
	# Changed id_supplier_ordered
	SELECT NEW.id_order, 'id_supplier_ordered', OLD.id_supplier_ordered, NEW.id_supplier_ordered, NEW.id_change_set
		WHERE NOT OLD.id_supplier_ordered <=> NEW.id_supplier_ordered
    UNION
	# Changed id_currency_cost
	SELECT NEW.id_order, 'id_currency_cost', OLD.id_currency_cost, NEW.id_currency_cost, NEW.id_change_set
		WHERE NOT OLD.id_currency_cost <=> NEW.id_currency_cost
    UNION
	# Changed cost_total_local_VAT_excl
	SELECT NEW.id_order, 'cost_total_local_VAT_excl', OLD.cost_total_local_VAT_excl, NEW.cost_total_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.cost_total_local_VAT_excl <=> NEW.cost_total_local_VAT_excl
    UNION
	# Changed cost_total_local_VAT_incl
	SELECT NEW.id_order, 'cost_total_local_VAT_incl', OLD.cost_total_local_VAT_incl, NEW.cost_total_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.cost_total_local_VAT_incl <=> NEW.cost_total_local_VAT_incl
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



-- File: 3412_tri_Shop_Supplier_Purchase_Order_Product_Link.sql

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
    /*
	# Changed id_currency_cost
	SELECT NEW.id_link, 'id_currency_cost', OLD.id_currency_cost, NEW.id_currency_cost, NEW.id_change_set
		WHERE NOT OLD.id_currency_cost <=> NEW.id_currency_cost
    UNION
	*/
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
    UNION
	# Changed cost_total_local_VAT_excl
	SELECT NEW.id_link, 'cost_total_local_VAT_excl', OLD.cost_total_local_VAT_excl, NEW.cost_total_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.cost_total_local_VAT_excl <=> NEW.cost_total_local_VAT_excl
    UNION
	# Changed cost_total_local_VAT_incl
	SELECT NEW.id_link, 'cost_total_local_VAT_incl', OLD.cost_total_local_VAT_incl, NEW.cost_total_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.cost_total_local_VAT_incl <=> NEW.cost_total_local_VAT_incl
    UNION
	# Changed cost_unit_local_VAT_excl
	SELECT NEW.id_link, 'cost_unit_local_VAT_excl', OLD.cost_unit_local_VAT_excl, NEW.cost_unit_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.cost_unit_local_VAT_excl <=> NEW.cost_unit_local_VAT_excl
    UNION
	# Changed cost_unit_local_VAT_incl
	SELECT NEW.id_link, 'cost_unit_local_VAT_incl', OLD.cost_unit_local_VAT_incl, NEW.cost_unit_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.cost_unit_local_VAT_incl <=> NEW.cost_unit_local_VAT_incl
    ;
END //
DELIMITER ;;


-- File: 3415_tri_Shop_Manufacturing_Purchase_Order.sql

# Shop Manufacturing Purchase Order



DROP TRIGGER IF EXISTS before_insert_Shop_Manufacturing_Purchase_Order;
DROP TRIGGER IF EXISTS before_update_Shop_Manufacturing_Purchase_Order;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Manufacturing_Purchase_Order
BEFORE INSERT ON Shop_Manufacturing_Purchase_Order
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	-- SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	IF NOT EXISTS (SELECT * FROM partsltd_prod.Shop_User U WHERE U.id_user = NEW.created_by LIMIT 1) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Valid created by User ID must be provided.';
    END IF;
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
	# Changed id_order_temp
	SELECT NEW.id_order, 'id_order_temp', OLD.id_order_temp, NEW.id_order_temp, NEW.id_change_set
		WHERE NOT OLD.id_order_temp <=> NEW.id_order_temp
    UNION
	# Changed id_currency
	SELECT NEW.id_order, 'id_currency', OLD.id_currency, NEW.id_currency, NEW.id_change_set
		WHERE NOT OLD.id_currency <=> NEW.id_currency
    UNION
	# Changed cost_total_local_VAT_excl
	SELECT NEW.id_order, 'cost_total_local_VAT_excl', OLD.cost_total_local_VAT_excl, NEW.cost_total_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.cost_total_local_VAT_excl <=> NEW.cost_total_local_VAT_excl
    UNION
	# Changed cost_total_local_VAT_incl
	SELECT NEW.id_order, 'cost_total_local_VAT_incl', OLD.cost_total_local_VAT_incl, NEW.cost_total_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.cost_total_local_VAT_incl <=> NEW.cost_total_local_VAT_incl
    UNION
	# Changed price_total_local_VAT_excl
	SELECT NEW.id_order, 'price_total_local_VAT_excl', OLD.price_total_local_VAT_excl, NEW.price_total_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.price_total_local_VAT_excl <=> NEW.price_total_local_VAT_excl
    UNION
	# Changed price_total_local_VAT_incl
	SELECT NEW.id_order, 'price_total_local_VAT_incl', OLD.price_total_local_VAT_incl, NEW.price_total_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.price_total_local_VAT_incl <=> NEW.price_total_local_VAT_incl
    UNION
	# Changed active
	SELECT NEW.id_order, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    ;
END //
DELIMITER ;;


-- File: 3418_tri_Shop_Manufacturing_Purchase_Order_Product_Link.sql

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
	# Changed id_unit_quantity
	SELECT NEW.id_link, 'id_unit_quantity', OLD.id_unit_quantity, NEW.id_unit_quantity, NEW.id_change_set
		WHERE NOT OLD.id_unit_quantity <=> NEW.id_unit_quantity
    UNION
	# Changed quantity_used
	SELECT NEW.id_link, 'quantity_used', OLD.quantity_used, NEW.quantity_used, NEW.id_change_set
		WHERE NOT OLD.quantity_used <=> NEW.quantity_used
    UNION
	# Changed quantity_produced
	SELECT NEW.id_link, 'quantity_produced', OLD.quantity_produced, NEW.quantity_produced, NEW.id_change_set
		WHERE NOT OLD.quantity_produced <=> NEW.quantity_produced
    UNION
	# Changed cost_unit_local_VAT_excl
	SELECT NEW.id_order, 'cost_unit_local_VAT_excl', OLD.cost_unit_local_VAT_excl, NEW.cost_unit_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.cost_unit_local_VAT_excl <=> NEW.cost_unit_local_VAT_excl
    UNION
	# Changed cost_unit_local_VAT_incl
	SELECT NEW.id_order, 'cost_unit_local_VAT_incl', OLD.cost_unit_local_VAT_incl, NEW.cost_unit_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.cost_unit_local_VAT_incl <=> NEW.cost_unit_local_VAT_incl
    UNION
	# Changed price_unit_local_VAT_excl
	SELECT NEW.id_order, 'price_unit_local_VAT_excl', OLD.price_unit_local_VAT_excl, NEW.price_unit_local_VAT_excl, NEW.id_change_set
		WHERE NOT OLD.price_unit_local_VAT_excl <=> NEW.price_unit_local_VAT_excl
    UNION
	# Changed price_unit_local_VAT_incl
	SELECT NEW.id_order, 'price_unit_local_VAT_incl', OLD.price_unit_local_VAT_incl, NEW.price_unit_local_VAT_incl, NEW.id_change_set
		WHERE NOT OLD.price_unit_local_VAT_incl <=> NEW.price_unit_local_VAT_incl
    UNION
	# Changed id_unit_latency_manufacture
	SELECT NEW.id_link, 'id_unit_latency_manufacture', OLD.id_unit_latency_manufacture, NEW.id_unit_latency_manufacture, NEW.id_change_set
		WHERE NOT OLD.id_unit_latency_manufacture <=> NEW.id_unit_latency_manufacture
    UNION
	# Changed latency_manufacture
	SELECT NEW.id_link, 'latency_manufacture', OLD.latency_manufacture, NEW.latency_manufacture, NEW.id_change_set
		WHERE NOT OLD.latency_manufacture <=> NEW.latency_manufacture
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



-- File: 3421_tri_Shop_Customer.sql

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



-- File: 3424_tri_Shop_Customer_Sales_Order.sql

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


-- File: 3427_tri_Shop_Customer_Sales_Order_Product_Link.sql

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


-- File: 6000_p_debug_timing_reporting.sql
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
		, UNIX_TIMESTAMP(a_time_start)
		, MICROSECOND(a_time_start) / 1000
		, v_time_end
		, UNIX_TIMESTAMP(v_time_end)
		, MICROSECOND(v_time_end) / 1000
		, v_time_end - a_time_start AS timestamp_delta
		, UNIX_TIMESTAMP(v_time_end - a_time_start) AS UNIX_TIMESTAMP_timestamp_delta
		, MICROSECOND(v_time_end - a_time_start) AS MICROSECOND_timestamp_delta
		-- , TIME_FORMAT(TIMEDIFF(v_time_end, a_time_start), '%H:%i:%s') AS time_difference
		, CONCAT(
			TIME_FORMAT(TIMEDIFF(v_time_end, a_time_start), '%H hours, %i minutes, %s seconds'),
			', ',
			TIMESTAMPDIFF(MICROSECOND, a_time_start, v_time_end) % 1000000 / 1000, ' milliseconds'
		) AS time_difference
	;
	
END //
DELIMITER ;;

/*
CALL partsltd_prod.p_debug_timing_reporting (
	CURRENT_TIMESTAMP(6)
);
*/

-- File: 6000_p_split.sql


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


-- File: 6001_p_clear_split_temp.sql

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


-- File: 6001_p_validate_guid.sql


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

-- File: 6003_p_split_key_value_pair_csv.sql


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


-- File: 6004_p_clear_split_key_value_pair_csv_temp.sql

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


-- File: 6206_fn_shop_get_product_permutation_name.sql

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
				IFNULL(PC.name, '(No Category)')
                , ' - '
                , IFNULL(P.name, '(No Product)')
                , CASE WHEN P.has_variations = 1 THEN
                    CONCAT(' - ', GROUP_CONCAT(CONCAT(VT.name, ': ', V.name) SEPARATOR ', '))
                ELSE '' END
            )
        FROM Shop_Product_Permutation PP
        LEFT JOIN Shop_Product P ON PP.id_product = P.id_product
        LEFT JOIN Shop_Product_Category PC ON P.id_category = PC.id_category
        LEFT JOIN Shop_Product_Permutation_Variation_Link PPVL ON PP.id_permutation = PPVL.id_permutation
        LEFT JOIN Shop_Variation V ON PPVL.id_variation = V.id_variation
        LEFT JOIN Shop_Variation_Type VT ON V.id_type = VT.id_type
        WHERE PP.id_permutation = id_product_permutation
        GROUP BY PC.id_category, PC.name, P.id_product, P.name, P.has_variations, VT.display_order, VT.name, V.display_order, V.name
        LIMIT 1
    );
    
    RETURN name;
END //

DELIMITER ;

/*
SELECT 
	fn_shop_get_product_permutation_name(
		3 -- id_product_permutation
	)
;
*/

-- File: 6210_fn_shop_get_id_product_permutation_from_variation_csv_list.sql

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


-- File: 6211_fn_shop_get_product_variations_from_id_csv_list.sql

DROP FUNCTION IF EXISTS fn_shop_get_product_variations_from_id_csv_list;

DELIMITER //

CREATE FUNCTION fn_shop_get_product_variations_from_id_csv_list (
	a_id_permutation INT
	, a_variation_csv TEXT
    , a_guid BINARY(36)
) 
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE v_csv_pairs VARCHAR(4000);
    DECLARE v_current_pair VARCHAR(50);
    DECLARE v_id_variation_type INT;
    DECLARE v_id_variation INT;
    DECLARE v_rank_counter INT;

	CALL p_validate_guid( a_guid );
    
    SET v_csv_pairs := a_variation_csv;
    SET v_rank_counter := 1;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Get_Variation_From_Csv_Variations;
    CREATE TEMPORARY TABLE tmp_Get_Variation_From_Csv_Variations (
		id_variation_type INT NULL
        , id_variation INT NOT NULL
	);
    
    WHILE LENGTH(v_csv_pairs) > 0 DO
        IF LOCATE(',', v_csv_pairs) > 0 THEN
            SET v_current_pair := SUBSTRING_INDEX(v_csv_pairs, ',', 1);
            SET v_csv_pairs := SUBSTRING(v_csv_pairs, LOCATE(',', v_csv_pairs) + 1);
        ELSE
            SET v_current_pair := v_csv_pairs;
            SET v_csv_pairs := '';
        END IF;
        
        SET v_id_variation_type := SUBSTRING_INDEX(v_current_pair, ':', 1);
        SET v_id_variation := SUBSTRING_INDEX(v_current_pair, ':', -1);
	
		IF NOT ISNULL(v_id_variation) THEN
			INSERT INTO tmp_Get_Variation_From_Csv_Variations (
				id_variation_type
				, id_variation
			)
			SELECT
				v_id_variation_type AS id_variation_type
				, v_id_variation AS id_variation
			;
			
			SET v_rank_counter := v_rank_counter + 1;
        END IF;
    END WHILE;
    
	INSERT INTO partsltd_prod.Shop_Product_Permutation_Variation_Link_Temp (
		id_link
		, id_permutation
		, id_variation
		, display_order
        , active
		, GUID
	)
	SELECT
		IFNULL(PPVL.id_link, -v_rank_counter) AS id_link
		, a_id_permutation
		, t_V.id_variation
		, v_rank_counter AS display_order
        , 1 AS active
		, a_guid
	FROM tmp_Get_Variation_From_Csv_Variations t_V
	LEFT JOIN partsltd_prod.Shop_Product_Permutation_Variation_Link PPVL ON t_V.id_variation = PPVL.id_variation
	;
	
    DROP TEMPORARY TABLE tmp_Get_Variation_From_Csv_Variations;
    
    RETURN v_rank_counter;
END //

DELIMITER ;


/*

SELECT 
	partsltd_prod.fn_shop_get_product_variations_from_id_csv_list(
		1 -- a_id_permutation
        , '1:1' -- a_variation_csv
        , 'NIPPLENIPPLENIPPLENIPPLENIPPLENIPPLE' -- a_guid
	)
;
SELECT *
FROM partsltd_prod.Shop_Product_Permutation_Variation_Link_Temp
WHERE GUID = 'NIPPLENIPPLENIPPLENIPPLENIPPLENIPPLE'
;
DELETE
FROM partsltd_prod.Shop_Product_Permutation_Variation_Link_Temp
WHERE GUID = 'NIPPLENIPPLENIPPLENIPPLENIPPLENIPPLE'
;
*/


-- File: 6212_fn_shop_get_product_permutation_variations_csv.sql

DROP FUNCTION IF EXISTS fn_shop_get_product_permutation_variations_csv;

DELIMITER //

CREATE FUNCTION fn_shop_get_product_permutation_variations_csv(id_product_permutation INT)
RETURNS VARCHAR(4000)
DETERMINISTIC
BEGIN
    DECLARE csv VARCHAR(4000);
    
    SET csv := (
        SELECT 
			CASE WHEN P.has_variations = 0 THEN
				''
            ELSE
				GROUP_CONCAT(
					CONCAT(
						PV.id_type
						, ':'
						, PV.id_variation
					)
					SEPARATOR ','
				)
			END 
		FROM partsltd_prod.Shop_Product_Permutation PP
		LEFT JOIN partsltd_prod.Shop_Product P ON PP.id_product = P.id_product
		LEFT JOIN partsltd_prod.Shop_Product_Permutation_Variation_Link PPVL ON PP.id_permutation = PPVL.id_permutation
		LEFT JOIN partsltd_prod.Shop_Variation PV ON PPVL.id_variation = PV.id_variation
		LEFT JOIN partsltd_prod.Shop_Variation_Type PVT ON PV.id_type = PVT.id_type
        WHERE PP.id_permutation = id_product_permutation
        GROUP BY P.id_product, P.has_variations, PVT.display_order, PVT.name, PV.display_order, PV.name
        LIMIT 1
    );
    
    RETURN csv;
END //

DELIMITER ;
SELECT 
	fn_shop_get_product_permutation_variations_csv(
		3 -- id_product_permutation
	)
    , fn_shop_get_product_permutation_variations_csv(
		1 -- id_product_permutation
	)
;
/*
*/

-- File: 6500_p_shop_calc_user.sql

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

-- File: 6501_p_shop_clear_calc_user.sql

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


-- File: 7003_p_shop_get_many_access_level.sql



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


-- File: 7101_p_shop_get_many_region.sql



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


-- File: 7106_p_shop_get_many_plant.sql


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


-- File: 7109_p_shop_get_many_storage_location.sql


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_storage_location;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_storage_location (
	IN a_get_inactive_storage_location BIT
)
BEGIN
	SET a_get_inactive_storage_location = IFNULL(a_get_inactive_storage_location, 0);
    
	SELECT 
		SL.id_location
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


-- File: 7116_p_shop_get_many_currency.sql



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


-- File: 7122_p_shop_get_many_unit_measurement.sql

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


-- File: 7200_p_shop_save_product_category.sql


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_save_category;
DROP PROCEDURE IF EXISTS p_shop_save_category;
DROP PROCEDURE IF EXISTS p_shop_save_product_category;


DELIMITER //
CREATE PROCEDURE p_shop_save_product_category (
    IN a_comment VARCHAR(500),
	IN a_guid BINARY(36),
    IN a_id_user INT,
    IN a_debug BIT
)
BEGIN
	DECLARE v_code_type_error_bad_data VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission LONGTEXT;
    DECLARE v_id_change_set INT;
    DECLARE v_id_access_level_edit INT;
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
        
		CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
			display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
			, id_type INT NULL
			, code VARCHAR(50) NOT NULL
			, msg VARCHAR(4000) NOT NULL
		);
        INSERT INTO tmp_Msg_Error (
			id_type
            , code
            , msg
		)
        SELECT 
			MET.id_type
            , @errno
            , @text
		FROM partsltd_prod.Shop_Msg_Error_Type MET
        WHERE MET.code = 'MYSQL_ERROR'
		;
        SELECT *
        FROM tmp_Msg_Error;
		DROP TABLE IF EXISTS tmp_Msg_Error;
    END;
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_code_type_error_bad_data := 'BAD_DATA';
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_id_access_level_edit := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
    CALL p_validate_guid ( a_guid );
    
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
        , IFNULL(IFNULL(PC_T.active, PC.active), 1) AS active
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
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following category(s) do not have a code: ', GROUP_CONCAT(IFNULL(t_C.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Category t_C
		WHERE ISNULL(t_C.code)
		;
    END IF;
    -- name
    IF EXISTS (SELECT * FROM tmp_Category t_C WHERE ISNULL(t_C.name) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following category(s) do not have a name: ', GROUP_CONCAT(IFNULL(t_C.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Category t_C
		WHERE ISNULL(t_C.name)
		;
    END IF;
    -- display_order
    IF EXISTS (SELECT * FROM tmp_Category t_C WHERE ISNULL(t_C.display_order) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
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
				, v_time_start AS created_on
			FROM tmp_Category t_C
			WHERE is_new = 1
				AND active = 1
			;
		
			DELETE FROM Shop_Product_Category_Temp
			WHERE GUID = a_guid;
			
		COMMIT;
    END IF;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
	INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
	;
    
	IF a_debug = 1 THEN
		SELECT * from tmp_Catgory;
	END IF;

    DROP TEMPORARY TABLE tmp_Catgory;
    DROP TEMPORARY TABLE tmp_Msg_Error;
    
	IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
	END IF;
END //
DELIMITER ;;



-- File: 7200_p_shop_save_product_category_test.sql

-- Clear previous proc
DROP PROCEDURE IF EXISTS partsltd_prod.p_shop_save_product_category_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_product_category_test ()
BEGIN
	
	DECLARE v_guid BINARY(36);
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_guid := 'nips';

	SELECT *
	FROM partsltd_prod.Shop_Product_Category
	;
	SELECT *
	FROM partsltd_prod.Shop_Product_Category_Temp
	;

	START TRANSACTION;
		
		INSERT INTO partsltd_prod.Shop_Product_Category_Temp (
			id_category
            , name
            , code
            , description
            , id_access_level_required
            , display_order
            , guid
		)
		VALUES (
			-5 -- id_category
			, 'Nips' -- name
			, 'Lips' -- code
			, 'Chips' -- description
			, 2 -- id_access_level_required
			, 25 -- display_order
			, v_guid
		);
		
	COMMIT;
    
	SELECT *
	FROM partsltd_prod.Shop_Product_Category_Temp
	WHERE GUID = v_guid
    ;
    
    CALL partsltd_prod.p_shop_save_product_category ( 
		'Test save product category' -- comment
        , v_guid -- guid
        , 1 -- id_user
		, 1 -- debug
    );
    
	SELECT *
	FROM partsltd_prod.Shop_Product_Category
	;
	SELECT *
	FROM partsltd_prod.Shop_Product_Category_Temp
	;
    
	CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
END //
DELIMITER ;;

/*
CALL partsltd_prod.p_shop_save_product_category_test ();

DELETE FROM partsltd_prod.Shop_Product_Category_Temp;

DROP TABLE IF EXISTS tmp_Msg_Error;
*/


-- File: 7202_p_shop_clear_calc_product_permutation.sql

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


-- File: 7203_p_shop_save_product.sql




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
    
    CALL p_validate_guid ( a_guid );
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



-- File: 7203_p_shop_save_product_test.sql


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
		VALUES 
        /* Test 1 - Update
        (
			4 -- id_product
			, 1 -- id_category
			, 'Laptops' -- name
			, 0 -- has_variations
			, 2 -- id_access_level_required
			, 2 -- display_order
			, 1 -- active
			, v_guid
		)
        */
        /* Test 2 - Insert */
        (
			-14 -- id_product
			, 5 -- id_category
			, 'Clip' -- name
			, 0 -- has_variations
			, 1 -- id_access_level_required
			, 1 -- display_order
			, 1 -- active
			, v_guid
		)
        ;
		
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
*/

-- File: 7204_p_shop_calc_product_permutation.sql
-- USE partsltd_prod;

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
				OR (
					PC.active = 0
					AND a_get_inactive_product_category = 0
				)
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
				OR (
					PC.active = 0
					AND a_get_inactive_product_category = 0
				)
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
						AND NOT ISNULL(t_S.as_int)
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
				OR (
					P.active = 0
					AND a_get_inactive_product = 0
				)
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
				OR (
					P.active = 0
					AND a_get_inactive_product = 0
				)
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
						AND NOT ISNULL(t_S.as_int)
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
				OR (
					PP.active = 0
					AND a_get_inactive_product_permutation = 0
				)
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
			WHERE 1=1
				AND (
					a_get_all_product_permutation = 1
					OR (
						v_has_filter_permutation = 1
						AND NOT ISNULL(t_S.as_int)
					)
				)
				AND (
					a_get_products_quantity_stock_below_min = 0
					OR PP.quantity_stock < PP.quantity_min
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
			
			DELETE t_C
			FROM tmp_Category_calc t_C
			WHERE FIND_IN_SET(t_C.id_category, v_ids_category_invalid) > 0
			;
			
			DELETE t_P
			FROM tmp_Product_calc t_P
			WHERE FIND_IN_SET(t_P.id_product, v_ids_product_invalid) > 0
			;
			
			DELETE t_PP
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
		SELECT * FROM Shop_Product_Category_Temp;
		SELECT * FROM Shop_Product_Temp;
		SELECT * FROM Shop_Product_Permutation_Temp;
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
				, cost_local_VAT_excl
				, cost_local_VAT_incl
				, id_currency_cost
				, profit_local_min
				, latency_manufacture
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
				, PP.cost_local_VAT_excl
				, PP.cost_local_VAT_incl
				, PP.id_currency_cost
				, PP.profit_local_min
				, PP.latency_manufacture
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
        
*/

-- File: 7204_p_shop_get_many_product.sql
-- 
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
        PP.cost_local_VAT_excl,
        PP.cost_local_VAT_incl,
        PP.id_currency_cost,
        C.code AS code_currency_cost,
        C.symbol AS symbol_currency_cost,
        PP.profit_local_min,
        PP.latency_manufacture,
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
    
    IF a_debug = 1 THEN
		SELECT * FROM tmp_Category;
		SELECT * FROM tmp_Product;
		SELECT * FROM tmp_Permutation;
		SELECT * FROM tmp_Image;
    END IF;
    
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


-- File: 7205_p_shop_get_many_stripe_product_new.sql



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


-- File: 7206_p_shop_save_product_permutation.sql


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_permutation;
DROP PROCEDURE IF EXISTS p_shop_save_product_permutation;

DELIMITER //
CREATE PROCEDURE p_shop_save_product_permutation (
    IN a_comment VARCHAR(500),
	IN a_guid BINARY(36),
    IN a_id_user INT,
    IN a_debug BIT
)
BEGIN
    
	DECLARE v_code_type_error_bad_data VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission LONGTEXT;
    DECLARE v_id_change_set INT;
    DECLARE v_id_access_level_edit INT;
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
        
		CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
			display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
			, id_type INT NULL
			, code VARCHAR(50) NOT NULL
			, msg VARCHAR(4000) NOT NULL
		);
        INSERT INTO tmp_Msg_Error (
			id_type
            , code
            , msg
		)
        SELECT 
			MET.id_type
            , @errno
            , @text
		FROM partsltd_prod.Shop_Msg_Error_Type MET
        WHERE MET.code = 'MYSQL_ERROR'
        LIMIT 1
		;
        SELECT *
        FROM tmp_Msg_Error;
		DROP TABLE IF EXISTS tmp_Msg_Error;
    END;
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_code_type_error_bad_data := 'BAD_DATA';
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_id_access_level_edit := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
    CALL p_validate_guid ( a_guid );
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation_Variation_Link;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    
    CREATE TEMPORARY TABLE tmp_Permutation (
		id_permutation INT NOT NULL
        , id_permutation_temp INT NOT NULL
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
    
    CREATE TEMPORARY TABLE tmp_Permutation_Variation_Link (
		id_link INT NOT NULL
        , id_permutation INT NOT NULL
        , id_variation INT NOT NULL
        , active BIT NOT NULL
        , display_order INT NOT NULL
        , is_new BIT NOT NULL
    );
        
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
		, id_type INT NULL
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
        
    
    -- Get data from Temp table
    INSERT INTO tmp_Permutation (
		id_permutation
		, id_permutation_temp
		, id_product
        , csv_id_pairs_variation
		, description
		, cost_local_VAT_excl
		, cost_local_VAT_incl
		, id_currency_cost
		, profit_local_min
		, latency_manufacture
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
		, PP_T.id_permutation
		, IFNULL(PP_T.id_product, PP.id_product) AS id_product
        , PP_T.csv_id_pairs_variation
        , IFNULL(PP_T.description, PP.description) AS description
		, IFNULL(PP_T.cost_local_VAT_excl, PP.cost_local_VAT_excl) AS cost_local_VAT_excl
		, IFNULL(PP_T.cost_local_VAT_incl, PP.cost_local_VAT_incl) AS cost_local_VAT_incl
		, IFNULL(PP_T.id_currency_cost, PP.id_currency_cost) AS a_id_currency_cost
		, IFNULL(PP_T.profit_local_min, PP.profit_local_min) AS profit_local_min
		, IFNULL(PP_T.latency_manufacture, PP.latency_manufacture) AS latency_manufacture
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
		, IFNULL(fn_shop_get_product_permutation_name(PP_T.id_permutation), '(No Permutation)') AS name_error
        , CASE WHEN IFNULL(PP_T.id_permutation, 0) < 1 THEN 1 ELSE 0 END AS is_new
	FROM Shop_Product_Permutation_Temp PP_T
    LEFT JOIN Shop_Product_Permutation PP ON PP_T.id_permutation = PP.id_permutation
    WHERE PP_T.guid = a_guid
    ;
    
    SELECT
		partsltd_prod.fn_shop_get_product_variations_from_id_csv_list(
			t_PP.id_permutation -- a_id_permutation
			, t_PP.csv_id_pairs_variation -- a_variation_csv
			, a_guid -- a_guid
		)
    FROM tmp_Permutation t_PP
    WHERE NOT ISNULL(t_PP.csv_id_pairs_variation)
    ;
    
    INSERT INTO tmp_Permutation_Variation_Link (
		id_link
        , id_permutation
        , id_variation
        , display_order
        , active
        , is_new
	)
    SELECT
		PPVL_T.id_link
        , PPVL_T.id_permutation
        , PPVL_T.id_variation
        , PPVL_T.display_order
        , NOT ISNULL(PPVL_T.id_link) AS active
        , IFNULL(PPVL_T.id_link, 0) < 1 AS is_new
    FROM partsltd_prod.Shop_Product_Permutation_Variation_Link_Temp PPVL_T
    LEFT JOIN partsltd_prod.Shop_Product_Permutation_Variation_Link PPVL ON PPVL_T.id_link = PPVL.id_variation
    LEFT JOIN tmp_Permutation t_PP ON PPVL_T.id_permutation = t_PP.id_permutation
    WHERE PPVL_T.GUID = a_guid
    ;
    
    IF a_debug = 1 THEN
		SELECT *
		FROM tmp_Permutation
		;
		SELECT *
		FROM tmp_Permutation_Variation_Link
		;
    END IF;
    
    -- Validation
    -- Missing mandatory fields
    -- id_product
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.id_product) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a product: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.id_product)
		;
    END IF;
    -- cost_local_VAT_excl
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE NOT ISNULL(t_P.cost_local_VAT_excl) AND t_P.cost_local_VAT_excl < 0 LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a valid local cost excluding VAT: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE NOT ISNULL(t_P.cost_local_VAT_excl) AND t_P.cost_local_VAT_excl < 0
		;
    END IF;
    -- cost_local_VAT_incl
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE NOT ISNULL(t_P.cost_local_VAT_incl) AND t_P.cost_local_VAT_incl < 0 LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a valid local cost including VAT: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE NOT ISNULL(t_P.cost_local_VAT_incl) AND t_P.cost_local_VAT_incl < 0
		;
    END IF;
    -- profit_local_min 
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE NOT ISNULL(t_P.profit_local_min) AND t_P.profit_local_min < 0 LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a local minimum profit: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE NOT ISNULL(t_P.profit_local_min) AND t_P.profit_local_min < 0
		;
    END IF;
    
    -- 	latency_manufacture
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.latency_manufacture) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a manufacturing latency: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.latency_manufacture)
		;
    END IF;
    -- id_unit_measurement_quantity
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.id_unit_measurement_quantity) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a unit measurement for stock quantities: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.id_unit_measurement_quantity)
		;
    END IF;
    -- 	count_unit_measurement_per_quantity_step
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.count_unit_measurement_per_quantity_step) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a count unit measurement per quantity step: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.count_unit_measurement_per_quantity_step)
		;
    END IF;
    -- quantity_min
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.quantity_min) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a minimum quantity: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.quantity_min)
		;
    END IF;
    -- 	quantity_max
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.quantity_max) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a maximum quantity: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.quantity_max)
		;
    END IF;
    -- is_subscription
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.is_subscription) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have an is subscription?: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.is_subscription)
		;
    END IF;
    -- does_expire_faster_once_unsealed
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.does_expire_faster_once_unsealed) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a does expire faster once unsealed: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.does_expire_faster_once_unsealed)
		;
    END IF;
    
    -- Permissions
	SET v_ids_product_permission := (
		SELECT GROUP_CONCAT(P.id_product SEPARATOR ',') 
		FROM Shop_Product P 
		INNER JOIN tmp_Permutation t_P
			ON P.id_product = t_P.id_product 
			-- AND t_P.is_new = 0
	);
    
	SET v_id_permission_product = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
	
    IF a_debug = 1 THEN
		SELECT
			a_guid
			, a_id_user
			, FALSE AS a_get_inactive_user
			, v_id_permission_product
			, v_id_access_level_edit
			, v_ids_product_permission
			, 0 AS a_debug
		;
    END IF;
    
	CALL p_shop_calc_user(
		a_guid
        , a_id_user
        , FALSE -- a_get_inactive_user
        , v_id_permission_product
        , v_id_access_level_edit
        , v_ids_product_permission
        , 0 -- a_debug
	);
	
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
	
    IF a_debug = 1 THEN
		SELECT *
        FROM partsltd_prod.Shop_Calc_User_Temp
        WHERE GUID = a_guid
        ;
        SELECT *
        FROM tmp_Permutation t_PP
        LEFT JOIN Shop_Product P ON t_PP.id_product = P.id_product
        ;
    END IF;
    
	CALL p_shop_clear_calc_user(
		a_guid
        , 0 -- a_debug
	);

	IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.can_edit) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have product edit permission: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE 
			ISNULL(t_P.can_edit)
		;
	END IF;
        
        IF a_debug = 1 THEN
			SELECT *
            FROM partsltd_prod.Shop_Product_Permutation_Variation_Link_Temp
			WHERE GUID = a_guid
            ;
        END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		START TRANSACTION;
		
			INSERT INTO Shop_Product_Change_Set ( comment )
			VALUES ( a_comment )
			;
			
			SET v_id_change_set := LAST_INSERT_ID();
			
			INSERT INTO Shop_Product_Permutation (
				id_permutation_temp
				, id_product
				, description
				, cost_local_VAT_excl
				, cost_local_VAT_incl
				, id_currency_cost
				, profit_local_min
				, latency_manufacture
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
                , id_change_set
			)
			SELECT
				t_P.id_permutation
				, t_P.id_product AS id_product
				, t_P.description AS description
				, t_P.cost_local_VAT_excl AS cost_local_VAT_excl
				, t_P.cost_local_VAT_incl AS cost_local_VAT_incl
				, t_P.id_currency_cost AS id_currency_cost
				, t_P.profit_local_min AS profit_local_min
				, t_P.latency_manufacture AS latency_manufacture
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
				, v_time_start AS created_on
                , v_id_change_set AS id_change_set
			FROM tmp_Permutation t_P
			WHERE 
				is_new = 1
				AND active = 1
			;
			
			UPDATE Shop_Product_Permutation PP
			INNER JOIN tmp_Permutation t_P ON PP.id_permutation = t_P.id_permutation
			SET 
				PP.id_product = t_P.id_product
				, PP.description = t_P.description
				, PP.cost_local_VAT_excl = t_P.cost_local_VAT_excl
				, PP.cost_local_VAT_incl = t_P.cost_local_VAT_incl
				, PP.id_currency_cost = t_P.id_currency_cost
				, PP.profit_local_min = t_P.profit_local_min
				, PP.latency_manufacture = t_P.latency_manufacture
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
            
            UPDATE tmp_Permutation t_PP
            INNER JOIN partsltd_prod.Shop_Product_Permutation PP 
				ON t_PP.id_permutation_temp = PP.id_permutation_temp
                AND PP.id_change_set = v_id_change_set
            SET
				t_PP.id_permutation = PP.id_permutation
			;
            UPDATE tmp_Permutation_Variation_Link t_PPVL
            INNER JOIN tmp_Permutation t_PP ON t_PPVL.id_permutation = t_PP.id_permutation_temp
            SET
				t_PPVL.id_permutation = t_PP.id_permutation
			;
            
            INSERT INTO partsltd_prod.Shop_Product_Permutation_Variation_Link (
				id_permutation
                , id_variation
                , display_order
                , active
			)
            SELECT 
				t_PPVL.id_permutation
                , t_PPVL.id_variation
                , t_PPVL.display_order
                , t_PPVL.active
			FROM tmp_Permutation_Variation_Link t_PPVL
            WHERE 
				t_PPVL.is_new = 1
                AND t_PPVL.active = 1
            ;
            
            UPDATE partsltd_prod.Shop_Product_Permutation_Variation_Link PPVL
            INNER JOIN tmp_Permutation_Variation_Link t_PPVL 
				ON PPVL.id_link = t_PPVL.id_link
                AND t_PPVL.is_new = 1
            SET
				PPVL.id_permutation = t_PPVL.id_permutation
                , PPVL.id_variation = t_PPVL.id_variation
                , PPVL.display_order = t_PPVL.display_order
                , PPVL.active = t_PPVL.active
                , PPVL.id_change_set = v_id_change_set
            ;
		END IF;
		
    
		DELETE FROM Shop_Product_Permutation_Temp
		WHERE GUID = a_guid
        ;
        
		DELETE FROM partsltd_prod.Shop_Product_Permutation_Variation_Link_Temp
		WHERE GUID = a_guid
        ;
	
	COMMIT;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
	INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
	;
    
	IF a_debug = 1 THEN
		SELECT * FROM tmp_Permutation;
        SELECT * FROM tmp_Permutation_Variation_Link;
	END IF;

    DROP TEMPORARY TABLE tmp_Permutation_Variation_Link;
    DROP TEMPORARY TABLE tmp_Permutation;
    DROP TEMPORARY TABLE tmp_Msg_Error;
    
	IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
	END IF;
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
	latency_manufacture,
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
		, 14 -- latency_manufacture,
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


select * from shop_unit_measurement;

*/



-- File: 7206_p_shop_save_product_permutation_test.sql


-- Clear previous proc
DROP PROCEDURE IF EXISTS partsltd_prod.p_shop_save_product_permutation_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_product_permutation_test ()
BEGIN
	
	DECLARE v_guid BINARY(36);
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_guid := 'nips';

	SELECT *
	FROM partsltd_prod.Shop_Product_Permutation
	;
	SELECT *
	FROM partsltd_prod.Shop_Product_Permutation_Variation_Link
	;
	SELECT *
	FROM partsltd_prod.Shop_Product_Permutation_Temp
	;

	START TRANSACTION;
		
		INSERT INTO partsltd_prod.Shop_Product_Permutation_Temp (
			id_permutation
			, id_product
            , csv_id_pairs_variation
            , description
			, cost_local_VAT_excl
			, cost_local_VAT_incl
			, id_currency_cost
			, profit_local_min 
			, latency_manufacture
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
			, guid
		)
		VALUES 
        /* Test 1 - Insert 
        (
			-1 -- id_permutation
			, 5 -- id_product
            , '' -- csv_id_pairs_variation
            , 'Hair clip' -- description
            , NULL -- cost_local_VAT_excl
            , NULL -- cost_local_VAT_incl
            , 1 -- id_currency_cost
            , NULL -- profit_local_min
            , 1 -- latency_manufacture
            , 3 -- id_unit_measurement_quantity
            , 1 -- count_unit_measurement_per_quantity_step
            , 0 -- quantity_min
            , 0 -- quantity_max
            , 2 -- quantity_stock
            , FALSE -- is_subscription
            , NULL -- id_unit_measurement_interval_recurrence
            , NULL -- count_interval_recurrence
            , NULL -- id_stripe_product
            , FALSE -- does_expire_faster_once_unsealed
            , NULL -- id_unit_measurement_interval_expiration_unsealed
            , NULL -- count_interval_expiration_unsealed
			, 1 -- active
			, v_guid
		)
        */
        /* Test 2 - Update
        (
			4 -- id_product
			, 1 -- id_category
			, 'Laptops' -- name
			, 0 -- has_variations
			, 2 -- id_access_level_required
			, 2 -- display_order
			, 1 -- active
			, v_guid
		)
        */
        /* Test 3 - Insert with Variations */
        (
			-1 -- id_permutation
			, 1 -- id_product
            , '1:3' -- csv_id_pairs_variation
            , 'Test with variations' -- description
            , NULL -- cost_local_VAT_excl
            , NULL -- cost_local_VAT_incl
            , 1 -- id_currency_cost
            , NULL -- profit_local_min
            , 1 -- latency_manufacture
            , 3 -- id_unit_measurement_quantity
            , 1 -- count_unit_measurement_per_quantity_step
            , 0 -- quantity_min
            , 0 -- quantity_max
            , 2 -- quantity_stock
            , FALSE -- is_subscription
            , NULL -- id_unit_measurement_interval_recurrence
            , NULL -- count_interval_recurrence
            , NULL -- id_stripe_product
            , TRUE -- does_expire_faster_once_unsealed
            , 8 -- id_unit_measurement_interval_expiration_unsealed
            , 2 -- count_interval_expiration_unsealed
			, 1 -- active
			, v_guid
		)
        ;
		
	COMMIT;
    
	SELECT *
	FROM partsltd_prod.Shop_Product_Permutation_Temp
	WHERE GUID = v_guid
    ;
    
    CALL partsltd_prod.p_shop_save_product_permutation ( 
		'Test save product' -- comment
        , v_guid -- guid
        , 1 -- id_user
		, 1 -- debug
    );
    
	SELECT *
	FROM partsltd_prod.Shop_Product_Permutation
	;
	SELECT *
	FROM partsltd_prod.Shop_Product_Permutation_Variation_Link
	;
	SELECT *
	FROM partsltd_prod.Shop_Product_Permutation_Temp
	;
    
	CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
END //
DELIMITER ;;

/*
CALL partsltd_prod.p_shop_save_product_permutation_test ();

DELETE FROM partsltd_prod.Shop_Product_Permutation_Temp;

DROP TABLE IF EXISTS tmp_Msg_Error;


DELETE FROM partsltd_prod.Shop_Product_Permutation_Variation_Link
WHERE id_link >= 3
;
DELETE FROM partsltd_prod.Shop_Product_Permutation
WHERE id_permutation >= 7
;

	SELECT *
	FROM partsltd_prod.Shop_Product_Permutation_Variation_Link_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Variation
	;
*/

-- File: 7210_p_shop_get_many_product_variation.sql

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
	, 1 # a_get_inactive_variation_type
	, '' # a_ids_variation_type
    , 1 # a_get_all_variation
	, 1 # a_get_inactive_variation
	, '' # a_ids_variation
    , 0 # a_debug
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

-- File: 7212_p_shop_save_product_variation.sql


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_product_variation;

DROP TABLE IF EXISTS tmp_Variation_Type;
DROP TABLE IF EXISTS tmp_Variation;
DROP TABLE IF EXISTS tmp_Msg_Error;

DELIMITER //
CREATE PROCEDURE p_shop_save_product_variation (
	IN a_comment VARCHAR(500)
	, IN a_guid BINARY(36)
    , IN a_id_user INT
    , IN a_debug BIT
)
BEGIN
	DECLARE v_code_type_error_bad_data VARCHAR(50);
	DECLARE v_code_type_error_no_permission VARCHAR(50);
	DECLARE v_code_type_error_warning VARCHAR(50);
    DECLARE v_id_access_level_edit INT;
    DECLARE v_id_change_set INT;
    DECLARE v_ids_permission_product_variation VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_type_error_no_permission INT;
    DECLARE v_id_type_error_warning INT;
	DECLARE v_ids_product_permission TEXT;
    DECLARE v_time_start TIMESTAMP(6);

    DECLARE exit handler for SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            @sqlstate = RETURNED_SQLSTATE
            , @errno = MYSQL_ERRNO
            , @text = MESSAGE_TEXT
		;
        
        ROLLBACK;
        
		CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
			display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
			, id_type INT NULL
			, code VARCHAR(50) NOT NULL
			, msg VARCHAR(4000) NOT NULL
		);
        INSERT INTO tmp_Msg_Error (
			id_type
            , code
            , msg
		)
        SELECT 
			MET.id_type
            , @errno
            , @text
		FROM partsltd_prod.Shop_Msg_Error_Type MET
        WHERE code = 'MYSQL_ERROR'
        LIMIT 1
		;
        SELECT *
        FROM tmp_Msg_Error;
		DROP TABLE IF EXISTS tmp_Msg_Error;
    END;
    
	SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_code_type_error_bad_data := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_bad_data := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_code_type_error_no_permission := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION' LIMIT 1);
    SET v_id_type_error_no_permission := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_no_permission LIMIT 1);
	SET v_code_type_error_warning := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'WARNING' LIMIT 1);
    SET v_id_type_error_warning := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_warning LIMIT 1);
	SET v_ids_permission_product_variation := (SELECT GROUP_CONCAT(id_permission SEPARATOR ',') FROM partsltd_prod.Shop_Permission WHERE code IN ('STORE_PRODUCT'));
	SET v_id_access_level_edit := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
	CALL p_validate_guid ( a_guid );
	SET a_comment := TRIM(IFNULL(a_comment, ''));
    
	DROP TEMPORARY TABLE IF EXISTS tmp_Variation_Type;
	DROP TEMPORARY TABLE IF EXISTS tmp_Variation;
	DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;

    -- Temporary tables
    CREATE TEMPORARY TABLE tmp_Variation_Type (
		id_type INT NOT NULL PRIMARY KEY
		, id_type_temp INT NOT NULL
		, code VARCHAR(50)
		, name VARCHAR(255)
		, name_plural VARCHAR(256)
		, active BIT NULL
		, display_order INT NOT NULL
		, created_on DATETIME
		, created_by INT
		, is_new BIT NOT NULL
		, name_error VARCHAR(1000) NOT NULL
    );
    -- CREATE TEMPORARY TABLE tmp_Variation_Type_Count
    
    CREATE TEMPORARY TABLE tmp_Variation (
		id_variation INT NOT NULL PRIMARY KEY
		, id_type INT NOT NULL
		, code VARCHAR(50)
		, name VARCHAR(255)
		, active BIT
		, display_order INT NOT NULL
		, created_on DATETIME
		, created_by INT
		, has_type BIT NULL
		, is_new BIT NOT NULL
		, name_error VARCHAR(1000) NOT NULL
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
		, id_type INT NOT NULL
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
    
	INSERT INTO tmp_Variation_Type (
		id_type
        , id_type_temp
		, code
		, name
		, name_plural
		, active
		, display_order
		, created_on
		, created_by
		, is_new
		, name_error
	)
	SELECT
		VT_T.id_type
		, VT_T.id_type
		, VT_T.code
		, VT_T.name
		, VT_T.name_plural
		, VT_T.active
		, VT_T.display_order
		, IFNULL(VT_T.created_on, VT.created_on) AS created_on
		, IFNULL(VT_T.created_by, VT.created_by) AS created_by
		, IFNULL(VT_T.id_type, 0) < 1 AS is_new
		, CASE WHEN IFNULL(VT_T.id_type, 0) < 1 THEN
			CONCAT(
				'New Variation Type: '
                , VT_T.display_order
                , ' - '
                , IFNULL(VT_T.code, '(No Code)')
                , ' - '
                , IFNULL(VT_T.name, '(No Name)')
			)
		ELSE
			CONCAT(
                VT_T.display_order
                , ' - '
                , IFNULL(VT_T.code, '(No Code)')
                , ' - '
                , IFNULL(VT_T.name, '(No Name)')
			)
		END AS name_error
	FROM partsltd_prod.Shop_Variation_Type_Temp VT_T
	LEFT JOIN partsltd_prod.Shop_Variation_Type VT ON VT_T.id_type = VT.id_type
	WHERE VT_T.GUID = a_guid
	;

	INSERT INTO tmp_Variation (
		id_variation
		, id_type
		, code
		, name
		, active
		, display_order
		, created_on
		, created_by
		, has_type
		, is_new
		, name_error
	)
	SELECT 
		V_T.id_variation
        , IFNULL(V_T.id_type, V.id_type) AS id_type
        , V_T.code
        , V_T.name
        , V_T.active
        , V_T.display_order
        , IFNULL(V_T.created_on, V.created_on) AS created_on
        , IFNULL(V_T.created_by, V.created_by) AS created_by
		, NOT ISNULL(t_VT.id_type) AS has_type
	    , IFNULL(V_T.id_variation, 0) < 1 AS is_new
        , CASE WHEN IFNULL(V_T.id_variation, 0) < 1 THEN
			CONCAT(
				'New Variation: '
                , V_T.display_order
                , ' - '
                , IFNULL(V_T.code, '(No Code)')
                , ' - '
                , IFNULL(V_T.name, '(No Name)')
			)
		ELSE
			CONCAT(
                V_T.display_order
                , ' - '
                , IFNULL(V_T.code, '(No Code)')
                , ' - '
                , IFNULL(V_T.name, '(No Name)')
			)
		END AS name_error
	FROM partsltd_prod.Shop_Variation_Temp V_T
	LEFT JOIN partsltd_prod.Shop_Variation V ON V_T.id_variation = V.id_variation
	-- LEFT JOIN partsltd_prod.Shop_Variation_Type VT ON V_T.id_type = VT.id_type
    LEFT JOIN tmp_Variation_Type t_VT ON V_T.id_type = t_VT.id_type
	WHERE V_T.GUID = a_guid
	;
	
	-- Insert missing order records
	INSERT INTO tmp_Variation_Type (
		id_type
        , id_type_temp
		, code
		, name
		, name_plural
		, active
		, display_order
		, created_on
		, created_by
		, is_new
		, name_error
	)
	SELECT
		VT.id_type
		, VT.id_type
		, VT.code
		, VT.name
		, VT.name_plural
		, VT.active
		, VT.display_order
		, VT.created_on
		, VT.created_by
		, 0 AS is_new
		, CONCAT(
			VT.display_order
			, ' - '
			, IFNULL(VT.code, '(No Code)')
			, ' - '
			, IFNULL(VT.name, '(No Name)')
		) AS name_error
	FROM partsltd_prod.Shop_Variation_Type VT
    INNER JOIN tmp_Variation t_V 
		ON VT.id_type = t_V.id_type
        AND t_V.has_type = 0
		AND NOT ISNULL(t_V.id_type)
    ;
    
    UPDATE tmp_Variation t_V
    INNER JOIN tmp_Variation_Type t_VT ON t_V.id_type = t_V.id_type
    SET t_V.has_type = 1
    WHERE t_V.has_type = 0
    ;

    -- Validation
	-- Variation Type
    # id_type
    IF EXISTS (
		SELECT * 
        FROM tmp_Variation_Type t_VT
        INNER JOIN partsltd_prod.Shop_Variation_Type VT ON t_VT.id_type = VT.id_type
        WHERE 1=1
			AND t_VT.id_type > 0
			AND ISNULL(VT.id_type)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'A valid ID is required for the following Product Variation Type(s): '
				, GROUP_CONCAT(t_VT.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Variation_Type t_VT
        INNER JOIN partsltd_prod.Shop_Variation_Type VT ON t_VT.id_type = VT.id_type
        WHERE 1=1
			AND t_VT.id_type > 0
			AND ISNULL(VT.id_type)
		;
    END IF;
    -- Variation
	# id_variation
    IF EXISTS (
		SELECT * 
        FROM tmp_Variation t_V
        INNER JOIN partsltd_prod.Shop_Variation V ON t_V.id_variation = V.id_variation
        WHERE 1=1
			AND t_V.id_variation > 0
			AND ISNULL(V.id_variation)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'A valid ID is required for the following Product Variation(s): '
				, GROUP_CONCAT(t_V.name_error SEPARATOR ', ')
			) AS msg
        FROM tmp_Variation t_V
        INNER JOIN partsltd_prod.Shop_Variation V ON t_V.id_variation = V.id_variation
        WHERE 1=1
			AND t_V.id_variation > 0
			AND ISNULL(V.id_variation)
		;
    END IF;
    # id_type
    IF EXISTS ( SELECT * FROM tmp_Variation t_V WHERE t_V.has_type = 0 LIMIT 1 ) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'A valid ID is required for the following Product Variation(s): '
				, GROUP_CONCAT(t_V.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Variation t_V
        WHERE t_V.has_type = 0
		;
    END IF;
    
    -- Duplicate Variation Type Ids
    -- Duplicate Variation Ids
    -- Duplicate Variation Type Codes
    -- Duplicate Variation Codes
    -- Variation unit measurement with no count unit measurement
    
    -- Permissions
	IF a_debug = 1 THEN
		SELECT 
			a_guid
			, a_id_user
			, FALSE -- get inactive users
			, v_ids_permission_product_variation
			, v_id_access_level_edit
			, NULL -- ids_product
			, 0 -- a_debug
		;
		SELECT * 
		FROM partsltd_prod.Shop_Calc_User_Temp
		WHERE GUID = a_guid
		;
	END IF;
	
	CALL p_shop_calc_user(
		a_guid
		, a_id_user
		, FALSE -- get inactive users
		, v_ids_permission_product_variation
		, v_id_access_level_edit
		, NULL -- ids_product
		, 0 -- a_debug
	);
	
	IF a_debug = 1 THEN
		SELECT * from partsltd_prod.Shop_Calc_User_Temp WHERE GUID = a_guid;
	END IF;
	
	IF EXISTS (SELECT * FROM partsltd_prod.Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = a_guid AND IFNULL(UE_T.can_view, 0) = 0) THEN
		DELETE FROM tmp_Msg_Error;

		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_no_permission
			, v_code_type_error_no_permission
			, CONCAT(
				'You do not have edit permissions for '
				, GROUP_CONCAT(name SEPARATOR ', ') 
			)
		FROM partsltd_prod.Shop_Permission PERM
		INNER JOIN partsltd_prod.Shop_Calc_User_Temp UE_T 
			ON PERM.id_permission = UE_T.id_permission
			AND UE_T.GUID = a_guid
			AND IFNULL(UE_T.can_view, 0) = 0
		;
	END IF;

	CALL partsltd_prod.p_shop_clear_calc_user( 
		a_guid
		, 0 -- a_debug 
	);
    
	IF EXISTS ( SELECT * FROM tmp_Msg_Error WHERE id_type <> v_id_type_error_warning LIMIT 1 ) THEN
		DELETE FROM tmp_Variation_Type;
        DELETE FROM tmp_Variation;
	END IF;
	
	-- Transaction    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		START TRANSACTION;
			INSERT INTO Shop_Product_Change_Set (
				comment
				, updated_last_by
				, updated_last_on
			)
			VALUES (
				a_comment
				, a_id_user
				, v_time_start
			);
			
			SET v_id_change_set := LAST_INSERT_ID();
		
			INSERT INTO partsltd_prod.Shop_Variation_Type (
				id_type_temp
				, code
				, name
				, name_plural
				, active
				, display_order
				, created_on
				, created_by
			)
			SELECT
				t_VT.id_type
				, t_VT.code
				, t_VT.name
				, t_VT.name_plural
				, t_VT.active
				, t_VT.display_order
				, t_VT.created_on
				, t_VT.created_by
			FROM tmp_Variation_Type t_VT
			WHERE t_VT.is_new = 1
			;
			
			UPDATE tmp_Variation_Type t_VT
			INNER JOIN partsltd_prod.Shop_Variation_Type VT ON t_VT.id_type_temp = VT.id_type_temp
			SET 
				t_VT.id_type = VT.id_type
			WHERE t_VT.is_new = 1
			;
            
			UPDATE tmp_Variation t_V
			INNER JOIN tmp_Variation_Type t_VT 
				ON t_V.id_type = t_VT.id_type_temp
				AND t_VT.is_new = 1
			SET 
				t_V.id_type = t_VT.id_type
			;
			
			INSERT INTO partsltd_prod.Shop_Variation (
				id_type
				, code
				, name
				, active
				, display_order
				, created_on
				, created_by
			)
			SELECT
				t_V.id_type
				, t_V.code
				, t_V.name
				, t_V.active
				, t_V.display_order
				, t_V.created_on
				, t_V.created_by
			FROM tmp_Variation t_V
			WHERE t_V.is_new = 1
			;
		
			UPDATE partsltd_prod.Shop_Variation_Type VT
			INNER JOIN tmp_Variation_Type t_VT
				ON VT.id_type = t_VT.id_type
				AND t_VT.is_new = 0
			INNER JOIN tmp_Variation t_V ON t_VT.id_type = t_V.id_type
			SET
				VT.code = t_VT.code
				, VT.name = t_VT.name
				, VT.name_plural = t_VT.name_plural
				, VT.active = t_VT.active
				, VT.display_order = t_VT.display_order
				, VT.created_on = t_VT.created_on
				, VT.created_by = t_VT.created_by
                , VT.id_change_set = v_id_change_set
			;
			
			UPDATE partsltd_prod.Shop_Variation V
			INNER JOIN tmp_Variation t_V
				ON V.id_variation = t_V.id_variation
				AND t_V.is_new = 0
			SET
				V.code = t_V.code
				, V.name = t_V.name
				, V.active = t_V.active
				, V.display_order = t_V.display_order
				, V.created_on = t_V.created_on
				, V.created_by = t_V.created_by
                , V.id_change_set = v_id_change_set
			;
		
			DELETE VT_T
			FROM partsltd_prod.Shop_Variation_Type_Temp VT_T
			WHERE VT_T.GUID = a_guid
			;
			DELETE V_T
			FROM partsltd_prod.Shop_Variation_Temp V_T
			WHERE V_T.GUID = a_guid
			;
			
		COMMIT;
    END IF;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
	INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
	;
    
	IF a_debug = 1 THEN
		SELECT * from tmp_Variation_Type;
		SELECT * from tmp_Variation;
	END IF;

    DROP TEMPORARY TABLE tmp_Variation_Type;
    DROP TEMPORARY TABLE tmp_Variation;
    DROP TEMPORARY TABLE tmp_Msg_Error;
    
	IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
	END IF;
END //
DELIMITER ;;




-- File: 7212_p_shop_save_product_variation_test.sql


-- Clear previous proc
DROP PROCEDURE IF EXISTS partsltd_prod.p_shop_save_product_variation_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_product_variation_test ()
BEGIN
	
	DECLARE v_guid BINARY(36);
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_guid := 'nips';

	SELECT *
	FROM partsltd_prod.Shop_Variation_Type
	;
	SELECT *
	FROM partsltd_prod.Shop_Variation_Type_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Variation
	;
	SELECT *
	FROM partsltd_prod.Shop_Variation_Temp
	;
    
	START TRANSACTION;
    
		DELETE FROM partsltd_prod.Shop_Variation_Type_Temp;
		DELETE FROM partsltd_prod.Shop_Variation_Temp;

		INSERT INTO partsltd_prod.Shop_Variation_Type_Temp (
			id_type
            -- , id_type_temp
            , code
            , name
            , name_plural
            , display_order
            , active
            , GUID
		)
        /* Test 1 - Insert 
        VALUES (
			-1
            -- , -1
            , 'SIZE'
            , 'Size'
            , 'Sizes'
            , 2
            , 1
            , v_guid
        )
        */
        /* Test 2: Alter */
        SELECT
			id_type
            -- , id_type AS id_type_temp
            , code
            , name
            , name_plural
            , display_order
            , active
            , v_guid AS GUID
		FROM partsltd_prod.Shop_Variation_Type
        WHERE id_type = 1
		;
        
		INSERT INTO partsltd_prod.Shop_Variation_Temp (
			id_variation
            , id_type
            , code
            , name
            , display_order
            , active
            , GUID
		)
        /* Test 1 - Insert 
        VALUES (
			-1 -- id_variation
            , -1 -- id_type
            , '300 mL' -- code
            , '300 millilitres' -- name
            , 1 -- display_order
            , 1 -- active
            , v_guid -- 
        )
        */
        /* Test 3 - Insert 
        VALUES (
			-1 -- id_variation
            , 1 -- id_type
            , 'SILVER' -- code
            , 'Silver' -- name
            , 10 -- display_order
            , 1 -- active
            , 'NIPS' -- v_guid -- 
        );
        */
        /* Test 2: Alter */
        SELECT
			id_variation
            , id_type
            , code
            , name
            , display_order
            , active
            , v_guid AS GUID
		FROM partsltd_prod.Shop_Variation
        WHERE id_variation = 2
        UNION
        SELECT
			-1 -- id_variation
            , 1 -- id_type
            , 'GREEN' -- code
            , 'Green' -- name
            , 3 -- display_order
            , 1 -- active
            , v_guid -- 
        ;
        
	COMMIT;
    
	SELECT *
	FROM partsltd_prod.Shop_Variation_Type_Temp
	WHERE GUID = v_guid
    ;
    
	SELECT *
	FROM partsltd_prod.Shop_Variation_Temp
	WHERE GUID = v_guid
    ;
    
    CALL partsltd_prod.p_shop_save_product_variation ( 
		'Test save Variations - add + edit' -- comment
        , v_guid -- guid
        , 1 -- id_user
		, 1 -- debug
    );
    
	SELECT *
	FROM partsltd_prod.Shop_Variation_Type_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Variation_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Variation_Type
	;
	SELECT *
	FROM partsltd_prod.Shop_Variation
	;
    
	CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
END //
DELIMITER ;;

/*
CALL partsltd_prod.p_shop_save_product_variation_test ();

DELETE FROM partsltd_prod.Shop_Variation_Type_Temp;
DELETE FROM partsltd_prod.Shop_Variation_Temp;

DROP TABLE IF EXISTS tmp_Msg_Error;


delete from shop_variation_audit
where id_variation = 3
;
delete from shop_variation_audit
where id_variation = 3
;
delete from shop_variation_type_audit
where id_type = -1
;
delete
-- select *
 from shop_variation_type
where id_type = -1
;

Cannot add or update a child row: a foreign key constraint fails (`partsltd_prod`.`shop_variation_type`, CONSTRAINT `FK_Shop_Variation_Type_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_product_change_set` (`id_change_set`))

*/

-- File: 7219_p_shop_get_many_stock_item.sql


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


-- File: 7220_p_shop_save_stock_item.sql


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
    DECLARE v_id_access_level_edit INT;
    DECLARE v_id_change_set INT;
    DECLARE v_id_permission_product INT;
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_ids_product_permission LONGTEXT;
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
			, id_type INT NULL
			, code VARCHAR(50) NOT NULL
			, msg VARCHAR(4000) NOT NULL
		);
        INSERT INTO tmp_Msg_Error (
			id_type
            , code
            , msg
		)
        SELECT 
			NULL
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
    
    CALL partsltd_prod.p_validate_guid ( a_guid );
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Stock_Item;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    
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
        , name_error VARCHAR(1000) NULL
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
		, IFNULL(IFNULL(SI_T.id_permutation, SI.id_permutation), 0) AS id_permutation
		, TRIM(IFNULL(SI_T.id_pairs_variations, ''))
        , CASE WHEN TRIM(IFNULL(SI_T.id_pairs_variations, '')) = '' THEN 0 ELSE 1 END AS has_variations
		, IFNULL(IFNULL(SI_T.date_purchased, SI.date_purchased), v_time_start) AS date_purchased
		, IFNULL(SI_T.date_received, SI.date_received) AS date_received
		, IFNULL(IFNULL(SI_T.id_location_storage, SI.id_location_storage), 0) AS id_location_storage
		, IFNULL(IFNULL(SI_T.id_currency_cost, SI.id_currency_cost), 0) AS id_currency_cost
		, IFNULL(SI_T.cost_local_VAT_incl, SI.cost_local_VAT_incl) AS cost_local_VAT_incl
		, IFNULL(SI_T.cost_local_VAT_excl, SI.cost_local_VAT_excl) AS cost_local_VAT_excl
		, IFNULL(IFNULL(SI_T.is_sealed, SI.is_sealed), 1) AS is_sealed
		, IFNULL(SI_T.date_unsealed, SI.date_unsealed) AS date_unsealed
		, IFNULL(IFNULL(SI_T.date_expiration, SI.date_expiration), v_time_expire) AS date_expiration
		, IFNULL(IFNULL(SI_T.is_consumed, SI.is_consumed), 0) AS is_consumed
		, IFNULL(SI_T.date_consumed, SI.date_consumed) AS date_consumed
        , IFNULL(IFNULL(SI_T.active, SI.active), 1) AS active
		# , fn_shop_get_product_permutation_name(SI_T.id_permutation)
        , CASE WHEN IFNULL(SI_T.id_stock, 0) < 1 THEN 1 ELSE 0 END AS is_new
	FROM partsltd_prod.Shop_Stock_Item_Temp SI_T
    LEFT JOIN partsltd_prod.Shop_Stock_Item SI ON SI_T.id_stock = SI.id_stock
    LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON SI_T.id_permutation = PP.id_permutation
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
    INNER JOIN partsltd_prod.Shop_Product_Category PC ON P.id_category = PC.id_category
    -- INNER JOIN Shop_Product_Permutation PP ON t_SI.id_product = PP.id_product
	SET t_SI.name_error = CONCAT(
			PC.name,
            ' - ',
            P.name,
            ' - ',
			CASE WHEN IFNULL(t_SI.id_permutation, 0) = 0 THEN '(No permutation)' ELSE fn_shop_get_product_permutation_name ( t_SI.id_permutation ) END
		)
    ;
    
    IF a_debug = 1 THEN
		sElect * from tmp_Stock_Item;
    END IF;
    
    -- Validation
    -- id_stock
    IF EXISTS (
		SELECT * 
        FROM tmp_Stock_Item t_SI 
        LEFT JOIN partsltd_prod.Shop_Stock_Item SI ON t_SI.id_stock = SI.id_stock
        WHERE 1=1
			AND t_SI.id_stock > 0
			AND ISNULL(SI.id_stock)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'Invalid stock item(s): '
				, GROUP_CONCAT(
					CONCAT(
						IFNULL(t_SI.id_stock, '(No Stock Item)')
						, ' - '
						, IFNULL(t_SI.name_error, '(No Product)')
					) SEPARATOR ', '
				)
			) AS msg
		FROM tmp_Stock_Item t_SI
        LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_SI.id_permutation = PP.id_permutation 
        WHERE 1=1
			AND t_SI.id_stock > 0
			AND ISNULL(SI.id_stock)
		;
    END IF;
    -- id_product
    IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE t_SI.id_product = 0 LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
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
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
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
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
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
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
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
			ON t_SI.id_currency_cost = C.id_currency
            AND C.active = 1
        WHERE ISNULL(C.id_currency)
        LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid cost currency: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
        FROM tmp_Stock_Item t_SI
        INNER JOIN partsltd_prod.Shop_Currency C
			ON t_SI.id_currency_cost = C.id_currency
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
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
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
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
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
    IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE NOT ISNULL(t_SI.date_received) AND t_SI.date_received < t_SI.date_purchased LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid received date: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Stock_Item t_SI
		WHERE 1=1
			AND NOT ISNULL(t_SI.date_received)
			AND t_SI.date_received < t_SI.date_purchased
		;
    END IF;
    -- date_unsealed
    IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE NOT ISNULL(t_SI.date_unsealed) AND t_SI.date_unsealed < t_SI.date_purchased LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid unsealed date: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Stock_Item t_SI
		WHERE 1=1
			AND NOT ISNULL(t_SI.date_received)
			AND t_SI.date_received < t_SI.date_purchased
		;
    END IF;
    -- date_expiration
    IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE NOT ISNULL(t_SI.date_expiration) AND t_SI.date_expiration < t_SI.date_purchased LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid expiration date: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Stock_Item t_SI
		WHERE 1=1
			AND NOT ISNULL(t_SI.date_expiration)
			AND t_SI.date_expiration < t_SI.date_purchased
		;
    END IF;
    -- date_consumed
    IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE NOT ISNULL(t_SI.date_consumed) AND t_SI.date_consumed < t_SI.date_purchased LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid consumed date: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Stock_Item t_SI
		WHERE 1=1
			AND NOT ISNULL(t_SI.date_consumed)
			AND t_SI.date_consumed < t_SI.date_purchased
		;
    END IF;
    
    -- Permissions
	SET v_ids_product_permission := ( SELECT GROUP_CONCAT(t_SI.id_product SEPARATOR ',') FROM tmp_Stock_Item t_SI );
    
	IF NOT ISNULL(v_ids_product_permission) THEN
		SET v_id_permission_product = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
		
		CALL p_shop_calc_user(
			a_guid
            , a_id_user
            , FALSE -- a_get_inactive_users
            , v_id_permission_product
            , v_id_access_level_edit
            , v_ids_product_permission
            , 0 -- a_debug
		);
		
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
		
		CALL p_shop_clear_calc_user( 
			a_guid
			, 0 -- a_debug
		);

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
				INSERT INTO Shop_Product_Change_Set ( 
					comment
					, updated_last_by
				)
				VALUES ( 
					a_comment,
					a_id_user
				)
				;
				
				SET v_id_change_set := LAST_INSERT_ID();
                
				-- select * from partsltd_prod.Shop_Stock_Item
				UPDATE partsltd_prod.Shop_Stock_Item SI
				INNER JOIN tmp_Stock_Item t_SI
					ON SI.id_stock = t_SI.id_stock
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
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
	INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
	;
    
	IF a_debug = 1 THEN
		SELECT * from tmp_Stock_Item;
	END IF;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Stock_Item;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    
	IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
	END IF;
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
	latency_manufacture,
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
		, 14 -- latency_manufacture,
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



-- File: 7220_p_shop_save_stock_item_test.sql


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
			, cost_local_VAT_excl
			, cost_local_VAT_incl
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
			, '2025-09-05 00:00' -- date_purchased
			, NULL -- date_received
			, 1 -- id_location_storage
			, 1 -- id_currency_cost
			, 10 -- cost_local_VAT_excl
			, 12  -- cost_local_VAT_incl
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
		, 0 -- debug
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

CALL partsltd_prod.p_shop_save_stock_item_test ();

DELETE FROM partsltd_prod.Shop_Stock_Item_Temp;

/*
update shop_product p set p.has_variations = 0 where id_product = 4
DROP TABLE IF EXISTS tmp_Msg_Error;
*/

-- File: 7221_p_get_many_shop_product_price_and_discount_and_delivery_option.sql
-- USE partsltd_prod;

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
		*(
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
        
        DELETE t_P
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
        t_P.latency_manufacture,
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


-- File: 7223_p_shop_get_many_stripe_price_new.sql



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


-- File: 7312_p_shop_save_user.sql



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


-- File: 7313_p_get_many_user.sql


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
			id_type,
			code,
			msg
		)
		VALUES (
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



CALL p_get_many_user (NULL, 'google-oauth2|109567376920138999933', False, False, False, NULL, 'google-oauth2|109567376920138999933', 0);
/*
	NULL # a_id_user
    , 'auth0|6582b95c895d09a70ba10fef' # a_id_user_auth0
    , 0 # a_get_all_user
	, 0 # a_get_inactive_user
    , 0 # a_get_first_user_only
	, NULL # a_ids_user
	, 'auth0|6582b95c895d09a70ba10fef' # a_ids_user_auth0
    , 0 -- a_debug
);*/

/*
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


-- File: 7321_p_shop_save_user_basket.sql



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
		CALL p_split(v_guid, a_ids_permutation_basket, ',');
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
		CALL p_split(v_guid, a_quantities_permutation_basket, ',');
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


-- File: 7400_p_shop_save_supplier.sql




-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_supplier;


DELIMITER //
CREATE PROCEDURE p_shop_save_supplier (
	IN a_comment VARCHAR(500)
	, IN a_guid BINARY(36)
    , IN a_id_user INT
    , IN a_debug BIT
)
BEGIN
	DECLARE v_code_type_error_bad_data VARCHAR(50);
	DECLARE v_code_type_error_no_permission VARCHAR(50);
    DECLARE v_id_access_level_edit INT;
    DECLARE v_id_change_set INT;
    DECLARE v_id_permission_supplier INT;
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_type_error_no_permission INT;
    DECLARE v_time_start TIMESTAMP(6);

    DECLARE exit handler for SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            @sqlstate = RETURNED_SQLSTATE
            , @errno = MYSQL_ERRNO
            , @text = MESSAGE_TEXT
		;
        
        ROLLBACK;
        
		CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
			display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
			, id_type INT NULL
			, code VARCHAR(50) NOT NULL
			, msg VARCHAR(4000) NOT NULL
		);
        INSERT INTO tmp_Msg_Error (
			id_type
            , code
            , msg
		)
        SELECT 
			id_type
            , @errno
            , @text
		FROM partsltd_prod.Shop_Msg_Error_Type MET
        WHERE code = 'MYSQL_ERROR'
		;
        SELECT *
        FROM tmp_Msg_Error;
		DROP TABLE IF EXISTS tmp_Msg_Error;
    END;

	SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_code_type_error_bad_data := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_bad_data := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_code_type_error_no_permission := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION' LIMIT 1);
    SET v_id_type_error_no_permission := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_no_permission LIMIT 1);
	SET v_id_permission_supplier := (SELECT id_permission FROM partsltd_prod.Shop_Permission WHERE code = 'STORE_SUPPLIER' LIMIT 1);
	SET v_id_access_level_EDIT := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
	CALL p_validate_guid ( a_guid );
	SET a_comment := TRIM(IFNULL(a_comment, ''));
    
	DROP TEMPORARY TABLE IF EXISTS tmp_Supplier;
	DROP TEMPORARY TABLE IF EXISTS tmp_Supplier_Address;
	DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;

    CREATE TEMPORARY TABLE tmp_Supplier (
		id_supplier_temp INT NOT NULL
		, id_supplier INT NULL
		, id_currency INT NOT NULL
		, name_company VARCHAR(255) NOT NULL
		, name_contact VARCHAR(255) NULL
		, department_contact VARCHAR(255) NULL
		, phone_number VARCHAR(50) NULL
		, fax VARCHAR(50) NULL
		, email VARCHAR(255) NOT NULL
		, website VARCHAR(255) NULL
		, active BIT NOT NULL
		, name_error VARCHAR(1000) NOT NULL
		, is_new BIT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Supplier_Address (
		id_address INT NOT NULL
        , id_supplier INT NOT NULL
        , id_region INT NOT NULL
        , postcode VARCHAR(20) NOT NULL
        , address_line_1 VARCHAR(256) NOT NULL
        , address_line_2 VARCHAR(256) NOT NULL
        , city VARCHAR(256) NOT NULL
		, county VARCHAR(256) NOT NULL
        , active BIT NOT NULL
		, name_error VARCHAR(1000) NOT NULL
		, is_new BIT NOT NULL
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
		, id_type INT NOT NULL
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
    
    
	INSERT INTO tmp_Supplier (
		id_supplier_temp
        , id_supplier
		, id_currency
		, name_company
		, name_contact
		, department_contact
		, phone_number
		, fax
		, email
		, website
		, active
		, name_error
		, is_new
	)
	SELECT
		S_T.id_supplier
		, S_T.id_supplier
		, S_T.id_currency
		, S_T.name_company
		, S_T.name_contact
		, S_T.department_contact
		, S_T.phone_number
		, S_T.fax
		, S_T.email
		, S_T.website
		, S_T.active
		, IFNULL(S_T.name_company, IFNULL(S_T.email, IFNULL(S_T.website, IFNULL(S_T.name_contact, '(No Supplier)'))))
		, IFNULL(S_T.id_supplier, 0) < 1
	FROM partsltd_prod.Shop_Supplier_Temp S_T
	WHERE GUID = a_guid
	;
    
	INSERT INTO tmp_Supplier_Address (
		id_address
		, id_supplier
        , id_region
        , postcode
        , address_line_1
        , address_line_2
        , city
        , county
		, active
		, name_error
		, is_new
	)
	SELECT
		SA_T.id_address
		, SA_T.id_supplier
        , SA_T.id_region
        , SA_T.postcode
        , SA_T.address_line_1
        , SA_T.address_line_2
        , SA_T.city
        , SA_T.county
		, SA_T.active
		, IFNULL(SA_T.postcode, IFNULL(SA_T.city, IFNULL(SA_T.county, IFNULL(SA_T.address_line_1, IFNULL(SA_T.address_line_2, '(No Supplier)'))))) AS name_error
		, IFNULL(SA_T.id_address, 0) < 1 AS is_new
	FROM partsltd_prod.Shop_Supplier_Address_Temp SA_T
	WHERE GUID = a_guid
	;
    
    -- Validation
    -- Suppliers
    /*
    # id_address
    IF EXISTS (
		SELECT * 
        FROM tmp_Supplier t_S 
        LEFT JOIN partsltd_prod.Shop_Address A ON t_S.id_address = A.id_address 
        WHERE 1=1
			AND (
				t_S.id_address = 0
                OR A.active = 0
			)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'The following supplier(s) have an invalid or inactive Address: '
				, GROUP_CONCAT(t_S.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier t_S
        LEFT JOIN partsltd_prod.Shop_Address A ON t_S.id_address = A.id_address
        WHERE 1=1
			AND (
				t_S.id_address = 0
                OR A.active = 0
			)
		;
    END IF;
    */
    # id_currency
    IF EXISTS (
		SELECT * 
        FROM tmp_Supplier t_S
        LEFT JOIN partsltd_prod.Shop_Currency C ON t_S.id_currency = C.id_currency 
        WHERE 1=1
			AND (
				t_S.id_currency = 0
                OR C.active = 0
			)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'The following supplier(s) have an invalid or inactive Currency: '
				, GROUP_CONCAT(t_S.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier t_S
        LEFT JOIN partsltd_prod.Shop_Currency C ON t_S.id_currency = C.id_currency 
        WHERE 1=1
			AND (
				t_S.id_currency = 0
                OR C.active = 0
			)
		;
    END IF;
 	# name_company
    IF EXISTS (SELECT * FROM tmp_Supplier t_S WHERE ISNULL(t_S.name_company) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following supplier(s) do not have a name: ', GROUP_CONCAT(IFNULL(t_S.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Supplier t_S
		WHERE ISNULL(t_S.name_company)
		;
    END IF;
 	# email
    IF EXISTS (SELECT * FROM tmp_Supplier t_S WHERE ISNULL(t_S.email) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following supplier(s) do not have an email: ', GROUP_CONCAT(IFNULL(t_S.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Supplier t_S
		WHERE ISNULL(t_S.email)
		;
    END IF;
    # duplicate
    IF EXISTS (SELECT COUNT(*) FROM tmp_Supplier t_S GROUP BY t_S.id_supplier HAVING COUNT(*) > 1) THEN 
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following supplier(s) are duplicates: ', GROUP_CONCAT(IFNULL(t_S.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Supplier t_S
        GROUP BY t_S.id_supplier
        HAVING COUNT(*) > 1
		;
    END IF;
    
    -- Addresses
    # id_supplier
    IF EXISTS (
		SELECT * 
        FROM tmp_Supplier_Address t_SA
        LEFT JOIN partsltd_prod.Shop_Supplier S ON t_SA.id_supplier = S.id_supplier
        WHERE 1=1
			AND (
				t_SA.id_supplier = 0
                OR S.active = 0
			)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'The following supplier address(es) have an invalid or inactive Supplier: '
				, GROUP_CONCAT(t_S.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier t_S
        LEFT JOIN partsltd_prod.Shop_Supplier S ON t_SA.id_supplier = S.id_supplier
        WHERE 1=1
			AND (
				t_SA.id_supplier = 0
                OR S.active = 0
			)
		;
    END IF;
    # id_region
    IF EXISTS (
		SELECT * 
        FROM tmp_Supplier_Address t_SA
        LEFT JOIN partsltd_prod.Shop_Region R ON t_SA.id_region = R.id_region
        WHERE 1=1
			AND (
				t_SA.id_region = 0
                OR R.active = 0
			)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'The following supplier address(es) have an invalid or inactive Supplier: '
				, GROUP_CONCAT(t_S.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier t_S
        LEFT JOIN partsltd_prod.Shop_Region R ON t_SA.id_region = R.id_region
        WHERE 1=1
			AND (
				t_SA.id_region = 0
                OR R.active = 0
			)
		;
    END IF;
    # duplicate
    IF EXISTS (SELECT COUNT(*) FROM tmp_Supplier_Address t_SA GROUP BY t_SA.id_address HAVING COUNT(*) > 1) THEN 
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following supplier address(es) are duplicates: ', GROUP_CONCAT(IFNULL(t_S.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Supplier_Address t_SA
        GROUP BY t_SA.id_address
        HAVING COUNT(*) > 1
		;
    END IF;

    -- Permissions
	IF a_debug = 1 THEN
		SELECT 
			a_guid
			, a_id_user
			, FALSE -- get inactive users
			, v_id_permission_supplier
			, v_id_access_level_edit
			, '' -- ids_product
			, 0 -- a_debug
		;
		SELECT * from partsltd_prod.Shop_Calc_User_Temp;
	END IF;
	
	CALL p_shop_calc_user(
		a_guid
		, a_id_user
		, FALSE -- get inactive users
		, v_id_permission_supplier
		, v_id_access_level_edit
		, '' -- ids_product
		, 0 -- a_debug
	);
	
	IF a_debug = 1 THEN
		SELECT * from partsltd_prod.Shop_Calc_User_Temp WHERE GUID = a_guid;
	END IF;
	
	IF NOT EXISTS (SELECT can_view FROM partsltd_prod.Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = a_guid) THEN
		DELETE FROM tmp_Msg_Error;

		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		VALUES (
			v_id_type_error_no_permission
			, v_code_type_error_no_permission
			, CONCAT('You do not have view permissions for ', (SELECT name FROM partsltd_prod.Shop_Permission WHERE id_permission = v_id_permission_supplier LIMIT 1))
		)
		;
	END IF;

	CALL partsltd_prod.p_shop_clear_calc_user( 
		a_guid
        , 0 -- a_debug
	);
    
	IF EXISTS ( SELECT * FROM tmp_Msg_Error LIMIT 1 ) THEN
		DELETE FROM tmp_Supplier;
	END IF;
    
    
	-- Transaction    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN		
		START TRANSACTION;
			INSERT INTO partsltd_prod.Shop_User_Change_Set (
				comment
				, updated_last_by
				, updated_last_on
			)
			VALUES (
				a_comment
				, a_id_user
				, v_time_start
			);
			
			SET v_id_change_set := LAST_INSERT_ID();
			
			INSERT INTO partsltd_prod.Shop_Supplier (
				id_supplier_temp
				, id_currency
				, name_company
				, name_contact
				, department_contact
				, phone_number
				, fax
				, email
				, website
				, active
				, id_change_set
			)
			SELECT
				t_S.id_supplier
				, t_S.id_currency
				, t_S.name_company
				, t_S.name_contact
				, t_S.department_contact
				, t_S.phone_number
				, t_S.fax
				, t_S.email
				, t_S.website
				, t_S.active
				, v_id_change_set
			FROM tmp_Supplier t_S
			WHERE t_S.is_new = 1
			;
			
			UPDATE tmp_Supplier t_S
			INNER JOIN partsltd_prod.Shop_Supplier S ON t_S.id_supplier_temp = S.id_supplier_temp
			SET 
				t_S.id_supplier = S.id_supplier
			WHERE t_S.is_new = 1
			;
            
			UPDATE tmp_Supplier_Address t_SA
			INNER JOIN tmp_Supplier t_S ON t_SA.id_supplier = t_S.id_supplier_temp
			SET 
				t_SA.id_supplier = t_S.id_supplier
			WHERE t_S.is_new = 1
			;
            
			UPDATE partsltd_prod.Shop_Supplier S
			INNER JOIN tmp_Supplier t_S 
				ON S.id_supplier = t_S.id_supplier
				AND t_S.is_new = 0
			SET 
				S.id_currency = t_S.id_currency
				, S.name_company = t_S.name_company
				, S.name_contact = t_S.name_contact
				, S.department_contact = t_S.department_contact
				, S.phone_number = t_S.phone_number
				, S.fax = t_S.fax
				, S.email = t_S.email
				, S.website = t_S.website
				, S.active = t_S.active
				, S.id_change_set = v_id_change_set
				/*
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
				*/
			;
            
            INSERT INTO partsltd_prod.Shop_Supplier_Address (
				id_supplier
                , id_region
                , postcode
                , address_line_1
				, address_line_2
                , city
                , county
                , active
				, id_change_set
            )
            SELECT 
				t_SA.id_supplier
                , t_SA.id_region
                , t_SA.postcode
                , t_SA.address_line_1
				, t_SA.address_line_2
                , t_SA.city
                , t_SA.county
                , t_SA.active
				, v_id_change_set
			FROM tmp_Supplier_Address t_SA
            WHERE t_SA.is_new = 1
            ;
            
            UPDATE partsltd_prod.Shop_Supplier_Address SA
			INNER JOIN tmp_Supplier_Address t_SA 
				ON SA.id_address = t_SA.id_address
                AND t_SA.is_new = 0
            SET
				SA.id_supplier = t_SA.id_supplier
                , SA.id_region = t_SA.id_region
                , SA.postcode = t_SA.postcode
                , SA.address_line_1 = t_SA.address_line_1
				, SA.address_line_2 = t_SA.address_line_2
                , SA.city = t_SA.city
                , SA.county = t_SA.county
                , SA.active = t_SA.active
				, SA.id_change_set = v_id_change_set
            ;
		COMMIT;
    END IF;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
	INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
	;
    
	IF a_debug = 1 THEN
		SELECT 'A_DEBUG';
		SELECT * from tmp_Supplier;
        SELECT * from tmp_Supplier_Address;
	END IF;

    DROP TEMPORARY TABLE IF EXISTS tmp_Supplier;
	DROP TEMPORARY TABLE IF EXISTS tmp_Supplier_Address;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    
	IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
	END IF;
END //
DELIMITER ;;


-- SELECT * FROM Shop_Supplier;

delete from shop_supplier_audit where id_supplier = 9;
delete from shop_supplier where id_supplier = 9;
delete from shop_supplier_address_audit where id_address = -4;
delete from shop_supplier_address where id_address = -4;

-- File: 7400_p_shop_save_supplier_temp.sql


-- Clear previous proc
DROP PROCEDURE IF EXISTS partsltd_prod.p_shop_save_supplier_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_supplier_test ()
BEGIN
	
	DECLARE v_guid BINARY(36);
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_guid := 'nips';

	SELECT *
	FROM partsltd_prod.Shop_Supplier
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Address
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Address_Temp
	;

	START TRANSACTION;
		
		INSERT INTO partsltd_prod.Shop_Supplier_Temp (
			id_supplier
			, id_currency
			, name_company
			, name_contact
			, department_contact
			, phone_number
			, fax
			, email
			, website
			, active
			, guid
		)
        /* Test 1 - Insert 
		VALUES (
			-3
            , 1
            , 'Asda'
            , ''
            , NULL
            , ''
            , '123'
            , 'test mail'
            , 'test url'
			, 1 -- active
			, v_guid
		)
        */
        /* Test 2 - Update */
        SELECT
			id_supplier
			, id_currency
			, name_company
			, 'Nat' AS name_contact
			, 'Butchery' AS department_contact
			, phone_number
			, fax
			, email
			, website
			, active
			, v_guid
		FROM partsltd_prod.Shop_Supplier S
        WHERE S.id_supplier = 2
        ;
		
        /*
		INSERT INTO partsltd_prod.Shop_Supplier_Address_Temp (
			id_address
            , id_supplier
			, id_region
			, postcode
			, address_line_1
			, address_line_2
			, city
			, county
            , active
            , GUID
        )
        / Test 1 - Insert 
        VALUES (
			-4
			, -3
            , 1
            , 'test postcode'
            , 'test'
            , 'test'
            , 'test'
            , 'cunty'
            , 1
            , v_guid
        )
        /
        / Test 2 - Update /
        SELECT
			id_address
            , id_supplier
			, id_region
			, postcode
			, address_line_1
			, address_line_2
			, city
			, county
            , active
			, v_guid
		FROM partsltd_prod.Shop_Supplier_Address SA
        WHERE SA.id_supplier = 2
        ;
        */
        
	COMMIT;
    
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Temp
	WHERE GUID = v_guid
    ;
    
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Address_Temp
	WHERE GUID = v_guid
    ;
    
    CALL partsltd_prod.p_shop_save_supplier ( 
		'Test save Supplier' -- comment
        , v_guid -- guid
        , 1 -- id_user
		, 1 -- debug
    );
    
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Address_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Address
	;
    
	CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
END //
DELIMITER ;;

/*
CALL partsltd_prod.p_shop_save_supplier_test ();

DELETE FROM partsltd_prod.Shop_Supplier_Temp;
DELETE FROM partsltd_prod.Shop_Supplier_Address_Temp;

DROP TABLE IF EXISTS tmp_Msg_Error;

Cannot add or update a child row: a foreign key constraint fails (`partsltd_prod`.`shop_supplier`, CONSTRAINT `FK_Shop_Supplier_id_change_set` FOREIGN KEY (`id_change_set`) REFERENCES `shop_sales_and_purchasing_change_set` (`id_change_set`))

*/

-- File: 7401_p_shop_get_many_supplier.sql


DROP PROCEDURE IF EXISTS p_shop_get_many_supplier;

DELIMITER //
CREATE PROCEDURE p_shop_get_many_supplier (
	IN a_id_user INT
    , IN a_get_all_supplier BIT
	, IN a_get_inactive_supplier BIT
	, IN a_ids_supplier TEXT
    , IN a_debug BIT
)
BEGIN
    DECLARE v_code_type_error_bad_data VARCHAR(50);
	DECLARE v_code_type_error_no_permission VARCHAR(50);
    DECLARE v_guid BINARY(36);
    DECLARE v_has_filter_supplier BIT;
    DECLARE v_id_access_level_view INT;
    DECLARE v_id_permission_supplier INT;
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_type_error_no_permission INT;
    DECLARE v_time_start TIMESTAMP(6);
    
	SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_code_type_error_bad_data := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_bad_data := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_code_type_error_no_permission := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
    SET v_id_type_error_no_permission := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_no_permission);
	SET v_id_permission_supplier := (SELECT id_permission FROM partsltd_prod.Shop_Permission WHERE code = 'STORE_SUPPLIER' LIMIT 1);
    
	SET a_get_all_supplier := IFNULL(a_get_all_supplier, 0);
	SET a_get_inactive_supplier := IFNULL(a_get_inactive_supplier, 0);
	SET a_ids_supplier := TRIM(IFNULL(a_ids_supplier, ''));
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Supplier;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    DROP TEMPORARY TABLE IF EXISTS tmp_Split;
    
    CREATE TEMPORARY TABLE tmp_Supplier (
		id_supplier INT NOT NULL
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		id_type INT NOT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Split (
		substring VARCHAR(4000) NOT NULL
        , as_int INT NULL
	);
    DELETE FROM tmp_Split;
    
    
    -- Parse filters
    SET v_has_filter_supplier = CASE WHEN a_ids_supplier = '' THEN 0 ELSE 1 END;

	IF a_debug = 1 THEN
		SELECT 
			v_has_filter_supplier
		;
    END IF;

    -- Suppliers
    IF v_has_filter_supplier = 1 THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_supplier, ',', a_debug);
		
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
            LEFT JOIN partsltd_prod.Shop_Supplier S ON t_S.as_int = S.id_supplier
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(S.id_supplier)
				OR (
					S.active = 0
					AND a_get_inactive_supplier = 0
				)
		) THEN
			INSERT INTO tmp_Msg_Error (
				id_type,
				code,
				msg
			)
			SELECT
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive Supplier IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Supplier S ON t_S.as_int = S.id_supplier
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(S.id_supplier)
				OR (
					S.active = 0
					AND a_get_inactive_supplier = 0
				)
			;
		ELSE
			INSERT INTO tmp_Supplier (
				id_supplier
			)
			SELECT 
				S.id_supplier
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_Supplier S ON t_S.as_int = S.id_supplier
			WHERE (
					a_get_all_supplier = 1
					OR (
						v_has_filter_supplier = 1
						AND NOT ISNULL(t_S.as_int)
					)
				)
				AND (
					a_get_inactive_supplier = 1
					OR S.active = 1
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;

    -- Permissions	
	IF a_debug = 1 THEN
		SELECT 
			v_guid
			, a_id_user
			, FALSE -- get inactive users
			, v_id_permission_supplier
			, v_id_access_level_view
			, '' -- ids_product
			, 0 -- a_debug
		;
		SELECT * from Shop_Calc_User_Temp;
	END IF;
	
	CALL p_shop_calc_user(
		v_guid
		, a_id_user
		, FALSE -- get inactive users
		, v_id_permission_supplier
		, v_id_access_level_view
		, '' -- ids_product
		, 0 -- a_debug
	);
	
	IF a_debug = 1 THEN
		SELECT * from Shop_Calc_User_Temp;
	END IF;
	
	IF NOT EXISTS (SELECT can_view FROM Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
		DELETE FROM tmp_Msg_Error;

		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		VALUES (
			v_id_type_error_no_permission
			, v_code_type_error_no_permission
			, CONCAT('You do not have view permissions for ', (SELECT name FROM Shop_Permission WHERE id_permission = v_id_permission_supplier LIMIT 1))
		)
		;
	END IF;
    
	IF EXISTS ( SELECT * FROM tmp_Msg_Error LIMIT 1 ) THEN
		DELETE FROM tmp_Supplier;
	END IF;
    
    -- Returns    
    # Suppliers
    SELECT 
		t_S.id_supplier,
		S.id_currency,
        C.code AS code_currency,
        C.symbol AS symbol_currency,
        S.name_company,
		S.name_contact,
		S.department_contact,
		S.phone_number,
		S.fax,
		S.email,
		S.website,
		S.active
    FROM tmp_Supplier t_S
    INNER JOIN partsltd_prod.Shop_Supplier S ON t_S.id_supplier = S.id_supplier
    LEFT JOIN partsltd_prod.Shop_Currency C ON S.id_currency = C.id_currency
	;
    
    # Supplier Addresses
    SELECT 
		t_S.id_supplier
		, SA.id_address
        , SA.id_region
        , R.name AS name_region
        , SA.postcode
        , SA.address_line_1
        , SA.address_line_2
        , SA.city
        , SA.county
        , SA.active
    FROM tmp_Supplier t_S
    INNER JOIN partsltd_prod.Shop_Supplier S ON t_S.id_supplier = S.id_supplier
    INNER JOIN partsltd_prod.Shop_Supplier_Address SA ON S.id_supplier = SA.id_supplier
    LEFT JOIN partsltd_prod.Shop_Region R ON SA.id_region = R.id_region
	;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
    INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
    ;
    
    IF a_debug = 1 THEN
		SELECT * from tmp_Supplier;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tmp_Supplier;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    DROP TEMPORARY TABLE IF EXISTS tmp_Split;
	
    IF a_debug = 1 THEN
		CALL p_debug_timing_reporting( v_time_start );
    END IF;
END //
DELIMITER ;;


/*

CALL p_shop_get_many_supplier (
	1 -- 'auth0|6582b95c895d09a70ba10fef' # a_id_user
    , 1 # a_get_all_supplier
	, 0 # a_get_inactive_supplier
	, '' # a_ids_supplier
    , 0 # a_debug
);

*/

-- File: 7403_p_shop_save_supplier_purchase_order.sql




-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_supplier_purchase_order;

DROP TABLE IF EXISTS tmp_Supplier_Purchase_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Msg_Error;

DELIMITER //
CREATE PROCEDURE p_shop_save_supplier_purchase_order (
	IN a_comment VARCHAR(500)
	, IN a_guid BINARY(36)
    , IN a_id_user INT
    , IN a_debug BIT
)
BEGIN
	DECLARE v_code_type_error_bad_data VARCHAR(50);
	DECLARE v_code_type_error_no_permission VARCHAR(50);
	DECLARE v_code_type_error_warning VARCHAR(50);
    DECLARE v_id_access_level_edit INT;
    DECLARE v_id_change_set INT;
    DECLARE v_id_permission_supplier_purchase_order VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_type_error_no_permission INT;
    DECLARE v_id_type_error_warning INT;
	DECLARE v_ids_product_permission TEXT;
    DECLARE v_time_start TIMESTAMP(6);

    DECLARE exit handler for SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            @sqlstate = RETURNED_SQLSTATE
            , @errno = MYSQL_ERRNO
            , @text = MESSAGE_TEXT
		;
        
        ROLLBACK;
        
		CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
			display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
			, id_type INT NULL
			, code VARCHAR(50) NOT NULL
			, msg VARCHAR(4000) NOT NULL
		);
        INSERT INTO tmp_Msg_Error (
			id_type
            , code
            , msg
		)
        SELECT 
			MET.id_type
            , @errno
            , @text
		FROM partsltd_prod.Shop_Msg_Error_Type MET
        WHERE code = 'MYSQL_ERROR'
		;
        SELECT *
        FROM tmp_Msg_Error;
		DROP TABLE IF EXISTS tmp_Msg_Error;
    END;
    
	SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_code_type_error_bad_data := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_bad_data := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_code_type_error_no_permission := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION' LIMIT 1);
    SET v_id_type_error_no_permission := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_no_permission LIMIT 1);
    SET v_code_type_error_warning := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'WARNING' LIMIT 1);
    SET v_id_type_error_warning := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_warning LIMIT 1);
	SET v_id_permission_supplier_purchase_order := (SELECT GROUP_CONCAT(id_permission SEPARATOR ',') FROM partsltd_prod.Shop_Permission WHERE code IN ('STORE_SUPPLIER', 'STORE_SUPPLIER_PURCHASE_ORDER', 'STORE_PRODUCT'));
	SET v_id_access_level_edit := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
	CALL p_validate_guid ( a_guid );
	SET a_comment := TRIM(IFNULL(a_comment, ''));
    
	DROP TEMPORARY TABLE IF EXISTS tmp_Supplier_Purchase_Order;
	DROP TEMPORARY TABLE IF EXISTS tmp_Supplier_Purchase_Order_Product_Link;
	DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;

    -- Temporary tables
    CREATE TEMPORARY TABLE tmp_Supplier_Purchase_Order (
		id_order INT NOT NULL PRIMARY KEY
        , id_order_temp INT NOT NULL
		, id_supplier_ordered INT NOT NULL
		, id_currency_cost INT NOT NULL
		, cost_total_local_VAT_excl FLOAT NULL
		, cost_total_local_VAT_incl FLOAT NULL
        , active BIT NOT NULL
		, is_new BIT NOT NULL
		, name_error VARCHAR(1000) NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Supplier_Purchase_Order_Product_Link (
		id_link INT NOT NULL PRIMARY KEY
		, id_order INT NOT NULL
        , id_permutation INT NOT NULL
		-- , id_currency_cost INT NOT NULL
		, quantity_ordered FLOAT NOT NULL
		, id_unit_quantity INT NOT NULL
		, quantity_received FLOAT NULL
		, latency_delivery_days INT NOT NULL
		, display_order INT NOT NULL
        , active BIT NOT NULL
		, cost_total_local_VAT_excl FLOAT NOT NULL
		, cost_total_local_VAT_incl FLOAT NOT NULL
		, cost_unit_local_VAT_excl FLOAT NOT NULL
		, cost_unit_local_VAT_incl FLOAT NOT NULL
		, has_order BIT NULL
		, is_new BIT NOT NULL
		, name_error VARCHAR(1000) NULL
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
		, id_type INT NOT NULL
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
    
	INSERT INTO tmp_Supplier_Purchase_Order (
		id_order
        , id_order_temp
		, id_supplier_ordered
		, id_currency_cost
        , active
        , is_new
        , name_error
	)
	SELECT
		SPO_T.id_order
		, SPO_T.id_order
		, IFNULL(IFNULL(SPO_T.id_supplier_ordered, SPO.id_supplier_ordered), 0) AS id_supplier_ordered
		, IFNULL(IFNULL(SPO_T.id_currency_cost, SPO.id_currency_cost), 0) AS id_currency_cost
        , IFNULL(IFNULL(SPO_T.active, SPO.active), 1) AS active
        , ISNULL(SPO.id_order) AS is_new
        , CONCAT(
			IFNULL(S.name_company, '(No Supplier)')
            , ' - '
            , IFNULL(SPO.created_on, '(No creation date)')
            , ' - '
            , IFNULL(C.symbol, '(No Currency)')
            , ' '
            , IFNULL(IFNULL(SPO.cost_total_local_vat_excl, SPO.cost_total_local_vat_incl), '(No cost)')
		) AS name_error
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Temp SPO_T
	LEFT JOIN partsltd_prod.Shop_Supplier_Purchase_Order SPO ON SPO_T.id_order = SPO.id_order
    LEFT JOIN partsltd_prod.Shop_Supplier S ON SPO_T.id_supplier_ordered = S.id_supplier
    LEFT JOIN partsltd_prod.Shop_Currency C ON SPO_T.id_currency_cost = C.id_currency
	WHERE SPO_T.GUID = a_guid
	;

	INSERT INTO tmp_Supplier_Purchase_Order_Product_Link (
		id_link
		, id_order
		, id_permutation
		-- , id_currency_cost
		, id_unit_quantity
		, quantity_ordered
		, quantity_received
		, latency_delivery_days
		, display_order
		, cost_total_local_VAT_excl
		, cost_total_local_VAT_incl
		, cost_unit_local_VAT_excl
		, cost_unit_local_VAT_incl
        , active
		, has_order
		, is_new
	)
	SELECT 
		IFNULL(SPOPL_T.id_link, 0) AS id_link
		, IFNULL(IFNULL(SPOPL_T.id_order, SPOPL.id_order), 0) AS id_order
		, IFNULL(
			IFNULL(
				IFNULL(
					SPOPL_T.id_permutation
                    , CASE WHEN NOT ISNULL(SPOPL_T.id_product) AND NOT ISNULL(SPOPL_T.csv_list_variations) THEN
						partsltd_prod.fn_shop_get_id_product_permutation_from_variation_csv_list(SPOPL_T.id_product, SPOPL_T.csv_list_variations)
					ELSE NULL END
				)
                , SPOPL.id_permutation
			)
            , 0
		) AS id_permutation
		-- , IFNULL(IFNULL(SPOPL_T.id_currency_cost, SPOPL.id_currency_cost), 0) AS id_currency_cost
		, IFNULL(IFNULL(SPOPL_T.id_unit_quantity, SPOPL.id_unit_quantity), 0) AS id_unit_quantity
		, IFNULL(IFNULL(SPOPL_T.quantity_ordered, SPOPL.quantity_ordered), 0) AS quantity_ordered
		, IFNULL(SPOPL_T.quantity_received, SPOPL.quantity_received) AS quantity_received
		, IFNULL(SPOPL_T.latency_delivery_days, SPOPL.latency_delivery_days) AS latency_delivery_days
		, RANK() OVER (PARTITION BY IFNULL(IFNULL(SPOPL_T.id_order, SPOPL.id_order), 0) ORDER BY IFNULL(IFNULL(SPOPL_T.display_order, SPOPL.display_order), 0)) AS display_order
		, IFNULL(IFNULL(SPOPL_T.cost_total_local_VAT_excl, SPOPL.cost_total_local_VAT_excl), 0) AS cost_total_local_VAT_excl
		, IFNULL(IFNULL(SPOPL_T.cost_total_local_VAT_incl, SPOPL.cost_total_local_VAT_incl), 0) AS cost_total_local_VAT_incl
		, IFNULL(SPOPL_T.cost_total_local_VAT_excl / SPOPL_T.quantity_ordered, SPOPL.cost_unit_local_VAT_excl) AS cost_unit_local_VAT_excl
		, IFNULL(SPOPL_T.cost_total_local_VAT_incl / SPOPL_T.quantity_ordered, SPOPL.cost_unit_local_VAT_incl) AS cost_unit_local_VAT_incl
		, IFNULL(IFNULL(SPOPL_T.active, SPOPL.active), 1) AS active
		, NOT ISNULL(t_SPO.id_order) AS has_order
	    , IFNULL(SPOPL_T.id_link, 0) < 1 AS is_new
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link_Temp SPOPL_T
	LEFT JOIN partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link SPOPL ON SPOPL_T.id_link = SPOPL.id_link
	LEFT JOIN tmp_Supplier_Purchase_Order t_SPO ON SPOPL_T.id_order = t_SPO.id_order
	WHERE SPOPL_T.GUID = a_guid
	;
    
    UPDATE tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
	INNER JOIN partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link_Temp SPOPL_T ON t_SPOPL.id_order = SPOPL_T.id_order
    LEFT JOIN partsltd_prod.Shop_Product P ON SPOPL_T.id_product = P.id_product
    LEFT JOIN partsltd_prod.Shop_Product_Category PC ON P.id_category = PC.id_category
	SET 
		name_error = CONCAT(
			CASE WHEN ISNULL(t_SPOPL.id_permutation) THEN
				CASE WHEN ISNULL(SPOPL_T.id_product) THEN
					'(No Product Permutation)'
				ELSE
					CONCAT(
						PC.name
                        , ' - '
                        , P.name
                    )
                END
			ELSE 
				fn_shop_get_product_permutation_name(t_SPOPL.id_permutation) 
			END
			, ' - x'
			, IFNULL(t_SPOPL.quantity_ordered, '(No Quantity)')
		)
	;
	
	INSERT INTO tmp_Supplier_Purchase_Order (
		id_order
        , id_order_temp
		, id_supplier_ordered
		, id_currency_cost
        , active
        , is_new
	)
	SELECT
		SPO.id_order
		, SPO.id_order
		, IFNULL(SPO.id_supplier_ordered, 0) AS id_supplier_ordered
		, IFNULL(SPO.id_currency_cost, 0) AS id_currency_cost
        , SPO.active AS active
        , 0 AS is_new
	FROM partsltd_prod.Shop_Supplier_Purchase_Order SPO
	INNER JOIN tmp_Supplier_Purchase_Order_Product_Link t_SPOPL 
		ON SPO.id_order = t_SPOPL.id_order
		AND t_SPOPL.has_order = 0
	;
        
    UPDATE tmp_Supplier_Purchase_Order t_SPO
	INNER JOIN (
		SELECT 
			t_SPOPL.id_order
			, SUM(t_SPOPL.cost_total_local_VAT_excl) AS cost_total_local_VAT_excl
            , SUM(t_SPOPL.cost_total_local_VAT_incl) AS cost_total_local_VAT_incl
        FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
		GROUP BY t_SPOPL.id_order
	) SUM_t_SPOPL ON t_SPO.id_order = SUM_t_SPOPL.id_order
	SET 
		t_SPO.cost_total_local_VAT_excl = SUM_t_SPOPL.cost_total_local_VAT_excl
		, t_SPO.cost_total_local_VAT_incl = SUM_t_SPOPL.cost_total_local_VAT_incl
	;

    -- Validation
	-- Supplier Purchase Order
    # id_order
    IF EXISTS (
		SELECT * 
        FROM tmp_Supplier_Purchase_Order t_SPO
        LEFT JOIN partsltd_prod.Shop_Supplier_Purchase_Order SPO ON t_SPO.id_order = SPO.id_order
        WHERE 1=1
			AND t_SPO.id_order > 0
			AND ISNULL(SPO.id_order)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'A valid ID is required for the following Supplier Purchase Order(s): '
				, GROUP_CONCAT(CONCAT(IFNULL(t_SPO.id_stock, '(No Supplier Purchase Order)')) SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier_Purchase_Order t_SPO
        LEFT JOIN partsltd_prod.Shop_Supplier_Purchase_Order SPO ON t_SPO.id_order = SPO.id_order
        WHERE 1=1
			AND t_SPO.id_stock > 0
			AND ISNULL(SPO.id_stock)
		;
    END IF;
    # id_supplier_ordered
    IF EXISTS (
		SELECT * 
        FROM tmp_Supplier_Purchase_Order t_SPO
        LEFT JOIN partsltd_prod.Shop_Supplier S ON t_SPO.id_supplier_ordered = S.id_supplier
        WHERE 1=1
			AND (
				ISNULL(S.id_supplier)
				OR S.active = 0
			)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'A valid supplier is required for the following Supplier Purchase Order(s): '
				, GROUP_CONCAT(CONCAT(IFNULL(t_SPO.id_stock, '(No Supplier Purchase Order)'), ' - ', t_SPO.id_supplier_ordered) SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier_Purchase_Order t_SPO
        LEFT JOIN partsltd_prod.Shop_Supplier S ON t_SPO.id_supplier_ordered = S.id_supplier
        WHERE 1=1
			AND (
				ISNULL(S.id_supplier)
				OR S.active = 0
			)
		;
    END IF;
    # id_currency_cost
    IF EXISTS (
		SELECT * 
        FROM tmp_Supplier_Purchase_Order t_SPO
        LEFT JOIN partsltd_prod.Shop_Currency C ON t_SPO.id_currency_cost = C.id_currency
        WHERE 1=1
			AND (
				ISNULL(C.id_currency)
				OR C.active = 0
			)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'A valid currency is required for the following Supplier Purchase Order(s): '
				, GROUP_CONCAT(CONCAT(IFNULL(t_SPO.id_stock, '(No Supplier Purchase Order)'), ' - ', t_SPO.id_currency_cost) SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier_Purchase_Order t_SPO
        LEFT JOIN partsltd_prod.Shop_Currency C ON t_SPO.id_currency_cost = C.id_currency
        WHERE 1=1
			AND (
				ISNULL(C.id_currency)
				OR C.active = 0
			)
		;
    END IF;
    # id_unit_quantity
    IF EXISTS (
		SELECT * 
        FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
        LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM ON t_SPOPL.id_unit_quantity = UM.id_unit_measurement
        WHERE 1=1
			AND (
				ISNULL(UM.id_unit_measurement)
				OR UM.active = 0
			)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'A valid unit measurement of quantity is required for the following Supplier Purchase Order(s): '
				, GROUP_CONCAT(CONCAT(IFNULL(t_SPO.id_stock, '(No Supplier Purchase Order)'), ' - ', t_SPO.id_currency_cost) SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
        LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM ON t_SPOPL.id_unit_quantity = UM.id_unit_measurement
        WHERE 1=1
			AND (
				ISNULL(UM.id_unit_measurement)
				OR UM.active = 0
			)
		;
    END IF;
	# Invalid quantity ordered
	IF EXISTS (
		SELECT * 
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
		WHERE 
			ISNULL(t_SPOPL.quantity_ordered)
			OR t_SPOPL.quantity_ordered <= 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_type_error_bad_data, 
			v_code_type_error_bad_data, 
			CONCAT(
				'A valid quantity ordered is required for the following Supplier Purchase Order Item(s): '
				, GROUP_CONCAT(t_SPOPL.name_error SEPARATOR ', ')
			)
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
		WHERE 
			ISNULL(t_SPOPL.quantity_ordered)
			OR t_SPOPL.quantity_ordered <= 0
		;
	END IF;
	# Invalid quantity received
	IF EXISTS (
		SELECT * 
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
		WHERE t_SPOPL.quantity_received < 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_type_error_bad_data, 
			v_code_type_error_bad_data, 
			CONCAT(
				'A valid quantity received is required for the following Supplier Purchase Order Item(s): '
				, GROUP_CONCAT(t_SPOPL.name_error, ' - ', t_SPOPL.quantity_received SEPARATOR ', ')
			)
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
		WHERE t_SPOPL.quantity_received < 0
		;
	END IF;
	# Invalid delivery latency
	IF EXISTS (
		SELECT * 
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
		WHERE t_SPOPL.latency_delivery_days < 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_type_error_bad_data, 
			v_code_type_error_bad_data, 
			CONCAT(
				'A valid delivery latency is required for the following Supplier Purchase Order Item(s): '
				, GROUP_CONCAT(t_SPOPL.name_error, ' - ', t_SPOPL.latency_delivery_days SEPARATOR ', ')
			)
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
		WHERE t_SPOPL.latency_delivery_days < 0
		;
	END IF;
    
    -- Duplicates
	IF EXISTS (
		SELECT 
			id_permutation
			, name_error
			, COUNT(*)
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL 
		GROUP BY id_permutation, name_error
		HAVING COUNT(*) > 1
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_type_error_bad_data, 
			v_code_type_error_bad_data, 
			CONCAT('Duplicate records: ', GROUP_CONCAT(t_SPOPLC.name_error SEPARATOR ', '))
		FROM (
			SELECT 
				id_permutation
				, name_error
				, COUNT(*) 
			FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL 
			GROUP BY id_permutation, name_error 
			HAVING COUNT(*) > 1
		) t_SPOPLC
		;
	END IF;
	-- Empty Supplier Purchase Order
	IF EXISTS ( SELECT * FROM tmp_Supplier_Purchase_Order t_SPO LEFT JOIN tmp_Supplier_Purchase_Order_Product_Link t_SPOPL ON t_SPO.id_order = t_SPOPL.id_order WHERE ISNULL(t_SPOPL.id_order) ) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_type_error_bad_data, 
			v_code_type_error_bad_data, 
			CONCAT(
				'There are no items in the following Supplier Purchase Order(s): '
				, GROUP_CONCAT(t_SPO.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier_Purchase_Order t_SPO 
		LEFT JOIN tmp_Supplier_Purchase_Order_Product_Link t_SPOPL ON t_SPO.id_order = t_SPOPL.id_order 
		WHERE ISNULL(t_SPOPL.id_order)
		;
	END IF;
	
	-- Supplier Purchase Order Items without Order
	IF EXISTS ( 
		SELECT * 
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL 
		LEFT JOIN tmp_Supplier_Purchase_Order t_SPO ON t_SPOPL.id_order = t_SPO.id_order
		WHERE ISNULL(t_SPO.id_order) 
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_type_error_bad_data, 
			v_code_type_error_bad_data, 
			CONCAT(
				'There is no order for the following Supplier Purchase Order Item(s): '
				, GROUP_CONCAT(t_SPOPL.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL 
		LEFT JOIN tmp_Supplier_Purchase_Order t_SPO ON t_SPOPL.id_order = t_SPO.id_order
		WHERE ISNULL(t_SPO.id_order) 
		;
	END IF;
    
    -- Permissions
	SET v_ids_product_permission := (
		SELECT 
			GROUP_CONCAT(DISTINCT PP.id_product SEPARATOR ',')
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
		INNER JOIN partsltd_prod.Shop_Product_Permutation PP ON t_SPOPL.id_permutation = PP.id_permutation
	);
	IF a_debug = 1 THEN
		SELECT 
			a_guid
			, a_id_user
			, FALSE -- get inactive users
			, v_id_permission_supplier_purchase_order
			, v_id_access_level_edit
			, v_ids_product_permission -- ids_product
			, 0 -- a_debug
		;
		SELECT * from partsltd_prod.Shop_Calc_User_Temp;
	END IF;
	
	CALL p_shop_calc_user(
		a_guid
		, a_id_user
		, FALSE -- get inactive users
		, v_id_permission_supplier_purchase_order
		, v_id_access_level_edit
		, v_ids_product_permission -- ids_product
		, 0 -- a_debug
	);
	
	IF a_debug = 1 THEN
		SELECT * from partsltd_prod.Shop_Calc_User_Temp WHERE GUID = a_guid;
	END IF;
	
	IF EXISTS (SELECT * FROM partsltd_prod.Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = a_guid AND IFNULL(UE_T.can_view, 0) = 0) THEN
		DELETE FROM tmp_Msg_Error;

		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_no_permission
			, v_code_type_error_no_permission
			, CONCAT(
				'You do not have view permissions for '
				, GROUP_CONCAT(name SEPARATOR ', ') 
			) AS msg
		FROM partsltd_prod.Shop_Permission PERM
		INNER JOIN partsltd_prod.Shop_Calc_User_Temp UE_T 
			ON PERM.id_permission = UE_T.id_permission
			AND UE_T.GUID = a_guid
			AND IFNULL(UE_T.can_view, 0) = 0
		;
	END IF;

	CALL partsltd_prod.p_shop_clear_calc_user( 
		a_guid
        , 0 -- a_debug
	);

	IF EXISTS (
		SELECT *
		FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
		INNER JOIN partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link SPOPL ON t_SPOPL.id_link = SPOPL.id_link
		INNER JOIN partsltd_prod.Shop_Stock_Item SI ON SPOPL.id_permutation = SI.id_permutation
		WHERE 
			t_SPOPL.is_new = 0
			AND t_SPOPL.quantity_received <> SPOPL.quantity_received
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
            , code
            , msg
		)
        SELECT
			v_id_type_error_warning
            , v_code_type_error_warning
            , CONCAT(
				'The quantity received has changed on the following orders. Please update the stock items appropriately.'
                , GROUP_CONCAT(
					CONCAT(
						t_SPOPL.name_error
                        , ' - from '
                        , SPOPL.quantity_received
                        , ' to '
                        , t_SPOPL.quantity_received
					) SEPARATOR ', '
				)
			) AS msg
		;
    END IF;
    
	IF EXISTS ( SELECT * FROM tmp_Msg_Error LIMIT 1 ) THEN
		DELETE FROM tmp_Supplier_Purchase_Order;
		DELETE FROM tmp_Supplier_Purchase_Order_Product_Link;
	END IF;
	
	-- Transaction    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		START TRANSACTION;
			INSERT INTO Shop_Sales_And_Purchasing_Change_Set (
				comment
				, updated_last_by
				, updated_last_on
			)
			VALUES (
				a_comment
				, a_id_user
				, v_time_start
			);
			
			SET v_id_change_set := LAST_INSERT_ID();
		
			INSERT INTO partsltd_prod.Shop_Supplier_Purchase_Order (
				id_order_temp
				, id_supplier_ordered
				, id_currency_cost
				, cost_total_local_VAT_excl
				, cost_total_local_VAT_incl
                , active
				, created_by
				, created_on
				, id_change_set
			)
			SELECT
				t_SPO.id_order_temp
				, t_SPO.id_supplier_ordered
				, t_SPO.id_currency_cost
				, t_SPO.cost_total_local_VAT_excl
				, t_SPO.cost_total_local_VAT_incl
				, t_SPO.active
				, a_id_user
				, v_time_start
				, v_id_change_set
			FROM tmp_Supplier_Purchase_Order t_SPO
			INNER JOIN tmp_Supplier_Purchase_Order_Product_Link t_SPOPL ON t_SPO.id_order = t_SPOPL.id_order
			WHERE t_SPOPL.is_new = 1
            GROUP BY t_SPO.id_order
			;
		
			UPDATE partsltd_prod.Shop_Supplier_Purchase_Order SPO
			INNER JOIN tmp_Supplier_Purchase_Order t_SPO 
				ON SPO.id_order = t_SPO.id_order
				AND t_SPO.is_new = 0
			INNER JOIN tmp_Supplier_Purchase_Order_Product_Link t_SPOPL ON t_SPO.id_order = t_SPOPL.id_order
			SET
				SPO.id_supplier_ordered = t_SPO.id_supplier_ordered
				, SPO.id_currency_cost = t_SPO.id_currency_cost
				, SPO.cost_total_local_VAT_excl = t_SPO.cost_total_local_VAT_excl
				, SPO.cost_total_local_VAT_incl = t_SPO.cost_total_local_VAT_incl
				, SPO.active = t_SPO.active
				, SPO.id_change_set = v_id_change_set
			;
            
			
			UPDATE tmp_Supplier_Purchase_Order t_SPO
			INNER JOIN partsltd_prod.Shop_Supplier_Purchase_Order SPO 
				ON t_SPO.id_order_temp = SPO.id_order_temp
                AND SPO.id_change_set = v_id_change_set
			SET 
				t_SPO.id_order = SPO.id_order
			WHERE t_SPO.is_new = 1
			;
            
			UPDATE tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
			INNER JOIN tmp_Supplier_Purchase_Order t_SPO ON t_SPOPL.id_order = t_SPO.id_order_temp
			SET 
				t_SPOPL.id_order = t_SPO.id_order
			WHERE t_SPO.is_new = 1
			;
            
			
			INSERT INTO Shop_Supplier_Purchase_Order_Product_Link (
				id_order
				, id_permutation
				, id_unit_quantity
				, quantity_ordered
				, quantity_received
				, latency_delivery_days
				, display_order
				, active
				, cost_total_local_VAT_excl
				, cost_total_local_VAT_incl
				, cost_unit_local_VAT_excl
				, cost_unit_local_VAT_incl
				, created_by
                , created_on
				, id_change_set
			)
			SELECT
				t_SPOPL.id_order
				, t_SPOPL.id_permutation
				, t_SPOPL.id_unit_quantity
				, t_SPOPL.quantity_ordered
				, t_SPOPL.quantity_received
				, t_SPOPL.latency_delivery_days
				, t_SPOPL.display_order
				, t_SPOPL.active
				, t_SPOPL.cost_total_local_VAT_excl
				, t_SPOPL.cost_total_local_VAT_incl
				, t_SPOPL.cost_unit_local_VAT_excl
				, t_SPOPL.cost_unit_local_VAT_incl
				, a_id_user
                , v_time_start
				, v_id_change_set
			FROM tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
			WHERE t_SPOPL.is_new = 1
			;
			
			UPDATE partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link SPOPL
			INNER JOIN tmp_Supplier_Purchase_Order_Product_Link t_SPOPL
				ON SPOPL.id_link = t_SPOPL.id_link
				AND t_SPOPL.is_new = 0
			SET
				SPOPL.id_order = t_SPOPL.id_order
				, SPOPL.id_permutation = t_SPOPL.id_permutation
				, SPOPL.id_unit_quantity = t_SPOPL.id_unit_quantity
				, SPOPL.quantity_ordered = t_SPOPL.quantity_ordered
				, SPOPL.quantity_received = t_SPOPL.quantity_received
				, SPOPL.latency_delivery_days = t_SPOPL.latency_delivery_days
				, SPOPL.display_order = t_SPOPL.display_order
				, SPOPL.active = t_SPOPL.active
				, SPOPL.cost_total_local_VAT_excl = t_SPOPL.cost_total_local_VAT_excl
				, SPOPL.cost_total_local_VAT_incl = t_SPOPL.cost_total_local_VAT_incl
				, SPOPL.cost_unit_local_VAT_excl = t_SPOPL.cost_unit_local_VAT_excl
				, SPOPL.cost_unit_local_VAT_incl = t_SPOPL.cost_unit_local_VAT_incl
				, SPOPL.id_change_set = v_id_change_set
			;
		
			DELETE SPO_T
			FROM Shop_Supplier_Purchase_Order_Temp SPO_T
			WHERE SPO_T.GUID = a_guid
			;
			DELETE SPOPL_T
			FROM Shop_Supplier_Purchase_Order_Product_Link_Temp SPOPL_T
			WHERE SPOPL_T.GUID = a_guid
			;
			
		COMMIT;
    END IF;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
	INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
	;
    
	IF a_debug = 1 THEN
		SELECT * from tmp_Supplier_Purchase_Order;
		SELECT * from tmp_Supplier_Purchase_Order_Product_Link;
	END IF;

    DROP TEMPORARY TABLE tmp_Supplier_Purchase_Order;
    DROP TEMPORARY TABLE tmp_Supplier_Purchase_Order_Product_Link;
    DROP TEMPORARY TABLE tmp_Msg_Error;
    
	IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
	END IF;
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



-- File: 7403_p_shop_save_supplier_purchase_order_test.sql


-- Clear previous proc
DROP PROCEDURE IF EXISTS partsltd_prod.p_shop_save_supplier_purchase_order_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_supplier_purchase_order_test ()
BEGIN
	
	DECLARE v_guid BINARY(36);
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_guid := 'nips';

	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link_Temp
	;
    
	START TRANSACTION;
    
		DELETE FROM partsltd_prod.Shop_Supplier_Purchase_Order_Temp;
		DELETE FROM partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link_Temp;

		INSERT INTO partsltd_prod.Shop_Supplier_Purchase_Order_Temp (
			id_order
			, id_supplier_ordered
			, id_currency_cost
            , active
            , GUID
		)
        /* Test 1 - Insert */
        VALUES (
			-1
            , 1
            , 1
            , 1
            , v_guid
        )
        /* Test 2 - Update
        SELECT 
			id_order
			, id_supplier_ordered
			, id_currency_cost
            , active
            , v_guid
		FROM partsltd_prod.Shop_Supplier_Purchase_Order
        WHERE id_order = 6
        */
		;
		INSERT INTO partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link_Temp (
			id_link
			, id_order
			, id_permutation
			, id_unit_quantity
			, quantity_ordered
			, quantity_received
			, latency_delivery_days
			, display_order
			, active
			, cost_total_local_VAT_excl
			, cost_total_local_VAT_incl
            , GUID
		)
        /* Test 1 - Insert */
        VALUES (
			-1
            , -1
            , 3
            , 3
            , 3
            , 1
            , 7
            , 1
            , 1
            , 5
            , 6
            , v_guid
        )
        /* Test 2 - Update
        SELECT
			id_link
			, id_order
			, id_permutation
			, id_unit_quantity
			, 5 AS quantity_ordered
			, quantity_received
			, latency_delivery_days
			, display_order
			, active
			, cost_total_local_VAT_excl
			, cost_total_local_VAT_incl
            , v_guid
		FROM partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link
        WHERE id_order = 6
        */
        ;
        
	COMMIT;
    
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Temp
	WHERE GUID = v_guid
    ;
    
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link_Temp
	WHERE GUID = v_guid
    ;
    
    CALL partsltd_prod.p_shop_save_supplier_purchase_order ( 
		'Test save Supplier Purchase Order' -- comment
        , v_guid -- guid
        , 1 -- id_user
		, 1 -- debug
    );
    
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order
	;
	SELECT *
	FROM partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link
	;
    
	CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
END //
DELIMITER ;;

/*
CALL partsltd_prod.p_shop_save_supplier_purchase_order_test ();

DELETE FROM partsltd_prod.Shop_Supplier_Purchase_Order_Temp;
DELETE FROM partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link_Temp;

DROP TABLE IF EXISTS tmp_Msg_Error;

Cannot add or update a child row: a foreign key constraint fails (`partsltd_prod`.`shop_supplier_address`, CONSTRAINT `FK_Shop_Supplier_Address_id_supplier` FOREIGN KEY (`id_supplier`) REFERENCES `shop_supplier` (`id_supplier`) ON UPDATE RESTRICT)

*/

-- File: 7404_p_shop_get_many_supplier_purchase_order.sql


DROP PROCEDURE IF EXISTS p_shop_get_many_supplier_purchase_order;

DELIMITER //
CREATE PROCEDURE p_shop_get_many_supplier_purchase_order (
	IN a_id_user INT,
    IN a_get_all_supplier BIT,
	IN a_get_inactive_supplier BIT,
	IN a_ids_supplier TEXT,
    IN a_get_all_order BIT,
	IN a_get_inactive_order BIT,
	IN a_ids_order TEXT,
	IN a_ids_permutation TEXT,
    IN a_date_from DATETIME,
    IN a_date_to DATETIME,
	IN a_debug BIT
)
BEGIN
    DECLARE v_code_type_error_bad_data VARCHAR(50);
	DECLARE v_code_type_error_no_permission VARCHAR(50);
    DECLARE v_guid BINARY(36);
    DECLARE v_has_filter_supplier BIT;
    DECLARE v_has_filter_order BIT;
    DECLARE v_has_filter_permutation BIT;
    DECLARE v_has_filter_date_from BIT;
    DECLARE v_has_filter_date_to BIT;
    DECLARE v_id_access_level_view INT;
    DECLARE v_ids_permission_supplier_purchase_order VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_type_error_no_permission INT;
    DECLARE v_time_start TIMESTAMP(6);
    
	SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_code_type_error_bad_data := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_bad_data := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_code_type_error_no_permission := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION' LIMIT 1);
    SET v_id_type_error_no_permission := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_no_permission LIMIT 1);
    SET v_ids_permission_supplier_purchase_order := (SELECT GROUP_CONCAT(id_permission SEPARATOR ',') FROM partsltd_prod.Shop_Permission WHERE code IN ('STORE_SUPPLIER', 'STORE_SUPPLIER_PURCHASE_ORDER', 'STORE_PRODUCT'));
	
	SET a_get_all_supplier := IFNULL(a_get_all_supplier, 1);
	SET a_get_inactive_supplier := IFNULL(a_get_inactive_supplier, 0);
	SET a_ids_supplier := TRIM(IFNULL(a_ids_supplier, ''));
	SET a_get_all_order := IFNULL(a_get_all_order, 1);
	SET a_get_inactive_order := IFNULL(a_get_inactive_order, 0);
	SET a_ids_order := TRIM(IFNULL(a_ids_order, ''));
	SET a_ids_permutation := TRIM(IFNULL(a_ids_permutation, ''));
	SET a_date_from := IFNULL(a_date_from, NULL);
	SET a_date_to := IFNULL(a_date_to, NULL);
	SET a_debug := IFNULL(a_debug, 0);
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Supplier_Purchase_Order_Product_Link;
    DROP TEMPORARY TABLE IF EXISTS tmp_Supplier_Purchase_Order;
    DROP TEMPORARY TABLE IF EXISTS tmp_Supplier;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    DROP TEMPORARY TABLE IF EXISTS tmp_Split;
    
    CREATE TEMPORARY TABLE tmp_Supplier (
		id_supplier INT NOT NULL PRIMARY KEY
    );
    
    CREATE TEMPORARY TABLE tmp_Supplier_Purchase_Order (
		id_order INT NOT NULL PRIMARY KEY
    );
    
    CREATE TEMPORARY TABLE tmp_Permutation (
		id_permutation INT NOT NULL PRIMARY KEY
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		id_type INT NOT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Split (
		substring VARCHAR(4000) NOT NULL
        , as_int INT NULL
	);
    DELETE FROM tmp_Split;
    
    SET v_has_filter_supplier = CASE WHEN a_ids_supplier = '' THEN 0 ELSE 1 END;
    SET v_has_filter_order = CASE WHEN a_ids_order = '' THEN 0 ELSE 1 END;
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_date_from = CASE WHEN ISNULL(a_date_from) THEN 0 ELSE 1 END;
    SET v_has_filter_date_to = CASE WHEN ISNULL(a_date_to) THEN 0 ELSE 1 END;

	IF a_debug = 1 THEN
		SELECT
			v_has_filter_supplier,
			v_has_filter_order,
			v_has_filter_permutation,
			v_has_filter_date_from,
			v_has_filter_date_to
		;
	END IF;
    
    -- Permutations
    IF v_has_filter_permutation = 1 THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_permutation, ',', a_debug);
		
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
            LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_S.as_int = PP.id_permutation
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(PP.id_permutation)
				OR PP.active = 0
		) THEN
			INSERT INTO tmp_Msg_Error (
				id_type,
				code,
				msg
			)
			SELECT
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive permutation IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_S.as_int = PP.id_permutation
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(PP.id_permutation)
				OR PP.active = 0
			;
		ELSE
			INSERT INTO tmp_Permutation (
				id_permutation
			)
			SELECT 
				PP.id_permutation
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_S.as_int = PP.id_permutation
			WHERE (
					v_has_filter_permutation = 0
					OR NOT ISNULL(t_S.as_int)
				)
			;
		END IF;
	END IF;

	DELETE FROM tmp_Split;
    
    -- Suppliers
    IF v_has_filter_supplier = 1 THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_supplier, ',', a_debug);
		
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
            LEFT JOIN partsltd_prod.Shop_Supplier S ON t_S.as_int = S.id_supplier
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(S.id_supplier)
				OR (
					S.active = 0
					AND a_get_inactive_supplier = 0
				)
		) THEN
			INSERT INTO tmp_Msg_Error (
				id_type,
				code,
				msg
			)
			SELECT
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive Supplier IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Supplier S ON t_S.as_int = S.id_supplier
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(S.id_supplier)
				OR (
					S.active = 0
					AND a_get_inactive_supplier = 0
				)
			;
		ELSE
			INSERT INTO tmp_Supplier (
				id_supplier
			)
			SELECT 
				S.id_supplier
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_Supplier S ON t_S.as_int = S.id_supplier
			WHERE (
					a_get_all_supplier = 1
					OR (
						v_has_filter_supplier = 1
						AND NOT ISNULL(t_S.as_int)
					)
				)
				AND (
					a_get_inactive_supplier = 1
					OR S.active = 1
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    -- Supplier Purchase Orders
    IF v_has_filter_order = 1 THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_order, ',', a_debug);
		
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
            LEFT JOIN partsltd_prod.Shop_Supplier_Purchase_Order SPO ON t_S.as_int = SPO.id_order
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(SPO.id_order)
				OR (
					SPO.active = 0
					AND a_get_inactive_order = 0
				)
		) THEN
			INSERT INTO tmp_Msg_Error (
				id_type,
				code,
				msg
			)
			SELECT
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive Supplier Purchase Order IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Supplier_Purchase_Order SPO ON t_S.as_int = SPO.id_order
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(SPO.id_order)
				OR (
					SPO.active = 0
					AND a_get_inactive_order = 0
				)
			;
		ELSE
			INSERT INTO tmp_Supplier_Purchase_Order (
				id_order
			)
			SELECT 
				SPO.id_order
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_Supplier_Purchase_Order SPO ON t_S.as_int = SPO.id_order
			INNER JOIN tmp_Supplier t_SUPP ON SPO.id_supplier_ordered = t_SUPP.id_supplier
			INNER JOIN partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link SPOPL ON SPO.id_order = SPOPL.id_order
			INNER JOIN tmp_Permutation t_PP ON SPOPL.id_permutation = t_PP.id_permutation
			WHERE (
					a_get_all_order = 1
					OR (
						v_has_filter_order = 1
						AND NOT ISNULL(t_S.as_int)
					)
					OR (
						v_has_filter_supplier = 1
						AND NOT ISNULL(t_SUPP.id_supplier)
					)
					OR (
						v_has_filter_permutation = 1
						AND NOT ISNULL(t_PP.id_permutation)
					)
				)
				AND (
					a_get_inactive_order = 1
					OR SPO.active = 1
				)
				AND (
					v_has_filter_date_from = 0
					OR SPO.created_on > a_date_from
				)
				AND (
					v_has_filter_date_to = 0
					OR SPO.created_on < a_date_to
				)
				
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    -- Permissions
	IF a_debug = 1 THEN
		SELECT 
			v_guid
			, a_id_user
			, FALSE -- get inactive users
			, v_ids_permission_supplier_purchase_order
			, v_id_access_level_view
			, '' -- ids_product
			, 0 -- a_debug
		;
		SELECT * from partsltd_prod.Shop_Calc_User_Temp;
	END IF;
	
	CALL p_shop_calc_user(
		v_guid
		, a_id_user
		, FALSE -- get inactive users
		, v_ids_permission_supplier_purchase_order
		, v_id_access_level_view
		, '' -- ids_product
		, 0 -- a_debug
	);
	
	IF a_debug = 1 THEN
		SELECT * from partsltd_prod.Shop_Calc_User_Temp;
	END IF;
	
	IF NOT EXISTS (SELECT can_view FROM partsltd_prod.Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
		DELETE FROM tmp_Msg_Error;

		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		VALUES (
			v_id_type_error_no_permission
			, v_code_type_error_no_permission
			, CONCAT('You do not have view permissions for ', (SELECT name FROM partsltd_prod.Shop_Permission WHERE id_permission = v_ids_permission_supplier_purchase_order LIMIT 1))
		)
		;
	END IF;
    
	IF EXISTS ( SELECT * FROM tmp_Msg_Error LIMIT 1 ) THEN
		DELETE FROM tmp_Permutation;
		DELETE FROM tmp_Supplier_Purchase_Order;
	END IF;
	
    -- Returns
	/*
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
    FROM tmp_Supplier t_S
    INNER JOIN partsltd_prod.Shop_Supplier S
		ON t_S.id_supplier = S.id_supplier
	;
    */

    # Supplier Purchase Order
    SELECT 
		t_SPO.id_order
		, SPO.id_supplier_ordered
        , S.name_company
		, SPO.id_currency_cost
        , C.symbol
        , C.code
		, SPO.cost_total_local_VAT_excl
		, SPO.cost_total_local_VAT_incl
        , SPO.active
        , SPO.created_on
        , CONCAT(
			SPO.cost_total_local_VAT_excl
            , ' on '
            , SPO.created_on
		) AS name
    FROM tmp_Supplier_Purchase_Order t_SPO 
	INNER JOIN partsltd_prod.Shop_Supplier_Purchase_Order SPO ON SPO.id_order = t_SPO.id_order
    LEFT JOIN partsltd_prod.Shop_Supplier S ON SPO.id_supplier_ordered = S.id_supplier
    LEFT JOIN partsltd_prod.Shop_Currency C ON SPO.id_currency_cost = C.id_currency
    ;
    
    # Supplier Purchase Order Product Link
    SELECT
		SPOPL.id_link
		, SPOPL.id_order
        , P.id_category
        , P.id_product
		, SPOPL.id_permutation
        , fn_shop_get_product_permutation_name(SPOPL.id_permutation) AS name_permutation
        , fn_shop_get_product_permutation_variations_csv(SPOPL.id_permutation) AS csv_id_pairs_variation
		-- , SPOPL.id_currency_cost
		, SPOPL.id_unit_quantity
		, SPOPL.quantity_ordered
		, SPOPL.quantity_received
		, SPOPL.latency_delivery_days
		, SPOPL.display_order
		, SPOPL.cost_total_local_VAT_excl
		, SPOPL.cost_total_local_VAT_incl
		, SPOPL.cost_unit_local_VAT_excl
		, SPOPL.cost_unit_local_VAT_incl
        , SPOPL.active
    FROM tmp_Supplier_Purchase_Order t_SPO
    INNER JOIN partsltd_prod.Shop_Supplier_Purchase_Order_Product_Link SPOPL ON t_SPO.id_order = SPOPL.id_order
    LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON SPOPL.id_permutation = PP.id_permutation
    LEFT JOIN partsltd_prod.Shop_Product P ON PP.id_product = P.id_product
    ;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
    INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
    ;
    
    IF a_debug = 1 THEN
		SELECT * from tmp_Supplier_Purchase_Order_Product_Link;
		SELECT * from tmp_Supplier_Purchase_Order;
		SELECT * from tmp_Supplier;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tmp_Supplier_Purchase_Order_Product_Link;
    DROP TEMPORARY TABLE IF EXISTS tmp_Supplier_Purchase_Order;
    DROP TEMPORARY TABLE IF EXISTS tmp_Supplier;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    DROP TEMPORARY TABLE IF EXISTS tmp_Split;
	
    IF a_debug = 1 THEN
		CALL p_debug_timing_reporting( v_time_start );
    END IF;
END //
DELIMITER ;;


/*

CALL p_shop_get_many_supplier_purchase_order (
	1, # a_id_user
    1, # a_get_all_supplier
	0, # a_get_inactive_supplier
    '', # a_ids_supplier
	1, # a_get_all_order
	0, # a_get_inactive_order
    '', # a_ids_order
    '', # a_ids_permutation
    NULL, # a_date_from
	NULL # a_date_to
	, 0 # a_debug
);

*/


-- File: 7415_p_shop_save_manufacturing_purchase_order.sql




-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_manufacturing_purchase_order;

DROP TABLE IF EXISTS tmp_Manufacturing_Purchase_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Msg_Error;

DELIMITER //
CREATE PROCEDURE p_shop_save_manufacturing_purchase_order (
	IN a_comment VARCHAR(500)
	, IN a_guid BINARY(36)
    , IN a_id_user INT
    , IN a_debug BIT
)
BEGIN
	DECLARE v_code_type_error_bad_data VARCHAR(50);
	DECLARE v_code_type_error_no_permission VARCHAR(50);
	DECLARE v_code_type_error_warning VARCHAR(50);
    DECLARE v_id_access_level_edit INT;
    DECLARE v_id_change_set INT;
    DECLARE v_ids_permission_manufacturing_purchase_order VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_type_error_no_permission INT;
    DECLARE v_id_type_error_warning INT;
	DECLARE v_ids_product_permission TEXT;
    DECLARE v_time_start TIMESTAMP(6);

    DECLARE exit handler for SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            @sqlstate = RETURNED_SQLSTATE
            , @errno = MYSQL_ERRNO
            , @text = MESSAGE_TEXT
		;
        
        ROLLBACK;
        
		CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
			display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
			, id_type INT NULL
			, code VARCHAR(50) NOT NULL
			, msg VARCHAR(4000) NOT NULL
		);
        INSERT INTO tmp_Msg_Error (
			id_type
            , code
            , msg
		)
        SELECT 
			MET.id_type
            , @errno
            , @text
		FROM partsltd_prod.Shop_Msg_Error_Type MET
        WHERE code = 'MYSQL_ERROR'
		;
        SELECT *
        FROM tmp_Msg_Error;
		DROP TABLE IF EXISTS tmp_Msg_Error;
    END;
    
	SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_code_type_error_bad_data := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_bad_data := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_code_type_error_no_permission := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION' LIMIT 1);
    SET v_id_type_error_no_permission := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_no_permission LIMIT 1);
	SET v_code_type_error_warning := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'WARNING' LIMIT 1);
    SET v_id_type_error_warning := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_warning LIMIT 1);
	SET v_ids_permission_manufacturing_purchase_order := (SELECT GROUP_CONCAT(id_permission SEPARATOR ',') FROM partsltd_prod.Shop_Permission WHERE code IN ('STORE_MANUFACTURING_PURCHASE_ORDER', 'STORE_PRODUCT'));
	SET v_id_access_level_edit := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
	CALL p_validate_guid ( a_guid );
	SET a_comment := TRIM(IFNULL(a_comment, ''));
    
	DROP TEMPORARY TABLE IF EXISTS tmp_Manufacturing_Purchase_Order;
	DROP TEMPORARY TABLE IF EXISTS tmp_Manufacturing_Purchase_Order_Product_Link;
	DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;

    -- Temporary tables
    CREATE TEMPORARY TABLE tmp_Manufacturing_Purchase_Order (
		id_order INT NOT NULL PRIMARY KEY
        , id_order_temp INT NOT NULL
		, id_currency INT NOT NULL
		, active BIT NOT NULL
		, is_new BIT NOT NULL
		, name_error VARCHAR(1000) NOT NULL
		, cost_total_local_VAT_excl FLOAT NULL
		, cost_total_local_VAT_incl FLOAT NULL
		, price_total_local_VAT_excl FLOAT NULL
		, price_total_local_VAT_incl FLOAT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Manufacturing_Purchase_Order_Product_Link (
		id_link INT NOT NULL PRIMARY KEY
		, id_order INT NOT NULL
        , id_product INT NULL
        , id_permutation INT NULL
		, id_unit_quantity INT NOT NULL
		, quantity_used FLOAT NOT NULL
		, quantity_produced FLOAT NULL
		, id_unit_latency_manufacture INT NULL
		, latency_manufacture INT NULL
		, display_order INT NOT NULL
        , active BIT NOT NULL
		, cost_unit_local_VAT_excl FLOAT NULL
		, cost_unit_local_VAT_incl FLOAT NULL
		, cost_total_local_VAT_excl FLOAT NULL
		, cost_total_local_VAT_incl FLOAT NULL
		, price_unit_local_VAT_excl FLOAT NULL
		, price_unit_local_VAT_incl FLOAT NULL
		, price_total_local_VAT_excl FLOAT NULL
		, price_total_local_VAT_incl FLOAT NULL
		, has_order BIT NULL
		, is_new BIT NOT NULL
		, name_error VARCHAR(1000) NULL
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
		, id_type INT NOT NULL
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
    
	INSERT INTO tmp_Manufacturing_Purchase_Order (
		id_order
		, id_order_temp
		, id_currency
		, active
		, is_new
		, name_error
	)
	SELECT
		MPO_T.id_order
		, MPO_T.id_order
		, IFNULL(IFNULL(MPO_T.id_currency, MPO.id_currency), 0) AS id_currency
		, IFNULL(IFNULL(MPO_T.active, MPO.active), 1) AS active
		, IFNULL(MPO_T.id_order, 0) < 1 AS is_new
		, CASE WHEN IFNULL(MPO_T.id_order, -1) < 0 THEN
			CONCAT('New Manufacturing Purchase Order ', MPO_T.id_order)
		ELSE
			CONCAT(
				IFNULL(IFNULL(MPO_T.id_order, MPO.id_order), '(No Manufacturing Purchase Order)')
				, ' - '
				, IFNULL(IFNULL(MPO_T.id_currency, MPO.id_currency), '(No Currency)')
			)
		END AS name_error
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Temp MPO_T
	LEFT JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO ON MPO_T.id_order = MPO.id_order
	WHERE MPO_T.GUID = a_guid
	;

	INSERT INTO tmp_Manufacturing_Purchase_Order_Product_Link (
		id_link
		, id_order
        , id_product
		, id_permutation
		, id_unit_quantity
		, quantity_used
		, quantity_produced
		, id_unit_latency_manufacture
		, latency_manufacture
		, display_order
		, active
		, cost_unit_local_VAT_excl
		, cost_unit_local_VAT_incl
		, price_unit_local_VAT_excl
		, price_unit_local_VAT_incl
		, has_order
		, is_new
	)
	SELECT 
		IFNULL(MPOPL_T.id_link, 0) AS id_link
		, IFNULL(IFNULL(MPOPL_T.id_order, MPOPL.id_order), 0) AS id_order
        , IFNULL(MPOPL_T.id_product, PP.id_product) AS id_product
		, IFNULL(
			IFNULL(
				IFNULL(
					MPOPL_T.id_permutation
                    , CASE WHEN NOT ISNULL(MPOPL_T.id_product) AND NOT ISNULL(MPOPL_T.csv_list_variations) THEN
						partsltd_prod.fn_shop_get_id_product_permutation_from_variation_csv_list(MPOPL_T.id_product, MPOPL_T.csv_list_variations)
					ELSE NULL END
				)
                , MPOPL.id_permutation
			)
            , 0
		) AS id_permutation
		, IFNULL(IFNULL(MPOPL_T.id_unit_quantity, MPOPL.id_unit_quantity), 0) AS id_unit_quantity
		, MPOPL_T.quantity_used AS quantity_used
		, MPOPL_T.quantity_produced AS quantity_produced
		, MPOPL_T.id_unit_latency_manufacture AS id_unit_latency_manufacture
		, MPOPL_T.latency_manufacture AS latency_manufacture
		, IFNULL(MPOPL_T.display_order, RANK() OVER (PARTITION BY IFNULL(IFNULL(MPOPL_T.id_order, MPOPL.id_order), 0) ORDER BY IFNULL(IFNULL(MPOPL_T.display_order, MPOPL.display_order), 0))) AS display_order
		, IFNULL(IFNULL(MPOPL_T.active, MPOPL.active), 1) AS active
		-- , MPOPL_T.cost_total_local_VAT_excl / MPOPL_T.quantity_used AS cost_unit_local_VAT_excl
 		-- , MPOPL_T.cost_total_local_VAT_incl / MPOPL_T.quantity_used AS cost_unit_local_VAT_incl
		, IFNULL(MPOPL_T.cost_unit_local_VAT_excl, MPOPL.cost_unit_local_VAT_excl) AS cost_unit_local_VAT_excl
		, IFNULL(MPOPL_T.cost_unit_local_VAT_incl, MPOPL.cost_unit_local_VAT_incl) AS cost_unit_local_VAT_incl
		, IFNULL(MPOPL_T.price_unit_local_VAT_excl, MPOPL.price_unit_local_VAT_excl) AS price_unit_local_VAT_excl
		, IFNULL(MPOPL_T.price_unit_local_VAT_incl, MPOPL.price_unit_local_VAT_incl) AS price_unit_local_VAT_incl
		, NOT ISNULL(t_MPO.id_order) AS has_order
	    , IFNULL(MPOPL_T.id_link, 0) < 1 AS is_new
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp MPOPL_T
	LEFT JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link MPOPL ON MPOPL_T.id_link = MPOPL.id_link
	LEFT JOIN tmp_Manufacturing_Purchase_Order t_MPO ON MPOPL_T.id_order = t_MPO.id_order
	LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON MPOPL.id_permutation = PP.id_permutation
	WHERE MPOPL_T.GUID = a_guid
	;

    UPDATE tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
	-- INNER JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp MPOPL_T ON t_MPOPL.id_order = MPOPL_T.id_order
    LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_MPOPL.id_permutation = PP.id_permutation
    LEFT JOIN partsltd_prod.Shop_Product P ON PP.id_product = P.id_product
    LEFT JOIN partsltd_prod.Shop_Product_Category PC ON P.id_category = PC.id_category
	SET 
		name_error = CONCAT(
			CASE WHEN ISNULL(t_MPOPL.id_permutation) THEN
				CASE WHEN ISNULL(PP.id_product) THEN
					'(No Product Permutation)'
				ELSE
					CONCAT(
						PC.name
                        , ' - '
                        , P.name
                    )
                END
			ELSE 
				fn_shop_get_product_permutation_name(PP.id_permutation) 
			END
			, ' - x'
			, IFNULL(t_MPOPL.quantity_used, '(No Quantity)')
            , ' Used  - x'
			, IFNULL(t_MPOPL.quantity_produced, '(No Quantity)')
            , ' Produced'
		)
		, cost_total_local_VAT_excl = t_MPOPL.quantity_used * t_MPOPL.cost_unit_local_VAT_excl
		, cost_total_local_VAT_incl = t_MPOPL.quantity_used * t_MPOPL.cost_unit_local_VAT_incl
		, price_total_local_VAT_excl = t_MPOPL.quantity_produced * t_MPOPL.price_unit_local_VAT_excl
		, price_total_local_VAT_incl = t_MPOPL.quantity_produced * t_MPOPL.price_unit_local_VAT_incl
	;
	
	-- Insert missing order records
	INSERT INTO tmp_Manufacturing_Purchase_Order (
		id_order
		, id_order_temp
		, id_currency
		, active
		, is_new
		, name_error
	)
	SELECT
		MPO.id_order
		, MPO.id_order_temp
		, MPO.id_currency
		, MPO.active
		, FALSE AS is_new
		, CONCAT(
			IFNULL(MPO.id_order, '(No Manufacturing Purchase Order)')
			, ' - '
			, IFNULL(MPO.id_currency, '(No Currency)')
		) AS name_error
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order MPO
	INNER JOIN tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL 
		ON MPO.id_order = t_MPOPL.id_order
		AND t_MPOPL.has_order = 0
	;
	
    UPDATE tmp_Manufacturing_Purchase_Order t_MPO
	INNER JOIN (
		SELECT 
			t_MPOPL.id_order
			, SUM(t_MPOPL.cost_total_local_VAT_excl) AS cost_total_local_VAT_excl
            , SUM(t_MPOPL.cost_total_local_VAT_incl) AS cost_total_local_VAT_incl
			, SUM(t_MPOPL.price_total_local_VAT_excl) AS price_total_local_VAT_excl
            , SUM(t_MPOPL.price_total_local_VAT_incl) AS price_total_local_VAT_incl
        FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		GROUP BY t_MPOPL.id_order
	) SUM_t_MPOPL ON t_MPO.id_order = SUM_t_MPOPL.id_order
	SET 
		t_MPO.cost_total_local_VAT_excl = SUM_t_MPOPL.cost_total_local_VAT_excl
		, t_MPO.cost_total_local_VAT_incl = SUM_t_MPOPL.cost_total_local_VAT_incl
		, t_MPO.price_total_local_VAT_excl = SUM_t_MPOPL.price_total_local_VAT_excl
		, t_MPO.price_total_local_VAT_incl = SUM_t_MPOPL.price_total_local_VAT_incl
	;

    -- Validation
	-- Manufacturing Purchase Order
    # id_order
    IF EXISTS (
		SELECT * 
        FROM tmp_Manufacturing_Purchase_Order t_MPO
        LEFT JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO ON t_MPO.id_order = MPO.id_order
        WHERE 1=1
			AND t_MPO.id_order > 0
			AND ISNULL(MPO.id_order)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'A valid ID is required for the following Manufacturing Purchase Order(s): '
				, GROUP_CONCAT(t_MPO.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Manufacturing_Purchase_Order t_MPO
        LEFT JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO ON t_MPO.id_order = MPO.id_order
        WHERE 1=1
			AND t_MPO.id_order > 0
			AND ISNULL(MPO.id_order)
		;
    END IF;
    # id_currency
    IF EXISTS (
		SELECT * 
        FROM tmp_Manufacturing_Purchase_Order t_MPO
        LEFT JOIN partsltd_prod.Shop_Currency C ON t_MPO.id_currency = C.id_currency
        WHERE 1=1
			AND (
				ISNULL(C.id_currency)
				OR C.active = 0
			)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'A valid currency is required for the following Manufacturing Purchase Order(s): '
				, GROUP_CONCAT(CONCAT(t_MPO.name_error, ' - ', t_MPO.id_currency) SEPARATOR ', ')
			) AS msg
		FROM tmp_Manufacturing_Purchase_Order t_MPO
        LEFT JOIN partsltd_prod.Shop_Currency C ON t_MPO.id_currency = C.id_currency
        WHERE 1=1
			AND (
				ISNULL(C.id_currency)
				OR C.active = 0
			)
		;
    END IF;
    # id_unit_quantity
    IF EXISTS (
		SELECT * 
        FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
        LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM ON t_MPOPL.id_unit_quantity = UM.id_unit_measurement
        WHERE 1=1
			AND (
				ISNULL(UM.id_unit_measurement)
				OR UM.active = 0
			)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'A valid unit measurement of quantity is required for the following Manufacturing Purchase Order(s): '
				, GROUP_CONCAT(CONCAT(t_MPOPL.name_error, ' - ', t_MPO.id_unit_quantity) SEPARATOR ', ')
			) AS msg
        FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
        LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM ON t_MPOPL.id_unit_quantity = UM.id_unit_measurement
        WHERE 1=1
			AND (
				ISNULL(UM.id_unit_measurement)
				OR UM.active = 0
			)
		;
    END IF;
	# Invalid quantity used
	IF EXISTS (
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			ISNULL(t_MPOPL.quantity_used)
			OR t_MPOPL.quantity_used <= 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'A valid quantity used is required for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(CONCAT(t_MPOPL.name_error, ' - ', t_MPOPL.quantity_used) SEPARATOR ', ')
			)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.quantity_used)
			AND t_MPOPL.quantity_used <= 0
		;
	END IF;
	# Invalid quantity produced
	IF EXISTS (
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE
			NOT ISNULL(t_MPOPL.quantity_produced)
			AND t_MPOPL.quantity_produced < 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'A valid quantity produced is required for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(CONCAT(t_MPOPL.name_error, ' - ', t_MPOPL.quantity_produced) SEPARATOR ', ')
			)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.quantity_produced)
			AND t_MPOPL.quantity_produced < 0
		;
	END IF;
    # id_unit_latency_manufacture
    IF EXISTS (
		SELECT * 
        FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
        LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM ON t_MPOPL.id_unit_latency_manufacture = UM.id_unit_measurement
        WHERE 
			ISNULL(t_MPOPL.id_unit_latency_manufacture)
			OR ISNULL(UM.id_unit_measurement)
			OR UM.active = 0
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'A valid unit measurement of manufacture latency is required for the following Manufacturing Purchase Order(s): '
				, GROUP_CONCAT(CONCAT(t_MPOPL.name_error, ' - ', t_MPOPL.id_unit_latency_manufacture) SEPARATOR ', ')
			) AS msg
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
        LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM ON t_MPOPL.id_unit_latency_manufacture = UM.id_unit_measurement
        WHERE 
			ISNULL(t_MPOPL.id_unit_latency_manufacture)
			OR ISNULL(UM.id_unit_measurement)
			OR UM.active = 0
		;
    END IF;
	# Invalid manufacture latency
	IF EXISTS (
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE t_MPOPL.latency_manufacture < 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'A valid manufacture latency is required for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(CONCAT(t_MPOPL.name_error, ' - ', t_MPOPL.latency_manufacture) SEPARATOR ', ')
			)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE t_MPOPL.latency_manufacture < 0
		;
	END IF;
    
	# Invalid costs excl VAT
	IF EXISTS (
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.cost_unit_local_VAT_excl)
			AND t_MPOPL.cost_unit_local_VAT_excl < 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'A valid cost excluding VAT is required for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(CONCAT(t_MPOPL.name_error, ' - ', t_MPOPL.cost_unit_local_VAT_excl) SEPARATOR ', ')
			)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.cost_unit_local_VAT_excl)
			AND t_MPOPL.cost_unit_local_VAT_excl < 0
		;
	END IF;
	# Invalid costs incl VAT
	IF EXISTS (
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.cost_unit_local_VAT_incl)
			AND t_MPOPL.cost_unit_local_VAT_incl < 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'A valid cost including VAT is required for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(CONCAT(t_MPOPL.name_error, ' - ', t_MPOPL.cost_unit_local_VAT_incl) SEPARATOR ', ')
			)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.cost_unit_local_VAT_incl)
			AND t_MPOPL.cost_unit_local_VAT_incl < 0
		;
	END IF;
    
	# Invalid prices excl VAT
	IF EXISTS (
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.price_unit_local_VAT_excl)
			AND t_MPOPL.price_unit_local_VAT_excl < 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'A valid price excluding VAT is required for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(CONCAT(t_MPOPL.name_error, ' - ', t_MPOPL.price_unit_local_VAT_excl) SEPARATOR ', ')
			)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.price_unit_local_VAT_excl)
			AND t_MPOPL.price_unit_local_VAT_excl < 0
		;
	END IF;
	# Invalid prices incl VAT
	IF EXISTS (
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.price_unit_local_VAT_incl)
			AND t_MPOPL.price_unit_local_VAT_incl < 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'A valid price including VAT is required for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(CONCAT(t_MPOPL.name_error, ' - ', t_MPOPL.price_unit_local_VAT_incl) SEPARATOR ', ')
			)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			NOT ISNULL(t_MPOPL.price_unit_local_VAT_incl)
			AND t_MPOPL.price_unit_local_VAT_incl < 0
		;
	END IF;
    
    -- Duplicates
    /*
	IF EXISTS (
		SELECT 
			t_MPOPL.id_permutation
			, t_MPOPL.name_error
			, COUNT(*)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL 
		GROUP BY t_MPOPL.id_permutation, t_MPOPL.name_error
		HAVING COUNT(*) > 1
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT('Duplicate records: ', GROUP_CONCAT(t_MPOPLC.name_error SEPARATOR ', '))
		FROM (
			SELECT 
				t_MPOPL.id_permutation
				, t_MPOPL.name_error
				, COUNT(*)
			FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL 
			GROUP BY t_MPOPL.id_permutation, t_MPOPL.name_error
			HAVING COUNT(*) > 1
		) t_MPOPLC
		;
	END IF;
    */
	-- Empty Manufacturing Purchase Order
	IF EXISTS ( SELECT * FROM tmp_Manufacturing_Purchase_Order t_MPO LEFT JOIN tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL ON t_MPO.id_order = t_MPOPL.id_order WHERE ISNULL(t_MPOPL.id_order) ) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'There are no items in the following Manufacturing Purchase Order(s): '
				, GROUP_CONCAT(t_MPO.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Manufacturing_Purchase_Order t_MPO 
		LEFT JOIN tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL ON t_MPO.id_order = t_MPOPL.id_order 
		WHERE ISNULL(t_MPOPL.id_order)
		;
	END IF;
	
	-- Manufacturing Purchase Order Items without Order
	IF EXISTS ( 
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL 
		LEFT JOIN tmp_Manufacturing_Purchase_Order t_MPO ON t_MPOPL.id_order = t_MPO.id_order
		WHERE ISNULL(t_MPO.id_order) 
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'There is no order for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(t_MPOPL.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL 
		LEFT JOIN tmp_Manufacturing_Purchase_Order t_MPO ON t_MPOPL.id_order = t_MPO.id_order
		WHERE ISNULL(t_MPO.id_order) 
		;
	END IF;
    
    -- Permissions
	SET v_ids_product_permission := (
		SELECT 
			GROUP_CONCAT(DISTINCT PP.id_product SEPARATOR ',')
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		INNER JOIN partsltd_prod.Shop_Product_Permutation PP ON t_MPOPL.id_permutation = PP.id_permutation
	);
	IF a_debug = 1 THEN
		SELECT 
			a_guid
			, a_id_user
			, FALSE -- get inactive users
			, v_ids_permission_manufacturing_purchase_order
			, v_id_access_level_edit
			, v_ids_product_permission -- ids_product
			, 0 -- a_debug
		;
		SELECT * 
		FROM partsltd_prod.Shop_Calc_User_Temp
		WHERE GUID = a_guid
		;
	END IF;
	
	CALL p_shop_calc_user(
		a_guid
		, a_id_user
		, FALSE -- get inactive users
		, v_ids_permission_manufacturing_purchase_order
		, v_id_access_level_edit
		, v_ids_product_permission -- ids_product
		, 0 -- a_debug
	);
	
	IF a_debug = 1 THEN
		SELECT * from partsltd_prod.Shop_Calc_User_Temp WHERE GUID = a_guid;
	END IF;
	
	IF EXISTS (SELECT * FROM partsltd_prod.Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = a_guid AND IFNULL(UE_T.can_view, 0) = 0) THEN
		DELETE FROM tmp_Msg_Error;

		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_no_permission
			, v_code_type_error_no_permission
			, CONCAT(
				'You do not have edit permissions for '
				, GROUP_CONCAT(name SEPARATOR ', ') 
			)
		FROM partsltd_prod.Shop_Permission PERM
		INNER JOIN partsltd_prod.Shop_Calc_User_Temp UE_T 
			ON PERM.id_permission = UE_T.id_permission
			AND UE_T.GUID = a_guid
			AND IFNULL(UE_T.can_view, 0) = 0
		;
	END IF;

	CALL partsltd_prod.p_shop_clear_calc_user( 
		a_guid
		, 0 -- a_debug 
	);

	-- Changed quantity used
	IF EXISTS (
		SELECT *
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		INNER JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link MPOPL ON t_MPOPL.id_link = MPOPL.id_link
		INNER JOIN partsltd_prod.Shop_Stock_Item SI ON MPOPL.id_permutation = SI.id_permutation
		WHERE 
			t_MPOPL.is_new = 0
			AND t_MPOPL.quantity_used <> MPOPL.quantity_used
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
            , code
            , msg
		)
        SELECT
			v_id_type_error_warning
            , v_code_type_error_warning
            , CONCAT(
				'The quantity used has changed on the following orders. Please update the stock items appropriately.'
                , GROUP_CONCAT(
					CONCAT(
						t_MPOPL.name_error
                        , ' - from '
                        , MPOPL.quantity_used
                        , ' to '
                        , t_MPOPL.quantity_used
					) SEPARATOR ', '
				)
			) AS msg
		;
    END IF;
	-- Changed quantity produced
	IF EXISTS (
		SELECT *
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		INNER JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link MPOPL ON t_MPOPL.id_link = MPOPL.id_link
		INNER JOIN partsltd_prod.Shop_Stock_Item SI ON MPOPL.id_permutation = SI.id_permutation
		WHERE 
			t_MPOPL.is_new = 0
			AND t_MPOPL.quantity_produced <> MPOPL.quantity_produced
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
            , code
            , msg
		)
        SELECT
			v_id_type_error_warning
            , v_code_type_error_warning
            , CONCAT(
				'The quantity produced has changed on the following orders. Please update the stock items appropriately.'
                , GROUP_CONCAT(
					CONCAT(
						t_MPOPL.name_error
                        , ' - from '
                        , MPOPL.quantity_produced
                        , ' to '
                        , t_MPOPL.quantity_produced
					) SEPARATOR ', '
				)
			) AS msg
		;
    END IF;
    
	IF EXISTS ( SELECT * FROM tmp_Msg_Error WHERE id_type <> v_id_type_error_warning LIMIT 1 ) THEN
		DELETE FROM tmp_Manufacturing_Purchase_Order_Product_Link;
		DELETE FROM tmp_Manufacturing_Purchase_Order;
	END IF;
	
	-- Transaction    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		START TRANSACTION;
			INSERT INTO Shop_Sales_And_Purchasing_Change_Set (
				comment
				, updated_last_by
				, updated_last_on
			)
			VALUES (
				a_comment
				, a_id_user
				, v_time_start
			);
			
			SET v_id_change_set := LAST_INSERT_ID();
		
			INSERT INTO partsltd_prod.Shop_Manufacturing_Purchase_Order (
				id_order_temp
				, id_currency
				, cost_total_local_VAT_excl
				, cost_total_local_VAT_incl
				, price_total_local_VAT_excl
				, price_total_local_VAT_incl
				, active
				, created_by
				, created_on
				, id_change_set
			)
			SELECT
				t_MPO.id_order_temp
				, t_MPO.id_currency
				, t_MPO.cost_total_local_VAT_excl
				, t_MPO.cost_total_local_VAT_incl
				, t_MPO.price_total_local_VAT_excl
				, t_MPO.price_total_local_VAT_incl
				, t_MPO.active
				, a_id_user
				, v_time_start
				, v_id_change_set
			FROM tmp_Manufacturing_Purchase_Order t_MPO
			INNER JOIN tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL ON t_MPO.id_order = t_MPOPL.id_order
			WHERE t_MPO.is_new = 1
			;
			
			UPDATE tmp_Manufacturing_Purchase_Order t_MPO
			INNER JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO 
				ON t_MPO.id_order_temp = MPO.id_order_temp
				AND MPO.id_change_set = v_id_change_set
			SET 
				t_MPO.id_order = MPO.id_order
			WHERE t_MPO.is_new = 1
			;
            
			UPDATE tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
			INNER JOIN tmp_Manufacturing_Purchase_Order t_MPO ON t_MPOPL.id_order = t_MPO.id_order_temp
			SET 
				t_MPOPL.id_order = t_MPO.id_order
			WHERE t_MPO.is_new = 1
			;
			
			INSERT INTO Shop_Manufacturing_Purchase_Order_Product_Link (
				id_order
				, id_permutation
				, id_unit_quantity
				, quantity_used
				, quantity_produced
				, id_unit_latency_manufacture
				, latency_manufacture
				, display_order
				, active
				, cost_unit_local_VAT_excl
				, cost_unit_local_VAT_incl
				, price_unit_local_VAT_excl
				, price_unit_local_VAT_incl
				, created_by
                , created_on
				, id_change_set
			)
			SELECT
				t_MPOPL.id_order
				, t_MPOPL.id_permutation
				, t_MPOPL.id_unit_quantity
				, t_MPOPL.quantity_used
				, t_MPOPL.quantity_produced
				, t_MPOPL.id_unit_latency_manufacture
				, t_MPOPL.latency_manufacture
				, t_MPOPL.display_order
				, t_MPOPL.active
				, t_MPOPL.cost_unit_local_VAT_excl
				, t_MPOPL.cost_unit_local_VAT_incl
				, t_MPOPL.price_unit_local_VAT_excl
				, t_MPOPL.price_unit_local_VAT_incl
				, a_id_user
                , v_time_start
				, v_id_change_set
			FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
			WHERE t_MPOPL.is_new = 1
			;
		
			UPDATE partsltd_prod.Shop_Manufacturing_Purchase_Order MPO
			INNER JOIN tmp_Manufacturing_Purchase_Order t_MPO 
				ON MPO.id_order = t_MPO.id_order
				AND t_MPO.is_new = 0
			INNER JOIN tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL ON t_MPO.id_order = t_MPOPL.id_order
			SET
				MPO.id_currency = t_MPO.id_currency
				, MPO.cost_total_local_VAT_excl = t_MPO.cost_total_local_VAT_excl
				, MPO.cost_total_local_VAT_incl = t_MPO.cost_total_local_VAT_incl
				, MPO.price_total_local_VAT_excl = t_MPO.price_total_local_VAT_excl
				, MPO.price_total_local_VAT_incl = t_MPO.price_total_local_VAT_incl
				, MPO.active = t_MPO.active
				, MPO.id_change_set = v_id_change_set
			;
			
			UPDATE partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link MPOPL
			INNER JOIN tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
				ON MPOPL.id_link = t_MPOPL.id_link
				AND t_MPOPL.is_new = 0
			SET
				MPOPL.id_order = t_MPOPL.id_order
				, MPOPL.id_permutation = t_MPOPL.id_permutation
				, MPOPL.id_unit_quantity = t_MPOPL.id_unit_quantity
				, MPOPL.quantity_used = t_MPOPL.quantity_used
				, MPOPL.quantity_produced = t_MPOPL.quantity_produced
				, MPOPL.id_unit_latency_manufacture = t_MPOPL.id_unit_latency_manufacture
				, MPOPL.latency_manufacture = t_MPOPL.latency_manufacture
				, MPOPL.display_order = t_MPOPL.display_order
				, MPOPL.active = t_MPOPL.active
				, MPOPL.cost_unit_local_VAT_excl = t_MPOPL.cost_unit_local_VAT_excl
				, MPOPL.cost_unit_local_VAT_incl = t_MPOPL.cost_unit_local_VAT_incl
				, MPOPL.price_unit_local_VAT_excl = t_MPOPL.price_unit_local_VAT_excl
				, MPOPL.price_unit_local_VAT_incl = t_MPOPL.price_unit_local_VAT_incl
				, MPOPL.id_change_set = v_id_change_set
			;
		
			DELETE MPO_T
			FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Temp MPO_T
			WHERE MPO_T.GUID = a_guid
			;
			DELETE MPOPL_T
			FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp MPOPL_T
			WHERE MPOPL_T.GUID = a_guid
			;
			
		COMMIT;
    END IF;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
	INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
	;
    
	IF a_debug = 1 THEN
		SELECT * from tmp_Manufacturing_Purchase_Order;
		SELECT * from tmp_Manufacturing_Purchase_Order_Product_Link;
	END IF;

    DROP TEMPORARY TABLE tmp_Manufacturing_Purchase_Order;
    DROP TEMPORARY TABLE tmp_Manufacturing_Purchase_Order_Product_Link;
    DROP TEMPORARY TABLE tmp_Msg_Error;
    
	IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
	END IF;
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
	id_currency,
	quantity_used,
	id_unit_quantity,
	quantity_produced,
	latency_manufacture,
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
		1, # id_currency,
		1, # quantity_used,
		1, # id_unit_quantity,
		1, # quantity_produced,
		14, # latency_manufacture ,
		1, # display_order
        1 # active
    )
;

SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

CALL p_shop_save_manufacturing_purchase_order (
	'TEST SAVE'
	, 'NIPS' # a_guid
    , 1 -- 'auth0|6582b95c895d09a70ba10fef', # a_id_user
	, 1 -- a_debug
);

SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;
DELETE FROM Shop_Manufacturing_Purchase_Order_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order;


*/



-- File: 7415_p_shop_save_Manufacturing_purchase_order_test.sql


-- Clear previous proc
DROP PROCEDURE IF EXISTS partsltd_prod.p_shop_save_Manufacturing_purchase_order_test;


DELIMITER //
CREATE PROCEDURE p_shop_save_Manufacturing_purchase_order_test ()
BEGIN
	
	DECLARE v_guid BINARY(36);
	DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_guid := 'nips';

	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order
	;
	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link
	;
	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp
	;
    
	START TRANSACTION;
    
		DELETE FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Temp;
		DELETE FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

		INSERT INTO partsltd_prod.Shop_Manufacturing_Purchase_Order_Temp (
			id_order
			, id_currency
            , active
            , GUID
		)
        /* Test 1 - Insert */
        VALUES (
			-1
            , 1
            , 1
            , v_guid
        )
        /* Test 2: Alter
        SELECT 
			id_order
			, id_currency
            , active
            , v_guid
		FROM partsltd_prod.Shop_Manufacturing_Purchase_Order
        WHERE id_order = 6
        */
		;-- SELECT * FROM partsltd_prod.Shop_Unit_Measurement;
        
		INSERT INTO partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp (
			id_link
			, id_order
			, id_permutation
			, id_unit_quantity
			, quantity_used
			, quantity_produced
			, id_unit_latency_manufacture
            , latency_manufacture
			, display_order
			, active
            , GUID
		)
        /* Test 1 - Insert */
        VALUES (
			-1 -- id_link
            , -1 -- id_order
            , 3 -- id_permutation
            , 3 -- id_unit_quantity
            , 3 -- quantity_used
            , 0 -- quantity_produced
            , 4 -- id_unit_latency_manufacture
            , 4 -- latency_manufacture
            , 1 -- display_order
            , 1 -- active
            , v_guid -- 
        )
        /* Test 2: Alter
        SELECT
			id_link
			, id_order
			, id_permutation
			, id_unit_quantity
			, quantity_used
			, quantity_produced
			, id_unit_latency_manufacture
			, latency_manufacture
			, display_order
			, active
            , v_guid
		FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link
        WHERE id_order = 6
        */
        ;
        
	COMMIT;
    
	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Temp
	WHERE GUID = v_guid
    ;
    
	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp
	WHERE GUID = v_guid
    ;
    
    CALL partsltd_prod.p_shop_save_Manufacturing_purchase_order ( 
		'Test save Manufacturing Purchase Order' -- comment
        , v_guid -- guid
        , 1 -- id_user
		, 1 -- debug
    );
    
	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp
	;
	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order
	;
	SELECT *
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link
	;
    
	CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
END //
DELIMITER ;;

/*
CALL partsltd_prod.p_shop_save_Manufacturing_purchase_order_test ();

DELETE FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Temp;
DELETE FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

DROP TABLE IF EXISTS tmp_Msg_Error;

select * from partsltd_prod.Shop_User;
Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'partsltd_prod.t_MPOPL.name_error' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
*/

-- File: 7416_p_shop_get_many_manufacturing_purchase_order.sql


DROP PROCEDURE IF EXISTS p_shop_get_many_manufacturing_purchase_order;

DELIMITER //
CREATE PROCEDURE p_shop_get_many_manufacturing_purchase_order (
	IN a_id_user INT,
    IN a_get_all_order BIT,
	IN a_get_inactive_order BIT,
	IN a_ids_order TEXT,
	IN a_ids_permutation TEXT,
    IN a_date_from DATETIME,
    IN a_date_to DATETIME,
	IN a_debug BIT
)
BEGIN
    DECLARE v_code_type_error_bad_data VARCHAR(50);
	DECLARE v_code_type_error_no_permission VARCHAR(50);
    DECLARE v_guid BINARY(36);
    DECLARE v_has_filter_order BIT;
    DECLARE v_has_filter_permutation BIT;
    DECLARE v_has_filter_date_from BIT;
    DECLARE v_has_filter_date_to BIT;
    DECLARE v_id_access_level_view INT;
    DECLARE v_ids_permission_manufacturing_purchase_order VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_type_error_no_permission INT;
    DECLARE v_time_start TIMESTAMP(6);
    
	SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_code_type_error_bad_data := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_bad_data := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_code_type_error_no_permission := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
    SET v_id_type_error_no_permission := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_no_permission);
    SET v_ids_permission_manufacturing_purchase_order := (SELECT GROUP_CONCAT(id_permission SEPARATOR ',') FROM partsltd_prod.Shop_Permission WHERE code IN ('STORE_MANUFACTURING_PURCHASE_ORDER', 'STORE_PRODUCT'));
	
	SET a_get_all_order := IFNULL(a_get_all_order, 1);
	SET a_get_inactive_order := IFNULL(a_get_inactive_order, 0);
	SET a_ids_order := TRIM(IFNULL(a_ids_order, ''));
	SET a_ids_permutation := TRIM(IFNULL(a_ids_permutation, ''));
	SET a_date_from := IFNULL(a_date_from, NULL);
	SET a_date_to := IFNULL(a_date_to, NULL);
	SET a_debug := IFNULL(a_debug, 0);
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Manufacturing_Purchase_Order_Product_Link;
    DROP TEMPORARY TABLE IF EXISTS tmp_Manufacturing_Purchase_Order;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    DROP TEMPORARY TABLE IF EXISTS tmp_Split;
    
    CREATE TEMPORARY TABLE tmp_Manufacturing_Purchase_Order (
		id_order INT NOT NULL PRIMARY KEY
    );
    
    CREATE TEMPORARY TABLE tmp_Permutation (
		id_permutation INT NOT NULL PRIMARY KEY
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		id_type INT NOT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Split (
		substring VARCHAR(4000) NOT NULL
        , as_int INT NULL
	);
    DELETE FROM tmp_Split;
    
    SET v_has_filter_order = CASE WHEN a_ids_order = '' THEN 0 ELSE 1 END;
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_date_from = CASE WHEN ISNULL(a_date_from) THEN 0 ELSE 1 END;
    SET v_has_filter_date_to = CASE WHEN ISNULL(a_date_to) THEN 0 ELSE 1 END;

	IF a_debug = 1 THEN
		SELECT
			v_has_filter_order
			, v_has_filter_permutation
			, v_has_filter_date_from
			, v_has_filter_date_to
		;
	END IF;
    
    -- Permutations
    IF v_has_filter_permutation = 1 THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_permutation, ',', a_debug);
		
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
            LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_S.as_int = PP.id_permutation
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(PP.id_permutation)
				OR PP.active = 0
		) THEN
			INSERT INTO tmp_Msg_Error (
				id_type,
				code,
				msg
			)
			SELECT
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive permutation IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_S.as_int = PP.id_permutation
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(PP.id_permutation)
				OR PP.active = 0
			;
		ELSE
			INSERT INTO tmp_Permutation (
				id_permutation
			)
			SELECT 
				PP.id_permutation
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_S.as_int = PP.id_permutation
			WHERE (
					v_has_filter_permutation = 0
					OR NOT ISNULL(t_S.as_int)
				)
			;
		END IF;
	END IF;

	DELETE FROM tmp_Split;
    
    -- Manufacturing Purchase Orders
    IF v_has_filter_order = 1 THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_order, ',', a_debug);
		
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
            LEFT JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO ON t_S.as_int = MPO.id_order
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(MPO.id_order)
				OR (
					MPO.active = 0
					AND a_get_inactive_order = 0
				)
		) THEN
			INSERT INTO tmp_Msg_Error (
				id_type,
				code,
				msg
			)
			SELECT
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive Manufacturing Purchase Order IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO ON t_S.as_int = MPO.id_order
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(MPO.id_order)
				OR (
					MPO.active = 0
					AND a_get_inactive_order = 0
				)
			;
		ELSE
			INSERT INTO tmp_Manufacturing_Purchase_Order (
				id_order
			)
			SELECT 
				MPO.id_order
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO ON t_S.as_int = MPO.id_order
			INNER JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link MPOPL ON MPO.id_order = MPOPL.id_order
			INNER JOIN tmp_Permutation t_PP ON MPOPL.id_permutation = t_PP.id_permutation
			WHERE (
					a_get_all_order = 1
					OR (
						v_has_filter_order = 1
						AND NOT ISNULL(t_S.as_int)
					)
					OR (
						v_has_filter_permutation = 1
						AND NOT ISNULL(t_PP.id_permutation)
					)
				)
				AND (
					a_get_inactive_order = 1
					OR MPO.active = 1
				)
				AND (
					v_has_filter_date_from = 0
					OR MPO.created_on > a_date_from
				)
				AND (
					v_has_filter_date_to = 0
					OR MPO.created_on < a_date_to
				)
				
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    -- Permissions
	IF a_debug = 1 THEN
		SELECT 
			v_guid
			, a_id_user
			, FALSE -- get inactive users
			, v_ids_permission_manufacturing_purchase_order
			, v_id_access_level_view
			, '' -- ids_product
			, 0 -- a_debug
		;
		SELECT * FROM partsltd_prod.Shop_Calc_User_Temp;
	END IF;
	
	CALL p_shop_calc_user(
		v_guid
		, a_id_user
		, FALSE -- get inactive users
		, v_ids_permission_manufacturing_purchase_order
		, v_id_access_level_view
		, '' -- ids_product
		, 0 -- a_debug
	);
	
	IF a_debug = 1 THEN
		SELECT * FROM partsltd_prod.Shop_Calc_User_Temp;
	END IF;
	
	IF NOT EXISTS (SELECT can_view FROM partsltd_prod.Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
		DELETE FROM tmp_Msg_Error;

		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		VALUES (
			v_id_type_error_no_permission
			, v_code_type_error_no_permission
			, CONCAT('You do not have view permissions for ', IFNULL((SELECT IFNULL(name, '(No Permission Name)') FROM partsltd_prod.Shop_Permission WHERE FIND_IN_SET(id_permission, v_ids_permission_manufacturing_purchase_order) > 0 LIMIT 1), '(No Permissions Found)'))
		)
		;
	END IF;
    
	IF EXISTS ( SELECT * FROM tmp_Msg_Error LIMIT 1 ) THEN
		-- DELETE FROM tmp_Manufacturing_Purchase_Order_Product_Link;
		DELETE FROM tmp_Manufacturing_Purchase_Order;
	END IF;
	
    -- Returns
	/*
    # Manufacturings
    SELECT 
		t_S.id_manufacturing,
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
    FROM tmp_Manufacturing t_S
    INNER JOIN partsltd_prod.Shop_Manufacturing S
		ON t_S.id_manufacturing = S.id_manufacturing
	;
    */

    # Manufacturing Purchase Order
    SELECT 
		t_MPO.id_order
		, MPO.id_currency
        , C.code
        , C.symbol
		, MPO.cost_total_local_VAT_excl
		, MPO.cost_total_local_VAT_incl
		, MPO.price_total_local_VAT_excl
		, MPO.price_total_local_VAT_incl
        , MPO.active
        , MPO.created_on
        , CONCAT(
			MPO.cost_total_local_VAT_excl
            , ' on '
            , MPO.created_on
		) AS name
    FROM tmp_Manufacturing_Purchase_Order t_MPO 
	INNER JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO ON MPO.id_order = t_MPO.id_order
    LEFT JOIN partsltd_prod.Shop_Currency C ON MPO.id_currency = C.id_currency
    ;
    
    # Manufacturing Purchase Order Product Link
    SELECT
		MPOPL.id_link
		, MPOPL.id_order
        , P.id_category
        , P.id_product
		, MPOPL.id_permutation
        , fn_shop_get_product_permutation_name(MPOPL.id_permutation) AS name_permutation
        , fn_shop_get_product_permutation_variations_csv(MPOPL.id_permutation) AS csv_id_pairs_variation
		, MPOPL.id_unit_quantity
		, MPOPL.quantity_used
		, MPOPL.quantity_produced
        , MPOPL.id_unit_latency_manufacture
		, MPOPL.latency_manufacture
		, MPOPL.display_order
        , MPOPL.cost_unit_local_VAT_excl
        , MPOPL.cost_unit_local_VAT_incl
        , MPOPL.price_unit_local_VAT_excl
        , MPOPL.price_unit_local_VAT_incl
        , MPOPL.active
    FROM tmp_Manufacturing_Purchase_Order t_MPO
	INNER JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link MPOPL ON t_MPO.id_order = MPOPL.id_order
    LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON MPOPL.id_permutation = PP.id_permutation
    LEFT JOIN partsltd_prod.Shop_Product P ON PP.id_product = P.id_product
    ;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
    INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
    ;
    
    IF a_debug = 1 THEN
		SELECT * from tmp_Manufacturing_Purchase_Order;
		SELECT * from tmp_Permutation;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tmp_Manufacturing_Purchase_Order_Product_Link;
    DROP TEMPORARY TABLE IF EXISTS tmp_Manufacturing_Purchase_Order;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    DROP TEMPORARY TABLE IF EXISTS tmp_Split;
	
    IF a_debug = 1 THEN
		CALL p_debug_timing_reporting( v_time_start );
    END IF;
END //
DELIMITER ;;


/*

CALL p_shop_get_many_manufacturing_purchase_order (
	0 # a_id_user
	, 1 # a_get_all_order
	, 1 # a_get_inactive_order
    , '' # a_ids_order
    , '' # a_ids_permutation
    , NULL # a_date_from
	, NULL # a_date_to
	, 0 # a_debug
);


select *
from partsltd_prod.shop_manufacturing_purchase_order
;
select *
from partsltd_prod.shop_manufacturing_purchase_order_product_link
;
*/


-- File: 7421_p_shop_save_customer.sql




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


-- File: 7422_p_shop_get_many_customer.sql



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
		CALL p_split(v_guid, a_ids_customer, ',');
        
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


-- File: 7424_p_shop_save_customer_sales_order.sql




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



-- File: 7425_p_shop_get_many_customer_sales_order.sql




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
        latency_manufacture INT NOT NULL,
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
		CALL p_split(v_guid, a_ids_customer, ',');
        
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
			CALL p_split(v_guid, a_ids_category, ',');
			
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
			CALL p_split(v_guid, a_ids_product, ',');
			
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
			CALL p_split(v_guid, a_ids_permutation, ',');
			
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
				latency_manufacture,
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
				PP.latency_manufacture,
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
		CALL p_split(v_guid, a_ids_order, ',');
        
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


-- File: 9000_populate.sql



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
WITH RECURSIVE RANKED AS (
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
)
UPDATE partsltd_prod.Shop_Variation V
INNER JOIN RANKED ON V.id_variation = RANKED.id_variation
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
DELIMITER ;;


-- Call
CALL p_populate_database();

-- Remove proc
DROP PROCEDURE IF EXISTS p_populate_database;
*/

-- File: 9001_view.sql



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



-- File: 9010_anal.sql


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



