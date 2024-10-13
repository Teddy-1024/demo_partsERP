
# Address Audits

SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_User_Address_Audit';

CREATE TABLE IF NOT EXISTS Shop_User_Address_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user_address INT NOT NULL,
    CONSTRAINT FK_Shop_User_Address_Audit_id_address
		FOREIGN KEY (id_user_address)
        REFERENCES Shop_User_Address(id_user_address)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_User_Address_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);