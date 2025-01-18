

DROP PROCEDURE IF EXISTS p_split_key_value_pair_csv;

DELIMITER //
CREATE PROCEDURE p_split_key_value_pair_csv (
	IN a_guid BINARY(36)
	, IN a_string LONGTEXT
    , IN a_debug BIT
)
BEGIN
    DECLARE v_has_string BIT;
    DECLARE v_current_item VARCHAR(4000);
    DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET a_string := IFNULL(a_string, '');
    SET a_debug := IFNULL(a_debug, 0);
    
    SET v_has_string = CASE WHEN a_string = '' THEN 0 ELSE 1 END;
    
    IF a_debug = 1 THEN
		SELECT
			a_guid
            , a_string
            , a_debug
		;
    END IF;
    
    CALL p_validate_guid ( a_guid );
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Split_Input;
    DROP TEMPORARY TABLE IF EXISTS tmp_Split_Split;

    CREATE TEMPORARY TABLE tmp_Split_Input (
        input_string TEXT
    );

    CREATE TEMPORARY TABLE tmp_Split_Split (
        id INT AUTO_INCREMENT PRIMARY KEY
        , key_column VARCHAR(4000)
        , value_column VARCHAR(4000)
    );

    INSERT INTO tmp_Split_Input (
        input_string
    ) 
    VALUES (
        a_string
    );

    INSERT INTO tmp_Split_Split (key_column, value_column)
    SELECT 
        SUBSTRING_INDEX(SUBSTRING_INDEX(t.pair, ':', 1), ',', -1) AS key_column,
        SUBSTRING_INDEX(t.pair, ':', -1) AS value_column
    FROM (
        SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(input_string, ',', n), ',', -1) pair
        FROM temp_input
        CROSS JOIN (
            SELECT a.N + b.N * 10 + 1 n
            FROM (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
            CROSS JOIN (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
            ORDER BY n
        ) numbers
        WHERE n <= 1 + (LENGTH(input_string) - LENGTH(REPLACE(input_string, ',', '')))
    ) t;

	IF EXISTS (SELECT * FROM tmp_Split_Split LIMIT 1) THEN
		START TRANSACTION;
			INSERT INTO Split_Key_Value_Pair_Csv_Temp (
				guid
				, id
                , key_column
                , value_column
			)
            SELECT
				a_guid
				, id
                , key_column
                , value_column
			FROM tmp_Split_Split
            ;
		COMMIT;
    END IF;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Split_Input;
    DROP TEMPORARY TABLE IF EXISTS tmp_Split_Split;
    
    IF a_debug = 1 THEN
		CALL p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;


/*
CALL p_split_key_value_pair_csv (
	'nipsnipsnipsnipsnipsnipsnipsnipsnips'
	, '1:100,2:200,3:300,4:400' # a_string
    , 1
);

SELECT *
FROM Split_key_value_pair_csv_Temp
WHERE GUID = 'nipsnipsnipsnipsnipsnipsnipsnipsnips';

CALL p_clear_split_key_value_pair_csv_temp( 'nipsnipsnipsnipsnipsnipsnipsnipsnips' );
*/
