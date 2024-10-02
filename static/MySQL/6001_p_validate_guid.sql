

DROP PROCEDURE IF EXISTS p_validate_guid;
DROP PROCEDURE IF EXISTS p_validate_guid_test;

DELIMITER //
CREATE PROCEDURE p_validate_guid (
	IN a_guid BINARY(36)
    -- , IN a_debug BIT
)
BEGIN
	/*
    DECLARE v_code_type_error_bad_data VARCHAR(200);
    DECLARE v_id_type_error_bad_data INT;
    
    IF ISNULL(a_guid) THEN
		SET v_code_type_error_bad_data := (SELECT code FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA');
		SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data);
		
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, 'GUID is required.'
		;
    END IF;
    */
    IF ISNULL(a_guid) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'GUID is required.'
        ;
	END IF;
END //
DELIMITER ;;


DELIMITER //
CREATE PROCEDURE p_validate_guid_test ()
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		id_type INT
        , code VARCHAR(200)
        , msg TEXT
	);
	
    CALL p_validate_guid ( 'nips' );
	CALL p_validate_guid ( NULL );
    
    SELECT * FROM tmp_Msg_Error;
    
    DROP TABLE tmp_Msg_Error;
END //
DELIMITER ;;

CALL p_validate_guid_test();