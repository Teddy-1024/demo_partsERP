
DROP FUNCTION IF EXISTS fn_shop_get_product_permutation_variations_csv;

DELIMITER //

CREATE FUNCTION fn_shop_get_product_permutation_variations_csv(id_product_permutation INT)
RETURNS VARCHAR(4000)
DETERMINISTIC
BEGIN
    DECLARE csv VARCHAR(4000);
    
    SET csv := (
        SELECT 
			CASE WHEN P.has_variations = 0 THEN
				''
            ELSE
				GROUP_CONCAT(
					CONCAT(
						PV.id_type
						, ':'
						, PV.id_variation
					)
					SEPARATOR ','
				)
			END 
		FROM demo.Shop_Product_Permutation PP
		LEFT JOIN demo.Shop_Product P ON PP.id_product = P.id_product
		LEFT JOIN demo.Shop_Product_Permutation_Variation_Link PPVL ON PP.id_permutation = PPVL.id_permutation
		LEFT JOIN demo.Shop_Variation PV ON PPVL.id_variation = PV.id_variation
		LEFT JOIN demo.Shop_Variation_Type PVT ON PV.id_type = PVT.id_type
        WHERE PP.id_permutation = id_product_permutation
        GROUP BY P.id_product, P.has_variations, PVT.display_order, PVT.name, PV.display_order, PV.name
        LIMIT 1
    );
    
    RETURN csv;
END //

DELIMITER ;
SELECT 
	fn_shop_get_product_permutation_variations_csv(
		3 -- id_product_permutation
	)
    , fn_shop_get_product_permutation_variations_csv(
		1 -- id_product_permutation
	)
;
/*
*/