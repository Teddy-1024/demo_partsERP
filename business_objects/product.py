"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Product Business Object

Description:
Business object for product
"""

# IMPORTS
# VARIABLE INSTANTIATION
# CLASSES
# METHODS

# IMPORTS
# internal
import lib.argument_validation as av
from lib import data_types
from forms import Form_Basket_Add, Form_Basket_Edit, Form_Filters_Permutation
from business_objects.discount import Discount
from business_objects.variation import Variation
from business_objects.image import Image
from business_objects.delivery_option import Delivery_Option
from business_objects.stock_item import Stock_Item
# external
from enum import Enum
from datetime import datetime, timedelta
import locale
from flask_sqlalchemy import SQLAlchemy
from dataclasses import dataclass
from typing import ClassVar

# VARIABLE INSTANTIATION
db = SQLAlchemy()


# CLASSES
class Enum_Status_Stock(Enum):
    OUT = 0
    LOW = 1
    IN = 99

    def text(self):
        return Enum_Status_Stock.Enum_Status_Stock_Text(self)
    
    def Enum_Status_Stock_Text(status):
        av.val_instance(status, 'category', 'Enum_Status_Stock_Text', Enum_Status_Stock)
        if status == Enum_Status_Stock.OUT:
            return 'Out of stock'
        elif status == Enum_Status_Stock.LOW:
            return 'Low on stock'
        else:
            return 'Fully stocked'
    
    def get_member_by_text(text):
        return data_types.get_enum_member_by_text(Enum_Status_Stock, text.upper())

class Variation_Tree_Node():
    variation: Variation
    node_parent: None
    nodes_child: list
    def __init__(self):
        self.nodes_child = []
    def make_from_variation_and_node_parent(variation, node_parent):
        node = Variation_Tree_Node()
        node.variation = variation
        node.node_parent = node_parent
        return node
    def make_from_node_parent(node_parent):
        node = Variation_Tree_Node()
        node.node_parent = node_parent
        return node
    def add_child(self, node_child):
        self.nodes_child.append(node_child)
    def is_leaf(self):
        return (len(self.nodes_child) == 0)
class Variation_Tree:
    node_root: Variation_Tree_Node
    def make_from_node_root(node_root):
        tree = Variation_Tree()
        tree.node_root = node_root
        return tree
    def get_variation_type_list(self):
        variation_types = []
        node = self.node_root
        at_leaf_node = node.is_leaf()
        while not at_leaf_node:
            variation_types.append(node.variation.name_variation_type)
            at_leaf_node = node.is_leaf()
            if not at_leaf_node:
                node = node.nodes_child[0]
        return variation_types
    def is_equal(self, tree):
        my_type_list = self.get_variation_type_list()
        sz_me = len(my_type_list)
        other_type_list = tree.get_variation_type_list()
        sz_other = len(other_type_list)
        is_equal = (sz_me == sz_other)
        if is_equal:
            for index_type in range(sz_me):
                if sz_me[index_type] != sz_other[index_type]:
                    is_equal = False
                    break
        return is_equal
    def make_from_product_permutation(product_permutation):
        depth_max = len(product_permutation.variations)
        node_root = Variation_Tree_Node.make_from_variation_and_node_parent(product_permutation.variations[0], None)
        node = node_root
        for depth in range(depth_max - 1):
            node = Variation_Tree_Node.make_from_variation_and_node_parent(product_permutation.variations[depth + 1], node)
        return Variation_Tree.make_from_node_root(node_root)

class Product(db.Model):
    ATTR_ID_CATEGORY: ClassVar[str] = Variation.ATTR_ID_CATEGORY # 'id-category'
    ATTR_ID_PRODUCT: ClassVar[str] = Variation.ATTR_ID_PRODUCT # 'id-product'
    ATTR_ID_PERMUTATION: ClassVar[str] = Variation.ATTR_ID_PERMUTATION # 'id-permutation'
    FLAG_VARIATIONS: ClassVar[str] = 'variations'

    id_product = db.Column(db.Integer, primary_key=True)
    id_category = db.Column(db.Integer)
    name = db.Column(db.String(255))
    display_order = db.Column(db.Integer)
    can_view = db.Column(db.Boolean)
    can_edit = db.Column(db.Boolean)
    can_admin = db.Column(db.Boolean)
    # form_basket_add: Form_Basket_Add
    # form_basket_edit: Form_Basket_Edit
    # has_variations: bool
    # index_permutation_selected: int

    def __init__(self):
        self.permutations = []
        self.permutation_index = {}
        self.variation_trees = []
        self.index_permutation_selected = None
        self.has_variations = False
        super().__init__()
        self.form_basket_add = Form_Basket_Add()
        self.form_basket_edit = Form_Basket_Edit()

    def make_from_DB_product(query_row):
        _m = 'Product.make_from_DB_product'
        v_arg_type = 'class attribute'
        product = Product()
        product.id_product = query_row[0]
        product.id_category = query_row[5]
        product.name = query_row[2]
        product.has_variations = av.input_bool(query_row[4], "has_variations", _m, v_arg_type=v_arg_type)
        product.display_order = query_row[22]
        product.can_view = av.input_bool(query_row[24], "can_view", _m, v_arg_type=v_arg_type)
        product.can_edit = av.input_bool(query_row[25], "can_edit", _m, v_arg_type=v_arg_type)
        product.can_admin = av.input_bool(query_row[26], "can_admin", _m, v_arg_type=v_arg_type)
        return product
    """
    def make_from_permutation(permutation, has_variations = False):
        _m = 'Product.make_from_permutation'
        v_arg_type = 'class attribute'
        av.val_instance(permutation, 'permutation', _m, Product_Permutation, v_arg_type=v_arg_type)
        product = Product()
        product.has_variations = has_variations
        product.index_permutation_selected = 0
        product.id_product = permutation.id_product
        product.id_category = permutation.id_category
        product.display_order = permutation.display_order
        product.can_view = permutation.can_view
        product.can_edit = permutation.can_edit
        product.can_admin = permutation.can_admin
        product.permutations.append(permutation)
        # product.get_variation_trees()
        return product
    """
    def add_permutation(self, permutation):
        _m = 'Product.add_permutation'
        av.val_instance(permutation, 'permutation', _m, Product_Permutation)
        try:
            self.permutation_index[permutation.id_permutation]
            raise ValueError(f"{av.error_msg_str(permutation, 'permutation', _m, Product_Permutation)}\nPermutation ID already in product")
        except KeyError:
            self.permutation_index[permutation.id_permutation] = len(self.permutations)
            self.permutations.append(permutation)
            """
            if self.has_variations:
                self.has_variations = False
            """
        if self.index_permutation_selected is None:
            self.index_permutation_selected = self.permutation_index[permutation.id_permutation]
            print(f'setting selected permutation for product {self.id_product} to {self.index_permutation_selected}') # :\n{self.permutations[self.index_permutation_selected]}
    """
    def make_from_permutations(permutations):
        _m = 'Product.make_from_permutations'
        v_arg_type = 'class attribute'
        if len(permutations) == 0:
            raise ValueError(av.error_msg_str(permutations, 'permutations', _m, list, v_arg_type=v_arg_type))
        product = Product()
        product.has_variations = True
        product.index_permutation_selected = 0
        product.id_product = permutations[0].id_product
        product.id_category = permutations[0].id_category
        product.display_order = permutations[0].display_order
        product.can_view = True
        product.can_edit = True
        product.can_admin = True
        for permutation in permutations:
            product.can_view &= permutation.can_view
            product.can_edit &= permutation.can_edit
            product.can_admin &= permutation.can_admin
        product.permutations.append(permutations)
        product.get_variation_trees()
        return product
    """
    def get_variation_trees(self):
        for index_permutation in range(len(self.permutations)):
            variation_tree = Variation_Tree.make_from_product_permutation(self.permutations[index_permutation])
            found_variation_tree_match = False
            for index_tree in range(len(self.variation_trees)):
                if self.variation_trees[index_tree].is_equal(variation_tree):
                    found_variation_tree_match = True
                    break
            if not found_variation_tree_match:
                self.variation_trees.append(variation_tree)
    
    def make_from_DB_Stripe_product(query_row):
        permutation = Product_Permutation.make_from_DB_Stripe_product(query_row)
        product = Product.make_from_permutation(permutation)
        return product

    def make_from_DB_Stripe_price(query_row):
        permutation = Product_Permutation.make_from_DB_Stripe_price(query_row)
        product = Product.make_from_permutation(permutation)
        return product
    
    def make_from_json(json_basket_item, key_id_product, key_id_permutation):
        permutation = Product_Permutation.make_from_json(json_basket_item, key_id_product, key_id_permutation)
        product = Product.make_from_permutation(permutation)
        return product

    def get_permutation_selected(self):
        try:
            return self.permutations[self.index_permutation_selected]
        except:
            raise ValueError(f'list index {self.index_permutation_selected} out of range')
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
    """
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
    """
    def get_index_permutation_from_id(self, id_permutation):
        if id_permutation is None and not self.has_variations:
            return 0
        for index_permutation in range(len(self.permutations)):
            permutation = self.permutations[index_permutation]
            if permutation.id_permutation == id_permutation:
                return index_permutation
        raise ValueError(f"{av.error_msg_str(id_permutation, 'id_permutation', 'Product.get_index_permutation_from_id', int)}\nPermutation ID not found.")
    """
    def add_variation(self, variation):
        av.val_instance(variation, 'variation', 'Product.add_variation', Variation)
        # print(f'variation: {variation}')
        index_permutation = self.permutation_index[variation.id_permutation] # self.get_index_permutation_from_id(variation.id_permutation)
        self.permutations[index_permutation].add_variation(variation)
    def add_price(self, price):
        av.val_instance(price, 'price', 'Product.add_price', Price)
        index_permutation = self.permutation_index[price.id_permutation] # self.get_index_permutation_from_id(price.id_permutation)
        self.permutations[index_permutation].add_price(price)
    def add_image(self, image):
        av.val_instance(image, 'image', 'Product.add_image', Image)
        index_permutation = self.permutation_index[image.id_permutation] # self.get_index_permutation_from_id(image.id_permutation)
        self.permutations[index_permutation].add_image(image)
    def add_delivery_option(self, delivery_option):
        av.val_instance(delivery_option, 'delivery_option', 'Product.add_delivery_option', Delivery_Option)
        index_permutation = self.permutation_index[delivery_option.id_permutation] # self.get_index_permutation_from_id(delivery_option.id_permutation)
        self.permutations[index_permutation].add_delivery_option(delivery_option)
    def add_discount(self, discount):
        av.val_instance(discount, 'discount', 'Product.add_discount', Discount)
        index_permutation = self.permutation_index[discount.id_permutation] # self.get_index_permutation_from_id(discount.id_permutation)
        self.permutations[index_permutation].add_discount(discount)

    def add_stock_item(self, stock_item):
        av.val_instance(stock_item, 'stock_item', 'Product.add_stock_item', Stock_Item)
        index_permutation = self.permutation_index[stock_item.id_permutation]
        self.permutations[index_permutation].add_stock_item(stock_item)

    def has_permutations(self):
        return len(self.permutations) > 0
    def is_available(self):
        if len(self.permutations) == 0:
            return False
        for permutation in self.permutations:
            if permutation.is_available():
                return True
        return False
    
    def to_list_rows_permutation(self):
        list_rows = []
        for permutation in self.permutations:
            list_rows.append(permutation.to_row_permutation())
        return list_rows


