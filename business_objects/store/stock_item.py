"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Stock Item Business Object
"""

# IMPORTS
# internal
import lib.argument_validation as av
from lib import data_types
from forms.store.stock_item import Filters_Stock_Item
from business_objects.db_base import Get_Many_Parameters_Base
from business_objects.currency import Currency
# from business_objects.discount import Discount
from business_objects.store.product_variation_tree import Product_Variation_Tree
from business_objects.store.storage_location import Storage_Location
from business_objects.store.store_base import Store_Base
from extensions import db
from helpers.helper_app import Helper_App
# external
from dataclasses import dataclass
from typing import ClassVar, Optional
from datetime import datetime


class Stock_Item(db.Model, Store_Base):
    ATTR_ID_CURRENCY_COST: ClassVar[str] = f'{Store_Base.ATTR_ID_CURRENCY}_cost'
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Store_Base.ATTR_ID_CURRENCY
    NAME_ATTR_OPTION_TEXT = Store_Base.FLAG_NAME
    FLAG_DATE_CONSUMED: ClassVar[str] = 'date_consumed'
    FLAG_DATE_EXPIRATION: ClassVar[str] = 'date_expiration'
    FLAG_DATE_PURCHASED: ClassVar[str] = 'date_purchased'
    FLAG_DATE_RECEIVED: ClassVar[str] = 'date_received'
    FLAG_DATE_UNSEALED: ClassVar[str] = 'date_unsealed'
    FLAG_IS_CONSUMED: ClassVar[str] = 'is_consumed'
    FLAG_IS_SEALED: ClassVar[str] = 'is_sealed'

    id_stock = db.Column(db.Integer, primary_key=True)
    id_permutation = db.Column(db.Integer)
    id_product = db.Column(db.Integer)
    id_category = db.Column(db.Integer)
    id_location_storage = db.Column(db.Integer)
    id_plant = db.Column(db.Integer)
    id_region = db.Column(db.Integer)
    id_currency_cost = db.Column(db.Integer)
    cost_local_VAT_excl = db.Column(db.Float)
    cost_local_VAT_incl = db.Column(db.Float)
    date_purchased = db.Column(db.DateTime)
    date_received = db.Column(db.DateTime)
    is_sealed = db.Column(db.Boolean)
    date_unsealed = db.Column(db.DateTime)
    date_expiration = db.Column(db.DateTime)
    is_consumed = db.Column(db.Boolean)
    date_consumed = db.Column(db.DateTime)
    active = db.Column(db.Boolean)

    def __init__(self):
        super().__init__()
        Store_Base.__init__(self)
        self.currency_cost = None
        self.storage_location = None
        self.variation_tree = None
        self.has_variations = False

    def from_DB_stock_item(query_row):
        _m = 'Product.from_DB_stock_item'
        v_arg_type = 'class attribute'
        stock_item = Stock_Item()
        stock_item.id_stock = query_row[0]
        stock_item.id_permutation = query_row[1]
        stock_item.id_product = query_row[2]
        stock_item.id_category = query_row[3]
        stock_item.id_location_storage = query_row[4]
        stock_item.storage_location = Storage_Location.from_DB_stock_item(query_row)
        stock_item.id_currency_cost = query_row[12]
        stock_item.currency_cost = Currency.from_DB_stock_item(query_row)
        stock_item.cost_local_VAT_excl = query_row[15]
        stock_item.cost_local_VAT_incl = query_row[16]
        stock_item.date_purchased = query_row[17]
        stock_item.date_received = query_row[18]
        stock_item.is_sealed = av.input_bool(query_row[19], "is_sealed", _m, v_arg_type=v_arg_type)
        stock_item.date_unsealed = query_row[20]
        stock_item.date_expiration = query_row[21]
        stock_item.is_consumed = av.input_bool(query_row[22], "is_consumed", _m, v_arg_type=v_arg_type)
        stock_item.date_consumed = query_row[23]
        stock_item.active = av.input_bool(query_row[24], "active", _m, v_arg_type=v_arg_type)
        return stock_item
    
    @classmethod
    def from_json(cls, json):
        stock_item = cls()
        stock_item.id_stock = json[cls.ATTR_ID_STOCK_ITEM]
        stock_item.id_permutation = json.get(cls.ATTR_ID_PRODUCT_PERMUTATION, 0)
        stock_item.id_product = json[cls.ATTR_ID_PRODUCT]
        stock_item.id_category = json[cls.ATTR_ID_PRODUCT_CATEGORY]
        Helper_App.console_log(f'json: {json}\nhalf stock item: {stock_item}')
        stock_item.variation_tree = Product_Variation_Tree.from_json_str(json[cls.FLAG_PRODUCT_VARIATIONS])
        stock_item.date_purchased = json[cls.FLAG_DATE_PURCHASED]
        stock_item.date_received = json[cls.FLAG_DATE_RECEIVED]
        stock_item.id_location_storage = json[cls.ATTR_ID_STORAGE_LOCATION]
        stock_item.id_currency_cost = json[cls.ATTR_ID_CURRENCY_COST]
        stock_item.cost_local_VAT_excl = json[cls.FLAG_COST_UNIT_LOCAL_VAT_EXCL]
        stock_item.cost_local_VAT_incl = json[cls.FLAG_COST_UNIT_LOCAL_VAT_INCL]
        stock_item.is_sealed = json[cls.FLAG_IS_SEALED]
        stock_item.date_unsealed = json[cls.FLAG_DATE_UNSEALED]
        stock_item.date_expiration = json[cls.FLAG_DATE_EXPIRATION]
        stock_item.is_consumed = json[cls.FLAG_IS_CONSUMED]
        stock_item.date_consumed = json[cls.FLAG_DATE_CONSUMED]
        stock_item.active = json[cls.FLAG_ACTIVE]
        return stock_item
    def __repr__(self):
        return f'''Stock Item
            id_stock: {self.id_stock}
            id_permutation: {self.id_permutation}
            id_product: {self.id_product}
            id_category: {self.id_category}
            variations: {self.variation_tree.to_preview_str() if self.variation_tree is not None else 'None'}
            storage_location: {self.storage_location}
            currency: {self.currency_cost}
            cost_local_VAT_excl: {self.cost_local_VAT_excl}
            cost_local_VAT_incl: {self.cost_local_VAT_incl}
            date_purchased: {self.date_purchased}
            date_received: {self.date_received}
            is_sealed: {self.is_sealed}
            date_unsealed: {self.date_unsealed}
            date_expiration: {self.date_expiration}
            is_consumed: {self.is_consumed}
            date_consumed: {self.date_consumed}
            active: {self.active}
            '''
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_STOCK_ITEM: self.id_stock,
            self.ATTR_ID_PRODUCT_PERMUTATION: self.id_permutation,
            self.ATTR_ID_PRODUCT: self.id_product,
            self.ATTR_ID_PRODUCT_CATEGORY: self.id_category,
            self.FLAG_STORAGE_LOCATION: self.storage_location.to_json(),
            self.FLAG_CURRENCY_COST: self.currency_cost.to_json(),
            self.FLAG_COST_UNIT_LOCAL_VAT_EXCL: self.cost_local_VAT_excl,
            self.FLAG_COST_UNIT_LOCAL_VAT_INCL: self.cost_local_VAT_incl,
        }
    def has_permutations(self):
        return len(self.permutations) > 0
    def is_available(self):
        if len(self.permutations) == 0:
            return False
        for permutation in self.permutations:
            if permutation.is_available():
                return True
        return False

class Parameters_Stock_Item(Get_Many_Parameters_Base):
    a_get_all_product_permutation: bool
    a_get_inactive_product_permutation: bool
    a_ids_product_permutation: str
    a_get_all_stock_item: bool
    a_get_inactive_stock_item: bool
    a_ids_stock_item: str
    a_get_all_region_storage: bool
    a_get_inactive_region_storage: bool
    a_ids_region_storage: str
    a_get_all_plant_storage: bool
    a_get_inactive_plant_storage: bool
    a_ids_plant_storage: str
    a_get_all_location_storage: bool
    a_get_inactive_location_storage: bool
    a_ids_location_storage: str
    a_date_received_to: Optional[datetime] = None
    a_get_sealed_stock_item_only: bool
    a_get_unsealed_stock_item_only: bool
    a_get_expired_stock_item_only: bool
    a_get_nonexpired_stock_item_only: bool
    a_get_consumed_stock_item_only: bool
    a_get_nonconsumed_stock_item_only: bool

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
    
    @classmethod
    def get_default(cls):
        return cls(
            # a_id_user = id_user,
            a_get_all_product_permutation = False,
            a_get_inactive_product_permutation = False,
            a_ids_product_permutation = '',
            a_get_all_stock_item = True,
            a_get_inactive_stock_item = False,
            a_ids_stock_item = '',
            a_get_all_region_storage = True,
            a_get_inactive_region_storage = False,
            a_ids_region_storage = '',
            a_get_all_plant_storage = True,
            a_get_inactive_plant_storage = False,
            a_ids_plant_storage = '',
            a_get_all_location_storage = True,
            a_get_inactive_location_storage = False,
            a_ids_location_storage = '',
            a_date_received_to = None,
            a_get_sealed_stock_item_only = False,
            a_get_unsealed_stock_item_only = False,
            a_get_expired_stock_item_only = False,
            a_get_nonexpired_stock_item_only = False,
            a_get_consumed_stock_item_only = False,
            a_get_nonconsumed_stock_item_only = False
        )
    
    @classmethod
    def from_form_stock_item(cls, form):
        return cls.get_default()


class Stock_Item_Temp(db.Model, Store_Base):
    __tablename__: ClassVar[str] = 'Shop_Stock_Item_Temp'
    __table_args__ = { 'extend_existing': True }
    id_stock: int = db.Column(db.Integer, primary_key=True)
    # id_category: int = db.Column(db.Integer)
    id_product: int = db.Column(db.Integer)
    # has_variations: bool = db.Column(db.Boolean)
    id_permutation: int = db.Column(db.Integer)
    id_pairs_variations: str = db.Column(db.String(4000))
    date_purchased: datetime = db.Column(db.DateTime)
    date_received: datetime = db.Column(db.DateTime, nullable=True)
    id_location_storage: int = db.Column(db.Integer)
    id_currency_cost: int = db.Column(db.Integer)
    cost_local_VAT_excl: float = db.Column(db.Float)
    cost_local_VAT_incl: float = db.Column(db.Float)
    is_sealed: bool = db.Column(db.Boolean)
    date_unsealed: datetime = db.Column(db.DateTime, nullable=True)
    date_expiration: datetime = db.Column(db.DateTime, nullable=True)
    is_consumed: bool = db.Column(db.Boolean)
    date_consumed: datetime = db.Column(db.DateTime, nullable=True)
    active: bool = db.Column(db.Boolean)
    guid: str = db.Column(db.String(36))

    @classmethod
    def from_stock_item(cls, stock_item):
        row = cls()
        row.id_stock = stock_item.id_stock
        # row.id_category = stock_item.id_category
        row.id_product = stock_item.id_product
        row.id_permutation = stock_item.id_permutation
        # row.has_variations = stock_item.has_variations
        row.id_pairs_variations = stock_item.variation_tree.to_json_str() if stock_item.variation_tree is not None else ''
        row.date_purchased = stock_item.date_purchased
        row.date_received = stock_item.date_received if stock_item.date_received else None
        row.id_location_storage = stock_item.id_location_storage
        row.id_currency_cost = stock_item.id_currency_cost
        row.cost_local_VAT_excl = stock_item.cost_local_VAT_excl
        row.cost_local_VAT_incl = stock_item.cost_local_VAT_incl
        row.is_sealed = 1 if stock_item.is_sealed else 0
        row.date_unsealed = stock_item.date_unsealed if stock_item.date_unsealed else None
        row.date_expiration = stock_item.date_expiration if stock_item.date_expiration else None
        row.is_consumed = 1 if stock_item.is_consumed else 0
        row.date_consumed = stock_item.date_consumed if stock_item.date_consumed else None
        row.active = 1 if stock_item.active else 0
        return row
    def __repr__(self):
        return f'''
id_stock: {self.id_stock}
id_product: {self.id_product}
id_permutation: {self.id_permutation}
id_pairs_variations: {self.id_pairs_variations}
date_purchased: {self.date_purchased}
date_received: {self.date_received}
id_location_storage: {self.id_location_storage}
id_currency_cost: {self.id_currency_cost}
cost_local_VAT_excl: {self.cost_local_VAT_excl}
cost_local_VAT_incl: {self.cost_local_VAT_incl}
is_sealed: {self.is_sealed}
date_unsealed: {self.date_unsealed}
date_expiration: {self.date_expiration}
is_consumed: {self.is_consumed}
date_consumed: {self.date_consumed}
active: {self.active}
guid: {self.guid}
            '''