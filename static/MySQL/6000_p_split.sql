
USE PARTSLTD_PROD;

/*

CALL p_split (
	'noods, chees',
	','
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_split;


DELIMITER //
CREATE PROCEDURE p_split (
	IN a_string VARCHAR(4000),
	IN a_separator VARCHAR(5)
    -- IN a_allow_empty BIT
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_string BIT;
    DECLARE v_has_separator BIT;
    DECLARE v_i_separator INT;
    DECLARE v_i_start INT;
    DECLARE v_i_end INT;
    DECLARE v_current_item VARCHAR(4000);
    
    
	-- Argument validation + default values
    SET a_string := IFNULL(a_string, '');
    SET a_separator := IFNULL(a_separator, '');
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS Split_Temp;
    
    CREATE TABLE Split_Temp (
        display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		substring VARCHAR(4000) NOT NULL
    );
    
    
    -- Parse filters
    SET v_has_string = CASE WHEN a_string = '' THEN 0 ELSE 1 END;
    SET v_has_separator = CASE WHEN a_separator = '' THEN 0 ELSE 1 END;
    
    IF v_has_string THEN

		SET v_i_start = 1;
		SET v_i_end = LOCATE(',', a_string);

		WHILE v_i_end > 0 DO
			SET v_current_item = SUBSTRING(a_string, v_i_start, v_i_end - v_i_start);
			INSERT INTO Split_Temp (substring) VALUES (v_current_item);

			SET v_i_start = v_i_end + 1;
			SET v_i_end = LOCATE(',', a_string, v_i_start);
		END WHILE;

		SET v_current_item = SUBSTRING(a_string, v_i_start);
		INSERT INTO Split_Temp (substring) VALUES (TRIM(v_current_item));
	END IF;

	/*
    -- Select the results from the temporary table
    SELECT * FROM Split_Temp;
    
    # Return arguments for test
    SELECT
	a_string,
    a_separator
    -- a_allow_empty
    ;
    */
    
END //
DELIMITER ;

/*

CALL p_split (
	'noods, cheese ', # a_string
	',' # a_separator
	# '0', # a_allow_empty
);

SELECT *
FROM SPLIT_TEMP;

*/
