"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Product Permutation Business Object

Description:
Business object for product permutation
"""

# internal
import lib.argument_validation as av
from lib import data_types
from forms.forms import Form_Basket_Add, Form_Basket_Edit
from business_objects.currency import Currency
from business_objects.store.delivery_option import Delivery_Option
from business_objects.store.discount import Discount
from business_objects.store.image import Image
from business_objects.store.product_price import Product_Price
from business_objects.store.stock_item import Stock_Item
from business_objects.store.store_base import Store_Base
from business_objects.store.product_variation import Product_Variation
from business_objects.store.product_variation_tree import Product_Variation_Tree
from business_objects.unit_measurement import Unit_Measurement
from extensions import db
from helpers.helper_app import Helper_App
# external
from datetime import datetime, timedelta
import locale
from dataclasses import dataclass
from typing import ClassVar

class Product_Permutation(db.Model, Store_Base):
    NAME_ATTR_OPTION_VALUE = Store_Base.ATTR_ID_PRODUCT_PERMUTATION
    NAME_ATTR_OPTION_TEXT = Store_Base.FLAG_NAME
    FLAG_CURRENCY_COST = f'{Currency.ATTR_ID_CURRENCY}_cost'
    FLAG_CODE_CURRENCY_COST = f'{Currency.FLAG_CODE}_cost'
    FLAG_SYMBOL_CURRENCY_COST = f'{Currency.FLAG_SYMBOL}_cost'
    FLAG_PROFIT_LOCAL_MIN = 'profit_local_min'
    FLAG_HAS_VARIATIONS = 'has_variations'
    FLAG_LATENCY_MANUFACTURE = 'latency_manufacture'
    FLAG_UNIT_MEASUREMENT_QUANTITY = f'{Unit_Measurement.ATTR_ID_UNIT_MEASUREMENT}_quantity'
    FLAG_SYMBOL_UNIT_MEASUREMENT_QUANTITY = f'{Unit_Measurement.FLAG_SYMBOL}_quantity'
    FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX_UNIT_MEASUREMENT_QUANTITY = f'{Unit_Measurement.FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX}_quantity'
    FLAG_NAME_SINGULAR_UNIT_MEASUREMENT_QUANTITY = f'{Unit_Measurement.FLAG_NAME_SINGULAR}_quantity'
    FLAG_NAME_PLURAL_UNIT_MEASUREMENT_QUANTITY = f'{Unit_Measurement.FLAG_NAME_PLURAL}_quantity'
    FLAG_COUNT_UNIT_MEASUREMENT_PER_QUANTITY_STEP = 'count_unit_measurement_per_quantity_step'
    FLAG_QUANTITY_STOCK = 'quantity_stock'
    FLAG_IS_SUBSCRIPTION = 'is_subscription'
    FLAG_UNIT_MEASUREMENT_INTERVAL_RECURRENCE = f'{Unit_Measurement.ATTR_ID_UNIT_MEASUREMENT}_interval_recurrence'
    FLAG_SYMBOL_UNIT_MEASUREMENT_INTERVAL_RECURRENCE = f'{Unit_Measurement.FLAG_SYMBOL}_unit_measurement_interval_recurrence'
    FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX_UNIT_MEASUREMENT_INTERVAL_RECURRENCE = f'{Unit_Measurement.FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX}_unit_measurement_interval_recurrence'
    FLAG_NAME_SINGULAR_UNIT_MEASUREMENT_INTERVAL_RECURRENCE = f'{Unit_Measurement.FLAG_NAME_SINGULAR}_unit_measurement_interval_recurrence'
    FLAG_NAME_PLURAL_UNIT_MEASUREMENT_INTERVAL_RECURRENCE = f'{Unit_Measurement.FLAG_NAME_PLURAL}_unit_measurement_interval_recurrence'
    FLAG_COUNT_UNIT_MEASUREMENT_INTERVAL_RECURRENCE = 'count_interval_recurrence'
    FLAG_ID_STRIPE_PRODUCT = 'id_stripe_product'
    FLAG_DOES_EXPIRE_FASTER_ONCE_UNSEALED = 'does_expire_faster_once_unsealed'
    FLAG_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED = f'{Unit_Measurement.ATTR_ID_UNIT_MEASUREMENT}_interval_expiration_unsealed'
    FLAG_SYMBOL_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED = f'{Unit_Measurement.FLAG_SYMBOL}_interval_expiration_unsealed'
    FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED = f'{Unit_Measurement.FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX}_interval_expiration_unsealed'
    FLAG_NAME_SINGULAR_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED = f'{Unit_Measurement.FLAG_NAME_SINGULAR}_interval_expiration_unsealed'
    FLAG_NAME_PLURAL_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED = f'{Unit_Measurement.FLAG_NAME_PLURAL}_interval_expiration_unsealed'
    FLAG_COUNT_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED = 'count_interval_expiration_unsealed'

    id_permutation = db.Column(db.Integer, primary_key=True)
    id_product = db.Column(db.Integer)
    id_category = db.Column(db.Integer)
    # name = db.Column(db.String(255))
    description = db.Column(db.String(4000))
    # price_GBP_full = db.Column(db.Float)
    # price_GBP_min = db.Column(db.Float)
    """
    id_currency_cost = db.Column(db.Integer)
    code_currency_cost = db.Column(db.String(3))
    symbol_currency_cost = db.Column(db.String(3))
    """
    # currency_cost: Currency
    cost_local_VAT_excl = db.Column(db.Float)
    cost_local_VAT_incl = db.Column(db.Float)
    profit_local_min = db.Column(db.Float)
    has_variations = db.Column(db.Boolean)
    latency_manufacture = db.Column(db.Integer)
    id_unit_measurement_quantity = db.Column(db.Integer)
    symbol_unit_measurement_quantity = db.Column(db.String(50))
    symbol_is_suffix_not_prefix_unit_measurement_quantity = db.Column(db.Boolean)
    name_singular_unit_measurement_quantity = db.Column(db.String(255))
    name_plural_unit_measurement_quantity = db.Column(db.String(256))
    count_unit_measurement_per_quantity_step = db.Column(db.Integer)
    quantity_min = db.Column(db.Float)
    quantity_max = db.Column(db.Float)
    quantity_stock = db.Column(db.Float)
    is_subscription = db.Column(db.Boolean)
    id_unit_measurement_interval_recurrence = db.Column(db.Integer)
    symbol_unit_measurement_interval_recurrence = db.Column(db.String(50))
    symbol_is_suffix_not_prefix_unit_measurement_interval_recurrence = db.Column(db.Boolean)
    name_singular_unit_measurement_interval_recurrence = db.Column(db.String(255))
    name_plural_unit_measurement_interval_recurrence = db.Column(db.String(256))
    count_interval_recurrence = db.Column(db.Integer)
    id_stripe_product = db.Column(db.String(100))
    does_expire_faster_once_unsealed = db.Column(db.Boolean)
    id_unit_measurement_interval_expiration_unsealed = db.Column(db.Integer)
    symbol_unit_measurement_interval_expiration_unsealed = db.Column(db.String(50))
    symbol_is_suffix_not_prefix_unit_measurement_interval_expiration_unsealed = db.Column(db.Boolean)
    name_singular_unit_measurement_interval_expiration_unsealed = db.Column(db.String(255))
    name_plural_unit_measurement_interval_expiration_unsealed = db.Column(db.String(256))
    count_interval_expiration_unsealed = db.Column(db.Integer)
    has_variations = db.Column(db.Boolean)
    active = db.Column(db.Boolean)
    # display_order = db.Column(db.Integer)
    can_view = db.Column(db.Boolean)
    can_edit = db.Column(db.Boolean)
    can_admin = db.Column(db.Boolean)
    # form_basket_add: Form_Basket_Add
    # form_basket_edit: Form_Basket_Edit
    # is_unavailable_in_currency_or_region: bool
    # is_available: bool
    # variation_tree

    def __init__(self):
        self.prices = []
        self.price_index = {}
        self.images = []
        self.image_index = {}
        self.delivery_options = []
        self.delivery_option_index = {}
        self.discounts = []
        self.discount_index = {}
        self.stock_items = []
        self.stock_item_index = {}
        super().__init__()
        Store_Base.__init__(self)
        self.currency_cost = None
        self.form_basket_add = Form_Basket_Add()
        self.form_basket_edit = Form_Basket_Edit()
        self.is_unavailable_in_currency_or_region = False
        # self.is_available = False
        self.variation_tree = None
        # self.variations = []
    @classmethod
    def from_DB_get_many_product_catalogue(cls, query_row):
        _m = f'{cls.__name__}.from_DB_get_many_product_catalogue'
        v_arg_type = 'class attribute'
        Helper_App.console_log(f'query_row: {query_row}')
        permutation = cls()
        permutation.id_permutation = query_row[0]
        permutation.id_product = query_row[1]
        permutation.id_category = query_row[2]
        permutation.description = query_row[3]
        permutation.cost_local_VAT_excl = query_row[4]
        permutation.cost_local_VAT_incl = query_row[5]
        permutation.currency_cost = Currency.from_DB_get_many_product_catalogue_product_permutation(query_row)
        permutation.profit_local_min = query_row[9]
        permutation.latency_manufacture = query_row[10]
        permutation.id_unit_measurement_quantity = query_row[11]
        permutation.symbol_unit_measurement_quantity = query_row[12]
        permutation.symbol_is_suffix_not_prefix_unit_measurement_quantity = av.input_bool(query_row[13], cls.FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX_UNIT_MEASUREMENT_QUANTITY, _m, v_arg_type=v_arg_type)
        permutation.name_singular_unit_measurement_quantity = query_row[14]
        permutation.name_plural_unit_measurement_quantity = query_row[15]
        permutation.count_unit_measurement_per_quantity_step = query_row[16]
        permutation.quantity_min = query_row[17]
        permutation.quantity_max = query_row[18]
        permutation.quantity_stock = query_row[19]
        permutation.is_subscription = av.input_bool(query_row[20], "is_subscription", _m, v_arg_type=v_arg_type)
        permutation.id_unit_measurement_interval_recurrence = query_row[21]
        permutation.symbol_unit_measurement_interval_recurrence = query_row[22]
        permutation.symbol_is_suffix_not_prefix_unit_measurement_interval_recurrence = av.input_bool(query_row[23], cls.FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX_UNIT_MEASUREMENT_INTERVAL_RECURRENCE, _m, v_arg_type=v_arg_type)
        permutation.name_singular_unit_measurement_interval_recurrence = query_row[24]
        permutation.name_plural_unit_measurement_interval_recurrence = query_row[25]
        permutation.count_interval_recurrence = query_row[26]
        permutation.id_stripe_product = query_row[27]
        permutation.does_expire_faster_once_unsealed = av.input_bool(query_row[28], "does_expire_faster_once_unsealed", _m, v_arg_type=v_arg_type)
        permutation.id_unit_measurement_interval_expiration_unsealed = query_row[29]
        permutation.symbol_unit_measurement_interval_expiration_unsealed = query_row[30]
        permutation.symbol_is_suffix_not_prefix_unit_measurement_interval_expiration_unsealed = av.input_bool(query_row[31], cls.FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED, _m, v_arg_type=v_arg_type)
        permutation.name_singular_unit_measurement_interval_expiration_unsealed = query_row[32]
        permutation.name_plural_unit_measurement_interval_expiration_unsealed = query_row[33]
        permutation.count_interval_expiration_unsealed = query_row[34]
        permutation.has_variations = av.input_bool(query_row[35], cls.FLAG_HAS_VARIATIONS, _m, v_arg_type=v_arg_type)
        permutation.active = av.input_bool(query_row[36], cls.FLAG_ACTIVE, _m, v_arg_type=v_arg_type)
        # permutation.display_order = query_row[27]
        permutation.can_view = av.input_bool(query_row[37], "can_view", _m, v_arg_type=v_arg_type)
        permutation.can_edit = av.input_bool(query_row[38], "can_edit", _m, v_arg_type=v_arg_type)
        permutation.can_admin = av.input_bool(query_row[39], "can_admin", _m, v_arg_type=v_arg_type)
        return permutation
    
    def from_DB_Stripe_product(query_row):
        _m = 'Product_Permutation.from_DB_Stripe_product'
        v_arg_type = 'class attribute'
        permutation = Product_Permutation()
        permutation.id_product = query_row[0]
        # permutation.name = query_row[1]
        permutation.description = query_row[2]
        return permutation

    def from_DB_Stripe_price(query_row):
        _m = 'Product_Permutation.from_DB_Stripe_price'
        v_arg_type = 'class attribute'
        permutation = Product_Permutation()
        permutation.id_product = query_row[0]
        # permutation.price_GBP_full = query_row[1]
        permutation.id_stripe_product = query_row[2]
        permutation.is_subscription = av.input_bool(query_row[3], "is_subscription", _m, v_arg_type=v_arg_type)
        permutation.name_singular_unit_measurement_interval_recurrence = query_row[4]
        permutation.count_interval_recurrence = query_row[5]
        return permutation
    """
    def from_json(json_basket_item, key_id_product, key_id_permutation):
        _m = 'Product_Permutation.from_json'
        v_arg_type = 'class attribute'
        permutation = Product_Permutation()
        permutation.id_product = json_basket_item[key_id_product]
        permutation.id_permutation = json_basket_item[key_id_permutation]
        return permutation
    """
    @classmethod
    def from_json(cls, json):
        _m = f'{cls.__name__}.from_json'
        permutation = cls()
        permutation.id_permutation = json[cls.ATTR_ID_PRODUCT_PERMUTATION]
        permutation.id_product = json[cls.ATTR_ID_PRODUCT]
        permutation.id_category = json[cls.ATTR_ID_PRODUCT_CATEGORY]
        permutation.description = json[cls.FLAG_DESCRIPTION]
        permutation.cost_local_VAT_excl = json[cls.FLAG_COST_UNIT_LOCAL_VAT_EXCL]
        permutation.cost_local_VAT_incl = json.get(cls.FLAG_COST_UNIT_LOCAL_VAT_INCL, None)
        permutation.currency_cost = Currency.from_json(json, '_cost')
        permutation.profit_local_min = json[cls.FLAG_PROFIT_LOCAL_MIN]
        permutation.latency_manufacture = json[cls.FLAG_LATENCY_MANUFACTURE]
        permutation.id_unit_measurement_quantity = json[cls.FLAG_UNIT_MEASUREMENT_QUANTITY]
        permutation.symbol_unit_measurement_quantity = json.get(cls.FLAG_SYMBOL_UNIT_MEASUREMENT_QUANTITY)
        permutation.symbol_is_suffix_not_prefix_unit_measurement_quantity = json.get(cls.FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX_UNIT_MEASUREMENT_QUANTITY)
        permutation.name_singular_unit_measurement_quantity = json.get(cls.FLAG_NAME_SINGULAR_UNIT_MEASUREMENT_QUANTITY)
        permutation.name_plural_unit_measurement_quantity = json.get(cls.FLAG_NAME_PLURAL_UNIT_MEASUREMENT_QUANTITY)
        permutation.count_unit_measurement_per_quantity_step = json[cls.FLAG_COUNT_UNIT_MEASUREMENT_PER_QUANTITY_STEP]
        permutation.quantity_min = json[cls.FLAG_QUANTITY_MIN]
        permutation.quantity_max = json[cls.FLAG_QUANTITY_MAX]
        permutation.quantity_stock = json[cls.FLAG_QUANTITY_STOCK]
        permutation.is_subscription = 1 if av.input_bool(json[cls.FLAG_IS_SUBSCRIPTION], cls.FLAG_IS_SUBSCRIPTION, _m) else 0
        permutation.id_unit_measurement_interval_recurrence = json[cls.FLAG_UNIT_MEASUREMENT_INTERVAL_RECURRENCE] if json[cls.FLAG_UNIT_MEASUREMENT_INTERVAL_RECURRENCE] != '' else None
        permutation.symbol_unit_measurement_interval_recurrence = json.get(cls.FLAG_SYMBOL_UNIT_MEASUREMENT_INTERVAL_RECURRENCE)
        permutation.symbol_is_suffix_not_prefix_unit_measurement_interval_recurrence = json.get(cls.FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX_UNIT_MEASUREMENT_INTERVAL_RECURRENCE)
        permutation.name_singular_unit_measurement_interval_recurrence = json.get(cls.FLAG_NAME_SINGULAR_UNIT_MEASUREMENT_INTERVAL_RECURRENCE)
        permutation.name_plural_unit_measurement_interval_recurrence = json.get(cls.FLAG_NAME_PLURAL_UNIT_MEASUREMENT_INTERVAL_RECURRENCE)
        permutation.count_interval_recurrence = json[cls.FLAG_COUNT_UNIT_MEASUREMENT_INTERVAL_RECURRENCE] if json[cls.FLAG_COUNT_UNIT_MEASUREMENT_INTERVAL_RECURRENCE] != '' else None
        permutation.id_stripe_product = json[cls.FLAG_ID_STRIPE_PRODUCT]
        permutation.does_expire_faster_once_unsealed = 1 if av.input_bool(json[cls.FLAG_DOES_EXPIRE_FASTER_ONCE_UNSEALED], cls.FLAG_DOES_EXPIRE_FASTER_ONCE_UNSEALED, _m) else 0
        permutation.id_unit_measurement_interval_expiration_unsealed = json[cls.FLAG_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED] if json[cls.FLAG_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED] != '' else None
        permutation.symbol_unit_measurement_interval_expiration_unsealed = json.get(cls.FLAG_SYMBOL_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED)
        permutation.symbol_is_suffix_not_prefix_unit_measurement_interval_expiration_unsealed = json.get(cls.FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED)
        permutation.name_singular_unit_measurement_interval_expiration_unsealed = json.get(cls.FLAG_NAME_SINGULAR_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED)
        permutation.name_plural_unit_measurement_interval_expiration_unsealed = json.get(cls.FLAG_NAME_PLURAL_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED)
        permutation.count_interval_expiration_unsealed = json[cls.FLAG_COUNT_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED] if json[cls.FLAG_COUNT_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED] != '' else None
        permutation.has_variations = json[cls.FLAG_HAS_VARIATIONS]
        permutation.active = 1 if av.input_bool(json[cls.FLAG_ACTIVE], cls.FLAG_ACTIVE, _m) else 0
        if permutation.has_variations:
            permutation.variation_tree = Product_Variation_Tree.from_json_str(json[cls.FLAG_PRODUCT_VARIATIONS])
            """
            for jsonProductVariation in json[cls.FLAG_PRODUCT_VARIATIONS]:
                variation = Product_Variation.from_json(jsonProductVariation)
                permutation.add_product_variation(variation)
            """
        return permutation
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_PRODUCT_PERMUTATION: self.id_permutation,
            self.ATTR_ID_PRODUCT: self.id_product,
            self.ATTR_ID_PRODUCT_CATEGORY: self.id_category,
            self.FLAG_DESCRIPTION: self.description,
            self.FLAG_COST_UNIT_LOCAL_VAT_EXCL: self.cost_local_VAT_excl,
            self.FLAG_COST_UNIT_LOCAL_VAT_INCL: self.cost_local_VAT_incl,
            self.FLAG_CURRENCY_COST: self.currency_cost.to_json(),
            self.FLAG_PROFIT_LOCAL_MIN: self.profit_local_min,
            self.FLAG_LATENCY_MANUFACTURE: self.latency_manufacture,
            self.FLAG_UNIT_MEASUREMENT_QUANTITY: self.id_unit_measurement_quantity,
            self.FLAG_SYMBOL_UNIT_MEASUREMENT_QUANTITY: self.symbol_unit_measurement_quantity,
            self.FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX_UNIT_MEASUREMENT_QUANTITY: self.symbol_is_suffix_not_prefix_unit_measurement_quantity,
            self.FLAG_NAME_SINGULAR_UNIT_MEASUREMENT_QUANTITY: self.name_singular_unit_measurement_quantity,
            self.FLAG_NAME_PLURAL_UNIT_MEASUREMENT_QUANTITY: self.name_plural_unit_measurement_quantity,
            self.FLAG_COUNT_UNIT_MEASUREMENT_PER_QUANTITY_STEP: self.count_unit_measurement_per_quantity_step,
            self.FLAG_QUANTITY_MIN: self.quantity_min,
            self.FLAG_QUANTITY_MAX: self.quantity_max,
            self.FLAG_QUANTITY_STOCK: self.quantity_stock,
            self.FLAG_IS_SUBSCRIPTION: self.is_subscription,
            self.FLAG_UNIT_MEASUREMENT_INTERVAL_RECURRENCE: self.id_unit_measurement_interval_recurrence,
            self.FLAG_SYMBOL_UNIT_MEASUREMENT_INTERVAL_RECURRENCE: self.symbol_unit_measurement_interval_recurrence,
            self.FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX_UNIT_MEASUREMENT_INTERVAL_RECURRENCE: self.symbol_is_suffix_not_prefix_unit_measurement_interval_recurrence,
            self.FLAG_NAME_SINGULAR_UNIT_MEASUREMENT_INTERVAL_RECURRENCE: self.name_singular_unit_measurement_interval_recurrence,
            self.FLAG_NAME_PLURAL_UNIT_MEASUREMENT_INTERVAL_RECURRENCE: self.name_plural_unit_measurement_interval_recurrence,
            self.FLAG_COUNT_UNIT_MEASUREMENT_INTERVAL_RECURRENCE: self.count_interval_recurrence,
            self.FLAG_ID_STRIPE_PRODUCT: self.id_stripe_product,
            self.FLAG_DOES_EXPIRE_FASTER_ONCE_UNSEALED: self.does_expire_faster_once_unsealed,
            self.FLAG_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED: self.id_unit_measurement_interval_expiration_unsealed,
            self.FLAG_SYMBOL_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED: self.symbol_unit_measurement_interval_expiration_unsealed,
            self.FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED: self.symbol_is_suffix_not_prefix_unit_measurement_interval_expiration_unsealed,
            self.FLAG_NAME_SINGULAR_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED: self.name_singular_unit_measurement_interval_expiration_unsealed,
            self.FLAG_NAME_PLURAL_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED: self.name_plural_unit_measurement_interval_expiration_unsealed,
            self.FLAG_COUNT_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED: self.count_interval_expiration_unsealed,
            self.FLAG_HAS_VARIATIONS: self.has_variations,
            self.FLAG_ACTIVE: self.active,
            self.FLAG_CAN_VIEW: self.can_view,
            self.FLAG_CAN_EDIT: self.can_edit,
            self.FLAG_CAN_ADMIN: self.can_admin,
            self.FLAG_PRODUCT_VARIATIONS: [] if self.variation_tree is None else [variation_type.to_json() for variation_type in self.variation_tree.get_product_variation_types()],
            self.FLAG_PRODUCT_IMAGE: [image.to_json() for image in self.images],
            self.FLAG_DELIVERY_OPTION: [option.to_json() for option in self.delivery_options],
            self.FLAG_PRODUCT_PRICE: [price.to_json() for price in self.prices],
        }
    def to_json_option(self):
        return {
            'value': self.id_permutation,
            'text': self.get_name_variations()
        }
    
    def get_name(self):
        return 
    def get_name_variations(self):
        return self.variation_tree.get_name_variations()
    def is_available(self):
        return len(self.prices) > 0
    def get_price(self):
        return self.prices[0]

    def output_delivery_date(self):
        return (datetime.now() + timedelta(days=self.latency_manufacture)).strftime('%A, %d %B %Y')
    
    """
    def output_lead_time(self):
        return '1 day' if self.latency_manufacture == 1 else f'{self.latency_manufacture} days'
    
    def output_price(self, is_included_VAT):
        if self.is_unavailable_in_currency_or_region:
            return 'Not available in currency and region'
        if not self.is_available:
            return 'Not available'
        price = self.get_price()
        locale.setlocale(locale.LC_ALL, '')
        if is_included_VAT:
            return f'{price.symbol_currency} {locale.format_string("%d", price.value_local_VAT_incl, grouping=True)}'
        else:
            return f'{price.symbol_currency} {locale.format_string("%d", price.value_local_VAT_excl, grouping=True)}'
    def output_variations(self):
        if not self.has_variations: return ''
        return '\n'.join([f'{variation.name_variation_type}: {variation.name_variation}' for variation in self.variations])
    def output_variations_jsonify(self):
        if not self.has_variations: return ''
        return ','.join([f'{variation.id_type}: {variation.id_variation}' for variation in self.variations])
    """
    
    def __repr__(self):
        return f'''Product_Permutation
            id_permutation: {self.id_permutation}
            id_product: {self.id_product}
            id_category: {self.id_category}
            description: {self.description}
            cost_local_VAT_excl: {self.cost_local_VAT_excl}
            cost_local_VAT_incl: {self.cost_local_VAT_incl}
            currency_cost: {self.currency_cost}
            latency_manufacture: {self.latency_manufacture}
            id_unit_measurement_quantity: {self.id_unit_measurement_quantity}
            symbol_unit_measurement_quantity: {self.symbol_unit_measurement_quantity}
            symbol_is_suffix_not_prefix_unit_measurement_quantity: {self.symbol_is_suffix_not_prefix_unit_measurement_quantity}
            name_singular_unit_measurement_quantity: {self.name_singular_unit_measurement_quantity}
            name_plural_unit_measurement_quantity: {self.name_plural_unit_measurement_quantity}
            count_unit_measurement_per_quantity_step: {self.count_unit_measurement_per_quantity_step}
            quantity_min: {self.quantity_min}
            quantity_max: {self.quantity_max}
            quantity_stock: {self.quantity_stock}
            is_subscription: {self.is_subscription}
            id_unit_measurement_interval_recurrence: {self.id_unit_measurement_interval_recurrence}
            symbol_unit_measurement_interval_recurrence: {self.symbol_unit_measurement_interval_recurrence}
            symbol_is_suffix_not_prefix_unit_measurement_interval_recurrence: {self.symbol_is_suffix_not_prefix_unit_measurement_interval_recurrence}
            name_singular_unit_measurement_interval_recurrence: {self.name_singular_unit_measurement_interval_recurrence}
            name_plural_unit_measurement_interval_recurrence: {self.name_plural_unit_measurement_interval_recurrence}
            count_interval_recurrence: {self.count_interval_recurrence}
            id_stripe_product: {self.id_stripe_product}
            does_expire_faster_once_unsealed: {self.does_expire_faster_once_unsealed}
            id_unit_measurement_interval_expiration_unsealed: {self.id_unit_measurement_interval_expiration_unsealed}
            symbol_unit_measurement_interval_expiration_unsealed: {self.symbol_unit_measurement_interval_expiration_unsealed}
            symbol_is_suffix_not_prefix_unit_measurement_interval_expiration_unsealed: {self.symbol_is_suffix_not_prefix_unit_measurement_interval_expiration_unsealed}
            name_singular_unit_measurement_interval_expiration_unsealed: {self.name_singular_unit_measurement_interval_expiration_unsealed}
            name_plural_unit_measurement_interval_expiration_unsealed: {self.name_plural_unit_measurement_interval_expiration_unsealed}
            count_interval_expiration_unsealed: {self.count_interval_expiration_unsealed}
            has_variations: {self.has_variations}
            can_view: {self.can_view}
            can_edit: {self.can_edit}
            can_admin: {self.can_admin}
            variation tree: {self.variation_tree}
            images: {self.images}
            delivery_options: {self.delivery_options}
            prices: {self.prices}
            '''
        """
            price_GBP_full: {self.price_GBP_full}
            price_GBP_min: {self.price_GBP_min}
        """
    """
    def add_product_variation(self, variation):
        _m = 'Product_Permutation.add_product_variation'
        ""
        av.val_instance(variation, 'variation', _m, Product_Variation)
        try:
            self.variation_index[variation.id_variation]
            raise ValueError(f"{av.error_msg_str(variation, 'variation', _m, Product_Variation)}\nProduct_Variation already in product.")
        except KeyError:
            self.variation_index[variation.id_variation] = len(self.variations)
            self.variations.append(variation)
        ""
        if self.variation_tree is None:
            self.variation_tree = Product_Variation_Tree.from_product_variation(variation)
        else:
            self.variation_tree.add_product_variation(variation)
    """
    def add_product_variation_type(self, variation_type):
        _m = 'Product_Permutation.add_product_variation_type'
        if self.variation_tree is None:
            self.variation_tree = Product_Variation_Tree.from_product_variation_type(variation_type)
        else:
            self.variation_tree.add_product_variation_type(variation_type)
    def add_product_price(self, price):
        _m = 'Product_Permutation.add_product_price'
        av.val_instance(price, 'price', _m, Product_Price)
        try:
            self.price_index[price.display_order]
            raise ValueError(f"{av.error_msg_str(price, 'price', _m, Product_Price)}\nPrice already in product.")
        except KeyError:
            self.price_index[price.display_order] = len(self.prices)
            self.prices.append(price)
    def add_product_image(self, image):
        _m = 'Product_Permutation.add_product_image'
        av.val_instance(image, 'image', _m, Image)
        try:
            self.image_index[image.id_image]
            raise ValueError(f"{av.error_msg_str(image, 'image', _m, Image)}\nImage already in product.")
        except KeyError:
            self.image_index[image.id_image] = len(self.images)
            self.images.append(image)
    def add_delivery_option(self, delivery_option):
        _m = 'Product_Permutation.add_delivery_option'
        av.val_instance(delivery_option, 'delivery_option', _m, Delivery_Option)
        try:
            self.delivery_option_index[delivery_option.id_option]
            raise ValueError(f"{av.error_msg_str(delivery_option, 'delivery_option', _m, Delivery_Option)}\nDelivery_Option already in product.")
        except KeyError:
            self.delivery_option_index[delivery_option.id_option] = len(self.delivery_options)
            self.delivery_options.append(delivery_option)
    def add_product_price_discount(self, discount):
        _m = 'Product_Permutation.add_product_price_discount'
        av.val_instance(discount, 'discount', _m, Discount)
        try:
            self.discount_index[discount.display_order]
            raise ValueError(f"{av.error_msg_str(discount, 'discount', _m, Discount)}\nDiscount already in product.")
        except KeyError:
            self.discount_index[discount.display_order] = len(self.discounts)
            self.discounts.append(discount)

    def add_stock_item(self, stock_item):
        av.val_instance(stock_item, 'stock_item', 'Product_Permutation.add_stock_item', Stock_Item)
        self.stock_items.append(stock_item)
    
    def get_image_from_index(self, index_image):
        try:
            return self.images[index_image]
        except:
            raise IndexError(f"Invalid image index: {index_image}")
        
    def get_price_from_code_currency(self, code_currency):
        for price in self.prices:
            if price.code_currency == code_currency:
                return price
    
    def to_row_permutation(self):
        a = {
            Product_Permutation.ATTR_ID_PRODUCT_CATEGORY: self.id_category,
            Product_Permutation.ATTR_ID_PRODUCT: self.id_product,
            Product_Permutation.ATTR_ID_PRODUCT_VARIATION: self.output_variations(),
            Product_Permutation.FLAG_QUANTITY_STOCK: self.quantity_stock,
            Product_Permutation.FLAG_QUANTITY_MIN: self.quantity_min,
            Product_Permutation.FLAG_QUANTITY_MAX: self.quantity_max,
            Product_Permutation.FLAG_COST_UNIT_LOCAL_VAT_EXCL: f"<strong>{self.symbol_currency_cost}</strong>{self.cost_local_VAT_excl}"
        }
        Helper_App.console_log('permutation row: ', a)
        return a


"""
class Permutation_Product_Variation_Link(db.Model):
    id_permutation = db.Column(db.Integer)
    id_product = db.Column(db.Integer)
    id_category = db.Column(db.Integer)
    id_variation = db.Column(db.Integer)

    def from_DB_get_many_product_catalogue(query_row):
        _m = 'Permutation_Product_Variation_Link.from_DB_get_many_product_catalogue'
        v_arg_type = 'class attribute'
        link = Permutation_Product_Variation_Link()
        link.id_permutation = query_row[0]
        link.id_product = query_row[1]
        link.id_category = query_row[2]
        link.id_variation = query_row[3]
        return link
