SELECT URL.id_link,
	URL.id_user,
    U.name AS name,
    URL.id_role,
    R.name AS role
FROM Shop_User_Role_Link URL
INNER JOIN Shop_User U
	ON URL.id_user = U.id_user
INNER JOIN Shop_Role R
	ON URL.id_role = R.id_role
;
SELECT *
FROM Shop_Role_Permission_Link
;
SELECT *
FROM Shop_Access_Level
;
SELECT *
FROM Shop_Permission
;
SELECT *
FROM Shop_Access_Level
;


select * from shop_user;
select * from shop_user_audit;
select * from Shop_User_Change_Set;
/*
INSERT INTO Shop_User_Change_Set ( comment )
VALUES ('Demotion');
*/
UPDATE Shop_User
SET is_super_user = 0,
    id_change_set = (SELECT id_change_set FROM Shop_User_Change_Set LIMIT 1)
WHERE id_user = 1
;
select * from shop_user;
select * from shop_user_audit;


drop procedure if exists p_test;
delimiter //
create procedure p_test ()
begin
	declare b0 int;
	declare b1 int;
    SET b0 = 0;
    SET b1 = 1;
    select b0, b1;
	select cast(b0 as char), cast(b1 as char);
	select cast(b0 as char character set utf8), cast(b1 as char character set utf8);
	select convert(b0, char), convert(b1, char);
	select convert(b0, char character set utf8), convert(b1, char character set utf8);
	select convert(convert(b0, signed), char), convert(convert(b1, signed), char);
	select convert(convert(b0, signed), char character set utf8), convert(convert(b1, signed), char character set utf8);
end //
delimiter ;
call p_test();
drop procedure if exists p_test;

INSERT INTO Shop_User_Audit (
	id_user,
	name_field,
	value_prev,
	value_new,
	id_change_set
)
SELECT id_user, name_field, value_prev, value_new, id_change_set
FROM Shop_User_Audit
WHERE id_audit = 1
UNION
SELECT id_user, name_field, value_prev, value_new, id_change_set
FROM Shop_User_Audit
WHERE id_audit = 1
;

select * from shop_user_audit;


SELECT * FROM Shop_Access_Level;

SELECT * FROM Shop_Product;