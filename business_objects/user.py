"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    User Business Object
"""

# internal
import lib.argument_validation as av
from forms.forms import Form_Filters_User
from extensions import db
# external
from dataclasses import dataclass
from typing import ClassVar


class User(db.Model):
    KEY_USER: ClassVar[str] = 'authorisedUser' # 'user' already used

    id_user = db.Column(db.Integer, primary_key=True)
    id_user_auth0 = db.Column(db.String(255))
    firstname = db.Column(db.String(255))
    surname = db.Column(db.String(255))
    email = db.Column(db.String(255))
    is_email_verified = db.Column(db.Boolean)
    is_super_user = db.Column(db.Boolean)
    id_currency_default = db.Column(db.Integer)
    id_region_default = db.Column(db.Integer)
    is_included_VAT_default = db.Column(db.Boolean)
    can_admin_store = db.Column(db.Boolean)
    can_admin_user = db.Column(db.Boolean)

    # is_logged_in: bool

    def __init__(self):
        self.is_logged_in = False
        
    def from_DB_user(query_row):
        _m = 'User.from_DB_user'
        user = User()
        user.id_user = query_row[0]
        user.id_user_auth0 = query_row[1]
        user.firstname = query_row[2]
        user.surname = query_row[3]
        user.email = query_row[4]
        user.is_email_verified = av.input_bool(query_row[5], 'is_email_verified', _m)
        user.id_currency_default = query_row[6]
        user.id_region_default = query_row[7]
        user.is_included_VAT_default = av.input_bool(query_row[8], 'is_included_VAT_default', _m)
        user.is_super_user = av.input_bool(query_row[9], 'is_super_user', _m)
        user.can_admin_store = av.input_bool(query_row[10], 'can_admin_store', _m)
        user.can_admin_user = av.input_bool(query_row[11], 'can_admin_user', _m)
        return user
    
    @staticmethod
    def from_json(json):
        _m = 'User.from_json'
        user = User()
        if json is None: return user
        print(f'json: {json}')
        user.id_user = json['id_user']
        user.id_user_auth0 = json['id_user_auth0']
        user.firstname = json['firstname']
        user.surname = json['surname']
        user.email = json['email']
        user.is_email_verified = av.input_bool(json['is_email_verified'], 'is_email_verified', _m)
        user.is_super_user = av.input_bool(json['is_super_user'], 'is_super_user', _m)
        user.id_currency_default = json['id_currency_default']
        user.id_region_default = json['id_region_default']
        user.is_included_VAT_default = av.input_bool(json['is_included_VAT_default'], 'is_included_VAT_default', _m)
        user.can_admin_store = av.input_bool(json['can_admin_store'], 'can_admin_store', _m)
        user.can_admin_user = av.input_bool(json['can_admin_user'], 'can_admin_user', _m)
        user.is_logged_in = (user.id_user_auth0 is not None)
        print(f'user: {user}')
        return user
    
    # print(f'user: {user}')
    @staticmethod
    def from_json_auth0(json):
        _m = 'User.from_json_auth0'
        user = User()
        if json is None: return user
        print(f'json: {json}')
        user_info = json['userinfo']
        user.id_user = None
        user.id_user_auth0 = user_info['sub']
        user.firstname = None
        user.surname = None
        user.email = user_info['email']
        user.is_email_verified = av.input_bool(user_info['email_verified'], 'is_email_verified', _m)
        user.is_super_user = None
        user.id_currency_default = None
        user.id_region_default = None
        user.is_included_VAT_default = None
        user.can_admin_store = None
        user.can_admin_user = None
        print(f'user: {user}')
        return user
    
    def to_json(self):
        as_json = {
            'id_user': self.id_user,
            'id_user_auth0': self.id_user_auth0,
            'firstname': self.firstname,
            'surname': self.surname,
            'email': self.email,
            'is_email_verified': self.is_email_verified,
            'is_super_user': self.is_super_user,
            'id_currency_default': self.id_currency_default,
            'id_region_default': self.id_region_default,
            'is_included_VAT_default': self.is_included_VAT_default,
            'can_admin_store': self.can_admin_store,
            'can_admin_user': self.can_admin_user
        }
        print(f'as_json: {as_json}')
        return as_json
        
    def __repr__(self):
        return f'''
            id_user: {self.id_user}
            id_user_auth0: {self.id_user_auth0}
            firstname: {self.firstname}
            surname: {self.surname}
            email: {self.email}
            is_email_verified: {self.is_email_verified}
            is_super_user: {self.is_super_user}
            id_currency_default: {self.id_currency_default}
            id_region_default: {self.id_region_default}
            is_included_VAT_default: {self.is_included_VAT_default}
            can_admin_store: {self.can_admin_store}
            can_admin_user: {self.can_admin_user}
            '''
    
    @staticmethod
    def get_default():
        user = User()
        user.id_user = None
        return user
    
    
@dataclass
class User_Filters():
    get_all_user: bool
    get_inactive_user: bool
    get_first_user_only: bool
    ids_user: str
    ids_user_auth0: str

    def to_json(self):
        return {
            'a_get_all_user': self.get_all_user,
            'a_get_inactive_user': self.get_inactive_user,
            'a_get_first_user_only': self.get_first_user_only,
            'a_ids_user': self.ids_user,
            'a_ids_user_auth0': self.ids_user_auth0,
        }
    
    @staticmethod
    def from_form(form):
        av.val_instance(form, 'form', 'User_Filters.from_form', Form_Filters_User)
        get_inactive = av.input_bool(form.active_only.data, "active_only", "User_Filters.from_form")
        id_user = form.id_user.data
        return User_Filters(
            get_all_user = (id_user is None),
            get_inactive_user = get_inactive,
            get_first_user_only = False,
            ids_user = id_user,
            ids_user_auth0 = '',
        )
    
    @staticmethod
    def from_user(user):
        av.val_instance(user, 'user', 'User_Filters.from_user', User)
        return User_Filters(
            get_all_user = (user.id_user is None and user.id_user_auth0 is None),
            get_inactive_user = False,
            get_first_user_only = False,
            ids_user = user.id_user,
            ids_user_auth0 = user.id_user_auth0,
        )
    
    @staticmethod
    def get_default(datastore_store):
        user = datastore_store.get_login_user()
        return User_Filters(
            get_all_user = False,
            get_inactive_user = False,
            get_first_user_only = False,
            ids_user = user.id_user,
            ids_user_auth0 = '',
        )
""" User_Eval
@dataclass
class User_Filters():
    ids_user: str
    get_inactive_users: bool
    ids_permission: str
    ids_access_level: str
    ids_product: str

    def to_json(self):
        return {
            'a_ids_user': self.ids_user,
            'a_get_inactive_users': self.get_inactive_users,
            'a_ids_permission': self.ids_permission,
            'a_ids_access_level': self.ids_access_level,
            'a_ids_product': self.ids_product,
        }
    
    @staticmethod
    def from_form(form):
        av.val_instance(form, 'form', 'User_Filters.from_form', Form_Filters_User)
        get_inactive = av.input_bool(form.active_only.data, "active_only", "User_Filters.from_form")
        return User_Filters(
            ids_user = form.id_user.data,
            get_inactive_users = get_inactive,
            ids_permission = form.ids_permission.data,
            ids_access_level = form.ids_access_level.data,
            ids_product = form.ids_product.data,
        )
    
    @staticmethod
    def get_default(datastore_store):
        is_user_logged_in, id_user = datastore_store.get_login_user()
        return User_Filters(
            ids_user = id_user,
            get_inactive_users = False,
            ids_permission = '',
            ids_access_level = '',
            ids_product = '',
        )
