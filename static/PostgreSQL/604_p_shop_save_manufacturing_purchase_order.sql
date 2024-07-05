



-- DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order_Product_Link;
-- DROP TABLE IF EXISTS tmp_Msg_Error;

CREATE OR REPLACE PROCEDURE p_shop_save_manufacturing_purchase_order (
	IN a_guid UUID,
    IN a_id_user INTEGER,
    IN a_id_order INTEGER,
    -- IN a_id_supplier_ordered INTEGER,
    IN a_id_currency_cost INTEGER,
    IN a_active BOOLEAN,
    IN a_comment UUID
)
AS $$
DECLARE
	v_guid UUID;
    v_id_user INTEGER;
	v_comment VARCHAR(4000);
    v_id_order INTEGER;
    v_id_currency_cost INTEGER;
    v_active BOOLEAN;
    v_id_error_type_bad_data INTEGER;
    v_code_error_type_bad_data VARCHAR(50);
    v_id_error_type_no_permission INTEGER;
    v_code_error_type_no_permission VARCHAR(50);
    v_guid_permission UUID;
    -- v_id_user VARCHAR(100);
    v_id_permission_manufacturing_purchase_order INTEGER;
	v_id_access_level_EDIT INTEGER;
    v_ids_product VARCHAR(4000);
    v_ids_product_no_permission VARCHAR(4000);
    -- v_id_order_new INTEGER;
    v_id_change_set INTEGER;
    v_is_new_manufacturing_purchase_order BOOLEAN;
	result_errors REFCURSOR;
