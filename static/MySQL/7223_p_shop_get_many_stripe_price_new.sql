


/*

CALL p_shop_get_many_stripe_price_new (
	''
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_stripe_price_new;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_stripe_price_new (
	IN a_id_user INT
)
BEGIN
    DECLARE v_has_filter_user BIT;
    DECLARE v_code_error_data VARCHAR(200);
    DECLARE v_code_error_permission VARCHAR(200);
    DECLARE v_guid BINARY(36);
    
    SET v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 1);
    SET v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
	SET v_guid = UUID();
    

    
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
    
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Shop_Product_Currency_Link;
    DROP TABLE IF EXISTS tmp_Shop_User;
    
    CREATE TABLE tmp_Shop_User(
		id_user INT NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BIT NOT NULL
    );
    
    CREATE TABLE tmp_Shop_Product_Currency_Link (
		id_link INT NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_Product_Currency_Link_id_link
			FOREIGN KEY (id_link)
			REFERENCES Shop_Product_Currency_Link(id_link),
        id_product INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_Currency_Link_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
        id_permutation INT NULL,
        CONSTRAINT FK_tmp_Shop_Product_Currency_Link_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
		id_currency INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_Currency_Link_id_currency
			FOREIGN KEY (id_currency)
			REFERENCES Shop_Currency(id_currency),
		active BIT NOT NULL
    );
    
    CREATE TABLE IF NOT EXISTS tmp_Msg_Error ( # IF NOT EXISTS 
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		code VARCHAR(50) NOT NULL,
        # CONSTRAINT chk_tmp_Msg_Error_code CHECK (code IN (SELECT code FROM Shop_Msg_Error_Type)),
		/*
        id_type INT NOT NULL,
        CONSTRAINT FK_tmp_Msg_Error_id_type
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type(id_type),
		*/
		msg VARCHAR(4000) NOT NULL
    );
    
    
    
    -- Parse filters
    SET v_has_filter_user = CASE WHEN a_id_user = '' THEN 0 ELSE 1 END;
    
    
    
    -- User permissions
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
    IF NOT v_has_filter_user THEN
		INSERT INTO tmp_Msg_Error (
			guid,
			code,
            msg
		)
        VALUES (
			v_guid,
			v_code_error_data, 
            'Valid user ID not provided.'
		)
        ;
    END IF;
    
    -- Get products
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		INSERT INTO tmp_Shop_Product_Currency_Link (
			id_link,
            id_product,
            id_permutation,
            id_currency,
            active
		)
        SELECT id_link,
            id_product,
            id_permutation,
            id_currency,
            active
		FROM Shop_Product_Currency_Link
		WHERE ISNULL(id_stripe_price)
			AND active
		;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		# SELECT * FROM tmp_Msg_Error LIMIT 1;
		CALL p_shop_user_eval (
			v_guid, # a_guid
			a_id_user, 	# a_id_user
			0,		# a_get_inactive_users
			CONVERT((SELECT id_permission FROM Shop_Permission WHERE 'STORE_ADMIN' = code), CHAR),		# a_ids_permission
			(SELECT id_access_level FROM Shop_Access_Level WHERE code = 'ADMIN' AND active),		# a_ids_access_level
			(SELECT GROUP_CONCAT(DISTINCT id_product SEPARATOR ',') FROM tmp_Shop_Product_Currency_Link), #  (SELECT DISTINCT id_product FROM tmp_Shop_Product_Currency_Link) calc_PCL)		# a_ids_product
            (SELECT GROUP_CONCAT(DISTINCT id_permutation SEPARATOR ',') FROM tmp_Shop_Product_Currency_Link) # a_ids_permutation
		);
		# SELECT * FROM tmp_Msg_Error LIMIT 1;
        
        IF EXISTS (SELECT can_admin FROM Shop_User_Eval_Temp WHERE guid = v_guid AND NOT can_admin LIMIT 1) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_code_error_permission, 
				'User ID does not have permission to get all new stripe prices.'
			)
			;
        END IF;
        
        DELETE FROM Shop_User_Eval_Temp
        WHERE guid = v_guid
        ;
    END IF;
    
    
    
    -- Returns
    IF EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		DELETE FROM tmp_Shop_Product_Currency_Link;
	END IF;
    /*
    SELECT *
    FROM tmp_Shop_User
    ;
    */
    
    
	SELECT t_PCL.id_product,
		t_PCL.id_permutation,
		P.price_GBP_full * C.factor_from_GBP AS unit_price,
		C.code AS code_currency,
		P.id_stripe_product,
		P.is_subscription,
		LOWER(RI.code) AS name_recurring_interval,
		P.count_recurrence_interval
	FROM tmp_Shop_Product_Currency_Link t_PCL
	INNER JOIN Shop_Product P
		ON t_PCL.id_product = P.id_product
		AND P.active
	INNER JOIN Shop_Recurrence_Interval RI
		ON P.id_recurrence_interval = RI.id_interval
		AND RI.active
	INNER JOIN Shop_Currency C
		ON t_PCL.id_currency = C.id_currency
		AND C.active
	WHERE t_PCL.active
	;
    
    
    # Errors
    SELECT *
    FROM tmp_Msg_Error
    WHERE guid = v_guid
    ;
    
    
    /*
    # Return arguments for test
    SELECT
		a_id_user
    ;
    */
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_User;
    DROP TABLE IF EXISTS tmp_Shop_Product_Currency_Link;
END //
DELIMITER ;;


/*
CALL p_shop_get_many_stripe_price_new (
	''
);

CALL p_shop_get_many_stripe_price_new (
	'auth0|6582b95c895d09a70ba10fef'
);

*/
