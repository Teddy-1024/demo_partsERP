/* Store */
USE PARTS;


# Delete old tables
DROP TABLE IF EXISTS Shop_Product_Delivery_Region_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Delivery_Region_Link;

DROP TABLE IF EXISTS Shop_Delivery_Region_Audit;
DROP TABLE IF EXISTS Shop_Delivery_Region;

DROP TABLE IF EXISTS Shop_Delivery_Option_Audit;
DROP TABLE IF EXISTS Shop_Delivery_Option;

DROP TABLE IF EXISTS Shop_Delivery_Option_Type_Audit;
DROP TABLE IF EXISTS Shop_Delivery_Option_Type;

DROP TABLE IF EXISTS Shop_Product_Image_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Image_Link;

DROP TABLE IF EXISTS Shop_Image_Audit;
DROP TABLE IF EXISTS Shop_Image;

DROP TABLE IF EXISTS Shop_Image_Type_Audit;
DROP TABLE IF EXISTS Shop_Image_Type;

DROP TABLE IF EXISTS Shop_Product_Variation_Link_Audit;
DROP TABLE IF EXISTS Shop_Product_Variation_Link;

DROP TABLE IF EXISTS Shop_Variation_Audit;
DROP TABLE IF EXISTS Shop_Variation;

DROP TABLE IF EXISTS Shop_Variation_Type_Audit;
DROP TABLE IF EXISTS Shop_Variation_Type;

DROP TABLE IF EXISTS Shop_Product_Audit;
DROP TABLE IF EXISTS Shop_Product;

DROP TABLE IF EXISTS Shop_Recurrence_Interval_Audit;
DROP TABLE IF EXISTS Shop_Recurrence_Interval;

DROP TABLE IF EXISTS Shop_Category_Audit;
DROP TABLE IF EXISTS Shop_Category;

DROP TABLE IF EXISTS Shop_General_Audit;
DROP TABLE IF EXISTS Shop_General;

DROP TABLE IF EXISTS File_Type_Audit;
DROP TABLE IF EXISTS File_Type;

DROP TABLE IF EXISTS Shop_Product_Change_Set;



# Product Change Sets
CREATE TABLE Shop_Product_Change_Set (
	id_change_set INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    comment VARCHAR(500),
    updated_last_on DATETIME,
    updated_last_by VARCHAR(100)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Change_Set
BEFORE INSERT ON Shop_Product_Change_Set
FOR EACH ROW
BEGIN
	IF NEW.updated_last_on <=> NULL THEN
		SET NEW.updated_last_on = NOW();
	END IF;
	IF NEW.updated_last_by <=> NULL THEN
		SET NEW.updated_last_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;

SELECT * FROM Shop_Product_Change_Set;



# File Types
CREATE TABLE File_Type (
	id_type INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50),
    name VARCHAR(100),
    extension VARCHAR(50),
    created_on DATETIME,
    created_by VARCHAR(100),
    updated_last_on DATETIME,
    updated_last_by VARCHAR(100)
);

DELIMITER //
CREATE TRIGGER before_insert_File_Type
BEFORE INSERT ON File_Type
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

CREATE TABLE File_Type_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_type INT NOT NULL,
    CONSTRAINT FK_File_Type_Audit_id_type
		FOREIGN KEY (id_type)
        REFERENCES File_Type(id_type)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    created_on DATETIME,
    created_by VARCHAR(100),
    updated_last_on DATETIME,
    updated_last_by VARCHAR(100)
);

DELIMITER //
CREATE TRIGGER before_insert_File_Type_Audit
BEFORE INSERT ON File_Type_Audit
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_update_File_Type_Audit
BEFORE UPDATE ON File_Type_Audit
FOR EACH ROW
BEGIN
    SET NEW.updated_last_on = NOW();
    SET NEW.updated_last_by = CURRENT_USER();
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_update_File_Type
BEFORE UPDATE ON File_Type
FOR EACH ROW
BEGIN
    INSERT INTO File_Type_Audit (
		id_type,
        name_field,
        value_prev,
        value_new
    )
    # Changed code
	SELECT NEW.id_type, 'code', OLD.code, NEW.code
		WHERE NOT OLD.code <=> NEW.code
	UNION
    # Changed name
	SELECT NEW.id_type, 'name', OLD.name, NEW.name
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed extension
	SELECT NEW.id_type, 'extension', CONVERT(OLD.extension, CHAR), CONVERT(NEW.extension, CHAR)
		WHERE NOT OLD.extension <=> NEW.extension
    ;
