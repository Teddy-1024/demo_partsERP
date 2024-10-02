
-- DROP TABLE IF EXISTS tmp_Shop_Customer_Sales_Order_Product_Link;
-- DROP TABLE IF EXISTS tmp_Msg_Error;

CREATE OR REPLACE PROCEDURE p_shop_save_customer_sales_order (
	IN a_guid UUID,
    IN a_id_user INTEGER,
    IN a_comment VARCHAR(4000),
    IN a_id_order INTEGER,
    IN a_id_customer INTEGER,
    IN a_id_currency_price INTEGER,
    IN a_active BOOLEAN
)
AS $$
DECLARE 
	v_guid UUID;
    v_id_user INTEGER;
	v_comment VARCHAR(4000);
    v_id_order INTEGER;
    v_id_customer INTEGER;
    v_id_currency_price INTEGER;
    v_active BOOLEAN;
	v_id_error_type_bad_data INTEGER;
    v_code_error_type_bad_data VARCHAR(50);
    v_id_error_type_no_permission INTEGER;
    v_code_error_type_no_permission VARCHAR(50);
    -- v_guid_permission UUID;
    v_id_permission_Customer_Sales_order INTEGER;
	v_id_access_level_EDIT INTEGER;
    v_ids_product VARCHAR(4000);
    v_ids_product_no_permission VARCHAR(4000);
    -- v_id_order_new INTEGER;
    v_id_change_set INTEGER;
    v_is_new_Customer_Sales_order BOOLEAN;
	result_errors REFCURSOR;
