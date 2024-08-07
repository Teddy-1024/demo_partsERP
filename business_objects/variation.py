"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Product Variation Business Object

Description:
Business object for product variation
"""

# IMPORTS
# VARIABLE INSTANTIATION
# CLASSES
# METHODS

# IMPORTS
# internal
import lib.argument_validation as av
from lib import data_types
from forms import Form_Basket_Add, Form_Basket_Edit # Form_Product
# external
from enum import Enum
from datetime import datetime, timedelta
import locale
from flask_sqlalchemy import SQLAlchemy
from dataclasses import dataclass
from typing import ClassVar
from pydantic import BaseModel

# VARIABLE INSTANTIATION
db = SQLAlchemy()


# CLASSES
class Variation(db.Model):
    ATTR_ID_CATEGORY: ClassVar[str] = 'id_category'
    ATTR_ID_PERMUTATION: ClassVar[str] = 'id_permutation'
    ATTR_ID_PRODUCT: ClassVar[str] = 'id_product'
    ATTR_ID_VARIATION: ClassVar[str] = 'id_variation'
    ATTR_ID_VARIATION_TYPE: ClassVar[str] = 'id_variation_type'
    KEY_ACTIVE_VARIATION: ClassVar[str] = 'active_variation'
    KEY_ACTIVE_VARIATION_TYPE: ClassVar[str] = 'active_variation_type'
    KEY_CODE_VARIATION: ClassVar[str] = 'code_variation'
    KEY_CODE_VARIATION_TYPE: ClassVar[str] = 'code_variation_type'
    KEY_DISPLAY_ORDER_VARIATION: ClassVar[str] = 'display_order_variation'
    KEY_DISPLAY_ORDER_VARIATION_TYPE: ClassVar[str] = 'display_order_variation_type'
    KEY_NAME_VARIATION: ClassVar[str] = 'name_variation'
    KEY_NAME_VARIATION_TYPE: ClassVar[str] = 'name_variation_type'
    
    id_variation = db.Column(db.Integer, primary_key=True)
    code_variation = db.Column(db.String(50))
    name_variation = db.Column(db.String(255))
    active_variation = db.Column(db.Boolean)
    display_order_variation = db.Column(db.Integer)
    id_type = db.Column(db.Integer)
    code_variation_type = db.Column(db.String(50))
    name_variation_type = db.Column(db.String(255))
    name_plural_variation_type = db.Column(db.String(255))
    active_variation_type = db.Column(db.Boolean)
    display_order_variation_type = db.Column(db.Integer)
    id_product = db.Column(db.Integer)
    id_permutation = db.Column(db.Integer)
    id_category = db.Column(db.Integer)
    
    """
    def __new__(cls, id, id_product, id_category, name_type, code_type, name, code, display_order):
        _m = 'Variation.__new__'
        v_arg_type = 'class attribute'
        av.val_int(id, 'id', _m, 0, v_arg_type=v_arg_type)
        av.val_int(id_product, 'id_product', _m, 0, v_arg_type=v_arg_type)
        av.val_int(id_category, 'id_category', _m, 0, v_arg_type=v_arg_type)
        av.val_str(code_type, 'code_type', _m, max_len=50, v_arg_type=v_arg_type)
        av.val_str(name_type, 'name_type', _m, max_len=256, v_arg_type=v_arg_type)
        av.val_str(code, 'code', _m, max_len=50, v_arg_type=v_arg_type)
        av.val_str(name, 'name', _m, max_len=256, v_arg_type=v_arg_type)
        av.val_int(display_order, 'display_order', _m, v_arg_type=v_arg_type)
        return super(Variation, cls).__new__(cls)
    
    def __init__(self, id, id_product, id_category, name_type, code_type, name, code, display_order):
        self.id_variation = id
        self.id_product = id_product
        self.id_category = id_category
        self.name_variation_type = name_type
        self.code_variation_type = code_type
        self.name_variation = name
        self.code_variation = code
        self.display_order = display_order
        super().__init__()
    """
    def make_from_DB_product(query_row):
        variation = Variation.make_from_DB_variation(query_row)
        variation.id_product = query_row[11]
        variation.id_permutation = query_row[12]
        variation.id_category = query_row[13]
        return variation

    def make_from_DB_variation(query_row):
        _m = 'Variation.make_from_DB_variation'
        variation = Variation()
        variation.id_variation = query_row[0]
        variation.code_variation = query_row[1]
        variation.name_variation = query_row[2]
        variation.active_variation = av.input_bool(query_row[3], 'active_variation', _m)
        variation.display_order_variation = query_row[4]
        variation.id_type = query_row[5]
        variation.code_variation_type = query_row[6]
        variation.name_variation_type = query_row[7]
        variation.name_plural_variation_type = query_row[8]
        variation.active_variation_type = av.input_bool(query_row[9], 'active_variation', _m)
        variation.display_order_variation_type = query_row[10]
        return variation
    
    def from_json(json):
        variation = Variation()
        variation.id_variation = json[Variation.ATTR_ID_VARIATION]
        variation.id_product = json[Variation.ATTR_ID_PRODUCT]
        variation.id_permutation = json[Variation.ATTR_ID_PERMUTATION]
        variation.id_category = json[Variation.ATTR_ID_CATEGORY]
        variation.name_variation_type = json[Variation.KEY_NAME_VARIATION_TYPE]
        variation.name_variation = json[Variation.KEY_NAME_VARIATION]
        return variation

    def __repr__(self):
        return f'''
            id: {self.id_variation}
            id_product: {self.id_product}
            id_permutation: {self.id_permutation}
            id_category: {self.id_category}
            code_variation_type: {self.code_variation_type}
            name_variation_type: {self.name_variation_type}
            code_variation: {self.code_variation}
            name_variation: {self.name_variation}
            active_variation: {self.active_variation}
            active_variation_type: {self.active_variation_type}
            display_order_variation: {self.display_order_variation}
            display_order_variation_type: {self.display_order_variation_type}
            '''
    
    def to_json(self):
        return {
            Variation.ATTR_ID_VARIATION: self.id_variation,
            Variation.ATTR_ID_PRODUCT: self.id_product,
            Variation.ATTR_ID_PERMUTATION: self.id_permutation,
            Variation.ATTR_ID_CATEGORY: self.id_category,
            Variation.ATTR_ID_VARIATION_TYPE: self.id_type,
            Variation.KEY_CODE_VARIATION_TYPE: self.code_variation_type,
            Variation.KEY_CODE_VARIATION: self.code_variation,
            Variation.KEY_DISPLAY_ORDER_VARIATION_TYPE: self.display_order_variation_type,
            Variation.KEY_DISPLAY_ORDER_VARIATION: self.display_order_variation,
            Variation.KEY_NAME_VARIATION_TYPE: self.name_variation_type,
            Variation.KEY_NAME_VARIATION: self.name_variation,
            Variation.KEY_ACTIVE_VARIATION_TYPE: self.active_variation_type,
            Variation.KEY_ACTIVE_VARIATION: self.active_variation,
        }
    
    def to_json_variation_type(self):
        return {
            Variation.ATTR_ID_VARIATION_TYPE: self.id_type,
            Variation.KEY_CODE_VARIATION_TYPE: self.code_variation_type,
            Variation.KEY_DISPLAY_ORDER_VARIATION_TYPE: self.display_order_variation_type,
            Variation.KEY_NAME_VARIATION_TYPE: self.name_variation_type,
            Variation.KEY_ACTIVE_VARIATION_TYPE: self.active_variation_type,
        }

@dataclass
class Variation_Filters():
    get_all_variation_type: bool
    get_inactive_variation_type: bool
    get_first_variation_type: bool
    ids_variation_type: str
    get_all_variation: bool
    get_inactive_variation: bool
    get_first_variation: bool
    ids_variation: str

    def to_json(self):
        return {
            'a_get_all_variation_type': self.get_all_variation_type,
            'a_get_inactive_variation_type': self.get_inactive_variation_type,
            'a_get_first_variation_type': self.get_first_variation_type,
            'a_ids_variation_type': self.ids_variation_type,
            'a_get_all_variation': self.get_all_variation,
            'a_get_inactive_variation': self.get_inactive_variation,
            'a_get_first_variation': self.get_first_variation,
            'a_ids_variation': self.ids_variation,

        }
    """
    @staticmethod
    def from_form(form):
        av.val_instance(form, 'form', 'User_Filters.from_form', Form_Filters_Variation)
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
    """
    
    @staticmethod
    def get_default():
        return Variation_Filters(
            get_all_variation_type = True,
            get_inactive_variation_type = False,
            get_first_variation_type = False,
            ids_variation_type = '',
            get_all_variation = True,
            get_inactive_variation = False,
            get_first_variation = False,
            ids_variation = ''
        )
    
class Variation_List(BaseModel):
    variations: list = []

    def add_variation(self, variation):
        av.val_instance(variation, 'variation', 'Variation_List.add_variation', Variation)
        self.variations.append(variation)

    def __repr__(self):
        return f'variations: {self.variations}'
    
    def to_list_variations(self):
        list_variations = []
        for variation in self.variations:
            list_variations.append(variation.to_json())
        print(f'list_variations: {list_variations}')
        return list_variations
    
    def to_list_variation_types(self):
        list_variation_types = []
        list_variation_ids = []
        for variation in self.variations:
            if variation.id_type not in list_variation_ids:
                list_variation_ids.append(variation.id_type)
                list_variation_types.append(variation.to_json_variation_type())
        return list_variation_types
    