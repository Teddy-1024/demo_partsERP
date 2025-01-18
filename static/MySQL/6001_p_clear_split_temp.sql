
-- Clear previous proc
DROP PROCEDURE IF EXISTS p_clear_split_temp;


DELIMITER //
CREATE PROCEDURE p_clear_split_temp (
	IN a_guid BINARY(36)
)
BEGIN
	CALL p_validate_guid( a_guid );

	START TRANSACTION; 
	
	-- DROP TABLE IF EXISTS 
    DELETE FROM Split_Temp
    WHERE GUID = a_guid
    ;
	
	COMMIT;
END //
DELIMITER ;

/*

CALL p_clear_split_temp ( 'nips' );


*/
