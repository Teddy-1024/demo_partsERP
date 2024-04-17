"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Order Business Object

Description:
Business object for order
"""

# IMPORTS
# VARIABLE INSTANTIATION
# CLASSES
# METHODS

# IMPORTS
# internal
import lib.argument_validation as av
# from lib import data_types
from business_objects.product import Product
from business_objects.delivery_option import Delivery_Option
# from forms import Form_Product
# from models.model_view_store import Model_View_Store # circular
# external
# from enum import Enum
from flask import jsonify
import locale


# VARIABLE INSTANTIATION

# CLASSES
class Order():
    category: str
    product: Product
    quantity: int
    subtotal: float
    delivery_option: Delivery_Option
    # form: Form_Product

    def __new__(cls, category, product, quantity):
        # Initialiser - validation
        _m = 'Product.__new__'
        v_arg_type = 'class attribute'
        av.val_str(category, 'category', _m, v_arg_type=v_arg_type)
        av.val_instance(product, 'product', _m, Product, v_arg_type=v_arg_type)
        av.full_val_float(quantity, 'quantity', _m, product.quantity_min, v_arg_type=v_arg_type)
        return super(Basket_Item, cls).__new__(cls)
    
    def __init__(self, category, product, quantity):
        # Constructor
        self.category = category
        self.product = product
        self.quantity = quantity
        self.subtotal = round(self.product.price_GBP_full * self.quantity, 2)
        """
        self.form = Form_Product()
        if self.form.validate_on_submit():
            # Handle form submission

            pass
        """

    def update_quantity(self, quantity):
        _m = 'Basket_Item.update_quantity'
        v_arg_type = 'class attribute'
        av.full_val_float(quantity, 'quantity', _m, self.product.quantity_min, v_arg_type=v_arg_type)
        self.quantity = quantity
        self.subtotal = round(self.product.price_GBP_full * self.quantity, 2)

    def jsonify(self):
        return jsonify(self)
    
    def to_json(self):
        return {
            'product_id': self.product.id_product,
            'price': self.product.price_GBP_full,
            'quantity': self.quantity
        }
    
    def output_subtotal(self):
        locale.setlocale(locale.LC_ALL, '')
        return locale.format_string("%d", self.subtotal, grouping=True)
    
    def __repr__(self):
        return f'''
            category: {self.category}
            product: {self.product}
            quantity: {self.quantity}
            subtotal: {self.subtotal}
            '''