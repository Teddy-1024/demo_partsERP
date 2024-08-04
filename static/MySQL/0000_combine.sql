
/* Clear Store DataBase */



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
DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order;
DROP TABLE IF EXISTS tmp_Shop_Supplier;
DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order;
DROP TABLE IF EXISTS tmp_Shop_Customer;
DROP TABLE IF EXISTS tmp_Shop_Customer_Sale_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Shop_Customer_Sale_Order;



# Delete old tables
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

DROP TABLE IF EXISTS Shop_Recurrence_Interval_Audit;
DROP TABLE IF EXISTS Shop_Recurrence_Interval;

DROP TABLE IF EXISTS Shop_Product_Audit;
DROP TABLE IF EXISTS Shop_Product;

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

# Product Change Sets



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Change_Set';

CREATE TABLE Shop_Product_Change_Set (
	id_change_set INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	comment VARCHAR(500),
	updated_last_on TIMESTAMP,
	updated_last_by VARCHAR(100)
);
# User Change Sets



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Change_Set';

CREATE TABLE IF NOT EXISTS Shop_User_Change_Set (
	id_change_set INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    comment VARCHAR(500),
    updated_last_on TIMESTAMP,
    updated_last_by VARCHAR(100)
);
# Sales And Purchasing Change Sets



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Sales_And_Purchasing_Change_Set';

CREATE TABLE Shop_Sales_And_Purchasing_Change_Set (
	id_change_set INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	comment VARCHAR(500),
	updated_last_on TIMESTAMP,
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
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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
	created_on TIMESTAMP,
	created_by VARCHAR(100),
	updated_last_on TIMESTAMP,
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
	created_on TIMESTAMP,
	created_by VARCHAR(100),
	updated_last_on TIMESTAMP,
	updated_last_by VARCHAR(100)
);
# Generic / shared properties



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_General';