class Product_Permutation(db.Model):
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
    display_order = db.Column(db.Integer)
    can_view = db.Column(db.Boolean)
    can_edit = db.Column(db.Boolean)
    can_admin = db.Column(db.Boolean)
    # form_basket_add: Form_Basket_Add
    # form_basket_edit: Form_Basket_Edit
    # is_unavailable_in_currency_or_region: bool
    # is_available: bool

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
        self.form_basket_add = Form_Basket_Add()
        self.form_basket_edit = Form_Basket_Edit()
        self.is_unavailable_in_currency_or_region = False
        # self.is_available = False

    def make_from_DB_product(query_row):
        _m = 'Product_Permutation.make_from_DB_product'
        v_arg_type = 'class attribute'
        print(f'query_row: {query_row}')
        permutation = Product_Permutation()
        permutation.id_product = query_row[0]
        permutation.id_permutation = query_row[1]
        # permutation.name = query_row[2]
        permutation.description = query_row[3]
        # permutation.price_GBP_full = query_row[4]
        # permutation.price_GBP_min = query_row[5]
        permutation.id_currency_cost = query_row[7]
        permutation.code_currency_cost = query_row[8]
        permutation.symbol_currency_cost = query_row[9]
        permutation.cost_local = query_row[6]
        permutation.has_variations = query_row[4]
        permutation.id_category = query_row[5]
        permutation.latency_manufacture = query_row[11]
        permutation.quantity_min = query_row[12]
        permutation.quantity_max = query_row[13]
        permutation.quantity_step = query_row[14]
        permutation.quantity_stock = query_row[15]
        permutation.id_stripe_product = query_row[16]
        permutation.is_subscription = av.input_bool(query_row[17], "is_subscription", _m, v_arg_type=v_arg_type)
        permutation.name_recurrence_interval = query_row[18]
        permutation.name_plural_recurrence_interval = query_row[19]
        permutation.count_recurrence_interval = query_row[20]
        permutation.display_order = query_row[23]
        permutation.can_view = av.input_bool(query_row[24], "can_view", _m, v_arg_type=v_arg_type)
        permutation.can_edit = av.input_bool(query_row[25], "can_edit", _m, v_arg_type=v_arg_type)
        permutation.can_admin = av.input_bool(query_row[26], "can_admin", _m, v_arg_type=v_arg_type)
        return permutation
    
    def make_from_DB_Stripe_product(query_row):
        _m = 'Product_Permutation.make_from_DB_Stripe_product'
        v_arg_type = 'class attribute'
        permutation = Product_Permutation()
        permutation.id_product = query_row[0]
        # permutation.name = query_row[1]
        permutation.description = query_row[2]
        return permutation

    def make_from_DB_Stripe_price(query_row):
        _m = 'Product_Permutation.make_from_DB_Stripe_price'
        v_arg_type = 'class attribute'
        permutation = Product_Permutation()
        permutation.id_product = query_row[0]
        # permutation.price_GBP_full = query_row[1]
        permutation.id_stripe_product = query_row[2]
        permutation.is_subscription = av.input_bool(query_row[3], "is_subscription", _m, v_arg_type=v_arg_type)
        permutation.name_recurrence_interval = query_row[4]
        permutation.count_recurrence_interval = query_row[5]
        return permutation
    
    def make_from_json(json_basket_item, key_id_product, key_id_permutation):
        _m = 'Product_Permutation.make_from_json'
        v_arg_type = 'class attribute'
        permutation = Product_Permutation()
        permutation.id_product = json_basket_item[key_id_product]
        permutation.id_permutation = json_basket_item[key_id_permutation]
        return permutation
    
    def from_json(jsonPermutation):
        permutation = Product_Permutation()
        permutation.id_category = jsonPermutation[Product.ATTR_ID_CATEGORY]
        permutation.id_product = jsonPermutation[Product.ATTR_ID_PRODUCT]
        permutation.id_permutation = jsonPermutation[Product.ATTR_ID_PERMUTATION]
        permutation.has_variations = len(jsonPermutation[Product.FLAG_VARIATIONS]) > 0
        if permutation.has_variations:
            for jsonVariation in jsonPermutation[Product.FLAG_VARIATIONS]:
                variation = Variation.from_json(jsonVariation)
                permutation.add_variation(variation)
        permutation.quantity_stock = jsonPermutation[Product_Permutation.FLAG_QUANTITY_STOCK]
        permutation.quantity_min = jsonPermutation[Product_Permutation.FLAG_QUANTITY_MIN]
        permutation.quantity_max = jsonPermutation[Product_Permutation.FLAG_QUANTITY_MAX]
        return permutation

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
        return ','.join([f'{variation.name_variation_type}: {variation.name_variation}' for variation in self.variations])
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

    def add_variation(self, variation):
        _m = 'Product_Permutation.add_variation'
        av.val_instance(variation, 'variation', _m, Variation)
        try:
            self.variation_index[variation.id_variation]
            raise ValueError(f"{av.error_msg_str(variation, 'variation', _m, Variation)}\nVariation already in product.")
        except KeyError:
            self.variation_index[variation.id_variation] = len(self.variations)
            self.variations.append(variation)
    def add_price(self, price):
        _m = 'Product_Permutation.add_price'
        av.val_instance(price, 'price', _m, Price)
        try:
            self.price_index[price.display_order]
            raise ValueError(f"{av.error_msg_str(price, 'price', _m, Price)}\nPrice already in product.")
        except KeyError:
            self.price_index[price.display_order] = len(self.prices)
            self.prices.append(price)
    def add_image(self, image):
        _m = 'Product_Permutation.add_image'
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
    def add_discount(self, discount):
        _m = 'Product_Permutation.add_discount'
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
            Product.ATTR_ID_CATEGORY: self.id_category,
            Product.ATTR_ID_PRODUCT: self.id_product,
            Product.FLAG_VARIATIONS: self.output_variations(),
            Product_Permutation.FLAG_QUANTITY_STOCK: self.quantity_stock,
            Product_Permutation.FLAG_QUANTITY_MIN: self.quantity_min,
            Product_Permutation.FLAG_QUANTITY_MAX: self.quantity_max,
            Product_Permutation.FLAG_COST_LOCAL: f"<strong>{self.symbol_currency_cost}</strong>{self.cost_local}"
        }
        print('permutation row: ', a)
        return a

