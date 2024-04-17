
# File Type Audits

USE PARTS;

DROP TRIGGER IF EXISTS before_insert_File_Type_Audit;
DROP TRIGGER IF EXISTS before_update_File_Type_Audit;


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