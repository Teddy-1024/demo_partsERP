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
from business_objects.db_base import Get_Many_Parameters_Base
from business_objects.store.store_base import Store_Base
# from business_objects.store.product_variation_type import Product_Variation_Type
from extensions import db
from helpers.helper_app import Helper_App
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
        # variation.variation_type = Product_Variation_Type.from_DB_get_many_product_catalogue(query_row)
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
        variation.id_type = json[cls.ATTR_ID_PRODUCT_VARIATION_TYPE]
        variation.code = json[cls.FLAG_CODE]
        variation.name = json[cls.FLAG_NAME]
        variation.display_order = json[cls.FLAG_DISPLAY_ORDER]
        variation.active = 1 if av.input_bool(json[cls.FLAG_ACTIVE], cls.FLAG_ACTIVE, f'{cls.__name__}.from_json') else 0
        variation.id_permutation = json.get(cls.ATTR_ID_PRODUCT_PERMUTATION, None)
        variation.id_product = json.get(cls.ATTR_ID_PRODUCT, None)
        variation.id_category = json.get(cls.ATTR_ID_PRODUCT_CATEGORY, None)
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

class Parameters_Product_Variation(Get_Many_Parameters_Base):
    a_get_all_variation_type: bool
    a_get_inactive_variation_type: bool
    a_ids_variation_type: str
    a_get_all_variation: bool
    a_get_inactive_variation: bool
    a_ids_variation: str
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
    @classmethod
    def get_default(cls):
        return cls(
            a_get_all_variation_type = True,
            a_get_inactive_variation_type = False,
            a_ids_variation_type = '',
            a_get_all_variation = True,
            a_get_inactive_variation = False,
            a_ids_variation = ''
        )
    @classmethod
    def from_filters_product_variation(cls, form):
        parameters = cls.get_default()
        get_inactive = not form.active.data
        parameters.a_get_inactive_variation_type = get_inactive
        parameters.a_get_inactive_variation = get_inactive
        return parameters

class Product_Variation_Temp(db.Model, Store_Base):
    __tablename__ = 'Shop_Variation_Temp'
    __table_args__ = { 'extend_existing': True }
    id_temp: int = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_variation: int = db.Column(db.Integer) # , primary_key=True)
    id_type: int = db.Column(db.Integer, nullable=False)
    code: str = db.Column(db.String(50)) 
    name: str = db.Column(db.String(255))
    active: bool = db.Column(db.Boolean)
    display_order: int = db.Column(db.Integer)
    guid: str = db.Column(db.String(36))

    def __repr__(self):
        attrs = '\n'.join(f'{k}={v!r}' for k, v in self.__dict__.items())
        return f'<{self.__class__.__name__}(\n{attrs}\n)>'
    def __init__(self):
        super().__init__()
        self.id_temp = None
    @classmethod
    def from_product_variation(cls, product_variation):
        row = cls()
        row.id_variation = product_variation.id_variation
        row.id_type = product_variation.id_type
        row.code = product_variation.code
        row.name = product_variation.name
        row.active = 1 if av.input_bool(product_variation.active, cls.FLAG_ACTIVE, f'{cls.__name__}.to_json') else 0
        row.display_order = product_variation.display_order
        return row
    def to_json(self):
        return {
            'id_variation': self.id_variation,
            'id_type': self.id_type,
            'code': self.code,
            'name': self.name,
            'active': self.active,
            'display_order': self.display_order,
            'guid': self.guid,
        }