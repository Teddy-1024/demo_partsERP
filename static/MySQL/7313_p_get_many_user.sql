

-- Clear previous proc
DROP PROCEDURE IF EXISTS p_get_many_user;


DELIMITER //
CREATE PROCEDURE p_get_many_user (
	IN a_id_user INT
    , IN a_id_user_auth0 VARCHAR(200)
	, IN a_get_all_user BIT
	, IN a_get_inactive_user BIT
    , IN a_get_first_user_only BIT
	, IN a_ids_user LONGTEXT
    , IN a_ids_user_auth0 LONGTEXT
    , IN a_debug BIT
)
BEGIN
    DECLARE v_id_access_level_admin INT;
    DECLARE v_id_access_level_view INT;
    DECLARE v_id_permission_store_admin INT;
    DECLARE v_id_permission_user INT;
    DECLARE v_id_permission_user_admin INT;
    DECLARE v_ids_permission_required VARCHAR(4000);
    DECLARE v_now DATETIME;
    DECLARE v_id_minimum INT;
    DECLARE v_code_error_bad_data VARCHAR(50);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_has_filter_user BIT;
    DECLARE v_has_filter_user_auth0 BIT;
    DECLARE v_guid BINARY(36);
    DECLARE v_rank_max INT;
    DECLARE v_time_start TIMESTAMP(6);
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_guid := UUID();
    SET v_id_access_level_admin := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'ADMIN' LIMIT 1);
    SET v_id_access_level_view := (SELECT id_access_level FROM partsltd_prod.Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_id_permission_store_admin := (SELECT id_permission FROM partsltd_prod.Shop_Permission WHERE code = 'STORE_ADMIN' LIMIT 1);
    SET v_id_permission_user := (SELECT id_permission FROM partsltd_prod.Shop_Permission WHERE code = 'STORE_USER' LIMIT 1);
    SET v_id_permission_user_admin := (SELECT id_permission FROM partsltd_prod.Shop_Permission WHERE code = 'STORE_USER_ADMIN' LIMIT 1);
    SET v_code_error_bad_data := (SELECT code FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_bad_data := (SELECT id_type FROM partsltd_prod.Shop_Msg_Error_Type WHERE code = v_code_error_bad_data LIMIT 1);
    SET v_ids_permission_required := CONCAT(v_id_permission_user, ',', v_id_permission_user_admin, ',', v_id_permission_store_admin);
    
    SET a_get_all_user := IFNULL(a_get_all_user, 1);
    SET a_get_inactive_user := IFNULL(a_get_inactive_user, 0);
    SET a_get_first_user_only := IFNULL(a_get_first_user_only, 0);
    SET a_ids_user := TRIM(IFNULL(a_ids_user, ''));
    SET a_ids_user_auth0 := TRIM(IFNULL(a_ids_user_auth0, ''));
    SET a_debug := IFNULL(a_debug, 0);
    
    IF a_debug = 1 THEN
		SELECT
			a_id_user
			, a_id_user_auth0
			, a_get_all_user
			, a_get_inactive_user
			, a_get_first_user_only
			, a_ids_user
			, a_ids_user_auth0
			, a_debug
		;
    END IF;
    
    DROP TEMPORARY TABLE IF EXISTS tmp_User;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    
    CREATE TEMPORARY TABLE tmp_User (
		id_user INT NULL
        , rank_user INT NULL
        , can_admin_store BIT NULL
        , can_admin_user BIT NULL
    );
    
	CREATE TEMPORARY TABLE tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        -- guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Split (
		substring VARCHAR(4000) NOT NULL
        , as_int INT NULL
	);
    
    IF ISNULL(a_id_user) AND NOT ISNULL(a_id_user_auth0) THEN
		SET a_id_user := (SELECT U.id_user FROM partsltd_prod.Shop_User U WHERE U.id_user_auth0 = a_id_user_auth0 LIMIT 1); -- LIKE CONCAT('%', a_id_user_auth0, '%') LIMIT 1);
    END IF;
    
    IF ISNULL(a_id_user) THEN
		INSERT INTO tmp_Msg_Error (
			id_type,
			code,
			msg
		)
		VALUES (
			v_id_type_error_bad_data,
			v_code_error_bad_data, 
			CONCAT('User ID required for authorisation.')
		)
		;
    END IF;
    
    SET v_has_filter_user := CASE WHEN a_ids_user = '' THEN 0 ELSE 1 END;
    SET v_has_filter_user_auth0 := CASE WHEN a_ids_user_auth0 = '' THEN 0 ELSE 1 END;
    
	IF a_debug = 1 THEN
		SELECT
            v_has_filter_user
            , v_has_filter_user_auth0
		;
    END IF;
    
    -- User IDs
    IF (NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) AND v_has_filter_user = 1) THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_user, ',', FALSE);
        
        DELETE FROM tmp_Split;
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( v_guid );
	END IF;
    
    IF (NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) AND v_has_filter_user = 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_User U ON t_S.as_int = U.id_user
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(U.id_user)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- v_guid,
				v_id_type_error_bad_data,
				v_code_error_bad_data, 
				CONCAT('Invalid or inactive User IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_User U ON t_S.as_int = U.id_user
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(U.id_user)
			;
		ELSE
			INSERT INTO tmp_User (
				id_user
                , rank_user
			)
			SELECT 
				U.id_user
                , RANK() OVER (ORDER BY U.id_user DESC) AS rank_user
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_User U ON t_S.as_int = U.id_user
			WHERE 
				(
					a_get_all_user = 1
					OR (
						v_has_filter_user = 1
						AND NOT ISNULL(t_S.as_int)
					)
				)
				AND (
					a_get_inactive_user = 1
					OR U.active = 1
				)
			;
		END IF;
	END IF;
    
    -- Auth0 User IDs
    IF (NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) AND v_has_filter_user_auth0 = 1) THEN
		CALL partsltd_prod.p_split(v_guid, a_ids_user_auth0, ',', FALSE);
        
        DELETE FROM tmp_Split;
		
		INSERT INTO tmp_Split (
			substring
		)
		SELECT 
			substring
		FROM partsltd_prod.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL partsltd_prod.p_clear_split_temp( v_guid );
	END IF;
    
    IF (NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) AND v_has_filter_user_auth0 = 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN partsltd_prod.Shop_User U ON t_S.substring = U.id_user_auth0
			WHERE 
				ISNULL(t_S.substring) 
                OR ISNULL(U.id_user_auth0)
		) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
				id_type,
				code,
				msg
			)
			SELECT
				-- v_guid,
				v_id_type_error_bad_data,
				v_code_error_bad_data, 
				CONCAT('Invalid or inactive Auth0 User IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN partsltd_prod.Shop_User U ON t_S.substring = U.id_user_auth0
			WHERE 
				ISNULL(t_S.substring) 
				OR ISNULL(U.id_user_auth0)
			;
		ELSE
			SET v_rank_max := IFNULL((SELECT rank_user FROM tmp_User ORDER BY rank_user DESC LIMIT 1), 0);
        
			INSERT INTO tmp_User (
				id_user
                , rank_user
			)
			SELECT 
				U.id_user
                , v_rank_max + (RANK() OVER (ORDER BY U.id_user DESC)) AS rank_user
			FROM tmp_Split t_S
			RIGHT JOIN partsltd_prod.Shop_User U ON t_S.substring = U.id_user_auth0
			WHERE 
				(
					a_get_all_user = 1
					OR (
						v_has_filter_user_auth0 = 1
						AND NOT ISNULL(t_S.substring)
					)
				)
				AND (
					a_get_inactive_user = 1
					OR U.active = 1
				)
			;
		END IF;
	END IF;
    
    IF a_debug = 1 THEN
		SELECT * FROM tmp_User;
    END IF;

    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN    
		IF a_get_first_user_only THEN
			DELETE t_U
			FROM tmp_User t_U
			WHERE t_U.rank_user > 1
			;
		END IF;
	END IF;
    
    IF a_debug = 1 THEN
		SELECT * FROM tmp_User;
    END IF;
    
    -- Can admin store
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
        IF a_debug = 1 THEN
			SELECT 
				v_guid -- guid
				, a_id_user -- ids_user
				, FALSE -- get_inactive_user
				, v_id_permission_store_admin -- ids_permission
				, v_id_access_level_admin -- ids_access_level
				, '' -- ids_product
				, 0 -- a_debug
			;
			SELECT * FROM partsltd_prod.Shop_Calc_User_Temp;
        END IF;
        
        CALL partsltd_prod.p_shop_calc_user(
			v_guid -- guid
            , a_id_user -- ids_user
            , FALSE -- get_inactive_user
            , v_id_permission_store_admin -- ids_permission
            , v_id_access_level_admin -- ids_access_level
            , '' -- ids_product
            , 0 -- a_debug
		);
        
        IF a_debug = 1 THEN
			SELECT * FROM partsltd_prod.Shop_Calc_User_Temp WHERE GUID = v_guid;
        END IF;
        
        UPDATE tmp_User t_U
        INNER JOIN partsltd_prod.Shop_Calc_User_Temp CUT 
			ON CUT.GUID = v_guid
            AND t_U.id_user = CUT.id_user
        SET t_U.can_admin_store = CUT.can_admin
        ;
        
		CALL partsltd_prod.p_shop_clear_calc_user( v_guid, FALSE );
	END IF;
    
    -- Can admin user
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
        IF a_debug = 1 THEN
			SELECT 
				v_guid -- guid
				, a_id_user -- ids_user
				, FALSE -- get_inactive_user
				, v_id_permission_user_admin -- ids_permission
				, v_id_access_level_admin -- ids_access_level
				, '' -- ids_product
				, 0 -- a_debug
			;
			SELECT * FROM partsltd_prod.Shop_Calc_User_Temp;
        END IF;
        
        CALL partsltd_prod.p_shop_calc_user(
			v_guid -- guid
            , a_id_user -- ids_user
            , FALSE -- get_inactive_user
            , v_id_permission_user_admin -- ids_permission
            , v_id_access_level_admin -- ids_access_level
            , '' -- ids_product
            , 0 -- a_debug
		);
        
        IF a_debug = 1 THEN
			SELECT * FROM partsltd_prod.Shop_Calc_User_Temp WHERE GUID = v_guid;
        END IF;
        
        UPDATE tmp_User t_U
        INNER JOIN partsltd_prod.Shop_Calc_User_Temp CUT 
			ON CUT.GUID = v_guid
            AND t_U.id_user = CUT.id_user
        SET t_U.can_admin_user = CUT.can_admin
        ;
        
		CALL partsltd_prod.p_shop_clear_calc_user( v_guid, FALSE );
	END IF;

    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
        IF a_debug = 1 THEN
			SELECT 
				v_guid -- guid
				, a_id_user -- ids_user
				, FALSE -- get_inactive_user
				, v_ids_permission_required -- ids_permission
				, v_id_access_level_view -- ids_access_level
				, '' -- ids_product
				, 0 -- a_debug
			;
			SELECT * FROM partsltd_prod.Shop_Calc_User_Temp;
        END IF;
        
        CALL partsltd_prod.p_shop_calc_user(
			v_guid -- guid
            , a_id_user -- ids_user
            , FALSE -- get_inactive_user
            , v_ids_permission_required -- ids_permission
            , v_id_access_level_view -- ids_access_level
            , '' -- ids_product
            , 0 -- a_debug
		);
        
        IF a_debug = 1 THEN
			SELECT * FROM partsltd_prod.Shop_Calc_User_Temp WHERE GUID = v_guid;
        END IF;
        
        IF NOT EXISTS (
			SELECT can_view 
            FROM partsltd_prod.Shop_Calc_User_Temp CUT 
            WHERE 1=1
				AND CUT.GUID = v_guid
                AND can_view = 1
                -- AND FIND_IN_SET(v_ids_permission_required, CUT.id_permission_required) > 0
		) THEN
			INSERT INTO tmp_Msg_Error (
                id_type,
				code,
				msg
			)
			VALUES (
                v_id_type_error_bad_data,
				v_code_error_bad_data, 
                -- CONCAT('You do not have view permissions for ', (SELECT name FROM partsltd_prod.Shop_Permission WHERE id_permission = v_id_permission_user LIMIT 1))
 				-- CONCAT('You do not have view permissions for ', (SELECT GROUP_CONCAT(name SEPARATOR ', ') FROM partsltd_prod.Shop_Permission WHERE FIND_IN_SET(v_id_permission_user, id_permission) > 0))
				CONCAT('You do not have view permissions for ', (SELECT name FROM partsltd_prod.Shop_Permission P INNER JOIN partsltd_prod.Shop_Calc_User_Temp CUT ON P.id_permission = CUT.id_permission_required WHERE GUID = v_guid AND IFNULL(can_view, 0) = 0 LIMIT 1)) --  WHERE IFNULL(CUT.can_view, 0) = 0
			)
			;
		ELSE
			-- INSERT INTO 
            SET a_debug := a_debug;
        END IF;
        
		CALL partsltd_prod.p_shop_clear_calc_user( v_guid, FALSE );
	END IF;
    
    
    -- Returns
    /* NULL record required for flask sql_alchemy to detect result set */
    IF EXISTS (SELECT * FROM tmp_Msg_Error) THEN
		DELETE FROM tmp_User;
        INSERT INTO tmp_User ( id_user )
        VALUES ( NULL );
    END IF;
    
    
	SELECT 
		U.id_user
		, U.id_user_auth0
		, U.firstname
		, U.surname
		, U.email
		, U.is_email_verified
		, U.id_currency_default
		, U.id_region_default
		, U.is_included_VAT_default
		, U.is_super_user
		, t_U.can_admin_store
		, t_U.can_admin_user
	FROM tmp_User t_U
	INNER JOIN partsltd_prod.Shop_User U ON t_U.id_user = U.id_user
	;
    
    # Errors
    SELECT 
        t_ME.display_order,
        MET.code, 
        t_ME.msg,
        MET.name,
        MET.description
    FROM tmp_Msg_Error t_ME
    INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    ;
    
    
    IF a_debug = 1 THEN
		SELECT * FROM tmp_User;
    END IF;
    
    -- Clean up
    DROP TEMPORARY TABLE IF EXISTS tmp_User;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
	
	/*
	DELETE FROM partsltd_prod.Shop_Calc_User_Temp
	WHERE GUID = v_guid;
	*/
    
    IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;;



CALL p_get_many_user (NULL, 'google-oauth2|109567376920138999933', False, False, False, NULL, 'google-oauth2|109567376920138999933', 0);
/*
	NULL # a_id_user
    , 'auth0|6582b95c895d09a70ba10fef' # a_id_user_auth0
    , 0 # a_get_all_user
	, 0 # a_get_inactive_user
    , 0 # a_get_first_user_only
	, NULL # a_ids_user
	, 'auth0|6582b95c895d09a70ba10fef' # a_ids_user_auth0
    , 0 -- a_debug
);*/

/*
select * FROM partsltd_prod.Shop_Calc_User_Temp;
delete FROM partsltd_prod.Shop_Calc_User_Temp;

SELECT * 
FROM partsltd_prod.Shop_USER;

CALL p_get_many_user(
	NULL -- :a_id_user, 
    , 'auth0|6582b95c895d09a70ba10fef' -- :a_id_user_auth0, 
    , 1 -- :a_get_all_user,
    , 0 --  :a_get_inactive_user,
    , 0 --  :a_get_first_user_only,
    , NULL --  :a_ids_user,
    , 'auth0|6582b95c895d09a70ba10fef' --  :a_ids_user_auth0
);

*/
