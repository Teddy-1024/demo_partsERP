
-- Clear previous proc
DROP PROCEDURE IF EXISTS p_clear_shop_user_eval_temp;


DELIMITER //
CREATE PROCEDURE p_clear_shop_user_eval_temp (
	IN a_guid BINARY(36)
)
BEGIN
    IF ISNULL(a_guid) THEN
		
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'GUID is required.';
        
	ELSE
    
		START TRANSACTION; -- trans_clear
        
		DELETE FROM Shop_User_Eval_Temp
        WHERE GUID = a_guid
        ;
        
        COMMIT;
	END IF;
    
END //
DELIMITER ;

/*

CALL p_clear_shop_user_eval_temp (
	'noods, cheese ' # a_guid
);

SELECT *
FROM Shop_User_Eval_Temp;

*/
