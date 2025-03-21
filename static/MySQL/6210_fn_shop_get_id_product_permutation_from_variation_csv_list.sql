
DROP FUNCTION IF EXISTS fn_shop_get_id_product_permutation_from_variation_csv_list;

DELIMITER //

CREATE FUNCTION fn_shop_get_id_product_permutation_from_variation_csv_list (
	a_id_product INT
	, a_variation_csv TEXT
) 
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_id_permutation INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_id_variation_type INT;
    DECLARE v_id_variation INT;
    DECLARE v_id_permutation_tmp INT;
    DECLARE cur CURSOR FOR 
        SELECT 
            CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(t.pair, ':', 1), ',', -1) AS UNSIGNED) AS id_variation_type,
            CAST(SUBSTRING_INDEX(t.pair, ':', -1) AS UNSIGNED) AS id_variation
        FROM (
            SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(a_variation_csv, ',', n), ',', -1) pair
            FROM (
                SELECT a.N + b.N * 10 + 1 n
                FROM (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
                CROSS JOIN (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
                ORDER BY n
            ) numbers
            WHERE n <= 1 + (LENGTH(a_variation_csv) - LENGTH(REPLACE(a_variation_csv, ',', '')))
        ) t;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    SET v_id_permutation = NULL;

    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO v_id_variation_type, v_id_variation;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        IF v_id_permutation IS NULL THEN
            -- First iteration: find initial v_id_permutations
            SELECT PPVL.id_permutation INTO v_id_permutation
            FROM demo.Shop_Product_Permutation_Variation_Link PPVL
            INNER JOIN demo.Shop_Product_Permutation PP ON PPVL.id_permutation = PP.id_permutation
            INNER JOIN demo.Shop_Variation PV ON PPVL.id_variation = PV.id_variation
            WHERE 1=1
				AND PP.id_product = a_id_product
				AND PPVL.id_variation = v_id_variation
				AND PV.id_type = v_id_variation_type
			;
        ELSE
            -- Subsequent iterations: narrow down the v_id_permutation
            SELECT PPVL.id_permutation INTO v_id_permutation_tmp
            FROM demo.Shop_Product_Permutation_Variation_Link PPVL
            INNER JOIN demo.Shop_Product_Permutation PP ON PPVL.id_permutation = PP.id_permutation
            INNER JOIN demo.Shop_Variation PV ON PPVL.id_variation = PV.id_variation
            WHERE 1=1
				AND PP.id_product = a_id_product
				AND PPVL.v_id_permutation = v_id_permutation
				AND PPVL.id_variation = v_id_variation
				AND PV.id_type = v_id_variation_type
			;
            
            IF v_id_permutation_tmp IS NULL THEN
                -- If no match found, exit the loop
                SET v_id_permutation := NULL;
                LEAVE read_loop;
            ELSE
                SET v_id_permutation := v_id_permutation_tmp;
            END IF;
        END IF;
    END LOOP;

    CLOSE cur;

    RETURN v_id_permutation;
END //

DELIMITER ;

/*
SELECT fn_shop_get_id_product_permutation_from_variation_csv_list ( 1, '1:1' ) AS id_permutation;
SELECT fn_shop_get_id_product_permutation_from_variation_csv_list ( 3, '' ) AS id_permutation;
*/


/*
-- Update the table using the function
UPDATE product_permutation_input
SET v_id_permutation = find_v_id_permutation(variation_csv)
WHERE v_id_permutation IS NULL;
*/

/*
select * from demo.Shop_Variation

DROP PROCEDURE IF EXISTS p_shop_get_id_product_permutation_from_variation_csv_list;

DELIMITER //
CREATE PROCEDURE p_shop_get_id_product_permutation_from_variation_csv_list (
	IN a_guid BINARY(36)
    , IN a_debug BIT
)
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE v_id INT;
    DECLARE v_row_id INT;
    DECLARE v_variation_csv TEXT;
    DECLARE v_id_permutation INT;
    DECLARE v_time_start TIMESTAMP(6);

    -- Cursor to iterate through unprocessed rows
    DECLARE cur CURSOR FOR 
        SELECT id, session_guid, row_id, variation_csv 
        FROM product_permutation_input 
        WHERE v_id_permutation IS NULL;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET a_debug := IFNULL(a_debug, 0);
    
    IF a_debug = 1 THEN
		SELECT
			a_guid
            , a_debug
		;
    END IF;
    
    CALL p_validate_guid ( a_guid );

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO v_id, v_session_guid, v_row_id, v_variation_csv;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Find matching v_id_permutation
        SET v_id_permutation = NULL;

        SELECT ppvl.v_id_permutation INTO v_id_permutation
        FROM (
            SELECT 
                SUBSTRING_INDEX(SUBSTRING_INDEX(t.pair, ':', 1), ',', -1) AS id_variation_type,
                SUBSTRING_INDEX(t.pair, ':', -1) AS id_variation
            FROM (
                SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(v_variation_csv, ',', numbers.n), ',', -1) pair
                FROM (
                    SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 -- add more if needed
                ) numbers
                WHERE CHAR_LENGTH(v_variation_csv) - CHAR_LENGTH(REPLACE(v_variation_csv, ',', '')) >= numbers.n - 1
            ) t
        ) parsed
        INNER JOIN product_permutation_variation_link ppvl
            ON parsed.id_variation_type = ppvl.id_variation_type
            AND parsed.id_variation = ppvl.id_variation
        GROUP BY ppvl.v_id_permutation
        HAVING COUNT(*) = (LENGTH(v_variation_csv) - LENGTH(REPLACE(v_variation_csv, ',', '')) + 1)
        LIMIT 1;

        -- Update the v_id_permutation in the input table
        UPDATE product_permutation_input
        SET v_id_permutation = v_id_permutation
        WHERE id = v_id;

    END LOOP;

    CLOSE cur;
    
    
    IF EXISTS ( SELECT * FROM Shop_Get_Id_Product_Permutation_From_Variation_Csv_List_Temp WHERE GUID = a_guid LIMIT 1 ) THEN
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
    END IF;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Split_Input;
    DROP TEMPORARY TABLE IF EXISTS tmp_Split_Split;
    
    IF a_debug = 1 THEN
		CALL p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;
*/

/*
CALL p_shop_get_id_product_permutation_from_variation_csv_list (
	'nipsnipsnipsnipsnipsnipsnipsnipsnips'
	, '1:100,2:200,3:300,4:400' # a_string
    , 1
);

SELECT *
FROM Split_key_value_pair_csv_Temp
WHERE GUID = 'nipsnipsnipsnipsnipsnipsnipsnipsnips';

CALL p_clear_split_key_value_pair_csv_temp( 'nipsnipsnipsnipsnipsnipsnipsnipsnips' );
*/
