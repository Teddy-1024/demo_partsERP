
# Product Change Set



DROP TRIGGER IF EXISTS before_insert_Shop_Sales_And_Purchasing_Change_Set;

DELIMITER //
CREATE TRIGGER before_insert_Shop_Sales_And_Purchasing_Change_Set
BEFORE INSERT ON Shop_Sales_And_Purchasing_Change_Set
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
