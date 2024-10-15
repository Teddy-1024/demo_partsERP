



-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_manufacturing_purchase_order;

DROP TABLE IF EXISTS tmp_Manufacturing_Purchase_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Msg_Error;

DELIMITER //
CREATE PROCEDURE p_shop_save_manufacturing_purchase_order (
	IN a_comment VARCHAR(500)
	, IN a_guid BINARY(36)
    , IN a_id_user INT
    , IN a_debug BIT
)
BEGIN
	DECLARE v_code_type_error_bad_data VARCHAR(50);
	DECLARE v_code_type_error_no_permission VARCHAR(50);
    DECLARE v_id_access_level_edit INT;
    DECLARE v_id_change_set INT;
    DECLARE v_id_permission_manufacturing_purchase_order INT;
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_type_error_no_permission INT;
	DECLARE v_ids_product_permission TEXT;
    DECLARE v_time_start TIMESTAMP(6);

    DECLARE exit handler for SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            @sqlstate = RETURNED_SQLSTATE
            , @errno = MYSQL_ERRNO
            , @text = MESSAGE_TEXT
		;
        
        ROLLBACK;
        
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
    SET v_code_type_error_bad_data := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'BAD_DATA');
    SET v_id_type_error_bad_data := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data);
    SET v_code_type_error_no_permission := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
    SET v_id_type_error_no_permission := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_type_error_no_permission);
	SET v_id_permission_manufacturing_purchase_order = (SELECT id_permission FROM partsltd_prod.Shop_Permission WHERE code = 'STORE_SUPPLIER_PURCHASE_ORDER' LIMIT 1);
	SET v_id_access_level_edit = (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'EDIT');
    
	CALL p_validate_guid ( a_guid );
	SET a_comment := TRIM(IFNULL(a_comment, ''));
    
	DROP TEMPORARY TABLE IF EXISTS tmp_Manufacturing;
	DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;

    -- Temporary tables
    CREATE TEMPORARY TABLE tmp_Manufacturing_Purchase_Order (
		id_order INT NOT NULL PRIMARY KEY
		, id_currency_cost INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Manufacturing_Purchase_Order_Product_Link (
		id_link INT NOT NULL PRIMARY KEY
		, id_order INT NOT NULL
        , id_permutation INT NOT NULL
		, id_currency_cost INT NOT NULL
		, quantity_ordered FLOAT NOT NULL
		, id_unit_quantity INT NOT NULL
		, quantity_received FLOAT NULL
		, latency_delivery_days INT NOT NULL
		, display_order INT NOT NULL
        , active BIT NOT NULL
        , name_error VARCHAR(200) NOT NULL
		, cost_total_local_VAT_excl FLOAT NOT NULL
		, cost_total_local_VAT_incl FLOAT NOT NULL
		, cost_unit_local_VAT_excl FLOAT NOT NULL
		, cost_unit_local_VAT_incl FLOAT NOT NULL
		, has_order BIT NULL
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
		, id_type INT NOT NULL
        , code VARCHAR(50) NOT NULL
        , msg VARCHAR(4000) NOT NULL
	);
    
	INSERT INTO tmp_Manufacturing_Purchase_Order (
		id_order
		, id_currency_cost
	)
	SELECT
		SPO_T.id_order
		, IFNULL(IFNULL(SPO_T.id_currency_cost, MPO.id_currency_cost), 0) AS id_currency_cost
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Temp SPO_T
	LEFT JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO ON SPO_T.id_order = MPO.id_order
	WHERE SPO_T.GUID = a_guid
	;

	INSERT INTO tmp_Manufacturing_Purchase_Order_Product_Link (
		id_link
		, id_order
		, id_permutation
		, id_currency_cost
		, quantity_ordered
		, id_unit_quantity
		, quantity_received
		, latency_delivery_days
		, display_order
		, active
		, name_error
		, is_new
		, cost_total_local_VAT_excl
		, cost_total_local_VAT_incl
		, cost_unit_local_VAT_excl
		, cost_unit_local_VAT_incl
		, has_order
	)
	SELECT 
		IFNULL(SPOPL_T.id_link, 0) AS id_link
		, IFNULL(IFNULL(SPOPL_T.id_order, MPOPL.id_order) 0) AS id_order
		, IFNULL(IFNULL(SPOPL_T.id_permutation, MPOPL.id_permutation), 0) AS id_permutation
		, IFNULL(IFNULL(SPOPL_T.id_currency_cost, MPOPL.id_currency_cost) 0) AS id_currency_cost
		, IFNULL(IFNULL(SPOPL_T.quantity_ordered, MPOPL.quantity_ordered), 0) AS quantity_ordered
		, IFNULL(IFNULL(SPOPL_T.id_unit_quantity, MPOPL.id_unit_quantity), 0) AS id_unit_quantity
		, IFNULL(SPOPL_T.quantity_received, MPOPL.quantity_received) AS quantity_received
		, IFNULL(SPOPL_T.latency_delivery_days, MPOPL.latency_delivery_days) AS latency_delivery_days
		, RANK() OVER (PARTITION BY IFNULL(IFNULL(SPOPL_T.id_order, MPOPL.id_order) 0) ORDER BY IFNULL(IFNULL(SPOPL_T.display_order, MPOPL.display_order), 0)) AS display_order
		, IFNULL(IFNULL(SPOPL_T.active, MPOPL.active), 1) AS active
		, CONCAT(
			fn_shop_get_product_permutation_name(SPOPL_T.id_permutation)
			, ' - x'
			, IFNULL(SPOPL_T.quantity_ordered, '(No Quantity)')
		) AS name_error
	    , IFNULL(SPOPL_T.id_link, 0) < 1 AS is_new
		, IFNULL(IFNULL(SPOPL_T.cost_total_local_VAT_excl, MPOPL.cost_total_local_VAT_excl), 0) AS cost_total_local_VAT_excl
		, IFNULL(IFNULL(SPOPL_T.cost_total_local_VAT_incl, MPOPL.cost_total_local_VAT_incl), 0) AS cost_total_local_VAT_incl
		, IFNULL(SPOPL_T.cost_total_local_VAT_excl / SPOPL_T.quantity_ordered, MPOPL.cost_unit_local_VAT_excl) AS cost_unit_local_VAT_excl
		, IFNULL(SPOPL_T.cost_total_local_VAT_incl / SPOPL_T.quantity_ordered, MPOPL.cost_unit_local_VAT_incl) AS cost_unit_local_VAT_incl
		, NOT ISNULL(t_MPO.id_order) AS has_order
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link_Temp SPOPL_T
	LEFT JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link MPOPL ON SPOPL_T.id_link = MPOPL.id_link
	LEFT JOIN tmp_Manufacturing_Purchase_Order t_MPO ON SPOPL_T.id_order = t_MPO.id_order
	WHERE SPOPL_T.GUID = a_guid
	;

	INSERT INTO tmp_Manufacturing_Purchase_Order (
		id_order
		, id_currency_cost
	)
	SELECT
		SPO_T.id_order
		, IFNULL(IFNULL(SPO_T.id_currency_cost, MPO.id_currency_cost), 0) AS id_currency_cost
	FROM partsltd_prod.Shop_Manufacturing_Purchase_Order MPO
	INNER JOIN tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL 
		ON MPO.id_order = t_MPOPL.id_order
		AND t_MPOPL.has_order = 0
	;

    -- Validation
	-- Manufacturing Purchase Order
    # id_order
    IF EXISTS (
		SELECT * 
        FROM tmp_Manufacturing_Purchase_Order t_MPO
        LEFT JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO ON t_MPO.id_order = MPO.id_order
        WHERE 1=1
			AND t_MPO.id_order > 0
			AND ISNULL(MPO.id_order)
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
				'A valid ID is required for the following Manufacturing Purchase Order(s): '
				, GROUP_CONCAT(CONCAT(IFNULL(t_MPO.id_stock, '(No Manufacturing Purchase Order)')) SEPARATOR ', ')
			) AS msg
		FROM tmp_Stock_Item t_SPO
        LEFT JOIN partsltd_prod.Shop_Manufacturing_Purchase_Order MPO ON t_MPO.id_order = MPO.id_order
        WHERE 1=1
			AND t_MPO.id_stock > 0
			AND ISNULL(MPO.id_stock)
		;
    END IF;
    # id_currency_cost
    IF EXISTS (
		SELECT * 
        FROM tmp_Manufacturing_Purchase_Order t_MPO
        LEFT JOIN partsltd_prod.Shop_Currency C ON t_MPO.id_currency_cost = C.id_currency
        WHERE 1=1
			AND (
				ISNULL(C.id_currency)
				OR C.active = 0
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
			, CONCAT(
				'A valid currency is required for the following Manufacturing Purchase Order(s): '
				, GROUP_CONCAT(CONCAT(IFNULL(t_MPO.id_stock, '(No Manufacturing Purchase Order)'), ' - ', t_MPO.id_currency_cost) SEPARATOR ', ')
			) AS msg
		FROM tmp_Stock_Item t_SPO
        LEFT JOIN partsltd_prod.Shop_Currency C ON t_MPO.id_currency_cost = C.id_currency
        WHERE 1=1
			AND (
				ISNULL(C.id_currency)
				OR C.active = 0
			)
		;
    END IF;
    # id_unit_quantity
    IF EXISTS (
		SELECT * 
        FROM tmp_Manufacturing_Purchase_Order t_MPO
        LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM ON t_MPO.id_unit_quantity = UM.id_unit_measurement
        WHERE 1=1
			AND (
				ISNULL(UM.id_unit_measurement)
				OR UM.active = 0
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
			, CONCAT(
				'A valid unit measurement of quantity is required for the following Manufacturing Purchase Order(s): '
				, GROUP_CONCAT(CONCAT(IFNULL(t_MPO.id_stock, '(No Manufacturing Purchase Order)'), ' - ', t_MPO.id_currency_cost) SEPARATOR ', ')
			) AS msg
		FROM tmp_Stock_Item t_SPO
        LEFT JOIN partsltd_prod.Shop_Unit_Measurement UM ON t_MPO.id_unit_quantity = UM.id_unit_measurement
        WHERE 1=1
			AND (
				ISNULL(UM.id_unit_measurement)
				OR UM.active = 0
			)
		;
    END IF;
	# Invalid quantity ordered
	IF EXISTS (
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link 
		WHERE 
			ISNULL(t_MPOPL.quantity_ordered)
			OR t_MPOPL.quantity_ordered <= 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'A valid quantity ordered is required for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(t_MPOPL.name_error SEPARATOR ', ')
			)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE 
			ISNULL(t_MPOPL.quantity_ordered)
			OR t_MPOPL.quantity_ordered <= 0
		;
	END IF;
	# Invalid quantity received
	IF EXISTS (
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link 
		WHERE t_MPOPL.quantity_received < 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'A valid quantity received is required for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(t_MPOPL.name_error, ' - ', t_MPOPL.quantity_received SEPARATOR ', ')
			)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE t_MPOPL.quantity_received < 0
		;
	END IF;
	# Invalid delivery latency
	IF EXISTS (
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link 
		WHERE t_MPOPL.latency_delivery_days < 0
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'A valid delivery latency is required for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(t_MPOPL.name_error, ' - ', t_MPOPL.latency_delivery_days SEPARATOR ', ')
			)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE t_MPOPL.latency_delivery_days < 0
		;
	END IF;
    
    -- Duplicates
	IF EXISTS (
		SELECT 
			id_permutation
			, name_error
			, COUNT(*)
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL 
		GROUP BY id_permutation 
		HAVING COUNT(*) > 1
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT('Duplicate records: ', GROUP_CONCAT(t_SPOPLC.name_error SEPARATOR ', '))
		FROM (
			SELECT 
				id_permutation
				, name_error
				, COUNT(*) 
			FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL 
			GROUP BY id_permutation 
			HAVING COUNT(*) > 1
		) t_SPOPLC
		;
	END IF;
	-- Empty Manufacturing Purchase Order
	IF EXISTS ( SELECT * FROM tmp_Manufacturing_Purchase_Order t_MPO LEFT JOIN tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL ON t_MPO.id_order = t_MPOPL.id_order WHERE ISNULL(t_MPOPL.id_order) ) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'There are no items in the following Manufacturing Purchase Order(s): '
				, GROUP_CONCAT(t_MPO.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Manufacturing_Purchase_Order t_MPO 
		LEFT JOIN tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL ON t_MPO.id_order = t_MPOPL.id_order 
		WHERE ISNULL(t_MPOPL.id_order)
		;
	END IF;
	
	-- Manufacturing Purchase Order Items without Order
	IF EXISTS ( 
		SELECT * 
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL 
		LEFT JOIN tmp_Manufacturing_Purchase_Order t_MPO ON t_MPOPL.id_order = t_MPO.id_order
		WHERE ISNULL(t_MPO.id_order) 
	) THEN
		INSERT INTO tmp_Msg_Error ( 
			id_type, code, msg
		)
		SELECT
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			CONCAT(
				'There is no order for the following Manufacturing Purchase Order Item(s): '
				, GROUP_CONCAT(t_MPOPL.name_error SEPARATOR ', ')
			) AS msg
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL 
		LEFT JOIN tmp_Manufacturing_Purchase_Order t_MPO ON t_MPOPL.id_order = t_MPO.id_order
		WHERE ISNULL(t_MPO.id_order) 
		;
	END IF;
    
    -- Permissions
	SET v_ids_product_permission := (
		SELECT 
			GROUP_CONCAT(DISTINCT PP.id_product SEPARATOR ',')
		FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		INNER JOIN partsltd_prod.Shop_Product_Permutation PP ON t_MPOPL.id_permutation = PP.id_permutation
	);
	IF a_debug = 1 THEN
		SELECT 
			v_guid
			, a_id_user
			, FALSE -- get inactive users
			, v_id_permission_manufacturing_purchase_order
			, v_id_access_level_edit
			, v_ids_product_permission -- ids_product
			, 0 -- a_debug
		;
		SELECT * from partsltd_prod.Shop_Calc_User_Temp;
	END IF;
	
	CALL p_shop_calc_user(
		v_guid
		, a_id_user
		, FALSE -- get inactive users
		, v_id_permission_manufacturing_purchase_order
		, v_id_access_level_edit
		, v_ids_product_permission -- ids_product
		, 0 -- a_debug
	);
	
	IF a_debug = 1 THEN
		SELECT * from partsltd_prod.Shop_Calc_User_Temp WHERE GUID = a_guid;
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
			CONCAT('You do not have view permissions for ', (SELECT name FROM partsltd_prod.Shop_Permission WHERE id_permission = v_id_permission_manufacturing LIMIT 1))
		)
		;
	END IF;

	CALL partsltd_prod.p_shop_clear_calc_user( a_guid );
    
	IF EXISTS ( SELECT * FROM tmp_Msg_Error LIMIT 1 ) THEN
		DELETE FROM tmp_Manufacturing;
	END IF;
	
	-- Transaction    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		START TRANSACTION;
			INSERT INTO Shop_Sales_And_Purchasing_Change_Set (
				comment
				, updated_last_by
				, updated_last_on
			)
			VALUES (
				a_comment
				, a_id_user
				, v_time_start
			);
			
			SET v_id_change_set := LAST_INSERT_ID();
		
			INSERT INTO partsltd_prod.Shop_Manufacturing_Purchase_Order (
				id_currency_cost
				, cost_total_local_VAT_excl
				, cost_total_local_VAT_incl
				, created_by
				, created_on
				, id_change_set
				, active
			)
			SELECT
				t_MPO.id_currency_cost
				, SUM(t_MPOPL.cost_total_local_VAT_excl)
				, SUM(t_MPOPL.cost_total_local_VAT_incl)
				, t_MPO.active
				, a_id_user
				, v_time_start
				, v_id_change_set
			FROM tmp_Manufacturing_Purchase_Order t_MPO
			INNER JOIN tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL ON t_MPO.id_order = t_MPOPL.id_order
			WHERE t_MPOPL.is_new = 1
			;
			
			INSERT INTO Shop_Manufacturing_Purchase_Order_Product_Link (
				id_order
				, id_permutation
				, id_currency_cost
				, id_unit_quantity
				, quantity_ordered
				, quantity_received
				, latency_delivery_days
				, display_order
				, active
				, cost_total_local_VAT_excl
				, cost_total_local_VAT_incl
				, created_by
				, id_change_set
			)
			SELECT
				t_MPOPL.id_order
				, t_MPOPL.id_permutation
				, t_MPOPL.id_currency_cost
				, t_MPOPL.id_unit_quantity
				, t_MPOPL.quantity_ordered
				, t_MPOPL.quantity_received
				, t_MPOPL.latency_delivery_days
				, t_MPOPL.display_order
				, t_MPOPL.active
				, t_MPOPL.cost_total_local_VAT_excl
				, t_MPOPL.cost_total_local_VAT_incl
				a_id_user
				v_id_change_set
			FROM tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
			WHERE t_MPOPL.is_new = 1
			;
		
			UPDATE partsltd_prod.Shop_Manufacturing_Purchase_Order MPO
			INNER JOIN tmp_Manufacturing_Purchase_Order t_MPO 
				ON MPO.id_order = t_MPO.id_order
				AND t_MPO.is_new = 0
			INNER JOIN tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL ON t_MPO.id_order = t_MPOPL.id_order
			SET
				MPO.id_currency_cost = id_currency_cost
				, MPO.cost_total_local_VAT_excl = SUM(t_MPOPL.cost_total_local_VAT_excl)
				, MPO.cost_total_local_VAT_incl = SUM(t_MPOPL.cost_total_local_VAT_incl)
				, MPO.active = a_active
				, MPO.id_change_set = v_id_change_set
			;
			
			UPDATE partsltd_prod.Shop_Manufacturing_Purchase_Order_Product_Link MPOPL
			INNER JOIN tmp_Manufacturing_Purchase_Order_Product_Link t_MPOPL
				ON MPOPL.id_link = t_MPOPL.id_link
				AND t_MPOPL.is_new = 0
			SET
				MPOPL.id_order = t_MPOPL.id_order,
				MPOPL.id_permutation = t_MPOPL.id_permutation,
				MPOPL.id_currency_cost = t_MPOPL.id_currency_cost,
				MPOPL.id_unit_quantity = t_MPOPL.id_unit_quantity,
				MPOPL.quantity_ordered = t_MPOPL.quantity_ordered,
				MPOPL.quantity_received = t_MPOPL.quantity_received,
				MPOPL.latency_delivery_days = t_MPOPL.latency_delivery_days,
				MPOPL.display_order = t_MPOPL.display_order,
				MPOPL.active = t_MPOPL.active,
				MPOPL.cost_total_local_VAT_excl = t_MPOPL.cost_total_local_VAT_excl,
				MPOPL.cost_total_local_VAT_incl = t_MPOPL.cost_total_local_VAT_incl,
				MPOPL.id_change_set = v_id_change_set
			;
		
			DELETE SPO_T
			FROM Shop_Manufacturing_Purchase_Order_Temp SPO_T
			WHERE SPO_T.GUID = a_guid
			;
			DELETE SPOPL_T
			FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp SPOPL_T
			WHERE SPOPL_T.GUID = a_guid
			;
			
		COMMIT;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
	INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
	;
    
	IF a_debug = 1 THEN
		SELECT * from tmp_Manufacturing;
	END IF;

    DROP TEMPORARY TABLE tmp_Manufacturing_Purchase_Order;
    DROP TEMPORARY TABLE tmp_Manufacturing_Purchase_Order_Product_Link;
    DROP TEMPORARY TABLE tmp_Msg_Error;
    
	IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
	END IF;
END //
DELIMITER ;;


/*

DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;
DELETE FROM Shop_Manufacturing_Purchase_Order_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order;

INSERT INTO Shop_Manufacturing_Purchase_Order_Product_Link_Temp (
	guid,
    id_link,
    id_order,
	id_permutation,
	cost_total_local,
	id_currency_cost,
	quantity_ordered,
	id_unit_quantity,
	quantity_received,
	latency_delivery_days,
	display_order,
    active
)
VALUES
	(
		'NIPS', # guid
		-1, # id_link,
		-1, # id_order,
		1, # id_permutation,
		100, # cost_total_local,
		1, # id_currency_cost,
		1, # quantity_ordered,
		1, # id_unit_quantity,
		1, # quantity_received,
		14, # latency_delivery_days ,
		1, # display_order
        1 # active
    )
;

SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

CALL p_shop_save_manufacturing_purchase_order (
	'TEST SAVE'
	, 'NIPS' # a_guid
    , 1 -- 'auth0|6582b95c895d09a70ba10fef', # a_id_user
	, 1 -- a_debug
);

SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;
DELETE FROM Shop_Manufacturing_Purchase_Order_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order;


*/