"""
class Product_Filters():
    ids: str # csv
    categories: str # csv

    def __new__(cls, product_ids, product_categories):
        # Initialiser - validation
        _m = 'Product_Filters.__new__'
        v_arg_type = 'class attribute'
        # av.val_list_instances(product_ids, 'product_ids', _m, str, v_arg_type=v_arg_type)
        # av.val_list_instances(product_categories, 'product_categories', _m, Product_Category_Enum, v_arg_type=v_arg_type)
        av.val_str(product_ids, 'product_ids', _m, v_arg_type=v_arg_type)
        av.val_str(product_categories, 'product_categories', _m, v_arg_type=v_arg_type)
        return super(Product, cls).__new__(cls)
    
    def __init__(self, product_ids, product_categories):
        # Constructor
        self.ids = product_ids
        self.categories = product_categories

class Price():
    product: Product
    currency: Currency_Enum

    def make_from_product_currency(product, code_currency):
        name_method = 'make_from_product_currency'
        av.val_instance(product, 'product', name_method, Product)
        price = Price()
        price.product = product
        price.currency = Currency_Enum.get_member_by_text(code_currency)
"""

class Price(db.Model):
    id_price = db.Column(db.Integer)
    id_product = db.Column(db.Integer)
    id_permutation = db.Column(db.Integer)
    id_category = db.Column(db.Integer)
    id_currency = db.Column(db.Integer)
    code_currency = db.Column(db.String)
    name_currency = db.Column(db.String)
    symbol_currency = db.Column(db.String)
    id_region = db.Column(db.Integer)
    value_local_VAT_incl = db.Column(db.Float)
    value_local_VAT_excl = db.Column(db.Float)
    display_order = db.Column(db.Float, primary_key=True)

    def make_from_DB_product(query_row):
        _m = 'Price.make_from_DB_product'
        price = Price()
        price.id_price = query_row[0]
        price.id_permutation = query_row[1]
        price.id_product = query_row[2]
        price.id_category = query_row[3]
        price.id_currency = query_row[4]
        price.code_currency = query_row[5]
        price.name_currency = query_row[6]
        price.symbol_currency = query_row[7]
        price.id_region = query_row[8]
        price.value_local_VAT_incl = query_row[9]
        price.value_local_VAT_excl = query_row[10]
        price.display_order = query_row[11]
        return price
    
    def __repr__(self):
        return f'''Price
            id: {self.id_price}
            id_permutation: {self.id_permutation}
            id_product: {self.id_product}
            id_category: {self.id_category}
            id_currency: {self.id_currency}
            code_currency: {self.code_currency}
            name_currency: {self.name_currency}
            symbol_currency: {self.symbol_currency}
            id_region: {self.id_region}
            value_local (VAT incl): {self.value_local_VAT_incl}
            value_local (VAT excl): {self.value_local_VAT_excl}
            display_order (UID): {self.display_order}
            '''
