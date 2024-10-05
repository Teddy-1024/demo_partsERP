
/* Clear Store DataBase */



-- Drop dependencies
DROP TABLE IF EXISTS Shop_Calc_User_Temp;
DROP TABLE IF EXISTS tmp_Msg_Error;
DROP TABLE IF EXISTS tmp_Currency;
DROP TABLE IF EXISTS tmp_Delivery_Region;
DROP TABLE IF EXISTS tmp_Region;
DROP TABLE IF EXISTS tmp_Shop_User;
DROP TABLE IF EXISTS tmp_Shop_Order;
DROP TABLE IF EXISTS tmp_Shop_Product;
DROP TABLE IF EXISTS tmp_Shop_Product_p_shop_calc_user;
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

DROP TABLE IF EXISTS Shop_Product_Permutation_Delivery_Option_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Permutation_Delivery_Option_Link;

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

DROP TABLE IF EXISTS Shop_Interval_Recurrence_Audit;
DROP TABLE IF EXISTS Shop_Interval_Recurrence;

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
DROP FUNCTION IF EXISTS p_shop_calc_user;
DROP PROCEDURE IF EXISTS fn_shop_user_eval;
DROP PROCEDURE IF EXISTS p_shop_calc_user;

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