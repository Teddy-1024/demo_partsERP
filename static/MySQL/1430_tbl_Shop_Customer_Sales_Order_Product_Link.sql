
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