"""
class Permutation_Variation_Link(db.Model):
    id_permutation = db.Column(db.Integer)
    id_product = db.Column(db.Integer)
    id_category = db.Column(db.Integer)
    id_variation = db.Column(db.Integer)

    def make_from_DB_product(query_row):
        _m = 'Permutation_Variation_Link.make_from_DB_product'
        v_arg_type = 'class attribute'
        link = Permutation_Variation_Link()
        link.id_permutation = query_row[0]
        link.id_product = query_row[1]
        link.id_category = query_row[2]
        link.id_variation = query_row[3]
        return link
"""

@dataclass
class Product_Filters():
    # id_user: str
    get_all_category: bool
    get_inactive_category: bool
    get_first_category_only: bool
    ids_category: str
    get_all_product: bool
    get_inactive_product: bool
    get_first_product_only: bool
    ids_product: str
    get_all_permutation: bool
    get_inactive_permutation: bool
    get_first_permutation_only: bool
    ids_permutation: str
    get_all_image: bool
    get_inactive_image: bool
    get_first_image_only: bool
    ids_image: str
    get_all_region: bool
    get_inactive_region: bool
    get_first_region_only: bool
    ids_region: str
    get_all_currency: bool
    get_inactive_currency: bool
    get_first_currency_only: bool
    ids_currency: str
    get_all_discount: bool
    get_inactive_discount: bool
    ids_discount: str
    get_products_quantity_stock_below_min: bool

    def to_json(self):
        return {
            'a_id_user': None,
            'a_get_all_category': self.get_all_category,
            'a_get_inactive_category': self.get_inactive_category,
            'a_get_first_category_only': self.get_first_category_only,
            'a_ids_category': self.ids_category,
            'a_get_all_product': self.get_all_product,
            'a_get_inactive_product': self.get_inactive_product,
            'a_get_first_product_only': self.get_first_product_only,
            'a_ids_product': self.ids_product,
            'a_get_all_permutation': self.get_all_permutation,
            'a_get_inactive_permutation': self.get_inactive_permutation,
            'a_get_first_permutation_only': self.get_first_permutation_only,
            'a_ids_permutation': self.ids_permutation,
            'a_get_all_image': self.get_all_image,
            'a_get_inactive_image': self.get_inactive_image,
            'a_get_first_image_only': self.get_first_image_only,
            'a_ids_image': self.ids_image,
            'a_get_all_delivery_region': self.get_all_region,
            'a_get_inactive_delivery_region': self.get_inactive_region,
            'a_get_first_delivery_region_only': self.get_first_region_only,
            'a_ids_delivery_region': self.ids_region,
            'a_get_all_currency': self.get_all_currency,
            'a_get_inactive_currency': self.get_inactive_currency,
            'a_get_first_currency_only': self.get_first_currency_only,
            'a_ids_currency': self.ids_currency,
            'a_get_all_discount': self.get_all_discount,
            'a_get_inactive_discount': self.get_inactive_discount,
            'a_ids_discount': self.ids_discount,
            'a_get_products_quantity_stock_below_min': self.get_products_quantity_stock_below_min
        }
    
    @staticmethod
    def from_form(form):
        # if not (form is Form_Filters_Permutation): raise ValueError(f'Invalid form type: {type(form)}')
        av.val_instance(form, 'form', 'Product_Filters.from_form', Form_Filters_Permutation)
        has_category_filter = not (form.id_category.data == '0' or form.id_category.data == '')
        has_product_filter = not (form.id_product.data == '0' or form.id_product.data == '')
        get_permutations_stock_below_min = av.input_bool(form.is_out_of_stock.data, "is_out_of_stock", "Product_Filters.from_form")
        print(f'form question: {type(form.is_out_of_stock)}\nbool interpretted: {get_permutations_stock_below_min}\type form: {type(form)}')
        return Product_Filters(
            get_all_category = not has_category_filter,
            get_inactive_category = False,
            get_first_category_only = False,
            ids_category = form.id_category.data,
            get_all_product = not has_product_filter,
            get_inactive_product = False,
            get_first_product_only = False,
            ids_product = form.id_product.data,
            get_all_permutation = not get_permutations_stock_below_min,
            get_inactive_permutation = False,
            get_first_permutation_only = False,
            ids_permutation = '',
            get_all_image = False,
            get_inactive_image = False,
            get_first_image_only = False,
            ids_image = '',
            get_all_region = False,
            get_inactive_region = False,
            get_first_region_only = False,
            ids_region = '',
            get_all_currency = False,
            get_inactive_currency = False,
            get_first_currency_only = False,
            ids_currency = '',
            get_all_discount = False,
            get_inactive_discount = False,
            ids_discount = '',
            get_products_quantity_stock_below_min = get_permutations_stock_below_min
        )
    
    @staticmethod
    def get_default():
        return Product_Filters(
            get_all_category = True,
            get_inactive_category = False,
            get_first_category_only = False,
            ids_category = '',
            get_all_product = True,
            get_inactive_product = False,
            get_first_product_only = False,
            ids_product = '',
            get_all_permutation = True,
            get_inactive_permutation = False,
            get_first_permutation_only = False,
            ids_permutation = '',
            get_all_image = True,
            get_inactive_image = False,
            get_first_image_only = False,
            ids_image = '',
            get_all_region = True,
            get_inactive_region = False,
            get_first_region_only = False,
            ids_region = '',
            get_all_currency = True,
            get_inactive_currency = False,
            get_first_currency_only = False,
            ids_currency = '',
            get_all_discount = True,
            get_inactive_discount = False,
            ids_discount = '',
            get_products_quantity_stock_below_min = True
        )