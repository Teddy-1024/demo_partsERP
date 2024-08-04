
USE PARTSLTD_PROD;

/*
THIS STRUCTURE DOES NOT WORK WITH MYSQL ??

CALL p_shop_get_many_role_permission (
	'',
	0,
	'',
	0,
    0,
    1,
	'',
	0,
    0,
    1
)

*/


-- Clear previous proc
DROP PROCEDURE IF EXISTS p_shop_get_many_role_permission;
/*
DROP TABLE IF EXISTS tmp_Shop_Image;
DROP TABLE IF EXISTS tmp_Shop_Product;
DROP TABLE IF EXISTS tmp_Shop_Variation;
DROP TABLE IF EXISTS tmp_Shop_Category;
*/

DELIMITER //
CREATE PROCEDURE p_shop_get_many_role_permission (
	a_ids_role NVARCHAR(500),
    a_get_inactive_roles BIT
)
BEGIN
	-- Variable declaration
    DECLARE v_has_filter_role BIT;
    DECLARE v_priority_view INT;
    DECLARE v_priority_edit INT;
    DECLARE v_priority_admin INT;
    /*
    DECLARE v_ids_product_permission VARCHAR(500);
    DECLARE v_now TIMESTAMP;
    */
    
	-- Parse arguments + get default values
	IF a_ids_role IS NULL THEN
		SET a_ids_role = '';
	ELSE
		SET a_ids_role = TRIM(a_ids_role);
    END IF;
	IF a_get_inactive_roles IS NULL THEN
		SET a_get_inactive_roles = 0;
    END IF;
    
    
    -- Temporary tables
    CREATE TABLE tmp_Permission (
		id_role INT NOT NULL,
        CONSTRAINT FK_tmp_User_Permission_id_role
			FOREIGN KEY (id_role)
            REFERENCES Shop_Role(id_role),
        id_permission INT,
        CONSTRAINT FK_tmp_User_Permission_id_permission
			FOREIGN KEY (id_permission)
            REFERENCES Shop_Permission(id_permission),
		id_access_level INT,
        CONSTRAINT FK_tmp_User_Permission_id_access_level
			FOREIGN KEY (id_user)
            REFERENCES Shop_Access_Level(id_user),
        can_view BIT, 
        can_edit BIT, 
        can_admin BIT
    );
    
    
    -- Parse filters
	SET a_ids_role = REPLACE(a_ids_role, ',', '|');
    SET v_has_filter_role = CASE WHEN a_ids_role = '' THEN 0 ELSE 1 END;
    
    INSERT INTO tmp_User_Permission (
		id_role,
        id_permission,
        id_access_level,
        can_view,
        can_edit,
        can_admin
    )
    SELECT U.id_user,
		U.is_super_user,
		U.is_super_user,
		U.is_super_user,
		U.is_super_user
	FROM Shop_Role R
	INNER JOIN Shop_Role_Permission_Link RPL
		ON R.id_role = RPL.id_role
			AND RPL.active
	INNER JOIN Shop_Permission PERM
		ON RPL.id_permission = PERM.id_permission
			AND PERM.active
	INNER JOIN Shop_Permission_Group PG
		ON PERM.id_permission_group = PG.id_group
			AND PG.active
	LEFT JOIN Shop_Access_Level AL
		ON RPL.id_access_level = AL.id_access_level
			AND AL.active
    WHERE 
        R.id_role LIKE CONCAT('%', a_ids_role, '%')
		AND (
            PERM.required_access_level = 0 
            OR AL.priority >= PERM.required_access_level
        )
    ;
    
    UPDATE tmp_User_Permission t_UP
    INNER JOIN Shop_Access_Level AL
		ON AL.code = 'ADMIN'
	SET t_UP.id_access_level = AL.id_access_level
    WHERE t_UP.is_super_user
    ;
    
    
    -- Clean up
    DROP TABLE IF EXISTS tmp_Shop_Category;
    DROP TABLE IF EXISTS tmp_Shop_Product;
    DROP TABLE IF EXISTS tmp_Shop_Image;
END //
DELIMITER ;

