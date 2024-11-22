
# Stock Stock Item

-- DROP TABLE IF EXISTS Shop_Stock_Item_Audit;
-- DROP TABLE IF EXISTS Shop_Stock_Item;

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Stock_Item';

CREATE TABLE IF NOT EXISTS Shop_Stock_Item (
	id_stock INT NOT NULL AUTO_INCREMENT PRIMARY KEY
	, id_permutation INT NOT NULL
	, CONSTRAINT FK_Shop_Stock_Item_id_permutation
		FOREIGN KEY (id_permutation)
		REFERENCES partsltd_prod.Shop_Product_Permutation(id_permutation)
	, id_supplier_purchase_order INT NULL
	, CONSTRAINT FK_Shop_Stock_Item_id_supplier_purchase_order
		FOREIGN KEY (id_supplier_purchase_order)
		REFERENCES partsltd_prod.Shop_Supplier_Purchase_Order(id_order)
	, id_manufacturing_purchase_order INT NULL
	, CONSTRAINT FK_Shop_Stock_Item_id_manufacturing_purchase_order
		FOREIGN KEY (id_manufacturing_purchase_order)
		REFERENCES partsltd_prod.Shop_Manufacturing_Purchase_Order(id_order)
	, id_customer_sales_order INT NULL
	, CONSTRAINT FK_Shop_Stock_Item_id_customer_sales_order
		FOREIGN KEY (id_customer_sales_order)
		REFERENCES partsltd_prod.Shop_Customer_Sales_Order(id_order)
	, date_purchased DATETIME NOT NULL
    , date_received DATETIME
    , id_location_storage INT NOT NULL
    , CONSTRAINT FK_Shop_Stock_Item_id_location_storage
		FOREIGN KEY (id_location_storage)
        REFERENCES partsltd_prod.Shop_Storage_Location(id_location)
    , id_currency_cost INT NOT NULL
    , CONSTRAINT FK_Shop_Stock_Item_id_currency
		FOREIGN KEY (id_currency_cost)
        REFERENCES partsltd_prod.Shop_Currency(id_currency)
    , cost_local_VAT_incl FLOAT
    , cost_local_VAT_excl FLOAT
    , is_sealed BIT NOT NULL DEFAULT 1
    , date_unsealed DATETIME
	, date_expiration DATETIME NOT NULL
    , is_consumed BIT NOT NULL DEFAULT 0
    , date_consumed DATETIME
	, active BIT NOT NULL DEFAULT 1
	, created_on DATETIME
	, created_by INT
	, id_change_set INT
	, CONSTRAINT FK_Shop_Stock_Item_id_change_set
		FOREIGN KEY (id_change_set)
		REFERENCES partsltd_prod.Shop_Product_Change_Set(id_change_set)
);
