
-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_user_eval;
DROP PROCEDURE IF EXISTS p_shop_calc_user;

DELIMITER //
CREATE PROCEDURE p_shop_calc_user (
	IN a_guid BINARY(36)
    , IN a_ids_user TEXT
    , IN a_get_inactive_user BIT
    , IN a_ids_permission VARCHAR(4000)
    , IN a_ids_access_level VARCHAR(4000)
    , IN a_ids_product TEXT
    , IN a_debug BIT
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
    DECLARE v_time_start TIMESTAMP(6);
	DECLARE v_ids_row_delete VARCHAR(500);
    DECLARE v_code_type_error_bad_data VARCHAR(200);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_code_error_permission VARCHAR(200);
    DECLARE v_id_permission_required INT;
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_code_type_error_bad_data := (SELECT code FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA');
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data);
    
    SET v_code_error_permission := (SELECT code FROM Shop_Msg_Error_Type WHERE id_type = 2);
    
    CALL partsltd_prod.p_validate_guid ( a_guid );
    SET a_ids_user := TRIM(IFNULL(a_ids_user, ''));
    SET a_get_inactive_user := IFNULL(a_get_inactive_user, 0);
    SET a_ids_permission := TRIM(IFNULL(a_ids_permission, ''));
    SET a_ids_access_level := TRIM(IFNULL(a_ids_access_level, ''));
    SET a_ids_product := TRIM(IFNULL(a_ids_product, ''));
    SET a_debug := IFNULL(a_debug, 0);
    
    IF a_debug = 1 THEN
		SELECT
			a_guid
            , a_ids_user
            , a_get_inactive_user
            , a_ids_permission
            , a_ids_access_level
            , a_ids_product
            , a_debug
		;
    END IF;
    
	-- Clear previous proc results
	DROP TABLE IF EXISTS tmp_Calc_User;
	DROP TABLE IF EXISTS tmp_Shop_Calc_User;
	DROP TABLE IF EXISTS tmp_Product_Calc_User;
	DROP TABLE IF EXISTS tmp_Product_p_Shop_User_Eval_Temp;
	-- DROP TABLE IF EXISTS tmp_Split;
    
    -- Permanent Table
	CREATE TEMPORARY TABLE tmp_Calc_User (
		id_row INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
		id_user INT NULL,
		id_permission_required INT NOT NULL,
		priority_access_level_required INT NOT NULL,
		id_product INT NULL,
        is_super_user BIT NULL,
		priority_access_level_user INT NULL,
		can_view BIT,
		can_edit BIT,
		can_admin BIT
	);
	
	CREATE TEMPORARY TABLE tmp_Product_Calc_User (
		-- id_row INT PRIMARY KEY AUTO_INCREMENT NOT NULL
		id_product INT NOT NULL
        , id_access_level_required INT NOT NULL
        , priority_access_level_required INT NOT NULL
		-- guid BINARY(36) NOT NULL,
        -- rank_product INT NOT NULL
	);
		
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        -- guid BINARY(36) NOT NULL,
		id_type INT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Split (
		substring VARCHAR(4000) NOT NULL
        , as_int INT NULL
	);
    DELETE FROM tmp_Split;
		
    SET v_has_filter_user = CASE WHEN a_ids_user = '' THEN 0 ELSE 1 END;
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
    SET v_id_access_level_view = (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_priority_access_level_view = (SELECT priority FROM partsltd_prod.Shop_Access_Level WHERE id_access_level = v_id_access_level_view);
    SET v_priority_access_level_edit = (SELECT priority FROM partsltd_prod.Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    SET v_priority_access_level_admin = (SELECT priority FROM partsltd_prod.Shop_Access_Level WHERE code = 'ADMIN' LIMIT 1);
    
    IF a_debug = 1 THEN
		SELECT 
			v_priority_access_level_view
			, v_priority_access_level_edit
			, v_priority_access_level_admin
		;
    END IF;
    
    CALL partsltd_prod.p_validate_guid ( a_guid );
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF v_has_filter_access_level THEN
			CALL partsltd_prod.p_split(a_guid, a_ids_access_level, ',', a_debug);
            
            INSERT INTO tmp_Split (
				substring
                , as_int
			)
            SELECT 
				substring
                , CONVERT(substring, DECIMAL(10,0)) -- AS as_int
            FROM Split_Temp
            WHERE 1=1
				AND GUID = a_guid
                AND NOT ISNULL(substring)
                AND substring != ''
            ;
			
            CALL partsltd_prod.p_clear_split_temp( a_guid );
            
            # Invalid IDs
            IF EXISTS (
				SELECT t_S.substring 
                FROM tmp_Split t_S
                LEFT JOIN partsltd_prod.Shop_Access_Level AL ON t_S.as_int = AL.id_access_level
                WHERE 
					ISNULL(t_S.as_int)
                    OR ISNULL(AL.id_access_level)
                    OR AL.active = 0
			) THEN
                INSERT INTO tmp_Msg_Error (
					-- guid,
                    id_type,
					code,
					msg
				)
				SELECT
					-- a_guid,
					v_id_type_error_bad_data,
					v_code_type_error_bad_data, 
					CONCAT('Invalid or inactive access level IDs: ', GROUP_CONCAT(t_S.substring SEPARATOR ', '))
				FROM tmp_Split t_S 
				LEFT JOIN partsltd_prod.Shop_Access_Level AL ON t_S.as_int = AL.id_access_level
                WHERE 
					ISNULL(t_S.as_int)
                    OR ISNULL(AL.id_access_level)
                    OR AL.active = 0
				;
			END IF;
		END IF;
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF v_has_filter_access_level THEN
			SET v_id_access_level := (
				SELECT AL.id_access_level 
				FROM tmp_Split t_S
				INNER JOIN partsltd_prod.Shop_Access_Level AL 
					ON t_S.as_int = AL.id_access_level
					AND AL.active 
				ORDER BY AL.priority ASC 
				LIMIT 1
			);
        ELSE
			SET v_id_access_level = v_id_access_level_view;
		END IF;
        SET v_priority_access_level := (SELECT priority FROM partsltd_prod.Shop_Access_Level WHERE id_access_level = v_id_access_level LIMIT 1);
	END IF;
            
	DELETE FROM tmp_Split;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF v_has_filter_product THEN
			CALL partsltd_prod.p_split(a_guid, a_ids_product, ',', a_debug);
            
            INSERT INTO tmp_Split (
				substring
                , as_int
			)
            SELECT 
				substring
                , CONVERT(substring, DECIMAL(10,0)) AS as_int
            FROM Split_Temp
            WHERE 1=1
				AND GUID = a_guid
                AND NOT ISNULL(substring)
                AND substring != ''
            ;
			
            CALL partsltd_prod.p_clear_split_temp( a_guid );
                        
			# Invalid product IDs
            IF EXISTS (SELECT * FROM tmp_Split t_S LEFT JOIN partsltd_prod.Shop_Product P ON t_S.as_int = P.id_product WHERE ISNULL(t_S.as_int) OR ISNULL(P.id_product) OR P.active = 0) THEN 
				INSERT INTO tmp_Msg_Error (
					-- guid,
                    id_type,
					code,
					msg
				)
				SELECT
					-- a_guid,
					v_id_type_error_bad_data,
					v_code_type_error_bad_data, 
					CONCAT('Invalid or inactive product IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
				FROM tmp_Split t_S
                LEFT JOIN partsltd_prod.Shop_Product P ON t_S.as_int = P.id_product 
                WHERE 
					ISNULL(t_S.as_int)
                    OR ISNULL(P.id_product) 
                    OR P.active = 0
				;
            END IF;
            
			IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
				IF EXISTS (SELECT * FROM tmp_Split) THEN
					INSERT INTO tmp_Product_Calc_User (
						id_product,
						-- id_permutation,
						id_access_level_required,
						priority_access_level_required
					)
					SELECT 
						DISTINCT P.id_product,
						-- PP.id_permutation,
						CASE WHEN AL_P.priority < AL_C.priority THEN AL_P.id_access_level ELSE AL_C.id_access_level END AS id_access_level_required,
						CASE WHEN AL_P.priority < AL_C.priority THEN AL_P.priority ELSE AL_C.priority END AS priority_access_level_required
					FROM tmp_Split t_S
					INNER JOIN partsltd_prod.Shop_Product P ON t_S.as_int = P.id_product # Shop_Product_Permutation PP
					INNER JOIN partsltd_prod.Shop_Access_Level AL_P
						ON P.id_access_level_required = AL_P.id_access_level
						AND AL_P.active
					INNER JOIN partsltd_prod.Shop_Product_Category C ON P.id_category = C.id_category
					INNER JOIN partsltd_prod.Shop_Access_Level AL_C
						ON C.id_access_level_required = AL_C.id_access_level
						AND AL_C.active
					;
					
					SET v_has_filter_product = EXISTS (SELECT * FROM tmp_Product_Calc_User);
					/*
					UPDATE tmp_Product_Calc_User t_P
					INNER JOIN partsltd_prod.Shop_Product P ON t_P.id_product = P.id_product
					INNER JOIN partsltd_prod.Shop_Product_Category PC ON P.id_category = PC.id_category
					INNER JOIN partsltd_prod.Shop_Access_Level AL ON PC.id_access_level_required = AL.id_access_level
					SET 
						t_P.id_access_level_required = CASE WHEN t_P.priority_access_level_required <= AL.priority THEN t_P.id_access_level_required ELSE AL.id_access_level END
						, t_P.priority_access_level_required = LEAST(t_P.priority_access_level_required, AL.priority)
					;
					*/
				ELSE
					INSERT INTO tmp_Product_Calc_User (
						id_product,
						-- id_permutation,
						id_access_level_required,
						priority_access_level_required
					)
                    VALUES (
						NULL
                        , v_id_access_level_view
                        , v_priority_access_level_view
					);
                END IF;
			END IF;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    -- Permission IDs
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		IF v_has_filter_permission THEN
			CALL partsltd_prod.p_split(a_guid, a_ids_permission, ',', a_debug);
            
            INSERT INTO tmp_Split (
				substring
                , as_int
			)
            SELECT 
				substring
                , CONVERT(substring, DECIMAL(10,0)) AS as_int
            FROM Split_Temp
            WHERE 1=1
				AND GUID = a_guid
                AND NOT ISNULL(substring)
                AND substring != ''
            ;
			
            CALL partsltd_prod.p_clear_split_temp( a_guid );
            
            # Invalid or inactive
            IF EXISTS (SELECT PERM.id_permission FROM tmp_Split t_S LEFT JOIN partsltd_prod.Shop_Permission PERM ON t_S.as_int = PERM.id_permission WHERE ISNULL(t_S.as_int) OR ISNULL(PERM.id_permission) OR PERM.active = 0) THEN
				INSERT INTO tmp_Msg_Error (
					-- guid,
                    id_type,
					code,
					msg
				)
				SELECT
					-- a_guid,
					v_id_type_error_bad_data,
					v_code_type_error_bad_data, 
					CONCAT('Invalid or inactive permission IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
				FROM tmp_Split t_S
				LEFT JOIN partsltd_prod.Shop_Permission PERM ON t_S.as_int = PERM.id_permission 
				WHERE 
					ISNULL(t_S.as_int)
                    OR ISNULL(PERM.id_permission)
                    OR PERM.active = 0
				;
			ELSE 
				SET v_id_permission_required := (
					SELECT PERM.id_permission
                    FROM partsltd_prod.Shop_Permission PERM
                    INNER JOIN partsltd_prod.Shop_Access_Level AL ON PERM.id_access_level_required = AL.id_access_level
                    ORDER BY AL.priority ASC
                    LIMIT 1
				);
            END IF;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    IF a_debug = 1 THEN
		SELECT * FROM tmp_Product_Calc_User;
    END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
    -- Invalid user ID
		CALL partsltd_prod.p_split(a_guid, a_ids_user, ',', a_debug);
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM Split_Temp
		WHERE 1=1
			AND GUID = a_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( a_guid );
		
		# Invalid or inactive
		IF EXISTS (SELECT U.id_user FROM tmp_Split t_S LEFT JOIN partsltd_prod.Shop_User U ON t_S.as_int = U.id_user WHERE ISNULL(t_S.as_int) OR ISNULL(U.id_user) OR U.active = 0) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- a_guid,
				v_id_type_error_bad_data,
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive user IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_User U ON t_S.as_int = U.id_user 
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(U.id_user)
				OR U.active = 0
			;
		ELSE
			/*
			SET a_ids_user = (
				SELECT U.id_user 
				FROM tmp_Split t_S
				INNER JOIN partsltd_prod.Shop_User U ON t_S.as_int = U.id_user
			);
			SET v_has_filter_user = ISNULL(a_ids_user);
			*/
			IF NOT EXISTS (SELECT * FROM tmp_Split) THEN
				INSERT INTO tmp_Split (substring, as_int)
				VALUES ( '', NULL );
			END IF;
			
			IF a_debug = 1 THEN
				SELECT *
				FROM tmp_Split;
			END IF;
            
			INSERT INTO tmp_Calc_User (
				id_user
				, id_permission_required
				, priority_access_level_required
				, id_product
                , priority_access_level_user
                , is_super_user
			)
			SELECT 
				U.id_user
				, v_id_permission_required
				, CASE WHEN v_priority_access_level < AL_P.priority THEN v_priority_access_level ELSE AL_P.priority END AS priority_access_level_required
				, t_P.id_product
				, CASE WHEN MIN(IFNULL(AL_U.priority, 0)) = 0 THEN v_priority_access_level_view ELSE MIN(IFNULL(AL_U.priority, 0)) END AS priority_access_level_user
				, IFNULL(U.is_super_user, 0) AS is_super_user
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_User U
				ON t_S.as_int = U.id_user
				AND U.active
			LEFT JOIN partsltd_prod.Shop_User_Role_Link URL
				ON U.id_user = URL.id_user
				AND URL.active
			LEFT JOIN partsltd_prod.Shop_Role_Permission_Link RPL
				ON URL.id_role = RPL.id_role
				AND RPL.active
			LEFT JOIN partsltd_prod.Shop_Access_Level AL_U
				ON RPL.id_access_level = AL_U.id_access_level
				AND AL_U.active
			CROSS JOIN tmp_Product_Calc_User t_P
			LEFT JOIN partsltd_prod.Shop_Access_Level AL_P
				ON t_P.id_access_level_required = AL_P.id_access_level
				AND AL_P.active
            GROUP BY t_S.as_int, U.id_user, t_P.id_product, AL_P.priority
			;
		
			SET v_has_filter_user = EXISTS ( SELECT * FROM tmp_Calc_User LIMIT 1 );
		END IF;
	END IF;
    
    -- Calculated fields
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		UPDATE tmp_Calc_User t_U
        SET
            t_U.can_view = t_U.is_super_user = 1 OR (t_U.priority_access_level_user <= v_priority_access_level_view AND t_U.priority_access_level_user <= t_U.priority_access_level_required)
			, t_U.can_edit = t_U.is_super_user = 1 OR (t_U.priority_access_level_user <= v_priority_access_level_edit AND t_U.priority_access_level_user <= t_U.priority_access_level_required)
			, t_U.can_admin = t_U.is_super_user = 1 OR (t_U.priority_access_level_user <= v_priority_access_level_admin AND t_U.priority_access_level_user <= t_U.priority_access_level_required)
		;
    END IF;
    
    -- Export data to staging table
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error) THEN
        START TRANSACTION;
			INSERT INTO partsltd_prod.Shop_Calc_User_Temp (
				guid
				, id_user
				, id_permission_required
				, priority_access_level_required
				, id_product
				, is_super_user
				, priority_access_level_user
				, can_view
				, can_edit
				, can_admin
			)
			SELECT
				a_guid
				, id_user
				, id_permission_required
				, priority_access_level_required
				, id_product
				, is_super_user
				, priority_access_level_user
				, can_view
				, can_edit
				, can_admin
			FROM tmp_Calc_User
			;
		COMMIT;
    END IF;
    
    IF a_debug = 1 THEN
		SELECT * FROM tmp_Msg_Error;
		SELECT * FROM tmp_Calc_User;
		SELECT * FROM tmp_Product_Calc_User;
		SELECT * FROM partsltd_prod.Shop_Calc_User_Temp WHERE GUID = a_guid;
		CALL partsltd_prod.p_shop_clear_calc_user ( a_guid, a_debug );
    END IF;
    
    -- Clean up
	DROP TABLE IF EXISTS tmp_Calc_User;
	DROP TABLE IF EXISTS tmp_Shop_Calc_User;
	DROP TABLE IF EXISTS tmp_Product_Calc_User;
	DROP TABLE IF EXISTS tmp_Product_p_Shop_User_Eval_Temp;
	-- DROP TABLE IF EXISTS tmp_Split;
    
    IF a_debug = 1 THEN
        CALL partsltd_prod.p_debug_timing_reporting( v_time_start );
    END IF;
END //
DELIMITER ;;

/*	

CALL partsltd_prod.p_shop_calc_user (
	'chips                               '
	, NULL
	, 0
	, '2'
	, '1'
	, '1,2,3,4,5'
    , 0
);
-- SELECT * FROM partsltd_prod.Shop_Calc_User_Temp;
SELECT * FROM partsltd_prod.Shop_Calc_User_Temp WHERE GUID = 'chips                               ';
CALL partsltd_prod.p_shop_clear_calc_user ( 'chips                               ', 0 );
-- SELECT * FROM partsltd_prod.Shop_Calc_User_Temp;
DROP TABLE IF EXISTS tmp_Msg_Error;

*/