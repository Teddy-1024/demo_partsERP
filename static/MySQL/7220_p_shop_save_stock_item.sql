

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_stock_item;

DELIMITER //
CREATE PROCEDURE p_shop_save_stock_item (
    IN a_comment VARCHAR(500)
	, IN a_guid BINARY(36)
    , IN a_id_user INT
	, IN a_debug BIT
)
BEGIN
    
	DECLARE v_code_type_error_bad_data VARCHAR(100);
    DECLARE v_id_access_level_edit INT;
    DECLARE v_id_change_set INT;
    DECLARE v_id_permission_product INT;
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_ids_product_permission LONGTEXT;
    DECLARE v_time_start TIMESTAMP(6);
	DECLARE v_time_expire DATETIME;
    
    DECLARE exit handler for SQLEXCEPTION
    BEGIN
        -- Get diagnostic information
        GET DIAGNOSTICS CONDITION 1
            @sqlstate = RETURNED_SQLSTATE
            , @errno = MYSQL_ERRNO
            , @text = MESSAGE_TEXT
		;
        
        -- Rollback the transaction
        ROLLBACK;
        
        -- Select the error information
        -- SELECT 'Error' AS status, @errno AS error_code, @sqlstate AS sql_state, @text AS message;
        
		CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
			display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
			, id_type INT NULL
			, code VARCHAR(50) NOT NULL
			, msg VARCHAR(4000) NOT NULL
		);
        INSERT INTO tmp_Msg_Error (
			id_type
            , code
            , msg
		)
        SELECT 
			NULL
            , @errno
            , @text
		;
        SELECT *
        FROM tmp_Msg_Error;
		DROP TABLE IF EXISTS tmp_Msg_Error;
    END;
    
	SET v_time_start := CURRENT_TIMESTAMP(6);
	SET v_time_expire := DATE_ADD(v_time_start, INTERVAL 1000 YEAR);
    SET v_code_type_error_bad_data := 'BAD_DATA';
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_id_access_level_edit := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
    CALL partsltd_prod.p_validate_guid ( a_guid );
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Stock_Item;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    
    CREATE TEMPORARY TABLE tmp_Stock_Item (
		id_stock INT NOT NULL
		, id_category INT NULL
		, id_product INT NOT NULL
		, id_permutation INT NULL
		, id_pairs_variations VARCHAR(4000) NULL
        , has_variations BIT NULL
		, date_purchased DATETIME NOT NULL
		, date_received DATETIME NULL
		, id_location_storage INT NOT NULL
		, id_currency_cost INT NOT NULL
		, cost_local_VAT_incl FLOAT NOT NULL
		, cost_local_VAT_excl FLOAT NOT NULL
		, is_sealed BIT NOT NULL
		, date_unsealed DATETIME NULL
		, date_expiration DATETIME NOT NULL
		, is_consumed BIT NOT NULL
		, date_consumed DATETIME NULL
		, active BIT NOT NULL
        , can_view BIT NULL
        , can_edit BIT NULL
        , can_admin BIT NULL
        , name_error VARCHAR(1000) NULL
        , is_new BIT NOT NULL
    );
        
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
		, id_type INT NULL
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
        
    
    -- Get data from Temp table
    INSERT INTO tmp_Stock_Item (
		id_stock
		-- , id_category
		, id_product
		, id_permutation
		, id_pairs_variations
        , has_variations
		, date_purchased
		, date_received
		, id_location_storage
		, id_currency_cost
		, cost_local_VAT_incl
		, cost_local_VAT_excl
		, is_sealed
		, date_unsealed
		, date_expiration
		, is_consumed
		, date_consumed
		, active
        # , name_error
        , is_new
	)
    SELECT 
		SI_T.id_stock
		-- , IFNULL(SI_T.id_category, P.id_category) AS id_category
		, IFNULL(IFNULL(SI_T.id_product, PP.id_product), 0) AS id_product
		, IFNULL(IFNULL(SI_T.id_permutation, SI.id_permutation), 0) AS id_permutation
		, TRIM(IFNULL(SI_T.id_pairs_variations, ''))
        , CASE WHEN TRIM(IFNULL(SI_T.id_pairs_variations, '')) = '' THEN 0 ELSE 1 END AS has_variations
		, IFNULL(IFNULL(SI_T.date_purchased, SI.date_purchased), v_time_start) AS date_purchased
		, IFNULL(SI_T.date_received, SI.date_received) AS date_received
		, IFNULL(IFNULL(SI_T.id_location_storage, SI.id_location_storage), 0) AS id_location_storage
		, IFNULL(IFNULL(SI_T.id_currency_cost, SI.id_currency_cost), 0) AS id_currency_cost
		, IFNULL(SI_T.cost_local_VAT_incl, SI.cost_local_VAT_incl) AS cost_local_VAT_incl
		, IFNULL(SI_T.cost_local_VAT_excl, SI.cost_local_VAT_excl) AS cost_local_VAT_excl
		, IFNULL(IFNULL(SI_T.is_sealed, SI.is_sealed), 1) AS is_sealed
		, IFNULL(SI_T.date_unsealed, SI.date_unsealed) AS date_unsealed
		, IFNULL(IFNULL(SI_T.date_expiration, SI.date_expiration), v_time_expire) AS date_expiration
		, IFNULL(IFNULL(SI_T.is_consumed, SI.is_consumed), 0) AS is_consumed
		, IFNULL(SI_T.date_consumed, SI.date_consumed) AS date_consumed
        , IFNULL(IFNULL(SI_T.active, SI.active), 1) AS active
		# , fn_shop_get_product_permutation_name(SI_T.id_permutation)
        , CASE WHEN IFNULL(SI_T.id_stock, 0) < 1 THEN 1 ELSE 0 END AS is_new
	FROM partsltd_prod.Shop_Stock_Item_Temp SI_T
    LEFT JOIN partsltd_prod.Shop_Stock_Item SI ON SI_T.id_stock = SI.id_stock
    LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON SI_T.id_permutation = PP.id_permutation
	-- LEFT JOIN Shop_Product P ON PP.id_product = P.id_product
    WHERE SI_T.guid = a_guid
    ;
    
    -- Missing Permutation IDs for setting new permutation for stock item 
    -- With variations
	UPDATE tmp_Stock_Item t_SI
	INNER JOIN partsltd_prod.Shop_Product P ON t_SI.id_product = P.id_product
	SET t_SI.id_permutation = IFNULL(fn_shop_get_id_product_permutation_from_variation_csv_list ( t_SI.id_product, t_SI.id_pairs_variations ), 0)
    WHERE 1=1
		AND t_SI.id_permutation = 0
        AND t_SI.has_variations = 1
    ;
    -- Without variations
	UPDATE tmp_Stock_Item t_SI
	-- INNER JOIN Shop_Product P ON t_SI.id_product = P.id_product
    INNER JOIN partsltd_prod.Shop_Product_Permutation PP ON t_SI.id_product = PP.id_product
	SET t_SI.id_permutation = IFNULL(PP.id_permutation, 0)
    WHERE 1=1
		AND t_SI.id_permutation = 0
        AND t_SI.has_variations = 0
    ;
    
    -- Add stock item error names
	UPDATE tmp_Stock_Item t_SI
	INNER JOIN partsltd_prod.Shop_Product P ON t_SI.id_product = P.id_product
    INNER JOIN partsltd_prod.Shop_Product_Category PC ON P.id_category = PC.id_category
    -- INNER JOIN Shop_Product_Permutation PP ON t_SI.id_product = PP.id_product
	SET t_SI.name_error = CONCAT(
			PC.name,
            ' - ',
            P.name,
            ' - ',
			CASE WHEN IFNULL(t_SI.id_permutation, 0) = 0 THEN '(No permutation)' ELSE fn_shop_get_product_permutation_name ( t_SI.id_permutation ) END
		)
    ;
    
    IF a_debug = 1 THEN
		sElect * from tmp_Stock_Item;
    END IF;
    
    -- Validation
    -- id_stock
    IF EXISTS (
		SELECT * 
        FROM tmp_Stock_Item t_SI 
        LEFT JOIN partsltd_prod.Shop_Stock_Item SI ON t_SI.id_stock = SI.id_stock
        WHERE 1=1
			AND t_SI.id_stock > 0
			AND ISNULL(SI.id_stock)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT(
				'Invalid stock item(s): '
				, GROUP_CONCAT(
					CONCAT(
						IFNULL(t_SI.id_stock, '(No Stock Item)')
						, ' - '
						, IFNULL(t_SI.name_error, '(No Product)')
					) SEPARATOR ', '
				)
			) AS msg
		FROM tmp_Stock_Item t_SI
        LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_SI.id_permutation = PP.id_permutation 
        WHERE 1=1
			AND t_SI.id_stock > 0
			AND ISNULL(SI.id_stock)
		;
    END IF;
    -- id_product
    IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE t_SI.id_product = 0 LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a product: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Stock_Item t_SI
		WHERE t_SI.id_product = 0
		;
    END IF;
    -- id_permutation
    IF EXISTS (
		SELECT * 
        FROM tmp_Stock_Item t_SI 
        LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_SI.id_permutation = PP.id_permutation 
        WHERE 1=1
			AND (
				t_SI.id_permutation = 0
                OR PP.active = 0
			)
		LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('A valid permutation could not be found for the variations selected for the following stock item(s): ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Stock_Item t_SI
        LEFT JOIN partsltd_prod.Shop_Product_Permutation PP ON t_SI.id_permutation = PP.id_permutation 
        WHERE 1=1
			AND (
				t_SI.id_permutation = 0
                OR PP.active = 0
			)
		;
    END IF;
    -- date_purchased
    IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE ISNULL(t_SI.date_purchased) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have an purchase date: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Stock_Item t_SI
		WHERE ISNULL(t_SI.date_purchased)
		;
    END IF;
    -- id_location_storage
    IF EXISTS (
		SELECT * 
        FROM tmp_Stock_Item t_SI
        INNER JOIN partsltd_prod.Shop_Storage_Location SL 
			ON t_SI.id_location_storage = SL.id_location
            AND SL.active = 1
        WHERE ISNULL(SL.id_location)
        LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid storage location: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
        FROM tmp_Stock_Item t_SI
        INNER JOIN partsltd_prod.Shop_Storage_Location SL 
			ON t_SI.id_location_storage = SL.id_location
            AND SL.active = 1
        WHERE ISNULL(SL.id_location)
		;
    END IF;
    -- id_currency_cost
    IF EXISTS (
		SELECT * 
        FROM tmp_Stock_Item t_SI
        INNER JOIN partsltd_prod.Shop_Currency C
			ON t_SI.id_currency_cost = C.id_currency
            AND C.active = 1
        WHERE ISNULL(C.id_currency)
        LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid cost currency: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
        FROM tmp_Stock_Item t_SI
        INNER JOIN partsltd_prod.Shop_Currency C
			ON t_SI.id_currency_cost = C.id_currency
            AND C.active = 1
        WHERE ISNULL(C.id_currency)
		;
    END IF;
    -- cost_local_VAT_excl
    IF EXISTS (
		SELECT * 
        FROM tmp_Stock_Item t_SI
        WHERE 1=1
			AND (
				ISNULL(t_SI.cost_local_VAT_excl)
                OR t_SI.cost_local_VAT_excl < 0
			)
        LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid cost excluding VAT: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
        FROM tmp_Stock_Item t_SI
        WHERE 1=1
			AND (
				ISNULL(t_SI.cost_local_VAT_excl)
                OR t_SI.cost_local_VAT_excl < 0
			)
		;
    END IF;
    -- cost_local_VAT_incl
    IF EXISTS (
		SELECT * 
        FROM tmp_Stock_Item t_SI
        WHERE 1=1
			AND (
				ISNULL(t_SI.cost_local_VAT_incl)
                OR t_SI.cost_local_VAT_incl < 0
			)
        LIMIT 1
	) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid cost including VAT: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
        FROM tmp_Stock_Item t_SI
        WHERE 1=1
			AND (
				ISNULL(t_SI.cost_local_VAT_incl)
                OR t_SI.cost_local_VAT_incl < t_SI.cost_local_VAT_excl
			)
		;
    END IF;
    -- date_received
    IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE NOT ISNULL(t_SI.date_received) AND t_SI.date_received < t_SI.date_purchased LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid received date: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Stock_Item t_SI
		WHERE 1=1
			AND NOT ISNULL(t_SI.date_received)
			AND t_SI.date_received < t_SI.date_purchased
		;
    END IF;
    -- date_unsealed
    IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE NOT ISNULL(t_SI.date_unsealed) AND t_SI.date_unsealed < t_SI.date_purchased LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid unsealed date: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Stock_Item t_SI
		WHERE 1=1
			AND NOT ISNULL(t_SI.date_received)
			AND t_SI.date_received < t_SI.date_purchased
		;
    END IF;
    -- date_expiration
    IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE NOT ISNULL(t_SI.date_expiration) AND t_SI.date_expiration < t_SI.date_purchased LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid expiration date: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Stock_Item t_SI
		WHERE 1=1
			AND NOT ISNULL(t_SI.date_expiration)
			AND t_SI.date_expiration < t_SI.date_purchased
		;
    END IF;
    -- date_consumed
    IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE NOT ISNULL(t_SI.date_consumed) AND t_SI.date_consumed < t_SI.date_purchased LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following stock item(s) do not have a valid consumed date: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Stock_Item t_SI
		WHERE 1=1
			AND NOT ISNULL(t_SI.date_consumed)
			AND t_SI.date_consumed < t_SI.date_purchased
		;
    END IF;
    
    -- Permissions
	SET v_ids_product_permission := ( SELECT GROUP_CONCAT(t_SI.id_product SEPARATOR ',') FROM tmp_Stock_Item t_SI );
    
	IF NOT ISNULL(v_ids_product_permission) THEN
		SET v_id_permission_product = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
		
		CALL p_shop_calc_user(
			a_guid
            , a_id_user
            , FALSE -- a_get_inactive_users
            , v_id_permission_product
            , v_id_access_level_edit
            , v_ids_product_permission
            , 0 -- a_debug
		);
		
		UPDATE tmp_Stock_Item t_SI
		INNER JOIN Shop_Product P ON t_SI.id_product = P.id_product
		INNER JOIN Shop_Calc_User_Temp UE_T
			ON P.id_product = UE_T.id_product
			AND UE_T.GUID = a_guid
		SET 
			t_SI.can_view = UE_T.can_view
			, t_SI.can_edit = UE_T.can_edit
			, t_SI.can_admin = UE_T.can_admin
		;
		
		CALL p_shop_clear_calc_user( 
			a_guid
			, 0 -- a_debug
		);

		IF EXISTS (SELECT * FROM tmp_Stock_Item t_SI WHERE IFNULL(t_SI.can_edit, 0) = 0 LIMIT 1) THEN
			INSERT INTO tmp_Msg_Error (
				guid
				, id_type
				, code
				, msg
			)
			SELECT
				a_guid AS GUID
				, v_id_type_error_bad_data
				, v_code_type_error_bad_data
				, CONCAT('The following stock item(s) do not have product edit permission: ', GROUP_CONCAT(IFNULL(t_SI.name_error, 'NULL') SEPARATOR ', ')) AS msg
			FROM tmp_Stock_Item t_SI
			WHERE IFNULL(t_SI.can_edit, 0) = 0
			;
		END IF;
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		START TRANSACTION;
			
			IF NOT ISNULL(v_ids_product_permission) THEN
				INSERT INTO Shop_Product_Change_Set ( 
					comment
					, updated_last_by
				)
				VALUES ( 
					a_comment,
					a_id_user
				)
				;
				
				SET v_id_change_set := LAST_INSERT_ID();
                
				-- select * from partsltd_prod.Shop_Stock_Item
				UPDATE partsltd_prod.Shop_Stock_Item SI
				INNER JOIN tmp_Stock_Item t_SI
					ON SI.id_stock = t_SI.id_stock
				SET 
					SI.id_permutation = t_SI.id_permutation
					, SI.date_purchased = t_SI.date_purchased
					, SI.date_received = t_SI.date_received
					, SI.id_location_storage = t_SI.id_location_storage
					, SI.id_currency_cost = t_SI.id_currency_cost
					, SI.cost_local_VAT_excl = t_SI.cost_local_VAT_excl
					, SI.cost_local_VAT_incl = t_SI.cost_local_VAT_incl
					, SI.is_sealed = t_SI.is_sealed
					, SI.date_unsealed = t_SI.date_unsealed
					, SI.date_expiration = t_SI.date_expiration
					, SI.is_consumed = t_SI.is_consumed
					, SI.date_consumed = t_SI.date_consumed
					, SI.active = t_SI.active
					, SI.id_change_set = v_id_change_set
				;
			END IF;
			
			INSERT INTO partsltd_prod.Shop_Stock_Item (
				id_permutation
				, date_purchased
				, date_received
				, id_location_storage
				, id_currency_cost
				, cost_local_VAT_excl
				, cost_local_VAT_incl
				, is_sealed
				, date_unsealed
				, date_expiration
				, is_consumed
				, date_consumed
				, active
				, created_by
				, created_on
			)
			SELECT
				t_SI.id_permutation
				, t_SI.date_purchased
				, t_SI.date_received
				, t_SI.id_location_storage
				, t_SI.id_currency_cost
				, t_SI.cost_local_VAT_excl
				, t_SI.cost_local_VAT_incl
				, t_SI.is_sealed
				, t_SI.date_unsealed
				, t_SI.date_expiration
				, t_SI.is_consumed
				, t_SI.date_consumed
				, t_SI.active
				, a_id_user AS created_by
				, v_time_start AS created_on
			FROM tmp_Stock_Item t_SI
			WHERE 
				is_new = 1
				AND active = 1
			;
		
		COMMIT;
    END IF;
    
    START TRANSACTION;
		
		DELETE FROM partsltd_prod.Shop_Stock_Item_Temp
		WHERE GUID = a_guid;
		
	COMMIT;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
	INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
	;
    
	IF a_debug = 1 THEN
		SELECT * from tmp_Stock_Item;
	END IF;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Stock_Item;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    
	IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
	END IF;
END //
DELIMITER ;


/*

DELETE FROM Shop_Product_Permutation_Temp
WHERE id_permutation = 1
;

INSERT INTO Shop_Product_Permutation_Temp (
	id_permutation, 
	id_product, 
	description, 
	cost_local, 
	id_currency_cost, 
	profit_local_min, 
	latency_manufacture,
	id_unit_measurement_quantity,
	count_unit_measurement_per_quantity_step,
	quantity_min, 
	quantity_max, 
	quantity_stock, 
	is_subscription, 
	id_unit_measurement_interval_recurrence, 
	count_interval_recurrence, 
	id_stripe_product,
	does_expire_faster_once_unsealed,
	id_unit_measurement_interval_expiration_unsealed,
	count_interval_expiration_unsealed,
	active,
	guid
)
VALUES
	(
		1 -- id_permutation, 
		, 1 -- id_product, 
		, 'Good Reddy Teddy' -- description, 
		, 5.0 -- cost_local, 
		, 1 -- id_currency_cost, 
		, 3.0 -- profit_local_min, 
		, 14 -- latency_manufacture,
		, 1 -- id_unit_measurement_quantity,
		, 1.0 -- count_unit_measurement_quantity,
		, 3.0 -- quantity_min, 
		, 99.0 -- quantity_max, 
		, 1.0 -- quantity_stock, 
		, False -- is_subscription, 
		, null -- id_unit_measurement_interval_recurrence, 
		, null -- count_interval_recurrence, 
		, null -- id_stripe_product,
		, False -- does_expire_faster_once_unsealed,
		, null -- id_unit_measurement_interval_expiration_unsealed,
		, null -- count_interval_expiration_unsealed,
		, True -- active,
		, 'NIPS' -- guid
    )
;

select 'Shop_Product_Permutation_Temp before call';
SELECT * FROM Shop_Product_Permutation_Temp;

SELECT 'Shop_Product_Permutation before call' AS result_name;
select * FROM Shop_Product_Permutation;

CALL p_shop_save_product_permutation (
    1, -- 'auth0|6582b95c895d09a70ba10fef', # a_id_user
    'Initial data', # a_comment
	'NIPS' # a_guid
);

SELECT 'Shop_Product_Permutation_Temp after call' AS result_name;
select * FROM Shop_Product_Permutation_Temp;

SELECT 'Shop_Product_Permutation after call' AS result_name;
select * FROM Shop_Product_Permutation;


DELETE FROM Shop_Product_Permutation_Temp
WHERE id_permutation = 1;


*/

