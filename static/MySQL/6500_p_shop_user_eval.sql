
USE PARTSLTD_PROD;


/*

CALL p_shop_user_eval (
	UUID(), # a_guid
	'', 	# a_id_user
	0,		# a_get_inactive_users
    '1',	# a_ids_permission
    '',		# a_ids_access_level
	'1'		# a_ids_product
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_user_eval;

DELIMITER //
CREATE PROCEDURE p_shop_user_eval (
	IN a_guid VARCHAR(36),
    IN a_id_user VARCHAR(200),
    IN a_get_inactive_users BIT,
    IN a_ids_permission VARCHAR(500),
    IN a_ids_access_level VARCHAR(100),
    IN a_ids_product VARCHAR(4000) -- IN a_ids_permutation VARCHAR(4000)
)
BEGIN
	-- Variable declaration
    DECLARE v_has_filter_permission BIT;
    DECLARE v_has_filter_user BIT;
    DECLARE v_has_filter_access_level BIT;
    -- DECLARE v_has_filter_permutation BIT;
    DECLARE v_has_filter_product BIT;
    DECLARE v_id_permission_product INT;
    DECLARE v_id_permission INT;
    -- DECLARE v_ids_product VARCHAR(500);
    DECLARE v_id_access_level_view INT;
    # DECLARE v_id_access_level_product_required INT;
    DECLARE v_priority_access_level_view INT;
    DECLARE v_priority_access_level_edit INT;
    DECLARE v_priority_access_level_admin INT;
    DECLARE v_id_access_level INT;
    DECLARE v_priority_access_level INT;
    DECLARE v_now DATETIME;
	DECLARE v_ids_row_delete VARCHAR(500);
    DECLARE v_code_error_data VARCHAR(200);
    DECLARE v_id_error_data INT;
    DECLARE v_code_error_permission VARCHAR(200);
    
    SET v_id_error_data = 1;
    SET v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = v_id_error_data);
    
    SET v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
    
	-- Clear previous proc results
	# DROP TABLE IF EXISTS tmp_User_Role_Link;
	# DROP TEMPORARY TABLE IF EXISTS tmp_User_Role_Link;
	DROP TABLE IF EXISTS tmp_Shop_Product_p_Shop_User_Eval;
	# DROP TABLE IF EXISTS Shop_User_Eval_Temp;
    
    
	-- Parse arguments + get default values
    /*
	IF a_guid IS NULL THEN
		SET a_guid = UUID();
	END IF;
    */
	IF a_id_user IS NULL THEN
		SET a_id_user = '';
	ELSE
		SET a_id_user = TRIM(a_id_user);
    END IF;
	IF a_get_inactive_users IS NULL THEN
		SET a_get_inactive_users = 0;
    END IF;
    /*
	IF a_get_user_permissions IS NULL THEN
		SET a_get_user_permissions = 0;
    END IF;
    */
	IF a_ids_permission IS NULL THEN
		SET a_ids_permission = '';
	ELSE
		SET a_ids_permission = TRIM(a_ids_permission);
    END IF;
	IF a_ids_access_level IS NULL THEN
		SET a_ids_access_level = '';
	ELSE
		SET a_ids_access_level = TRIM(a_ids_access_level);
    END IF;
    /*
    IF a_ids_permutation IS NULL THEN
		SET a_ids_permutation = '';
	ELSE
		SET a_ids_permutation = TRIM(a_ids_permutation);
    END IF;
    */
    IF a_ids_product IS NULL THEN
		SET a_ids_product = '';
	ELSE
		SET a_ids_product = TRIM(a_ids_product);
    END IF;
    
    -- Permanent Table
	CREATE TABLE IF NOT EXISTS Shop_User_Eval_Temp (
		id_row INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
		guid VARCHAR(36) NOT NULL,
		id_user VARCHAR(200),
		id_permission_required INT NOT NULL,
		CONSTRAINT FK_Shop_User_Eval_Temp_id_permission_required
			FOREIGN KEY (id_permission_required)
			REFERENCES Shop_Permission (id_permission),
		/*
		id_access_level_required INT NOT NULL,
		CONSTRAINT FK_Shop_User_Eval_Temp_id_access_level_required
			FOREIGN KEY (id_access_level_required)
			REFERENCES Shop_Access_Level (id_access_level),
		*/
		priority_access_level_required INT NOT NULL,
        /*
		CONSTRAINT FK_Shop_User_Eval_Temp_priority_access_level_required
			FOREIGN KEY (priority_access_level_required)
			REFERENCES Shop_Access_Level (priority),
		*/
		id_product INT NULL,
		CONSTRAINT FK_Shop_User_Eval_Temp_id_product
			FOREIGN KEY (id_product)
			REFERENCES Shop_Product (id_product),
		/*
		id_permutation INT NULL,
		CONSTRAINT FK_Shop_User_Eval_Temp_id_permutation
			FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation (id_permutation),
		*/
        is_super_user BIT NULL,
		priority_access_level_user INT NULL,
        /*
		CONSTRAINT FK_Shop_User_Eval_Temp_priority_access_level_minimum
			FOREIGN KEY (priority_access_level_minimum)
			REFERENCES Shop_Access_Level (priority)
		*/
		can_view BIT,
		can_edit BIT,
		can_admin BIT -- DEFAULT 0
	);
	
	CREATE TABLE IF NOT EXISTS tmp_Shop_Product_p_Shop_User_Eval (
		id_row INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
		id_product INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Product_p_Shop_User_Eval_id_product FOREIGN KEY (id_product)
			REFERENCES Shop_Product (id_product),
		/*
		id_permutation INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Product_p_Shop_User_Eval_id_permutation FOREIGN KEY (id_permutation)
			REFERENCES Shop_Product_Permutation (id_permutation),
		*/
        id_access_level_required INT NOT NULL,
		CONSTRAINT FK_tmp_Shop_Product_p_Shop_User_Eval_id_access_level_required FOREIGN KEY (id_access_level_required)
			REFERENCES Shop_Access_Level (id_access_level),
		guid VARCHAR(36) NOT NULL,
        rank_product INT NOT NULL
	);
		
	CREATE TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid VARCHAR(36) NOT NULL,
		id_type INT NOT NULL,
		CONSTRAINT FK_tmp_Msg_Error_id_type 
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type (id_type),
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
		
    # select * from Shop_Msg_Error_Type;
    
    -- Parse filters
	IF a_guid IS NULL OR EXISTS (SELECT * FROM Shop_User_Eval_Temp WHERE a_guid = guid) THEN
		INSERT INTO tmp_Msg_Error (
			guid,
            id_type,
			code,
            msg
		)
        VALUES (
			a_guid,
            (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
			v_code_error_data, 
            CONCAT('Invalid guid argument: ', IFNULL(a_guid, 'NULL'))
		)
        ;
	END IF;
    SET v_has_filter_user = CASE WHEN a_id_user = '' THEN 0 ELSE 1 END;
	SET a_ids_permission = REPLACE(a_ids_permission, '|', ',');
    SET v_has_filter_permission = CASE WHEN a_ids_permission = '' THEN 0 ELSE 1 END;
	SET a_ids_access_level = REPLACE(a_ids_access_level, '|', ',');
    SET v_has_filter_access_level = CASE WHEN a_ids_access_level = '' THEN 0 ELSE 1 END;
    /*
	SET a_ids_permutation = REPLACE(a_ids_permutation, '|', ',');
    SET v_has_filter_permutation = CASE WHEN a_ids_permutation = '' THEN 0 ELSE 1 END;
    */
	SET a_ids_product = REPLACE(a_ids_product, '|', ',');
    SET v_has_filter_product = CASE WHEN a_ids_product = '' THEN 0 ELSE 1 END;
    SET v_id_access_level_view = (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_priority_access_level_view = (SELECT priority FROM Shop_Access_Level WHERE id_access_level = v_id_access_level_view);
    SET v_priority_access_level_edit = (SELECT priority FROM Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    SET v_priority_access_level_admin = (SELECT priority FROM Shop_Access_Level WHERE code = 'ADMIN' LIMIT 1);
    
    /*
    select v_priority_access_level_view,
		v_priority_access_level_edit,
        v_priority_access_level_admin
	;
    */
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
		IF v_has_filter_access_level THEN
			CALL p_split(a_ids_access_level, ',');
            
            IF EXISTS (
				SELECT ST.substring 
                FROM Split_Temp ST 
                LEFT JOIN Shop_Access_Level AL 
                ON ST.substring = AL.id_access_level
                WHERE 
					ISNULL(AL.id_access_level)
                    OR AL.active = 0
			) THEN
                INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					a_guid,	
					(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
					v_code_error_data, 
					CONCAT('Invalid access level IDs: ', GROUP_CONCAT(ST.substring SEPARATOR ', '))
				FROM Split_Temp ST 
				LEFT JOIN Shop_Access_Level AL ON ST.substring = AL.id_access_level
                WHERE ISNULL(AL.id_access_level)
				;
			ELSE
				SET v_id_access_level := (
					SELECT AL.id_access_level 
					FROM Split_Temp ST 
					INNER JOIN Shop_Access_Level AL 
						ON CONVERT(ST.substring, DECIMAL(10,0)) = AL.id_access_level
							AND AL.active 
					ORDER BY AL.priority ASC 
					LIMIT 1
				);
            END IF;
			DROP TABLE Split_Temp;
            
            /*
			IF 0 = v_id_access_level OR v_id_access_level <=> NULL THEN
				# SET v_has_filter_access_level = 0;
                INSERT INTO tmp_Msg_Error (
					guid,
					code,
					msg
				)
				SELECT
					a_guid,	
					v_code_error_data, 
					CONCAT('Invalid access level IDs: ', GROUP_CONCAT(ST.substring SEPARATOR ', '))
				FROM Split_Temp ST 
				LEFT JOIN Shop_Access_Level AL ON ST.substring = AL.id_access_level
                WHERE ISNULL(AL.id_access_level)
				;
			END IF;
            */
        /* select * from Shop_Access_Level
		END IF;
		IF NOT v_has_filter_access_level THEN
		*/
        ELSE
			SET v_id_access_level = v_id_access_level_view;
		END IF;
	END IF;
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
		/*
		IF v_has_filter_permutation THEN
			INSERT INTO tmp_Shop_Product_p_Shop_User_Eval (
				id_product,
                id_permutation,
				id_access_level_required,
				guid,
                rank_permutation
			)
			SELECT 
				PP.id_product,
                PP.id_permutation,
				PP.id_access_level_required,
				a_guid,
				RANK() OVER (ORDER BY PP.id_product, PP.id_permutation, AL.priority) AS rank_permutation
			FROM Shop_Product_Permutation PP
            INNER JOIN Shop_Access_Level AL
				ON PP.id_access_level_required = AL.id_access_level
					AND AL.active
			WHERE FIND_IN_SET(PP.id_permutation, a_ids_permutation) > 0
				# AND P.active # not worried as we want users to be able to see their order history
			;
            /*
            DELETE FROM tmp_Shop_Product_p_Shop_User_Eval
            WHERE rank_permutation > 1
            ;
            *
			SET v_has_filter_permutation = EXISTS (SELECT * FROM tmp_Shop_Product_p_Shop_User_Eval WHERE a_guid = guid);
		END IF;
        
		IF v_has_filter_permission THEN
            # Invalid permission IDs
            IF EXISTS (SELECT id_permission FROM Shop_Permission WHERE FIND_IN_SET(id_permission, a_ids_permission) > 0 AND NOT active) THEN
				INSERT INTO tmp_Msg_Error (
					guid,
					code,
					msg
				)
				VALUES (
					a_guid,
					v_code_error_data, 
					CONCAT('The following permissions are no longer active: ', (SELECT GROUP_CONCAT(name SEPARATOR ', ') FROM Shop_Permission WHERE FIND_IN_SET(id_permission, a_ids_permission) > 0 AND NOT active))
				)
				;
            END IF;
		END IF;
        */
        
		IF v_has_filter_product THEN
			CALL p_split(a_ids_product, ',');
            
			# Invalid product IDs
            IF EXISTS (SELECT * FROM Split_Temp ST LEFT JOIN Shop_Product P ON ST.substring = P.id_product WHERE ISNULL(P.id_product)) THEN 
				INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					a_guid,
					(SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
					v_code_error_data, 
					CONCAT('Invalid product IDs: ', IFNULL(GROUP_CONCAT(ST.substring SEPARATOR ', '), 'NULL'))
				FROM Split_Temp ST 
                LEFT JOIN Shop_Product P ON ST.substring = P.id_product 
                WHERE ISNULL(P.id_product)
				;
            END IF;
            
			IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
				INSERT INTO tmp_Shop_Product_p_Shop_User_Eval (
					id_product,
					-- id_permutation,
					id_access_level_required,
					guid,
					rank_product -- rank_permutation
				)
				SELECT 
					DISTINCT P.id_product,
					-- PP.id_permutation,
					P.id_access_level_required,
					a_guid,
					RANK() OVER (ORDER BY C.display_order, P.display_order) AS rank_product
				FROM Split_Temp ST
                INNER JOIN Shop_Product P ON ST.substring = P.id_product # Shop_Product_Permutation PP
                INNER JOIN Shop_Category C ON P.id_category = C.id_category
				INNER JOIN Shop_Access_Level AL
					ON P.id_access_level_required = AL.id_access_level
						AND AL.active
				WHERE FIND_IN_SET(P.id_product, a_ids_product) > 0 # FIND_IN_SET(PP.id_permutation, a_ids_permutation) > 0
					# AND P.active # not worried as we want users to be able to see their order history
				;
				/*
				DELETE FROM tmp_Shop_Product_p_Shop_User_Eval
				WHERE rank_permutation > 1
				;
				*/
				SET v_has_filter_product = EXISTS (SELECT * FROM tmp_Shop_Product_p_Shop_User_Eval WHERE a_guid = guid);
			END IF;
            
            DROP TABLE Split_Temp;
		END IF;
	END IF;
    
    -- Permission IDs
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
		IF v_has_filter_permission THEN
			CALL p_split(a_ids_permission, ',');
            
            # Invalid
            IF EXISTS (SELECT PERM.id_permission FROM Split_Temp ST LEFT JOIN Shop_Permission PERM ON ST.substring = PERM.id_permission WHERE ISNULL(PERM.id_permission)) THEN
				INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					a_guid,
                    (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
					v_code_error_data, 
					CONCAT('Invalid permission IDs: ', IFNULL(GROUP_CONCAT(ST.substring SEPARATOR ', '), 'NULL'))
				FROM Split_Temp ST 
				LEFT JOIN Shop_Permission PERM ON ST.substring = PERM.id_permission 
				WHERE ISNULL(PERM.id_permission)
				;
            END IF;
            
            # Inactive
            IF EXISTS (SELECT PERM.id_permission FROM Split_Temp ST INNER JOIN Shop_Permission PERM ON ST.substring = PERM.id_permission WHERE PERM.active = 0) THEN
				INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				SELECT
					a_guid,
                    (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
					v_code_error_data, 
					CONCAT('The following permissions are not active: ', IFNULL(GROUP_CONCAT(ST.substring SEPARATOR ', '), 'NULL')) 
				FROM Split_Temp ST 
				INNER JOIN Shop_Permission PERM ON ST.substring = PERM.id_permission 
				WHERE PERM.active = 0
				;
            END IF;
            
			DROP TABLE Split_Temp;
		END IF;
	END IF;
    
    -- Invalid user ID
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
		IF v_has_filter_user = 1 THEN
			/*
			SET a_id_user := (SELECT id_user FROM Shop_User WHERE id_user LIKE a_id_user AND active);
            SET v_has_filter_user = NOT (a_id_user <=> NULL);
            */
            IF ISNULL((SELECT id_user FROM Shop_User WHERE id_user LIKE a_id_user AND active)) THEN -- NOT v_has_filter_user THEN
                INSERT INTO tmp_Msg_Error (
					guid,
                    id_type,
					code,
					msg
				)
				VALUES (
					a_guid,
                    (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1),
					v_code_error_data, 
					CONCAT('Invalid user ID: ', IFNULL(a_id_user, 'NULL'))
				)
				;
				SET a_id_user = NULL;
                SET v_has_filter_user = 0;
			ELSE
				SET v_has_filter_user = 1;
            END IF;
        END IF;
	END IF;
    
    -- Get users
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
		INSERT INTO Shop_User_Eval_Temp (
			guid,
			id_user,
			id_permission_required,
			priority_access_level_required
            /*
            priority_access_level_user,
			is_super_user,
			can_view,
			can_edit,
			can_admin
            */
		)
		SELECT a_guid,
			a_id_user,
			P.id_permission,
			AL.priority
		FROM Shop_Permission P
		INNER JOIN Shop_Access_Level AL
			ON P.id_access_level_required = AL.id_access_level
				AND AL.active
		WHERE FIND_IN_SET(P.id_permission, a_ids_permission) > 0
		;
        
        /*
		IF v_has_filter_permutation THEN
			SET v_ids_row_delete := (SELECT GROUP_CONCAT(id_row SEPARATOR ',') FROM Shop_User_Eval_Temp WHERE a_guid = guid);
            
			INSERT INTO Shop_User_Eval_Temp (
				guid,
				id_user,
				id_permission_required,
				id_product,
                id_permutation,
				priority_access_level_required
			)
			SELECT UE_T.guid, 
				UE_T.id_user, 
                UE_T.id_permission_required, 
                t_P.id_product, 
                t_P.id_permutation, 
                CASE WHEN UE_T.priority_access_level_required < AL.priority THEN UE_T.priority_access_level_required ELSE AL.priority END -- UE_T.priority_access_level_required
			FROM tmp_Shop_Product_p_Shop_User_Eval t_P
            INNER JOIN Shop_Access_Level AL
				ON t_P.id_access_leveL_required = AL.id_access_level
					AND AL.active
			CROSS JOIN Shop_User_Eval_Temp UE_T
				ON a_id_user = UE_T.id_user
				WHERE a_guid = t_P.guid
			;
            
			DELETE FROM Shop_User_Eval_Temp 
			WHERE FIND_IN_SET(id_row, v_ids_row_delete) > 0
			;
		END IF;
        */
		IF v_has_filter_product THEN
			SET v_ids_row_delete := (SELECT GROUP_CONCAT(id_row SEPARATOR ',') FROM Shop_User_Eval_Temp WHERE a_guid = guid);
            
			INSERT INTO Shop_User_Eval_Temp (
				guid,
				id_user,
				id_permission_required,
				id_product,
                -- id_permutation,
				priority_access_level_required
			)
			SELECT UE_T.guid, 
				UE_T.id_user, 
                UE_T.id_permission_required, 
                t_P.id_product, 
                -- t_P.id_permutation, 
                CASE WHEN UE_T.priority_access_level_required < AL.priority THEN UE_T.priority_access_level_required ELSE AL.priority END -- UE_T.priority_access_level_required
			FROM tmp_Shop_Product_p_Shop_User_Eval t_P
            INNER JOIN Shop_Access_Level AL
				ON t_P.id_access_leveL_required = AL.id_access_level
					AND AL.active
			CROSS JOIN Shop_User_Eval_Temp UE_T
				ON a_id_user = UE_T.id_user
				WHERE a_guid = t_P.guid
			;
            
			DELETE FROM Shop_User_Eval_Temp 
			WHERE FIND_IN_SET(id_row, v_ids_row_delete) > 0
			;
		END IF;
        
		/*
		INSERT INTO Shop_User_Eval_Temp (
			guid,
			id_user,
			id_permission_required,
			# id_access_level_required,
			priority_access_level_required,
			priority_access_level_user,
			is_super_user
			/*
			can_view,
			can_edit,
			can_admin
			*
		)
		SELECT a_guid,
			U.id_user,
			P.id_permission,
			AL.priority,
			/*
			v_id_permission,
			v_id_access_level,
			*
			MIN(AL.priority),
			U.is_super_user
			/*
			CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_view THEN 1 ELSE 0 END END,
			CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_edit THEN 1 ELSE 0 END END,
			CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_admin THEN 1 ELSE 0 END END
			*
		FROM Shop_User U
		INNER JOIN Shop_User_Role_Link URL
			ON U.id_user = URL.id_user
				AND URL.active
		INNER JOIN Shop_Role_Permission_Link RPL
			ON URL.id_role = RPL.id_role
				AND RPL.active
		INNER JOIN Shop_Permission P
			ON RPL.id_permission = P.id_permission
				AND P.active
		INNER JOIN Shop_Access_Level AL
			ON RPL.id_access_level = AL.id_access_level
				AND AL.active
		WHERE U.id_user = a_id_user
			AND (a_get_inactive_users OR U.active)
			AND FIND_IN_SET(P.id_permission, a_ids_permission) > 0
			# AND v_id_permission = P.id_permission
			# AND v_id_access_level = AL.id_access_leveld
		GROUP BY U.id_user, P.id_permission # , is_super_user
		;
		*/
		
        IF v_has_filter_user THEN
			UPDATE Shop_User_Eval_Temp UE_T
			INNER JOIN Shop_User U
				ON UE_T.id_user = U.id_user
					AND U.active
			INNER JOIN Shop_User_Role_Link URL
				ON U.id_user = URL.id_user
					AND URL.active
			INNER JOIN Shop_Role_Permission_Link RPL
				ON URL.id_role = RPL.id_role
					AND RPL.active
			INNER JOIN Shop_Access_Level AL
				ON RPL.id_access_level = AL.id_access_level
					AND AL.active
			SET UE_T.priority_access_level_user = AL.priority,
				UE_T.is_super_user = U.is_super_user,
				UE_T.can_view = CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN ISNULL(AL.priority) THEN 1 ELSE CASE WHEN AL.priority <= v_priority_access_level_view AND AL.priority <= UE_T.priority_access_level_required THEN 1 ELSE 0 END END END,
				UE_T.can_edit = CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN NOT ISNULL(AL.priority) AND AL.priority <= v_priority_access_level_edit AND AL.priority <= UE_T.priority_access_level_required THEN 1 ELSE 0 END END,
				UE_T.can_admin = CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN NOT ISNULL(AL.priority) AND AL.priority <= v_priority_access_level_admin AND AL.priority <= UE_T.priority_access_level_required THEN 1 ELSE 0 END END
			WHERE UE_T.guid = a_guid
				AND UE_T.id_user = a_id_user
				AND RPL.id_permission = UE_T.id_permission_required
			# GROUP BY UE_T.id_user
			;
        ELSE
			UPDATE Shop_User_Eval_Temp UE_T
			SET UE_T.priority_access_level_user = v_priority_access_level_view,
				UE_T.is_super_user = 0,
				UE_T.can_view = (v_priority_access_level_view <= UE_T.priority_access_level_required),
				UE_T.can_edit = 0,
				UE_T.can_admin = 0
			WHERE UE_T.guid = a_guid
				AND UE_T.id_user = a_id_user
			# GROUP BY UE_T.id_user
			;
        END IF;
    END IF;
    
    IF EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid) THEN
		SELECT * FROM tmp_Msg_Error WHERE GUID = a_guid;
    END IF;
    
    -- select * from tmp_Shop_Product_p_Shop_User_Eval;
    -- Clean up
	DROP TABLE IF EXISTS tmp_Shop_Product_p_Shop_User_Eval;
    # DROP TEMPORARY TABLE IF EXISTS tmp_User_Role_Link;
    # DROP TABLE IF EXISTS tmp_Msg_Error;
    DROP TABLE IF EXISTS Split_Temp;
END //
DELIMITER ;


/*

CALL p_shop_user_eval ('00550ef3-2bfa-11ef-b83e-b42e9986184a',		NULL, 0,	'2',	'1',	'1,2,3,4,5');
SELECT *
FROM Shop_User_Eval_Temp
;

DROP TABLE Shop_User_Eval_Temp;
select CURRENT_USER();
CALL p_shop_user_eval('nips', 'auth0|6582b95c895d09a70ba10fef', 0, '5', '2', '1');
SELECT *
FROM Shop_User_Eval_Temp
;
DROP TABLE IF EXISTS Shop_User_Eval_Temp;
DROP TABLE IF EXISTS tmp_Msg_Error;
select * from tmp_Msg_Error;
select * from shop_product;

CALL p_shop_user_eval (
-- '00550ef3-2bfa-11ef-b83e-b42e9986184a',		NULL, 0,	'2',	'1',	'1,2,3,4,5,6');
	'56c9dfc1-e22f-11ee-aab4-b42e9986184a', # a_guid
	'', 	# a_id_user # 'auth0|6582b95c895d09a70ba10fef',
	false,		# a_get_inactive_users
    '4,5',	# a_ids_permission
    '1',		# a_ids_access_level
	-- null,		# a_ids_product
    '1,2,3'		# a_ids_permutation
);

SELECT *
FROM Shop_User_Eval_Temp
;

DROP TABLE Shop_User_Eval_Temp;


SELECT *
FROM Shop_Permission
;

SELECT *
FROM Shop_Access_Level
;

SELECT *
FROM Shop_Product
;

SELECT *
FROM Shop_Product_Permutation
;


*/

/*
SELECT 'NOODS' AS guid,
	U.id_user AS id_user,
	P.id_permission AS id_permission_required,
	AL.id_access_level AS id_access_level_required,
	/*
	v_id_permission,
	v_id_access_level,
	*
	AL.priority, # MIN(AL.priority),
	U.is_super_user
	/*
	CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_view THEN 1 ELSE 0 END END,
	CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_edit THEN 1 ELSE 0 END END,
	CASE WHEN U.is_super_user THEN 1 ELSE CASE WHEN priority_access_level_minimum <= v_priority_access_level_admin THEN 1 ELSE 0 END END
	*
FROM Shop_User U
INNER JOIN Shop_User_Role_Link URL
	ON U.id_user = URL.id_user
		AND URL.active
INNER JOIN Shop_Role_Permission_Link RPL
	ON URL.id_role = RPL.id_role
		AND RPL.active
INNER JOIN Shop_Permission P
	ON RPL.id_permission = P.id_permission
		AND P.active
inner JOIN Shop_Access_Level AL
	# ON P.id_access_level_required = AL.id_access_level
    ON RPL.id_access_level = AL.id_access_level
		AND AL.active
WHERE U.id_user = 'auth0|6582b95c895d09a70ba10fef'
	AND U.active
	AND FIND_IN_SET(P.id_permission, '1,2') > 0
	# AND v_id_access_level = AL.id_access_leveld
# GROUP BY U.id_user, P.id_permission, AL.id_access_level # , is_super_user

*/