"""

class User_Permission_Evaluation(db.Model):
    id_evaluation = db.Column(db.Integer, primary_key=True)
    guid = db.Column(db.String(255))
    id_user = db.Column(db.Integer)
    id_permission_required = db.Column(db.Integer)
    priority_access_level_required = db.Column(db.Integer)
    id_product = db.Column(db.Integer)
    is_super_user = db.Column(db.Boolean)
    priority_access_level_user = db.Column(db.Integer)
    can_view = db.Column(db.Boolean)
    can_edit = db.Column(db.Boolean)
    can_admin = db.Column(db.Boolean)
        
    def from_DB_user_eval(query_row):
        user_permission_evaluation = User_Permission_Evaluation()
        user_permission_evaluation.id_evaluation = query_row[0]
        user_permission_evaluation.guid = query_row[1]
        user_permission_evaluation.id_user = query_row[2]
        user_permission_evaluation.id_permission_required = query_row[3]
        user_permission_evaluation.priority_access_level_required = query_row[4]
        user_permission_evaluation.id_product = query_row[5]
        user_permission_evaluation.is_super_user = query_row[6]
        user_permission_evaluation.priority_access_level_user = query_row[7]
        user_permission_evaluation.can_view = query_row[8]
        user_permission_evaluation.can_edit = query_row[9]
        user_permission_evaluation.can_admin = query_row[10]
        return user_permission_evaluation
    
    def __repr__(self):
        return f'''
            id_evaluation: {self.id_evaluation}
            guid: {self.guid}
            id_user: {self.id_user}
            id_permission_required: {self.id_permission_required}
            priority_access_level_required: {self.priority_access_level_required}
            id_product: {self.id_product}
            is_super_user: {self.is_super_user}
            priority_access_level_user: {self.priority_access_level_user}
            can_view: {self.can_view}
            can_edit: {self.can_edit}
            can_admin: {self.can_admin}
            '''
