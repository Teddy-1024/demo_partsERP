


/*

CALL p_shop_save_user (
	'auth0|6582b95c895d09a70ba10fef', -- a_id_user
	'', -- a_name
	'', -- a_email
    0 -- a_email_verified
)

*/


CREATE OR REPLACE PROCEDURE p_shop_save_user (
	IN a_id_user INTEGER,
    IN a_name VARCHAR(255),
	IN a_email VARCHAR(254),
    IN a_email_verified BIT
)
AS $$
DECLARE
	v_id_user INTEGER;
	v_name VARCHAR(255);
    v_email VARCHAR(254);
    v_email_verified BIT;
    v_has_filter_user BOOLEAN;
    result_errors REFCURSOR;
BEGIN
    v_id_user := TRIM(COALESCE(a_id_user, ''));
    v_name := TRIM(COALESCE(a_name, ''));
    v_email := TRIM(COALESCE(a_email, ''));
    v_email_verified := COALESCE(a_email_verified, FALSE);

    v_has_filter_user = CASE WHEN v_id_user = '' THEN FALSE ELSE TRUE END;
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Msg_Error;
    DROP TABLE IF EXISTS tmp_Shop_User;
    
    CREATE TABLE tmp_Shop_User (
		id_user INTEGER,
        CONSTRAINT FK_tmp_Shop_User_id_user
			FOREIGN KEY (id_user)
			REFERENCES Shop_User(id_user),
        active BOOLEAN NOT NULL
    );
    
    CREATE TABLE tmp_Msg_Error (
		display_order INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
		id_type INTEGER NOT NULL,
        -- code VARCHAR(50) NOT NULL,
        -- CONSTRAINT chk_tmp_Msg_Error_code CHECK (code IN (SELECT code FROM Shop_Msg_Error_Type)),
        CONSTRAINT FK_tmp_Msg_Error_id_type
			FOREIGN KEY (id_type)
			REFERENCES Shop_Msg_Error_Type(id_type),
		msg VARCHAR(4000) NOT NULL
    );
    
    
    -- Parse filters
    
    
    -- User
    IF v_has_filter_user THEN
        INSERT INTO tmp_Shop_User (
			id_user,
			active
		)
        SELECT id_user,
			active
		FROM Shop_User
        WHERE id_user = v_id_user
			AND active
		LIMIT 1
        ;
        
		IF NOT EXISTS (SELECT id_user FROM tmp_Shop_User LIMIT 1) THEN
			INSERT INTO Shop_User (
				id_user,
                name,
                email,
                email_verified
            )
            VALUES (
				v_id_user,
                v_name,
                v_email,
                v_email_verified
            );
            
            INSERT INTO tmp_Shop_User (
				id_user,
				active
			)
			SELECT id_user,
				active
			FROM Shop_User
			WHERE id_user = v_id_user
				AND active
			LIMIT 1
            ;
        END IF;
        
        v_id_user := (SELECT id_user FROM tmp_Shop_User LIMIT 1);
	ELSE
		INSERT INTO tmp_Msg_Error (
			id_type,
            msg
		)
        VALUES (
			 (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1), 
            'No user ID provided.'
		)
        ;
    END IF;
    
    
    /*
    IF NOT EXISTS (SELECT msg FROM tmp_Msg_Error LIMIT 1) THEN
    END IF;
    */
    
    
    -- Returns
    /*
    -- User
    SELECT *
    FROM tmp_Shop_User
    ;
    */

    -- Errors
	OPEN result_errors FOR
		SELECT *
		FROM tmp_Msg_Error
		;
    -- RETURN NEXT result_errors;
    
    /*
    -- Return arguments for test
    SELECT a_id_user,
		a_name,
        a_email,
        a_email_verified
    ;
    */
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Msg_Error;
    DROP TABLE IF EXISTS tmp_Shop_User;
END;
$$ LANGUAGE plpgsql;


/*

CALL p_shop_save_user (
	'',
	'',
	'',
    0
)

*/
