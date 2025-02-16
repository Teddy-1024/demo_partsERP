
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
