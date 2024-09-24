
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
                P.name
                , CASE WHEN P.has_variations = 1 THEN
                    CONCAT(' - ', GROUP_CONCAT(CONCAT(VT.name, ': ', V.name) SEPARATOR ', '))
                ELSE '' END
            )
        FROM Shop_Product_Permutation PP
        INNER JOIN Shop_Product P ON PP.id_product = P.id_product
        INNER JOIN Shop_Product_Permutation_Variation_Link PPVL ON PP.id_permutation = PPVL.id_permutation
        INNER JOIN Shop_Variation V ON PPVL.id_variation = V.id_variation
        INNER JOIN Shop_Variation_Type VT ON V.id_type = VT.id_type
        WHERE PP.id_permutation = id_product_permutation
        GROUP BY P.id_product, P.name, P.has_variations, VT.display_order, VT.name, V.display_order, V.name
        LIMIT 1
    );
    
    RETURN name;
END //

DELIMITER ;
