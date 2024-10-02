



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
)
BEGIN
    DECLARE v_id_access_level_view INT;
    DECLARE v_id_permission_store_admin INT;
    DECLARE v_id_permission_user INT;
    DECLARE v_id_permission_user_admin INT;
    DECLARE v_now TIMESTAMP;
    DECLARE v_id_minimum INT;
    DECLARE v_code_error_data VARCHAR(50);
    DECLARE v_id_type_error_data INT;
    DECLARE v_has_filter_user BIT;
    DECLARE v_guid BINARY(36);
    
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_id_permission_store_admin := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_ADMIN' LIMIT 1);
    SET v_id_permission_user := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_USER' LIMIT 1);
    SET v_id_permission_user_admin := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_USER_ADMIN' LIMIT 1);
    SET v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_data LIMIT 1);
    
    SET a_ids_user := TRIM(IFNULL(a_ids_user, ''));
    SET a_ids_user_auth0 := TRIM(IFNULL(a_ids_user_auth0, ''));
    
    DROP TEMPORARY TABLE IF EXISTS tmp_User;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
    
    CREATE TEMPORARY TABLE tmp_User (
		id_user INT NOT NULL,
        rank_user INT NULL
    );
    
	CREATE TEMPORARY TABLE tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    IF ISNULL(a_id_user) AND NOT ISNULL(a_id_user_auth0) THEN
		SET a_id_user := (SELECT U.id_user FROM Shop_User U WHERE U.id_user_auth0 LIKE CONCAT('%', a_id_user_auth0, '%') LIMIT 1);
    END IF;
    
    IF ISNULL(a_id_user) THEN
		INSERT INTO tmp_Msg_Error (
			guid,
			id_type,
			code,
			msg
		)
		VALUES (
			v_guid,
			v_id_type_error_data,
			v_code_error_data, 
			CONCAT('User ID required for authorisation.')
		)
		;
    END IF;
    
    SET v_has_filter_user := CASE WHEN a_ids_user = '' AND a_ids_user_auth0= '' THEN 0 ELSE 1 END;
    
    IF v_has_filter_user THEN
		INSERT INTO tmp_User (
			id_user
			-- , active
			, rank_user
		)
		SELECT 
			DISTINCT U.id_user
			-- S.active
			, RANK() OVER (ORDER BY id_user ASC) AS rank_user
		FROM Shop_User U
		WHERE 1=1
			AND (
				FIND_IN_SET(U.id_user, a_ids_user) > 0
				OR FIND_IN_SET(U.id_user_auth0, a_ids_user_auth0) > 0
			)
            AND (
				a_get_inactive_user
                OR U.active
            )
		/*Shop_Calc_User_Temp UE_T
		WHERE 1=1
			AND UE_T.guid = v_guid
			AND UE_T.active = 1
		*/
		;
        
        IF a_get_first_user_only THEN
			DELETE t_U
			FROM tmp_User t_U
            WHERE t_U.rank_user > 1
            ;
		END IF;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
        -- select * from Shop_Calc_User_Temp;
        
        CALL p_shop_calc_user(
			v_guid, -- guid
            a_id_user, -- ids_user
            FALSE, -- get_inactive_user
            CONCAT(v_id_permission_user, ',', v_id_permission_user_admin, ',', v_id_permission_store_admin), -- ids_permission
            v_id_access_level_view, -- ids_access_level
            '' -- ids_product
		);
        
        -- select * from Shop_Calc_User_Temp;
        
        IF NOT EXISTS (
			SELECT can_view 
            FROM Shop_Calc_User_Temp UE_T 
            WHERE 1=1
				AND UE_T.GUID = v_guid
                AND UE_T.id_permission_required = v_id_permission_user
		) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
                id_type,
				code,
				msg
			)
			VALUES (
				v_guid,
                v_id_type_error_data,
				v_code_error_data, 
				CONCAT('You do not have view permissions for ', (SELECT name FROM Shop_Permission WHERE id_permission = v_id_permission_user LIMIT 1))
			)
			;
        END IF;
	END IF;
    
    
    -- Returns
    /* NULL record required for flask sql_alchemy to detect result set
    IF EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = v_guid) THEN
		DELETE FROM tmp_User;
    END IF;
    */
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error WHERE GUID = v_guid) THEN
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
			, UE_T_STORE.can_admin_store AS can_admin_store
			, UE_T_USER.can_admin_user AS can_admin_user
		FROM tmp_User t_U
		INNER JOIN Shop_User U ON t_U.id_user = U.id_user
		INNER JOIN (
			SELECT
				id_user
				, id_permission_required
				, can_admin AS can_admin_store
			FROM Shop_Calc_User_Temp UE_T_STORE
			WHERE 1=1
				AND UE_T_STORE.guid = v_guid
				AND UE_T_STORE.id_permission_required = v_id_permission_store_admin
		) UE_T_STORE ON t_U.id_user = UE_T_STORE.id_user
		INNER JOIN (
			SELECT
				id_user
				, id_permission_required
				, can_admin AS can_admin_user
			FROM Shop_Calc_User_Temp UE_T_USER
			WHERE 1=1
				AND UE_T_USER.guid = v_guid
				AND UE_T_USER.id_permission_required = v_id_permission_user_admin
		) UE_T_USER ON t_U.id_user = UE_T_USER.id_user
		;
    ELSE
		SELECT 
			NULL AS id_user
			, NULL AS id_user_auth0
			, NULL AS firstname
			, NULL AS surname
			, NULL AS email
			, NULL AS is_email_verified
			, NULL AS id_currency_default
			, NULL AS id_region_default
			, NULL AS is_included_VAT_default
			, NULL AS is_super_user
			, NULL AS can_admin_store
			, NULL AS can_admin_user
		;
	END IF;
    
    # Errors
    SELECT 
        t_ME.display_order,
        MET.code, 
        t_ME.msg,
        MET.name,
        MET.description
    FROM tmp_Msg_Error t_ME
    INNER JOIN Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    WHERE guid = v_guid
    ;
    
    
    -- Clean up
    DROP TEMPORARY TABLE IF EXISTS tmp_User;
    DROP TEMPORARY TABLE IF EXISTS tmp_Msg_Error;
	
	/*
	DELETE FROM Shop_Calc_User_Temp
	WHERE GUID = v_guid;
	*/
	CALL p_shop_clear_calc_user(v_guid);
END //
DELIMITER ;;



/*
CALL p_get_many_user (
	NULL # a_id_user
    , 'auth0|6582b95c895d09a70ba10fef' # a_id_user_auth0
    , 0 # a_get_all_user
	, 0 # a_get_inactive_user
    , 0 # a_get_first_user_only
	, NULL # a_ids_user
	, 'auth0|6582b95c895d09a70ba10fef' # a_ids_user_auth0 # ' -- 
);
select * from Shop_Calc_User_Temp;
delete from Shop_Calc_User_Temp;

SELECT * 
FROM SHOP_USER;

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
