

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
SELECT * FROM Shop_Interval_Recurrence;
SELECT * FROM Shop_Interval_Recurrence_Audit;

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
SELECT * FROM Shop_Product_Permutation_Delivery_Option_Link;
SELECT * FROM Shop_Product_Permutation_Delivery_Option_Link_Audit;

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