CREATE TABLE IF NOT EXISTS Shop_General (
	id_general INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	quantity_max FLOAT,
	created_on TIMESTAMP,
	created_by VARCHAR(100),
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
	created_on TIMESTAMP,
	created_by VARCHAR(100),
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
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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
# Plant



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Plant';

CREATE TABLE IF NOT EXISTS Shop_Plant (
	id_plant INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(500) NOT NULL,
    id_address INT NOT NULL,
    id_user_manager INT NOT NULL,
	active BIT NOT NULL DEFAULT 1,
	created_on TIMESTAMP,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_Plant_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES Shop_Product_Change_Set(id_change_set)
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
	id_plant INT NOT NULL PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    name VARCHAR(500) NOT NULL,
    id_address INT NOT NULL,
    id_user_manager INT NOT NULL,
	active BIT NOT NULL DEFAULT 1
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
	created_on TIMESTAMP,
	created_by VARCHAR(100),
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
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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
    symbol VARCHAR(1) NOT NULL,
    factor_from_GBP FLOAT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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
	created_on TIMESTAMP,
	created_by VARCHAR(100),
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
    is_base_unit BIT NOT NULL DEFAULT 0,
    is_unit_of_distance BIT NOT NULL DEFAULT 0,
    is_unit_of_mass BIT NOT NULL DEFAULT 0,
    is_unit_of_time BIT NOT NULL DEFAULT 0,
    is_unit_of_volume BIT NOT NULL DEFAULT 0,
    active BIT NOT NULL DEFAULT 1,
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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


SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Category';

CREATE TABLE IF NOT EXISTS Shop_Category (
	id_category INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50),
	name VARCHAR(255),
	description VARCHAR(4000),
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on TIMESTAMP,
	created_by VARCHAR(100),
	id_change_set INT,
	CONSTRAINT FK_Shop_Category_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_Product_Change_Set(id_change_set)
);

# Category Audits



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
	created_on TIMESTAMP,
	created_by VARCHAR(100),
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



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Temp';

CREATE TABLE IF NOT EXISTS Shop_Product_Temp (
	id_product INT NOT NULL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	id_category INT NOT NULL,
    has_variations BIT NOT NULL,
    id_access_level_required INT NOT NULL,
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL
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
	latency_manufacture INT NOT NULL,
	quantity_min FLOAT NOT NULL,
	quantity_max FLOAT NOT NULL,
	quantity_step FLOAT NOT NULL,
	quantity_stock FLOAT NOT NULL,
	is_subscription BIT NOT NULL,
	id_interval_recurrence INT,
	CONSTRAINT FK_Shop_Product_Permutation_id_interval_recurrence
		FOREIGN KEY (id_interval_recurrence)
		REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	/*
	CONSTRAINT CHECK_FK_Shop_Product_Permutation_id_interval_recurrence
		CHECK (id_interval_recurrence IN (SELECT id_unit_measurement FROM Shop_Unit_Measurement WHERE is_unit_of_time = 1)),
	*/
	count_interval_recurrence INT,
	id_stripe_product VARCHAR(100) NULL,
	does_expire_faster_once_unsealed BIT NOT NULL DEFAULT 0,
	id_interval_expiration_unsealed INT,
	CONSTRAINT FK_Shop_Product_Permutation_id_interval_expiration_unsealed
		FOREIGN KEY (id_interval_expiration_unsealed)
		REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	/*
	CONSTRAINT CHECK_FK_Shop_Product_Permutation_id_interval_expiration_unsealed
		CHECK (id_interval_expiration_unsealed IN (SELECT id_unit_measurement FROM Shop_Unit_Measurement WHERE is_unit_of_time = 1)),
	*/
	count_interval_expiration_unsealed INT,
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on TIMESTAMP,
	created_by VARCHAR(100),
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



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Product_Permutation_Temp';

CREATE TABLE IF NOT EXISTS Shop_Product_Permutation_Temp (
	id_permutation INT NOT NULL PRIMARY KEY,
	id_product INT NOT NULL,
	CONSTRAINT FK_Shop_Product_Permutation_Temp_id_product
		FOREIGN KEY (id_product)
		REFERENCES Shop_Product(id_product)
		ON UPDATE RESTRICT,
	description VARCHAR(4000) NOT NULL,
	cost_local FLOAT NOT NULL,
    id_currency_cost INT NOT NULL,
	profit_local_min FLOAT NOT NULL,
	latency_manufacture INT NOT NULL,
	quantity_min FLOAT NOT NULL,
	quantity_max FLOAT NOT NULL,
	quantity_step FLOAT NOT NULL,
	quantity_stock FLOAT NOT NULL,
	is_subscription BIT NOT NULL,
	id_interval_recurrence INT,
	CONSTRAINT FK_Shop_Product_Permutation_Temp_id_interval_recurrence
		FOREIGN KEY (id_interval_recurrence)
		REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	count_interval_recurrence INT,
	id_stripe_product VARCHAR(100) NULL,
	does_expire_faster_once_unsealed BIT NOT NULL DEFAULT 0,
	id_interval_expiration_unsealed INT,
	CONSTRAINT FK_Shop_Product_Permutation_Temp_id_interval_expiration_unsealed
		FOREIGN KEY (id_interval_expiration_unsealed)
		REFERENCES Shop_Unit_Measurement(id_unit_measurement),
	count_interval_expiration_unsealed INT,
	active BIT NOT NULL DEFAULT 1,
	display_order INT NOT NULL,
	created_on TIMESTAMP,
	created_by VARCHAR(100),
    guid BINARY(36)
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
	created_on TIMESTAMP,
	created_by VARCHAR(100),
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
	created_on TIMESTAMP,
	created_by VARCHAR(100),
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
	created_on TIMESTAMP,
	created_by VARCHAR(100),
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



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Stock_Item';

CREATE TABLE IF NOT EXISTS Shop_Stock_Item (
	id_stock INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_permutation INT NOT NULL,
	CONSTRAINT FK_Shop_Stock_Item_id_permutation
		FOREIGN KEY (id_permutation)
		REFERENCES Shop_Product_Permutation(id_permutation),
	date_purchased TIMESTAMP NOT NULL,
    date_received TIMESTAMP NULL,
    id_location_storage INT NOT NULL,
    CONSTRAINT FK_Shop_Stock_Item_id_location_storage
		FOREIGN KEY (id_location_storage)
        REFERENCES Shop_Storage_Location(id_location),
    id_currency_cost INT NOT NULL,
    CONSTRAINT FK_Shop_Stock_Item_id_currency
		FOREIGN KEY (id_currency_cost)
        REFERENCES Shop_Currency(id_currency),
    cost_local_VAT_incl FLOAT NOT NULL,
    cost_local_VAT_excl FLOAT NOT NULL,
    is_sealed BIT NOT NULL DEFAULT 1,
    date_unsealed TIMESTAMP NULL,
	date_expiration TIMESTAMP NOT NULL,
    is_consumed BIT NOT NULL DEFAULT 0,
    date_consumed TIMESTAMP NULL,
	active BIT NOT NULL DEFAULT 1,
	created_on TIMESTAMP,
	created_by VARCHAR(100),
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



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Stock_Item_Temp';

CREATE TABLE IF NOT EXISTS Shop_Stock_Item_Temp (
	id_stock INT NOT NULL PRIMARY KEY,
	id_permutation INT NOT NULL,
	date_purchased TIMESTAMP NOT NULL,
    id_location_storage INT NOT NULL,
    id_currency INT NOT NULL,
    cost_local_VAT_incl FLOAT NOT NULL,
    cost_local_VAT_excl FLOAT NOT NULL,
    is_sealed BIT NOT NULL DEFAULT 1,
    date_unsealed TIMESTAMP NULL,
	date_expiration TIMESTAMP NULL,
    is_consumed BIT NOT NULL DEFAULT 0,
    date_consumed TIMESTAMP NULL,
	active BIT NOT NULL DEFAULT 1
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
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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
    quantity_min INT NOT NULL,
    quantity_max INT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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
    created_on TIMESTAMP,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Product_Delivery_Option_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Delivery Option Audits



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
    date_start TIMESTAMP NOT NULL,
    date_end TIMESTAMP NOT NULL,
	active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
	created_on TIMESTAMP,
	created_by VARCHAR(100),
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
    created_on TIMESTAMP,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Discount_Region_Currency_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);
# Product Currency Region link



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
    created_on TIMESTAMP,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Product_Currency_Region_Link_id_change_set
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
# Product Currency Region Link Audits



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

# Permission Groups



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Permission_Group';

CREATE TABLE IF NOT EXISTS Shop_Permission_Group (
    id_group INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50),
    name VARCHAR(255),
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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

# Addresses



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Address';

CREATE TABLE Shop_Address (
    id_address INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
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
    address_line_1 VARCHAR(100) NOT NULL,
    address_line_2 VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    county VARCHAR(100) NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    created_on TIMESTAMP,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Address_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
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
	created_on TIMESTAMP,
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
	created_on TIMESTAMP,
	created_by VARCHAR(100),
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
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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
	created_on TIMESTAMP,
	created_by VARCHAR(100),
	updated_last_on TIMESTAMP NULL,
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
	created_on TIMESTAMP,
	created_by VARCHAR(100),
	updated_last_on TIMESTAMP NULL,
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
	created_on TIMESTAMP,
	created_by VARCHAR(100),
	updated_last_on TIMESTAMP NULL,
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
	created_on TIMESTAMP,
	created_by VARCHAR(100),
	updated_last_on TIMESTAMP NULL,
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
    created_on TIMESTAMP,
    created_by VARCHAR(100),
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
	created_on TIMESTAMP,
	created_by VARCHAR(100),
	updated_last_on TIMESTAMP NULL,
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
	created_on TIMESTAMP,
	created_by VARCHAR(100),
	updated_last_on TIMESTAMP NULL,
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

# Shop Access Level



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
DELIMITER ;
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
DELIMITER ;

# File Type



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
# Shop Image Type



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
DELIMITER ;
# Shop Delivery Region



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

# Shop Storage Location



DROP TRIGGER IF EXISTS before_insert_Shop_Storage_Location;
DROP TRIGGER IF EXISTS before_update_Shop_Storage_Location;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Storage_Location
BEFORE INSERT ON Shop_Storage_Location
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;


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
DELIMITER ;

# Shop Currency



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


# Shop Category



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

# Shop Product




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
    # Changed id_recurrence_interval
	SELECT NEW.id_product, 'id_recurrence_interval', CONVERT(OLD.id_recurrence_interval, CHAR), CONVERT(NEW.id_recurrence_interval, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_recurrence_interval <=> NEW.id_recurrence_interval
    UNION
    # Changed count_recurrence_interval
	SELECT NEW.id_product, 'count_recurrence_interval', CONVERT(OLD.count_recurrence_interval, CHAR), CONVERT(NEW.count_recurrence_interval, CHAR), NEW.id_change_set
		WHERE NOT OLD.count_recurrence_interval <=> NEW.count_recurrence_interval
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
DELIMITER ;

# Shop Product Permutation



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

	IF (NOT (
		NEW.id_interval_recurrence IS NULL
		OR NEW.id_interval_recurrence NOT IN (SELECT id_unit_measurement FROM Shop_Unit_Measurement WHERE is_unit_of_time = 1)
	)) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Recurrence interval ID must be a unit of time.';
    END IF;

	IF (NOT (
		NEW.id_interval_expiration_unsealed IS NULL
		OR NEW.id_interval_expiration_unsealed NOT IN (SELECT id_unit_measurement FROM Shop_Unit_Measurement WHERE is_unit_of_time = 1)
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
	# Changed profit_local_min
	SELECT NEW.id_permutation, 'profit_local_min', CONVERT(OLD.profit_local_min, CHAR), CONVERT(NEW.profit_local_min, CHAR), NEW.id_change_set
		WHERE NOT (OLD.profit_local_min <=> NEW.profit_local_min)
	UNION
    /*
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
    # Changed id_interval_recurrence
	SELECT NEW.id_product, 'id_interval_recurrence', CONVERT(OLD.id_interval_recurrence, CHAR), CONVERT(NEW.id_interval_recurrence, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_interval_recurrence <=> NEW.id_interval_recurrence
    UNION
    # Changed count_interval_recurrence
	SELECT NEW.id_product, 'count_interval_recurrence', CONVERT(OLD.count_interval_recurrence, CHAR), CONVERT(NEW.count_interval_recurrence, CHAR), NEW.id_change_set
		WHERE NOT OLD.count_interval_recurrence <=> NEW.count_interval_recurrence
	UNION
    # Changed id_stripe_product
	SELECT NEW.id_permutation, 'id_stripe_product', OLD.id_stripe_product, NEW.id_stripe_product, NEW.id_change_set
		WHERE NOT (OLD.id_stripe_product <=> NEW.id_stripe_product)
	UNION
    # Changed does_expire_faster_once_unsealed
	SELECT NEW.id_product, 'does_expire_faster_once_unsealed', CONVERT(OLD.does_expire_faster_once_unsealed, CHAR), CONVERT(NEW.does_expire_faster_once_unsealed, CHAR), NEW.id_change_set
		WHERE NOT OLD.does_expire_faster_once_unsealed <=> NEW.does_expire_faster_once_unsealed
    UNION
    # Changed id_interval_expiration_unsealed
	SELECT NEW.id_product, 'id_interval_expiration_unsealed', CONVERT(OLD.id_interval_expiration_unsealed, CHAR), CONVERT(NEW.id_interval_expiration_unsealed, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_interval_expiration_unsealed <=> NEW.id_interval_expiration_unsealed
    UNION
    # Changed count_interval_expiration_unsealed
	SELECT NEW.id_product, 'count_interval_expiration_unsealed', CONVERT(OLD.count_interval_expiration_unsealed, CHAR), CONVERT(NEW.count_interval_expiration_unsealed, CHAR), NEW.id_change_set
		WHERE NOT OLD.count_interval_expiration_unsealed <=> NEW.count_interval_expiration_unsealed
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

# Shop Variation Type




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

# Shop Product Permutation Variation Link



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
# Shop Product Permutation



DROP TRIGGER IF EXISTS before_insert_Shop_Stock_Item;
DROP TRIGGER IF EXISTS before_update_Shop_Stock_Item;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Stock_Item
BEFORE INSERT ON Shop_Stock_Item
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
DELIMITER ;

# Shop Product Currency Link



DROP TRIGGER IF EXISTS before_insert_Shop_Product_Price;
DROP TRIGGER IF EXISTS before_update_Shop_Product_Price;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Price
BEFORE INSERT ON Shop_Product_Price
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
DELIMITER ;

# Shop Image



DROP TRIGGER IF EXISTS before_insert_Shop_Product_Image;
DROP TRIGGER IF EXISTS before_update_Shop_Product_Image;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Image
BEFORE INSERT ON Shop_Product_Image
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;


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
DELIMITER ;
# Shop Delivery Option Type



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
DELIMITER ;
# Shop User Role Link



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
# Shop Supplier



DROP TRIGGER IF EXISTS before_insert_Shop_Supplier;
DROP TRIGGER IF EXISTS before_update_Shop_Supplier;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Supplier
BEFORE INSERT ON Shop_Supplier
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
DELIMITER ;

# Shop Unit of Measurement



DROP TRIGGER IF EXISTS before_insert_Shop_Unit_Measurement;
DROP TRIGGER IF EXISTS before_update_Shop_Unit_Measurement;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Unit_Measurement
BEFORE INSERT ON Shop_Unit_Measurement
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
DELIMITER ;


# Shop Unit of Measurement Conversion



DROP TRIGGER IF EXISTS before_insert_Shop_Unit_Measurement_Conversion;
DROP TRIGGER IF EXISTS before_update_Shop_Unit_Measurement_Conversion;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Unit_Measurement_Conversion
BEFORE INSERT ON Shop_Unit_Measurement_Conversion
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
DELIMITER ;


# Shop Supplier Purchase Order



DROP TRIGGER IF EXISTS before_insert_Shop_Supplier_Purchase_Order;
DROP TRIGGER IF EXISTS before_update_Shop_Supplier_Purchase_Order;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Supplier_Purchase_Order
BEFORE INSERT ON Shop_Supplier_Purchase_Order
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
DELIMITER ;


# Shop Supplier Purchase Order Product Link



DROP TRIGGER IF EXISTS before_insert_Shop_Supplier_Purchase_Order_Product_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Supplier_Purchase_Order_Product_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Supplier_Purchase_Order_Product_Link
BEFORE INSERT ON Shop_Supplier_Purchase_Order_Product_Link
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
DELIMITER ;

# Shop Manufacturing Purchase Order



DROP TRIGGER IF EXISTS before_insert_Shop_Manufacturing_Purchase_Order;
DROP TRIGGER IF EXISTS before_update_Shop_Manufacturing_Purchase_Order;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Manufacturing_Purchase_Order
BEFORE INSERT ON Shop_Manufacturing_Purchase_Order
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
DELIMITER ;

# Shop Manufacturing Purchase Order Product Link



DROP TRIGGER IF EXISTS before_insert_Shop_Manufacturing_Purchase_Order_Product_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Manufacturing_Purchase_Order_Product_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Manufacturing_Purchase_Order_Product_Link
BEFORE INSERT ON Shop_Manufacturing_Purchase_Order_Product_Link
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
DELIMITER ;


# Shop Customer



DROP TRIGGER IF EXISTS before_insert_Shop_Customer;
DROP TRIGGER IF EXISTS before_update_Shop_Customer;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Customer
BEFORE INSERT ON Shop_Customer
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
DELIMITER ;


# Shop Customer Sales Order



DROP TRIGGER IF EXISTS before_insert_Shop_Customer_Sales_Order;
DROP TRIGGER IF EXISTS before_update_Shop_Customer_Sales_Order;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Customer_Sales_Order
BEFORE INSERT ON Shop_Customer_Sales_Order
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
DELIMITER ;

# Shop Customer Sales Order Product Link



DROP TRIGGER IF EXISTS before_insert_Shop_Customer_Sales_Order_Product_Link;
DROP TRIGGER IF EXISTS before_update_Shop_Customer_Sales_Order_Product_Link;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Customer_Sales_Order_Product_Link
BEFORE INSERT ON Shop_Customer_Sales_Order_Product_Link
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
DELIMITER ;



/*

CALL p_split (
	'noods, chees',
	','
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_split;


DELIMITER //
CREATE PROCEDURE p_split (
	IN a_string VARCHAR(4000),
	IN a_separator VARCHAR(5)
    -- IN a_allow_empty BIT
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_string BIT;
    DECLARE v_has_separator BIT;
    DECLARE v_i_separator INT;
    DECLARE v_i_start INT;
    DECLARE v_i_end INT;
    DECLARE v_current_item VARCHAR(4000);
    
    
	-- Argument validation + default values
    SET a_string := IFNULL(a_string, '');
    SET a_separator := IFNULL(a_separator, '');
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS Split_Temp;
    
    CREATE TABLE Split_Temp (
        display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		substring VARCHAR(4000) NOT NULL
    );
    
    
    -- Parse filters
    SET v_has_string = CASE WHEN a_string = '' THEN 0 ELSE 1 END;
    SET v_has_separator = CASE WHEN a_separator = '' THEN 0 ELSE 1 END;
    
    IF v_has_string THEN

		SET v_i_start = 1;
		SET v_i_end = LOCATE(',', a_string);

		WHILE v_i_end > 0 DO
			SET v_current_item = SUBSTRING(a_string, v_i_start, v_i_end - v_i_start);
			INSERT INTO Split_Temp (substring) VALUES (v_current_item);

			SET v_i_start = v_i_end + 1;
			SET v_i_end = LOCATE(',', a_string, v_i_start);
		END WHILE;

		SET v_current_item = SUBSTRING(a_string, v_i_start);
		INSERT INTO Split_Temp (substring) VALUES (TRIM(v_current_item));
	END IF;

	/*
    -- Select the results from the temporary table
    SELECT * FROM Split_Temp;
    
    # Return arguments for test
    SELECT
	a_string,
    a_separator
    -- a_allow_empty
    ;
    */
    
END //
DELIMITER ;

/*

CALL p_split (
	'noods, cheese ', # a_string
	',' # a_separator
	# '0', # a_allow_empty
);

SELECT *
FROM SPLIT_TEMP;

*/




/*

CALL p_shop_user_eval (
	UUID(), # a_guid
	'', 	# a_ids_user
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
	IN a_guid BINARY(36),
    IN a_ids_user LONGTEXT,
    IN a_get_inactive_users BIT,
    IN a_ids_permission VARCHAR(500),
    IN a_ids_access_level VARCHAR(100),
    IN a_ids_product VARCHAR(4000) -- IN a_ids_permutation VARCHAR(4000)
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
    DECLARE v_now TIMESTAMP;
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
	SET a_guid := IFNULL(a_guid, UUID());
    SET a_ids_user := TRIM(IFNULL(a_ids_user, ''));
    SET a_get_inactive_users := IFNULL(a_get_inactive_users, 0);
    SET a_ids_permission := TRIM(IFNULL(a_ids_permission, ''));
    SET a_ids_access_level := TRIM(IFNULL(a_ids_access_level, ''));
    SET a_ids_product := TRIM(IFNULL(a_ids_product, ''));
    
    -- Permanent Table
	CREATE TABLE IF NOT EXISTS Shop_User_Eval_Temp (
		id_row INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
		guid BINARY(36) NOT NULL,
		id_user INT NULL,
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
			REFERENCES Shop_Product (id_product),
		/*
		id_permutation INT NULL,
		CONSTRAINT FK_Shop_User_Eval_Temp_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation (id_permutation),
		*/
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
	
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Shop_Product_p_Shop_User_Eval (
		id_row INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
		id_product INT NOT NULL,
        id_access_level_required INT NOT NULL,
		guid BINARY(36) NOT NULL,
        rank_product INT NOT NULL
	);
		
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
		
    # select * from Shop_Msg_Error_Type;
    
    -- Parse filters
	IF a_guid IS NULL OR EXISTS (SELECT * FROM Shop_User_Eval_Temp WHERE a_guid = guid) THEN
		INSERT INTO tmp_Msg_Error (
			guid,
            id_type,
			code,
            msg
		)
        VALUES (
			a_guid,
            (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
			v_code_error_data, 
            CONCAT('Invalid guid argument: ', IFNULL(a_guid, 'NULL'))
		)
        ;
	END IF;
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
            
            IF EXISTS (
				SELECT ST.substring 
                FROM Split_Temp ST 
                LEFT JOIN Shop_Access_Level AL 
                ON ST.substring = AL.id_access_level
                WHERE 
					ISNULL(AL.id_access_level)
                    OR AL.active = 0
			) THEN
                INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					a_guid,	
					(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
					v_code_error_data, 
					CONCAT('Invalid access level IDs: ', GROUP_CONCAT(ST.substring SEPARATOR ', '))
				FROM Split_Temp ST 
				LEFT JOIN Shop_Access_Level AL ON ST.substring = AL.id_access_level
                WHERE ISNULL(AL.id_access_level)
				;
			ELSE
				SET v_id_access_level := (
					SELECT AL.id_access_level 
					FROM Split_Temp ST 
					INNER JOIN Shop_Access_Level AL 
						ON CONVERT(ST.substring, DECIMAL(10,0)) = AL.id_access_level
							AND AL.active 
					ORDER BY AL.priority ASC 
					LIMIT 1
				);
            END IF;
			DROP TABLE Split_Temp;
            
            /*
			IF 0 = v_id_access_level OR v_id_access_level <=> NULL THEN
				# SET v_has_filter_access_level = 0;
                INSERT INTO tmp_Msg_Error (
					guid,
					code,
					msg
				)
				SELECT
					a_guid,	
					v_code_error_data, 
					CONCAT('Invalid access level IDs: ', GROUP_CONCAT(ST.substring SEPARATOR ', '))
				FROM Split_Temp ST 
				LEFT JOIN Shop_Access_Level AL ON ST.substring = AL.id_access_level
                WHERE ISNULL(AL.id_access_level)
				;
			END IF;
            */
        /* select * from Shop_Access_Level
		END IF;
		IF NOT v_has_filter_access_level THEN
		*/
        ELSE
			SET v_id_access_level = v_id_access_level_view;
		END IF;
	END IF;
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
		/*
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
            *
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
        */
        
		IF v_has_filter_product THEN
			CALL p_split(a_ids_product, ',');
            
			# Invalid product IDs
            IF EXISTS (SELECT * FROM Split_Temp ST LEFT JOIN Shop_Product P ON ST.substring = P.id_product WHERE ISNULL(P.id_product)) THEN 
				INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					a_guid,
					(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
					v_code_error_data, 
					CONCAT('Invalid product IDs: ', IFNULL(GROUP_CONCAT(ST.substring SEPARATOR ', '), 'NULL'))
				FROM Split_Temp ST 
                LEFT JOIN Shop_Product P ON ST.substring = P.id_product 
                WHERE ISNULL(P.id_product)
				;
            END IF;
            
			IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
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
					a_guid,
					RANK() OVER (ORDER BY C.display_order, P.display_order) AS rank_product
				FROM Split_Temp ST
                INNER JOIN Shop_Product P ON ST.substring = P.id_product # Shop_Product_Permutation PP
                INNER JOIN Shop_Category C ON P.id_category = C.id_category
				INNER JOIN Shop_Access_Level AL
					ON P.id_access_level_required = AL.id_access_level
						AND AL.active
				WHERE FIND_IN_SET(P.id_product, a_ids_product) > 0 # FIND_IN_SET(PP.id_permutation, a_ids_permutation) > 0
					# AND P.active # not worried as we want users to be able to see their order history
				;
				/*
				DELETE FROM tmp_Shop_Product_p_Shop_User_Eval
				WHERE rank_permutation > 1
				;
				*/
				SET v_has_filter_product = EXISTS (SELECT * FROM tmp_Shop_Product_p_Shop_User_Eval WHERE a_guid = guid);
			END IF;
            
            DROP TABLE Split_Temp;
		END IF;
	END IF;
    
    -- Permission IDs
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
		IF v_has_filter_permission THEN
			CALL p_split(a_ids_permission, ',');
            
            # Invalid
            IF EXISTS (SELECT PERM.id_permission FROM Split_Temp ST LEFT JOIN Shop_Permission PERM ON ST.substring = PERM.id_permission WHERE ISNULL(PERM.id_permission)) THEN
				INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					a_guid,
                    (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
					v_code_error_data, 
					CONCAT('Invalid permission IDs: ', IFNULL(GROUP_CONCAT(ST.substring SEPARATOR ', '), 'NULL'))
				FROM Split_Temp ST 
				LEFT JOIN Shop_Permission PERM ON ST.substring = PERM.id_permission 
				WHERE ISNULL(PERM.id_permission)
				;
            END IF;
            
            # Inactive
            IF EXISTS (SELECT PERM.id_permission FROM Split_Temp ST INNER JOIN Shop_Permission PERM ON ST.substring = PERM.id_permission WHERE PERM.active = 0) THEN
				INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					a_guid,
                    (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
					v_code_error_data, 
					CONCAT('The following permissions are not active: ', IFNULL(GROUP_CONCAT(ST.substring SEPARATOR ', '), 'NULL')) 
				FROM Split_Temp ST 
				INNER JOIN Shop_Permission PERM ON ST.substring = PERM.id_permission 
				WHERE PERM.active = 0
				;
            END IF;
            
			DROP TABLE Split_Temp;
		END IF;
	END IF;
    
    -- Invalid user ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
		IF v_has_filter_user = 1 THEN
			/*
			SET a_ids_user := (SELECT id_user FROM Shop_User WHERE id_user LIKE a_ids_user AND active);
            SET v_has_filter_user = NOT (a_ids_user <=> NULL);
            */
            IF ISNULL((SELECT id_user FROM Shop_User WHERE id_user LIKE a_ids_user AND active)) THEN -- NOT v_has_filter_user THEN
                INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				VALUES (
					a_guid,
                    (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
					v_code_error_data, 
					CONCAT('Invalid user ID: ', IFNULL(a_ids_user, 'NULL'))
				)
				;
				SET a_ids_user = NULL;
                SET v_has_filter_user = 0;
			ELSE
				SET v_has_filter_user = 1;
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
			U.id_user,
			P.id_permission,
			AL.priority
		FROM Shop_Permission P
		INNER JOIN Shop_Access_Level AL
			ON P.id_access_level_required = AL.id_access_level
			AND AL.active
		CROSS JOIN (
			SELECT id_user
            FROM Shop_User U
            WHERE 1=1
				AND FIND_IN_SET(U.id_user, a_ids_user) > 0
                AND U.active
        ) U 
		WHERE FIND_IN_SET(P.id_permission, a_ids_permission) > 0
		;
        
        /*
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
				ON a_ids_user = UE_T.id_user
				WHERE a_guid = t_P.guid
			;
            
			DELETE FROM Shop_User_Eval_Temp 
			WHERE FIND_IN_SET(id_row, v_ids_row_delete) > 0
			;
		END IF;
        */
		IF v_has_filter_product THEN
			SET v_ids_row_delete := (SELECT GROUP_CONCAT(id_row SEPARATOR ',') FROM Shop_User_Eval_Temp WHERE a_guid = guid);
            
			INSERT INTO Shop_User_Eval_Temp (
				guid,
				id_user,
				id_permission_required,
				id_product,
                -- id_permutation,
				priority_access_level_required
			)
			SELECT UE_T.guid, 
				UE_T.id_user, 
                UE_T.id_permission_required, 
                t_P.id_product, 
                -- t_P.id_permutation, 
                CASE WHEN UE_T.priority_access_level_required < AL.priority THEN UE_T.priority_access_level_required ELSE AL.priority END -- UE_T.priority_access_level_required
			FROM tmp_Shop_Product_p_Shop_User_Eval t_P
            INNER JOIN Shop_Access_Level AL
				ON t_P.id_access_leveL_required = AL.id_access_level
					AND AL.active
			CROSS JOIN Shop_User_Eval_Temp UE_T
				ON a_ids_user = UE_T.id_user
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
		FROM Shop_User U
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
		WHERE U.id_user = a_ids_user
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
				AND UE_T.id_user = a_ids_user
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
				AND UE_T.id_user = a_ids_user
			# GROUP BY UE_T.id_user
			;
        END IF;
    END IF;
    
    IF EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
		SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid;
    END IF;
    
    -- select * from tmp_Shop_Product_p_Shop_User_Eval;
    -- Clean up
	DROP TABLE IF EXISTS tmp_Shop_Product_p_Shop_User_Eval;
    # DROP TEMPORARY TABLE IF EXISTS tmp_User_Role_Link;
    # DROP TABLE IF EXISTS tmp_Msg_Error;
    DROP TABLE IF EXISTS Split_Temp;
END //
DELIMITER ;


/*

CALL p_shop_user_eval ('00550ef3-2bfa-11ef-b83e-b42e9986184a',		NULL, 0,	'2',	'1',	'1,2,3,4,5');
SELECT *
FROM Shop_User_Eval_Temp
;

DROP TABLE Shop_User_Eval_Temp;
select CURRENT_USER();
CALL p_shop_user_eval('nips', 'auth0|6582b95c895d09a70ba10fef', 0, '5', '2', '1');
SELECT *
FROM Shop_User_Eval_Temp
;
DROP TABLE IF EXISTS Shop_User_Eval_Temp;
DROP TABLE IF EXISTS tmp_Msg_Error;
select * from tmp_Msg_Error;
select * from shop_product;

CALL p_shop_user_eval (
-- '00550ef3-2bfa-11ef-b83e-b42e9986184a',		NULL, 0,	'2',	'1',	'1,2,3,4,5,6');
	'56c9dfc1-e22f-11ee-aab4-b42e9986184a', # a_guid
	'', 	# a_ids_user # 'auth0|6582b95c895d09a70ba10fef',
	false,		# a_get_inactive_users
    '4,5',	# a_ids_permission
    '1',		# a_ids_access_level
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
FROM Shop_User U
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


/*
CALL p_shop_get_many_region (
	0 # a_get_inactive_region
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


/*
CALL p_shop_get_many_currency (
	0 # a_get_inactive_currency
);
*/




-- Clear previous proc
DROP PROCEDURE IF EXISTS p_save_product;
DROP PROCEDURE IF EXISTS p_shop_save_product;


DELIMITER //
CREATE PROCEDURE p_shop_save_product (
	IN a_guid BINARY(36),
	IN a_id_user INT,
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
    END;
    
    SET v_code_type_error_bad_data := 'BAD_DATA';
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    
    SET a_guid := IFNULL(a_guid, UUID());
    
    
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
        , guid BIGINT NOT NULL
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
        , IFNULL(PT.name, P.name) AS name
        , IFNULL(PT.has_variations, P.has_variations) AS has_variations
        , IFNULL(PT.id_access_level_required, P.id_access_level_required) AS id_access_level_required
        , IFNULL(P_T.active, P.active) AS active
        , IFNULL(P_T.display_order, P.display_order) AS display_order
        , IFNULL(PT.name, IFNULL(P.name, IFNULL(P_T.id_product, '(No Product)'))) AS name_error
        , CASE WHEN IFNULL(P_T.id_product, 0) < 1 THEN 1 ELSE 0 END AS is_new
	FROM Shop_Product_Tenp P_T
    LEFT JOIN Shop_Product P ON P_T.id_product = P.id_product
    ;
    
    -- Validation
    -- Missing mandatory fields
    INSERT INTO tmp_Msg_Error (
		guid
        , id_type
        , code
        , msg
	)
    -- id_category
    SELECT
		a_guid AS GUID
        , v_id_type_error_bad_data
        , v_code_error_bad_data
        , CONCAT('The following product(s) do not have a category: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', '))
	FROM tmp_Product t_P
    WHERE ISNULL(t_P.id_category)
    UNION
    -- name
    SELECT
		a_guid AS GUID
        , v_id_type_error_bad_data
        , v_code_error_bad_data
        , CONCAT('The following product(s) do not have a name: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', '))
	FROM tmp_Product t_P
    WHERE ISNULL(t_P.name)
    UNION
    -- has_variations
    SELECT
		a_guid AS GUID
        , v_id_type_error_bad_data
        , v_code_error_bad_data
        , CONCAT('The following product(s) do not have a has-variations setting: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', '))
	FROM tmp_Product t_P
    WHERE ISNULL(t_P.has_variations)
    UNION
    -- id_access_level_required
    SELECT
		a_guid AS GUID
        , v_id_type_error_bad_data
        , v_code_error_bad_data
        , CONCAT('The following product(s) do not have a required access level ID: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', '))
	FROM tmp_Product t_P
    WHERE ISNULL(t_P.id_access_level_required)
    UNION
    -- display_order
    SELECT
		a_guid AS GUID
        , v_id_type_error_bad_data
        , v_code_error_bad_data
        , CONCAT('The following product(s) do not have a display order: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', '))
	FROM tmp_Product t_P
    WHERE ISNULL(t_P.display_order)
    ;
    
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN -- (SELECT * FROM tmp_Product WHERE is_new = 0 LIMIT 1) THEN
        SET v_ids_product_permission := (SELECT GROUP_CONCAT(item SEPARATOR ',') FROM tmp_Shop_Product WHERE is_new = 0);
        IF NOT ISNULL(v_ids_product_permission) THEN
			SET v_id_permission_product = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
			
			CALL p_shop_user_eval(a_guid, a_id_user, v_id_permission_product, v_ids_product_permission);
			
			UPDATE tmp_Product t_P
			INNER JOIN Shop_User_Eval_Temp UE_T
				ON t_P.id_product = UE_T.id_product
				AND UE_T.GUID = a_guid
			SET 
				t_P.can_view = UE_T.can_view
				, t_P.can_edit = UE_T.can_edit
				, t_P.can_admin = UE_T.can_admin
			;
			
			CALL p_shop_user_eval_clear_temp(a_guid);
		END IF;
    END IF;
    
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		-- Start the transaction
		START TRANSACTION;
		
		-- Your transaction logic goes here
		IF NOT ISNULL(v_ids_product_permission) THEN
			INSERT INTO Shop_Product_Change_Set ( comment )
			VALUES ( a_comment )
			;
			
			SET v_id_change_set := LAST_INSERT_ID();
			
			UPDATE Shop_Product P
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
		
		INSERT INTO Shop_Product (
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
			, v_now AS created_on
		FROM tmp_Product t_P
		WHERE is_new = 1
		;
		
		-- If we reach here without error, commit the transaction
		COMMIT;
    END IF;
    
    SELECT * FROM tmp_Msg_Error;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
END //
DELIMITER ;


-- 

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_product;

DELIMITER //
CREATE PROCEDURE p_shop_get_many_product (
	IN a_id_user INT,
    IN a_get_all_category BIT,
	IN a_get_inactive_category BIT,
    IN a_get_first_category_only BIT,
	IN a_ids_category VARCHAR(500),
    IN a_get_all_product BIT,
	IN a_get_inactive_product BIT,
    IN a_get_first_product_only BIT,
	IN a_ids_product VARCHAR(500),
    IN a_get_all_product_permutation BIT,
	IN a_get_inactive_permutation BIT,
	IN a_get_first_permutation_only BIT,
	IN a_ids_permutation VARCHAR(4000),
    IN a_get_all_image BIT,
	IN a_get_inactive_image BIT,
    IN a_get_first_image_only BIT,
    IN a_ids_image VARCHAR(4000),
    IN a_get_all_delivery_region BIT,
	IN a_get_inactive_delivery_region BIT,
    IN a_get_first_delivery_region_only BIT,
    IN a_ids_delivery_region VARCHAR(4000),
    IN a_get_all_currency BIT,
	IN a_get_inactive_currency BIT,
    IN a_get_first_currency_only BIT,
    IN a_ids_currency VARCHAR(4000),
    IN a_get_all_discount BIT,
	IN a_get_inactive_discount BIT,
    IN a_ids_discount VARCHAR(4000),
    /*
    IN a_quantity_stock_min FLOAT,
    IN a_quantity_stock_min FLOAT,
    */
    IN a_get_products_quantity_stock_below_min BIT
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
    DECLARE v_guid BINARY(36);
    # DECLARE v_id_user VARCHAR(100);
    DECLARE v_ids_permutation_unavailable VARCHAR(4000);
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission VARCHAR(4000);
    -- DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    -- DECLARE v_now TIMESTAMP;
    DECLARE v_id_minimum INT;
    
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');
    
    
	-- Argument validation + default values
    SET a_id_user := TRIM(IFNULL(a_id_user, ''));
    SET a_get_all_category := IFNULL(a_get_all_category, 0);
    SET a_get_inactive_category := IFNULL(a_get_inactive_category, 0);
	IF a_ids_category IS NULL THEN
		SET a_ids_category = '';
	ELSE
		SET a_ids_category = REPLACE(TRIM(a_ids_category), '|', ',');
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
    IF a_get_products_quantity_stock_below_min IS NULL THEN
		SET a_get_products_quantity_stock_below_min := 0;
	END IF;
    
    /*
    SELECT a_id_user, a_get_all_category, a_ids_category, a_get_inactive_category, a_get_all_product, 
    a_ids_product, a_get_inactive_product, a_get_first_product_only, a_get_all_product_permutation, a_ids_permutation, 
    a_get_inactive_permutation, a_get_all_image, a_ids_image, a_get_inactive_image, a_get_first_image_only, 
    a_get_all_delivery_region, a_ids_delivery_region, a_get_inactive_delivery_region, a_get_all_currency, a_ids_currency, 
    a_get_inactive_currency, a_get_all_discount, a_ids_discount, a_get_inactive_discount
    ;
    */
    
    -- Temporary tables
    DROP TEMPORARY TABLE IF EXISTS tmp_Discount;
    DROP TEMPORARY TABLE IF EXISTS tmp_Currency;
    DROP TEMPORARY TABLE IF EXISTS tmp_Delivery_Region;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Image;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Variation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Shop_Category;
    
    CREATE TEMPORARY TABLE tmp_Shop_Category (
		id_category INT NOT NULL,
        active BIT NOT NULL,
        display_order INT NOT NULL, 
        can_view BIT, 
        can_edit BIT, 
        can_admin BIT
    );
    
    CREATE TEMPORARY TABLE tmp_Shop_Product (
		id_category INT NOT NULL,
		id_product INT NOT NULL,
		-- product_has_variations BIT NOT NULL,
		id_permutation INT NULL,
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
    
    CREATE TEMPORARY TABLE tmp_Shop_Image (
		id_image INT NOT NULL,
		id_product INT NOT NULL,
		id_permutation INT NULL,
        active BIT NOT NULL,
        display_order INT NOT NULL,
        rank_in_product_permutation INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Delivery_Region (
		id_region INT NOT NULL,
        active BIT NOT NULL,
        display_order INT NOT NULL,
        requires_delivery_option BIT NOT NULL DEFAULT 0
    );
    
    CREATE TEMPORARY TABLE tmp_Currency (
		id_currency INT NOT NULL,
        active BIT NOT NULL,
        display_order INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Discount (
		id_discount INT NOT NULL,
        active BIT NOT NULL,
        display_order INT NOT NULL
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
        code VARCHAR(50) NOT NULL,
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
				OR (
					v_has_filter_permutation 
                    AND FIND_IN_SET(PP.id_permutation, a_ids_permutation) > 0
				)
                OR (
					a_get_products_quantity_stock_below_min = 1
                    AND PP.quantity_stock < PP.quantity_min
				)
			)
			AND (
				a_get_inactive_permutation 
                OR PP.active
			)
        )
		# categories
		AND (
			(
				a_get_all_category 
                OR (
					v_has_filter_category 
                    AND FIND_IN_SET(P.id_category, a_ids_category) > 0
				)
			)
			AND (
				a_get_inactive_category 
                OR C.active
            )
		) 
		# products
		AND (
			(
				a_get_all_product 
				OR (
					v_has_filter_product 
                    AND FIND_IN_SET(P.id_product, a_ids_product) > 0
				)
			)
			AND (
				a_get_inactive_product 
                OR P.active
			)
		)
    ;
    
    -- select * from tmp_Shop_Product;
    
    IF a_get_first_product_only = 1 THEN
		DELETE t_P
        FROM tmp_Shop_Product t_P
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
		OR FIND_IN_SET(t_P.id_permutation, a_ids_permutation) > 0
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
					OR FIND_IN_SET(t_P.id_permutation, a_ids_permutation) > 0
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
						OR FIND_IN_SET(t_P.id_permutation, a_ids_permutation) > 0
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
    IF EXISTS (SELECT * FROM tmp_Shop_Category LIMIT 1) THEN
        # SET v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER());
        SET v_id_permission_product := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
        SET v_ids_product_permission := (SELECT GROUP_CONCAT(id_product SEPARATOR ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_product));
        -- SET v_ids_permutation_permission := (SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission;
        -- select * from Shop_User_Eval_Temp;
        
        CALL p_shop_user_eval(v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission);
        
        -- select * from Shop_User_Eval_Temp;
        
        UPDATE tmp_Shop_Product t_P
        INNER JOIN Shop_User_Eval_Temp UE_T
			ON t_P.id_product = UE_T.id_product
			AND UE_T.GUID = v_guid
        SET t_P.can_view = UE_T.can_view,
			t_P.can_edit = UE_T.can_edit,
            t_P.can_admin = UE_T.can_admin
		;
		-- select * from Shop_User_Eval_Temp;
		-- select * from tmp_Shop_Product;
        
        DELETE t_P
        FROM tmp_Shop_Product t_P
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
    -- SET v_now := NOW();
    
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
        RI.name AS name_recurrence_interval,
        RI.name_plural AS name_plural_recurrence_interval,
        t_P.count_recurrence_interval,
        t_P.display_order_category,
        t_P.display_order_product,
        t_P.display_order_permutation,
        IFNULL(t_P.can_view, 0) AS can_view,
        IFNULL(t_P.can_edit, 0) AS can_edit,
        IFNULL(t_P.can_admin, 0) AS can_admin
    FROM tmp_Shop_Product t_P
    INNER JOIN Shop_Product P ON t_P.id_product = P.id_product
    INNER JOIN Shop_Product_Permutation PP ON t_P.id_permutation = PP.id_permutation
	LEFT JOIN Shop_Recurrence_Interval RI ON t_P.id_recurrence_interval = RI.id_interval
    INNER JOIN Shop_Currency CURRENCY ON PP.id_currency_cost = CURRENCY.id_currency
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
CALL partsltd_prod.p_shop_get_many_product (
	'auth0|6582b95c895d09a70ba10fef', # a_id_user
    1, # a_get_all_category
	0, # a_get_inactive_category
    0, # a_get_first_category_only
	'', # a_ids_category
    1, # a_get_all_product
	0, # a_get_inactive_product
    0, # a_get_first_product_only
	'', # a_ids_product
    1, # a_get_all_product_permutation
	0, # a_get_inactive_permutation
    0, # a_get_first_permutation_only
	'', # a_ids_permutation
    0, # a_get_all_image
    0, # a_get_inactive_image
    0, # a_get_first_image_only
	'', # a_ids_image
    0, # a_get_all_delivery_region
    0, # a_get_inactive_delivery_region
    0, # a_get_first_delivery_region_only
	'', # a_ids_delivery_region
    0, # a_get_all_currency
    0, # a_get_inactive_currency
    0, # a_get_first_currency_only
	'', # a_ids_currency
    0, # a_get_all_discount
    0, # a_get_inactive_discount
	'', # a_ids_discount
    1 # a_get_products_quantity_stock_below_minimum
);

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




-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_permutation;

DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Msg_Error;

DELIMITER //
CREATE PROCEDURE p_shop_save_permutation (
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
        
        CALL p_shop_user_eval(v_guid_permission, a_id_user, 0, v_id_permission_manufacturing_purchase_order, v_id_access_level_edit, v_ids_product);
        
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
DELIMITER ;


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
DROP PROCEDURE IF EXISTS p_shop_get_many_stock_item;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_stock_item (
	IN a_id_user INT,
    IN a_get_all_category BIT,
	IN a_get_inactive_category BIT,
    IN a_get_first_category_only BIT,
	IN a_ids_category TEXT,
    IN a_get_all_product BIT,
	IN a_get_inactive_product BIT,
    IN a_get_first_product_only BIT,
	IN a_ids_product LONGTEXT,
    IN a_get_all_product_permutation BIT,
	IN a_get_inactive_permutation BIT,
	IN a_get_first_permutation_only BIT,
	IN a_ids_permutation LONGTEXT,
    IN a_get_all_stock_item BIT,
	IN a_get_inactive_stock_item BIT,
	IN a_get_first_stock_item_only BIT,
	IN a_ids_stock_item LONGTEXT,
    IN a_get_all_region_storage BIT,
	IN a_get_inactive_region_storage BIT,
    IN a_get_first_region_storage_only BIT,
    IN a_ids_region_storage VARCHAR(4000),
    IN a_get_all_plant_storage BIT,
	IN a_get_inactive_plant_storage BIT,
    IN a_get_first_plant_storage_only BIT,
    IN a_ids_plant_storage VARCHAR(4000),
    IN a_get_all_location_storage BIT,
	IN a_get_inactive_location_storage BIT,
    IN a_get_first_location_storage_only BIT,
    IN a_ids_location_storage TEXT,
    IN a_date_received_to TIMESTAMP,
	IN a_get_sealed_stock_item_only BIT,
	IN a_get_unsealed_stock_item_only BIT,
	IN a_get_expired_stock_item_only BIT,
	IN a_get_nonexpired_stock_item_only BIT,
	IN a_get_consumed_stock_item_only BIT,
	IN a_get_nonconsumed_stock_item_only BIT
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_category BIT;
    DECLARE v_has_filter_product BIT;
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
    -- DECLARE v_now TIMESTAMP;
    -- DECLARE v_id_minimum INT;
	DECLARE v_now TIMESTAMP;
    
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW');
    SET v_now := NOW();

    
	-- Argument validation + default values
	SET a_id_user := TRIM(IFNULL(a_id_user, ''));
	SET a_get_all_category := IFNULL(a_get_all_category, 0);
	SET a_get_inactive_category := IFNULL(a_get_inactive_category, 0);
	SET a_get_first_category_only := IFNULL(a_get_first_category_only, 1);
	SET a_ids_category := TRIM(IFNULL(a_ids_category, ''));
	SET a_get_all_product := IFNULL(a_get_all_product, 0);
	SET a_get_inactive_product := IFNULL(a_get_inactive_product, 0);
	SET a_get_first_product_only := IFNULL(a_get_first_product_only, 1);
	SET a_ids_product := TRIM(IFNULL(a_ids_product, ''));
	SET a_get_all_product_permutation := IFNULL(a_get_all_product_permutation, 0);
	SET a_get_inactive_permutation := IFNULL(a_get_inactive_permutation, 0);
	SET a_get_first_permutation_only := IFNULL(a_get_first_permutation_only, 1);
	SET a_ids_permutation := TRIM(IFNULL(a_ids_permutation, ''));
	SET a_get_all_stock_item := IFNULL(a_get_all_stock_item, 0);
	SET a_get_inactive_stock_item := IFNULL(a_get_inactive_stock_item, 0);
	SET a_get_first_stock_item_only := IFNULL(a_get_first_stock_item_only, 1);
	SET a_ids_stock_item := TRIM(IFNULL(a_ids_stock_item, ''));
	SET a_get_all_region_storage := IFNULL(a_get_all_region_storage, 0);
	SET a_get_inactive_region_storage := IFNULL(a_get_inactive_region_storage, 0);
	SET a_get_first_region_storage_only := IFNULL(a_get_first_region_storage_only, 1);
	SET a_ids_region_storage := TRIM(IFNULL(a_ids_region_storage, ''));
	SET a_get_all_plant_storage := IFNULL(a_get_all_plant_storage, 0);
	SET a_get_inactive_plant_storage := IFNULL(a_get_inactive_plant_storage, 0);
	SET a_get_first_plant_storage_only := IFNULL(a_get_first_plant_storage_only, 1);
	SET a_ids_plant_storage := TRIM(IFNULL(a_ids_plant_storage, ''));
	SET a_get_all_location_storage := IFNULL(a_get_all_location_storage, 0);
	SET a_get_inactive_location_storage := IFNULL(a_get_inactive_location_storage, 0);
	SET a_get_first_location_storage_only := IFNULL(a_get_first_location_storage_only, 1);
	SET a_ids_location_storage := TRIM(IFNULL(a_ids_location_storage, ''));
	SET a_date_received_to := IFNULL(a_date_received_to, NOW());
	SET a_get_sealed_stock_item_only := IFNULL(a_get_sealed_stock_item_only, 0);
	SET a_get_unsealed_stock_item_only := IFNULL(a_get_unsealed_stock_item_only, 0);
	SET a_get_expired_stock_item_only := IFNULL(a_get_expired_stock_item_only, 0);
	SET a_get_nonexpired_stock_item_only := IFNULL(a_get_nonexpired_stock_item_only, 0);
	SET a_get_consumed_stock_item_only := IFNULL(a_get_consumed_stock_item_only, 0);
	SET a_get_nonconsumed_stock_item_only := IFNULL(a_get_nonconsumed_stock_item_only, 0);
	
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Region_Storage;
    DROP TABLE IF EXISTS tmp_Plant_Storage;
    DROP TABLE IF EXISTS tmp_Location_Storage;
	DROP TABLE IF EXISTS tmp_Stock_Item;
    DROP TABLE IF EXISTS tmp_Permutation;
    DROP TABLE IF EXISTS tmp_Product;
    DROP TABLE IF EXISTS tmp_Category;
	DROP TABLE IF EXISTS tmp_Msg_Error;
    
    CREATE TEMPORARY TABLE tmp_Category (
		id_category INT NOT NULL
        /*
        , CONSTRAINT FK_tmp_Category_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Category(id_category)
		/
        active BIT NOT NULL,
        display_order INT NOT NULL, 
		can_view BIT, 
        can_edit BIT, 
        can_admin BIT
        */
        , rank_category INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Product (
		/*
		id_category INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Category(id_category),
		*/
		id_product INT NOT NULL
        /*
        , CONSTRAINT FK_tmp_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product)
		*/
		-- product_has_variations BIT NOT NULL,
		/*
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
		/
        price_GBP_full FLOAT NOT NULL,
		price_GBP_min FLOAT NOT NULL,
		*
        , latency_manufacture INT NOT NULL
		, quantity_min FLOAT NOT NULL
		, quantity_max FLOAT NOT NULL
		, quantity_step FLOAT NOT NULL
		, quantity_stock FLOAT NOT NULL
		, is_subscription BIT NOT NULL
		, id_recurrence_interval INT
		, CONSTRAINT FK_tmp_Shop_Product_id_recurrence_interval
			FOREIGN KEY (id_recurrence_interval)
			REFERENCES Shop_Recurrence_Interval(id_interval)
		, count_recurrence_interval INT
        , id_stripe_product VARCHAR(100)
        , product_has_variations INT NOT NULL
        , can_view BIT
        , can_edit BIT
        , can_admin BIT
        */
        , rank_product INT NOT NULL
    );

	CREATE TEMPORARY TABLE tmp_Permutation (
		id_permutation INT NOT NULL
        /*
		CONSTRAINT FK_tmp_Permutation_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation)
		*/
        , rank_permutation INT NOT NULL
	);
	
	CREATE TEMPORARY TABLE tmp_Stock_Item (
		id_stock INT NOT NULL PRIMARY KEY,
		id_permutation INT NOT NULL
        /*
		CONSTRAINT FK_tmp_Stock_Item_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
		*/
		, id_product INT NOT NULL
        /*
		CONSTRAINT FK_tmp_Stock_Item_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		*/
		, id_category INT NOT NULL
        /*
		CONSTRAINT FK_tmp_Stock_Item_id_category
			FOREIGN KEY (id_category)
			REFERENCES Shop_Category(id_category),
		*/
		, date_purchased TIMESTAMP NOT NULL
		, date_received TIMESTAMP NULL
		, id_location_storage INT NOT NULL
        /*
		CONSTRAINT FK_tmp_Stock_Item_id_location_storage
			FOREIGN KEY (id_location_storage)
			REFERENCES Shop_Storage_Location(id_location),
		*/
		, id_currency_cost INT NOT NULL
        /*
		CONSTRAINT FK_tmp_Stock_Item_id_currency
			FOREIGN KEY (id_currency_cost)
			REFERENCES Shop_Currency(id_currency),
		*/
		, cost_local_VAT_incl FLOAT NOT NULL
		, cost_local_VAT_excl FLOAT NOT NULL
		, is_sealed BIT NOT NULL DEFAULT 1
		, date_unsealed TIMESTAMP NULL
		, date_expiration TIMESTAMP NOT NULL
		, is_consumed BIT NOT NULL DEFAULT 0
		, date_consumed TIMESTAMP NULL
		, active_stock_item BIT NOT NULL DEFAULT 1
        , active_permutation BIT NOT NULL
        , active_product BIT NOT NULL
        , active_category BIT NOT NULL
        , rank_stock_item INT NOT NULL
        , display_order_permutation INT NOT NULL
        , display_order_product INT NOT NULL
        , display_order_category INT NOT NULL
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
        , rank_region INT NOT NULL
	);

	CREATE TEMPORARY TABLE tmp_Plant_Storage (
		id_plant INT NOT NULL PRIMARY KEY
        /*
		CONSTRAINT FK_tmp_Plant_Storage_id_plant
			FOREIGN KEY (id_plant)
			REFERENCES Shop_Plant(id_plant)
		*/
        , rank_plant INT NOT NULL
        , id_region INT NOT NULL
	);

	CREATE TEMPORARY TABLE tmp_Location_Storage (
		id_location INT NOT NULL PRIMARY KEY
        /*
		CONSTRAINT FK_tmp_Location_Storage_id_location
			FOREIGN KEY (id_location)
			REFERENCES Shop_Location_Storage(id_location)
		*/
        , rank_location INT NOT NULL
        , id_plant INT NOT NULL
	);
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
        /*
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
		*/
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Parse filters
    SET v_has_filter_category = CASE WHEN a_ids_category = '' THEN 0 ELSE 1 END;
    SET v_has_filter_product = CASE WHEN a_ids_product = '' THEN 0 ELSE 1 END;
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_stock_item = CASE WHEN a_ids_stock_item = '' THEN 0 ELSE 1 END;
    SET v_has_filter_region_storage = CASE WHEN a_ids_region_storage = '' THEN 0 ELSE 1 END;
    SET v_has_filter_plant_storage = CASE WHEN a_ids_plant_storage = '' THEN 0 ELSE 1 END;
    SET v_has_filter_location_storage = CASE WHEN a_ids_location_storage = '' THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
	INSERT INTO tmp_Stock_Item (
		id_stock,
		id_permutation,
		id_product,
		id_category,
		active_stock_item,
		active_permutation,
		active_product,
		active_category,
        display_order_permutation,
        display_order_product,
        display_order_category,
        rank_stock_item,
		date_purchased,
		date_received,
		id_location_storage,
		id_currency_cost,
        /*
		symbol_currency_cost,
		code_currency_cost,
		*/
        cost_local_VAT_incl,
		cost_local_VAT_excl,
		is_sealed,
		date_unsealed,
		date_expiration,
		is_consumed,
		date_consumed
	)
    SELECT 
		SI.id_stock,
		PP.id_permutation,
		P.id_product,
		P.id_category,
        SI.active AS active_stock_item,
		PP.active AS active_permutation,
		P.active AS active_product,
		C.active AS active_category,
		PP.display_order AS display_order_permutation,
		P.display_order AS display_order_product,
		C.display_order AS display_order_category,
        RANK() OVER (ORDER BY C.display_order, P.display_order, PP.display_order, SI.date_expiration) AS rank_stock_item,
		SI.date_purchased,
		SI.date_received,
		SI.id_location_storage,
		SI.id_currency_cost,
		/*
        CURRENCY.symbol AS symbol_currency_cost,
		CURRENCY.code AS code_currency_cost,
		*/
        SI.cost_local_VAT_incl,
		SI.cost_local_VAT_excl,
		SI.is_sealed,
		SI.date_unsealed,
		SI.date_expiration,
		SI.is_consumed,
		SI.date_consumed
	FROM Shop_Stock_Item SI
	INNER JOIN Shop_Product_Permutation PP ON SI.id_permutation = PP.id_permutation
	INNER JOIN Shop_Product P ON PP.id_product = P.id_product
	INNER JOIN Shop_Category C ON P.id_category = C.id_category	
	WHERE
		# stock items
		(
			(
				a_get_all_stock_item
				OR (
					v_has_filter_stock_item
                    AND FIND_IN_SET(SI.id_stock, a_ids_stock_item) > 0
				)
			)
			AND (
				a_get_inactive_stock_item
				OR SI.active
			)
			AND (
				ISNULL(a_date_received_to)
				OR SI.date_received <= a_date_received_to
			)
			AND (
				a_get_unsealed_stock_item_only = 0
				OR NOT SI.is_sealed
			)
			AND (
				a_get_sealed_stock_item_only = 0
				OR SI.is_sealed
			)
			AND (
				a_get_nonexpired_stock_item_only = 0
				OR SI.date_expiration > v_now
			)
			AND (
				a_get_expired_stock_item_only = 0
				OR SI.date_expiration <= v_now
			)
			AND (
				a_get_consumed_stock_item_only = 0
				OR SI.is_consumed
			)
			AND (
				a_get_nonconsumed_stock_item_only = 0
				OR NOT SI.is_consumed
			)
        )
		# permutations
		AND (
			(
				a_get_all_product_permutation 
				OR (
					v_has_filter_permutation 
                    AND FIND_IN_SET(PP.id_permutation, a_ids_permutation) > 0
				)
			)
			AND (
				a_get_inactive_permutation 
				OR PP.active
			)
        )
		# products
		AND (
			(
				a_get_all_product 
				OR v_has_filter_product AND FIND_IN_SET(P.id_product, a_ids_product) > 0
			)
			AND (
				a_get_inactive_product 
				OR P.active
			)
		)
		# categories
		AND (
			(
				a_get_all_category 
                OR v_has_filter_category AND FIND_IN_SET(P.id_category, a_ids_category) > 0
			)
			AND (
				a_get_inactive_category 
				OR C.active
			)
		) 
    ;
    IF a_get_first_stock_item_only THEN
		DELETE t_SI
		FROM tmp_Stock_Item t_SI
		WHERE t_SI.rank_stock_item > 1
		;
	END IF;

	-- Permutations
    INSERT INTO tmp_Permutation (
		id_permutation,
        rank_permutation
	)
	SELECT 
		DISTINCT t_SI.id_permutation
        , RANK() OVER (ORDER BY id_permutation) AS rank_permutation
	FROM tmp_Stock_Item t_SI
	;
    IF a_get_first_product_only THEN
		DELETE t_P
		FROM tmp_Product t_P
		WHERE t_P.rank_permutation > 1
		;
    END IF;
    

	-- Products
    INSERT INTO tmp_Product (
		id_product,
        rank_product
	)
	SELECT 
		DISTINCT t_SI.id_product
        , RANK() OVER (ORDER BY id_product) AS rank_product
	FROM tmp_Stock_Item t_SI
	;
    IF a_get_first_product_only THEN
		DELETE t_P
		FROM tmp_Product t_P
		WHERE t_P.rank_product > 1
		;
    END IF;

    
	-- Categories
    INSERT INTO tmp_Category (
		id_category,
        rank_category
	)
	SELECT 
		DISTINCT t_SI.id_category
        , RANK() OVER (ORDER BY id_category) AS rank_category
	FROM tmp_Stock_Item t_SI
	;
	IF a_get_first_category_only THEN
		DELETE t_P
		FROM tmp_Product t_P
		INNER JOIN tmp_Category t_C ON t_P.id_category = t_C.id_category
		WHERE t_C.rank_category > 1
		;
		DELETE t_C
		FROM tmp_Category t_C
		WHERE t_C.rank_category > 1
		;
	END IF;

	-- Storage Regions
    INSERT INTO tmp_Region_Storage (
		id_region
        , rank_region
    )
    WITH RECURSIVE Recursive_CTE_Region_Storage AS (
		SELECT 
			R.id_region AS id_region_parent,
            NULL AS id_region_child
		FROM tmp_Stock_Item t_SI
		-- INNER JOIN tmp_Stock_Item t_SI ON SL.id_location = t_SI.id_location_storage
		INNER JOIN Shop_Storage_Location SL ON t_SI.id_location_storage = SL.id_location
		INNER JOIN Shop_Plant P ON SL.id_plant = P.id_plant
		INNER JOIN Shop_Address A ON P.id_address = A.id_address
		INNER JOIN Shop_Region R 
			ON A.id_region = R.id_region
			AND (
				a_get_all_region_storage
				OR FIND_IN_SET(R.id_region, a_ids_region_storage) > 0
			)
			AND (
				a_get_inactive_region_storage
				OR R.active = 1
			)			
		UNION
        SELECT 
			RB.id_region_parent,
			RB.id_region_child
		FROM Shop_Region_Branch RB
        INNER JOIN Recursive_CTE_Region_Storage r_RS
			ON RB.id_region_parent = r_RS.id_region_child
            AND (
				a_get_inactive_region_storage
                OR RB.active = 1
            )
	)
    SELECT
		DISTINCT R.id_region,
		RANK() OVER (ORDER BY R.id_region) AS rank_region
	FROM Shop_Region R
    INNER JOIN Recursive_CTE_Region_Storage r_RS
		ON R.id_region = r_RS.id_region_parent
		OR R.id_region = r_RS.id_region_child
    ;
	IF a_get_first_region_storage_only THEN
		DELETE t_RS
		FROM tmp_Region_Storage t_RS
		WHERE t_RS.rank_region > 1
		;
	END IF;

	-- Plants
    INSERT INTO tmp_Plant_Storage (
		id_plant
		, rank_plant
        , id_region
	)
	SELECT 
		DISTINCT P.id_plant
		, RANK() OVER (ORDER BY P.id_plant) AS rank_plant
        , A.id_region
	FROM tmp_Stock_Item t_SI
	INNER JOIN Shop_Storage_Location SL ON t_SI.id_location_storage = SL.id_location
	INNER JOIN Shop_Plant P ON SL.id_plant = P.id_plant
    INNER JOIN Shop_Address A ON P.id_address = A.id_address
	;
    IF a_get_first_plant_storage_only THEN
		DELETE t_P
		FROM tmp_Plant_Storage t_P
		WHERE t_P.rank_plant > 1
		;
    END IF;
    
	-- Storage Locations
    INSERT INTO tmp_Location_Storage (
		id_location
        , rank_location
        , id_plant
    )
    WITH RECURSIVE Recursive_CTE_Location_Storage AS (
		SELECT 
			SL.id_location AS id_location_parent,
            NULL AS id_location_child
		FROM tmp_Stock_Item t_SI
		-- INNER JOIN tmp_Stock_Item t_SI ON SL.id_location = t_SI.id_location_storage
		INNER JOIN Shop_Storage_Location SL 
			ON t_SI.id_location_storage = SL.id_location
			AND (
				a_get_all_location_storage
				OR FIND_IN_SET(SL.id_location, a_ids_location_storage) > 0
			)
			AND (
				a_get_inactive_location_storage
				OR SL.active = 1
			)			
		UNION
        SELECT 
			SLB.id_location_parent,
			SLB.id_location_child
		FROM Shop_Storage_Location_Branch SLB
        INNER JOIN Recursive_CTE_Location_Storage r_LS
			ON SLB.id_location_parent = r_LS.id_location_child
            AND (
				a_get_inactive_location_storage
                OR SLB.active = 1
            )
	)
    SELECT
		DISTINCT SL.id_location
		, RANK() OVER (ORDER BY SL.id_location) AS rank_location
        , SL.id_plant
	FROM Shop_Storage_Location SL
    INNER JOIN Recursive_CTE_Location_Storage r_LS
		ON SL.id_location = r_LS.id_location_parent
		OR SL.id_location = r_LS.id_location_child
    ;
	IF a_get_first_location_storage_only THEN
		DELETE t_LS
		FROM tmp_Location_Storage t_LS
		WHERE t_LS.rank_location > 1
		;
	END IF;


    -- Permissions
    IF EXISTS (SELECT * FROM tmp_Stock_Item LIMIT 1) THEN
        SET v_id_permission_product := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
        SET v_ids_product_permission := (SELECT GROUP_CONCAT(id_product SEPARATOR ',') FROM tmp_Product WHERE NOT ISNULL(id_product));
        -- SET v_ids_permutation_permission := (SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') FROM tmp_Shop_Product WHERE NOT ISNULL(id_permutation));
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission;
        -- select * from Shop_User_Eval_Temp;
        
        CALL p_shop_user_eval(v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_product_permission);
        
        -- select * from Shop_User_Eval_Temp;
        
        UPDATE tmp_Stock_Item t_SI
        INNER JOIN Shop_User_Eval_Temp UE_T
			ON t_SI.id_product = UE_T.id_product
			AND UE_T.GUID = v_guid
        SET t_SI.can_view = UE_T.can_view,
			t_SI.can_edit = UE_T.can_edit,
            t_SI.can_admin = UE_T.can_admin
		;
        
        DELETE t_SI
		FROM tmp_Stock_Item t_SI
        /*
		LEFT JOIN Shop_User_Eval_Temp UE_T
			ON t_SI.id_product = UE_T.id_product
			AND UE_T.GUID = v_guid
		*/
		WHERE 
			/*
			FIND_IN_SET(t_SI.id_product, (
				SELECT GROUP_CONCAT(UET.id_product SEPARATOR ',') 
				FROM Shop_User_Eval_Temp UET)
			) = 0 # id_product NOT LIKE CONCAT('%', (SELECT GROUP_CONCAT(id_product SEPARATOR '|') FROM Shop_User_Eval_Temp), '%');
			*/
            /*
			ISNULL(UE_T.id_product)
			OR IFNULL(UE_T.can_view, 0) = 0
            */
            t_SI.id_product NOT IN (
				SELECT id_product 
                FROM Shop_User_Eval_Temp UE_T
                WHERE
					GUID = v_guid
					AND IFNULL(can_view, 0) = 1
			)
        ;
        
        # CALL p_shop_user_eval_clear_temp(v_guid);
        # DROP TABLE IF EXISTS Shop_User_Eval_Temp;
        DELETE FROM Shop_User_Eval_Temp
        WHERE GUID = v_guid
        ;
    END IF;
    
    
    -- Returns
    -- SET v_now := NOW();
    # Stock Items
    SELECT 
		t_SI.id_stock,
		t_SI.id_permutation,
		t_SI.id_product,
		t_SI.id_category,
		t_SI.date_purchased,
		t_SI.date_received,
		t_SI.id_location_storage,
		SL.name AS name_location_storage,
		t_SI.id_currency_cost,
		CURRENCY.symbol AS symbol_currency_cost,
		CURRENCY.code AS code_currency_cost,
		t_SI.cost_local_VAT_incl,
		t_SI.cost_local_VAT_excl,
		t_SI.is_sealed,
		t_SI.date_unsealed,
		t_SI.date_expiration,
		t_SI.is_consumed,
		t_SI.date_consumed,
		t_SI.active_stock_item,
		t_SI.active_permutation,
		t_SI.active_product,
		t_SI.active_category,
		IFNULL(t_SI.can_view, 0),
        IFNULL(t_SI.can_edit, 0),
        IFNULL(t_SI.can_admin, 0)
    FROM tmp_Stock_Item t_SI
	INNER JOIN tmp_Permutation t_PP ON t_SI.id_permutation = t_PP.id_permutation
	INNER JOIN tmp_Product t_P ON t_SI.id_product = t_P.id_product
	INNER JOIN tmp_Category t_C ON t_SI.id_category = t_C.id_category
	INNER JOIN tmp_Location_Storage t_LS ON t_SI.id_location_storage = t_LS.id_location
	INNER JOIN tmp_Plant_Storage t_PS ON t_LS.id_plant = t_PS.id_plant
    INNER JOIN Shop_Plant P ON t_PS.id_plant = P.id_plant
	INNER JOIN Shop_Address A ON P.id_address = A.id_address
	INNER JOIN tmp_Region_Storage t_RS ON A.id_region = t_RS.id_region
	INNER JOIN Shop_Storage_Location SL ON t_LS.id_location = SL.id_location
    INNER JOIN Shop_Currency CURRENCY ON t_SI.id_currency_cost = CURRENCY.id_currency
	WHERE
		IFNULL(t_SI.can_view, 0) = 1
	ORDER BY t_SI.rank_stock_item
	;

	# Variations
	SELECT
		V.id_variation,
		VT.id_type,
		t_SI.id_stock_item,
		t_SI.id_permutation,
		t_SI.id_product,
		t_SI.id_category,
		VT.code AS code_variation_type,
		VT.name AS name_variation_type,
		V.code AS code_variation,
		V.name AS name_variation,
		RANK() OVER (ORDER BY t_SI.rank_permutation, PPVL.display_order) AS display_order
	FROM Shop_Variation V
	INNER JOIN Shop_Variation_Type VT ON V.id_type = VT.id_type
	INNER JOIN Shop_Product_Permutation_Variation_Link PPVL ON V.id_variation = PPVL.id_variation
	INNER JOIN tmp_Stock_Item t_SI ON PPVL.id_permutation = t_SI.id_permutation
	INNER JOIN tmp_Permutation t_PP ON t_SI.id_permutation = t_PP.id_permutation
	INNER JOIN tmp_Product t_P ON t_SI.id_product = t_P.id_product
	INNER JOIN tmp_Category t_C ON t_SI.id_category = t_C.id_category
	INNER JOIN tmp_Location_Storage t_LS ON t_SI.id_location_storage = t_LS.id_location
	INNER JOIN tmp_Plant_Storage t_PS ON t_LS.id_plant = t_PS.id_plant
	INNER JOIN tmp_Region_Storage t_RS ON t_PS.id_region = t_RS.id_region
	WHERE 
		V.active
		AND PPVL.active
    ;
    
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
    
    
    -- Clean up
    DROP TEMPORARY TABLE IF EXISTS tmp_Region_Storage;
    DROP TEMPORARY TABLE IF EXISTS tmp_Plant_Storage;
    DROP TEMPORARY TABLE IF EXISTS tmp_Location_Storage;
	DROP TEMPORARY TABLE IF EXISTS tmp_Stock_Item;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Product;
    DROP TEMPORARY TABLE IF EXISTS tmp_Category;
	DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
END //
DELIMITER ;

/*
CALL p_shop_get_many_stock_item (
	0, # a_id_user
    1, # a_get_all_category
	0, # a_get_inactive_category
	0, # a_get_first_category_only
	'', # a_ids_category
    1, # a_get_all_product
	0, # a_get_inactive_product
    0, # a_get_first_product_only
	'', # a_ids_product
    1, # a_get_all_product_permutation
	0, # a_get_inactive_permutation
	0, # a_get_first_permutation_only
	'1,2,3,4,5,6', # a_ids_permutation
	1, # a_get_all_stock_item
	0, # a_get_inactive_stock_item
	0, # a_get_first_stock_item_only
	'', # a_ids_stock_item
    0, # a_get_all_region_storage
    0, # a_get_inactive_delivery_region
	0, # a_get_first_region_storage_only
	'', # a_ids_region_storage
	0, # a_get_all_plant_storage
	0, # a_get_inactive_plant_storage
	0, # a_get_first_plant_storage_only
	'', # a_ids_plant_storage
	0, # a_get_all_location_storage
	0, # a_get_inactive_location_storage
	0, # a_get_first_location_storage_only
	'', # a_ids_location_storage
	NOW(), # a_date_received_to
	0, # a_get_sealed_stock_item_only
	0, # a_get_unsealed_stock_item_only
	0, # a_get_expired_stock_item_only
	0, # a_get_nonexpired_stock_item_only
	0, # a_get_consumed_stock_item_only
	0 # a_get_nonconsumed_stock_item_only
);


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
    -- DECLARE v_now TIMESTAMP;
    
    
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
DELIMITER ;



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
)
BEGIN
    DECLARE v_id_access_level_view INT;
    DECLARE v_id_permission_store_admin INT;
    DECLARE v_id_permission_user INT;
    DECLARE v_id_permission_user_admin INT;
    DECLARE v_now TIMESTAMP;
    DECLARE v_id_minimum INT;
    DECLARE v_code_error_data VARCHAR(50);
    DECLARE v_id_type_error_data INT;
    DECLARE v_has_filter_user BIT;
    DECLARE v_guid BINARY(36);
    
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_id_permission_store_admin := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_ADMIN' LIMIT 1);
    SET v_id_permission_user := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_USER' LIMIT 1);
    SET v_id_permission_user_admin := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_USER_ADMIN' LIMIT 1);
    SET v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1);
    
    SET a_ids_user := TRIM(IFNULL(a_ids_user, ''));
    SET a_ids_user_auth0 := TRIM(IFNULL(a_ids_user_auth0, ''));
    
    DROP TEMPORARY TABLE IF EXISTS tmp_User;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    
    CREATE TEMPORARY TABLE tmp_User (
		id_user INT NOT NULL,
        rank_user INT NULL
    );
    
	CREATE TEMPORARY TABLE tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    IF ISNULL(a_id_user) AND NOT ISNULL(a_id_user_auth0) THEN
		SET a_id_user := (SELECT U.id_user FROM Shop_User U WHERE U.id_user_auth0 LIKE CONCAT('%', a_id_user_auth0, '%') LIMIT 1);
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
			v_id_type_error_data,
			v_code_error_data, 
			CONCAT('User ID required for authorisation.')
		)
		;
    END IF;
    
    SET v_has_filter_user := CASE WHEN a_ids_user = '' AND a_ids_user_auth0= '' THEN 0 ELSE 1 END;
    
    IF v_has_filter_user THEN
		INSERT INTO tmp_User (
			id_user
			-- , active
			, rank_user
		)
		SELECT 
			DISTINCT U.id_user
			-- S.active
			, RANK() OVER (ORDER BY id_user ASC) AS rank_user
		FROM Shop_User U
		WHERE 1=1
			AND (
				FIND_IN_SET(U.id_user, a_ids_user) > 0
				OR FIND_IN_SET(U.id_user_auth0, a_ids_user_auth0) > 0
			)
            AND (
				a_get_inactive_user
                OR U.active
            )
		/*Shop_User_Eval_Temp UE_T
		WHERE 1=1
			AND UE_T.guid = v_guid
			AND UE_T.active = 1
		*/
		;
        
        IF a_get_first_user_only THEN
			DELETE t_U
			FROM tmp_User t_U
            WHERE t_U.rank_user > 1
            ;
		END IF;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
        -- select * from Shop_User_Eval_Temp;
        
        CALL p_shop_user_eval(
			v_guid, -- guid
            a_id_user, -- ids_user
            FALSE, -- get_inactive_user
            CONCAT(v_id_permission_user, ',', v_id_permission_user_admin, ',', v_id_permission_store_admin), -- ids_permission
            v_id_access_level_view, -- ids_access_level
            '' -- ids_product
		);
        
        -- select * from Shop_User_Eval_Temp;
        
        IF NOT EXISTS (
			SELECT can_view 
            FROM Shop_User_Eval_Temp UE_T 
            WHERE 1=1
				AND UE_T.GUID = v_guid
                AND UE_T.id_permission_required = v_id_permission_user
		) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
                id_type,
				code,
				msg
			)
			VALUES (
				v_guid,
                v_id_type_error_data,
				v_code_error_data, 
				CONCAT('You do not have view permissions for ', (SELECT name FROM Shop_Permission WHERE id_permission = v_id_permission_user LIMIT 1))
			)
			;
        END IF;
	END IF;
    
    
    -- Returns
    /* NULL record required for flask sql_alchemy to detect result set
    IF EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = v_guid) THEN
		DELETE FROM tmp_User;
    END IF;
    */
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = v_guid) THEN
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
			, UE_T_STORE.can_admin_store AS can_admin_store
			, UE_T_USER.can_admin_user AS can_admin_user
		FROM tmp_User t_U
		INNER JOIN Shop_User U ON t_U.id_user = U.id_user
		INNER JOIN (
			SELECT
				id_user
				, id_permission_required
				, can_admin AS can_admin_store
			FROM Shop_User_Eval_Temp UE_T_STORE
			WHERE 1=1
				AND UE_T_STORE.guid = v_guid
				AND UE_T_STORE.id_permission_required = v_id_permission_store_admin
		) UE_T_STORE ON t_U.id_user = UE_T_STORE.id_user
		INNER JOIN (
			SELECT
				id_user
				, id_permission_required
				, can_admin AS can_admin_user
			FROM Shop_User_Eval_Temp UE_T_USER
			WHERE 1=1
				AND UE_T_USER.guid = v_guid
				AND UE_T_USER.id_permission_required = v_id_permission_user_admin
		) UE_T_USER ON t_U.id_user = UE_T_USER.id_user
		;
    ELSE
		SELECT 
			NULL AS id_user
			, NULL AS id_user_auth0
			, NULL AS firstname
			, NULL AS surname
			, NULL AS email
			, NULL AS is_email_verified
			, NULL AS id_currency_default
			, NULL AS id_region_default
			, NULL AS is_included_VAT_default
			, NULL AS is_super_user
			, NULL AS can_admin_store
			, NULL AS can_admin_user
		;
	END IF;
    
    # Errors
    SELECT 
        t_ME.display_order,
        MET.code, 
        t_ME.msg,
        MET.name,
        MET.description
    FROM tmp_Msg_Error t_ME
    INNER JOIN Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    WHERE guid = v_guid
    ;
    
    
    -- Clean up
    DROP TEMPORARY TABLE IF EXISTS tmp_User;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
        
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid
	;
END //
DELIMITER ;


/*

CALL p_get_many_user (
	NULL # a_id_user
    , 'auth0|6582b95c895d09a70ba10fef' # a_id_user_auth0
    , 0 # a_get_all_user
	, 0 # a_get_inactive_user
    , 0 # a_get_first_user_only
	, NULL # a_ids_user
	, 'auth0|6582b95c895d09a70ba10fef' # a_ids_user_auth0 # ' -- 
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
    DECLARE v_now TIMESTAMP;
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
        CALL p_shop_user_eval(v_guid_permission, v_id_user, v_id_permission_supplier, '');
        
        /*
        UPDATE tmp_Shop_Supplier t_S
        INNER JOIN Shop_User_Eval_Temp TP
			ON TP.GUID = v_guid_permission
        SET tP.can_view = TP.can_view,
			tP.can_edit = TP.can_edit,
            tP.can_admin = TP.can_admin;
		*/
        SET v_has_permission := (SELECT can_edit FROM Shop_User_Eval_Temp WHERE GUID = v_guid_permission);
        
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
        
        -- CALL p_shop_user_eval_clear_temp(v_guid_permission);
        
        DELETE FROM Shop_User_Eval_Temp
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
DELIMITER ;


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
    DECLARE v_now TIMESTAMP;
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
		CALL p_split(a_ids_supplier, ',');
        
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
        -- select * from Shop_User_Eval_Temp;
        
        CALL p_shop_user_eval(v_guid, a_id_user, FALSE, v_id_permission_supplier, v_id_access_level_view, '');
        
        -- select * from Shop_User_Eval_Temp;
        
        IF NOT EXISTS (SELECT can_view FROM Shop_User_Eval_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
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
        
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid
	;
END //
DELIMITER ;


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
        
        CALL p_shop_user_eval(v_guid_permission, a_id_user, 0, v_id_permission_supplier_purchase_order, v_id_access_level_edit, v_ids_product);
        
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
				a_guid, 
				v_id_error_type_no_permission, 
                v_code_error_type_no_permission,
                CONCAT('You do not have permission to edit the following product IDs: ', v_ids_product_no_permission)
			)
			;
        END IF;
        
        DELETE FROM Shop_User_Eval_Temp
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
DELIMITER ;


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
    IN a_date_from TIMESTAMP,
    IN a_date_to TIMESTAMP
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
    -- DECLARE v_now TIMESTAMP;
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
		CALL p_split(a_ids_supplier, ',');
        
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
			CALL p_split(a_ids_category, ',');
			
			IF EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Category C ON TS.substring = C.id_category WHERE ISNULL(C.id_category)) THEN 
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
				LEFT JOIN Shop_Category C ON TS.substring = C.id_category 
				WHERE ISNULL(C.id_category)
				;
			END IF;
			
			DROP TABLE Split_Temp;
		END IF;
	END IF;
    
    IF v_has_filter_product = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
			CALL p_split(a_ids_product, ',');
			
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
			CALL p_split(a_ids_permutation, ',');
			
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
				-- RANK() OVER (ORDER BY C.display_order, P.display_order, PP.display_order) AS rank_permutation, #PARTITION BY P.id_category # _in_category
				/*
				P.name,
				PP.description,
				/*
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
				PP.id_recurrence_interval,
				PP.count_recurrence_interval,
				PP.id_stripe_product,
				P.has_variations
				*/
			FROM Shop_Product P
			INNER JOIN Shop_Product_Permutation PP
				ON P.id_product = PP.id_product
			INNER JOIN Shop_Category C
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
		CALL p_split(a_ids_order, ',');
        
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
            INNER JOIN Shop_Category C ON P.id_category = C.id_category
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
        -- select * from Shop_User_Eval_Temp;
        
        CALL p_shop_user_eval(v_guid, a_id_user, FALSE, v_ids_permission_supplier_purchase_order, v_id_access_level_view, v_ids_product_permission);
        
        -- select * from Shop_User_Eval_Temp;
        
        IF NOT EXISTS (SELECT can_view FROM Shop_User_Eval_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
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
        INNER JOIN Shop_User_Eval_Temp UE_T
			ON t_P.id_product = UE_T.id_product -- t_P.id_permutation = UE_T.id_permutation
			AND UE_T.GUID = v_guid
        SET t_P.can_view = UE_T.can_view,
			t_P.can_edit = UE_T.can_edit,
            t_P.can_admin = UE_T.can_admin
		;
        
        # CALL p_shop_user_eval_clear_temp(v_guid);
        # DROP TABLE IF EXISTS Shop_User_Eval_Temp;
        DELETE FROM Shop_User_Eval_Temp
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
    INNER JOIN Shop_Category C ON P.id_category = C.id_category
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
        
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid
	;
END //
DELIMITER ;


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
        
        CALL p_shop_user_eval(v_guid_permission, a_id_user, 0, v_id_permission_manufacturing_purchase_order, v_id_access_level_edit, v_ids_product);
        
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
DELIMITER ;


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
    IN a_date_from TIMESTAMP,
    IN a_date_to TIMESTAMP
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
    -- DECLARE v_now TIMESTAMP;
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
        # name VARCHAR(255) NOT NULL,
        # description VARCHAR(4000) NOT NULL,
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
		id_recurrence_interval INT,
		CONSTRAINT FK_tmp_Shop_Product_id_recurrence_interval
			FOREIGN KEY (id_recurrence_interval)
			REFERENCES Shop_Recurrence_Interval(id_interval),
		count_recurrence_interval INT,
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
			CALL p_split(a_ids_category, ',');
			
			IF EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Category C ON TS.substring = C.id_category WHERE ISNULL(C.id_category)) THEN 
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
				LEFT JOIN Shop_Category C ON TS.substring = C.id_category 
				WHERE ISNULL(C.id_category)
				;
			END IF;
			
			DROP TABLE Temp_Split;
		END IF;
	END IF;
    
    IF v_has_filter_product = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
			CALL p_split(a_ids_product, ',');
			
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
			CALL p_split(a_ids_permutation, ',');
			
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
				-- RANK() OVER (ORDER BY C.display_order, P.display_order, PP.display_order) AS rank_permutation, #PARTITION BY P.id_category # _in_category
				/*
				P.name,
				PP.description,
				/*
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
				PP.id_recurrence_interval,
				PP.count_recurrence_interval,
				PP.id_stripe_product,
				P.has_variations
				*/
			FROM Shop_Product P
			INNER JOIN Shop_Product_Permutation PP
				ON P.id_product = PP.id_product
			INNER JOIN Shop_Category C
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
		CALL p_split(a_ids_order, ',');
        
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
            INNER JOIN Shop_Category C ON P.id_category = C.id_category
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
        -- select * from Shop_User_Eval_Temp;
        
        CALL p_shop_user_eval(v_guid, a_id_user, FALSE, v_ids_permission_manufacturing_purchase_order, v_id_access_level_view, v_ids_product_permission);
        
        -- select * from Shop_User_Eval_Temp;
        
        IF NOT EXISTS (SELECT can_view FROM Shop_User_Eval_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
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
        INNER JOIN Shop_User_Eval_Temp UE_T
			ON t_P.id_product = UE_T.id_product -- t_P.id_permutation = UE_T.id_permutation
			AND UE_T.GUID = v_guid
        SET t_P.can_view = UE_T.can_view,
			t_P.can_edit = UE_T.can_edit,
            t_P.can_admin = UE_T.can_admin
		;
        
        # CALL p_shop_user_eval_clear_temp(v_guid);
        # DROP TABLE IF EXISTS Shop_User_Eval_Temp;
        DELETE FROM Shop_User_Eval_Temp
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
    INNER JOIN Shop_Category C ON P.id_category = C.id_category
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
        
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid
	;
END //
DELIMITER ;


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
        CALL p_shop_user_eval(v_guid_permission, a_id_user, 0, v_id_permission_customer, v_id_access_level_edit, '');
        
        /*
        UPDATE tmp_Shop_Customer t_S
        INNER JOIN Shop_User_Eval_Temp TP
			ON TP.GUID = v_guid_permission
        SET tP.can_view = TP.can_view,
			tP.can_edit = TP.can_edit,
            tP.can_admin = TP.can_admin;
		*/
        SET v_has_permission := (SELECT can_edit FROM Shop_User_Eval_Temp WHERE GUID = v_guid_permission);
        
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
        
        -- CALL p_shop_user_eval_clear_temp(v_guid_permission);
        
        DELETE FROM Shop_User_Eval_Temp
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
DELIMITER ;


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
    DECLARE v_now TIMESTAMP;
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
		CALL p_split(a_ids_customer, ',');
        
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
        -- select * from Shop_User_Eval_Temp;
        
        CALL p_shop_user_eval(v_guid, a_id_user, FALSE, v_id_permission_customer, v_id_access_level_view, '');
        
        -- select * from Shop_User_Eval_Temp;
        
        IF NOT EXISTS (SELECT can_view FROM Shop_User_Eval_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
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
        
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid
	;
END //
DELIMITER ;


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
        
        CALL p_shop_user_eval(v_guid_permission, a_id_user, 0, v_id_permission_Customer_Sales_order, v_id_access_level_edit, v_ids_product);
        
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
				a_guid, 
				v_id_error_type_no_permission, 
                v_code_error_type_no_permission,
                CONCAT('You do not have permission to edit the following product IDs: ', v_ids_product_no_permission)
			)
			;
        END IF;
        
        DELETE FROM Shop_User_Eval_Temp
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
DELIMITER ;


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
    IN a_date_from TIMESTAMP,
    IN a_date_to TIMESTAMP
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
    -- DECLARE v_now TIMESTAMP;
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
		id_recurrence_interval INT,
		CONSTRAINT FK_tmp_Shop_Product_id_recurrence_interval
			FOREIGN KEY (id_recurrence_interval)
			REFERENCES Shop_Recurrence_Interval(id_interval),
		count_recurrence_interval INT,
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
		CALL p_split(a_ids_customer, ',');
        
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
			CALL p_split(a_ids_category, ',');
			
			IF EXISTS (SELECT * FROM Split_Temp TS LEFT JOIN Shop_Category C ON TS.substring = C.id_category WHERE ISNULL(C.id_category)) THEN 
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
				LEFT JOIN Shop_Category C ON TS.substring = C.id_category 
				WHERE ISNULL(C.id_category)
				;
			END IF;
			
			DROP TABLE Temp_Split;
		END IF;
	END IF;
    
    IF v_has_filter_product = 1 THEN
		IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
			CALL p_split(a_ids_product, ',');
			
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
			CALL p_split(a_ids_permutation, ',');
			
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
				PP.id_recurrence_interval,
				PP.count_recurrence_interval,
				PP.id_stripe_product,
				P.has_variations
				*/
			FROM Shop_Product P
			INNER JOIN Shop_Product_Permutation PP
				ON P.id_product = PP.id_product
			INNER JOIN Shop_Category C
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
		CALL p_split(a_ids_order, ',');
        
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
            INNER JOIN Shop_Category C ON P.id_category = C.id_category
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
        -- select * from Shop_User_Eval_Temp;
        
        CALL p_shop_user_eval(v_guid, a_id_user, FALSE, v_ids_permission_customer_purchase_order, v_id_access_level_view, v_ids_product_permission);
        
        -- select * from Shop_User_Eval_Temp;
        
        IF NOT EXISTS (SELECT can_view FROM Shop_User_Eval_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
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
        INNER JOIN Shop_User_Eval_Temp UE_T
			ON t_P.id_product = UE_T.id_product -- t_P.id_permutation = UE_T.id_permutation
			AND UE_T.GUID = v_guid
        SET t_P.can_view = UE_T.can_view,
			t_P.can_edit = UE_T.can_edit,
            t_P.can_admin = UE_T.can_admin
		;
        
        # CALL p_shop_user_eval_clear_temp(v_guid);
        # DROP TABLE IF EXISTS Shop_User_Eval_Temp;
        DELETE FROM Shop_User_Eval_Temp
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
    INNER JOIN Shop_Category C ON P.id_category = C.id_category
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
        
	DELETE FROM Shop_User_Eval_Temp
	WHERE GUID = v_guid
	;
END //
DELIMITER ;


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
	name_singular, name_plural, symbol, is_base_unit
)
VALUES
	('metre', 'metres', 'm', 1),
    ('kilogram', 'kilograms', 'kg', 1),
    ('item', 'items', 'x', 0),
	('hour', 'hours', 'h', 1)
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

/*
# Recurrence Interval
INSERT INTO Shop_Recurrence_Interval (
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
	id_interval_recurrence,
	count_interval_recurrence,
	-- id_access_level_required,
	id_stripe_product
	, does_expire_faster_once_unsealed
	, id_interval_expiration_unsealed
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
		3,
		1,
		99,
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
		3,
		1,
		99,
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
		2,
		1,
		99,
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
		2,
		1,
		99,
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
		2,
		1,
		99,
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
		2,
		1,
		99,
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
	display_order, code, name, latency_delivery_min, latency_delivery_max, quantity_min, quantity_max
)
VALUES 
	(1, 'COLLECT', 'Collection', 0, 0, 0, 1),
	(2, 'SIGNED_1', 'First Class Signed-For', 2, 4, 0, 1)
;

# Product Delivery Option Links
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
DELIMITER ;


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
SELECT * FROM Shop_Recurrence_Interval;
SELECT * FROM Shop_Recurrence_Interval_Audit;
*/


# Categories
SELECT * FROM Shop_Category;
SELECT * FROM Shop_Category_Audit;

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
;SELECT URL.id_link,
	URL.id_user,
    U.name AS name,
    URL.id_role,
    R.name AS role
FROM Shop_User_Role_Link URL
INNER JOIN Shop_User U
	ON URL.id_user = U.id_user
INNER JOIN Shop_Role R
	ON URL.id_role = R.id_role
;
SELECT *
FROM Shop_Role_Permission_Link
;
SELECT *
FROM Shop_Access_Level
;
SELECT *
FROM Shop_Permission
;
SELECT *
FROM Shop_Access_Level
;


select * from shop_user;
select * from shop_user_audit;
select * from Shop_User_Change_Set;
/*
INSERT INTO Shop_User_Change_Set ( comment )
VALUES ('Demotion');
*/
UPDATE Shop_User
SET is_super_user = 0,
    id_change_set = (SELECT id_change_set FROM Shop_User_Change_Set LIMIT 1)
WHERE id_user = 1
;
select * from shop_user;
select * from shop_user_audit;


drop procedure if exists p_test;
delimiter //
create procedure p_test ()
begin
	declare b0 int;
	declare b1 int;
    SET b0 = 0;
    SET b1 = 1;
    select b0, b1;
	select cast(b0 as char), cast(b1 as char);
	select cast(b0 as char character set utf8), cast(b1 as char character set utf8);
	select convert(b0, char), convert(b1, char);
	select convert(b0, char character set utf8), convert(b1, char character set utf8);
	select convert(convert(b0, signed), char), convert(convert(b1, signed), char);
	select convert(convert(b0, signed), char character set utf8), convert(convert(b1, signed), char character set utf8);
end //
delimiter ;
call p_test();
drop procedure if exists p_test;

INSERT INTO Shop_User_Audit (
	id_user,
	name_field,
	value_prev,
	value_new,
	id_change_set
)
SELECT id_user, name_field, value_prev, value_new, id_change_set
FROM Shop_User_Audit
WHERE id_audit = 1
UNION
SELECT id_user, name_field, value_prev, value_new, id_change_set
FROM Shop_User_Audit
WHERE id_audit = 1
;

select * from shop_user_audit;


SELECT * FROM Shop_Access_Level;

SELECT * FROM Shop_Product;