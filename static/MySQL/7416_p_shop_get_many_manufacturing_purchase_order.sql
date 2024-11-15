

DROP PROCEDURE IF EXISTS p_shop_get_many_manufacturing_purchase_order;

DELIMITER //
CREATE PROCEDURE p_shop_get_many_manufacturing_purchase_order (
	IN a_id_user INT,
    IN a_get_all_order BIT,
	IN a_get_inactive_order BIT,
	IN a_ids_order TEXT,
	IN a_ids_permutation TEXT,
    IN a_date_from DATETIME,
    IN a_date_to DATETIME,
	IN a_debug BIT
)
BEGIN
    DECLARE v_code_type_error_bad_data VARCHAR(50);
	DECLARE v_code_type_error_no_permission VARCHAR(50);
    DECLARE v_guid BINARY(36);
    DECLARE v_has_filter_order BIT;
    DECLARE v_has_filter_permutation BIT;
    DECLARE v_has_filter_date_from BIT;
    DECLARE v_has_filter_date_to BIT;
    DECLARE v_id_access_level_view INT;
    DECLARE v_ids_permission_manufacturing_purchase_order VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_type_error_no_permission INT;
    DECLARE v_time_start TIMESTAMP(6);
    
	SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_code_type_error_bad_data := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_bad_data := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_code_type_error_no_permission := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
    SET v_id_type_error_no_permission := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_no_permission);
    SET v_ids_permission_manufacturing_purchase_order := (SELECT GROUP_CONCAT(id_permission SEPARATOR ',') FROM partsltd_prod.Shop_Permission WHERE code IN ('STORE_MANUFACTURING_PURCHASE_ORDER', 'STORE_PRODUCT'));
	
	SET a_get_all_order := IFNULL(a_get_all_order, 1);
	SET a_get_inactive_order := IFNULL(a_get_inactive_order, 0);
	SET a_ids_order := TRIM(IFNULL(a_ids_order, ''));
	SET a_ids_permutation := TRIM(IFNULL(a_ids_permutation, ''));
	SET a_date_from := IFNULL(a_date_from, NULL);
	SET a_date_to := IFNULL(a_date_to, NULL);
	SET a_debug := IFNULL(a_debug, 0);
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Manufacturing_Purchase_Order_Product_Link;
    DROP TEMPORARY TABLE IF EXISTS tmp_Manufacturing_Purchase_Order;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    DROP TEMPORARY TABLE IF EXISTS tmp_Split;
    
    CREATE TEMPORARY TABLE tmp_Manufacturing_Purchase_Order (
		id_order INT NOT NULL PRIMARY KEY
    );
    
    CREATE TEMPORARY TABLE tmp_Permutation (
		id_permutation INT NOT NULL PRIMARY KEY
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		id_type INT NOT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Split (
		substring VARCHAR(4000) NOT NULL
        , as_int INT NULL
	);
    DELETE FROM tmp_Split;
    
    SET v_has_filter_order = CASE WHEN a_ids_order = '' THEN 0 ELSE 1 END;
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_date_from = CASE WHEN ISNULL(a_date_from) THEN 0 ELSE 1 END;
    SET v_has_filter_date_to = CASE WHEN ISNULL(a_date_to) THEN 0 ELSE 1 END;

	IF a_debug = 1 THEN
		SELECT
			v_has_filter_order
			, v_has_filter_permutation
			, v_has_filter_date_from
			, v_has_filter_date_to
		;
	END IF;
    
    -- Permutations
    IF v_has_filter_permutation = 1 THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_permutation, ',', a_debug);
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( v_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_S.as_int = PP.id_permutation
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(PP.id_permutation)
				OR PP.active = 0
		) THEN
			INSERT INTO tmp_Msg_Error (
				id_type,
				code,
				msg
			)
			SELECT
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive permutation IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_S.as_int = PP.id_permutation
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(PP.id_permutation)
				OR PP.active = 0
			;
		ELSE
			INSERT INTO tmp_Permutation (
				id_permutation
			)
			SELECT 
				PP.id_permutation
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_S.as_int = PP.id_permutation
			WHERE (
					v_has_filter_permutation = 0
					OR NOT ISNULL(t_S.as_int)
				)
			;
		END IF;
	END IF;

	DELETE FROM tmp_Split;
    
    -- Manufacturing Purchase Orders
    IF v_has_filter_order = 1 THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_order, ',', a_debug);
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( v_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO ON t_S.as_int = MPO.id_order
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(MPO.id_order)
				OR (
					MPO.active = 0
					AND a_get_inactive_order = 0
				)
		) THEN
			INSERT INTO tmp_Msg_Error (
				id_type,
				code,
				msg
			)
			SELECT
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive Manufacturing Purchase Order IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO ON t_S.as_int = MPO.id_order
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(MPO.id_order)
				OR (
					MPO.active = 0
					AND a_get_inactive_order = 0
				)
			;
		ELSE
			INSERT INTO tmp_Manufacturing_Purchase_Order (
				id_order
			)
			SELECT 
				MPO.id_order
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO ON t_S.as_int = MPO.id_order
			INNER JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link MPOPL ON MPO.id_order = MPOPL.id_order
			INNER JOIN tmp_Permutation t_PP ON MPOPL.id_permutation = t_PP.id_permutation
			WHERE (
					a_get_all_order = 1
					OR (
						v_has_filter_order = 1
						AND NOT ISNULL(t_S.as_int)
					)
					OR (
						v_has_filter_permutation = 1
						AND NOT ISNULL(t_PP.id_permutation)
					)
				)
				AND (
					a_get_inactive_order = 1
					OR MPO.active = 1
				)
				AND (
					v_has_filter_date_from = 0
					OR MPO.created_on > a_date_from
				)
				AND (
					v_has_filter_date_to = 0
					OR MPO.created_on < a_date_to
				)
				
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    -- Permissions
	IF a_debug = 1 THEN
		SELECT 
			v_guid
			, a_id_user
			, FALSE -- get inactive users
			, v_ids_permission_manufacturing_purchase_order
			, v_id_access_level_view
			, '' -- ids_product
			, 0 -- a_debug
		;
		SELECT * FROM partsltd_prod.Shop_Calc_User_Temp;
	END IF;
	
	CALL p_shop_calc_user(
		v_guid
		, a_id_user
		, FALSE -- get inactive users
		, v_ids_permission_manufacturing_purchase_order
		, v_id_access_level_view
		, '' -- ids_product
		, 0 -- a_debug
	);
	
	IF a_debug = 1 THEN
		SELECT * FROM partsltd_prod.Shop_Calc_User_Temp;
	END IF;
	
	IF NOT EXISTS (SELECT can_view FROM partsltd_prod.Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
		DELETE FROM tmp_Msg_Error;

		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		VALUES (
			v_id_type_error_no_permission
			, v_code_type_error_no_permission
			, CONCAT('You do not have view permissions for ', IFNULL((SELECT IFNULL(name, '(No Permission Name)') FROM partsltd_prod.Shop_Permission WHERE FIND_IN_SET(id_permission, v_ids_permission_manufacturing_purchase_order) > 0 LIMIT 1), '(No Permissions Found)'))
		)
		;
	END IF;
    
	IF EXISTS ( SELECT * FROM tmp_Msg_Error LIMIT 1 ) THEN
		-- DELETE FROM tmp_Manufacturing_Purchase_Order_Product_Link;
		DELETE FROM tmp_Manufacturing_Purchase_Order;
	END IF;
	
    -- Returns
	/*
    # Manufacturings
    SELECT 
		t_S.id_manufacturing,
        S.name_company,
		S.name_contact,
		S.department_contact,
		S.id_address,
		S.phone_number,
		S.fax,
		S.email,
		S.website,
		S.id_currency,
		t_S.active
    FROM tmp_Manufacturing t_S
    INNER JOIN partsltd_prod.Shop_Manufacturing S
		ON t_S.id_manufacturing = S.id_manufacturing
	;
    */

    # Manufacturing Purchase Order
    SELECT 
		t_MPO.id_order
		, MPO.id_currency
        , C.code
        , C.symbol
		, MPO.cost_total_local_VAT_excl
		, MPO.cost_total_local_VAT_incl
		, MPO.price_total_local_VAT_excl
		, MPO.price_total_local_VAT_incl
        , MPO.active
        , MPO.created_on
        , CONCAT(
			MPO.cost_total_local_VAT_excl
            , ' on '
            , MPO.created_on
		) AS name
    FROM tmp_Manufacturing_Purchase_Order t_MPO 
	INNER JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO ON MPO.id_order = t_MPO.id_order
    LEFT JOIN partsltd_prod.Shop_Currency C ON MPO.id_currency = C.id_currency
    ;
    
    # Manufacturing Purchase Order Product Link
    SELECT
		MPOPL.id_link
		, MPOPL.id_order
        , P.id_category
        , P.id_product
		, MPOPL.id_permutation
        , fn_shop_get_product_permutation_name(MPOPL.id_permutation) AS name_permutation
        , fn_shop_get_product_permutation_variations_csv(MPOPL.id_permutation) AS csv_id_pairs_variation
		, MPOPL.id_unit_quantity
		, MPOPL.quantity_used
		, MPOPL.quantity_produced
        , MPOPL.id_unit_latency_manufacture
		, MPOPL.latency_manufacture
		, MPOPL.display_order
        , MPOPL.cost_unit_local_VAT_excl
        , MPOPL.cost_unit_local_VAT_incl
        , MPOPL.price_unit_local_VAT_excl
        , MPOPL.price_unit_local_VAT_incl
        , MPOPL.active
    FROM tmp_Manufacturing_Purchase_Order t_MPO
	INNER JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link MPOPL ON t_MPO.id_order = MPOPL.id_order
    LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON MPOPL.id_permutation = PP.id_permutation
    LEFT JOIN partsltd_prod.Shop_Product P ON PP.id_product = P.id_product
    ;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
    INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
    ;
    
    IF a_debug = 1 THEN
		SELECT * from tmp_Manufacturing_Purchase_Order;
		SELECT * from tmp_Permutation;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tmp_Manufacturing_Purchase_Order_Product_Link;
    DROP TEMPORARY TABLE IF EXISTS tmp_Manufacturing_Purchase_Order;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    DROP TEMPORARY TABLE IF EXISTS tmp_Split;
	
    IF a_debug = 1 THEN
		CALL p_debug_timing_reporting( v_time_start );
    END IF;
END //
DELIMITER ;;


/*

CALL p_shop_get_many_manufacturing_purchase_order (
	0 # a_id_user
	, 1 # a_get_all_order
	, 1 # a_get_inactive_order
    , '' # a_ids_order
    , '' # a_ids_permutation
    , NULL # a_date_from
	, NULL # a_date_to
	, 0 # a_debug
);


select *
from partsltd_prod.shop_manufacturing_purchase_order
;
select *
from partsltd_prod.shop_manufacturing_purchase_order_product_link
;
*/
