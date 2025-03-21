
-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_clear_Shop_Calc_User_Temp;
DROP PROCEDURE IF EXISTS p_clear_Shop_Calc_User_Temp;
DROP PROCEDURE IF EXISTS p_shop_clear_calc_user;


DELIMITER //
CREATE PROCEDURE p_shop_clear_calc_user (
	IN a_guid BINARY(36)
    , IN a_debug BIT
)
BEGIN
	DECLARE v_time_start TIMESTAMP(6);
    SET v_time_start := CURRENT_TIMESTAMP(6);
    
    CALL p_validate_guid ( a_guid );
    
	START TRANSACTION;
		
		DELETE FROM Shop_Calc_User_Temp
		WHERE GUID = a_guid
		;
	
	COMMIT;
    
    IF a_debug = 1 THEN
		CALL demo.p_debug_timing_reporting( v_time_start );
    END IF;
END //
DELIMITER ;

/*

CALL p_shop_clear_calc_user (
	'noods, cheese ' # a_guid
    , 1 -- debug
);

SELECT *
FROM Shop_Calc_User_Temp
WHERE GUID = 'noods, cheese '
;

*/
