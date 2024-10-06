



-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_save_supplier_purchase_order;

DROP TABLE IF EXISTS tmp_Shop_Supplier_Purchase_Order_Product_Link;
DROP TABLE IF EXISTS tmp_Msg_Error;

DELIMITER //
CREATE PROCEDURE p_shop_save_supplier_purchase_order (
	IN a_guid VARCHAR(500),
    IN a_id_user INT,
    IN a_comment VARCHAR(500),
    IN a_id_order INT,
    IN a_id_supplier_ordered INT,
    IN a_id_currency_cost INT
    -- IN a_active BIT
)
BEGIN
    DECLARE v_id_error_type_bad_data INT;
    DECLARE v_code_error_type_bad_data VARCHAR(50);
    DECLARE v_id_error_type_no_permission INT;
    DECLARE v_code_error_type_no_permission VARCHAR(50);
    DECLARE v_guid_permission BINARY(36);
    -- DECLARE v_id_user VARCHAR(100);
    DECLARE v_id_permission_supplier_purchase_order INT;
	DECLARE v_id_access_level_EDIT INT;
    DECLARE v_ids_product VARCHAR(4000);
    DECLARE v_ids_product_no_permission VARCHAR(4000);
    -- DECLARE v_id_order_new INT;
    DECLARE v_id_change_set INT;
    DECLARE v_is_new_supplier_purchase_order BIT;
    
	-- SET SESSION sql_mode = sys.list_drop(@@session.sql_mode, 'ONLY_FULL_GROUP_BY');
    
    SET v_code_error_type_bad_data = 'BAD_DATA';
    SET v_id_error_type_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_bad_data LIMIT 1);
    SET v_code_error_type_no_permission = 'NO_PERMISSION';
    SET v_id_error_type_no_permission := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_type_no_permission LIMIT 1);
	SET v_guid_permission = UUID();
	-- SET v_id_user = CURRENT_USER();
	SET v_id_permission_supplier_purchase_order := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_SUPPLIER_PURCHASE_ORDER' LIMIT 1);
	SET v_id_access_level_EDIT := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT');
    
	-- Argument default values
    IF a_guid IS NULL THEN 
		SET a_guid = UUID();
	END IF;
    /*
	IF a_active IS NULL THEN
		SET a_active = 0;
    END IF;
    */
    
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
    
    CREATE TABLE tmp_Shop_Supplier_Purchase_Order_Product_Link (
		id_link INT NOT NULL PRIMARY KEY,
		id_order INT NOT NULL,
        /*
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_order
			FOREIGN KEY (id_order) 
			REFERENCES Shop_Supplier_Purchase_Order(id_order),
		*/
        id_permutation INT NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_permutation
			FOREIGN KEY (id_permutation) 
			REFERENCES Shop_Product_Permutation(id_permutation),
		cost_total_local FLOAT NOT NULL,
		id_currency_cost INT NOT NULL,
		quantity_ordered FLOAT NOT NULL,
		id_unit_quantity INT NOT NULL,
		CONSTRAINT FK_tmp_Supplier_Purchase_Order_Product_Link_id_unit_quantity
			FOREIGN KEY (id_unit_quantity)
			REFERENCES Shop_Unit_Measurement(id_unit_measurement),
		quantity_received FLOAT NULL,
		latency_delivery_days INT NOT NULL,
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
		IF ISNULL(a_id_order) OR ((a_id_order > 0) AND NOT EXISTS (SELECT * FROM Shop_Supplier_Purchase_Order WHERE id_order = a_id_order)) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid Supplier Purchase Order ID: ', IFNULL(a_id_order, 'NULL')))
			;
		END IF;
    END IF;
    
    # Supplier ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF ISNULL(a_id_supplier_ordered) OR NOT EXISTS (SELECT * FROM Shop_Supplier WHERE id_supplier = a_id_supplier_ordered) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			VALUES
				(a_guid, v_id_error_type_bad_data, v_code_error_type_bad_data, CONCAT('Invalid Supplier ID: ', IFNULL(a_id_supplier_ordered, 'NULL')))
			;
		END IF;
    END IF;
    
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
		SET v_is_new_supplier_purchase_order := CASE WHEN a_id_order <= 0 THEN 1 ELSE 0 END;
		
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
        /*
		VALUES 
			(a_id_supplier, a_name_company, a_name_contact, a_department_contact, a_id_address, a_phone_number, a_fax, a_email, a_website, a_id_currency, a_active)
		*/
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
            CONCAT(PP.id_permutation, ' - ', IFNULL(PP.name ,'')) AS name_error
        FROM Shop_Supplier_Purchase_Order_Product_Link_Temp SPOPL_T
        INNER JOIN Shop_Product_Permutation PP ON SPOPL_T.id_permutation = PP.id_permutation
		WHERE SPOPL_T.GUID = a_guid
        ;
        DELETE SPOPL_T
		FROM Shop_Supplier_Purchase_Order_Product_Link_Temp SPOPL_T
		WHERE SPOPL_T.GUID = a_guid
        ;
        
        /*
        UPDATE tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
        SET 
			cost_total_local
		*/
    END IF;
    
    -- Invalid quantity ordered
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Shop_Supplier_Purchase_Order_Product_Link 
            WHERE 
				NOT ISNULL(quantity_ordered)
				AND quantity_ordered < 0
		) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			SELECT
				a_guid, 
                v_id_error_type_bad_data, 
                v_code_error_type_bad_data, 
                CONCAT('Invalid quantity ordered property for the following permutations: ', GROUP_CONCAT(t_SPOPL.name_error SEPARATOR ', '))
			FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
            -- INNER JOIN Shop_Product_Permutation PP ON t_SPOPL.id_permutation = PP.id_permutation
            WHERE t_SPOPL.quantity_ordered < 0
			;
        END IF;
    END IF;
    
    -- Duplicates
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF EXISTS (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL GROUP BY id_permutation HAVING COUNT(*) > 1) THEN
			INSERT INTO tmp_Msg_Error ( 
				guid, id_type, code, msg
			)
			SELECT
				a_guid, 
                v_id_error_type_bad_data, 
                v_code_error_type_bad_data, 
                CONCAT('Duplicate records: ', GROUP_CONCAT(t_SPOPLC.name_error SEPARATOR ', '))
			FROM (SELECT id_permutation, name_error, COUNT(*) FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL GROUP BY id_permutation HAVING COUNT(*) > 1) t_SPOPLC
			;
        END IF;
	END IF;
    
    
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
        SET v_ids_product := (
			SELECT GROUP_CONCAT(G.id_product SEPARATOR ',')
            FROM (
				SELECT DISTINCT PP.id_product
				FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPO
				INNER JOIN Shop_Product_Permutation PP ON t_SPO.id_permutation = PP.id_permutation
			) G
		);
        
        CALL p_shop_calc_user(v_guid_permission, a_id_user, 0, v_id_permission_supplier_purchase_order, v_id_access_level_edit, v_ids_product);
        
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
            WHERE id_permission = v_id_permission_supplier_purchase_order
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
        
        DELETE FROM Shop_Calc_User_Temp
        WHERE GUID = a_guid;
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
					CASE WHEN v_is_new_supplier_purchase_order = 1 THEN 'new ' ELSE '' END,
					'Supplier Purchase Order - ', 
					a_comment
				),
				a_id_user,
				CURRENT_TIME()
			);
			
			SET v_id_change_set := (SELECT id_change_set FROM Shop_Sales_And_Purchasing_Change_Set ORDER BY id_change_set DESC LIMIT 1);
			
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
					a_id_supplier_ordered,
					SUM(t_SPOPL.cost_total_local),
                    a_id_currency_cost,
                    a_id_user,
                    v_id_change_set,
                    a_active
				FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
				;
                -- SET v_id_order_new 
                SET a_id_order := (SELECT id_order FROM Shop_Supplier_Purchase_Order ORDER BY id_order DESC LIMIT 1);
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
					a_id_order, -- v_id_order_new,
					id_permutation,
					cost_total_local,
					id_currency_cost,
					quantity_ordered,
					id_unit_quantity,
					quantity_received,
					latency_delivery_days,
					display_order,
                    active,
                    a_id_user,
                    v_id_change_set
				FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
				;
			ELSE
				UPDATE Shop_Supplier_Purchase_Order SPO
				INNER JOIN tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL ON SPO.id_order = t_SPOPL.id_order
                SET
					SPO.id_supplier_ordered = a_id_supplier_ordered,
					SPO.cost_total_local = SUM(t_SPOPL.cost_total_local),
                    SPO.id_currency = a_id_currency_cost,
                    SPO.id_change_set = v_id_change_set,
                    SPO.active = a_active
				WHERE SPO.id_order = a_id_order
				;
                IF EXISTS (SELECT * FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL INNER JOIN Shop_Supplier_Purchase_Order_Product_Link SPOPL ON t_SPOPL.id_link = SPOPL.id_link) THEN
					UPDATE Shop_Supplier_Purchase_Order_Product_Link SPOPL
					INNER JOIN tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
						ON SPOPL.id_link = t_SPOPL.id_link
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
                        a_id_user,
						v_id_change_set
					FROM tmp_Shop_Supplier_Purchase_Order_Product_Link t_SPOPL
                    WHERE t_SPOPL.id_link < 0
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
    
    # Supplier Purchase Orders
    SELECT *
    FROM Shop_Supplier_Purchase_Order
    WHERE id_order = a_id_order
    ;
    
    # Supplier Purchase Order Product Links
    SELECT *
    FROM Shop_Supplier_Purchase_Order_Product_Link
    WHERE id_order = a_id_order
    ;
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
	;
    
    # DROP TABLE tmp_Shop_Supplier_Purchase_Order;
    DROP TABLE tmp_Shop_Supplier_Purchase_Order_Product_Link;
    DROP TABLE tmp_Msg_Error;
END //
DELIMITER ;;


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

SELECT * FROM Shop_Supplier_Purchase_Order_Product_Link_Temp;

CALL p_shop_save_supplier_purchase_order (
	'NIPS', # a_guid
    'auth0|6582b95c895d09a70ba10fef', # a_id_user
    -1, # a_id_order
    1, # a_id_supplier_ordered
    1 # a_id_currency_cost
);

SELECT * FROM Shop_Supplier_Purchase_Order_Product_Link_Temp;

DELETE FROM Shop_Supplier_Purchase_Order_Product_Link_Audit;
DELETE FROM Shop_Supplier_Purchase_Order_Product_Link;
DELETE FROM Shop_Supplier_Purchase_Order_Product_Link_Temp;
DELETE FROM Shop_Supplier_Purchase_Order_Audit;
DELETE FROM Shop_Supplier_Purchase_Order;


*/

