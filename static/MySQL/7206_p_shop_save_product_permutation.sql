

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_permutation;
DROP PROCEDURE IF EXISTS p_shop_save_product_permutation;

DELIMITER //
CREATE PROCEDURE p_shop_save_product_permutation (
    IN a_comment VARCHAR(500),
	IN a_guid BINARY(36),
    IN a_id_user INT
)
BEGIN
    
	DECLARE v_code_type_error_bad_data VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_permission_product INT;
    DECLARE v_ids_product_permission LONGTEXT;
    DECLARE v_id_change_set INT;
    DECLARE v_id_access_level_edit INT;
    DECLARE v_now DATETIME;
    
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
			, guid BINARY(36) NOT NULL
			, id_type INT NULL
			, code VARCHAR(50) NOT NULL
			, msg VARCHAR(4000) NOT NULL
		);
        INSERT INTO tmp_Msg_Error (
			guid
            , id_type
            , code
            , msg
		)
        SELECT 
			a_guid
            , NULL
            , @errno
            , @text
		;
        SELECT *
        FROM tmp_Msg_Error;
		DROP TABLE IF EXISTS tmp_Msg_Error;
    END;
    
    SET v_code_type_error_bad_data := 'BAD_DATA';
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_id_access_level_edit := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    
    SET a_guid := IFNULL(a_guid, UUID());
    
    DROP TABLE IF EXISTS tmp_Permutation;
    
    CREATE TEMPORARY TABLE tmp_Permutation (
		id_permutation INT NOT NULL
		, id_product INT NOT NULL
		, description VARCHAR(4000) NOT NULL
		, cost_local FLOAT NOT NULL
		, id_currency_cost INT NOT NULL
		, profit_local_min FLOAT NOT NULL
		, latency_manufacture_days INT NOT NULL
		, id_unit_measurement_quantity INT NOT NULL
		, count_unit_measurement_per_quantity_step FLOAT NOT NULL
		, quantity_min FLOAT NOT NULL
		, quantity_max FLOAT NOT NULL
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
        
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
        , guid BINARY(36) NOT NULL
		, id_type INT NULL
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
        
    
    -- Get data from Temp table
    INSERT INTO tmp_Permutation (
		id_permutation
		, id_product
		, description
		, cost_local
		, id_currency_cost
		, profit_local_min
		, latency_manufacture_days
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
		, IFNULL(PP_T.id_product, PP.id_product) AS id_product
        , IFNULL(PP_T.description, PP.description) AS description
		, IFNULL(PP_T.cost_local, PP.cost_local) AS cost_local
		, IFNULL(PP_T.id_currency_cost, PP.id_currency_cost) AS a_id_currency_cost
		, IFNULL(PP_T.profit_local_min, PP.profit_local_min) AS profit_local_min
		, IFNULL(PP_T.latency_manufacture_days, PP.latency_manufacture_days) AS latency_manufacture_days
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
		, fn_shop_get_product_permutation_name(PP_T.id_permutation)
        , CASE WHEN IFNULL(PP_T.id_permutation, 0) < 1 THEN 1 ELSE 0 END AS is_new
	FROM Shop_Product_Permutation_Temp PP_T
    LEFT JOIN Shop_Product_Permutation PP ON PP_T.id_permutation = PP.id_permutation
    WHERE PP_T.guid = a_guid
    ;
    
    -- Validation
    -- Missing mandatory fields
    -- id_product
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.id_product) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, id_product
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a product: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.id_product)
		;
    END IF;
    -- cost_local
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.cost_local) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, cost_local
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a local cost: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.cost_local)
		;
    END IF;
    -- profit_local_min 
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.profit_local_min) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, profit_local_min
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a local minimum profit: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.profit_local_min)
		;
    END IF;
    -- 	latency_manufacture_days
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.latency_manufacture_days) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, latency_manufacture_days
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a manufacturing latency: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.latency_manufacture_days)
		;
    END IF;
    -- id_unit_measurement_quantity
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.id_unit_measurement_quantity) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, id_unit_measurement_quantity
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a unit measurement for stock quantities: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.id_unit_measurement_quantity)
		;
    END IF;
    -- 	count_unit_measurement_per_quantity_step
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.count_unit_measurement_per_quantity_step) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, count_unit_measurement_per_quantity_step
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a count unit measurement per quantity step: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.count_unit_measurement_per_quantity_step)
		;
    END IF;
    -- quantity_min
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.quantity_min) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, quantity_min
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a minimum quantity: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.quantity_min)
		;
    END IF;
    -- 	quantity_max
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.quantity_max) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, quantity_max
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a maximum quantity: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.quantity_max)
		;
    END IF;
    -- is_subscription
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.is_subscription) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, is_subscription
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have an is subscription?: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.is_subscription)
		;
    END IF;
    -- does_expire_faster_once_unsealed
    IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.does_expire_faster_once_unsealed) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			guid
			, id_type
			, does_expire_faster_once_unsealed
			, msg
		)
		SELECT
			a_guid AS GUID
			, v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following product permutation(s) do not have a does expire faster once unsealed: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
		FROM tmp_Permutation t_P
		WHERE ISNULL(t_P.does_expire_faster_once_unsealed)
		;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN -- (SELECT * FROM tmp_Product WHERE is_new = 0 LIMIT 1) THEN
        SET v_ids_product_permission := (
			SELECT GROUP_CONCAT(P.id_product SEPARATOR ',') 
            FROM Shop_Product P 
            INNER JOIN tmp_Permutation t_P
				ON P.id_product = t_P.id_product 
                -- AND t_P.is_new = 0
		);
        IF NOT ISNULL(v_ids_product_permission) THEN
			SET v_id_permission_product = (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
			
			CALL p_shop_calc_user(a_guid, a_id_user, FALSE, v_id_permission_product, v_id_access_level_edit, v_ids_product_permission);
			
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
			
			CALL p_shop_clear_calc_user(a_guid);

			IF EXISTS (SELECT * FROM tmp_Permutation t_P WHERE ISNULL(t_P.can_edit) LIMIT 1) THEN
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
					, CONCAT('The following product permutation(s) do not have product edit permission: ', GROUP_CONCAT(IFNULL(t_P.name_error, 'NULL') SEPARATOR ', ')) AS msg
				FROM tmp_Permutation t_P
				WHERE ISNULL(t_P.can_edit)
				;
			END IF;
		END IF;
    END IF;
    
    SET v_now := CURRENT_DATETIME();
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		START TRANSACTION;
		
		IF NOT ISNULL(v_ids_product_permission) THEN
			INSERT INTO Shop_Product_Change_Set ( comment )
			VALUES ( a_comment )
			;
			
			SET v_id_change_set := LAST_INSERT_ID();
			
			UPDATE Shop_Product_Permutation PP
			INNER JOIN tmp_Permutation t_P ON PP.id_permutation = t_P.id_permutation
			SET 
				PP.id_product = t_P.id_product
				, PP.description = t_P.description
				, PP.cost_local = t_P.cost_local
				, PP.id_currency_cost = t_P.id_currency_cost
				, PP.profit_local_min = t_P.profit_local_min
				, PP.latency_manufacture_days = t_P.latency_manufacture_days
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
		END IF;
		
		INSERT INTO Shop_Product_Permutation (
			id_product
			, description
			, cost_local
			, id_currency_cost
			, profit_local_min
			, latency_manufacture_days
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
		)
		SELECT
			t_P.id_product AS id_product
			, t_P.description AS description
			, t_P.cost_local AS cost_local
			, t_P.id_currency_cost AS id_currency_cost
			, t_P.profit_local_min AS profit_local_min
			, t_P.latency_manufacture_days AS latency_manufacture_days
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
			, v_now AS created_on
		FROM tmp_Permutation t_P
		WHERE 
			is_new = 1
			AND active = 1
		;
    
		DELETE FROM Shop_Product_Permutation_Temp
		WHERE GUID = a_guid;
		
		COMMIT;
    END IF;
    
    SELECT * FROM tmp_Msg_Error;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_Permutation;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
END //
DELIMITER ;;


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
	latency_manufacture_days,
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
		, 14 -- latency_manufacture_days,
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
