
-- Clear previous proc
DROP PROCEDURE IF EXISTS p_clear_split_temp;


DELIMITER //
CREATE PROCEDURE p_clear_split_temp (
)
BEGIN
	START TRANSACTION; 
	
	DROP TABLE Split_Temp;
	
	COMMIT;
END //
DELIMITER ;;

/*

CALL p_clear_shop_user_eval_temp (
	'noods, cheese ' # a_guid
);

SELECT *
FROM Shop_User_Eval_Temp;

*/
