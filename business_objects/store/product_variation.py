"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Product Product_Variation Business Object

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
from business_objects.store.store_base import Store_Base
from extensions import db
# external
from dataclasses import dataclass
from typing import ClassVar
from pydantic import BaseModel


# CLASSES
class Product_Variation(db.Model, Store_Base):
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
    
    def __init__(self):
        super().__init__()
        Store_Base.__init__(self)
    
    def from_DB_product(query_row):
        variation = Product_Variation.from_DB_variation(query_row)
        variation.id_product = query_row[11]
        variation.id_permutation = query_row[12]
        variation.id_category = query_row[13]
        return variation

    def from_DB_variation(query_row):
        _m = 'Product_Variation.from_DB_variation'
        variation = Product_Variation()
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
    
    @classmethod
    def from_json(cls, json):
        variation = cls()
        variation.id_variation = json[cls.ATTR_ID_VARIATION]
        variation.id_product = json[cls.ATTR_ID_PRODUCT]
        variation.id_permutation = json[cls.ATTR_ID_PERMUTATION]
        variation.id_category = json[cls.ATTR_ID_CATEGORY]
        variation.name_variation_type = json[cls.KEY_NAME_VARIATION_TYPE]
        variation.name_variation = json[cls.KEY_NAME_VARIATION]
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
            self.ATTR_ID_PRODUCT_VARIATION: self.id_variation,
            self.ATTR_ID_PRODUCT: self.id_product,
            self.ATTR_ID_PRODUCT_PERMUTATION: self.id_permutation,
            self.ATTR_ID_PRODUCT_CATEGORY: self.id_category,
            self.ATTR_ID_PRODUCT_VARIATION_TYPE: self.id_type,
            self.KEY_CODE_VARIATION_TYPE: self.code_variation_type,
            self.KEY_CODE_VARIATION: self.code_variation,
            self.KEY_DISPLAY_ORDER_VARIATION_TYPE: self.display_order_variation_type,
            self.KEY_DISPLAY_ORDER_VARIATION: self.display_order_variation,
            self.KEY_NAME_VARIATION_TYPE: self.name_variation_type,
            self.KEY_NAME_VARIATION: self.name_variation,
            self.KEY_ACTIVE_VARIATION_TYPE: self.active_variation_type,
            self.KEY_ACTIVE_VARIATION: self.active_variation,
        }
    
    def to_json_variation_type(self):
        return {
            self.ATTR_ID_PRODUCT_VARIATION_TYPE: self.id_type,
            self.KEY_CODE_VARIATION_TYPE: self.code_variation_type,
            self.KEY_DISPLAY_ORDER_VARIATION_TYPE: self.display_order_variation_type,
            self.KEY_NAME_VARIATION_TYPE: self.name_variation_type,
            self.KEY_ACTIVE_VARIATION_TYPE: self.active_variation_type,
        }

@dataclass
class Product_Variation_Filters():
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
        av.val_instance(form, 'form', 'User_Filters.from_form', Form_Filters_Product_Variation)
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
        return Product_Variation_Filters(
            get_all_variation_type = True,
            get_inactive_variation_type = False,
            get_first_variation_type = False,
            ids_variation_type = '',
            get_all_variation = True,
            get_inactive_variation = False,
            get_first_variation = False,
            ids_variation = ''
        )
    
class Product_Variation_List(BaseModel):
    variations: list = []

    def add_variation(self, variation):
        av.val_instance(variation, 'variation', 'Product_Variation_List.add_variation', Product_Variation)
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
    