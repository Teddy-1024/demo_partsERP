
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
