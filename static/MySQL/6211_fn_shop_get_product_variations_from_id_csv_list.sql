
DROP FUNCTION IF EXISTS fn_shop_get_product_variations_from_id_csv_list;

DELIMITER //

CREATE FUNCTION fn_shop_get_product_variations_from_id_csv_list (
	a_id_permutation INT
	, a_variation_csv TEXT
    , a_guid BINARY(36)
) 
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE v_csv_pairs VARCHAR(4000);
    DECLARE v_current_pair VARCHAR(50);
    DECLARE v_id_variation_type INT;
    DECLARE v_id_variation INT;
    DECLARE v_rank_counter INT;

	CALL p_validate_guid( a_guid );
    
    SET v_csv_pairs := a_variation_csv;
    SET v_rank_counter := 1;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Get_Variation_From_Csv_Variations;
    CREATE TEMPORARY TABLE tmp_Get_Variation_From_Csv_Variations (
		id_variation_type INT NULL
        , id_variation INT NOT NULL
	);
    
    WHILE LENGTH(v_csv_pairs) > 0 DO
        IF LOCATE(',', v_csv_pairs) > 0 THEN
            SET v_current_pair := SUBSTRING_INDEX(v_csv_pairs, ',', 1);
            SET v_csv_pairs := SUBSTRING(v_csv_pairs, LOCATE(',', v_csv_pairs) + 1);
        ELSE
            SET v_current_pair := v_csv_pairs;
            SET v_csv_pairs := '';
        END IF;
        
        SET v_id_variation_type := SUBSTRING_INDEX(v_current_pair, ':', 1);
        SET v_id_variation := SUBSTRING_INDEX(v_current_pair, ':', -1);
	
		IF NOT ISNULL(v_id_variation) THEN
			INSERT INTO tmp_Get_Variation_From_Csv_Variations (
				id_variation_type
				, id_variation
			)
			SELECT
				v_id_variation_type AS id_variation_type
				, v_id_variation AS id_variation
			;
			
			SET v_rank_counter := v_rank_counter + 1;
        END IF;
    END WHILE;
    
	INSERT INTO partsltd_prod.Shop_Product_Permutation_Variation_Link_Temp (
		id_link
		, id_permutation
		, id_variation
		, display_order
        , active
		, GUID
	)
	SELECT
		IFNULL(PPVL.id_link, -v_rank_counter) AS id_link
		, a_id_permutation
		, t_V.id_variation
		, v_rank_counter AS display_order
        , 1 AS active
		, a_guid
	FROM tmp_Get_Variation_From_Csv_Variations t_V
	LEFT JOIN partsltd_prod.Shop_Product_Permutation_Variation_Link PPVL ON t_V.id_variation = PPVL.id_variation
	;
	
    DROP TEMPORARY TABLE tmp_Get_Variation_From_Csv_Variations;
    
    RETURN v_rank_counter;
END //

DELIMITER ;


/*

SELECT 
	partsltd_prod.fn_shop_get_product_variations_from_id_csv_list(
		1 -- a_id_permutation
        , '1:1' -- a_variation_csv
        , 'NIPPLENIPPLENIPPLENIPPLENIPPLENIPPLE' -- a_guid
	)
;
SELECT *
FROM partsltd_prod.Shop_Product_Permutation_Variation_Link_Temp
WHERE GUID = 'NIPPLENIPPLENIPPLENIPPLENIPPLENIPPLE'
;
DELETE
FROM partsltd_prod.Shop_Product_Permutation_Variation_Link_Temp
WHERE GUID = 'NIPPLENIPPLENIPPLENIPPLENIPPLENIPPLE'
;
*/
