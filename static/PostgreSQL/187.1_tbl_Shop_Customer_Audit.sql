
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
