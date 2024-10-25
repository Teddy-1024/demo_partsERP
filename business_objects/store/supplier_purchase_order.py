"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Supplier_Purchase_Order Business Object

Description:
Business object for supplier_purchase_order
"""

# internal
import lib.argument_validation as av
from business_objects.currency import Currency
from business_objects.db_base import Get_Many_Parameters_Base
from business_objects.store.store_base import Store_Base
from business_objects.store.supplier import Supplier
from extensions import db
# external
from pydantic import BaseModel
from typing import ClassVar, Optional
from datetime import datetime

class Supplier_Purchase_Order(db.Model, Store_Base):
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Store_Base.ATTR_ID_SUPPLIER_PURCHASE_ORDER
    NAME_ATTR_OPTION_TEXT: ClassVar[str] = Store_Base.FLAG_NAME
    __tablename__ = 'Shop_Supplier_Purchase_Order'
    id_order = db.Column(db.Integer, primary_key=True)
    id_supplier = db.Column(db.Integer)
    id_currency = db.Column(db.Integer)
    cost_total_local_VAT_excl = db.Column(db.Float)
    cost_total_local_VAT_incl = db.Column(db.Float)
    active = db.Column(db.Boolean)
    created_on = db.Column(db.DateTime)
    created_by = db.Column(db.Integer)
    name = db.Column(db.String(255))
    # items: list = None
    def __init__(self):
        super().__init__()
        Store_Base.__init__(self)
        self.currency = None
        self.items = []
        self.supplier = None
    @classmethod
    def from_DB_supplier_purchase_order(cls, query_row):
        supplier_purchase_order = cls()
        supplier_purchase_order.id_order = query_row[0]
        supplier_purchase_order.id_supplier = query_row[1]
        supplier_purchase_order.supplier = Supplier.from_DB_supplier_purchase_order(query_row)
        supplier_purchase_order.id_currency = query_row[3]
        supplier_purchase_order.currency = Currency.from_DB_supplier_purchase_order(query_row)
        supplier_purchase_order.cost_total_local_VAT_excl = query_row[6]
        supplier_purchase_order.cost_total_local_VAT_incl = query_row[7]
        supplier_purchase_order.active = av.input_bool(query_row[8], 'active', f'{cls.__name__}.from_DB_supplier_purchase_order')
        supplier_purchase_order.created_on = query_row[9]
        supplier_purchase_order.name = query_row[10]
        return supplier_purchase_order

    def __repr__(self):
        return f'''
{self.ATTR_ID_SUPPLIER_PURCHASE_ORDER}: {self.id_order},
{self.ATTR_ID_SUPPLIER}: {self.id_supplier},
{self.FLAG_SUPPLIER}: {self.supplier},
{self.ATTR_ID_CURRENCY}: {self.id_currency},
{self.FLAG_CURRENCY}: {self.currency},
{self.FLAG_COST_TOTAL_LOCAL_VAT_EXCL}: {self.cost_total_local_VAT_excl},
{self.FLAG_COST_TOTAL_LOCAL_VAT_INCL}: {self.cost_total_local_VAT_incl},
{self.FLAG_ACTIVE}: {self.active},
{self.FLAG_CREATED_ON}: {self.created_on},
{self.FLAG_NAME}: {self.name}
            '''
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_SUPPLIER_PURCHASE_ORDER: self.id_order,
            self.ATTR_ID_SUPPLIER: self.id_supplier,
            self.FLAG_SUPPLIER: self.supplier.to_json(),
            self.ATTR_ID_CURRENCY: self.id_currency,
            self.FLAG_CURRENCY: self.currency.to_json(),
            self.FLAG_COST_TOTAL_LOCAL_VAT_EXCL: self.cost_total_local_VAT_excl,
            self.FLAG_COST_TOTAL_LOCAL_VAT_INCL: self.cost_total_local_VAT_incl,
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
        print(f'{cls.__name__}.from_json: {json}')
        supplier_purchase_order = cls()
        supplier_purchase_order.id_order = json[cls.ATTR_ID_SUPPLIER_PURCHASE_ORDER]
        supplier_purchase_order.id_supplier = json[cls.ATTR_ID_SUPPLIER]
        supplier_purchase_order.id_currency = json[cls.ATTR_ID_CURRENCY]
        supplier_purchase_order.cost_total_local_VAT_excl = json[cls.FLAG_COST_TOTAL_LOCAL_VAT_EXCL]
        supplier_purchase_order.cost_total_local_VAT_incl = json[cls.FLAG_COST_TOTAL_LOCAL_VAT_INCL]
        supplier_purchase_order.active = json[cls.FLAG_ACTIVE]
        supplier_purchase_order.created_on = json.get(cls.FLAG_CREATED_ON, None)
        supplier_purchase_order.created_by = json.get(cls.FLAG_CREATED_BY, None)
        supplier_purchase_order.name = json.get(cls.FLAG_NAME, None)
        return supplier_purchase_order

class Supplier_Purchase_Order_Product_Link(db.Model, Store_Base):
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Store_Base.ATTR_ID_SUPPLIER_PURCHASE_ORDER_PRODUCT_LINK
    NAME_ATTR_OPTION_TEXT: ClassVar[str] = Store_Base.FLAG_NAME
    __tablename__ = 'Shop_Supplier_Purchase_Order_Product_Link'
    id_link = db.Column(db.Integer, primary_key=True)
    id_order = db.Column(db.Integer)
    id_category = db.Column(db.Integer)
    id_product = db.Column(db.Integer)
    id_permutation = db.Column(db.Integer)
    id_unit_quantity = db.Column(db.Integer)
    name_permutation = db.Column(db.String(255))
    quantity_ordered = db.Column(db.Float)
    quantity_received = db.Column(db.Float)
    latency_delivery_days = db.Column(db.Integer)
    display_order = db.Column(db.Integer)
    cost_total_local_VAT_excl = db.Column(db.Float)
    cost_total_local_VAT_incl = db.Column(db.Float)
    cost_unit_local_VAT_excl = db.Column(db.Float)
    cost_unit_local_VAT_incl = db.Column(db.Float)
    active = db.Column(db.Boolean)
    created_on = db.Column(db.DateTime)
    created_by = db.Column(db.Integer)
    def __init__(self):
        super().__init__()
        Store_Base.__init__(self)
        # self.unit_quantity = None
    @classmethod
    def from_DB_supplier_purchase_order(cls, query_row):
        link = cls()
        link.id_link = query_row[0]
        link.id_order = query_row[1]
        link.id_category = query_row[2]
        link.id_product = query_row[3]
        link.id_permutation = query_row[4]
        link.name_permutation = query_row[5]
        link.id_unit_quantity = query_row[6]
        link.quantity_ordered = query_row[7]
        link.quantity_received = query_row[8]
        link.latency_delivery_days = query_row[9]
        link.display_order = query_row[10]
        link.cost_total_local_VAT_excl = query_row[11]
        link.cost_total_local_VAT_incl = query_row[12]
        link.cost_unit_local_VAT_excl = query_row[13]
        link.cost_unit_local_VAT_incl = query_row[14]
        link.active = query_row[15]
        return link
    def __repr__(self):
        return f'''
{self.ATTR_ID_SUPPLIER_PURCHASE_ORDER_PRODUCT_LINK}: {self.id_link},
{self.ATTR_ID_SUPPLIER_PURCHASE_ORDER}: {self.id_order},
{self.ATTR_ID_PRODUCT_CATEGORY}: {self.id_category},
{self.ATTR_ID_PRODUCT}: {self.id_product},
{self.ATTR_ID_PRODUCT_PERMUTATION}: {self.id_permutation},
{self.FLAG_NAME}: {self.name_permutation},
{self.ATTR_ID_UNIT_MEASUREMENT_QUANTITY}: {self.id_unit_quantity},
{self.FLAG_QUANTITY_ORDERED}: {self.quantity_ordered},
{self.FLAG_QUANTITY_RECEIVED}: {self.quantity_received},
{self.FLAG_LATENCY_DELIVERY_DAYS}: {self.latency_delivery_days},
{self.FLAG_DISPLAY_ORDER}: {self.display_order},
{self.FLAG_COST_TOTAL_LOCAL_VAT_EXCL}: {self.cost_total_local_VAT_excl},
{self.FLAG_COST_TOTAL_LOCAL_VAT_INCL}: {self.cost_total_local_VAT_incl},
{self.FLAG_COST_UNIT_LOCAL_VAT_EXCL}: {self.cost_unit_local_VAT_excl},
{self.FLAG_COST_UNIT_LOCAL_VAT_INCL}: {self.cost_unit_local_VAT_incl},
{self.FLAG_ACTIVE}: {self.active}
            '''
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_SUPPLIER_PURCHASE_ORDER_PRODUCT_LINK: self.id_link,
            self.ATTR_ID_SUPPLIER_PURCHASE_ORDER: self.id_order,
            self.ATTR_ID_PRODUCT_CATEGORY: self.id_category,
            self.ATTR_ID_PRODUCT: self.id_product,
            self.ATTR_ID_PRODUCT_PERMUTATION: self.id_permutation,
            self.FLAG_NAME: self.name_permutation,
            self.ATTR_ID_UNIT_MEASUREMENT_QUANTITY: self.id_unit_quantity,
            self.FLAG_QUANTITY_ORDERED: self.quantity_ordered,
            self.FLAG_QUANTITY_RECEIVED: self.quantity_received,
            self.FLAG_LATENCY_DELIVERY_DAYS: self.latency_delivery_days,
            self.FLAG_DISPLAY_ORDER: self.display_order,
            self.FLAG_COST_TOTAL_LOCAL_VAT_EXCL: self.cost_total_local_VAT_excl,
            self.FLAG_COST_TOTAL_LOCAL_VAT_INCL: self.cost_total_local_VAT_incl,
            self.FLAG_COST_UNIT_LOCAL_VAT_EXCL: self.cost_unit_local_VAT_excl,
            self.FLAG_COST_UNIT_LOCAL_VAT_INCL: self.cost_unit_local_VAT_incl,
            self.FLAG_ACTIVE: av.input_bool(self.active, self.FLAG_ACTIVE, f'{self.__class__.__name__}.to_json'),
        }
    def to_json_option(self):
        return {
            'value': self.id_order,
            'text': self.name_permutation,
        }
    @classmethod
    def from_json(cls, json):
        print(f'{cls.__name__}.from_json: {json}')
        link = cls()
        link.id_link = json[cls.ATTR_ID_SUPPLIER_PURCHASE_ORDER_PRODUCT_LINK]
        link.id_order = json[cls.ATTR_ID_SUPPLIER_PURCHASE_ORDER]
        link.id_category = json.get(cls.ATTR_ID_PRODUCT_CATEGORY, None)
        link.id_product = json.get(cls.ATTR_ID_PRODUCT, None)
        link.id_permutation = json[cls.ATTR_ID_PRODUCT_PERMUTATION]
        link.name_permutation = json.get(cls.FLAG_NAME, None)
        link.id_unit_quantity = json[cls.ATTR_ID_UNIT_MEASUREMENT_QUANTITY]
        link.quantity_ordered = json[cls.FLAG_QUANTITY_ORDERED]
        link.quantity_received = json[cls.FLAG_QUANTITY_RECEIVED]
        link.latency_delivery_days = json[cls.FLAG_LATENCY_DELIVERY_DAYS]
        link.display_order = json[cls.FLAG_DISPLAY_ORDER]
        link.cost_total_local_VAT_excl = json[cls.FLAG_COST_TOTAL_LOCAL_VAT_EXCL]
        link.cost_total_local_VAT_incl = json[cls.FLAG_COST_TOTAL_LOCAL_VAT_INCL]
        link.cost_unit_local_VAT_excl = json.get(cls.FLAG_COST_UNIT_LOCAL_VAT_EXCL, None)
        link.cost_unit_local_VAT_incl = json(cls.FLAG_COST_UNIT_LOCAL_VAT_INCL, None)
        link.active = json[cls.FLAG_ACTIVE]
        return link

class Parameters_Supplier_Purchase_Order(Get_Many_Parameters_Base):
    a_get_all_supplier: bool
    a_get_inactive_supplier: bool
    a_ids_supplier: str
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
            a_get_all_supplier = True,
            a_get_inactive_supplier = False,
            a_ids_supplier = '',
            a_get_all_order = True,
            a_get_inactive_order = False,
            a_ids_order = '',
            a_ids_permutation = '',
            a_date_from = None,
            a_date_to = None
        )
    @classmethod
    def from_filters_supplier_purchase_order(cls, form):
        parameters = cls.get_default()
        parameters.a_get_inactive_order = form.active.data
        parameters.a_date_from = None if form.date_from.data == '' else form.date_from.data
        parameters.a_date_to = None if form.date_to.data == '' else form.date_to.data
        return parameters

class Supplier_Purchase_Order_Temp(db.Model, Store_Base):
    __tablename__: ClassVar[str] = 'Shop_Supplier_Purchase_Order_Temp'
    __table_args__ = { 'extend_existing': True }
    id_order: int = db.Column(db.Integer, primary_key=True)
    id_supplier_ordered: int = db.Column(db.Integer)
    id_currency_cost: int = db.Column(db.Integer)
    active: bool = db.Column(db.Boolean)
    guid: str = db.Column(db.String(36))
    @classmethod
    def from_supplier_purchase_order(cls, supplier_purchase_order):
        row = cls()
        row.id_order = supplier_purchase_order.id_order
        row.id_supplier_ordered = supplier_purchase_order.id_supplier
        row.id_currency_cost = supplier_purchase_order.id_currency
        row.active = 1 if supplier_purchase_order.active else 0
        return row
    def __repr__(self):
        return f'''
id_order: {self.id_order}
id_supplier_ordered: {self.id_supplier_ordered}
id_currency_cost: {self.id_currency_cost}
active: {self.active}
guid: {self.guid}
            '''

class Supplier_Purchase_Order_Product_Link_Temp(db.Model, Store_Base):
    __tablename__: ClassVar[str] = 'Shop_Supplier_Purchase_Order_Product_Link_Temp'
    __table_args__ = { 'extend_existing': True }
    id_link = db.Column(db.Integer, primary_key=True)
    id_order = db.Column(db.Integer)
    id_product = db.Column(db.Integer)
    id_permutation = db.Column(db.Integer)
    id_unit_quantity = db.Column(db.Integer)
    quantity_ordered = db.Column(db.Float)
    quantity_received = db.Column(db.Float)
    latency_delivery_days = db.Column(db.Integer)
    display_order = db.Column(db.Integer)
    cost_total_local_VAT_excl = db.Column(db.Float)
    cost_total_local_VAT_incl = db.Column(db.Float)
    active = db.Column(db.Boolean)
    guid = db.Column(db.String(36))
    @classmethod
    def from_supplier_purchase_order_product_link(cls, supplier_purchase_order_product_link):
        row = cls()
        row.id_link = supplier_purchase_order_product_link.id_link
        row.id_order = supplier_purchase_order_product_link.id_order
        row.id_product = supplier_purchase_order_product_link.id_product
        row.id_permutation = supplier_purchase_order_product_link.id_permutation
        row.id_unit_quantity = supplier_purchase_order_product_link.id_unit_quantity
        row.quantity_ordered = supplier_purchase_order_product_link.quantity_ordered
        row.quantity_received = supplier_purchase_order_product_link.quantity_received
        row.latency_delivery_days = supplier_purchase_order_product_link.latency_delivery_days
        row.display_order = supplier_purchase_order_product_link.display_order
        row.cost_total_local_VAT_excl = supplier_purchase_order_product_link.cost_total_local_VAT_excl
        row.cost_total_local_VAT_incl = supplier_purchase_order_product_link.cost_total_local_VAT_incl
        row.active = 1 if supplier_purchase_order_product_link.active else 0
        return row
    def __repr__(self):
        return f'''
id_link: {self.id_link}
id_order: {self.id_order}
id_product: {self.id_product}
id_permutation: {self.id_permutation}
id_unit_quantity: {self.id_unit_quantity}
quantity_ordered: {self.quantity_ordered}
quantity_received: {self.quantity_received}
latency_delivery_days: {self.latency_delivery_days}
display_order: {self.display_order}
cost_total_local_VAT_excl: {self.cost_total_local_VAT_excl}
cost_total_local_VAT_incl: {self.cost_total_local_VAT_incl}
active: {self.active}
guid: {self.guid}
            '''