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
from business_objects.store.product_variation import Product_Variation
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
    NAME_ATTR_OPTION_TEXT = Store_Base.FLAG_NAME

    id_type = db.Column(db.Integer, primary_key=True)
    code = db.Column(db.String(50))
    name_singular = db.Column(db.String(255))
    name_plural = db.Column(db.String(255))
    display_order = db.Column(db.Integer)
    active = db.Column(db.Boolean)
        
    def __init__(self):
        super().__init__()
        self.variations = []

    @classmethod
    def from_DB_get_many_product_catalogue(cls, query_row):
        variation_type = cls()
        variation_type.id_type = query_row[1]
        variation_type.code = query_row[6]
        variation_type.name_singular = query_row[7]
        variation_type.name_plural = query_row[8]
        variation_type.display_order = query_row[9]
        variation_type.active = av.input_bool(query_row[10], cls.FLAG_ACTIVE, f'{cls.__name__}.from_DB_get_many_product_catalogue')
        variation_type.variations = [Product_Variation.from_DB_get_many_product_catalogue(query_row)]
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
        variation_type.name_singular = json.get(cls.FLAG_NAME_SINGULAR, json.get(cls.FLAG_NAME, ''))
        variation_type.name_plural = json[cls.FLAG_NAME_PLURAL]
        variation_type.display_order = json[cls.FLAG_DISPLAY_ORDER]
        variation_type.active = json[cls.FLAG_ACTIVE]
        variations = json.get(cls.FLAG_PRODUCT_VARIATIONS, [])
        if variations is not None and len(variations) > 0:
            variation_type.variations = [Product_Variation.from_json(variation) for variation in variations]
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
            self.FLAG_NAME: self.name_singular,
            self.FLAG_NAME_PLURAL: self.name_plural,
            self.FLAG_DISPLAY_ORDER: self.display_order,
            self.FLAG_ACTIVE: self.active,
            self.FLAG_PRODUCT_VARIATIONS: [variation.to_json() for variation in self.variations]
        }
    def to_json_option(self):
        return {
            'value': self.id_type,
            'text': self.name_singular
        }
    """
    def get_preview_variations(self):
        preview = ''
        if len(self.variations) > 0:
            # preview = '\n'.join([variation.name for variation in self.variations])
            preview = '<p>' + '</p><p>'.join([variation.name for variation in self.variations]) + '</p>'
        return preview
    def get_str_list_ids_variation(self):
        if self.variations is None or len(self.variations) == 0:
            return ''
        return ','.join([str(variation.id_variation) for variation in self.variations])
    """

class Product_Variation_Type_Temp(db.Model, Store_Base):
    __tablename__ = 'Shop_Variation_Type_Temp'
    __table_args__ = { 'extend_existing': True }
    id_temp: int = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_type: int = db.Column(db.Integer)
    code: str = db.Column(db.String(50))
    name: str = db.Column(db.String(255))
    name_plural: str = db.Column(db.String(256))
    active: bool = db.Column(db.Boolean)
    display_order: int = db.Column(db.Integer)
    guid: str = db.Column(db.String(36))

    def __init__(self):
        super().__init__()
        self.id_temp = None
    @classmethod
    def from_product_variation_type(cls, product_variation_type):
        row = cls()
        row.id_type = product_variation_type.id_type
        row.code = product_variation_type.code
        row.name = product_variation_type.name_singular
        row.name_plural = product_variation_type.name_plural
        row.active = 1 if av.input_bool(product_variation_type.active, cls.FLAG_ACTIVE, f'{cls.__name__}.from_product_variation_type') else 0
        row.display_order = product_variation_type.display_order
        return row
    def to_json(self):
        return {
            'id_type': self.id_type,
            'code': self.code,
            'name': self.name,
            'name_plural': self.name_plural,
            'active': self.active,
            'display_order': self.display_order,
            'guid': self.guid,
        }
    def __repr__(self):
        return f'''
            {self.__class__.__name__}
            id_temp: {self.id_temp}
            id_type: {self.id_type}
            code: {self.code}
            name: {self.name}
            name_plural: {self.name_plural}
            active: {self.active}
            display_order: {self.display_order}
            guid: {self.guid}
            '''