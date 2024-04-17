"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Product Delivery Option Business Object

Description:
Business object for delivery option
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
"""
class Delivery_Option():
    name: str
    delay_min: int # days
    delay_max: int
    quantity_min: float
    quantity_max: float
    regions: list # [Enum_Delivery_Region]
    cost: float

    def __new__(cls, name, delay_min, delay_max, quantity_min, quantity_max, regions, cost):
        _m = 'Delivery_Option.__new__'
        v_arg_type = 'class attribute'
        av.val_str(name, 'name', _m, v_arg_type = v_arg_type)
        av.val_int(delay_min, 'delay_min', _m, 0, v_arg_type = v_arg_type)
        av.val_int(delay_max, 'delay_max', _m, 0, v_arg_type = v_arg_type)
        av.val_float(quantity_min, 'quantity_min', _m, 0, v_arg_type = v_arg_type)
        av.val_float(quantity_max, 'quantity_max', _m, 0, v_arg_type = v_arg_type)
        av.val_list_instances(regions, 'regions', _m, Enum_Delivery_Region, v_arg_type = v_arg_type)
        av.val_float(cost, 'cost', _m, 0, v_arg_type = v_arg_type)
        return super(Delivery_Option, cls).__new__(cls)
    
    def __init__(self, name, delay_min, delay_max, quantity_min, quantity_max, regions, cost):
        self.name = name
        self.delay_min = delay_min
        self.delay_max = delay_max
        self.quantity_min = quantity_min
        self.quantity_max = quantity_max
        self.regions = regions
        self.cost = cost
"""
class Delivery_Option(db.Model):
    id_option = db.Column(db.Integer, primary_key=True)
    id_product = db.Column(db.Integer)
    id_permutation = db.Column(db.Integer)
    id_category = db.Column(db.Integer)
    code = db.Column(db.String(50))
    name = db.Column(db.String(100))
    latency_min = db.Column(db.Integer)
    latency_max = db.Column(db.Integer)
    quantity_min = db.Column(db.Integer)
    quantity_max = db.Column(db.Integer)
    codes_region = db.Column(db.String(4000))
    names_region = db.Column(db.String(4000))
    price_GBP = db.Column(db.Float)
    display_order = db.Column(db.Integer)
    def __init__(self):
        self.delivery_regions = []
    def make_from_DB_product(query_row):
        option = Delivery_Option()
        option.id_option = query_row[0]
        option.id_product = query_row[1]
        option.id_permutation = query_row[2]
        option.id_category = query_row[3]
        option.code = query_row[4]
        option.name = query_row[5]
        option.latency_min = query_row[6]
        option.latency_max = query_row[7]
        option.quantity_min = query_row[8]
        option.quantity_max = query_row[9]
        option.codes_region = query_row[10]
        option.names_region = query_row[11]
        option.price_GBP = query_row[12]
        option.display_order = query_row[13]
        return option
    def __repr__(self):
        return f'''
            id: {self.id_option}
            id_product: {self.id_product}
            id_category: {self.id_category}
            name: {self.name}
            code: {self.code}
            latency_min: {self.latency_min}
            latency_max: {self.latency_max}
            quantity_min: {self.quantity_min}
            quantity_max: {self.quantity_max}
            codes_region: {self.codes_region}
            names_region: {self.names_region}
            price_GBP: {self.price_GBP}
            display_order: {self.display_order}
            '''