BEGIN
	-- SET SESSION sql_mode = sys.list_drop(@@session.sql_mode, 'ONLY_FULL_GROUP_BY');
    
	v_guid := COALESCE(a_guid, gen_random_uuid());
	v_id_user := TRIM(COALESCE(a_id_user, ''));
	v_comment := TRIM(COALESCE(a_comment, ''));
	v_id_order := COALESCE(a_id_order, -1);
	v_id_customer := a_id_customer;
	v_id_currency_price := a_id_currency_price;
	v_active := COALESCE(a_active, FALSE); 

    v_code_error_type_bad_data := 'BAD_DATA';
    v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_bad_data LIMIT 1);
    v_code_error_type_no_permission := 'NO_PERMISSION';
    v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_no_permission LIMIT 1);
	-- v_guid_permission := gen_random_uuid();
	v_id_permission_Customer_Sales_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_CUSTOMER_SALES_ORDER' LIMIT 1);
	v_id_access_level_EDIT := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT');
    
	v_is_new_Customer_Sales_order := CASE WHEN v_id_order <= 0 THEN TRUE ELSE FALSE END;
	
    -- Temporary tables
    /*
    CREATE TABLE tmp_Shop_Customer_Sales_Order (
		id_order INTEGER NOT NULL PRIMARY KEY,
		id_supplier_ordered INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Shop_Customer_Sales_Order_id_supplier_ordered
			FOREIGN KEY (id_supplier_ordered) 
			REFERENCES Shop_Supplier(id_supplier),
		price_total_local REAL NOT NULL,
		id_currency_price INTEGER NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Customer_Sales_Order_Product_Link (
		id_link INTEGER NOT NULL PRIMARY KEY,
		id_order INTEGER NOT NULL,
        /*
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_Customer_Sales_Order(id_order),
		*/
        id_permutation INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		price_total_local REAL NOT NULL,
		id_currency_price INTEGER NOT NULL,
		quantity_ordered REAL NOT NULL,
		id_unit_quantity INTEGER NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_delivered REAL NULL,
		latency_delivery_days INTEGER NOT NULL,
		display_order INTEGER NOT NULL,
        active BOOLEAN NOT NULL,
        name_error VARCHAR(200) NOT NULL
    );
    
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
    
    
    -- Argument validation
    -- User ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF NOT EXISTS (SELECT * FROM Shop_User WHERE id_user = v_id_user) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(v_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid User ID: ', COALESCE(v_id_user, 'NULL')))
			;
		END IF;
    END IF;
    
    -- Order ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF (v_id_order > 0) AND NOT EXISTS (SELECT * FROM Shop_Customer_Sales_Order WHERE id_order = v_id_order) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(v_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid Customer Sales Order ID: ', COALESCE(v_id_order, 'NULL')))
			;
		END IF;
    END IF;
    
    -- Customer ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(v_id_customer) OR NOT EXISTS (SELECT * FROM Shop_Customer WHERE id_customer = v_id_customer) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(v_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid Customer ID: ', COALESCE(v_id_customer, 'NULL')))
			;
		END IF;
    END IF;
    
    -- Currency ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(v_id_currency_price) OR NOT EXISTS (SELECT * FROM Shop_Currency WHERE id_currency = v_id_currency_price) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(v_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid currency ID: ', COALESCE(v_id_currency, 'NULL')))
			;
		END IF;
    END IF;
    
    -- Comment
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF v_comment = '' THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(v_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, 'A comment must be provided.')
			;
		END IF;
    END IF;
    

	-- Get data from Temp table
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN		
		INSERT INTO tmp_Shop_Customer_Sales_Order_Product_Link (
			id_link, 
            id_order, 
            id_permutation, 
            price_total_local, 
            id_currency_price, 
            quantity_ordered, 
            id_unit_quantity, 
            quantity_delivered, 
            latency_delivery_days, 
            display_order, 
            active,
            name_error
		)
		SELECT 
			CSOPL_T.id_link, 
            CSOPL_T.id_order, 
            CSOPL_T.id_permutation, 
			(PP.cost_local + PP.profit_local_min) * quantity_ordered AS price_total_local, 
			CSOPL_T.id_currency_price, 
            CSOPL_T.quantity_ordered, 
            CSOPL_T.id_unit_quantity, 
            CSOPL_T.quantity_delivered, 
            CSOPL_T.latency_delivery_days, 
            CSOPL_T.display_order, 
            CSOPL_T.active,
            PP.id_permutation || ' - ' || COALESCE(P.name ,'') AS name_error
        FROM Shop_Customer_Sales_Order_Product_Link_Temp CSOPL_T
        INNER JOIN Shop_Product_Permutation PP ON CSOPL_T.id_permutation = PP.id_permutation
        INNER JOIN Shop_Product P ON PP.id_product = P.id_product
		WHERE CSOPL_T.GUID = v_guid
        ;
        DELETE FROM Shop_Customer_Sales_Order_Product_Link_Temp CSOPL_T
		WHERE CSOPL_T.GUID = v_guid
        ;
        
        /*
        UPDATE tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL
        SET 
			price_total_local
		*/
    END IF;
    
    -- Invalid quantity ordered
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Shop_Customer_Sales_Order_Product_Link 
            WHERE 
				NOT ISNULL(quantity_ordered)
				AND quantity_ordered < 0
		) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			SELECT
				v_guid, 
                v_id_error_type_bad_data, 
                v_code_error_type_bad_data, 
                'Invalid quantity ordered property for the following permutations: ' || STRING_AGG(t_CSOPL.name_error, ', ')
			FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL
            -- INNER JOIN Shop_Product_Permutation PP ON t_CSOPL.id_permutation = PP.id_permutation
            WHERE t_CSOPL.quantity_ordered < 0
			;
        END IF;
    END IF;
    
    -- Duplicates
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF EXISTS (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL GROUP BY id_permutation HAVING COUNT(*) > 1) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			SELECT
				v_guid, 
                v_id_error_type_bad_data, 
                v_code_error_type_bad_data, 
                'Duplicate records: ' || STRING_AGG(t_CSOPLC.name_error, ', ')
			FROM (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL GROUP BY id_permutation HAVING COUNT(*) > 1) t_CSOPLC
			;
        END IF;
	END IF;
    
    
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
        v_ids_product := (
			SELECT STRING_AGG(DISTINCT PP.id_product, ',')
            FROM tmp_Shop_Customer_Sales_Order_Product_Link t_SPO
			INNER JOIN Shop_Product_Permutation PP ON t_SPO.id_permutation = PP.id_permutation
		);
        
        CALL p_shop_calc_user(v_guid_permission, v_id_user, 0, v_id_permission_Customer_Sales_order, v_id_access_level_edit, v_ids_product);
        
        /*
        UPDATE tmp_Shop_Supplier t_S
        INNER JOIN Shop_Calc_User_Temp TP
			ON TP.GUID = v_guid_permission
        SET tP.can_view = TP.can_view,
			tP.can_edit = TP.can_edit,
            tP.can_admin = TP.can_admin;
		*/
        /*
        SET v_has_permission := (
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
            WHERE id_permission = v_id_permission_Customer_Sales_order
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
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES (
				v_guid, 
				v_id_error_type_no_permission, 
                v_code_error_type_no_permission,
                'You do not have permission to edit the following product IDs: ' || v_ids_product_no_permission
			)
			;
        END IF;
        
        DELETE FROM Shop_Calc_User_Temp
        WHERE GUID = v_guid;
    END IF;
    
	-- Transaction    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		START TRANSACTION;
			INSERT INTO Shop_Sales_And_Purchasing_Change_Set (
				comment,
				updated_last_by,
				updated_last_on
			)
			VALUES (
				'Save '
				|| CASE WHEN v_is_new_Customer_Sales_order = TRUE THEN 'new ' ELSE '' END
				|| 'Customer Sales Order - '
				|| v_comment,
				v_id_user,
				CURRENT_TIMESTAMP
			);
			
			v_id_change_set := (SELECT id_change_set FROM Shop_Sales_And_Purchasing_Change_Set ORDER BY id_change_set DESC LIMIT 1);
			
			IF (v_is_new_Customer_Sales_order = 1) THEN
				INSERT INTO Shop_Customer_Sales_Order (
					id_customer,
					price_total_local,
					id_currency_price,
                    created_by,
                    id_change_set,
                    active
				)
                SELECT
					v_id_customer,
					SUM(t_CSOPL.price_total_local),
                    v_id_currency_price,
                    v_id_user,
                    v_id_change_set,
                    v_active
				FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL
				;
                -- v_id_order_new 
                v_id_order := (SELECT id_order FROM Shop_Customer_Sales_Order ORDER BY id_order DESC LIMIT 1);
				INSERT INTO Shop_Customer_Sales_Order_Product_Link (
					id_order,
					id_permutation,
					price_total_local,
					id_currency_price,
					quantity_ordered,
					id_unit_quantity,
					quantity_delivered,
					latency_delivery_days,
					display_order,
                    active,
                    created_by,
                    id_change_set
				)
                SELECT
					v_id_order, -- v_id_order_new,
					id_permutation,
					price_total_local,
					id_currency_price,
					quantity_ordered,
					id_unit_quantity,
					quantity_delivered,
					latency_delivery_days,
					display_order,
                    active,
                    v_id_user,
                    v_id_change_set
				FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL
				;
			ELSE
				UPDATE Shop_Customer_Sales_Order CSO
                SET
					CSO.id_customer = v_id_customer,
					CSO.price_total_local = SUM(t_CSOPL.price_total_local),
                    CSO.id_currency = v_id_currency_price,
                    CSO.id_change_set = v_id_change_set,
                    CSO.active = v_active
				FROM Shop_Customer_Sales_Order CSO
				INNER JOIN tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL ON CSO.id_order = t_CSOPL.id_order
				WHERE SPO.id_order = v_id_order
				;
                IF EXISTS (SELECT * FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL INNER JOIN Shop_Customer_Sales_Order_Product_Link CSOPL ON t_CSOPL.id_link = CSOPL.id_link) THEN
					UPDATE Shop_Customer_Sales_Order_Product_Link CSOPL
					SET
						CSOPL.id_order = t_CSOPL.id_order,
						CSOPL.id_permutation = t_CSOPL.id_permutation,
						CSOPL.price_total_local = t_CSOPL.price_total_local,
						CSOPL.id_currency_price = t_CSOPL.id_currency_price,
						CSOPL.quantity_ordered = t_CSOPL.quantity_ordered,
						CSOPL.id_unit_quantity = t_CSOPL.id_unit_quantity,
						CSOPL.quantity_delivered = t_CSOPL.quantity_delivered,
						CSOPL.latency_delivery_days = t_CSOPL.latency_delivery_days,
						CSOPL.display_order = t_CSOPL.display_order,
                        CSOPL.active = t_CSOPL.active,
						CSOPL.id_change_set = v_id_change_set
					FROM Shop_Customer_Sales_Order_Product_Link CSOPL
					INNER JOIN tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL
						ON CSOPL.id_link = t_CSOPL.id_link
					;
                ELSE
					INSERT INTO Shop_Customer_Sales_Order_Product_Link (
						id_order,
						id_permutation,
						price_total_local,
						id_currency_price,
						quantity_ordered,
						id_unit_quantity,
						quantity_delivered,
						latency_delivery_days,
						display_order,
                        active,
                        created_by,
						id_change_set
					)
					SELECT
						id_order,
						id_permutation,
						price_total_local,
						id_currency_price,
						quantity_ordered,
						id_unit_quantity,
						quantity_delivered,
						latency_delivery_days,
						display_order,
						active,
                        v_id_user,
						v_id_change_set
					FROM tmp_Shop_Customer_Sales_Order_Product_Link t_CSOPL
                    WHERE t_CSOPL.id_link < 0
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
    END IF;
    
    -- Returns
    -- v_now := CURRENT_TIMESTAMP;
    /*
    -- Supplier Purchase Orders
    SELECT *
    FROM Shop_Customer_Sales_Order
    WHERE id_order = v_id_order
    ;
    
    -- Supplier Purchase Order Product Links
    SELECT *
    FROM Shop_Customer_Sales_Order_Product_Link
    WHERE id_order = v_id_order
    ;
    */

    -- Errors
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
    
    -- DROP TABLE tmp_Shop_Customer_Sales_Order;
    DROP TABLE tmp_Shop_Customer_Sales_Order_Product_Link;
    DROP TABLE tmp_Msg_Error;
END;
$$ LANGUAGE plpgsql;


/*

DELETE FROM Shop_Customer_Sales_Order_Product_Link_Audit;
DELETE FROM Shop_Customer_Sales_Order_Product_Link;
DELETE FROM Shop_Customer_Sales_Order_Product_Link_Temp;
DELETE FROM Shop_Customer_Sales_Order_Audit;
DELETE FROM Shop_Customer_Sales_Order;

INSERT INTO Shop_Customer_Sales_Order_Product_Link_Temp (
	guid,
    id_link,
    id_order,
	id_permutation,
	price_total_local,
	id_currency_price,
	quantity_ordered,
	id_unit_quantity,
	quantity_delivered,
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
		100, -- price_total_local,
		1, -- id_currency_price,
		1, -- quantity_ordered,
		1, -- id_unit_quantity,
		1, -- quantity_delivered,
		14, -- latency_delivery_days ,
		1, -- display_order
        1 -- active
    )
;

SELECT * FROM Shop_Customer_Sales_Order_Product_Link_Temp;

CALL p_shop_save_customer_sales_order (
	'NIPS', -- a_guid
    'auth0|6582b95c895d09a70ba10fef', -- a_id_user
    'Initial customer', -- a_comment
    -1, -- a_id_order
    4, -- a_id_customer
    1, -- a_id_currency_price
    1 -- a_active
);

SELECT * FROM Shop_Customer_Sales_Order_Product_Link_Temp;

DELETE FROM Shop_Customer_Sales_Order_Product_Link_Audit;
DELETE FROM Shop_Customer_Sales_Order_Product_Link;
DELETE FROM Shop_Customer_Sales_Order_Product_Link_Temp;
DELETE FROM Shop_Customer_Sales_Order_Audit;
DELETE FROM Shop_Customer_Sales_Order;


*/

