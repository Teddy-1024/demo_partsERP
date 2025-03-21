

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_permutation;
DROP PROCEDURE IF EXISTS p_shop_save_product_permutation;

DELIMITER //
CREATE PROCEDURE p_shop_save_product_permutation (
    IN a_comment VARCHAR(500),
	IN a_guid BINARY(36),
    IN a_id_user INT,
    IN a_debug BIT
)
BEGIN
    
	DECLARE v_code_type_error_bad_data VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission LONGTEXT;
    DECLARE v_id_change_set INT;
    DECLARE v_id_access_level_edit INT;
    DECLARE v_time_start TIMESTAMP(6);
    
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
			MET.id_type
            , @errno
            , @text
		FROM demo.Shop_Msg_Error_Type MET
        WHERE MET.code = 'MYSQL_ERROR'
        LIMIT 1
		;
        SELECT *
        FROM tmp_Msg_Error;
		DROP TABLE IF EXISTS tmp_Msg_Error;
    END;
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_code_type_error_bad_data := 'BAD_DATA';
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_id_access_level_edit := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
    CALL p_validate_guid ( a_guid );
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation_Variation_Link;
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    
    CREATE TEMPORARY TABLE tmp_Permutation (
		id_permutation INT NOT NULL
        , id_permutation_temp INT NOT NULL
		, id_product INT NOT NULL
        , csv_id_pairs_variation VARCHAR(4000) NULL
		, description VARCHAR(4000) NOT NULL
		, cost_local_VAT_excl FLOAT NULL
		, cost_local_VAT_incl FLOAT NULL
		, id_currency_cost INT NOT NULL
		, profit_local_min FLOAT NULL
		, latency_manufacture INT NOT NULL
		, id_unit_measurement_quantity INT NOT NULL
		, count_unit_measurement_per_quantity_step FLOAT NOT NULL
		, quantity_min FLOAT NULL
		, quantity_max FLOAT NULL
		, quantity_stock FLOAT NOT NULL
		, is_subscription BIT NOT NULL
		, id_unit_measurement_interval_recurrence INT
		, count_interval_recurrence INT
		, id_stripe_product VARCHAR(100) NULL
		, does_expire_faster_once_unsealed BIT NOT NULL
		, id_unit_measurement_interval_expiration_unsealed INT
		, count_interval_expiration_unsealed INT
		, active BIT NOT NULL DEFAULT 1
        , can_view BIT NULL
        , can_edit BIT NULL
        , can_admin BIT NULL
        , name_error VARCHAR(255) NOT NULL
        , is_new BIT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Permutation_Variation_Link (
		id_link INT NOT NULL
        , id_permutation INT NOT NULL
        , id_variation INT NOT NULL
        , active BIT NOT NULL
        , display_order INT NOT NULL
        , is_new BIT NOT NULL
    );
        
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
		, id_type INT NULL
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
        
    
    -- Get data from Temp table
    INSERT INTO tmp_Permutation (
		id_permutation
		, id_permutation_temp
		, id_product
        , csv_id_pairs_variation
		, description
		, cost_local_VAT_excl
		, cost_local_VAT_incl
		, id_currency_cost
		, profit_local_min
		, latency_manufacture
		, id_unit_measurement_quantity
		, count_unit_measurement_per_quantity_step
		, quantity_min
		, quantity_max
		, quantity_stock
		, is_subscription
		, id_unit_measurement_interval_recurrence
		, count_interval_recurrence
		, id_stripe_product
		, does_expire_faster_once_unsealed
		, id_unit_measurement_interval_expiration_unsealed
		, count_interval_expiration_unsealed
		, active
        , name_error
        , is_new
	)
    SELECT 
		PP_T.id_permutation
		, PP_T.id_permutation
		, IFNULL(PP_T.id_product, PP.id_product) AS id_product
        , PP_T.csv_id_pairs_variation
        , IFNULL(PP_T.description, PP.description) AS description
		, IFNULL(PP_T.cost_local_VAT_excl, PP.cost_local_VAT_excl) AS cost_local_VAT_excl
		, IFNULL(PP_T.cost_local_VAT_incl, PP.cost_local_VAT_incl) AS cost_local_VAT_incl
		, IFNULL(PP_T.id_currency_cost, PP.id_currency_cost) AS a_id_currency_cost
		, IFNULL(PP_T.profit_local_min, PP.profit_local_min) AS profit_local_min
		, IFNULL(PP_T.latency_manufacture, PP.latency_manufacture) AS latency_manufacture
		, IFNULL(PP_T.id_unit_measurement_quantity, PP.id_unit_measurement_quantity) AS id_unit_measurement_quantity
		, IFNULL(PP_T.count_unit_measurement_per_quantity_step, PP.count_unit_measurement_per_quantity_step) AS count_unit_measurement_per_quantity_step
		, IFNULL(PP_T.quantity_min, PP.quantity_min) AS quantity_min
		, IFNULL(PP_T.quantity_max, PP.quantity_max) AS quantity_max
		, IFNULL(PP_T.quantity_stock, PP.quantity_stock) AS quantity_stock
		, IFNULL(PP_T.is_subscription, PP.is_subscription) AS is_subscription
		, IFNULL(PP_T.id_unit_measurement_interval_recurrence, PP.id_unit_measurement_interval_recurrence) AS id_unit_measurement_interval_recurrence
		, IFNULL(PP_T.count_interval_recurrence, PP.count_interval_recurrence) AS count_interval_recurrence
		, IFNULL(PP_T.id_stripe_product, PP.id_stripe_product) AS id_stripe_product
		, IFNULL(PP_T.does_expire_faster_once_unsealed, PP.does_expire_faster_once_unsealed) AS does_expire_faster_once_unsealed
		, IFNULL(PP_T.id_unit_measurement_interval_expiration_unsealed, PP.id_unit_measurement_interval_expiration_unsealed) AS id_unit_measurement_interval_expiration_unsealed
		, IFNULL(PP_T.count_interval_expiration_unsealed, PP.count_interval_expiration_unsealed) AS count_interval_expiration_unsealed
        , IFNULL(PP_T.active, PP.active) AS active
		, IFNULL(fn_shop_get_product_permutation_name(PP_T.id_permutation), '(No Permutation)') AS name_error
        , CASE WHEN IFNULL(PP_T.id_permutation, 0) < 1 THEN 1 ELSE 0 END AS is_new
	FROM Shop_Product_Permutation_Temp PP_T
    LEFT JOIN Shop_Product_Permutation PP ON PP_T.id_permutation = PP.id_permutation
    WHERE PP_T.guid = a_guid
    ;
    
    SELECT
		demo.fn_shop_get_product_variations_from_id_csv_list(
			t_PP.id_permutation -- a_id_permutation
			, t_PP.csv_id_pairs_variation -- a_variation_csv
			, a_guid -- a_guid
		)
    FROM tmp_Permutation t_PP
    WHERE NOT ISNULL(t_PP.csv_id_pairs_variation)
    ;
    
    INSERT INTO tmp_Permutation_Variation_Link (
		id_link
        , id_permutation
        , id_variation
        , display_order
        , active
        , is_new
	)
    SELECT
		PPVL_T.id_link
        , PPVL_T.id_permutation
        , PPVL_T.id_variation
        , PPVL_T.display_order
        , NOT ISNULL(PPVL_T.id_link) AS active
        , IFNULL(PPVL_T.id_link, 0) < 1 AS is_new
    FROM demo.Shop_Product_Permutation_Variation_Link_Temp PPVL_T
    LEFT JOIN demo.Shop_Product_Permutation_Variation_Link PPVL ON PPVL_T.id_link = PPVL.id_variation
    LEFT JOIN tmp_Permutation t_PP ON PPVL_T.id_permutation = t_PP.id_permutation
    WHERE PPVL_T.GUID = a_guid
    ;
    
    IF a_debug = 1 THEN
		SELECT *
		FROM tmp_Permutation
		;
		SELECT *
		FROM tmp_Permutation_Variation_Link
		;
    END IF;
    
    -- Validation
    -- Missing mandatory fields
    -- id_product
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.id_product) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a product: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.id_product)
		;
    END IF;
    -- cost_local_VAT_excl
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE NOT ISNULL(t_P.cost_local_VAT_excl) AND t_P.cost_local_VAT_excl < 0 LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a valid local cost excluding VAT: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE NOT ISNULL(t_P.cost_local_VAT_excl) AND t_P.cost_local_VAT_excl < 0
		;
    END IF;
    -- cost_local_VAT_incl
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE NOT ISNULL(t_P.cost_local_VAT_incl) AND t_P.cost_local_VAT_incl < 0 LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a valid local cost including VAT: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE NOT ISNULL(t_P.cost_local_VAT_incl) AND t_P.cost_local_VAT_incl < 0
		;
    END IF;
    -- profit_local_min 
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE NOT ISNULL(t_P.profit_local_min) AND t_P.profit_local_min < 0 LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a local minimum profit: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE NOT ISNULL(t_P.profit_local_min) AND t_P.profit_local_min < 0
		;
    END IF;
    
    -- 	latency_manufacture
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.latency_manufacture) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a manufacturing latency: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.latency_manufacture)
		;
    END IF;
    -- id_unit_measurement_quantity
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.id_unit_measurement_quantity) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a unit measurement for stock quantities: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.id_unit_measurement_quantity)
		;
    END IF;
    -- 	count_unit_measurement_per_quantity_step
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.count_unit_measurement_per_quantity_step) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a count unit measurement per quantity step: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.count_unit_measurement_per_quantity_step)
		;
    END IF;
    -- quantity_min
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.quantity_min) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a minimum quantity: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.quantity_min)
		;
    END IF;
    -- 	quantity_max
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.quantity_max) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a maximum quantity: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.quantity_max)
		;
    END IF;
    -- is_subscription
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.is_subscription) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have an is subscription?: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.is_subscription)
		;
    END IF;
    -- does_expire_faster_once_unsealed
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.does_expire_faster_once_unsealed) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a does expire faster once unsealed: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.does_expire_faster_once_unsealed)
		;
    END IF;
    
    -- Permissions
	SET v_ids_product_permission := (
		SELECT GROUP_CONCAT(P.id_product SEPARATOR ',') 
		FROM Shop_Product P 
		INNER JOIN tmp_Permutation t_P
			ON P.id_product = t_P.id_product 
			-- AND t_P.is_new = 0
	);
    
	SET v_id_permission_product = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
	
    IF a_debug = 1 THEN
		SELECT
			a_guid
			, a_id_user
			, FALSE AS a_get_inactive_user
			, v_id_permission_product
			, v_id_access_level_edit
			, v_ids_product_permission
			, 0 AS a_debug
		;
    END IF;
    
	CALL p_shop_calc_user(
		a_guid
        , a_id_user
        , FALSE -- a_get_inactive_user
        , v_id_permission_product
        , v_id_access_level_edit
        , v_ids_product_permission
        , 0 -- a_debug
	);
	
	UPDATE tmp_Permutation t_P
	INNER JOIN Shop_Product P ON t_P.id_product = P.id_product
	INNER JOIN Shop_Calc_User_Temp UE_T
		ON P.id_product = UE_T.id_product
		AND UE_T.GUID = a_guid
	SET 
		t_P.can_view = UE_T.can_view
		, t_P.can_edit = UE_T.can_edit
		, t_P.can_admin = UE_T.can_admin
	;
	
    IF a_debug = 1 THEN
		SELECT *
        FROM demo.Shop_Calc_User_Temp
        WHERE GUID = a_guid
        ;
        SELECT *
        FROM tmp_Permutation t_PP
        LEFT JOIN Shop_Product P ON t_PP.id_product = P.id_product
        ;
    END IF;

	IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.can_edit) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have product edit permission: ', GROUP_CONCAT(t_P.name_error SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE 
			ISNULL(t_P.can_edit)
		;
	END IF;

	IF EXISTS (SELECT * FROM demo.Shop_Calc_User_Temp WHERE ISNULL(id_product) AND GUID = a_guid AND can_edit = 0) THEN
		DELETE FROM tmp_Msg_Error
        WHERE id_type <> v_id_type_error_no_permission
        ;
        
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		VALUES (
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, 'You do not have permission to edit Product Permutations'
		)
		;
	END IF;
    
	CALL p_shop_clear_calc_user(
		a_guid
        , 0 -- a_debug
	);
	
	IF a_debug = 1 THEN
		SELECT *
		FROM demo.Shop_Product_Permutation_Variation_Link_Temp
		WHERE GUID = a_guid
		;
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		START TRANSACTION;
		
			INSERT INTO Shop_Product_Change_Set ( comment )
			VALUES ( a_comment )
			;
			
			SET v_id_change_set := LAST_INSERT_ID();
			
			INSERT INTO Shop_Product_Permutation (
				id_permutation_temp
				, id_product
				, description
				, cost_local_VAT_excl
				, cost_local_VAT_incl
				, id_currency_cost
				, profit_local_min
				, latency_manufacture
				, id_unit_measurement_quantity
				, count_unit_measurement_per_quantity_step
				, quantity_min
				, quantity_max
				, quantity_stock
				, is_subscription
				, id_unit_measurement_interval_recurrence
				, count_interval_recurrence
				, id_stripe_product
				, does_expire_faster_once_unsealed
				, id_unit_measurement_interval_expiration_unsealed
				, count_interval_expiration_unsealed
				, active
				, created_by
				, created_on
                , id_change_set
			)
			SELECT
				t_P.id_permutation
				, t_P.id_product AS id_product
				, t_P.description AS description
				, t_P.cost_local_VAT_excl AS cost_local_VAT_excl
				, t_P.cost_local_VAT_incl AS cost_local_VAT_incl
				, t_P.id_currency_cost AS id_currency_cost
				, t_P.profit_local_min AS profit_local_min
				, t_P.latency_manufacture AS latency_manufacture
				, t_P.id_unit_measurement_quantity AS id_unit_measurement_quantity
				, t_P.count_unit_measurement_per_quantity_step AS count_unit_measurement_per_quantity_step
				, t_P.quantity_min AS quantity_min
				, t_P.quantity_max AS quantity_max
				, t_P.quantity_stock AS quantity_stock
				, t_P.is_subscription AS is_subscription
				, t_P.id_unit_measurement_interval_recurrence AS id_unit_measurement_interval_recurrence
				, t_P.count_interval_recurrence AS count_interval_recurrence
				, t_P.id_stripe_product AS id_stripe_product
				, t_P.does_expire_faster_once_unsealed AS does_expire_faster_once_unsealed
				, t_P.id_unit_measurement_interval_expiration_unsealed AS id_unit_measurement_interval_expiration_unsealed
				, t_P.count_interval_expiration_unsealed AS count_interval_expiration_unsealed
				, t_P.active AS active
				, a_id_user AS created_by
				, v_time_start AS created_on
                , v_id_change_set AS id_change_set
			FROM tmp_Permutation t_P
			WHERE 
				is_new = 1
				AND active = 1
			;
			
			UPDATE Shop_Product_Permutation PP
			INNER JOIN tmp_Permutation t_P 
				ON PP.id_permutation = t_P.id_permutation
                AND t_P.is_new = 0
			SET 
				PP.id_product = t_P.id_product
				, PP.description = t_P.description
				, PP.cost_local_VAT_excl = t_P.cost_local_VAT_excl
				, PP.cost_local_VAT_incl = t_P.cost_local_VAT_incl
				, PP.id_currency_cost = t_P.id_currency_cost
				, PP.profit_local_min = t_P.profit_local_min
				, PP.latency_manufacture = t_P.latency_manufacture
				, PP.id_unit_measurement_quantity = t_P.id_unit_measurement_quantity
				, PP.count_unit_measurement_per_quantity_step = t_P.count_unit_measurement_per_quantity_step
				, PP.quantity_min = t_P.quantity_min
				, PP.quantity_max = t_P.quantity_max
				, PP.quantity_stock = t_P.quantity_stock
				, PP.is_subscription = t_P.is_subscription
				, PP.id_unit_measurement_interval_recurrence = t_P.id_unit_measurement_interval_recurrence
				, PP.count_interval_recurrence = t_P.count_interval_recurrence
				, PP.id_stripe_product = t_P.id_stripe_product
				, PP.does_expire_faster_once_unsealed = t_P.does_expire_faster_once_unsealed
				, PP.id_unit_measurement_interval_expiration_unsealed = t_P.id_unit_measurement_interval_expiration_unsealed
				, PP.count_interval_expiration_unsealed = t_P.count_interval_expiration_unsealed
				, PP.active = t_P.active
				, PP.id_change_set = v_id_change_set
			;
            
            UPDATE tmp_Permutation t_PP
            INNER JOIN demo.Shop_Product_Permutation PP 
				ON t_PP.id_permutation_temp = PP.id_permutation_temp
                AND PP.id_change_set = v_id_change_set
            SET
				t_PP.id_permutation = PP.id_permutation
			;
            UPDATE tmp_Permutation_Variation_Link t_PPVL
            INNER JOIN tmp_Permutation t_PP ON t_PPVL.id_permutation = t_PP.id_permutation_temp
            SET
				t_PPVL.id_permutation = t_PP.id_permutation
			;
            
            INSERT INTO demo.Shop_Product_Permutation_Variation_Link (
				id_permutation
                , id_variation
                , display_order
                , active
			)
            SELECT 
				t_PPVL.id_permutation
                , t_PPVL.id_variation
                , t_PPVL.display_order
                , t_PPVL.active
			FROM tmp_Permutation_Variation_Link t_PPVL
            WHERE 
				t_PPVL.is_new = 1
                AND t_PPVL.active = 1
            ;
            
            UPDATE demo.Shop_Product_Permutation_Variation_Link PPVL
            INNER JOIN tmp_Permutation_Variation_Link t_PPVL 
				ON PPVL.id_link = t_PPVL.id_link
                AND t_PPVL.is_new = 1
            SET
				PPVL.id_permutation = t_PPVL.id_permutation
                , PPVL.id_variation = t_PPVL.id_variation
                , PPVL.display_order = t_PPVL.display_order
                , PPVL.active = t_PPVL.active
                , PPVL.id_change_set = v_id_change_set
            ;
		
		COMMIT;
	END IF;
		
    START TRANSACTION;
    
		DELETE FROM Shop_Product_Permutation_Temp
		WHERE GUID = a_guid
        ;
        
		DELETE FROM demo.Shop_Product_Permutation_Variation_Link_Temp
		WHERE GUID = a_guid
        ;
	
	COMMIT;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
	INNER JOIN demo.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
	;
    
	IF a_debug = 1 THEN
		SELECT * FROM tmp_Permutation;
        SELECT * FROM tmp_Permutation_Variation_Link;
	END IF;

    DROP TEMPORARY TABLE tmp_Permutation_Variation_Link;
    DROP TEMPORARY TABLE tmp_Permutation;
    DROP TEMPORARY TABLE tmp_Msg_Error;
    
	IF a_debug = 1 THEN
		CALL demo.p_debug_timing_reporting ( v_time_start );
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


select * from shop_unit_measurement;

*/

