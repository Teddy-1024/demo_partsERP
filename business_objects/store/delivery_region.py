"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Delivery Region Business Object

Description:
Business object for delivery region
"""

# internal
from extensions import db
# external
from enum import Enum
from typing import ClassVar


class Enum_Delivery_Region(Enum):
    UK = 0

class Delivery_Region(db.Model):
    ATTR_ID_REGION: ClassVar[str] = 'id-region'
    FLAG_CODE: ClassVar[str] = 'code-region'
    FLAG_NAME: ClassVar[str] = 'name-region'
    FLAG_ACTIVE: ClassVar[str] = 'active-region'
    FLAG_DISPLAY_ORDER: ClassVar[str] = 'display-order-region'

    id_region = db.Column(db.Integer, primary_key=True)
    """
    id_category = db.Column(db.Integer)
    id_product = db.Column(db.Integer)
    id_discount = db.Column(db.Integer)
    """
    code = db.Column(db.String(50))
    name = db.Column(db.String(200))
    active = db.Column(db.Boolean)
    display_order = db.Column(db.Integer)
    """
    def __new__(cls, id, id_category, id_product, id_discount, code, name, display_order):
        _m = 'Delivery_Region.__new__'
        v_arg_type = 'class attribute'
        av.val_int(id, 'id', _m, 0, v_arg_type = v_arg_type)
        av.val_int(id_category, 'id_category', _m, 0, v_arg_type=v_arg_type)
        av.val_int(id_product, 'id_product', _m, 0, v_arg_type = v_arg_type)
        av.val_int(id_discount, 'id_discount', _m, v_arg_type = v_arg_type)
        av.val_str(code, 'code', _m, max_len = 50, v_arg_type = v_arg_type)
        av.val_str(name, 'name', _m, max_len = 100, v_arg_type = v_arg_type)
        av.val_int(display_order, 'display_order', _m, v_arg_type = v_arg_type)
        return super(Delivery_Region, cls).__new__(cls)
    
    def __init__(self, id, id_category, id_product, id_discount, code, name, display_order):
        self.id_region = id
        self.id_category = id_category
        self.id_product = id_product
        self.id_discount = id_discount
        self.name = name
        self.code = code
        self.display_order = display_order
    """
    def from_DB_get_many_product_catalogue(query_row):
        region = Delivery_Region()
        region.id_region = query_row[0]
        region.name = query_row[1]
        region.code = query_row[2]
        # self.display_order = query_row[3]
        return region
    def from_DB_region(query_row):
        region = Delivery_Region()
        region.id_region = query_row[0]
        region.code = query_row[1]
        region.name = query_row[2]
        region.active = query_row[3]
        region.display_order = query_row[4]
        return region
    def __repr__(self):
        return f'''
            id: {self.id_region}
            name: {self.name}
            code: {self.code}
            active: {self.active}
            display_order: {self.display_order}
            '''
    def to_json(self):
        return {
            Delivery_Region.ATTR_ID_REGION: self.id_region,
            Delivery_Region.FLAG_CODE: self.code,
            Delivery_Region.FLAG_NAME: self.name,
            Delivery_Region.FLAG_ACTIVE: self.active,
            Delivery_Region.FLAG_DISPLAY_ORDER: self.display_order
        }
    @staticmethod
    def from_json(json_region):
        region = Delivery_Region()
        region.id_region = json_region[Delivery_Region.ATTR_ID_REGION]
        region.code = json_region[Delivery_Region.FLAG_CODE]
        region.name = json_region[Delivery_Region.FLAG_NAME]
        region.active = json_region[Delivery_Region.FLAG_ACTIVE]
        region.display_order = json_region[Delivery_Region.FLAG_DISPLAY_ORDER]
        return region
