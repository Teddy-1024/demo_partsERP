/* Store */


# Drop dependencies
# DROP PROCEDURE IF EXISTS p_shop_user_eval;
DROP TABLE IF EXISTS User_Eval_Temp;

# Delete old tables
DROP TABLE IF EXISTS Shop_Address_Audit;
DROP TABLE IF EXISTS Shop_Address;

DROP TABLE IF EXISTS Shop_User_Role_Link_Audit;
DROP TABLE IF EXISTS Shop_User_Role_Link;

DROP TABLE IF EXISTS Shop_User_Audit;
DROP TABLE IF EXISTS Shop_User;

DROP TABLE IF EXISTS Shop_Role_Permission_Link_Audit;
DROP TABLE IF EXISTS Shop_Role_Permission_Link;

DROP TABLE IF EXISTS Shop_Role_Audit;
DROP TABLE IF EXISTS Shop_Role;

DROP TABLE IF EXISTS Shop_Permission_Audit;
DROP TABLE IF EXISTS Shop_Permission;

DROP TABLE IF EXISTS Shop_Permission_Group_Audit;
DROP TABLE IF EXISTS Shop_Permission_Group;

DROP TABLE IF EXISTS Shop_Access_Level_Audit;
DROP TABLE IF EXISTS Shop_Access_Level;

DROP TABLE IF EXISTS Shop_User_Change_Set;



