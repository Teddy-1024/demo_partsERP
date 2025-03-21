
DROP PROCEDURE IF EXISTS p_shop_get_many_product_variation;

DELIMITER //
CREATE PROCEDURE p_shop_get_many_product_variation (
	IN a_id_user INT
    , IN a_get_all_variation_type BIT
	, IN a_get_inactive_variation_type BIT
	, IN a_ids_variation_type VARCHAR(4000)
    , IN a_get_all_variation BIT
	, IN a_get_inactive_variation BIT
	, IN a_ids_variation TEXT
    , IN a_debug BIT
)
BEGIN
	-- Argument redeclaration
	-- Variable declaration
    DECLARE v_has_filter_variation BIT;
    DECLARE v_has_filter_variation_type BIT;
    DECLARE v_guid BINARY(36);
    # DECLARE v_id_user VARCHAR(100);
    # DECLARE v_ids_permutation_unavailable VARCHAR(4000);
    DECLARE v_id_permission_variation INT;
    # DECLARE v_ids_product_permission VARCHAR(4000);
    # DECLARE v_ids_permutation_permission VARCHAR(4000);
    DECLARE v_id_access_level_view INT;
    DECLARE v_time_start TIMESTAMP(6);
    DECLARE v_id_minimum INT;
    DECLARE v_code_error_bad_data VARCHAR(50);
    DECLARE v_id_type_error_bad_data INT;
    
    SET v_time_start := CURRENT_TIMESTAMP(6);
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_code_error_bad_data := (SELECT code FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    SET v_id_type_error_bad_data := (SELECT id_type FROM Shop_Msg_Error_Type WHERE code = v_code_error_bad_data LIMIT 1);
    
	-- Argument validation + default values
	SET a_id_user = IFNULL(a_id_user, 0);
    SET a_get_all_variation = IFNULL(a_get_all_variation, 1);
    SET a_get_inactive_variation = IFNULL(a_get_inactive_variation, 0);
    SET a_ids_variation = TRIM(REPLACE(IFNULL(a_ids_variation, ''), '|', ','));
    SET a_get_all_variation_type = IFNULL(a_get_all_variation_type, 1);
    SET a_get_inactive_variation_type = IFNULL(a_get_inactive_variation_type, 0);
    SET a_ids_variation_type = TRIM(REPLACE(IFNULL(a_ids_variation_type, ''), '|', ','));
    
    IF a_debug = 1 THEN
		SELECT
			a_id_user
			, a_get_all_variation_type
			, a_get_inactive_variation_type
			, a_ids_variation_type
			, a_get_all_variation
			, a_get_inactive_variation
			, a_ids_variation
			, a_debug
		;
    END IF;
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Variation;
    DROP TABLE IF EXISTS tmp_Variation_Type;
    
    CREATE TEMPORARY TABLE tmp_Variation_Type (
		id_type INT NOT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Variation (
		id_variation INT NOT NULL
        , id_type INT NOT NULL
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
    
    
    -- Parse filters
    SET v_has_filter_variation = CASE WHEN a_ids_variation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_variation_type = CASE WHEN a_ids_variation_type = '' THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
    IF v_has_filter_variation_type THEN -- NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		CALL demo.p_split(v_guid, a_ids_variation_type, ',', a_debug);
        
        DELETE FROM tmp_Split;
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM demo.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL demo.p_clear_split_temp( v_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN demo.Shop_Variation_Type VT ON t_S.as_int = VT.id_type
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(VT.id_type)
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
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive variation type IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN demo.Shop_Variation_Type VT ON t_S.as_int = VT.id_type
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(VT.id_type)
			;
		ELSE
            INSERT INTO tmp_Variation_Type (
				id_type
			)
            SELECT
				DISTINCT VT.id_type
			FROM tmp_Split t_S
			RIGHT JOIN demo.Shop_Variation_Type VT ON t_S.as_int = VT.id_type
			WHERE 
				(
					a_get_all_variation_type = 1
					OR (
						v_has_filter_variation_type = 1
						AND NOT ISNULL(t_S.as_int)
					)
				)
				AND (
					a_get_inactive_variation_type = 1
					OR VT.active = 1
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    IF (v_has_filter_variation AND NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1)) THEN -- NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		CALL demo.p_split(v_guid, a_ids_variation, ',', a_debug);
        
        DELETE FROM tmp_Split;
		
		INSERT INTO tmp_Split (
			substring
			, as_int
		)
		SELECT 
			substring
			, CONVERT(substring, DECIMAL(10,0)) AS as_int
		FROM demo.Split_Temp
		WHERE 1=1
			AND GUID = v_guid
			AND NOT ISNULL(substring)
			AND substring != ''
		;
		
		CALL demo.p_clear_split_temp( v_guid );
	END IF;
    
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		IF EXISTS (
			SELECT * 
            FROM tmp_Split t_S 
            LEFT JOIN demo.Shop_Variation V ON t_S.as_int = V.id_variation
			WHERE 
				ISNULL(t_S.as_int) 
                OR ISNULL(V.id_variation)
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
				v_code_type_error_bad_data, 
				CONCAT('Invalid or inactive variation IDs: ', IFNULL(GROUP_CONCAT(t_S.substring SEPARATOR ', '), 'NULL'))
			FROM tmp_Split t_S
			LEFT JOIN demo.Shop_Variation V ON t_S.as_int = V.id_variation
			WHERE 
				ISNULL(t_S.as_int) 
				OR ISNULL(VT.id_type)
			;
		ELSE
            INSERT INTO tmp_Variation (
				id_variation
                , id_type
			)
            SELECT
				DISTINCT V.id_variation
				, V.id_type
			FROM tmp_Split t_S
			RIGHT JOIN demo.Shop_Variation V ON t_S.as_int = V.id_variation
			WHERE 
				(
					a_get_all_variation = 1
					OR (
						v_has_filter_variation = 1
						AND NOT ISNULL(t_S.as_int)
					)
				)
				AND (
					a_get_inactive_variation = 1
					OR V.active = 1
				)
			;
		END IF;
	END IF;
    
    DELETE FROM tmp_Split;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
        # SET v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER());
        SET v_id_permission_variation := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
        
        IF a_debug = 1 THEN
			SELECT 
				v_guid
				, a_id_user
				, FALSE AS a_get_inactive_users
				, v_id_permission_variation
				, v_id_access_level_view
				, '' AS a_ids_product
				, 0 AS a_debug
			;
			-- select * from Shop_Calc_User_Temp;
		END IF;
        
        CALL p_shop_calc_user(
			v_guid
            , a_id_user
            , FALSE -- a_get_inactive_users
            , v_id_permission_variation
            , v_id_access_level_view
            , '' -- a_ids_product
            , 0 -- a_debug
		);
        
        IF a_debug = 1 THEN
			select * from Shop_Calc_User_Temp;
		END IF;
        
        IF NOT EXISTS (SELECT can_view FROM Shop_Calc_User_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
			INSERT INTO tmp_Msg_Error (
				-- guid,
                id_type,
				code,
				msg
			)
			VALUES (
				-- v_guid,
				v_id_type_error_bad_data, 
				v_code_error_bad_data, 
				CONCAT('You do not have view permissions for ', (SELECT name FROM Shop_Permission WHERE id_permission = v_id_permission_variation LIMIT 1))
			)
			;
        END IF;
        
        CALL p_shop_clear_calc_user( v_guid, 0 );
	END IF;
    
    IF EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
		DELETE FROM tmp_Variation;
        DELETE FROM tmp_Variation_Type;
    END IF;
    
    -- Returns
    # Variation Types
    SELECT 
		t_VT.id_type
        , VT.code
        , VT.name
        , VT.name_plural
        , VT.display_order
        , VT.active
    FROM tmp_Variation_Type t_VT
    INNER JOIN Shop_Variation_Type VT ON t_VT.id_type = VT.id_type
	;
    
    # Variations
    SELECT 
		t_V.id_variation
        , t_V.id_type
        , V.code AS code_variation
        , V.name AS name_variation
		, V.display_order
        , V.active AS active_variation
        /*
        , VT.code AS code_variation_type
        , VT.name AS name_variation_type
        , VT.name_plural AS name_plural_variation_type
        , VT.active AS active_variation_type
		, VT.display_order
        */
    FROM tmp_Variation t_V
    INNER JOIN Shop_Variation V ON t_V.id_variation = V.id_variation
    INNER JOIN tmp_Variation_Type t_VT ON V.id_type = t_VT.id_type
    INNER JOIN Shop_Variation_Type VT ON t_VT.id_type = VT.id_type
    ORDER BY VT.display_order, V.display_order
	;
    
    # Errors
    SELECT 
        *
    FROM tmp_Msg_Error t_ME
    INNER JOIN Shop_Msg_Error_Type MET ON t_ME.id_type = MET.id_type
    -- WHERE guid = v_guid
    ;
    
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Variation;
    DROP TABLE IF EXISTS tmp_Variation_Type;
    
	CALL demo.p_shop_clear_calc_product_permutation ( v_guid );
    
    IF a_debug = 1 THEN
		CALL demo.p_debug_timing_reporting ( v_time_start );
    END IF;
END //
DELIMITER ;

/*

CALL p_shop_get_many_product_variation (
	1 # 'auth0|6582b95c895d09a70ba10fef', # a_id_user
    , 1 # a_get_all_variation_type
	, 1 # a_get_inactive_variation_type
	, '' # a_ids_variation_type
    , 1 # a_get_all_variation
	, 1 # a_get_inactive_variation
	, '' # a_ids_variation
    , 0 # a_debug
);


select * from TMP_MSG_ERROR;
DROP TABLE TMP_MSG_ERROR;

select * from shop_variation;
select * from shop_variation_type;
*/
/*
select * from shop_supplier;
select * from shop_product;

insert into shop_product_change_set (comment)
    values ('set product not subscription - test bool output to python');
    update shop_product
    set is_subscription = 0,
		id_change_set = (select id_change_set from shop_product_change_set order by id_change_set desc limit 1)
    where id_product = 1

			INSERT INTO tmp_Variation_Type (
				id_type,
                active,
                rank_type
			)
			SELECT 
				VT.id_type,
                S.active,
                RANK() OVER (ORDER BY id_type ASC) AS rank_type
			FROM Shop_Variation_Type VT
            LEFT JOIN Split_Temp S_T ON VT.id_type = S_T.substring
            WHERE
				(
					a_get_all_variation_type = 1
                    OR NOT ISNULL(S_T.substring)
				)
				AND (
					a_get_inactive_variation_type
                    OR VT.active = 1
                )
			;
        END IF;

		
		IF a_get_first_variation_type_only THEN
			DELETE t_VT
			FROM tmp_Shop_Variation_Type t_VT
			WHERE t_VT.rank_type > 1
			;
		END IF;
*/