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
from forms.forms import Form_Basket_Add, Form_Basket_Edit, Form_Filters_Permutation
from business_objects.store.delivery_option import Delivery_Option
from business_objects.store.discount import Discount
from business_objects.store.image import Image
from business_objects.store.product_price import Product_Price
from business_objects.store.stock_item import Stock_Item
from business_objects.store.store_base import Store_Base
from business_objects.store.product_variation import Product_Variation
from business_objects.store.product_variation_tree import Product_Variation_Tree
from extensions import db
# external
from datetime import datetime, timedelta
import locale
from dataclasses import dataclass

class Product_Permutation(db.Model, Store_Base):
    FLAG_QUANTITY_STOCK = 'quantity-stock'
    FLAG_QUANTITY_MIN = 'quantity-min'
    FLAG_QUANTITY_MAX = 'quantity-max'
    FLAG_COST_LOCAL = 'cost-local'

    id_product = db.Column(db.Integer, primary_key=True)
    id_permutation = db.Column(db.Integer, primary_key=True)
    # name = db.Column(db.String(255))
    description = db.Column(db.String(4000))
    # price_GBP_full = db.Column(db.Float)
    # price_GBP_min = db.Column(db.Float)
    id_currency_cost = db.Column(db.Integer)
    code_currency_cost = db.Column(db.String(3))
    symbol_currency_cost = db.Column(db.String(3))
    cost_local = db.Column(db.Float)
    has_variations = db.Column(db.Boolean)
    id_category = db.Column(db.Integer)
    latency_manufacture = db.Column(db.Integer)
    quantity_min = db.Column(db.Float)
    quantity_max = db.Column(db.Float)
    quantity_step = db.Column(db.Float)
    quantity_stock = db.Column(db.Float)
    id_stripe_product = db.Column(db.String(100))
    is_subscription = db.Column(db.Boolean)
    name_recurrence_interval = db.Column(db.String(255))
    name_plural_recurrence_interval = db.Column(db.String(256))
    count_recurrence_interval = db.Column(db.Integer)
    active = db.Column(db.Boolean)
    display_order = db.Column(db.Integer)
    can_view = db.Column(db.Boolean)
    can_edit = db.Column(db.Boolean)
    can_admin = db.Column(db.Boolean)
    # form_basket_add: Form_Basket_Add
    # form_basket_edit: Form_Basket_Edit
    # is_unavailable_in_currency_or_region: bool
    # is_available: bool
    # variation_tree

    def __init__(self):
        self.variations = []
        self.variation_index = {}
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
        self.form_basket_add = Form_Basket_Add()
        self.form_basket_edit = Form_Basket_Edit()
        self.is_unavailable_in_currency_or_region = False
        # self.is_available = False
        self.variation_tree = None

    def from_DB_get_many_product_catalogue(query_row):
        _m = 'Product_Permutation.from_DB_get_many_product_catalogue'
        v_arg_type = 'class attribute'
        print(f'query_row: {query_row}')
        permutation = Product_Permutation()
        permutation.id_permutation = query_row[0]
        permutation.id_product = query_row[1]
        permutation.id_category = query_row[2]
        permutation.description = query_row[3]
        permutation.cost_local = query_row[4]
        permutation.id_currency_cost = query_row[5]
        permutation.code_currency_cost = query_row[6]
        permutation.symbol_currency_cost = query_row[7]
        # permutation.profit_local_min = query_row[8]
        permutation.latency_manufacture = query_row[9]
        permutation.quantity_min = query_row[10]
        permutation.quantity_max = query_row[11]
        permutation.quantity_step = query_row[12]
        permutation.quantity_stock = query_row[13]
        permutation.id_stripe_product = query_row[14]
        permutation.is_subscription = av.input_bool(query_row[15], "is_subscription", _m, v_arg_type=v_arg_type)
        permutation.name_recurrence_interval = query_row[16]
        permutation.name_plural_recurrence_interval = query_row[17]
        permutation.count_recurrence_interval = query_row[18]
        permutation.active = query_row[19]
        permutation.display_order = query_row[20]
        permutation.can_view = av.input_bool(query_row[21], "can_view", _m, v_arg_type=v_arg_type)
        permutation.can_edit = av.input_bool(query_row[22], "can_edit", _m, v_arg_type=v_arg_type)
        permutation.can_admin = av.input_bool(query_row[23], "can_admin", _m, v_arg_type=v_arg_type)
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
        permutation.name_recurrence_interval = query_row[4]
        permutation.count_recurrence_interval = query_row[5]
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
        permutation = cls()
        permutation.id_category = json[cls.ATTR_ID_PRODUCT_CATEGORY]
        permutation.id_product = json[cls.ATTR_ID_PRODUCT]
        permutation.id_permutation = json[cls.ATTR_ID_PRODUCT_PERMUTATION]
        permutation.has_variations = len(json[cls.ATTR_ID_PRODUCT_VARIATION]) > 0
        if permutation.has_variations:
            for jsonProductVariation in json[cls.ATTR_ID_PRODUCT_VARIATION]:
                variation = Product_Variation.from_json(jsonProductVariation)
                permutation.add_product_variation(variation)
        permutation.quantity_stock = json[cls.FLAG_QUANTITY_STOCK]
        permutation.quantity_min = json[cls.FLAG_QUANTITY_MIN]
        permutation.quantity_max = json[cls.FLAG_QUANTITY_MAX]
        return permutation
    def to_json(self):
        return {
            'id_product': {self.id_product},
            'id_permutation': {self.id_permutation},
            'description': {self.description},
            'id_category': {self.id_category},
            'latency_manufacture': {self.latency_manufacture},
            'quantity_min': {self.quantity_min},
            'quantity_max': {self.quantity_max},
            'quantity_step': {self.quantity_step},
            'quantity_stock': {self.quantity_stock},
            'id_stripe_product': {self.id_stripe_product},
            'is_subscription': {self.is_subscription},
            'name_recurrence_interval': {self.name_recurrence_interval},
            'name_plural_recurrence_interval': {self.name_plural_recurrence_interval},
            'count_recurrence_interval': {self.count_recurrence_interval},
            'display_order': {self.display_order},
            'can_view': {self.can_view},
            'can_edit': {self.can_edit},
            'can_admin': {self.can_admin},
            'variations': {self.variations},
            'images': {self.images},
            'delivery_options': {self.delivery_options},
            'prices': {self.prices}
        }
    def to_json_option(self):
        return {
            'value': self.id_permutation,
            'text': self.get_name_variations()
        }
    def get_name_variations(self):
        return self.variation_tree.get_name_variations()
    def is_available(self):
        return len(self.prices) > 0
    def get_price(self):
        return self.prices[0]
    def get_price_local_VAT_incl(self):
        price = self.get_price()
        return price.value_local_VAT_incl
    def get_price_local_VAT_excl(self):
        price = self.get_price()
        return price.value_local_VAT_excl

    def output_lead_time(self):
        return '1 day' if self.latency_manufacture == 1 else f'{self.latency_manufacture} days'
    
    def output_delivery_date(self):
        return (datetime.now() + timedelta(days=self.latency_manufacture)).strftime('%A, %d %B %Y')
    
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
    def output_currency(self):
        if not self.is_available:
            return ''
        """
        price = self.get_price()
        return price.code_currency
        """
        return self.code_currency_cost if self.symbol_currency_cost == '' else self.symbol_currency_cost
    def output_variations(self):
        if not self.has_variations: return ''
        return '\n'.join([f'{variation.name_variation_type}: {variation.name_variation}' for variation in self.variations])
    def output_variations_jsonify(self):
        if not self.has_variations: return ''
        return ','.join([f'{variation.id_type}: {variation.id_variation}' for variation in self.variations])
    """
    def output_price_VAT_incl(self):
        locale.setlocale(locale.LC_ALL, '')
        return locale.format_string("%d", self.price_GBP_VAT_incl, grouping=True)
    def output_price_VAT_excl(self):
        locale.setlocale(locale.LC_ALL, '')
        return locale.format_string("%d", self.price_GBP_VAT_excl, grouping=True)
    def add_form_basket_add(self):
        self.form_basket_add = None

    def add_form_basket_edit(self):
        self.form_basket_edit = None
    """
    def __repr__(self):
        return f'''Product_Permutation
            id_product: {self.id_product}
            id_permutation: {self.id_permutation}
            description: {self.description}
            id_category: {self.id_category}
            latency_manufacture: {self.latency_manufacture}
            quantity_min: {self.quantity_min}
            quantity_max: {self.quantity_max}
            quantity_step: {self.quantity_step}
            quantity_stock: {self.quantity_stock}
            id_stripe_product: {self.id_stripe_product}
            is_subscription: {self.is_subscription}
            name_recurrence_interval: {self.name_recurrence_interval}
            name_plural_recurrence_interval: {self.name_plural_recurrence_interval}
            count_recurrence_interval: {self.count_recurrence_interval}
            display_order: {self.display_order}
            can_view: {self.can_view}
            can_edit: {self.can_edit}
            can_admin: {self.can_admin}
            variations: {self.variations}
            images: {self.images}
            delivery_options: {self.delivery_options}
            prices: {self.prices}
            '''
        """
            price_GBP_full: {self.price_GBP_full}
            price_GBP_min: {self.price_GBP_min}
        """

    def add_product_variation(self, variation):
        _m = 'Product_Permutation.add_product_variation'
        """
        av.val_instance(variation, 'variation', _m, Product_Variation)
        try:
            self.variation_index[variation.id_variation]
            raise ValueError(f"{av.error_msg_str(variation, 'variation', _m, Product_Variation)}\nProduct_Variation already in product.")
        except KeyError:
            self.variation_index[variation.id_variation] = len(self.variations)
            self.variations.append(variation)
        """
        if self.variation_tree is None:
            self.variation_tree = Product_Variation_Tree.from_product_variation(variation)
        else:
            self.variation_tree.add_product_variation(variation)
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
            Product_Permutation.FLAG_COST_LOCAL: f"<strong>{self.symbol_currency_cost}</strong>{self.cost_local}"
        }
        print('permutation row: ', a)
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
