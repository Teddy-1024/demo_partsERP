"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Manufacturing_Purchase_Order Business Object

Description:
Business object for manufacturing_purchase_order
"""

# internal
import lib.argument_validation as av
from business_objects.currency import Currency
from business_objects.db_base import Get_Many_Parameters_Base
from business_objects.store.store_base import Store_Base
from extensions import db
from helpers.helper_app import Helper_App
# external
from pydantic import BaseModel
from typing import ClassVar, Optional
from datetime import datetime

class Manufacturing_Purchase_Order(db.Model, Store_Base):
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Store_Base.ATTR_ID_MANUFACTURING_PURCHASE_ORDER
    NAME_ATTR_OPTION_TEXT: ClassVar[str] = Store_Base.FLAG_NAME
    # __tablename__ = 'Shop_Manufacturing_Purchase_Order_Temp'
    id_order = db.Column(db.Integer, primary_key=True)
    id_currency = db.Column(db.Integer)
    cost_total_local_VAT_excl = db.Column(db.Float)
    cost_total_local_VAT_incl = db.Column(db.Float)
    price_total_local_VAT_excl = db.Column(db.Float)
    price_total_local_VAT_incl = db.Column(db.Float)
    active = db.Column(db.Boolean)
    created_on = db.Column(db.DateTime)
    created_by = db.Column(db.Integer)
    name = db.Column(db.String(255))
    # items: list = None
    def __init__(self):
        super().__init__()
        Store_Base.__init__(self)
        self.items = []
        self.currency = None
    @classmethod
    def from_DB_manufacturing_purchase_order(cls, query_row):
        manufacturing_purchase_order = cls()
        manufacturing_purchase_order.id_order = query_row[0]
        manufacturing_purchase_order.id_currency = query_row[1]
        manufacturing_purchase_order.currency = Currency.from_DB_manufacturing_purchase_order(query_row)
        manufacturing_purchase_order.cost_total_local_VAT_excl = query_row[4]
        manufacturing_purchase_order.cost_total_local_VAT_incl = query_row[5]
        manufacturing_purchase_order.price_total_local_VAT_excl = query_row[6]
        manufacturing_purchase_order.price_total_local_VAT_incl = query_row[7]
        manufacturing_purchase_order.active = av.input_bool(query_row[8], 'active', f'{cls.__name__}.from_DB_manufacturing_purchase_order')
        manufacturing_purchase_order.created_on = query_row[9]
        manufacturing_purchase_order.name = query_row[10]
        return manufacturing_purchase_order

    def __repr__(self):
        return f'''
{self.ATTR_ID_MANUFACTURING_PURCHASE_ORDER}: {self.id_order},
{self.ATTR_ID_CURRENCY}: {self.id_currency},
{self.FLAG_COST_TOTAL_LOCAL_VAT_EXCL}: {self.cost_total_local_VAT_excl},
{self.FLAG_COST_TOTAL_LOCAL_VAT_INCL}: {self.cost_total_local_VAT_incl},
{self.FLAG_PRICE_TOTAL_LOCAL_VAT_EXCL}: {self.price_total_local_VAT_excl},
{self.FLAG_PRICE_TOTAL_LOCAL_VAT_INCL}: {self.price_total_local_VAT_incl},
{self.FLAG_ACTIVE}: {self.active},
{self.FLAG_CREATED_ON}: {self.created_on},
{self.FLAG_NAME}: {self.name}
            '''
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_MANUFACTURING_PURCHASE_ORDER: self.id_order,
            self.ATTR_ID_CURRENCY: self.id_currency,
            self.FLAG_COST_TOTAL_LOCAL_VAT_EXCL: self.cost_total_local_VAT_excl,
            self.FLAG_COST_TOTAL_LOCAL_VAT_INCL: self.cost_total_local_VAT_incl,
            self.FLAG_PRICE_TOTAL_LOCAL_VAT_EXCL: self.price_total_local_VAT_excl,
            self.FLAG_PRICE_TOTAL_LOCAL_VAT_INCL: self.price_total_local_VAT_incl,
            self.FLAG_ORDER_ITEMS: [item.to_json() for item in self.items],
            self.FLAG_ACTIVE: av.input_bool(self.active, self.FLAG_ACTIVE, f'{self.__class__.__name__}.to_json'),
            self.FLAG_CREATED_ON: self.created_on,
            self.FLAG_NAME: self.name,
        }
    def to_json_option(self):
        return {
            'value': self.id_order,
            'text': self.name,
        }
    @classmethod
    def from_json(cls, json):
        Helper_App.console_log(f'{cls.__name__}.from_json: {json}')
        manufacturing_purchase_order = cls()
        manufacturing_purchase_order.id_order = json[cls.ATTR_ID_MANUFACTURING_PURCHASE_ORDER]
        manufacturing_purchase_order.id_currency = json[cls.ATTR_ID_CURRENCY]
        manufacturing_purchase_order.cost_total_local_VAT_excl = json[cls.FLAG_COST_TOTAL_LOCAL_VAT_EXCL]
        manufacturing_purchase_order.cost_total_local_VAT_incl = json[cls.FLAG_COST_TOTAL_LOCAL_VAT_INCL]
        manufacturing_purchase_order.price_total_local_VAT_excl = json[cls.FLAG_PRICE_TOTAL_LOCAL_VAT_EXCL]
        manufacturing_purchase_order.price_total_local_VAT_incl = json[cls.FLAG_PRICE_TOTAL_LOCAL_VAT_INCL]
        manufacturing_purchase_order.active = json[cls.FLAG_ACTIVE]
        manufacturing_purchase_order.created_on = json[cls.FLAG_CREATED_ON]
        manufacturing_purchase_order.name = json[cls.FLAG_NAME]
        return manufacturing_purchase_order
    def get_items_preview_str(self):
        preview = ''
        if self.items is not None:
            for item in self.items:
                if preview != '':
                    preview += '\n'
                preview += f'{item.name_permutation}{f" -(x{item.quantity_used})" if item.quantity_used > 0 else ""}{f" +(x{item.quantity_produced})" if item.quantity_produced > 0 else ""}'
        return preview

class Manufacturing_Purchase_Order_Product_Link(db.Model, Store_Base):
    FLAG_QUANTITY_PRODUCED: ClassVar[str] = 'quantity_produced'
    FLAG_QUANTITY_USED: ClassVar[str] = 'quantity_used'
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Store_Base.ATTR_ID_MANUFACTURING_PURCHASE_ORDER_PRODUCT_LINK
    NAME_ATTR_OPTION_TEXT: ClassVar[str] = Store_Base.FLAG_NAME
    # __tablename__ = 'Shop_Manufacturing_Purchase_Order_Temp'
    id_link = db.Column(db.Integer, primary_key=True)
    id_order = db.Column(db.Integer)
    id_permutation = db.Column(db.Integer)
    id_unit_quantity = db.Column(db.Integer)
    name_permutation = db.Column(db.String(255))
    quantity_used = db.Column(db.Float)
    quantity_produced = db.Column(db.Float)
    id_unit_latency_manufacture = db.Column(db.Integer)
    latency_manufacture = db.Column(db.Integer)
    display_order = db.Column(db.Integer)
    cost_unit_local_VAT_excl = db.Column(db.Float)
    cost_unit_local_VAT_incl = db.Column(db.Float)
    price_unit_local_VAT_excl = db.Column(db.Float)
    price_unit_local_VAT_incl = db.Column(db.Float)
    active = db.Column(db.Boolean)
    created_on = db.Column(db.DateTime)
    created_by = db.Column(db.Integer)
    def __init__(self):
        super().__init__()
        Store_Base.__init__(self)
    @classmethod
    def from_DB_manufacturing_purchase_order(cls, query_row):
        link = cls()
        link.id_link = query_row[0]
        link.id_order = query_row[1]
        link.id_permutation = query_row[2]
        link.name_permutation = query_row[3]
        link.id_unit_quantity = query_row[4]
        link.quantity_used = query_row[5]
        link.quantity_produced = query_row[6]
        link.id_unit_latency_manufacture = query_row[7]
        link.latency_manufacture = query_row[8]
        link.display_order = query_row[9]
        link.cost_unit_local_VAT_excl = query_row[10]
        link.cost_unit_local_VAT_incl = query_row[11]
        link.price_unit_local_VAT_excl = query_row[12]
        link.price_unit_local_VAT_incl = query_row[13]
        link.active = query_row[14]
        return link
    def __repr__(self):
        return f'''
{self.ATTR_ID_MANUFACTURING_PURCHASE_ORDER_PRODUCT_LINK}: {self.id_link},
{self.ATTR_ID_MANUFACTURING_PURCHASE_ORDER}: {self.id_order},
{self.ATTR_ID_PRODUCT_PERMUTATION}: {self.id_permutation},
{self.FLAG_NAME}: {self.name_permutation},
{self.ATTR_ID_UNIT_MEASUREMENT_QUANTITY}: {self.id_unit_quantity},
{self.FLAG_QUANTITY_USED}: {self.quantity_used},
{self.FLAG_QUANTITY_PRODUCED}: {self.quantity_produced},
{self.ATTR_ID_UNIT_MEASUREMENT_LATENCY_MANUFACTURE}: {self.id_unit_latency_manufacture},
{self.FLAG_LATENCY_MANUFACTURE}: {self.latency_manufacture},
{self.FLAG_DISPLAY_ORDER}: {self.display_order},
{self.FLAG_COST_UNIT_LOCAL_VAT_EXCL}: {self.cost_unit_local_VAT_excl},
{self.FLAG_COST_UNIT_LOCAL_VAT_INCL}: {self.cost_unit_local_VAT_incl},
{self.FLAG_PRICE_UNIT_LOCAL_VAT_EXCL}: {self.price_unit_local_VAT_excl},
{self.FLAG_PRICE_UNIT_LOCAL_VAT_INCL}: {self.price_unit_local_VAT_incl},
{self.FLAG_ACTIVE}: {self.active}
            '''
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_MANUFACTURING_PURCHASE_ORDER_PRODUCT_LINK: self.id_link,
            self.ATTR_ID_MANUFACTURING_PURCHASE_ORDER: self.id_order,
            self.ATTR_ID_PRODUCT_PERMUTATION: self.id_permutation,
            self.FLAG_NAME: self.name_permutation,
            self.ATTR_ID_UNIT_MEASUREMENT_QUANTITY: self.id_unit_quantity,
            self.FLAG_QUANTITY_USED: self.quantity_used,
            self.FLAG_QUANTITY_PRODUCED: self.quantity_produced,
            self.ATTR_ID_UNIT_MEASUREMENT_LATENCY_MANUFACTURE: self.id_unit_latency_manufacture,
            self.FLAG_LATENCY_MANUFACTURE: self.latency_manufacture,
            self.FLAG_DISPLAY_ORDER: self.display_order,
            self.FLAG_COST_UNIT_LOCAL_VAT_EXCL: self.cost_unit_local_VAT_excl,
            self.FLAG_COST_UNIT_LOCAL_VAT_INCL: self.cost_unit_local_VAT_incl,
            self.FLAG_PRICE_UNIT_LOCAL_VAT_EXCL: self.price_unit_local_VAT_excl,
            self.FLAG_PRICE_UNIT_LOCAL_VAT_INCL: self.price_unit_local_VAT_incl,
            self.FLAG_ACTIVE: av.input_bool(self.active, self.FLAG_ACTIVE, f'{self.__class__.__name__}.to_json'),
        }
    def to_json_option(self):
        return {
            'value': self.id_order,
            'text': self.name_permutation,
        }
    @classmethod
    def from_json(cls, json):
        Helper_App.console_log(f'{cls.__name__}.from_json: {json}')
        link = cls()
        link.id_link = json[cls.ATTR_ID_MANUFACTURING_PURCHASE_ORDER_PRODUCT_LINK]
        link.id_order = json[cls.ATTR_ID_MANUFACTURING_PURCHASE_ORDER]
        link.id_permutation = json[cls.ATTR_ID_PRODUCT_PERMUTATION]
        link.name_permutation = json[cls.FLAG_NAME]
        link.id_unit_quantity = json[cls.ATTR_ID_UNIT_MEASUREMENT_QUANTITY]
        link.quantity_used = json[cls.FLAG_QUANTITY_USED]
        link.quantity_produced = json[cls.FLAG_QUANTITY_PRODUCED]
        link.id_unit_latency_manufacture = json[cls.ATTR_ID_UNIT_MEASUREMENT_LATENCY_MANUFACTURE]
        link.latency_manufacture = json[cls.FLAG_LATENCY_MANUFACTURE]
        link.display_order = json[cls.FLAG_DISPLAY_ORDER]
        link.cost_unit_local_VAT_excl = json[cls.FLAG_COST_UNIT_LOCAL_VAT_EXCL]
        link.cost_unit_local_VAT_incl = json[cls.FLAG_COST_UNIT_LOCAL_VAT_INCL]
        link.active = json[cls.FLAG_ACTIVE]
        return link

class Parameters_Manufacturing_Purchase_Order(Get_Many_Parameters_Base):
    a_get_all_order: bool
    a_get_inactive_order: bool
    a_ids_order: str
    a_ids_permutation: str
    a_date_from: Optional[datetime]
    a_date_to: Optional[datetime]
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
    @classmethod
    def get_default(cls):
        return cls(
            a_get_all_order = True,
            a_get_inactive_order = False,
            a_ids_order = '',
            a_ids_permutation = '',
            a_date_from = None,
            a_date_to = None
        )
    @classmethod
    def from_filters_manufacturing_purchase_order(cls, form):
        parameters = cls.get_default()
        parameters.a_get_inactive_order = form.active.data
        parameters.a_date_from = form.date_from.data
        parameters.a_date_to = form.date_to.data
        return parameters

class Manufacturing_Purchase_Order_Temp(db.Model, Store_Base):
    __tablename__: ClassVar[str] = 'Shop_Manufacturing_Purchase_Order_Temp'
    __table_args__ = { 'extend_existing': True }
    id_order: int = db.Column(db.Integer, primary_key=True)
    id_manufacturing: int = db.Column(db.Integer)
    id_currency: int = db.Column(db.Integer)
    active: bool = db.Column(db.Boolean)
    guid: str = db.Column(db.String(36))
    @classmethod
    def from_manufacturing_purchase_order(cls, manufacturing_purchase_order):
        row = cls()
        row.id_order = manufacturing_purchase_order.id_order
        row.id_manufacturing = manufacturing_purchase_order.id_manufacturing
        row.id_currency = manufacturing_purchase_order.id_currency
        row.active = 1 if manufacturing_purchase_order.active else 0
        return row
    def __repr__(self):
        return f'''
id_order: {self.id_order}
id_manufacturing: {self.id_manufacturing}
id_currency: {self.id_currency}
active: {self.active}
guid: {self.guid}
            '''

class Manufacturing_Purchase_Order_Product_Link_Temp(db.Model, Store_Base):
    __tablename__: ClassVar[str] = 'Shop_Manufacturing_Purchase_Order_Product_Link_Temp'
    __table_args__ = { 'extend_existing': True }
    id_link: int = db.Column(db.Integer, primary_key=True)
    id_order: int = db.Column(db.Integer)
    id_permutation: int = db.Column(db.Integer)
    id_unit_quantity: int = db.Column(db.Integer)
    quantity_used: float = db.Column(db.Float)
    quantity_produced: float = db.Column(db.Float)
    id_unit_latency_manufacture = db.Column(db.Integer)
    latency_manufacture: int = db.Column(db.Integer)
    display_order: int = db.Column(db.Integer)
    cost_unit_local_VAT_excl: float = db.Column(db.Float)
    cost_unit_local_VAT_incl: float = db.Column(db.Float)
    price_unit_local_VAT_excl: float = db.Column(db.Float)
    price_unit_local_VAT_incl: float = db.Column(db.Float)
    active: bool = db.Column(db.Boolean)
    guid: str = db.Column(db.String(36))
    @classmethod
    def from_manufacturing_purchase_order_product_link(cls, manufacturing_purchase_order_product_link):
        row = cls()
        row.id_link = manufacturing_purchase_order_product_link.id_link
        row.id_order = manufacturing_purchase_order_product_link.id_order
        row.id_permutation = manufacturing_purchase_order_product_link.id_permutation
        row.id_unit_quantity = manufacturing_purchase_order_product_link.id_unit_quantity
        row.quantity_used = manufacturing_purchase_order_product_link.quantity_used
        row.quantity_produced = manufacturing_purchase_order_product_link.quantity_produced
        row.id_unit_latency_manufacture = manufacturing_purchase_order_product_link.id_unit_latency_manufacture
        row.latency_manufacture = manufacturing_purchase_order_product_link.latency_manufacture
        row.display_order = manufacturing_purchase_order_product_link.display_order
        row.cost_unit_local_VAT_excl = manufacturing_purchase_order_product_link.cost_unit_local_VAT_excl
        row.cost_unit_local_VAT_incl = manufacturing_purchase_order_product_link.cost_unit_local_VAT_incl
        row.price_unit_local_VAT_excl = manufacturing_purchase_order_product_link.price_unit_local_VAT_excl
        row.price_unit_local_VAT_incl = manufacturing_purchase_order_product_link.price_unit_local_VAT_incl
        row.active = 1 if manufacturing_purchase_order_product_link.active else 0
        return row
    def __repr__(self):
        return f'''
id_link: {self.id_link}
id_order: {self.id_order}
id_permutation: {self.id_permutation}
id_unit_quantity: {self.id_unit_quantity}
quantity_used: {self.quantity_used}
quantity_produced: {self.quantity_produced}
{self.ATTR_ID_UNIT_MEASUREMENT_LATENCY_MANUFACTURE}: {self.id_unit_latency_manufacture}
latency_manufacture: {self.latency_manufacture}
display_order: {self.display_order}
cost_unit_local_VAT_excl: {self.cost_unit_local_VAT_excl}
cost_unit_local_VAT_incl: {self.cost_unit_local_VAT_incl}
price_unit_local_VAT_excl: {self.price_unit_local_VAT_excl}
price_unit_local_VAT_incl: {self.price_unit_local_VAT_incl}
active: {self.active}
guid: {self.guid}
            '''