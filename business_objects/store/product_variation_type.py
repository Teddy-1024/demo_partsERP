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
from itertools import filterfalse
from operator import attrgetter

class Product_Variation_Type(db.Model, Store_Base):
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Store_Base.ATTR_ID_PRODUCT_VARIATION_TYPE
    NAME_ATTR_OPTION_TEXT = Store_Base.FLAG_NAME_SINGULAR

    id_type = db.Column(db.Integer, primary_key=True)
    code = db.Column(db.String(50))
    name_singular = db.Column(db.String(255))
    name_plural = db.Column(db.String(255))
    display_order = db.Column(db.Integer)
    active = db.Column(db.Boolean)
        
    def __init__(self):
        super().__init__()
        
    @classmethod
    def from_DB_get_many_product_catalogue(cls, query_row):
        variation_type = cls()
        variation_type.id_type = query_row[1]
        variation_type.code = query_row[6]
        variation_type.name_singular = query_row[7]
        variation_type.name_plural = query_row[8]
        variation_type.display_order = query_row[9]
        variation_type.active = av.input_bool(query_row[10], cls.FLAG_ACTIVE, f'{cls.__name__}.from_DB_get_many_product_catalogue')
        return variation_type

    @classmethod
    def from_DB_get_many_product_variation(cls, query_row):
        variation_type = cls()
        variation_type.id_type = query_row[0]
        variation_type.code = query_row[1]
        variation_type.name_singular = query_row[2]
        variation_type.name_plural = query_row[3]
        variation_type.display_order = query_row[4]
        variation_type.active = av.input_bool(query_row[5], cls.FLAG_ACTIVE, f'{cls.__name__}.from_DB_get_many_product_variation')
        return variation_type
    
    @classmethod
    def from_json(cls, json):
        variation_type = cls()
        variation_type.id_type = json[cls.ATTR_ID_PRODUCT_VARIATION_TYPE]
        variation_type.code = json[cls.FLAG_CODE]
        variation_type.name_singular = json[cls.FLAG_NAME_SINGULAR]
        variation_type.name_plural = json[cls.FLAG_NAME_PLURAL]
        variation_type.display_order = json[cls.FLAG_DISPLAY_ORDER]
        variation_type.active = json[cls.FLAG_ACTIVE]
        return variation_type

    def __repr__(self):
        return f'''
            {self.__class__.__name__}
            id_type: {self.id_type}
            code: {self.code}
            name_singular: {self.name_singular}
            name_plural: {self.name_plural}
            display_order: {self.display_order}
            active: {self.active}
            '''
    
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_PRODUCT_VARIATION_TYPE: self.id_type,
            self.FLAG_CODE: self.code,
            self.FLAG_NAME_SINGULAR: self.name_singular,
            self.FLAG_NAME_PLURAL: self.name_plural,
            self.FLAG_DISPLAY_ORDER: self.display_order,
            self.FLAG_ACTIVE: self.active,
        }
    def to_json_option(self):
        return {
            'value': self.id_type,
            'text': self.name_singular
        }

