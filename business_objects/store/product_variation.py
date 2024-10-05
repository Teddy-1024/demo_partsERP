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
from business_objects.store.product_variation_type import Product_Variation_Type
from extensions import db
# external
from dataclasses import dataclass
from typing import ClassVar
from pydantic import BaseModel
from itertools import filterfalse
from operator import attrgetter


class Product_Variation(db.Model, Store_Base):
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Store_Base.ATTR_ID_PRODUCT_VARIATION
    NAME_ATTR_OPTION_TEXT = Store_Base.FLAG_NAME

    id_variation = db.Column(db.Integer, primary_key=True)
    id_type = db.Column(db.Integer)
    code = db.Column(db.String(50))
    name = db.Column(db.String(255))
    display_order = db.Column(db.Integer)
    active = db.Column(db.Boolean)
    
    id_permutation = db.Column(db.Integer)
    id_product = db.Column(db.Integer)
    id_category = db.Column(db.Integer)

    def __init__(self):
        super().__init__()
        self.variation_type = None
    
    @classmethod
    def from_DB_get_many_product_catalogue(cls, query_row):
        variation = Product_Variation.from_DB_get_many_product_variation(query_row)
        variation.id_product = query_row[11]
        variation.id_permutation = query_row[12]
        variation.id_category = query_row[13]
        variation.variation_type = Product_Variation_Type.from_DB_get_many_product_catalogue(query_row)
        return variation

    @classmethod
    def from_DB_get_many_product_variation(cls, query_row):
        variation = cls()
        variation.id_variation = query_row[0]
        variation.id_type = query_row[1]
        variation.code = query_row[2]
        variation.name = query_row[3]
        variation.display_order = query_row[4]
        variation.active = av.input_bool(query_row[5], cls.FLAG_ACTIVE, f'{cls.__name__}.from_DB_get_many_product_variation')
        return variation
    
    @classmethod
    def from_json(cls, json):
        variation = cls()
        variation.id_variation = json[cls.ATTR_ID_PRODUCT_VARIATION]
        variation.code = json[cls.FLAG_CODE]
        variation.name = json[cls.FLAG_NAME]
        variation.display_order = json[cls.FLAG_DISPLAY_ORDER]
        variation.active = json[cls.FLAG_ACTIVE]
        variation.id_permutation = json[cls.ATTR_ID_PRODUCT_PERMUTATION]
        variation.id_product = json[cls.ATTR_ID_PRODUCT]
        variation.id_category = json[cls.ATTR_ID_PRODUCT_CATEGORY]
        return variation

    def __repr__(self):
        return f'''
            {self.__class__.__name__}
            id_variation: {self.id_variation}
            id_type: {self.id_type}
            code: {self.code}
            name: {self.name}
            display_order: {self.display_order}
            active: {self.active}
            id_permutation: {self.id_permutation}
            id_product: {self.id_product}
            id_category: {self.id_category}
            variation_type: {self.variation_type}
            '''
    
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_PRODUCT_VARIATION: self.id_variation,
            self.ATTR_ID_PRODUCT_VARIATION_TYPE: self.id_type,
            self.FLAG_CODE: self.code,
            self.FLAG_NAME: self.name,
            self.FLAG_DISPLAY_ORDER: self.display_order,
            self.FLAG_ACTIVE: self.active,
            self.ATTR_ID_PRODUCT: self.id_product,
            self.ATTR_ID_PRODUCT_PERMUTATION: self.id_permutation,
            self.ATTR_ID_PRODUCT_CATEGORY: self.id_category,
        }
    def to_json_option(self):
        return {
            'value': self.id_variation,
            'text': self.name
        }


@dataclass
class Product_Variation_Filters():
    get_all_variation_type: bool
    get_inactive_variation_type: bool
    # get_first_variation_type: bool
    ids_variation_type: str
    get_all_variation: bool
    get_inactive_variation: bool
    # get_first_variation: bool
    ids_variation: str

    def to_json(self):
        return {
            'a_get_all_variation_type': self.get_all_variation_type,
            'a_get_inactive_variation_type': self.get_inactive_variation_type,
            # 'a_get_first_variation_type': self.get_first_variation_type,
            'a_ids_variation_type': self.ids_variation_type,
            'a_get_all_variation': self.get_all_variation,
            'a_get_inactive_variation': self.get_inactive_variation,
            # 'a_get_first_variation': self.get_first_variation,
            'a_ids_variation': self.ids_variation,

        }
    """
    @staticmethod
    def from_form(form):
        av.val_instance(form, 'form', 'User_Filters.from_form', Filters_Product_Variation)
        get_inactive = av.input_bool(form.active.data, "active", "User_Filters.from_form")
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
            # get_first_variation_type = False,
            ids_variation_type = '',
            get_all_variation = True,
            get_inactive_variation = False,
            # get_first_variation = False,
            ids_variation = ''
        )


class Product_Variation_Container(BaseModel):
    variation_types: list = []
    variations: list = []

    def add_product_variation_type(self, variation_type):
        av.val_instance(variation_type, 'variation_type', 'Product_Variation_Container.add_product_variation_type', Product_Variation_Type)
        self.variations.append(variation_type)
    def add_product_variation(self, variation):
        av.val_instance(variation, 'variation', 'Product_Variation_Container.add_product_variation', Product_Variation)
        if variation.variation_type is None:
            variation_type = next(filterfalse(lambda x: x.id_type != variation.id_type, self.variation_types), None)
            if variation_type is not None:
                variation.variation_type = variation_type
        self.variations.append(variation)

    def __repr__(self):
        return f'Product_Variation_Container:\nvariations_types: {self.variation_types}\nvariations: {self.variations}'
    
    def to_list_variation_options(self):
        list_variations = []
        for variation in self.variations:
            list_variations.append(variation.to_json_option())
        print(f'list_variations: {list_variations}')
        return list_variations
    def to_list_variation_type_options(self):
        list_variation_types = []
        for variation_type in self.variation_types:
            list_variation_types.append(variation_type.to_json_option())
        return list_variation_types
    