



-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_manufacturing_purchase_order;

DROP TABLE IF EXISTS tmp_Shop_Manufacturing_Purchase_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Msg_Error;

DELIMITER //
CREATE PROCEDURE p_shop_save_manufacturing_purchase_order (
	IN a_guid VARCHAR(500),
    IN a_id_user INT,
    IN a_id_order INT,
    -- IN a_id_supplier_ordered INT,
    IN a_id_currency_cost INT,
    IN a_active BIT,
    IN a_comment VARCHAR(500)
)
BEGIN
    DECLARE v_id_error_type_bad_data INT;
    DECLARE v_code_error_type_bad_data VARCHAR(50);
    DECLARE v_id_error_type_no_permission INT;
    DECLARE v_code_error_type_no_permission VARCHAR(50);
    DECLARE v_guid_permission BINARY(36);
    -- DECLARE v_id_user VARCHAR(100);
    DECLARE v_id_permission_manufacturing_purchase_order INT;
	DECLARE v_id_access_level_EDIT INT;
    DECLARE v_ids_product VARCHAR(4000);
    DECLARE v_ids_product_no_permission VARCHAR(4000);
    -- DECLARE v_id_order_new INT;
    DECLARE v_id_change_set INT;
    DECLARE v_is_new_manufacturing_purchase_order BIT;
    
	SET SESSION sql_mode = sys.list_drop(@@session.sql_mode, 'ONLY_FULL_GROUP_BY');
    
    SET v_code_error_type_bad_data = 'BAD_DATA';
    SET v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_bad_data LIMIT 1);
    SET v_code_error_type_no_permission = 'NO_PERMISSION';
    SET v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_no_permission LIMIT 1);
	SET v_guid_permission = UUID();
	-- SET v_id_user = CURRENT_USER();
	SET v_id_permission_manufacturing_purchase_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_MANUFACTURING_PURCHASE_ORDER' LIMIT 1);
	SET v_id_access_level_EDIT := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT');
    
	-- Argument default values
    IF a_guid IS NULL THEN 
		SET a_guid = UUID();
	END IF;
	IF a_active IS NULL THEN
		SET a_active = 0;
    END IF;
    
    -- Temporary tables
    /*
    CREATE TABLE tmp_Shop_Supplier_Purchase_Order (
		id_order INT NOT NULL PRIMARY KEY,
		id_supplier_ordered INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Supplier_Purchase_Order_id_supplier_ordered
			FOREIGN KEY (id_supplier_ordered) 
			REFERENCES Shop_Supplier(id_supplier),
		cost_total_local FLOAT NOT NULL,
		id_currency_cost INT NOT NULL
    );
    */
    
    CREATE TABLE tmp_Shop_Manufacturing_Purchase_Order_Product_Link (
		id_link INT NOT NULL PRIMARY KEY,
		id_order INT NOT NULL,
        /*
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_Manufacturing_Purchase_Order(id_order),
		*/
        id_permutation INT NOT NULL,
		CONSTRAINT FK_tmp_Manuf_Purch_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		cost_total_local FLOAT NOT NULL,
		id_currency_cost INT NOT NULL,
        value_produced_total_local FLOAT NOT NULL,
		quantity_used FLOAT NOT NULL,
		id_unit_quantity INT NOT NULL,
		CONSTRAINT FK_tmp_Manuf_Purch_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_produced FLOAT NULL,
		latency_manufacture_days INT NOT NULL,
		display_order INT NOT NULL,
        active BIT NOT NULL,
        name_error VARCHAR(200) NOT NULL
    );
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Argument validation
    # User ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_id_user) OR NOT EXISTS (SELECT * FROM Shop_User WHERE id_user = a_id_user) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid User ID: ', IFNULL(a_id_user, 'NULL')))
			;
		END IF;
    END IF;
    
    # Order ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_id_order) OR ((a_id_order > 0) AND NOT EXISTS (SELECT * FROM Shop_Manufacturing_Purchase_Order WHERE id_order = a_id_order)) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid Manufacturing Purchase Order ID: ', IFNULL(a_id_order, 'NULL')))
			;
		END IF;
    END IF;
    
    /*
    # Supplier ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_id_supplier_ordered) OR NOT EXISTS (SELECT * FROM Shop_Supplier WHERE id_supplier = a_id_supplier_ordered) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid supplier ID: ', IFNULL(a_id_supplier_ordered, 'NULL')))
			;
		END IF;
    END IF;
    */
    
    # Currency ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_id_currency_cost) OR NOT EXISTS (SELECT * FROM Shop_Currency WHERE id_currency = a_id_currency_cost) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid currency ID: ', IFNULL(a_id_currency, 'NULL')))
			;
		END IF;
    END IF;
    
    # Comment
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_comment) OR TRIM(a_comment) = '' THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, 'A comment must be provided.')
			;
		END IF;
    END IF;
    

	-- Get data from Temp table
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		SET v_is_new_manufacturing_purchase_order := CASE WHEN a_id_order <= 0 THEN 1 ELSE 0 END;
		
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
        /*
		VALUES 
			(a_id_supplier, a_name_company, a_name_contact, a_department_contact, a_id_address, a_phone_number, a_fax, a_email, a_website, a_id_currency, a_active)
		*/
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
            CONCAT(PP.id_permutation, ' - ', IFNULL(P.name ,'')) AS name_error
        FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp MPOPL_T
        INNER JOIN Shop_Product_Permutation PP ON MPOPL_T.id_permutation = PP.id_permutation
        INNER JOIN Shop_Product P ON PP.id_product = P.id_product
		WHERE MPOPL_T.GUID = a_guid
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
        DELETE MPOPL_T
		FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp MPOPL_T
		WHERE MPOPL_T.GUID = a_guid
        ;
    END IF;
    
    -- Invalid quantity used
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link 
            WHERE 
				NOT ISNULL(quantity_used)
				AND quantity_used < 0
		) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			SELECT
				a_guid, 
                v_id_error_type_bad_data, 
                v_code_error_type_bad_data, 
                CONCAT('Invalid quantity used property for the following permutations: ', GROUP_CONCAT(t_MPOPL.name_error SEPARATOR ', '))
			FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
            WHERE t_MPOPL.quantity_used < 0
			;
        END IF;
    END IF;
    
    -- Invalid quantity produced
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link 
            WHERE 
				NOT ISNULL(quantity_produced)
				AND quantity_produced < 0
		) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			SELECT
				a_guid, 
                v_id_error_type_bad_data, 
                v_code_error_type_bad_data, 
                CONCAT('Invalid quantity produced property for the following permutations: ', GROUP_CONCAT(t_MPOPL.name_error SEPARATOR ', '))
			FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
            WHERE t_MPOPL.quantity_produced < 0
			;
        END IF;
    END IF;
    
    -- Duplicates
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF EXISTS (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL GROUP BY id_permutation HAVING COUNT(*) > 1) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			SELECT
				a_guid, 
                v_id_error_type_bad_data, 
                v_code_error_type_bad_data, 
                CONCAT('Duplicate records: ', GROUP_CONCAT(t_MPOPLC.name_error SEPARATOR ', '))
			FROM (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL GROUP BY id_permutation HAVING COUNT(*) > 1) t_MPOPLC
			;
        END IF;
	END IF;
    
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
        SET v_ids_product := (
			SELECT GROUP_CONCAT(G.id_product SEPARATOR ',')
            FROM (
				SELECT DISTINCT PP.id_product
				FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPO
				INNER JOIN Shop_Product_Permutation PP ON t_MPO.id_permutation = PP.id_permutation
			) G
		);
        
        CALL p_shop_calc_user(v_guid_permission, a_id_user, 0, v_id_permission_manufacturing_purchase_order, v_id_access_level_edit, v_ids_product);
        
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
        
        IF v_has_permission = 0 THEN
			SET v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'NO_PERMISSION');
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, msg
			)
			SELECT
				a_guid, 
				v_id_error_type_no_permission, 
				CONCAT('You do not have ', name, ' permissions.')
			FROM Shop_Permission
            WHERE id_permission = v_id_permission_manufacturing_purchase_order
			;
        END IF;
        */
        SET v_ids_product_no_permission := (
			SELECT GROUP_CONCAT(PT.id_product SEPARATOR ',') 
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
				a_guid, 
				v_id_error_type_no_permission, 
                v_code_error_type_no_permission,
                CONCAT('You do not have permission to edit the following product IDs: ', v_ids_product_no_permission)
			)
			;
        END IF;
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
				CONCAT(
					'Save ',
					CASE WHEN v_is_new_manufacturing_purchase_order = 1 THEN 'new ' ELSE '' END,
					'Manufacturing Purchase Order - ', 
					a_comment
				),
				a_id_user,
				CURRENT_TIME()
			);
			
			SET v_id_change_set := (SELECT id_change_set FROM Shop_Sales_And_Purchasing_Change_Set ORDER BY id_change_set DESC LIMIT 1);
			
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
					-- a_id_supplier_ordered,
					SUM(t_MPOPL.cost_total_local),
                    a_id_currency_cost,
					SUM(t_MPOPL.value_produced_total_local),
                    a_id_user,
                    v_id_change_set,
                    a_active
				FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
				;
                -- SET v_id_order_new 
                SET a_id_order := (SELECT id_order FROM Shop_Manufacturing_Purchase_Order ORDER BY id_order DESC LIMIT 1);
                
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
					a_id_order, -- v_id_order_new,
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
                    a_id_user,
                    v_id_change_set
				FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
				;
			ELSE
				UPDATE Shop_Manufacturing_Purchase_Order MPO
				INNER JOIN tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL ON MPO.id_order = t_MPOPL.id_order
                SET
					-- MPO.id_supplier_ordered = a_id_supplier_ordered,
					MPO.cost_total_local = SUM(t_MPOPL.cost_total_local),
                    MPO.value_produced_total_local = SUM(t_MPOPL.value_produced_total_local),
                    MPO.id_currency = a_id_currency_cost,
                    MPO.id_change_set = v_id_change_set,
                    MPO.active = a_active
				WHERE MPO.id_order = a_id_order
				;
                IF EXISTS (SELECT * FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL INNER JOIN Shop_Manufacturing_Purchase_Order_Product_Link MPOPL ON t_MPOPL.id_link = MPOPL.id_link) THEN
					UPDATE Shop_Manufacturing_Purchase_Order_Product_Link MPOPL
					INNER JOIN tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
						ON MPOPL.id_link = t_MPOPL.id_link
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
                        a_id_user,
						v_id_change_set
					FROM tmp_Shop_Manufacturing_Purchase_Order_Product_Link t_MPOPL
                    WHERE t_MPOPL.id_link < 0
					;
                END IF;
			END IF;
		
		IF EXISTS (SELECT * FROM tmp_Msg_Error) THEN
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
    END IF;
    
    -- Returns
    # SET v_now = NOW();
    
    # Manufacturing Purchase Orders
    SELECT *
    FROM Shop_Manufacturing_Purchase_Order
    WHERE 
		id_order = a_id_order
        -- GUID = a_guid
    ;
    
    # Manufacturing Purchase Order Product Links
    SELECT *
    FROM Shop_Manufacturing_Purchase_Order_Product_Link
    WHERE
		id_order = a_id_order
        -- GUID = a_guid
    ;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
	;
    
    # DROP TABLE tmp_Shop_Manufacturing_Purchase_Order;
    DROP TABLE tmp_Shop_Manufacturing_Purchase_Order_Product_Link;
    DROP TABLE tmp_Msg_Error;
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
	quantity_used,
	id_unit_quantity,
	quantity_produced,
	latency_manufacture_days,
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
		1, # quantity_used,
		1, # id_unit_quantity,
		1, # quantity_produced,
		14, # latency_manufacture_days ,
		1, # display_order
        1 # active
    )
;

SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

CALL p_shop_save_manufacturing_purchase_order (
	'NIPS', # a_guid
    'auth0|6582b95c895d09a70ba10fef', # a_id_user
    -1, # a_id_order
    1, # a_id_currency_cost
    1, # a_active
    'Initial data' # a_comment
);

SELECT * FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;

DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link;
DELETE FROM Shop_Manufacturing_Purchase_Order_Product_Link_Temp;
DELETE FROM Shop_Manufacturing_Purchase_Order_Audit;
DELETE FROM Shop_Manufacturing_Purchase_Order;


*/

