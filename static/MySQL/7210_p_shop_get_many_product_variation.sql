
DROP PROCEDURE IF EXISTS p_shop_get_many_product_variation;

DELIMITER //
CREATE PROCEDURE p_shop_get_many_product_variation (
	IN a_id_user INT,
    IN a_get_all_variation_type BIT,
	IN a_get_inactive_variation_type BIT,
    IN a_get_first_variation_type_only BIT,
	IN a_ids_variation_type VARCHAR(4000),
    IN a_get_all_variation BIT,
	IN a_get_inactive_variation BIT,
    IN a_get_first_variation_only BIT,
	IN a_ids_variation VARCHAR(4000)
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
    DECLARE v_now TIMESTAMP;
    DECLARE v_id_minimum INT;
    DECLARE v_code_error_data VARCHAR(50);
    
    
    SET v_guid := UUID();
    SET v_id_access_level_view := (SELECT id_access_level FROM Shop_Access_Level WHERE code = 'VIEW' LIMIT 1);
    SET v_code_error_data := (SELECT code FROM Shop_Msg_Error_Type WHERE code = 'BAD_DATA' LIMIT 1);
    
    
	-- Argument validation + default values
	SET a_id_user = IFNULL(a_id_user, 0);
    SET a_get_all_variation = IFNULL(a_get_all_variation, 1);
    SET a_get_inactive_variation = IFNULL(a_get_inactive_variation, 0);
    SET a_get_first_variation_only = IFNULL(a_get_first_variation_only, 0);
    SET a_ids_variation = TRIM(REPLACE(IFNULL(a_ids_variation, ''), '|', ','));
    SET a_get_all_variation_type = IFNULL(a_get_all_variation_type, 1);
    SET a_get_inactive_variation_type = IFNULL(a_get_inactive_variation_type, 0);
    SET a_get_first_variation_type_only = IFNULL(a_get_first_variation_type_only, 0);
    SET a_ids_variation_type = TRIM(REPLACE(IFNULL(a_ids_variation_type, ''), '|', ','));
    
    
    -- Temporary tables
    DROP TABLE IF EXISTS tmp_Variation;
    DROP TABLE IF EXISTS tmp_Variation_Type;
    
    CREATE TEMPORARY TABLE tmp_Variation_Type (
		id_type INT NOT NULL
        , active BIT NOT NULL
        , rank_type INT NULL
    );
    
    CREATE TEMPORARY TABLE tmp_Variation (
		id_variation INT NOT NULL
        , id_type INT NOT NULL
        , active BIT NOT NULL
        , rank_variation INT NULL
    );
    
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Msg_Error (
		display_order INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        guid BINARY(36) NOT NULL,
		id_type INT NOT NULL,
        code VARCHAR(50) NOT NULL,
        msg VARCHAR(4000) NOT NULL
	);
    
    
    -- Parse filters
    SET v_has_filter_variation = CASE WHEN a_ids_variation = '' THEN 0 ELSE 1 END;
    SET v_has_filter_variation_type = CASE WHEN a_ids_variation_type = '' THEN 0 ELSE 1 END;

	-- select v_has_filter_product, v_has_filter_permutation;
    
    IF v_has_filter_variation = 1 OR a_get_all_variation = 1 OR v_has_filter_variation_type = 1 OR a_get_all_variation_type = 1 THEN
		CALL p_split(a_ids_variation_type, ',');
        
		IF EXISTS (SELECT * FROM Split_Temp S_T LEFT JOIN Shop_Variation_Type VT ON S_T.substring = VT.id_type WHERE ISNULL(VT.id_type)) THEN 
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_code_error_data, 
				CONCAT('Invalid Variation Type IDs: ', (SELECT GROUP_CONCAT(VT.id_type) FROM Split_Temp S_T LEFT JOIN Shop_Variation_Type VT ON S_T.substring = VT.id_type WHERE ISNULL(VT.id_type)))
			)
			;
			CALL p_clear_split_temp;
		ELSE
        
			CALL p_clear_split_temp;

			CALL p_split(a_ids_variation, ',');
			
			IF EXISTS (SELECT * FROM Split_Temp S_T LEFT JOIN Shop_Variation V ON S_T.substring = V.id_variation WHERE ISNULL(V.id_variation)) THEN 
				INSERT INTO tmp_Msg_Error (
					guid,
					code,
					msg
				)
				VALUES (
					v_guid,
					v_code_error_data, 
					CONCAT('Invalid Variation IDs: ', (SELECT GROUP_CONCAT(V.id_variation) FROM Split_Temp S_T LEFT JOIN Shop_Variation V ON S_T.substring = V.id_variation WHERE ISNULL(V.id_variation)))
				)
				;
			ELSE
				INSERT INTO tmp_Variation (
					id_variation
                    , id_type
					, active
					, rank_variation
				)
				SELECT 
					V.id_variation
                    , V.id_type
					, V.active
					, RANK() OVER (ORDER BY id_variation ASC) AS rank_id_variation
				FROM Shop_Variation V
                INNER JOIN Shop_Variation_Type VT ON V.id_type = VT.id_type
				LEFT JOIN Split_Temp S_T ON V.id_variation = S_T.substring
				WHERE
					(
						a_get_all_variation = 1
						OR NOT ISNULL(S_T.substring)
					)
					AND (
						a_get_inactive_variation
						OR V.active = 1
					)
                    AND (
						a_get_all_variation_type
                        OR FIND_IN_SET(V.id_type, a_ids_variation_type)
                    )
					AND (
						a_get_inactive_variation_type
						OR VT.active = 1
					)
				;
			END IF;
			
			CALL p_clear_split_temp;
			
			IF a_get_first_variation_only THEN
				DELETE t_V
				FROM tmp_Variation t_V
				WHERE t_V.rank_variation > 1
				;
			END IF;
            
            INSERT INTO tmp_Variation_Type (
				id_type
                , active
                , rank_type
			)
            SELECT
				DISTINCT t_V.id_type
                , VT.active
                , RANK() OVER(ORDER BY t_V.id_type) AS rank_type
			FROM tmp_Variation t_V
            INNER JOIN Shop_Variation_Type VT ON t_V.id_type = VT.id_type
            ;
			
			IF a_get_first_variation_type_only THEN
				DELETE t_V
				FROM tmp_Variation t_V
                INNER JOIN tmp_Variation_Type t_VT ON t_V.id_variation = t_VT.id_variation
				WHERE t_VT.rank_type > 1
				;
				DELETE t_VT
				FROM tmp_Variation_Type t_VT
				WHERE t_VT.rank_type > 1
				;
			END IF;
		END IF;
    END IF;
    
    -- Permissions
    IF NOT EXISTS (SELECT * FROM tmp_Msg_Error LIMIT 1) THEN
        # SET v_id_user := (SELECT id_user FROM Shop_User WHERE name = CURRENT_USER());
        SET v_id_permission_variation := (SELECT id_permission FROM Shop_Permission WHERE code = 'STORE_PRODUCT' LIMIT 1);
        
        -- SELECT v_guid, a_id_user, false, v_id_permission_product, v_id_access_level_view, v_ids_permutation_permission;
        -- select * from Shop_User_Eval_Temp;
        
        CALL p_shop_user_eval(v_guid, a_id_user, FALSE, v_id_permission_variation, v_id_access_level_view, '');
        
        -- select * from Shop_User_Eval_Temp;
        
        IF NOT EXISTS (SELECT can_view FROM Shop_User_Eval_Temp UE_T WHERE UE_T.GUID = v_guid) THEN
			INSERT INTO tmp_Msg_Error (
				guid,
				code,
				msg
			)
			VALUES (
				v_guid,
				v_code_error_data, 
				CONCAT('You do not have view permissions for ', (SELECT name FROM Shop_Permission WHERE id_permission = v_id_permission_supplier LIMIT 1))
			)
			;
        END IF;
        
        CALL p_clear_shop_user_eval_temp(v_guid);
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
    INNER JOIN Shop_Msg_Error_Type MET
		ON t_ME.id_type = MET.id_type
    WHERE guid = v_guid
    ;
    
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Variation;
    DROP TABLE IF EXISTS tmp_Variation_Type;
END //
DELIMITER ;;


/*

CALL p_shop_get_many_product_variation (
	1, # 'auth0|6582b95c895d09a70ba10fef', # a_id_user
    1, # a_get_all_variation_type
	0, # a_get_inactive_variation_type
    0, # a_get_first_variation_type_only
	'', # a_ids_variation_type
    1, # a_get_all_variation
	0, # a_get_inactive_variation
    0, # a_get_first_variation_only
	'' # a_ids_variation
);

select * from shop_variation;
select * from shop_variation_type;
*/
/*
select * from shop_supplier;
select * from shop_product;
select * from TMP_MSG_ERROR;
DROP TABLE TMP_MSG_ERROR;

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