BEGIN
	-- SET SESSION sql_mode = sys.list_drop(@@session.sql_mode, 'ONLY_FULL_GROUP_BY');
    
	v_guid := COALESCE(a_guid, gen_random_uuid());
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_comment := TRIM(COALESCE(a_comment, ''));
	v_id_order := COALESCE(a_id_order, -1);
	v_id_currency_cost := a_id_currency_cost;
	v_active := COALESCE(a_active, FALSE); 
    
    v_code_error_type_bad_data = 'BAD_DATA';
    v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_bad_data LIMIT 1);
    v_code_error_type_no_permission = 'NO_PERMISSION';
    v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_no_permission LIMIT 1);
	v_guid_permission = gen_random_uuid();
	-- v_id_user = CURRENT_USER;
	v_id_permission_manufacturing_purchase_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_MANUFACTURING_PURCHASE_ORDER' LIMIT 1);
	v_id_access_level_EDIT := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT');
	v_is_new_manufacturing_purchase_order := CASE WHEN v_id_order <= 0 THEN TRUE ELSE FALSE END;
    
    -- Temporary tables
    /*
    CREATE TABLE tmp_Shop_Supplier_Purchase_Order (
		id_order INTEGER NOT NULL PRIMARY KEY,
		id_supplier_ordered INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Supplier_Purchase_Order_id_supplier_ordered
			FOREIGN KEY (id_supplier_ordered) 
			REFERENCES Shop_Supplier(id_supplier),
		cost_total_local REAL NOT NULL,
		id_currency_cost INTEGER NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Manufacturing_Purchase_Order_Product_Link (
		id_link INTEGER NOT NULL PRIMARY KEY,
		id_order INTEGER NOT NULL,
        /*
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_Manufacturing_Purchase_Order(id_order),
		*/
        id_permutation INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Manuf_Purch_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		cost_total_local REAL NOT NULL,
		id_currency_cost INTEGER NOT NULL,
        value_produced_total_local REAL NOT NULL,
		quantity_used REAL NOT NULL,
		id_unit_quantity INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Manuf_Purch_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_produced REAL NULL,
		latency_manufacture_days INTEGER NOT NULL,
		display_order INTEGER NOT NULL,
        active BOOLEAN NOT NULL,
        name_error VARCHAR(200) NOT NULL
    );
    
	/*
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        guid UUID NOT NULL,
		id_type INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    */

    
    -- Argument validation
    -- User ID
	IF NOT EXISTS (SELECT * FROM Shop_User WHERE id_user = v_id_user) THEN
		RAISE EXCEPTION 'Invalid User ID: %', COALESCE(v_id_user, 'NULL')
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Order ID
	IF ((v_id_order > 0) AND NOT EXISTS (SELECT * FROM Shop_Manufacturing_Purchase_Order WHERE id_order = v_id_order)) THEN
		RAISE EXCEPTION 'Invalid Manufacturing Purchase Order ID: %', COALESCE(v_id_order, 'NULL')
		USING ERRCODE = '22000'
		;
	END IF;

    /*
    -- Supplier ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(v_id_supplier_ordered) OR NOT EXISTS (SELECT * FROM Shop_Supplier WHERE id_supplier = v_id_supplier_ordered) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(v_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid supplier ID: ', COALESCE(v_id_supplier_ordered, 'NULL')))
			;
		END IF;
    END IF;
    */
    
    -- Currency ID
	IF ISNULL(v_id_currency_cost) OR NOT EXISTS (SELECT * FROM Shop_Currency WHERE id_currency = v_id_currency_cost) THEN
		RAISE EXCEPTION 'Invalid currency ID: %', COALESCE(v_id_currency, 'NULL')
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Comment
	IF v_comment = '' THEN
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, code, msg
		)
		VALUES
			(v_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, 'A comment must be provided.')
		;
		*/
		RAISE EXCEPTION 'A comment must be provided.'
		USING ERRCODE = '22000'
		;
	END IF;
    

	-- Get data from Temp table	
	INSERT INTO tmp_Shop_Manufacturing_Purchase_Order_Product_Link (
		id_link, 
		id_order, 
		id_permutation, 
		cost_total_local, 
		id_currency_cost, 
		quantity_used, 
		id_unit_quantity, 
		quantity_produced, 
		value_produced_total_local,
		latency_manufacture_days, 
		display_order, 
		active,
		name_error
	)
	SELECT 
		MPOPL_T.id_link, 
		MPOPL_T.id_order, 
		MPOPL_T.id_permutation, 
		PP.cost_local * MPOPL_T.quantity_used AS cost_total_local, 
		MPOPL_T.id_currency_cost, 
		MPOPL_T.quantity_used, 
		MPOPL_T.id_unit_quantity, 
		MPOPL_T.quantity_produced, 
		(PP.cost_local + PP.profit_local_min) * MPOPL_T.quantity_produced AS value_produced_total_local,
		MPOPL_T.latency_manufacture_days, 
		MPOPL_T.display_order, 
		MPOPL_T.active,
		PP.id_permutation, ' - ' || COALESCE(P.name ,'') AS name_error
	FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp MPOPL_T
	INNER JOIN Shop_Product_Permutation PP ON MPOPL_T.id_permutation = PP.id_permutation
	INNER JOIN Shop_Product P ON PP.id_product = P.id_product
	WHERE MPOPL_T.GUID = v_guid
	-- GROUP BY MPOPL_T.id_order, name_error, MPOPL_T.id_link
	/*
	group by 
		MPOPL_T.id_link, 
		MPOPL_T.id_order, 
		MPOPL_T.id_permutation, 
		cost_total_local, 
		MPOPL_T.id_currency_cost, 
		MPOPL_T.quantity_used, 
		MPOPL_T.id_unit_quantity, 
		MPOPL_T.quantity_produced, 
		value_produced_total_local,
		MPOPL_T.latency_manufacture_days, 
		MPOPL_T.display_order, 
		MPOPL_T.active,
		name_error
	*/
	-- GROUP BY id_link, P.id_product, PP.id_permutation
	-- GROUP BY name_error, ID_LINK, cost_total_local, value_produced_total_local
	;
	DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp MPOPL_T
	WHERE MPOPL_T.GUID = v_guid
	;
    
    -- Invalid quantity used
	IF EXISTS (
		SELECT * 
		FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link 
		WHERE 
			NOT ISNULL(quantity_used)
			AND quantity_used < 0
	) THEN
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, code, msg
		)
		SELECT
			v_guid, 
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			'Invalid quantity used property for the following permutations: ' || STRING_AGG(t_MPOPL.name_error, ', ')
		FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE t_MPOPL.quantity_used < 0
		;
		*/
		RAISE EXCEPTION 'Invalid quantity used property for the following permutations: %', (
			SELECT STRING_AGG(t_MPOPL.name_error, ', ')
			FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
			WHERE t_MPOPL.quantity_used < 0
		)
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Invalid quantity produced
	IF EXISTS (
		SELECT * 
		FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link 
		WHERE 
			NOT ISNULL(quantity_produced)
			AND quantity_produced < 0
	) THEN
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, code, msg
		)
		SELECT
			v_guid, 
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			'Invalid quantity produced property for the following permutations: ' || STRING_AGG(t_MPOPL.name_error, ', ')
		FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
		WHERE t_MPOPL.quantity_produced < 0
		;
		*/
		RAISE EXCEPTION 'Invalid quantity produced property for the following permutations: %', (
			SELECT STRING_AGG(t_MPOPL.name_error, ', ')
			FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
			WHERE t_MPOPL.quantity_produced < 0
		)
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Duplicates
	IF EXISTS (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL GROUP BY id_permutation HAVING COUNT(*) > 1) THEN
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, code, msg
		)
		SELECT
			v_guid, 
			v_id_error_type_bad_data, 
			v_code_error_type_bad_data, 
			'Duplicate records: ' || STRING_AGG(t_MPOPLC.name_error, ', ')
		FROM (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL GROUP BY id_permutation HAVING COUNT(*) > 1) t_MPOPLC
		;
		*/
		RAISE EXCEPTION 'Duplicate records: %', (
			SELECT STRING_AGG(t_MPOPLC.name_error, ', ')
			FROM (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL GROUP BY id_permutation HAVING COUNT(*) > 1) t_MPOPLC
		)
		USING ERRCODE = '22000'
		;
	END IF;
    
    
    -- Permissions
	v_ids_product := (
		SELECT STRING_AGG(DISTINCT PP.id_product, ',')
		FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPO
		INNER JOIN Shop_Product_Permutation PP ON t_MPO.id_permutation = PP.id_permutation
	);
	
	CALL p_shop_user_eval(v_guid_permission, v_id_user, 0, v_id_permission_manufacturing_purchase_order, v_id_access_level_edit, v_ids_product);
	
	/*
	UPDATE tmp_Shop_Supplier t_S
	INNER JOIN Shop_User_Eval_Temp TP
		ON TP.GUID = v_guid_permission
	SET tP.can_view = TP.can_view,
		tP.can_edit = TP.can_edit,
		tP.can_admin = TP.can_admin;
	*/
	/*
	v_has_permission := (
		SELECT can_edit 
		FROM Shop_User_Eval_Temp 
		WHERE 
			GUID = v_guid_permission
			AND can_edit = 0
	);
	
	IF v_has_permission = FALSE THEN
		v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, msg
		)
		SELECT
			v_guid, 
			v_id_error_type_no_permission, 
			CONCAT('You do not have ', name, ' permissions.')
		FROM Shop_Permission
		WHERE id_permission = v_id_permission_manufacturing_purchase_order
		;
	END IF;
	*/
	v_ids_product_no_permission := (
		SELECT STRING_AGG(PT.id_product, ',') 
		FROM Shop_User_Eval_Temp PT 
		WHERE 
			PT.can_edit = 0
			AND NOT ISNULL(PT.id_product)
	);
	IF NOT ISNULL(v_ids_product_no_permission) THEN
		/*
		INSERT INTO tmp_Msg_Error ( 
			guid, id_type, code, msg
		)
		VALUES (
			v_guid, 
			v_id_error_type_no_permission, 
			v_code_error_type_no_permission,
		*/
		RAISE EXCEPTION 'You do not have permission to edit the following product IDs: %', v_ids_product_no_permission
		USING ERRCODE = '42501'
		;
	END IF;
    
	-- Transaction
	START TRANSACTION;
		INSERT INTO Shop_Sales_And_Purchasing_Change_Set (
			comment,
			updated_last_by,
			updated_last_on
		)
		VALUES (
			'Save '
			|| CASE WHEN v_is_new_manufacturing_purchase_order = TRUE THEN 'new ' ELSE '' END
			|| 'Manufacturing Purchase Order - '
			|| v_comment,
			v_id_user,
			CURRENT_TIMESTAMP
		);
		
		v_id_change_set := (SELECT id_change_set FROM Shop_Sales_And_Purchasing_Change_Set ORDER BY id_change_set DESC LIMIT 1);
		
		IF (v_is_new_manufacturing_purchase_order = 1) THEN
			INSERT INTO Shop_Manufacturing_Purchase_Order (
				-- id_supplier_ordered,
				cost_total_local,
				id_currency_cost,
				value_produced_total_local,
				created_by,
				id_change_set,
				active
			)
			SELECT
				-- v_id_supplier_ordered,
				SUM(t_MPOPL.cost_total_local),
				v_id_currency_cost,
				SUM(t_MPOPL.value_produced_total_local),
				v_id_user,
				v_id_change_set,
				v_active
			FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
			;
			-- v_id_order_new 
			v_id_order := (SELECT id_order FROM Shop_Manufacturing_Purchase_Order ORDER BY id_order DESC LIMIT 1);
			
			INSERT INTO Shop_Manufacturing_Purchase_Order_Product_Link (
				id_order,
				id_permutation,
				cost_total_local,
				value_produced_total_local,
				id_currency_cost,
				quantity_used,
				id_unit_quantity,
				quantity_produced,
				latency_manufacture_days,
				display_order,
				active,
				created_by,
				id_change_set
			)
			SELECT
				v_id_order, -- v_id_order_new,
				id_permutation,
				cost_total_local,
				value_produced_total_local,
				id_currency_cost,
				quantity_used,
				id_unit_quantity,
				quantity_produced,
				latency_manufacture_days,
				display_order,
				active,
				v_id_user,
				v_id_change_set
			FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
			;
		ELSE
			UPDATE Shop_Manufacturing_Purchase_Order MPO
			SET
				-- MPO.id_supplier_ordered = v_id_supplier_ordered,
				MPO.cost_total_local = SUM(t_MPOPL.cost_total_local),
				MPO.value_produced_total_local = SUM(t_MPOPL.value_produced_total_local),
				MPO.id_currency = v_id_currency_cost,
				MPO.id_change_set = v_id_change_set,
				MPO.active = v_active
			FROM Shop_Manufacturing_Purchase_Order MPO
			INNER JOIN tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL ON MPO.id_order = t_MPOPL.id_order
			WHERE MPO.id_order = v_id_order
			;
			IF EXISTS (SELECT * FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL INNER JOIN Shop_Manufacturing_Purchase_Order_Product_Link MPOPL ON t_MPOPL.id_link = MPOPL.id_link) THEN
				UPDATE Shop_Manufacturing_Purchase_Order_Product_Link MPOPL
				SET
					MPOPL.id_order = t_MPOPL.id_order,
					MPOPL.id_permutation = t_MPOPL.id_permutation,
					MPOPL.cost_total_local = t_MPOPL.cost_total_local,
					MPOPL.value_produced_total_local = t_MPOPL.value_produced_total_local,
					MPOPL.id_currency_cost = t_MPOPL.id_currency_cost,
					MPOPL.quantity_used = t_MPOPL.quantity_used,
					MPOPL.id_unit_quantity = t_MPOPL.id_unit_quantity,
					MPOPL.quantity_produced = t_MPOPL.quantity_produced,
					MPOPL.latency_manufacture_days = t_MPOPL.latency_manufacture_days,
					MPOPL.display_order = t_MPOPL.display_order,
					MPOPL.active = t_MPOPL.active,
					MPOPL.id_change_set = v_id_change_set
				FROM Shop_Manufacturing_Purchase_Order_Product_Link MPOPL
				INNER JOIN tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
					ON MPOPL.id_link = t_MPOPL.id_link
				;
			ELSE
				INSERT INTO Shop_Manufacturing_Purchase_Order_Product_Link (
					id_order,
					id_permutation,
					cost_total_local,
					value_produced_total_local,
					id_currency_cost,
					quantity_used,
					id_unit_quantity,
					quantity_produced,
					latency_manufacture_days,
					display_order,
					active,
					created_by,
					id_change_set
				)
				SELECT
					id_order,
					id_permutation,
					cost_total_local,
					value_produced_total_local,
					id_currency_cost,
					quantity_used,
					id_unit_quantity,
					quantity_produced,
					latency_manufacture_days,
					display_order,
					active,
					v_id_user,
					v_id_change_set
				FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
				WHERE t_MPOPL.id_link < 0
				;
			END IF;
		END IF;
	
	COMMIT;
    
    -- Returns
    -- v_now = CURRENT_TIMESTAMP;
    /*
    -- Manufacturing Purchase Orders
    SELECT *
    FROM Shop_Manufacturing_Purchase_Order
    WHERE 
		id_order = v_id_order
        -- GUID = v_guid
    ;
    
    -- Manufacturing Purchase Order Product Links
    SELECT *
    FROM Shop_Manufacturing_Purchase_Order_Product_Link
    WHERE
		id_order = v_id_order
        -- GUID = v_guid
    ;
    */

    -- Errors
	/*
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
    */

    -- DROP TABLE tmp_Shop_Manufacturing_Purchase_Order;
    DROP TABLE tmp_Shop_Manufacturing_Purchase_Order_Product_Link;
    -- DROP TABLE tmp_Msg_Error;
END;
$$ LANGUAGE plpgsql;


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
	quantity_used,
	id_unit_quantity,
	quantity_produced,
	latency_manufacture_days,
	display_order,
    active
)
VALUES
	(
		'NIPS', -- guid
		-1, -- id_link,
		-1, -- id_order,
		1, -- id_permutation,
		100, -- cost_total_local,
		1, -- id_currency_cost,
		1, -- quantity_used,
		1, -- id_unit_quantity,
		1, -- quantity_produced,
		14, -- latency_manufacture_days ,
		1, -- display_order
        1 -- active
    )
;

SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

CALL p_shop_save_manufacturing_purchase_order (
	'NIPS', -- a_guid
    'auth0|6582b95c895d09a70ba10fef', -- a_id_user
    -1, -- a_id_order
    1, -- a_id_currency_cost
    1, -- a_active
    'Initial data' -- a_comment
);

SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;
DELETE FROM Shop_Manufacturing_Purchase_Order_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order;


*/

