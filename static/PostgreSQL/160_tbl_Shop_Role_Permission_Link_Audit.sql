
-- Role Permission link Audits



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Role_Permission_Link_Audit';

CREATE TABLE IF NOT EXISTS Shop_Role_Permission_Link_Audit (
	id_audit INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_link INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Role_Permission_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Role_Permission_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(10),
    value_new VARCHAR(10),
    id_change_set INTEGER NOT NULL,
    CONSTRAINT FK_Shop_Role_Permission_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);