# User Change Sets
CREATE TABLE Shop_User_Change_Set (
	id_change_set INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    comment VARCHAR(500),
    updated_last_on TIMESTAMP,
    updated_last_by VARCHAR(100)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_User_Change_Set
BEFORE INSERT ON Shop_User_Change_Set
FOR EACH ROW
BEGIN
	IF NEW.updated_last_on <=> NULL THEN
		SET NEW.updated_last_on = NOW();
	END IF;
	IF NEW.updated_last_by <=> NULL THEN
		SET NEW.updated_last_by = CURRENT_USER();
	END IF;
END //
DELIMITER ;;

SELECT * FROM Shop_User_Change_Set;



# Access Levels
CREATE TABLE Shop_Access_Level (
    id_access_level INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50),
    name VARCHAR(255),
    priority INT NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Access_Level_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_User_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Access_Level
BEFORE INSERT ON Shop_Access_Level
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END //
DELIMITER ;;

CREATE TABLE Shop_Access_Level_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_access_level INT NOT NULL,
    CONSTRAINT FK_Shop_Access_Level_Audit_id_access_level
		FOREIGN KEY (id_access_level)
        REFERENCES Shop_Access_Level(id_access_level)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Access_Level_Audit_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_User_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Access_Level
BEFORE UPDATE ON Shop_Access_Level
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Access_Level_Audit (
		id_access_level,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_access_level, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT (OLD.code <=> NEW.code)
    UNION
    # Changed name
	SELECT NEW.id_access_level, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT (OLD.name <=> NEW.name)
    UNION
    # Changed priority
	SELECT NEW.id_access_level, 'priority', CONVERT(OLD.priority, CHAR), CONVERT(NEW.priority, CHAR), NEW.id_change_set
		WHERE NOT (OLD.priority <=> NEW.priority)
	UNION
	# Changed active
	SELECT NEW.id_access_level, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	;
END //
DELIMITER ;;

INSERT INTO Shop_Access_Level (
	display_order, code, name, priority
)
VALUES 
	(1, 'VIEW', 'View', 3),
	(2, 'EDIT', 'Edit', 2),
	(3, 'ADMIN', 'Admin', 1)
;

SELECT * FROM Shop_Access_Level;
SELECT * FROM Shop_Access_Level_Audit;



# Permission Groups
CREATE TABLE Shop_Permission_Group (
    id_group INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50),
    name VARCHAR(255),
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Permission_Group_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Permission_Group
BEFORE INSERT ON Shop_Permission_Group
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END //
DELIMITER ;;

CREATE TABLE Shop_Permission_Group_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_group INT NOT NULL,
    CONSTRAINT FK_Shop_Permission_Group_Audit_id_group
		FOREIGN KEY (id_group)
        REFERENCES Shop_Permission_Group(id_group)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Permission_Group_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Permission_Group
BEFORE UPDATE ON Shop_Permission_Group
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Permission_Group_Audit (
		id_group,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_group, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
    # Changed name
	SELECT NEW.id_group, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	# Changed active
	SELECT NEW.id_group, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;;

INSERT INTO Shop_Permission_Group (
	display_order, code, name
)
VALUES 
	(1, 'STORE', 'Store Home')
;

SELECT * FROM Shop_Permission_Group;
SELECT * FROM Shop_Permission_Group_Audit;



# Permissions
CREATE TABLE Shop_Permission (
    id_permission INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50),
    name VARCHAR(255),
    id_permission_group INT NOT NULL,
    CONSTRAINT FK_Shop_Permission_id_permission_group
		FOREIGN KEY (id_permission_group)
        REFERENCES Shop_Permission_Group(id_group)
        ON UPDATE RESTRICT,
    required_access_level INT NOT NULL,
    CONSTRAINT FK_Shop_Permission_id_access_level
		FOREIGN KEY (required_access_level)
        REFERENCES Shop_Access_Level(id_access_level),
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INT,
	CONSTRAINT FK_Shop_Permission_id_change_set
		FOREIGN KEY (id_change_set) 
		REFERENCES Shop_User_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Permission
BEFORE INSERT ON Shop_Permission
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END //
DELIMITER ;;

CREATE TABLE Shop_Permission_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_permission INT NOT NULL,
    CONSTRAINT FK_Shop_Permission_Audit_id_permission
		FOREIGN KEY (id_permission)
        REFERENCES Shop_Permission(id_permission)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Permission_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Permission
BEFORE UPDATE ON Shop_Permission
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Permission_Audit (
		id_permission,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_permission, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
    # Changed name
	SELECT NEW.id_permission, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	# Changed id_permission_group
	SELECT NEW.id_permission, 'id_permission_group', CONVERT(OLD.id_permission_group, CHAR), CONVERT(NEW.id_permission_group, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_permission_group <=> NEW.id_permission_group
	UNION
	# Changed required_access_level
	SELECT NEW.id_permission, 'required_access_level', CONVERT(OLD.required_access_level, CHAR), CONVERT(NEW.required_access_level, CHAR), NEW.id_change_set
		WHERE NOT OLD.required_access_level <=> NEW.required_access_level
	UNION
	# Changed active
	SELECT NEW.id_permission, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;;

INSERT INTO Shop_Permission (
	display_order, code, name, id_permission_group, required_access_level
)
VALUES 
	(1, 'STORE_PRODUCT', 'Store Product Page', 1, 1),
	(2, 'STORE_SERVICES', 'Store Services Page', 1, 1),
	(3, 'CONTACT_US', 'Contact Us Page', 1, 1)
;

SELECT * FROM Shop_Permission;
SELECT * FROM Shop_Permission_Audit;



# Roles
CREATE TABLE Shop_Role (
    id_role INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50),
    name VARCHAR(255),
    active BIT NOT NULL DEFAULT 1,
    display_order INT NOT NULL,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Role_id_change_set
		FOREIGN KEY (id_change_set) 
        REFERENCES Shop_User_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Role
BEFORE INSERT ON Shop_Role
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END //
DELIMITER ;;

CREATE TABLE Shop_Role_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_role INT NOT NULL,
    CONSTRAINT FK_Shop_Role_Audit_id_role
		FOREIGN KEY (id_role)
        REFERENCES Shop_Role(id_role)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Role_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Role
BEFORE UPDATE ON Shop_Role
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Role_Audit (
		id_role,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed code
	SELECT NEW.id_role, 'code', OLD.code, NEW.code, NEW.id_change_set
		WHERE NOT OLD.code <=> NEW.code
	UNION
	# Changed name
	SELECT NEW.id_role, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT OLD.name <=> NEW.name
	UNION
	# Changed active
	SELECT NEW.id_role, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;;

INSERT INTO Shop_Role (
    display_order,
    code,
    name
)
VALUES 
	(1, 'DIRECTOR', 'Director'),
    (2, 'USER', 'User')
;

SELECT * FROM Shop_Role;
SELECT * FROM Shop_Role_Audit;



# Role Permission link
CREATE TABLE Shop_Role_Permission_Link (
    id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_role INT,
    CONSTRAINT FK_Shop_Role_Permission_Link_id_role
		FOREIGN KEY (id_role)
        REFERENCES Shop_Role(id_role)
        ON UPDATE RESTRICT,
    id_permission INT,
    CONSTRAINT FK_Shop_Role_Permission_Link_id_permission
		FOREIGN KEY (id_permission)
        REFERENCES Shop_Permission(id_permission)
        ON UPDATE RESTRICT,
    id_access_level INT,
    CONSTRAINT FK_Shop_Role_Permission_Link_id_access_level
		FOREIGN KEY (id_access_level)
        REFERENCES Shop_Access_Level(id_access_level)
        ON UPDATE RESTRICT,
    active BIT NOT NULL DEFAULT 1,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Role_Permission_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Role_Permission_Link
BEFORE INSERT ON Shop_Role_Permission_Link
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END //
DELIMITER ;;

CREATE TABLE Shop_Role_Permission_Link_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_link INT NOT NULL,
    CONSTRAINT FK_Shop_Role_Permission_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_Role_Permission_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Role_Permission_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Role_Permission_Link
BEFORE UPDATE ON Shop_Role_Permission_Link
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Role_Permission_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed id_role
	SELECT NEW.id_link, 'id_role', CONVERT(OLD.id_role, CHAR), CONVERT(NEW.id_role, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_role <=> NEW.id_role
	UNION
	# Changed id_permission
	SELECT NEW.id_link, 'id_permission', CONVERT(OLD.id_permission, CHAR), CONVERT(NEW.id_permission, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_permission <=> NEW.id_permission
    UNION
    # Changed id_access_level
	SELECT NEW.id_link, 'id_access_level', CONVERT(OLD.id_access_level, CHAR), CONVERT(NEW.id_access_level, CHAR), NEW.id_change_set
		WHERE NOT OLD.id_access_level <=> NEW.id_access_level
	UNION
	# Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;;

INSERT INTO Shop_Role_Permission_Link (
    id_role, id_permission, id_access_level
)
VALUES 
	(1, 1, 3),
	(1, 2, 3),
	(1, 3, 3),
	(2, 1, 1),
	(2, 2, 1),
	(2, 3, 1)
;

SELECT * FROM Shop_Role_Permission_Link;
SELECT * FROM Shop_Role_Permission_Link_Audit;



# Users
CREATE TABLE Shop_User (
    id_user INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    is_super_user BIT NOT NULL DEFAULT 0,
    active BIT NOT NULL DEFAULT 1,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_User_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_User
BEFORE INSERT ON Shop_User
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END //
DELIMITER ;;

CREATE TABLE Shop_User_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    CONSTRAINT FK_Shop_User_Audit_id_user
		FOREIGN KEY (id_user)
        REFERENCES Shop_User(id_user)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_User_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);

DELIMITER //
CREATE TRIGGER before_update_Shop_User
BEFORE UPDATE ON Shop_User
FOR EACH ROW
BEGIN
    INSERT INTO Shop_User_Audit (
		id_user,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed name
	SELECT NEW.id_user, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT (OLD.name <=> NEW.name)
	UNION
	# Changed is_super_user
	SELECT NEW.id_user, 'is_super_user', CONVERT(CONVERT(OLD.is_super_user, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_super_user, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.is_super_user <=> NEW.is_super_user)
	UNION
    # Changed active
	SELECT NEW.id_user, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;;

INSERT INTO Shop_User (
    name,
    is_super_user
)
VALUES (
	'Teddy',
    1
);

SELECT * FROM Shop_User;
SELECT * FROM Shop_User_Audit;



# User Role link
CREATE TABLE Shop_User_Role_Link (
    id_link INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT,
    CONSTRAINT FK_Shop_User_Role_Link_id_user
		FOREIGN KEY (id_user)
        REFERENCES Shop_User(id_user)
        ON UPDATE RESTRICT,
    id_role INT,
    CONSTRAINT FK_Shop_User_Role_Link_id_role
		FOREIGN KEY (id_role)
        REFERENCES Shop_Role(id_role)
        ON UPDATE RESTRICT,
    active BIT NOT NULL DEFAULT 1,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_User_Role_Link_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_User_Role_Link
BEFORE INSERT ON Shop_User_Role_Link
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END //
DELIMITER ;;

CREATE TABLE Shop_User_Role_Link_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_link INT NOT NULL,
    CONSTRAINT FK_Shop_User_Role_Link_Audit_id_link
		FOREIGN KEY (id_link)
        REFERENCES Shop_User_Role_Link(id_link)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_User_Role_Link_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);

DELIMITER //
CREATE TRIGGER before_update_Shop_User_Role_Link
BEFORE UPDATE ON Shop_User_Role_Link
FOR EACH ROW
BEGIN
    INSERT INTO Shop_User_Role_Link_Audit (
		id_link,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
	# Changed active
	SELECT NEW.id_link, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;;

INSERT INTO Shop_User_Role_Link (
    id_user, id_role
)
VALUES 
	(1, 1)
;

SELECT * FROM Shop_User_Role_Link;
SELECT * FROM Shop_User_Role_Link_Audit;



# Addresses
CREATE TABLE Shop_Address (
    id_address INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    CONSTRAINT FK_Shop_Address_id_user
		FOREIGN KEY (id_user)
        REFERENCES Shop_User(id_user)
        ON UPDATE RESTRICT,
    region VARCHAR(100) NOT NULL,
    name_full VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    postcode VARCHAR(20) NOT NULL,
    address_line_1 VARCHAR(100) NOT NULL,
    address_line_2 VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    county VARCHAR(100) NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    created_on TIMESTAMP,
    created_by INT,
    id_change_set INT,
    CONSTRAINT FK_Shop_Address_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
);

DELIMITER //
CREATE TRIGGER before_insert_Shop_Address
BEFORE INSERT ON Shop_Address
FOR EACH ROW
BEGIN
	IF NEW.created_on <=> NULL THEN
		SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	END IF;
    IF NEW.created_by <=> NULL THEN
		SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
	END IF;
END //
DELIMITER ;;

CREATE TABLE Shop_Address_Audit (
	id_audit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_address INT NOT NULL,
    CONSTRAINT FK_Shop_Address_Audit_id_address
		FOREIGN KEY (id_address)
        REFERENCES Shop_Address(id_address)
        ON UPDATE RESTRICT,
    name_field VARCHAR(50),
    value_prev VARCHAR(500),
    value_new VARCHAR(500),
    id_change_set INT NOT NULL,
    CONSTRAINT FK_Shop_Address_Audit_id_change_set
		FOREIGN KEY (id_change_set)
        REFERENCES Shop_User_Change_Set(id_change_set)
        ON UPDATE RESTRICT
);

DELIMITER //
CREATE TRIGGER before_update_Shop_Address
BEFORE UPDATE ON Shop_Address
FOR EACH ROW
BEGIN
    INSERT INTO Shop_Address_Audit (
		id_address,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed region
	SELECT NEW.id_address, 'region', OLD.region, NEW.region, NEW.id_change_set
		WHERE NOT OLD.region <=> NEW.region
    UNION
    # Changed name_full
	SELECT NEW.id_address, 'name_full', OLD.name_full, NEW.name_full, NEW.id_change_set
		WHERE NOT OLD.name_full <=> NEW.name_full
	UNION
    # Changed phone_number
	SELECT NEW.id_address, 'phone_number', OLD.phone_number, NEW.phone_number, NEW.id_change_set
		WHERE NOT OLD.phone_number <=> NEW.phone_number
    UNION
    # Changed postcode
	SELECT NEW.id_address, 'postcode', OLD.postcode, NEW.postcode, NEW.id_change_set
		WHERE NOT OLD.postcode <=> NEW.postcode
    UNION
    # Changed address_line_1
	SELECT NEW.id_address, 'address_line_1', OLD.address_line_1, NEW.address_line_1, NEW.id_change_set
		WHERE NOT OLD.address_line_1 <=> NEW.address_line_1
	UNION
    # Changed address_line_2
	SELECT NEW.id_address, 'address_line_2', OLD.address_line_2, NEW.address_line_2, NEW.id_change_set
		WHERE NOT OLD.address_line_2 <=> NEW.address_line_2
	UNION
    # Changed city
	SELECT NEW.id_address, 'city', OLD.city, NEW.city, NEW.id_change_set
		WHERE NOT OLD.city <=> NEW.city
    UNION
    # Changed county
	SELECT NEW.id_address, 'county', OLD.county, NEW.county, NEW.id_change_set
		WHERE NOT OLD.county <=> NEW.county
	UNION
	# Changed active
	SELECT NEW.id_address, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;
END //
DELIMITER ;;

INSERT INTO Shop_Address (
    id_user, region, name_full, phone_number, postcode, address_line_1, address_line_2, city, county
)
SELECT U.id_user, 'United Kingdom', U.name, '07375 571430', 'NN6 6EB', 'The Laurels', 'Cold Ashby Road', 'Cold Ashby', 'Northamptonshire'
	FROM Shop_User U;

SELECT * FROM Shop_Address;
SELECT * FROM Shop_Address_Audit;


