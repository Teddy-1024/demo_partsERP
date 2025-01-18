
# Shop User



DROP TRIGGER IF EXISTS before_insert_Shop_User;
DROP TRIGGER IF EXISTS before_update_Shop_User;


DELIMITER //
CREATE TRIGGER before_insert_Shop_User
BEFORE INSERT ON Shop_User
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_User
BEFORE UPDATE ON Shop_User
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
    INSERT INTO Shop_User_Audit (
		id_user,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    # Changed id_user_auth0
	SELECT NEW.id_user, 'id_user_auth0', OLD.id_user_auth0, NEW.id_user_auth0, NEW.id_change_set
		WHERE NOT (OLD.id_user_auth0 <=> NEW.id_user_auth0)
	UNION
    # Changed firstname
	SELECT NEW.id_user, 'firstname', OLD.firstname, NEW.firstname, NEW.id_change_set
		WHERE NOT (OLD.firstname <=> NEW.firstname)
	UNION
    # Changed surname
	SELECT NEW.id_user, 'surname', OLD.surname, NEW.surname, NEW.id_change_set
		WHERE NOT (OLD.surname <=> NEW.surname)
	UNION 
	# Changed email
	SELECT NEW.id_user, 'email', OLD.email, NEW.email, NEW.id_change_set
		WHERE NOT (OLD.email <=> NEW.email)
	UNION
	# Changed is_email_verified
	SELECT NEW.id_user, 'is_email_verified', CONVERT(CONVERT(OLD.is_email_verified, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_email_verified, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.is_email_verified <=> NEW.is_email_verified)
	UNION
	# Changed is_super_user
	SELECT NEW.id_user, 'is_super_user', CONVERT(CONVERT(OLD.is_super_user, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_super_user, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.is_super_user <=> NEW.is_super_user)
	UNION
    # Changed active
	SELECT NEW.id_user, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
	UNION
    # Changed id_currency_default
	SELECT NEW.id_user, 'id_currency_default', CONVERT(OLD.id_currency_default, CHAR), CONVERT(NEW.id_currency_default, CHAR), NEW.id_change_set
		WHERE NOT (OLD.id_currency_default <=> NEW.id_currency_default)
	UNION
    # Changed id_region_default
	SELECT NEW.id_user, 'id_region_default', CONVERT(OLD.id_region_default, CHAR), CONVERT(NEW.id_region_default, CHAR), NEW.id_change_set
		WHERE NOT (OLD.id_region_default <=> NEW.id_region_default)
	UNION
    # Changed is_included_VAT_default
	SELECT NEW.id_user, 'is_included_VAT_default', CONVERT(CONVERT(OLD.is_included_VAT_default, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_included_VAT_default, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.is_included_VAT_default <=> NEW.is_included_VAT_default)
    ;
END //
DELIMITER ;