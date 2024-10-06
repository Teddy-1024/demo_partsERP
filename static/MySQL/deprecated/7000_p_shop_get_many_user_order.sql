


/*

CALL p_shop_get_many_user_order (
	'',
    '',
	1,
    ''
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_user_order;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_user_order (
	IN a_id_user INT,
    IN a_ids_order VARCHAR(4000),
    IN a_n_order_max INT,
	IN a_id_checkout_session VARCHAR(200)
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_user BIT;
    DECLARE v_has_filter_order BIT;
    DECLARE v_has_filter_session BIT;
    DECLARE v_code_error_data VARCHAR(200);
    DECLARE v_code_error_permission VARCHAR(200);
    DECLARE v_guid BINARY(36);
    
    SET v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 1);
    SET v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
	SET v_guid = UUID();
    
	-- Argument validation + default values
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_ids_order IS NULL THEN
		SET a_ids_order = '';
	ELSE
		SET a_ids_order = TRIM(a_ids_order);
    END IF;
	IF a_n_order_max IS NULL THEN
		SET a_n_order_max = 1;
    END IF;
	IF a_id_checkout_session IS NULL THEN
		SET a_id_checkout_session = '';
	ELSE
		SET a_id_checkout_session = TRIM(a_id_checkout_session);
    END IF;
    
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_User;
    DROP TABLE IF EXISTS tmp_Shop_Order;
    
    CREATE TABLE tmp_Shop_User(
		id_user INT NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BIT NOT NULL
    );
    
    CREATE TABLE tmp_Shop_Order (
		id_order INT NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_Order_id_order
			FOREIGN KEY (id_order)
			REFERENCES Shop_User_Order(id_order),
        active BIT NOT NULL
    );
    
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		# id_type INT NOT NULL,
		# CONSTRAINT FK_tmp_Msg_Error_id_type FOREIGN KEY (id_type)
		# 	REFERENCES Shop_Msg_Error_Type (id_type),
		code VARCHAR(50),
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Parse filters
    SET v_has_filter_user = CASE WHEN a_id_user = '' THEN 0 ELSE 1 END;
	SET a_ids_order = REPLACE(a_ids_order, '|', ',');
    SET v_has_filter_order = CASE WHEN a_ids_order = '' THEN 0 ELSE 1 END;
    SET v_has_filter_session = CASE WHEN a_id_checkout_session = '' THEN 0 ELSE 1 END;
    
    -- User
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF v_has_filter_user THEN
			INSERT INTO tmp_Shop_User (
				id_user,
				active
			)
			SELECT id_user,
				active
			FROM Shop_User
			WHERE id_user LIKE CONCAT('%', a_id_user, '%')
				AND active
			LIMIT 1
			;
			
			SET v_has_filter_user = EXISTS (SELECT id_user FROM tmp_Shop_User LIMIT 1);
			SET a_id_user := (SELECT id_user FROM tmp_Shop_User LIMIT 1);
		END IF;
    END IF;
	IF NOT v_has_filter_user THEN
		INSERT INTO tmp_Msg_Error (
			guid,
			code,
			msg
		)
		VALUES (
			v_guid,
			v_code_error_data, 
			'User ID not valid.'
		)
		;
	END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		CALL p_shop_user_eval (
			v_guid, # a_guid
			a_id_user, 	# a_id_user
			0,		# a_get_inactive_users
			CONVERT((SELECT id_permission FROM Shop_Permission WHERE 'STORE_USER' = code), CHAR),		# a_ids_permission
			(SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' AND active),		# a_ids_access_level
			'',		# a_ids_product
            ''		# a_ids_permutation
		);
        
        IF NOT (SELECT can_edit FROM Shop_User_Eval_Temp WHERE guid = v_guid) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_code_error_permission, 
				'User ID does not have permission to access orders.'
			)
			;
        END IF;
        
        DELETE FROM Shop_User_Eval_Temp
        WHERE guid = v_guid
        ;
    END IF;
    
    -- Invalid Orders
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		# Invalid Order IDs
		IF EXISTS (SELECT * FROM Shop_User_Order WHERE NOT (id_user = a_id_user) AND v_has_filter_order AND FIND_IN_SET(id_order, a_ids_order) > 0) THEN  # id_order LIKE CONCAT('%', a_ids_order, '%') LIMIT 1) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
                msg
            )
            VALUES (
				v_guid,
				v_code_error_data, 
				CONCAT('You do not have access to the following order IDs: ', (SELECT GROUP_CONCAT(id_order SEPARATOR ', ') FROM Shop_User_Order WHERE NOT (id_user = a_id_user) AND FIND_IN_SET(id_order, a_ids_order) > 0)) # id_order LIKE CONCAT('%', a_ids_order, '%'))) # AND v_has_filter_order  # filtered by parent condition
			)
            ;
        END IF;
        # Invalid Checkout Session IDs
		IF EXISTS (SELECT * FROM Shop_User_Order WHERE NOT (id_user = a_id_user) AND v_has_filter_session AND id_checkout_session = a_id_checkout_session) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
                msg
            )
            VALUES (
				v_guid,
				v_code_error_data, 
				CONCAT('You do not have access to the following checkout session IDs: ', (SELECT GROUP_CONCAT(id_order SEPARATOR ', ') FROM Shop_User_Order WHERE NOT (id_user = a_id_user) AND id_checkout_session = a_id_checkout_session)) # AND v_has_filter_order  # filtered by parent condition
			)
            ;
        END IF;
    END IF;
    
    -- Valid Orders
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
    
		INSERT INTO tmp_Shop_Order (
			id_order, 
			active
		)
		SELECT UO.id_order,
			UO.active
		FROM Shop_User_Order UO
		INNER JOIN tmp_Shop_User t_U
			ON UO.id_user = t_U.id_user
				AND t_U.active
		WHERE ((NOT v_has_filter_order OR FIND_IN_SET(UO.id_order, a_ids_order) > 0) # UO.id_order LIKE CONCAT('%', a_ids_order, '%'))
			OR (NOT v_has_filter_session OR UO.id_checkout_session = a_id_checkout_session))
			AND UO.active
		;
    END IF;
    
    
    
    -- Returns
    /*
    SELECT *
    FROM tmp_Shop_User
    ;
    */
    
    SELECT t_O.id_order,
		UOPL.id_product,
		UOPL.id_permutation,
        UOPL.quantity
	FROM tmp_Shop_Order t_O
	INNER JOIN Shop_User_Order UO
		ON t_O.id_order = UO.id_order
	INNER JOIN Shop_User_Order_Product_Link UOPL
		ON UO.id_order = UOPL.id_order
	WHERE t_O.active
    ;
    
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
    WHERE guid = v_guid
    ;
    
    
    /*
    # Return arguments for test
    SELECT
		a_id_user,
		a_ids_order,
		a_n_order_max,
		a_id_checkout_session
    ;
    */
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_User;
    DROP TABLE IF EXISTS tmp_Shop_Order;
END //
DELIMITER ;;


/*

CALL p_shop_get_many_user_order (
	'auth0|6582b95c895d09a70ba10fef',
    '1',
	0,
    ''
);

CALL p_shop_get_many_user_order (
	'',
    '1',
	0,
    ''
);

insert into shop_product_change_set (comment)
    values ('set product not subscription - test bool output to python');
    update shop_product
    set is_subscription = 0,
		id_change_set = (select id_change_set from shop_product_change_set order by id_change_set desc limit 1)
    where id_product = 1
select * from shop_User;
select * from shop_User_oRDER;
*/
