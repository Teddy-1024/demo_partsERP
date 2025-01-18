


/*

CALL p_shop_get_many_stripe_product_new (
	''
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_stripe_product_new;


DELIMITER //
CREATE PROCEDURE p_shop_get_many_stripe_product_new (
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
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_User;
    
    CREATE TABLE tmp_Shop_User(
		id_user INT NOT NULL PRIMARY KEY,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BIT NOT NULL
    );
    
    CREATE TABLE tmp_Shop_Product (
		id_product INT NOT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product(id_product),
		id_permutation INT NULL,
        CONSTRAINT FK_tmp_Shop_Product_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation(id_permutation),
        active BIT NOT NULL,
        display_order_product INT NOT NULL,
        display_order_permutation INT NOT NULL,
        name VARCHAR(200) NOT NULL,
        description VARCHAR(4000) NOT NULL
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
    
    
    
    -- User
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
            'User ID not valid.'
		)
        ;
    END IF;
    
    -- Get products
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		INSERT INTO tmp_Shop_Product (
			id_product,
            id_permutation,
            active,
            display_order_product,
            display_order_permutation,
            name,
            description
		)
        SELECT id_product,
			id_permutation,
			active,
            display_order_product,
            display_order_permutation,
            name,
            description
		FROM (
			SELECT id_product,
				NULL AS id_permutation,
				active,
                display_order AS display_order_product,
                NULL AS display_order_permutation,
                name,
                description,
                id_stripe_product
			FROM Shop_Product P
			UNION
			SELECT t_PPPV.id_product,
				id_permutation,
				t_PPPV.active,
                display_order_product,
                display_order_permutation,
                CONCAT(P.name, ': ', names_variation) AS name,
                CONCAT(P.description, ' With variations: ', type_name_pairs_variation) AS description,
                t_PPPV.id_stripe_product
			FROM (
				SELECT P.id_product,
					PP.id_permutation,
					PP.active,
					P.display_order AS display_order_product,
					PP.display_order AS display_order_permutation,
					GROUP_CONCAT(V.name SEPARATOR ' ') AS names_variation,
					GROUP_CONCAT(CONCAT(VT.name, ': ', V.name) SEPARATOR ', ') AS type_name_pairs_variation,
					PP.id_stripe_product
                FROM Shop_Product_Permutation PP
				INNER JOIN Shop_Product P
					ON PP.id_product = P.id_product
						AND P.active
				INNER JOIN Shop_Product_Permutation_Variation_Link PPVL
					ON PP.id_permutation = PPVL.id_permutation
						AND PPVL.active
				INNER JOIN Shop_Variation V
					ON PPVL.id_variation = V.id_variation
						AND V.active
				INNER JOIN Shop_Variation_Type VT
					ON V.id_type = VT.id_type
						AND VT.active
				GROUP BY id_product, id_permutation -- , VT.id_type, V.id_variation
			) t_PPPV
			INNER JOIN Shop_Product P
				ON t_PPPV.id_product = P.id_product
		) t_PPP
		WHERE ISNULL(id_stripe_product)
			AND active
		;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		CALL p_shop_calc_user (
			v_guid, # a_guid
			a_id_user, 	# a_id_user
			0,		# a_get_inactive_users
			CONVERT((SELECT id_permission FROM Shop_Permission WHERE 'STORE_ADMIN' = code), CHAR),		# a_ids_permission
			(SELECT id_access_level FROM Shop_Access_Level WHERE code = 'ADMIN' AND active),		# a_ids_access_level
			(SELECT GROUP_CONCAT(id_product SEPARATOR ',') From tmp_Shop_Product),		# a_ids_product
			(SELECT GROUP_CONCAT(id_permutation SEPARATOR ',') From tmp_Shop_Product)		# a_ids_permutation --  WHERE NOT ISNULL(id_permutation)
		);
        
        IF EXISTS (SELECT can_admin FROM Shop_Calc_User_Temp WHERE guid = v_guid AND NOT can_admin) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_code_error_permission, 
				'User ID does not have permission to get all new stripe products.'
			)
			;
        END IF;
        
        DELETE FROM Shop_Calc_User_Temp
        WHERE guid = v_guid
        ;
    END IF;
    
    
    
    
    -- Returns
    /*
    SELECT *
    FROM tmp_Shop_User
    ;
    */
    
    IF EXISTS (SELECT * FROM tmp_Msg_Error WHERE guid = v_guid LIMIT 1) THEN
		DELETE FROM tmp_Shop_Product;
	END IF;
    
	SELECT id_product,
		id_permutation,
		name,
		description
	FROM tmp_Shop_Product
	ORDER BY display_order_product, display_order_permutation
	;
	SELECT PP.id_permutation,
		V.id_variation,
		V.name AS name_variation,
		VT.id_type AS id_type_variation,
		VT.name as name_variation_type
	FROM tmp_Shop_Product t_P
	INNER JOIN Shop_Product_Permutation PP
		ON t_P.id_permutation = PP.id_permutation
	INNER JOIN Shop_Product_Permutation_Variation_Link PPVL
		ON PP.id_permutation = PPVL.id_permutation
			AND PPVL.active
	INNER JOIN Shop_Variation V
		ON PPVL.id_variation = V.id_variation
			AND V.active
	INNER JOIN Shop_Variation_Type VT
		ON V.id_type = VT.id_type
			AND VT.active
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
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_User;
END //
DELIMITER ;


/*
CALL p_shop_get_many_stripe_product_new (
	''
);

CALL p_shop_get_many_stripe_product_new (
	'auth0|6582b95c895d09a70ba10fef'
);



select * from shop_product;
select * from shop_product_permutation_variation_link;

CALL p_shop_calc_user (
			'ead789a1-c7ac-11ee-a256-b42e9986184a', # a_guid
			'auth0|6582b95c895d09a70ba10fef', 	# a_id_user
			0,		# a_get_inactive_users
			'4',		# a_ids_permission
			'3',		# a_ids_access_level
			'1',		# a_ids_product
			'1'		# a_ids_permutation --  WHERE NOT ISNULL(id_permutation)
		);
        
*/
