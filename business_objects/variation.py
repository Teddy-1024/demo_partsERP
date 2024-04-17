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


# VARIABLE INSTANTIATION
db = SQLAlchemy()


# CLASSES
class Variation(db.Model):
    id_variation = db.Column(db.Integer, primary_key=True)
    id_product = db.Column(db.Integer)
    id_permutation = db.Column(db.Integer)
    id_category = db.Column(db.Integer)
    code_variation_type = db.Column(db.String(50))
    name_variation_type = db.Column(db.String(255))
    code_variation = db.Column(db.String(50))
    name_variation = db.Column(db.String(255))
    display_order = db.Column(db.Integer)
    
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
        variation = Variation()
        variation.id_variation = query_row[0]
        variation.id_product = query_row[1]
        variation.id_permutation = query_row[2]
        variation.id_category = query_row[3]
        variation.code_variation_type = query_row[4]
        variation.name_variation_type = query_row[5]
        variation.code_variation = query_row[6]
        variation.name_variation = query_row[7]
        variation.display_order = query_row[8]
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
            display_order: {self.display_order}
            '''
