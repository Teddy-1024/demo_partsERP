


-- DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order_Product_Link;
-- DROP TABLE IF EXISTS tmp_Msg_Error;

CREATE OR REPLACE PROCEDURE p_shop_save_supplier_purchase_order (
	IN a_guid UUID,
    IN a_id_user INTEGER,
    IN a_comment UUID,
    IN a_id_order INTEGER,
    IN a_id_supplier_ordered INTEGER,
    IN a_id_currency_cost INTEGER,
    IN a_active BOOLEAN
)
AS $$
DECLARE
	v_guid UUID;
    v_id_user INTEGER;
	v_comment VARCHAR(4000);
    v_id_order INTEGER;
    v_id_supplier_ordered INTEGER;
    v_id_currency_cost INTEGER;
    v_active BOOLEAN;
    v_id_error_type_bad_data INTEGER;
    v_code_error_type_bad_data VARCHAR(50);
    v_id_error_type_no_permission INTEGER;
    v_code_error_type_no_permission VARCHAR(50);
    v_guid_permission UUID;
    -- v_id_user VARCHAR(100);
    v_id_permission_supplier_purchase_order INTEGER;
	v_id_access_level_EDIT INTEGER;
    v_ids_product VARCHAR(4000);
    v_ids_product_no_permission VARCHAR(4000);
    -- v_id_order_new INTEGER;
    v_id_change_set INTEGER;
    v_is_new_supplier_purchase_order BOOLEAN;
	-- result_orders REFCURSOR;
	-- result_order_product_links REFCURSOR;
	-- result_errors REFCURSOR;
