
DROP FUNCTION IF EXISTS fn_shop_get_product_permutation_name;

DELIMITER //

CREATE FUNCTION fn_shop_get_product_permutation_name(id_product_permutation INT)
RETURNS VARCHAR(4000)
DETERMINISTIC
BEGIN
    DECLARE name VARCHAR(4000);
    
    SET name := (
        SELECT 
            CONCAT(
				IFNULL(PC.name, '(No Category)')
                , ' - '
                , IFNULL(P.name, '(No Product)')
                , CASE WHEN P.has_variations = 1 THEN
                    CONCAT(' - ', GROUP_CONCAT(CONCAT(VT.name, ': ', V.name) SEPARATOR ', '))
                ELSE '' END
            )
        FROM Shop_Product_Permutation PP
        INNER JOIN Shop_Product P ON PP.id_product = P.id_product
        INNER JOIN Shop_Product_Category PC ON P.id_category = PC.id_category
        LEFT JOIN Shop_Product_Permutation_Variation_Link PPVL ON PP.id_permutation = PPVL.id_permutation
        LEFT JOIN Shop_Variation V ON PPVL.id_variation = V.id_variation
        LEFT JOIN Shop_Variation_Type VT ON V.id_type = VT.id_type
        WHERE PP.id_permutation = id_product_permutation
        GROUP BY PC.id_category, PC.name, P.id_product, P.name, P.has_variations, VT.display_order, VT.name, V.display_order, V.name
        LIMIT 1
    );
    
    RETURN name;
END //

DELIMITER ;


SELECT 
	fn_shop_get_product_permutation_name(
		3 -- id_product_permutation
	)
;