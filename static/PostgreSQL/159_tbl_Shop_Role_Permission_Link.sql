
-- Role Permission link



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Role_Permission_Link';

CREATE TABLE IF NOT EXISTS Shop_Role_Permission_Link (
    id_link INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_role INTEGER,
    CONSTRAINT FK_Shop_Role_Permission_Link_id_role
		FOREIGN KEY (id_role)
        REFERENCES Shop_Role(id_role)
        ON UPDATE RESTRICT,
    id_permission INTEGER,
    CONSTRAINT FK_Shop_Role_Permission_Link_id_permission
		FOREIGN KEY (id_permission)
        REFERENCES Shop_Permission(id_permission)
        ON UPDATE RESTRICT,
    id_access_level INTEGER,
    CONSTRAINT FK_Shop_Role_Permission_Link_id_access_level
		FOREIGN KEY (id_access_level)
        REFERENCES Shop_Access_Level(id_access_level),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INTEGER,
    CONSTRAINT FK_Shop_Role_Permission_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);