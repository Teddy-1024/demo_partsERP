USE partsltd_prod;

INSERT INTO Shop_User (
	id_user_auth0
	, firstname
    , surname
	, email
	, is_super_user
    , active
)
VALUES ( 'auth0|679cc2fe0d652a47af90d16b'  , 'Demo'   , ''  , 'bot@partsltd.co.uk' , 0  , 1  );

INSERT INTO Shop_User_Role_Link ( id_user, id_role )
VALUES (4, 2);