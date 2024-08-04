
# Shop Recurrence Interval




DROP TRIGGER IF EXISTS before_insert_Shop_Recurrence_Interval;
DROP TRIGGER IF EXISTS before_update_Shop_Recurrence_Interval;


DELIMITER //
CREATE TRIGGER before_insert_Shop_Recurrence_Interval
BEFORE INSERT ON Shop_Recurrence_Interval
FOR EACH ROW
BEGIN
	SET NEW.created_on = NOW();
    SET NEW.created_by = CURRENT_USER();
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_update_Shop_Recurrence_Interval
BEFORE UPDATE ON Shop_Recurrence_Interval
FOR EACH ROW
BEGIN
	IF OLD.id_change_set <=> NEW.id_change_set THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New change Set ID must be provided.';
    END IF;
    
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
    UNION
    # Changed name
	SELECT NEW.id_interval, 'active', OLD.active, NEW.active, NEW.id_change_set
		WHERE NOT OLD.active <=> NEW.active
	;
END //
DELIMITER ;