BEGIN
	-- SET SESSION sql_mode = sys.list_drop(@@session.sql_mode, 'ONLY_FULL_GROUP_BY');
    
	v_guid := COALESCE(a_guid, gen_random_uuid());
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_comment := TRIM(COALESCE(a_comment, ''));
	v_id_order := COALESCE(a_id_order, -1);
	v_id_supplier_ordered := a_id_supplier_ordered;
	v_id_currency_cost := a_id_currency_cost;
	v_active := COALESCE(a_active, FALSE); 
    
    v_code_error_type_bad_data = 'BAD_DATA';
    v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_bad_data LIMIT 1);
    v_code_error_type_no_permission = 'NO_PERMISSION';
    v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_no_permission LIMIT 1);
	v_guid_permission = gen_random_uuid();
	-- v_id_user = CURRENT_USER;
	v_id_permission_supplier_purchase_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_SUPPLIER_PURCHASE_ORDER' LIMIT 1);
	v_id_access_level_EDIT := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT');
		
	v_is_new_supplier_purchase_order := CASE WHEN v_id_order <= 0 THEN TRUE ELSE FALSE END;
    
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
    
    CREATE TABLE tmp_Shop_Supplier_Purchase_Order_Product_Link (
		id_link INTEGER NOT NULL PRIMARY KEY,
		id_order INTEGER NOT NULL,
        /*
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_Supplier_Purchase_Order(id_order),
		*/
        id_permutation INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		cost_total_local REAL NOT NULL,
		id_currency_cost INTEGER NOT NULL,
		quantity_ordered REAL NOT NULL,
		id_unit_quantity INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_received REAL NULL,
		latency_delivery_days INTEGER NOT NULL,
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
	IF ((v_id_order > 0) AND NOT EXISTS (SELECT * FROM Shop_Supplier_Purchase_Order WHERE id_order = v_id_order)) THEN
		RAISE EXCEPTION 'Invalid Supplier Purchase Order ID: %', COALESCE(v_id_order, 'NULL')
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Supplier ID
	IF ISNULL(v_id_supplier_ordered) OR NOT EXISTS (SELECT * FROM Shop_Supplier WHERE id_supplier = v_id_supplier_ordered) THEN
		RAISE EXCEPTION 'Invalid Supplier ID: %', COALESCE(v_id_supplier_ordered, 'NULL')
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Currency ID
	IF ISNULL(v_id_currency_cost) OR NOT EXISTS (SELECT * FROM Shop_Currency WHERE id_currency = v_id_currency_cost) THEN
		RAISE EXCEPTION 'Invalid currency ID: %', COALESCE(v_id_currency, 'NULL')
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Comment
	IF v_comment = '' THEN
		RAISE EXCEPTION 'A comment must be provided.'
		USING ERRCODE = '22000'
		;
	END IF;
    

	-- Get data from Temp table		
	INSERT INTO tmp_Shop_Supplier_Purchase_Order_Product_Link (
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
		active,
		name_error
	)
	SELECT 
		SPOPL_T.id_link, 
		SPOPL_T.id_order, 
		SPOPL_T.id_permutation, 
		PP.cost_local * quantity_ordered AS cost_total_local, 
		SPOPL_T.id_currency_cost, 
		SPOPL_T.quantity_ordered, 
		SPOPL_T.id_unit_quantity, 
		SPOPL_T.quantity_received, 
		SPOPL_T.latency_delivery_days, 
		SPOPL_T.display_order, 
		SPOPL_T.active,
		CAST(PP.id_permutation AS VARCHAR(10)) || ' - ' || COALESCE(PP.name ,'') AS name_error
	FROM Shop_Supplier_Purchase_Order_Product_Link_Temp SPOPL_T
	INNER JOIN Shop_Product_Permutation PP ON SPOPL_T.id_permutation = PP.id_permutation
	WHERE SPOPL_T.GUID = v_guid
	;
	DELETE FROM Shop_Supplier_Purchase_Order_Product_Link_Temp SPOPL_T
	WHERE SPOPL_T.GUID = v_guid
	;
	
	/*
	UPDATE tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
	
		cost_total_local
	*/
    
    -- Invalid quantity ordered
	IF EXISTS (
		SELECT * 
		FROM tmp_Shop_Supplier_Purchase_Order_Product_Link 
		WHERE 
			NOT ISNULL(quantity_ordered)
			AND quantity_ordered < 0
	) THEN
		RAISE EXCEPTION 'Invalid quantity ordered property for the following permutations: %', (
			SELECT STRING_AGG(t_SPOPL.name_error, ', ')
			FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
			-- INNER JOIN Shop_Product_Permutation PP ON t_SPOPL.id_permutation = PP.id_permutation
			WHERE t_SPOPL.quantity_ordered < 0
			)
		USING ERRCODE = '22000'
		;
	END IF;
    
    -- Duplicates
	IF EXISTS (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL GROUP BY id_permutation HAVING COUNT(*) > 1) THEN 
		RAISE EXCEPTION 'Duplicate records: %', || (
			SELECT STRING_AGG(t_SPOPLC.name_error, ', ')
			FROM (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL GROUP BY id_permutation HAVING COUNT(*) > 1) t_SPOPLC
		)
		USING ERRCODE = '22000'
		;
	END IF;
    
    
    
    -- Permissions
	v_ids_product := (
		SELECT STRING_AGG(DISTINCT PP.id_product, ',')
		FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPO
		INNER JOIN Shop_Product_Permutation PP ON t_SPO.id_permutation = PP.id_permutation
	);
	
	CALL p_shop_calc_user(v_guid_permission, v_id_user, 0, v_id_permission_supplier_purchase_order, v_id_access_level_edit, v_ids_product);
	
	/*
	UPDATE tmp_Shop_Supplier t_S
	INNER JOIN Shop_Calc_User_Temp TP
		ON TP.GUID = v_guid_permission
	SET tP.can_view = TP.can_view,
		tP.can_edit = TP.can_edit,
		tP.can_admin = TP.can_admin;
	*/
	/*
	v_has_permission := (
		SELECT can_edit 
		FROM Shop_Calc_User_Temp 
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
		WHERE id_permission = v_id_permission_supplier_purchase_order
		;
	END IF;
	*/
	v_ids_product_no_permission := (
		SELECT STRING_AGG(PT.id_product, ',') 
		FROM Shop_Calc_User_Temp PT 
		WHERE 
			PT.can_edit = 0
			AND NOT ISNULL(PT.id_product)
	);
	IF NOT ISNULL(v_ids_product_no_permission) THEN
		RAISE EXCEPTION 'You do not have permission to edit the following product IDs: %', v_ids_product_no_permission
		USING ERRCODE = '42501'
		;
	END IF;
	
	DELETE FROM Shop_Calc_User_Temp
	WHERE GUID = v_guid;
    
	-- Transaction
	START TRANSACTION;
		INSERT INTO Shop_Sales_And_Purchasing_Change_Set (
			comment,
			updated_last_by,
			updated_last_on
		)
		VALUES (
			'Save '
			|| CASE WHEN v_is_new_supplier_purchase_order = TRUE THEN 'new ' ELSE '' END
			|| 'Supplier Purchase Order - '
			|| v_comment,
			v_id_user,
			CURRENT_TIMESTAMP
		);
		
		v_id_change_set := (SELECT id_change_set FROM Shop_Sales_And_Purchasing_Change_Set ORDER BY id_change_set DESC LIMIT 1);
		
		IF (v_is_new_supplier_purchase_order = 1) THEN
			INSERT INTO Shop_Supplier_Purchase_Order (
				id_supplier_ordered,
				cost_total_local,
				id_currency_cost,
				created_by,
				id_change_set,
				active
			)
			SELECT
				v_id_supplier_ordered,
				SUM(t_SPOPL.cost_total_local),
				v_id_currency_cost,
				v_id_user,
				v_id_change_set,
				v_active
			FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
			;
			-- v_id_order_new 
			v_id_order := (SELECT id_order FROM Shop_Supplier_Purchase_Order ORDER BY id_order DESC LIMIT 1);
			INSERT INTO Shop_Supplier_Purchase_Order_Product_Link (
				id_order,
				id_permutation,
				cost_total_local,
				id_currency_cost,
				quantity_ordered,
				id_unit_quantity,
				quantity_received,
				latency_delivery_days,
				display_order,
				active,
				created_by,
				id_change_set
			)
			SELECT
				v_id_order, -- v_id_order_new,
				id_permutation,
				cost_total_local,
				id_currency_cost,
				quantity_ordered,
				id_unit_quantity,
				quantity_received,
				latency_delivery_days,
				display_order,
				active,
				v_id_user,
				v_id_change_set
			FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
			;
		ELSE
			UPDATE Shop_Supplier_Purchase_Order SPO
			SET
				SPO.id_supplier_ordered = v_id_supplier_ordered,
				SPO.cost_total_local = SUM(t_SPOPL.cost_total_local),
				SPO.id_currency = v_id_currency_cost,
				SPO.id_change_set = v_id_change_set,
				SPO.active = v_active
			FROM Shop_Supplier_Purchase_Order SPO
			INNER JOIN tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL ON SPO.id_order = t_SPOPL.id_order
			WHERE SPO.id_order = v_id_order
			;
			IF EXISTS (SELECT * FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL INNER JOIN Shop_Supplier_Purchase_Order_Product_Link SPOPL ON t_SPOPL.id_link = SPOPL.id_link) THEN
				UPDATE Shop_Supplier_Purchase_Order_Product_Link SPOPL
				SET
					SPOPL.id_order = t_SPOPL.id_order,
					SPOPL.id_permutation = t_SPOPL.id_permutation,
					SPOPL.cost_total_local = t_SPOPL.cost_total_local,
					SPOPL.id_currency_cost = t_SPOPL.id_currency_cost,
					SPOPL.quantity_ordered = t_SPOPL.quantity_ordered,
					SPOPL.id_unit_quantity = t_SPOPL.id_unit_quantity,
					SPOPL.quantity_received = t_SPOPL.quantity_received,
					SPOPL.latency_delivery_days = t_SPOPL.latency_delivery_days,
					SPOPL.display_order = t_SPOPL.display_order,
					SPOPL.active = t_SPOPL.active,
					SPOPL.id_change_set = v_id_change_set
				FROM Shop_Supplier_Purchase_Order_Product_Link SPOPL
				INNER JOIN tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
					ON SPOPL.id_link = t_SPOPL.id_link
				;
			ELSE
				INSERT INTO Shop_Supplier_Purchase_Order_Product_Link (
					id_order,
					id_permutation,
					cost_total_local,
					id_currency_cost,
					quantity_ordered,
					id_unit_quantity,
					quantity_received,
					latency_delivery_days,
					display_order,
					active,
					created_by,
					id_change_set
				)
				SELECT
					id_order,
					id_permutation,
					cost_total_local,
					id_currency_cost,
					quantity_ordered,
					id_unit_quantity,
					quantity_received,
					latency_delivery_days,
					display_order,
					active,
					v_id_user,
					v_id_change_set
				FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
				WHERE t_SPOPL.id_link < 0
				;
			END IF;
		END IF;
	
	COMMIT;
	/*
	IF EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		ROLLBACK;
	ELSE
		COMMIT;
	END IF;
	*/
    
    -- Returns
    -- v_now = CURRENT_TIMESTAMP;
    /*
    -- Supplier Purchase Orders
	OPEN result_orders FOR
		SELECT *
		FROM Shop_Supplier_Purchase_Order
		WHERE id_order = v_id_order
		;
    -- RETURN NEXT result_orders;
    
    -- Supplier Purchase Order Product Links
	OPEN result_order_product_links FOR
		SELECT *
		FROM Shop_Supplier_Purchase_Order_Product_Link
		WHERE id_order = v_id_order
		;
    -- RETURN NEXT result_order_product_links;
    */
    -- Errors
	/*
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
	*/

    -- DROP TABLE tmp_Shop_Supplier_Purchase_Order;
    DROP TABLE tmp_Shop_Supplier_Purchase_Order_Product_Link;
    DROP TABLE tmp_Msg_Error;
END;
$$ LANGUAGE plpgsql;


/*

DELETE FROM Shop_Supplier_Purchase_Order_Product_Link_Audit;
DELETE FROM Shop_Supplier_Purchase_Order_Product_Link;
DELETE FROM Shop_Supplier_Purchase_Order_Product_Link_Temp;
DELETE FROM Shop_Supplier_Purchase_Order_Audit;
DELETE FROM Shop_Supplier_Purchase_Order;

INSERT INTO Shop_Supplier_Purchase_Order_Product_Link_Temp (
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
		'NIPS', -- guid
		-1, -- id_link,
		-1, -- id_order,
		1, -- id_permutation,
		100, -- cost_total_local,
		1, -- id_currency_cost,
		1, -- quantity_ordered,
		1, -- id_unit_quantity,
		1, -- quantity_received,
		14, -- latency_delivery_days ,
		1, -- display_order
        1 -- active
    )
;

SELECT * FROM Shop_Supplier_Purchase_Order_Product_Link_Temp;

CALL p_shop_save_supplier_purchase_order (
	'NIPS', -- a_guid
    'auth0|6582b95c895d09a70ba10fef', -- a_id_user
    -1, -- a_id_order
    1, -- a_id_supplier_ordered
    1 -- a_id_currency_cost
);

SELECT * FROM Shop_Supplier_Purchase_Order_Product_Link_Temp;

DELETE FROM Shop_Supplier_Purchase_Order_Product_Link_Audit;
DELETE FROM Shop_Supplier_Purchase_Order_Product_Link;
DELETE FROM Shop_Supplier_Purchase_Order_Product_Link_Temp;
DELETE FROM Shop_Supplier_Purchase_Order_Audit;
DELETE FROM Shop_Supplier_Purchase_Order;


*/

