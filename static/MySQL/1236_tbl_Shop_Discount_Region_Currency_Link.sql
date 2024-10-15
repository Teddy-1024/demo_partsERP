
# Discount Region Currency Link



SELECT CONCAT('WARNING: Table ', TABLE_NAME, ' already exists.') AS msg_warning FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shop_Discount_Region_Currency_Link';

CREATE TABLE IF NOT EXISTS Shop_Discount_Region_Currency_Link (
    id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_discount INT NOT NULL,
    CONSTRAINT FK_Shop_Discount_Region_Currency_Link_id_discount
		FOREIGN KEY (id_discount)
        REFERENCES Shop_Discount(id_discount)
        ON UPDATE RESTRICT,
    id_region INT NOT NULL,
    CONSTRAINT FK_Shop_Discount_Region_Currency_Link_id_region
		FOREIGN KEY (id_region)
        REFERENCES Shop_Region(id_region)
        ON UPDATE RESTRICT,
    id_currency INT NOT NULL,
    CONSTRAINT FK_Shop_Discount_Region_Currency_Link_id_currency
		FOREIGN KEY (id_currency)
        REFERENCES Shop_Currency(id_currency)
        ON UPDATE RESTRICT,
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Discount_Region_Currency_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);