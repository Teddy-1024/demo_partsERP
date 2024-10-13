

DROP PROCEDURE IF EXISTS p_split;

DELIMITER //
CREATE PROCEDURE p_split (
	IN a_guid BINARY(36)
	, IN a_string LONGTEXT
	, IN a_separator VARCHAR(1000)
    -- IN a_allow_empty BIT
    , IN a_debug BIT
)
BEGIN
    DECLARE v_has_string BIT;
    DECLARE v_has_separator BIT;
    DECLARE v_i_separator INT;
    DECLARE v_i_start INT;
    DECLARE v_i_end INT;
    DECLARE v_current_item VARCHAR(4000);
    DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET a_string := IFNULL(a_string, '');
    SET a_separator := IFNULL(a_separator, '');
    SET a_debug := IFNULL(a_debug, 0);
    
    IF a_debug = 1 THEN
		SELECT
			a_guid
            , a_string
            , a_separator
            , a_debug
		;
    END IF;
    
    CALL p_validate_guid ( a_guid );
    
    DROP TABLE IF EXISTS tmp_Split_Split;
    
    CREATE TEMPORARY TABLE tmp_Split_Split (
        display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		substring VARCHAR(4000) NOT NULL
    );
    
    SET v_has_string = CASE WHEN a_string = '' THEN 0 ELSE 1 END;
    SET v_has_separator = CASE WHEN a_separator = '' THEN 0 ELSE 1 END;
    
    IF v_has_string THEN

		SET v_i_start = 1;
		SET v_i_end = LOCATE(',', a_string);

		WHILE v_i_end > 0 DO
			SET v_current_item = SUBSTRING(a_string, v_i_start, v_i_end - v_i_start);
			INSERT INTO tmp_Split_Split (substring) VALUES (v_current_item);

			SET v_i_start = v_i_end + 1;
			SET v_i_end = LOCATE(',', a_string, v_i_start);
		END WHILE;

		SET v_current_item = SUBSTRING(a_string, v_i_start);
		INSERT INTO tmp_Split_Split (substring) VALUES (TRIM(v_current_item));
	END IF;

	IF EXISTS (SELECT * FROM tmp_Split_Split LIMIT 1) THEN
		START TRANSACTION;
			INSERT INTO Split_Temp (
				guid
				, display_order
                , substring
			)
            SELECT
				a_guid
				, display_order
                , substring
			FROM tmp_Split_Split
            ;
		COMMIT;
    END IF;
    
    DROP TABLE IF EXISTS tmp_Split_Split;
    
    IF a_debug = 1 THEN
		CALL p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;;


/*
CALL p_split (
	'nips'
	, 'noods, cheese ' # a_string
	, ',' # a_separator
	# '0', # a_allow_empty
    , 1
);

SELECT *
FROM Split_Temp
WHERE GUID = 'nips';

CALL p_clear_split_temp( 'nips' );
*/