END //
DELIMITER ;

INSERT INTO File_Type (
	code, name, extension
)
VALUES 
	('JPEG', 'Joint Photographic Export Group', 'jpg'),
	('PNG', 'Portable Network Graphic', 'png'),
	('GIF', 'GIF', 'gif'),
	('MPEG-4', 'Multimedia Photographic Export Group 4', 'mp4')
;

SELECT * FROM File_Type;
SELECT * FROM File_Type_Audit;



# Generic / shared properties
CREATE TABLE Shop_General (
	id_general INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    quantity_max FLOAT,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_General_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_General
BEFORE INSERT ON Shop_General
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

CREATE TABLE Shop_General_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_general INT NOT NULL,
    CONSTRAINT FK_Shop_General_Audit_id_general
		FOREIGN KEY (id_general)
        REFERENCES Shop_General(id_general)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_General_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_update_Shop_General
BEFORE UPDATE ON Shop_General
FOR EACH ROW
BEGIN
    INSERT INTO Shop_General_Audit (
		id_general,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed quantity max
	SELECT NEW.id_general, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
	;
END //
DELIMITER ;

INSERT INTO Shop_General (
	quantity_max
)
VALUES (
	10
);

SELECT * FROM Shop_General;
SELECT * FROM Shop_General_Audit;



# Categories
CREATE TABLE Shop_Category (
    id_category INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50),
    name VARCHAR(255),
    description VARCHAR(4000),
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Category_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Category
BEFORE INSERT ON Shop_Category
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

CREATE TABLE Shop_Category_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_category INT NOT NULL,
    CONSTRAINT FK_Shop_Category_Audit_id_category
		FOREIGN KEY (id_category)
        REFERENCES Shop_Category(id_category)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Category_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Category
BEFORE UPDATE ON Shop_Category
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Category_Audit (
		id_category,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_category, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
    # Changed name
	SELECT NEW.id_category, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	# Changed description
	SELECT NEW.id_category, 'description', OLD.description, NEW.description, NEW.id_change_set
		WHERE NOT OLD.description <=> NEW.description
	UNION
	# Changed active
	SELECT NEW.id_category, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
    # Changed display_order
	SELECT NEW.id_category, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END //
DELIMITER ;

INSERT INTO Shop_Category (
	display_order,
    code,
	name,
    description
)
VALUES (
	1,
	'MISC',
	'Miscellaneous',
    'Not category allocated products'
);

SELECT * FROM Shop_Category;
SELECT * FROM Shop_Category_Audit;



# Recurrence Interval
CREATE TABLE Shop_Recurrence_Interval (
    id_interval INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50),
    name VARCHAR(255),
    name_plural VARCHAR(256),
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Recurrence_Interval_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Recurrence_Interval
BEFORE INSERT ON Shop_Recurrence_Interval
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

CREATE TABLE Shop_Recurrence_Interval_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_interval INT NOT NULL,
    CONSTRAINT FK_Shop_Recurrence_Interval_Audit_id_interval
		FOREIGN KEY (id_interval)
        REFERENCES Shop_Recurrence_Interval(id_interval)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(256),
    value_new VARCHAR(256),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Recurrence_Interval_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Recurrence_Interval
BEFORE UPDATE ON Shop_Recurrence_Interval
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Recurrence_Interval_Audit (
		id_interval,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_interval, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_interval, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed name_plural
	SELECT NEW.id_interval, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
	;
END //
DELIMITER ;

INSERT INTO Shop_Recurrence_Interval (
	code, name, name_plural
)
VALUES 
	('WEEK', 'Week', 'Weeks'),
	('MONTH', 'Month', 'Months'),
	('YEAR', 'Year', 'Years')
;

SELECT * FROM Shop_Recurrence_Interval;
SELECT * FROM Shop_Recurrence_Interval_Audit;



# Products
CREATE TABLE Shop_Product (
    id_product INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(4000),
    price_GBP FLOAT,
    id_category INT NOT NULL,
    CONSTRAINT FK_Shop_Product_id_category
		FOREIGN KEY (id_category)
        REFERENCES Shop_Category(id_category)
        ON UPDATE RESTRICT,
    latency_manuf INT NOT NULL DEFAULT 14,
    quantity_min FLOAT NOT NULL DEFAULT 1,
    quantity_max FLOAT NOT NULL DEFAULT 1, # @_quantity_max,
    quantity_step FLOAT NOT NULL DEFAULT 1,
    quantity_stock FLOAT NOT NULL DEFAULT 0,
    is_subscription BIT NOT NULL DEFAULT 0,
    id_recurrence_interval INT,
    CONSTRAINT FK_Shop_Product_id_recurrence_interval
		FOREIGN KEY (id_recurrence_interval)
        REFERENCES Shop_Recurrence_Interval(id_interval),
    count_recurrence_interval INT,
    id_stripe_product VARCHAR(100),
    id_stripe_price VARCHAR(100),
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Product_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Product
BEFORE INSERT ON Shop_Product
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

CREATE TABLE Shop_Product_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_product INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Audit_id_product
		FOREIGN KEY (id_product)
        REFERENCES Shop_Product(id_product)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Product
BEFORE UPDATE ON Shop_Product
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Product_Audit (
		id_product,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed name
	SELECT NEW.id_product, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed description
	SELECT NEW.id_product, 'description', OLD.description, NEW.description, NEW.id_change_set
		WHERE NOT OLD.description <=> NEW.description
    UNION
    # Changed price_GBP
	SELECT NEW.id_product, 'price_GBP', CONVERT(OLD.price_GBP, CHAR), CONVERT(NEW.price_GBP, CHAR), NEW.id_change_set
		WHERE NOT OLD.price_GBP <=> NEW.price_GBP
	UNION
    # Changed id_category
	SELECT NEW.id_product, 'id_category', CONVERT(OLD.id_category, CHAR), CONVERT(NEW.id_category, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_category <=> NEW.id_category
	UNION
    # Changed latency_manuf
	SELECT NEW.id_product, 'latency_manuf', CONVERT(OLD.latency_manuf, CHAR), CONVERT(NEW.latency_manuf, CHAR), NEW.id_change_set
		WHERE NOT OLD.latency_manuf <=> NEW.latency_manuf
	UNION
    # Changed quantity_min
	SELECT NEW.id_product, 'quantity_min', CONVERT(OLD.quantity_min, CHAR), CONVERT(NEW.quantity_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
	UNION
    # Changed quantity_max
	SELECT NEW.id_product, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
	UNION
    # Changed quantity_step
	SELECT NEW.id_product, 'quantity_step', CONVERT(OLD.quantity_step, CHAR), CONVERT(NEW.quantity_step, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_step <=> NEW.quantity_step
	UNION
    # Changed quantity_stock
	SELECT NEW.id_product, 'quantity_stock', CONVERT(OLD.quantity_stock, CHAR), CONVERT(NEW.quantity_stock, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_stock <=> NEW.quantity_stock
    UNION
    # Changed is_subscription
	SELECT NEW.id_product, 'is_subscription', CONVERT(CONVERT(OLD.is_subscription, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_subscription, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT OLD.is_subscription <=> NEW.is_subscription
	UNION
    # Changed id_recurrence_interval
	SELECT NEW.id_product, 'id_recurrence_interval', CONVERT(OLD.id_recurrence_interval, CHAR), CONVERT(NEW.id_recurrence_interval, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_recurrence_interval <=> NEW.id_recurrence_interval
    UNION
    # Changed count_recurrence_interval
	SELECT NEW.id_product, 'count_recurrence_interval', CONVERT(OLD.count_recurrence_interval, CHAR), CONVERT(NEW.count_recurrence_interval, CHAR), NEW.id_change_set
		WHERE NOT OLD.count_recurrence_interval <=> NEW.count_recurrence_interval
	UNION
    # Changed id_stripe_product
	SELECT NEW.id_product, 'id_stripe_product', OLD.id_stripe_product, NEW.id_stripe_product, NEW.id_change_set
		WHERE NOT OLD.id_stripe_product <=> NEW.id_stripe_product
    UNION
    # Changed id_stripe_price
	SELECT NEW.id_product, 'id_stripe_price', OLD.id_stripe_price, NEW.id_stripe_price, NEW.id_change_set
		WHERE NOT OLD.id_stripe_price <=> NEW.id_stripe_price
	UNION
	# Changed active
	SELECT NEW.id_product, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_product, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END //
DELIMITER ;

INSERT INTO Shop_Product (
    display_order,
    name,
    description,
    price_GBP,
    id_category,
    latency_manuf,
    quantity_stock,
    id_stripe_product,
    id_stripe_price
)
VALUES (
	1,
	'Braille Keyboard Translator',
    'Translate text into 3D Braille keyboard.',
    25,
    1,
    14,
    99,
    'prod_PB0NUOSEs06ymG',
    'price_1OMeN9L7BuLKjoMpyMY6Aae4'
);

SELECT * FROM Shop_Product;
SELECT * FROM Shop_Product_Audit;



# Variation Types
CREATE TABLE Shop_Variation_Type (
    id_type INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50),
    name VARCHAR(255),
    name_plural VARCHAR(256),
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Variation_Type_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Variation_Type
BEFORE INSERT ON Shop_Variation_Type
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

CREATE TABLE Shop_Variation_Type_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_type INT NOT NULL,
    CONSTRAINT FK_Shop_Variation_Type_Audit_id_type
		FOREIGN KEY (id_type)
        REFERENCES Shop_Variation_Type(id_type)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Variation_Type_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Variation_Type
BEFORE UPDATE ON Shop_Variation_Type
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Variation_Type_Audit (
		id_type,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_type, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_type, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed name_plural
	SELECT NEW.id_type, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
	UNION
	# Changed active
	SELECT NEW.id_type, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_type, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
	;
END //
DELIMITER ;

INSERT INTO Shop_Variation_Type (
    display_order, code, name, name_plural
)
VALUES 
	(1, 'COLOUR', 'Colour', 'Colours')
;

SELECT * FROM Shop_Variation_Type;
SELECT * FROM Shop_Variation_Type_Audit;



# Variations
CREATE TABLE Shop_Variation (
    id_variation INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_type INT NOT NULL,
    CONSTRAINT FK_Shop_Variation_id_type
		FOREIGN KEY (id_type) 
        REFERENCES Shop_Variation_Type(id_type)
        ON UPDATE RESTRICT,
    code VARCHAR(50),
    name VARCHAR(255),
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Variation_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Variation
BEFORE INSERT ON Shop_Variation
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

CREATE TABLE Shop_Variation_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_variation INT NOT NULL,
    CONSTRAINT FK_Shop_Variation_Audit_id_variation
		FOREIGN KEY (id_variation)
        REFERENCES Shop_Variation(id_variation)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Variation_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Variation
BEFORE UPDATE ON Shop_Variation
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Variation_Audit (
		id_variation,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_variation, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_variation, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	# Changed active
	SELECT NEW.id_variation, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_variation, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;
END //
DELIMITER ;

INSERT INTO Shop_Variation (
    display_order, id_type, code, name
)
VALUES 
	(1, 1, 'RED', 'Red')
;

SELECT * FROM Shop_Variation_Type;
SELECT * FROM Shop_Variation_Type_Audit;



# Product Variation Link
CREATE TABLE Shop_Product_Variation_Link (
    id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_product INT,
    CONSTRAINT FK_Shop_Product_Variation_Link_id_product
		FOREIGN KEY (id_product)
        REFERENCES Shop_Product(id_product)
        ON UPDATE RESTRICT,
    id_variation INT,
    CONSTRAINT FK_Shop_Product_Variation_Link_id_variation
		FOREIGN KEY (id_variation)
        REFERENCES Shop_Variation(id_variation)
        ON UPDATE RESTRICT,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Product_Variation_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Variation_Link
BEFORE INSERT ON Shop_Product_Variation_Link
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;

CREATE TABLE Shop_Product_Variation_Link_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_link INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Variation_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Product_Variation_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Variation_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Product_Variation_Link
BEFORE UPDATE ON Shop_Product_Variation_Link
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Product_Variation_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed id_product
	SELECT NEW.id_link, 'id_product', OLD.id_product, NEW.id_product, NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
	UNION
    # Changed id_variation
	SELECT NEW.id_link, 'id_variation', OLD.id_variation, NEW.id_variation, NEW.id_change_set
		WHERE NOT OLD.id_variation <=> NEW.id_variation
	UNION
	# Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_link, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;
END //
DELIMITER ;

INSERT INTO Shop_Product_Variation_Link (
    display_order, id_product, id_variation
)
VALUES 
	(1, 1, 1)
;

SELECT * FROM Shop_Product_Variation_Link;
SELECT * FROM Shop_Product_Variation_Link_Audit;



# Image Types
CREATE TABLE Shop_Image_Type (
    id_type INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50),
    name VARCHAR(255),
    name_plural VARCHAR(256),
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Image_Type_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Image_Type
BEFORE INSERT ON Shop_Image_Type
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

CREATE TABLE Shop_Image_Type_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_type INT NOT NULL,
    CONSTRAINT FK_Shop_Image_Type_Audit_id_type
		FOREIGN KEY (id_type)
        REFERENCES Shop_Image_Type(id_type)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Image_Type_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Image_Type
BEFORE UPDATE ON Shop_Image_Type
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Image_Type_Audit (
		id_type,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_type, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_type, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed name_plural
	SELECT NEW.id_type, 'name_plural', OLD.name_plural, NEW.name_plural, NEW.id_change_set
		WHERE NOT OLD.name_plural <=> NEW.name_plural
	UNION
	# Changed active
	SELECT NEW.id_type, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_type, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
    ;
END //
DELIMITER ;

INSERT INTO Shop_Image_Type (
    display_order, code, name, name_plural
)
VALUES 
	(1, 'FULL', 'Full Quality Image', 'Full Quality Images'),
	(1, 'LOW', 'Low Quality Image', 'Low Quality Images'),
	(1, 'THUMBNAIL', 'Thumbnail Image', 'Thumbnail Images')
;

SELECT * FROM Shop_Image_Type;
SELECT * FROM Shop_Image_Type_Audit;



# Images
CREATE TABLE Shop_Image (
    id_image INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_type INT NOT NULL,
    CONSTRAINT FK_Shop_Image_id_type
		FOREIGN KEY (id_type) 
        REFERENCES Shop_Image_Type(id_type),
    id_product INT NOT NULL,
    CONSTRAINT FK_Shop_Image_id_product
		FOREIGN KEY (id_product) 
        REFERENCES Shop_Product(id_product),
    url VARCHAR(255),
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Image_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Image
BEFORE INSERT ON Shop_Image
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

CREATE TABLE Shop_Image_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_image INT NOT NULL,
    CONSTRAINT FK_Shop_Image_Audit_id_image
		FOREIGN KEY (id_image)
        REFERENCES Shop_Image(id_image),
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Image_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Image
BEFORE UPDATE ON Shop_Image
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Image_Audit (
		id_image,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed id_type
	SELECT NEW.id_image, 'id_type', CONVERT(OLD.id_type, CHAR), CONVERT(NEW.id_type, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_type <=> NEW.id_type
    UNION
    # Changed id_product
	SELECT NEW.id_image, 'id_product', CONVERT(OLD.id_product, CHAR), CONVERT(NEW.id_product, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
    UNION
    # Changed url
	SELECT NEW.id_image, 'url', OLD.url, NEW.url, NEW.id_change_set
		WHERE NOT OLD.url <=> NEW.url
	UNION
	# Changed active
	SELECT NEW.id_image, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
	# Changed display_order
	SELECT NEW.id_image, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT (OLD.display_order <=> NEW.display_order)
	;
END //
DELIMITER ;

INSERT INTO Shop_Image (
    display_order, id_product, id_type, url
)
VALUES 
	(1, 1, 1, 'www.porn.co.uk')
;

SELECT * FROM Shop_Image;
SELECT * FROM Shop_Image_Audit;


/*
# Product Image Link
CREATE TABLE Shop_Product_Image_Link (
    id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_product INT,
    CONSTRAINT FK_Shop_Product_Image_Link_id_product
		FOREIGN KEY (id_product)
        REFERENCES Shop_Product(id_product)
        ON UPDATE RESTRICT,
    id_image INT,
    CONSTRAINT FK_Shop_Product_Image_Link_id_image
		FOREIGN KEY (id_image)
        REFERENCES Shop_Image(id_image)
        ON UPDATE RESTRICT,
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Product_Image_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Image_Link
BEFORE INSERT ON Shop_Product_Image_Link
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;

CREATE TABLE Shop_Product_Image_Link_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_link INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Image_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Product_Image_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Image_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Product_Image_Link
BEFORE UPDATE ON Shop_Product_Image_Link
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Product_Image_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    VALUES (
		( # Changed id_product
			SELECT NEW.id_link, 'id_product', OLD.id_product, NEW.id_product, NEW.id_change_set
			WHERE NOT OLD.id_product <=> NEW.id_product
        ),
		( # Changed id_variation
			SELECT NEW.id_link, 'id_image', OLD.id_image, NEW.id_image, NEW.id_change_set
			WHERE NOT OLD.id_image <=> NEW.id_image
        ),
		( # Changed active
			SELECT NEW.id_link, 'active', OLD.active, NEW.active, NEW.id_change_set
			WHERE NOT OLD.active <=> NEW.active
        )
    );
END //
DELIMITER ;

INSERT INTO Shop_Product_Image_Link (
    id_product, id_image
)
VALUES 
	(1, 1)
;

SELECT * FROM Shop_Product_Image_Link;
SELECT * FROM Shop_Product_Image_Link_Audit;
*/


# Delivery Option Types
CREATE TABLE Shop_Delivery_Option_Type (
	id_type INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    latency_delivery_min INT NOT NULL,
    latency_delivery_max INT NOT NULL,
    quantity_min INT NOT NULL,
    quantity_max INT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Delivery_Option_Type_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Delivery_Option_Type
BEFORE INSERT ON Shop_Delivery_Option_Type
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

CREATE TABLE Shop_Delivery_Option_Type_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_type INT NOT NULL,
    CONSTRAINT FK_Shop_Delivery_Option_Type_Audit_id_type
		FOREIGN KEY (id_type)
        REFERENCES Shop_Delivery_Option_Type(id_type)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Delivery_Option_Type_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Delivery_Option_Type
BEFORE UPDATE ON Shop_Delivery_Option_Type
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Delivery_Option_Type_Audit (
		id_type,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_type, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_type, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed latency_delivery_min
	SELECT NEW.id_type, 'latency_delivery_min', CONVERT(OLD.latency_delivery_min, CHAR), CONVERT(NEW.latency_delivery_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.latency_delivery_min <=> NEW.latency_delivery_min
    UNION
    # Changed latency_delivery_max
	SELECT NEW.id_type, 'latency_delivery_max', CONVERT(OLD.latency_delivery_max, CHAR), CONVERT(NEW.latency_delivery_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.latency_delivery_max <=> NEW.latency_delivery_max
    UNION
    # Changed quantity_min
	SELECT NEW.id_type, 'quantity_min', CONVERT(OLD.quantity_min, CHAR), CONVERT(NEW.quantity_min, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_min <=> NEW.quantity_min
    UNION
    # Changed quantity_max
	SELECT NEW.id_type, 'quantity_max', CONVERT(OLD.quantity_max, CHAR), CONVERT(NEW.quantity_max, CHAR), NEW.id_change_set
		WHERE NOT OLD.quantity_max <=> NEW.quantity_max
    UNION
    # Changed active
	SELECT NEW.id_type, 'active', CONVERT(OLD.active, CHAR), CONVERT(NEW.active, CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    UNION
    # Changed display_order
	SELECT NEW.id_type, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END //
DELIMITER ;

INSERT INTO Shop_Delivery_Option_Type (
	display_order, code, name, latency_delivery_min, latency_delivery_max, quantity_min, quantity_max
)
VALUES 
	(1, 'COLLECT', 'Collection', 0, 0, 0, 1),
    (2, 'SIGNED_1', 'First Class Signed-For', 2, 4, 0, 1)
;

SELECT * FROM Shop_Delivery_Option_Type;
SELECT * FROM Shop_Delivery_Option_Type_Audit;



# Delivery Option
CREATE TABLE Shop_Delivery_Option (
    id_option INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_product INT,
    CONSTRAINT FK_Shop_Delivery_Option_id_product
		FOREIGN KEY (id_product)
        REFERENCES Shop_Product(id_product)
        ON UPDATE RESTRICT,
    id_delivery_type INT,
    CONSTRAINT FK_Shop_Delivery_Option_id_delivery_type
		FOREIGN KEY (id_delivery_type)
        REFERENCES Shop_Delivery_Option_Type(id_type)
        ON UPDATE RESTRICT,
	price_GBP FLOAT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Delivery_Option_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Delivery_Option
BEFORE INSERT ON Shop_Delivery_Option
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;

CREATE TABLE Shop_Delivery_Option_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_option INT NOT NULL,
    CONSTRAINT FK_Shop_Delivery_Option_Audit_id_option
		FOREIGN KEY (id_option)
        REFERENCES Shop_Delivery_Option(id_option)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Delivery_Option_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Delivery_Option
BEFORE UPDATE ON Shop_Delivery_Option
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Delivery_Option_Audit (
		id_option,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed id_product
	SELECT NEW.id_option, 'id_product', CONVERT(OLD.id_product, CHAR), CONVERT(NEW.id_product, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
    UNION
    # Changed id_delivery_type
	SELECT NEW.id_option, 'id_delivery_type', CONVERT(OLD.id_delivery_type, CHAR), CONVERT(NEW.id_delivery_type, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_delivery_type <=> NEW.id_delivery_type
	UNION
    # Changed price_GBP
	SELECT NEW.id_option, 'price_GBP', CONVERT(OLD.price_GBP, CHAR), CONVERT(NEW.price_GBP, CHAR), NEW.id_change_set
		WHERE NOT OLD.price_GBP <=> NEW.price_GBP
	UNION
	# Changed active
	SELECT NEW.id_option, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	;
END //
DELIMITER ;

INSERT INTO Shop_Delivery_Option (
    id_product, id_delivery_type, price_GBP
)
VALUES 
	(1, 1, 5)
;

SELECT * FROM Shop_Delivery_Option;
SELECT * FROM Shop_Delivery_Option_Audit;



# Delivery Regions
CREATE TABLE Shop_Delivery_Region (
	id_region INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Delivery_Region_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Delivery_Region
BEFORE INSERT ON Shop_Delivery_Region
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;

CREATE TABLE Shop_Delivery_Region_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_region INT NOT NULL,
    CONSTRAINT FK_Shop_Delivery_Region_Audit_id_region
		FOREIGN KEY (id_region)
        REFERENCES Shop_Delivery_Region(id_region)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Delivery_Region_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Delivery_Region
BEFORE UPDATE ON Shop_Delivery_Region
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Delivery_Region_Audit (
		id_region,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_region, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
    UNION
    # Changed name
	SELECT NEW.id_region, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
    UNION
    # Changed active
	SELECT NEW.id_region, 'active', CONVERT(OLD.active, CHAR), CONVERT(NEW.active, CHAR), NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
    UNION
    # Changed display_order
	SELECT NEW.id_region, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END //
DELIMITER ;

INSERT INTO Shop_Delivery_Region (
	display_order, code, name
)
VALUES 
	(1, 'UK', 'United Kingdom')
;

SELECT * FROM Shop_Delivery_Region;
SELECT * FROM Shop_Delivery_Region_Audit;



# Product Delivery Option Link
CREATE TABLE Shop_Product_Delivery_Region_Link (
    id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_product INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Delivery_Region_Link_id_product
		FOREIGN KEY (id_product)
        REFERENCES Shop_Product(id_product)
        ON UPDATE RESTRICT,
    id_region INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Delivery_Region_Link_id_region
		FOREIGN KEY (id_region)
        REFERENCES Shop_Delivery_Region(id_region)
        ON UPDATE RESTRICT,
    active BIT NOT NULL DEFAULT 1,
    created_on DATETIME,
    created_by VARCHAR(100),
    id_change_set INT,
    CONSTRAINT FK_Shop_Product_Delivery_Region_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Product_Delivery_Region_Link
BEFORE INSERT ON Shop_Product_Delivery_Region_Link
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on = NOW();
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;

CREATE TABLE Shop_Product_Delivery_Region_Link_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_link INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Delivery_Region_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Product_Delivery_Region_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Product_Delivery_Region_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_Product_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Product_Delivery_Region_Link
BEFORE UPDATE ON Shop_Product_Delivery_Region_Link
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Product_Delivery_Region_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed id_product
	SELECT NEW.id_link, 'id_product', CONVERT(OLD.id_product, CHAR), CONVERT(NEW.id_product, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_product <=> NEW.id_product
    UNION
    # Changed id_region
	SELECT NEW.id_link, 'id_region', CONVERT(OLD.id_region, CHAR), CONVERT(NEW.id_region, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_region <=> NEW.id_region
	UNION
	# Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	;
END //
DELIMITER ;

INSERT INTO Shop_Product_Delivery_Region_Link (
    id_product, id_region
)
VALUES 
	(1, 1)
;

SELECT * FROM Shop_Product_Delivery_Region_Link;
SELECT * FROM Shop_Product_Delivery_Region_Link_Audit;
