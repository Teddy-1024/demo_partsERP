"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Basket Business Object

Description:
Business object for basket
"""

# IMPORTS
# VARIABLE INSTANTIATION
# CLASSES
# METHODS

# IMPORTS
# internal
import lib.argument_validation as av
# from lib import data_types
from business_objects.store.product import Product #, Filters_Product
from business_objects.store.discount import Discount
from business_objects.store.delivery_option import Delivery_Option
# from forms import Form_Product
# from models.model_view_store import Model_View_Store # circular
# from datastores.datastore_store import DataStore_Store # circular
# from forms import Form_Basket_Add, Form_Basket_Edit # possibly circular
# external
# from enum import Enum
from flask import jsonify
import locale


# VARIABLE INSTANTIATION

# CLASSES
class Basket_Item():
    product: Product
    quantity: int
    delivery_option: Delivery_Option
    discounts: list
    # form: Form_Product
    is_included_VAT: bool

    """
    def __init__(self):
        self.is_unavailable_in_currency_or_region = False
        self.is_available = True
    """

    def from_product_and_quantity_and_VAT_included(product, quantity, is_included_VAT):
        # Initialiser - validation
        _m = 'Basket_Item.from_product_and_quantity'
        v_arg_type = 'class attribute'
        av.val_instance(product, 'product', _m, Product, v_arg_type=v_arg_type)
        av.full_val_float(quantity, 'quantity', _m, product.get_quantity_min(), v_arg_type=v_arg_type)
        basket_item = Basket_Item()
        basket_item.product = product
        basket_item.quantity = quantity
        basket_item.is_included_VAT = is_included_VAT
        return basket_item
    
    def add_discount(self, discount):
        av.val_instance(discount, 'discount', 'Basket_Item.add_discount', Discount, v_arg_type='class attribute')
        self.discounts.append(discount)

    def set_delivery_option(self, delivery_option):
        av.val_instance(delivery_option, 'delivery_option', 'Basket_Item.set_delivery_option', Delivery_Option, v_arg_type='class attribute')
        self.delivery_option = delivery_option
    
    def update_quantity(self, quantity):
        _m = 'Basket_Item.update_quantity'
        v_arg_type = 'class attribute'
        av.full_val_float(quantity, 'quantity', _m, self.product.get_quantity_min(), v_arg_type=v_arg_type)
        self.quantity = quantity

    def jsonify(self):
        return jsonify(self)
    
    def to_json(self):
        permutation = self.product.get_permutation_selected()
        return {
            'product_id': self.product.id_product,
            'permutation_id': permutation.id_permutation,
            'price': permutation.output_price(self.is_included_VAT),
            'quantity': self.quantity
        }
    
    def get_subtotal(self):
        permutation = self.product.get_permutation_selected()
        return round(self.product.get_price_local(self.is_included_VAT) * self.quantity, 2) if permutation.is_available else 0
    
    def output_currency(self):
        return self.product.output_currency()
    
    def output_subtotal(self):
        locale.setlocale(locale.LC_ALL, '')
        subtotal = self.get_subtotal()
        permutation = self.product.get_permutation_selected()
        return 'Not available in this currency or region' if permutation.is_unavailable_in_currency_or_region else 'Not available' if not permutation.is_available else f'{self.product.output_currency()} {locale.format_string("%d", subtotal, grouping=True)}'
    
    def __repr__(self):
        return f'''
            product: {self.product}
            quantity: {self.quantity}
            subtotal: {self.get_subtotal()}
            '''

class Basket():
    KEY_BASKET: str = 'basket'
    KEY_ID_CURRENCY: str = 'id_currency'
    KEY_ID_REGION_DELIVERY: str = 'id_region_delivery'
    KEY_IS_INCLUDED_VAT: str = 'is_included_VAT'
    KEY_ITEMS: str = 'items'
    items: list
    is_included_VAT: bool
    id_region_delivery: int
    id_currency: int
    
    def __init__(self, is_included_VAT, id_currency, id_region_delivery):
        self.items = []
        self.is_included_VAT = is_included_VAT
        self.id_currency = id_currency
        self.id_region_delivery = id_region_delivery
    def add_item(self, item):
        av.val_instance(item, 'item', 'Basket.add_item', Basket_Item)
        self.items.append(item)
    def to_csv(self):
        ids_permutation = ''
        quantities_permutation = ''
        for b_i in range(len(self.items)):
            basket_item = self.items[b_i]
            product = basket_item.product
            if b_i > 0:
                ids_permutation += ','
                quantities_permutation += ','
            ids_permutation += str(product.get_id_permutation())
            quantities_permutation += str(basket_item.quantity)
        print(f'ids_permutation_basket = {ids_permutation}')
        print(f'quantities_permutation_basket = {quantities_permutation}')
        return ids_permutation, quantities_permutation
    def to_json_list(self):
        json_list = []
        for item in self.items:
            json_list.append(item.to_json())
        return json_list
    def to_json(self):
        return {
            Basket.KEY_ITEMS: self.to_json_list(),
            Basket.KEY_IS_INCLUDED_VAT: self.is_included_VAT,
            Basket.KEY_ID_CURRENCY: self.id_currency,
            Basket.KEY_ID_REGION_DELIVERY: self.id_region_delivery
        }
    def output_total(self):
        sum = 0
        for b_i in self.items:
            sum += b_i.get_subtotal()
        symbol = self.items[0].output_currency() if len(self.items) > 0 else ''

        return f'{symbol} {locale.format_string("%d", sum, grouping=True)}'
    def len(self):
        return len(self.items)
    """
    def get_key_product_index_from_ids_product_permutation(id_product, id_permutation):
        return f'{id_product},{"" if id_permutation is None else id_permutation}'
    """
    def __repr__(self):
        repr = f'Basket:'
        for basket_item in self.items:
            print(f'{basket_item}')
            repr = f'{repr}\n{basket_item}'
        return repr
    
    def get_ids_permutation_unavailable(self):
        ids_permutation = []
        for item in self.items:
            permutation = item.product.get_permutation_selected()
            if not permutation.is_available:
                ids_permutation.append(permutation.id_permutation)
        return ids_permutation