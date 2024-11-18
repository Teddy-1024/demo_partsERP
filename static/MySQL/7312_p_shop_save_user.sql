
 
DROP PROCEDURE IF EXISTS p_shop_save_user;


DELIMITER //
CREATE PROCEDURE p_shop_save_user (
    IN a_comment VARCHAR(500),
	IN a_guid BINARY(36),
    IN a_id_user INT,
    IN a_debug BIT
)
BEGIN
	DECLARE v_code_type_error_bad_data VARCHAR(100);
    DECLARE v_id_type_error_bad_data INT;
    DECLARE v_id_permission_product INT;
    DECLARE v_id_permission_user_admin LONGTEXT;
    DECLARE v_id_change_set INT;
    DECLARE v_id_access_level_edit INT;
    DECLARE v_can_admin_user BIT;
    DECLARE v_time_start TIMESTAMP(6);
    
    DECLARE exit handler for SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            @sqlstate = RETURNED_SQLSTATE
            , @errno = MYSQL_ERRNO
            , @text = MESSAGE_TEXT
		;
        
        ROLLBACK;
        
		CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
			display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT
			, id_type INT NULL
			, code VARCHAR(50) NOT NULL
			, msg VARCHAR(4000) NOT NULL
		);
        INSERT INTO tmp_Msg_Error (
			id_type
            , code
            , msg
		)
        SELECT 
			MET.id_type
            , @errno
            , @text
		FROM partsltd_prod.Shop_Msg_Error_Type MET
        WHERE MET.code = 'MYSQL_ERROR'
		;
        SELECT *
        FROM tmp_Msg_Error;
		DROP TABLE IF EXISTS tmp_Msg_Error;
    END;
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_code_type_error_bad_data := 'BAD_DATA';
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_type_error_bad_data LIMIT 1);
    SET v_id_access_level_edit := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'EDIT' LIMIT 1);
    SET v_id_permission_user_admin := (SELECT GROUP_CONCAT(id_permission SEPARATOR ',') FROM Shop_Permission WHERE code = 'STORE_USER_ADMIN' LIMIT 1);
    CALL p_validate_guid ( a_guid );
    
    DROP TABLE IF EXISTS tmp_Msg_Error;
    DROP TABLE IF EXISTS tmp_User;
    
    CREATE TABLE tmp_User (
		id_user INT NOT NULL
        , id_user_auth0 VARCHAR(200) NOT NULL
        , firstname VARCHAR(255)
        , surname VARCHAR(255)
        , email VARCHAR(254)
        , is_email_verified BIT NOT NULL
        , is_super_user BIT NOT NULL
        , id_currency_default INT
        , id_region_default INT
        , is_included_VAT_default BIT
        , active BIT NOT NULL
        , name_error VARCHAR(1000)
    );
    
    CREATE TABLE tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		id_type INT NOT NULL,
        code VARCHAR(50) NOT NULL,
		msg VARCHAR(4000) NOT NULL
    );
    
    -- Get data from Temp table
    INSERT INTO tmp_User (
		id_user
        , id_user_auth0
        , firstname
        , surname
        , email
        , is_email_verified
        , is_super_user
        , id_currency_default
        , id_region_default
        , is_included_VAT_default
        , active
	)
    SELECT 
        U_T.id_user
        , U_T.id_user_auth0
        , IFNULL(U_T.firstname, U.firstname) AS firstname
        , IFNULL(U_T.surname, U.surname) AS surname
        , IFNULL(U_T.email, U.email) AS email
        , IFNULL(U_T.is_email_verified, U.is_email_verified) AS is_email_verified
        , IFNULL(U_T.is_super_user, U.is_super_user) AS is_super_user
        , IFNULL(U_T.id_currency_default, U.id_currency_default) AS id_currency_default
        , IFNULL(U_T.id_region_default, U.id_region_default) AS id_region_default
        , IFNULL(U_T.is_included_VAT_default, U.is_included_VAT_default) AS is_included_VAT_default
        , IFNULL(IFNULL(U_T.active, U.active), 1) AS active
        , IFNULL(U_T.display_order, PC.display_order) AS display_order
	FROM partsltd_prod.Shop_User_Temp U_T
    LEFT JOIN Shop_User U ON U_T.id_user = U.id_user
    WHERE U_T.guid = a_guid
    ;

    UPDATE tmp_User t_U
    SET 
        t_U.name_error = IFNULL(t_U.email, t_U.id_user_auth0)
    ;
    
    -- Validation
    -- Missing mandatory fields
    -- email
    IF EXISTS (SELECT * FROM tmp_User t_U WHERE ISNULL(t_U.email) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following User(s) do not have an email: ', GROUP_CONCAT(t_U.name_error SEPARATOR ', ')) AS msg
		FROM tmp_User t_U
		WHERE ISNULL(t_U.email)
		;
    END IF;
    -- is_super_user
    IF EXISTS (SELECT * FROM tmp_User t_U WHERE ISNULL(t_U.is_super_user) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following User(s) do not have an is super user field: ', GROUP_CONCAT(t_U.name_error SEPARATOR ', ')) AS msg
		FROM tmp_User t_U
		WHERE ISNULL(t_U.is_super_user)
		;
    END IF;
    -- is_email_verified
    IF EXISTS (SELECT * FROM tmp_User t_U WHERE ISNULL(t_U.is_email_verified) LIMIT 1) THEN
		INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		SELECT
			v_id_type_error_bad_data
			, v_code_type_error_bad_data
			, CONCAT('The following User(s) do not have an is email verified: ', GROUP_CONCAT(t_U.name_error SEPARATOR ', ')) AS msg
		FROM tmp_User t_U
		WHERE ISNULL(t_U.is_email_verified)
		;
    END IF;
    
    
    -- Permissions
    IF a_debug = 1 THEN
        SELECT 
            a_guid -- GUID
            , a_id_user -- ID User
            , FALSE -- get inactive Users
            , v_id_permission_user_admin -- IDs Permission
            , v_id_access_level_edit -- ID Access Level
            , NULL -- IDs Product
        ;
    END IF;

    CALL p_shop_calc_user(
        a_guid -- GUID
        , a_id_user -- ID User
        , FALSE -- get inactive Users
        , v_id_permission_user_admin -- IDs Permission
        , v_id_access_level_edit -- ID Access Level
        , NULL -- IDs Product
    );

    SET v_can_admin_user := (
        SELECT IFNULL(UE_T.can_edit, 0) = 1
        FROM partsltd_prod.Shop_User_Eval_Temp UE_T 
        WHERE
            UE_T.GUID = a_guid
            AND UE_T.id_user = a_id_user
            AND UE_T.id_permission = v_id_permission_user_admin
    );

    IF (v_can_admin_user = 0 AND EXISTS (
        SELECT * 
        FROM tmp_User t_U
        WHERE
            t_U.id_user <> a_id_user
    )) THEN
        DELETE FROM tmp_Msg_Error;
        INSERT INTO tmp_Msg_Error (
			id_type
			, code
			, msg
		)
		VALUES (
			v_id_type_error_no_permission
			, v_code_type_error_no_permission
			, 'You do not have permission to edit other Users.'
        )
        ;
    END IF;
    
    CALL p_shop_clear_calc_user(a_guid);
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		START TRANSACTION;
        
            INSERT INTO Shop_User_Change_Set ( comment )
            VALUES ( a_comment )
            ;
            
            SET v_id_change_set := LAST_INSERT_ID();
            
            UPDATE Shop_User U
            INNER JOIN tmp_User t_U ON U.id_user = t_U.id_user
            SET 
                U.id_user_auth0 = t_U.id_user_auth0
                , U.firstname = t_U.firstname
                , U.surname = t_U.surname
                , U.email = t_U.email
                , U.is_email_verified = t_U.is_email_verified
                , U.is_super_user = t_U.is_super_user
                , U.id_currency_default = t_U.id_currency_default
                , U.id_region_default = t_U.id_region_default
                , U.is_included_VAT_default = t_U.is_included_VAT_default
                , U.active = t_U.active
                , U.id_change_set = v_id_change_set
            ;
            
		COMMIT;
    END IF;
    
    START TRANSACTION;
		
		DELETE FROM Shop_User_Temp
		WHERE GUID = a_guid;
		
	COMMIT;
	
    # Errors
    SELECT *
    FROM tmp_Msg_Error t_ME
	INNER JOIN partsltd_prod.Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
	;
    
	IF a_debug = 1 THEN
		SELECT * from tmp_User;
	END IF;

    DROP TABLE IF EXISTS tmp_Msg_Error;
    DROP TABLE IF EXISTS tmp_User;
    
	IF a_debug = 1 THEN
		CALL partsltd_prod.p_debug_timing_reporting ( v_time_start );
	END IF;
END //
DELIMITER ;;

