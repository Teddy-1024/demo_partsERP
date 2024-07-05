
-- Supplier Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Supplier_Audit';

CREATE TABLE IF NOT EXISTS Shop_Supplier_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_supplier INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Audit_id_supplier
		FOREIGN KEY (id_supplier)
        REFERENCES Shop_Supplier(id_supplier)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(255),
    value_new VARCHAR(255),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Supplier_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);
