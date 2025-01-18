
-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_clear_calc_product_permutation;


DELIMITER //
CREATE PROCEDURE p_shop_clear_calc_product_permutation (
	IN a_guid BINARY(36)
)
BEGIN
    IF ISNULL(a_guid) THEN
		
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'GUID is required.';
        
	ELSE
    
		START TRANSACTION;
            
            DELETE FROM Shop_Product_Category_Temp
            WHERE GUID = a_guid
            ;
            DELETE FROM Shop_Product_Temp
            WHERE GUID = a_guid
            ;
            DELETE FROM Shop_Product_Permutation_Temp
            WHERE GUID = a_guid
            ;
        
        COMMIT;
	END IF;
    
END //
DELIMITER ;

/*

CALL p_shop_clear_calc_product_permutation (
	'noods, cheese ' # a_guid
);

SELECT * FROM Shop_Product_Category_Temp
WHERE GUID = a_guid
;
SELECT * FROM Shop_Product_Temp
WHERE GUID = a_guid
;
SELECT * FROM Shop_Product_Permutation_Temp
WHERE GUID = a_guid
;

*/