"""

class Product_Permutation_Temp(db.Model, Store_Base):
    __tablename__: ClassVar[str] = 'Shop_Product_Permutation_Temp'
    __table_args__ = { 'extend_existing': True }
    id_permutation: int = db.Column(db.Integer, primary_key=True)
    id_product: int = db.Column(db.Integer)
    description: str = db.Column(db.String(4000))
    cost_local_VAT_excl: float = db.Column(db.Float)
    cost_local_VAT_incl: float = db.Column(db.Float)
    id_currency_cost: int = db.Column(db.Integer)
    profit_local_min: float = db.Column(db.Float)
    latency_manufacture: int = db.Column(db.Integer)
    id_unit_measurement_quantity: int = db.Column(db.Integer)
    count_unit_measurement_per_quantity_step: int = db.Column(db.Float)
    quantity_min: int = db.Column(db.Integer)
    quantity_max: int = db.Column(db.Integer)
    quantity_stock: int = db.Column(db.Integer)
    is_subscription: bool = db.Column(db.Boolean)
    id_unit_measurement_interval_recurrence: int = db.Column(db.Integer)
    count_interval_recurrence: int = db.Column(db.Float)
    id_stripe_product: str = db.Column(db.String(50))
    does_expire_faster_once_unsealed: bool = db.Column(db.Boolean)
    id_unit_measurement_interval_expiration_unsealed: int = db.Column(db.Integer)
    count_interval_expiration_unsealed: int = db.Column(db.Integer)
    active: bool = db.Column(db.Boolean)
    guid: str = db.Column(db.String(36))

    @classmethod
    def from_product_permutation(cls, product_permutation):
        Helper_App.console_log(f'Product_Permutation_Temp.from_product_permutation: {product_permutation}\ntype(cost local): {str(type(product_permutation.cost_local_VAT_excl))}')
        row = cls()
        row.id_permutation = product_permutation.id_permutation
        row.id_product = product_permutation.id_product
        row.description = product_permutation.description
        row.cost_local_VAT_excl = product_permutation.cost_local_VAT_excl if product_permutation.cost_local_VAT_excl != 'None' else None
        row.cost_local_VAT_incl = product_permutation.cost_local_VAT_incl if product_permutation.cost_local_VAT_incl != 'None' else None
        row.id_currency_cost = product_permutation.currency_cost.id_currency
        row.profit_local_min = product_permutation.profit_local_min if product_permutation.profit_local_min != 'None' else None
        row.latency_manufacture = product_permutation.latency_manufacture
        row.id_unit_measurement_quantity = product_permutation.id_unit_measurement_quantity
        row.count_unit_measurement_per_quantity_step = product_permutation.count_unit_measurement_per_quantity_step
        row.quantity_min = product_permutation.quantity_min
        row.quantity_max = product_permutation.quantity_max
        row.quantity_stock = product_permutation.quantity_stock
        row.is_subscription = product_permutation.is_subscription
        row.id_unit_measurement_interval_recurrence = product_permutation.id_unit_measurement_interval_recurrence
        row.count_interval_recurrence = product_permutation.count_interval_recurrence
        row.id_stripe_product = product_permutation.id_stripe_product
        row.does_expire_faster_once_unsealed = product_permutation.does_expire_faster_once_unsealed
        row.id_unit_measurement_interval_expiration_unsealed = product_permutation.id_unit_measurement_interval_expiration_unsealed
        row.count_interval_expiration_unsealed = product_permutation.count_interval_expiration_unsealed
        row.active = product_permutation.active
        return row
    def __repr__(self):
        return f'''
            id_permutation: {self.id_permutation}
            id_product: {self.id_product}
            description: {self.description}
            cost_local_VAT_excl: {self.cost_local_VAT_excl}
            cost_local_VAT_incl: {self.cost_local_VAT_incl}
            id_currency_cost: {self.id_currency_cost}
            profit_local_min: {self.profit_local_min}
            latency_manufacture: {self.latency_manufacture}
            id_unit_measurement_quantity: {self.id_unit_measurement_quantity}
            {Product_Permutation.FLAG_COUNT_UNIT_MEASUREMENT_PER_QUANTITY_STEP}: {self.count_unit_measurement_per_quantity_step}
            quantity_min: {self.quantity_min}
            quantity_max: {self.quantity_max}
            quantity_stock: {self.quantity_stock}
            is_subscription: {self.is_subscription}
            id_unit_measurement_interval_recurrence: {self.id_unit_measurement_interval_recurrence}
            count_interval_recurrence: {self.count_interval_recurrence}
            id_stripe_product: {self.id_stripe_product}
            does_expire_faster_once_unsealed: {self.does_expire_faster_once_unsealed}
            id_unit_measurement_interval_expiration_unsealed: {self.id_unit_measurement_interval_expiration_unsealed}
            count_interval_expiration_unsealed: {self.count_interval_expiration_unsealed}
            active: {self.active}
            guid: {self.guid}
            '''
    """
    def to_json(self):
        return {
            self.ATTR_ID_PRODUCT_PERMUTATION: int(self.id_permutation),
            self.ATTR_ID_PRODUCT: int(self.id_product),
            self.FLAG_DESCRIPTION: self.description,
            Product_Permutation.FLAG_COST_LOCAL: float(self.cost_local),
            Product_Permutation.FLAG_CURRENCY_COST: int(self.id_currency_cost),
            Product_Permutation.FLAG_PROFIT_LOCAL_MIN: float(self.profit_local_min),
            Product_Permutation.FLAG_LATENCY_MANUFACTURE: int(self.latency_manufacture),
            Product_Permutation.FLAG_UNIT_MEASUREMENT_QUANTITY: int(self.id_unit_measurement_quantity),
            Product_Permutation.FLAG_COUNT_UNIT_MEASUREMENT_PER_QUANTITY_STEP: float(self.count_unit_measurement_per_quantity_step),
            self.FLAG_QUANTITY_MIN: float(self.quantity_min),
            self.FLAG_QUANTITY_MAX: float(self.quantity_max),
            Product_Permutation.FLAG_QUANTITY_STOCK: float(self.quantity_stock),
            Product_Permutation.FLAG_IS_SUBSCRIPTION: bool(self.is_subscription),
            Product_Permutation.FLAG_UNIT_MEASUREMENT_INTERVAL_RECURRENCE: int(self.id_unit_measurement_interval_recurrence) if self.id_unit_measurement_interval_recurrence != '' else None,
            Product_Permutation.FLAG_COUNT_UNIT_MEASUREMENT_INTERVAL_RECURRENCE: float(self.count_interval_recurrence) if self.count_interval_recurrence != '' else None,
            Product_Permutation.FLAG_ID_STRIPE_PRODUCT: self.id_stripe_product,
            Product_Permutation.FLAG_DOES_EXPIRE_FASTER_ONCE_UNSEALED: bool(self.does_expire_faster_once_unsealed),
            Product_Permutation.FLAG_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED: int(self.id_unit_measurement_interval_expiration_unsealed) if self.id_unit_measurement_interval_expiration_unsealed != '' else None,
            Product_Permutation.FLAG_COUNT_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED: float(self.count_interval_expiration_unsealed) if self.count_interval_expiration_unsealed != '' else None,
            self.FLAG_ACTIVE: bool(self.active),
            self.FLAG_GUID: self.guid
        }
    """
    