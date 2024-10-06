
# Shop Permission Group



DROP TRIGGER IF EXISTS before_insert_Shop_Permission_Group;
DROP TRIGGER IF EXISTS before_update_Shop_Permission_Group;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Permission_Group
BEFORE INSERT ON Shop_Permission_Group
FOR EACH ROW
BEGIN
	SET NEW.created_on := IFNULL(NEW.created_on, NOW());
	SET NEW.created_by := IFNULL(NEW.created_by, IFNULL((SELECT id_user FROM Shop_User WHERE firstname = CURRENT_USER()), -1));
END //
DELIMITER ;;


DELIMITER //
CREATE TRIGGER before_update_Shop_Permission_Group
BEFORE UPDATE ON Shop_Permission_Group
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
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
    UNION
    # Changed display_order
	SELECT NEW.id_group, 'display_order', CONVERT(OLD.display_order, CHAR), CONVERT(NEW.display_order, CHAR), NEW.id_change_set
		WHERE NOT OLD.display_order <=> NEW.display_order
    ;
END //
DELIMITER ;;