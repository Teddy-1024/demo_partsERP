
-- Clear previous proc
DROP PROCEDURE IF EXISTS p_clear_split_key_value_pair_csv_temp;


DELIMITER //
CREATE PROCEDURE p_clear_split_key_value_pair_csv_temp (
	IN a_guid BINARY(36)
)
BEGIN
	CALL p_validate_guid( a_guid );

	START TRANSACTION; 
	
        -- DROP TABLE IF EXISTS 
        DELETE FROM Split_Key_Value_Pair_Csv_Temp
        WHERE GUID = a_guid
        ;
	
	COMMIT;
END //
DELIMITER ;;

/*

CALL p_clear_split_key_value_pair_csv_temp ( 'nipsnipsnipsnipsnipsnipsnipsnipsnips' );


*/
