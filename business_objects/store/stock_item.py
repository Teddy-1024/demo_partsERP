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
from business_objects.store.product_price import Product_Price
# from business_objects.discount import Discount
from business_objects.store.store_base import Store_Base
from extensions import db
# external
from dataclasses import dataclass
from typing import ClassVar
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
    FLAG_VALUE_LOCAL_VAT_EXCL_COST: ClassVar[str] = f'{Product_Price.FLAG_VALUE_LOCAL_VAT_EXCL}_cost'
    FLAG_VALUE_LOCAL_VAT_INCL_COST: ClassVar[str] = f'{Product_Price.FLAG_VALUE_LOCAL_VAT_INCL}_cost'

    id_stock = db.Column(db.Integer, primary_key=True)
    id_permutation = db.Column(db.Integer)
    id_product = db.Column(db.Integer)
    id_category = db.Column(db.Integer)
    # name_category = db.Column(db.String(255))
    # name_product = db.Column(db.String(255))
    date_purchased = db.Column(db.DateTime)
    date_received = db.Column(db.DateTime)
    id_location_storage = db.Column(db.Integer)
    id_currency_cost = db.Column(db.Integer)
    cost_local_VAT_incl = db.Column(db.Float)
    cost_local_VAT_excl = db.Column(db.Float)
    is_sealed = db.Column(db.Boolean)
    date_unsealed = db.Column(db.DateTime)
    date_expiration = db.Column(db.DateTime)
    is_consumed = db.Column(db.Boolean)
    date_consumed = db.Column(db.DateTime)
    active = db.Column(db.Boolean)
    """
    can_view = db.Column(db.Boolean)
    can_edit = db.Column(db.Boolean)
    can_admin = db.Column(db.Boolean)
    """

    def __init__(self):
        super().__init__()
        Store_Base.__init__(self)

    def from_DB_stock_item(query_row):
        _m = 'Product.from_DB_stock_item'
        v_arg_type = 'class attribute'
        stock_item = Stock_Item()
        stock_item.id_stock = query_row[0]
        stock_item.id_permutation = query_row[1]
        stock_item.id_product = query_row[2]
        stock_item.id_category = query_row[3]
        # stock_item.name_category = query_row[4]
        # stock_item.name_product = query_row[5]
        stock_item.date_purchased = query_row[4]
        stock_item.date_received = query_row[5]
        stock_item.id_location_storage = query_row[6]
        # stock_item.name_location_storage = query_row[9]
        stock_item.id_currency_cost = query_row[7]
        stock_item.cost_local_VAT_incl = query_row[8]
        stock_item.cost_local_VAT_excl = query_row[9]
        stock_item.is_sealed = av.input_bool(query_row[10], "is_sealed", _m, v_arg_type=v_arg_type)
        stock_item.date_unsealed = query_row[11]
        stock_item.date_expiration = query_row[12]
        stock_item.is_consumed = av.input_bool(query_row[13], "is_consumed", _m, v_arg_type=v_arg_type)
        stock_item.date_consumed = query_row[14]
        stock_item.active = av.input_bool(query_row[15], "active", _m, v_arg_type=v_arg_type)
        """
        stock_item.can_view = av.input_bool(query_row[24], "can_view", _m, v_arg_type=v_arg_type)
        stock_item.can_edit = av.input_bool(query_row[25], "can_edit", _m, v_arg_type=v_arg_type)
        stock_item.can_admin = av.input_bool(query_row[26], "can_admin", _m, v_arg_type=v_arg_type)
        """
        return stock_item
    
    @classmethod
    def from_json(cls, json):
        stock_item = cls()
        stock_item.id_stock = json[cls.ATTR_ID_STOCK_ITEM]
        stock_item.id_permutation = json[cls.ATTR_ID_PRODUCT_PERMUTATION]
        stock_item.id_product = json[cls.ATTR_ID_PRODUCT]
        stock_item.id_category = json[cls.ATTR_ID_PRODUCT_CATEGORY]
        stock_item.date_purchased = json[cls.FLAG_DATE_PURCHASED]
        stock_item.date_received = json[cls.FLAG_DATE_RECEIVED]
        stock_item.id_location_storage = json[cls.ATTR_ID_LOCATION_STORAGE]
        stock_item.id_currency_cost = json[cls.ATTR_ID_CURRENCY_COST]
        stock_item.cost_local_VAT_incl = json[cls.FLAG_VALUE_LOCAL_VAT_INCL_COST]
        stock_item.cost_local_VAT_excl = json[cls.FLAG_VALUE_LOCAL_VAT_EXCL_COST]
        stock_item.is_sealed = json[cls.FLAG_IS_SEALED]
        stock_item.date_unsealed = json[cls.FLAG_DATE_UNSEALED]
        stock_item.date_expiration = json[cls.FLAG_DATE_EXPIRATION]
        stock_item.is_consumed = json[cls.FLAG_IS_CONSUMED]
        stock_item.date_consumed = json[cls.FLAG_DATE_CONSUMED]
        stock_item.active = json[cls.FLAG_ACTIVE]
        """
        stock_item.can_view = json[cls.FLAG_CAN_VIEW]
        stock_item.can_edit = json[cls.FLAG_CAN_EDIT]
        stock_item.can_admin = json[cls.FLAG_CAN_ADMIN]
        """
        return stock_item
    """
    def from_json(json_basket_item, key_id_product, key_id_permutation):
        permutation = Product_Permutation.from_json(json_basket_item, key_id_product, key_id_permutation)
        product = Product.from_permutation(permutation)
        return product
    
    def output_lead_time(self):
        return self.get_permutation_selected().output_lead_time()
    def output_delivery_date(self):
        return self.get_permutation_selected().output_delivery_date()
    def output_price(self, is_included_VAT):
        return self.get_permutation_selected().output_price(is_included_VAT)
    def output_price_VAT_incl(self):
        return self.get_permutation_selected().output_price(True)
    def output_price_VAT_excl(self):
        return self.get_permutation_selected().output_price(False)
    def get_price_local(self, is_included_VAT):
        if is_included_VAT:
            return self.get_price_local_VAT_incl()
        else:
            return self.get_price_local_VAT_excl()
    def get_price_local_VAT_incl(self):
        return self.get_permutation_selected().get_price_local_VAT_incl()
    def get_price_local_VAT_excl(self):
        return self.get_permutation_selected().get_price_local_VAT_excl()
    def get_quantity_min(self):
        return self.get_permutation_selected().quantity_min
    def get_id_permutation(self):
        return self.get_permutation_selected().id_permutation
    def get_image_from_index(self, index_image):
        return self.get_permutation_selected().images[index_image]
    def get_name(self):
        return self.get_permutation_selected().name
    def get_description(self):
        return self.get_permutation_selected().description
    def output_currency(self):
        return self.get_permutation_selected().get_price().symbol_currency
    def add_form_basket_add(self):
        self.form_basket_add = None

    def add_form_basket_edit(self):
        self.form_basket_edit = None
    """
    def __repr__(self):
        return f'''Product
            id_product: {self.id_product}
            id_category: {self.id_category}
            name: {self.name}
            display_order: {self.display_order}
            can_view: {self.can_view}
            can_edit: {self.can_edit}
            can_admin: {self.can_admin}
            has_variations: {self.has_variations}
            permutations: {self.permutations}
            variation trees: {self.variation_trees}
            '''
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_PRODUCT: {self.id_product},
            self.ATTR_ID_PRODUCT_CATEGORY: {self.id_category},
            self.FLAG_NAME: {self.name},
            self.FLAG_DISPLAY_ORDER: {self.display_order},
            self.FLAG_CAN_VIEW: {self.can_view},
            self.FLAG_CAN_EDIT: {self.can_edit},
            self.FLAG_CAN_ADMIN: {self.can_admin},
            self.FLAG_HAS_VARIATIONS: {self.has_variations},
            self.FLAG_PRODUCT_PERMUTATION: {self.permutations},
            self.FLAG_PRODUCT_VARIATION_TREES: {self.variation_trees},
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
    """
    def to_permutation_row_list(self):
        list_rows = []
        for permutation in self.permutations:
            list_rows.append(permutation.to_row_permutation())
        return list_rows
    def to_json_option(self):
        return {
            'value': self.id_stock_item,
            'text': self.id_stock_item
        }
    """

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
    a_get_first_plant_storage_only: bool
    a_ids_plant_storage: str
    a_get_all_location_storage: bool
    a_get_inactive_location_storage: bool
    a_ids_location_storage: str
    a_date_received_to: datetime
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
            a_get_all_product_permutation = True,
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