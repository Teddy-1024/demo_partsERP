
-- Shop User

CREATE OR REPLACE FUNCTION before_insert_Shop_User()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.created_on IS NULL THEN
		NEW.created_on = CURRENT_TIMESTAMP;
	END IF;
    IF NEW.created_by IS NULL THEN
		NEW.created_by = CURRENT_USER;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_insert_Shop_User
BEFORE INSERT ON Shop_User
FOR EACH ROW
EXECUTE FUNCTION before_insert_Shop_User();


CREATE OR REPLACE FUNCTION before_update_Shop_User()
RETURNS TRIGGER AS $$
BEGIN
	IF OLD.id_change_set IS NOT DISTINCT FROM NEW.id_change_set THEN
		RAISE EXCEPTION 'New change Set ID must be provided.'
			USING ERRCODE = '45000';
    END IF;
    
    INSERT INTO Shop_User_Audit (
		id_user,
        name_field,
        value_prev,
        value_new,
        id_change_set
    )
    -- Changed id_user_oauth
	SELECT NEW.id_user, 'id_user_oauth', OLD.id_user_oauth, NEW.id_user_oauth, NEW.id_change_set
		WHERE NOT (OLD.id_user_oauth <=> NEW.id_user_oauth)
	UNION
    -- Changed name
	SELECT NEW.id_user, 'name', OLD.name, NEW.name, NEW.id_change_set
		WHERE NOT (OLD.name <=> NEW.name)
	UNION
    -- Changed email
	SELECT NEW.id_user, 'email', OLD.email, NEW.email, NEW.id_change_set
		WHERE NOT (OLD.email <=> NEW.email)
	UNION
    -- Changed is_email_verified
	SELECT NEW.id_user, 'is_email_verified', OLD.is_email_verified, NEW.is_email_verified, NEW.id_change_set
		WHERE NOT (OLD.is_email_verified <=> NEW.is_email_verified)
	UNION
	-- Changed is_super_user
	SELECT NEW.id_user, 'is_super_user', CONVERT(CONVERT(OLD.is_super_user, SIGNED), CHAR), CONVERT(CONVERT(NEW.is_super_user, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.is_super_user <=> NEW.is_super_user)
	UNION
    -- Changed active
	SELECT NEW.id_user, 'active', CONVERT(CONVERT(OLD.active, SIGNED), CHAR), CONVERT(CONVERT(NEW.active, SIGNED), CHAR), NEW.id_change_set
		WHERE NOT (OLD.active <=> NEW.active)
    ;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tri_before_update_Shop_User
BEFORE UPDATE ON Shop_User
FOR EACH ROW
EXECUTE FUNCTION before_update_Shop_User();
