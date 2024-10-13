"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: DataStores
Feature:    Store Stripe DataStore

Description:
Datastore for Store Stripe service
"""

# internal
# from routes import bp_home
import lib.argument_validation as av
from business_objects.store.basket import Basket, Basket_Item
from business_objects.store.product_category import Product_Category_Container, Product_Category
from business_objects.currency import Currency
from business_objects.store.image import Image
from business_objects.store.delivery_option import Delivery_Option
from business_objects.region import Region
from business_objects.store.discount import Discount
from business_objects.store.order import Order
from business_objects.store.product import Product, Product_Permutation, Product_Price, Parameters_Product
from business_objects.sql_error import SQL_Error
from business_objects.store.stock_item import Stock_Item
from business_objects.user import User, User_Filters, User_Permission_Evaluation
from business_objects.store.product_variation import Product_Variation, Product_Variation_Filters, Product_Variation_Container
from datastores.datastore_store_base import DataStore_Store_Base
# from helpers.helper_db_mysql import Helper_DB_MySQL
# from models.model_view_store_checkout import Model_View_Store_Checkout # circular!
from extensions import db
# external
# from abc import ABC, abstractmethod, abstractproperty
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text
import stripe
import os
from flask import Flask, session, current_app
from pydantic import BaseModel, ConfigDict
from typing import ClassVar
from datetime import datetime

# db = SQLAlchemy()


class DataStore_Store_Stripe(DataStore_Store_Base):
    # Global constants
    # Attributes
    key_public_stripe: str = None
    key_secret_stripe: str = None

    def __init__(self):
        super().__init__()
        self.key_secret_stripe = os.environ.get("KEY_SECRET_STRIPE")
        self.key_public_stripe = os.environ.get("KEY_PUBLIC_STRIPE")
        
        # For sample support and debugging, not required for production:
        stripe.set_app_info(
            'stripe-samples/checkout-one-time-payments',
            version='0.0.1',
            url='https://github.com/stripe-samples/checkout-one-time-payments')
        stripe.api_key = self.key_secret_stripe

    def get_many_stripe_product_new(self):
        _m  = 'DataStore_Store_Stripe.get_many_stripe_product_new'
        _m_db = 'p_shop_get_many_stripe_product_new'
        # av.val_str(id_user)
        # validation conducted by server

        argument_dict_list = {
            'a_id_user': self.info_user
        }

        print(f'executing {_m_db}')
        result = self.db_procedure_execute(_m_db, argument_dict_list)
        cursor = result.cursor
        print('data received')

        
        # Products
        cursor.nextset()
        result_set_1 = cursor.fetchall()
        products = []
        for row in result_set_1:
            new_product = Product.from_DB_Stripe_product(row) # Product(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9], row[10], row[11], row[12], row[13], row[14], row[15], row[16], row[17], row[18], row[19])
            products.append(new_product)
        print(f'products: {products}')        
        
        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_e]
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")

        DataStore_Store_Stripe.db_cursor_clear(cursor)

        return products
    
    def get_many_stripe_price_new(self):
        _m  = 'DataStore_Store_Stripe.get_many_stripe_price_new'
        _m_db = 'p_shop_get_many_stripe_price_new'
        # av.val_str(id_user)
        # validation conducted by server

        argument_dict_list = {
            'a_id_user': self.info_user
        }

        print(f'executing {_m_db}')
        result = self.db_procedure_execute(_m_db, argument_dict_list)
        cursor = result.cursor
        print('data received')

        
        # Products
        cursor.nextset()
        result_set_1 = cursor.fetchall()
        products = []
        for row in result_set_1:
            new_product = Product.from_DB_Stripe_price(row) # Product(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9], row[10], row[11], row[12], row[13], row[14], row[15], row[16], row[17], row[18], row[19])
            products.append(new_product)
        print(f'products: {products}')        
        
        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_e]
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")

        DataStore_Store_Stripe.db_cursor_clear(cursor)

        return products
    
    def get_many_product_new(self):
        _m  = 'DataStore_Store_Stripe.get_many_product_new'
        # Stripe
        new_products = self.get_many_stripe_product_new()
        for product in new_products:
            product.id_stripe_product = self.create_stripe_product(product)
        return new_products
    
    def get_many_price_new(self):
        _m  = 'DataStore_Store_Stripe.get_many_product_new'
        # Stripe
        new_products = self.get_many_stripe_price_new()
        for product in new_products:
            product.id_stripe_price = self.create_stripe_price(product)
        return new_products

    # Stripe
    def create_stripe_product(self, product): # _name, product_description):
        _m  = 'DataStore_Store_Stripe_Checkout.create_stripe_product'
        # av.val_str(product_name, 'product_name', _m)
        # av.val_str(product_description, 'product_description', _m)
        av.val_instance(product, 'product', _m, Product)

        print(f'stripe.api_key = {stripe.api_key}')
        new_product = stripe.Product.create(
            name = product.name,
            description = product.description,
        )

        # Save these identifiers
        print(f"Success! Here is your new Stripe product id: {new_product.id}")

        return new_product.id
    
    def create_stripe_price(self, product, currency): # product_id, product_price, product_currency, product_is_subscription, product_recurring_interval = '', product_interval_count = 0):
        _m  = 'DataStore_Store_Stripe_Checkout.create_stripe_price'
        """
        av.val_str(p_id, 'p_id', _m)
        av.full_val_float(p_price, 'p_price', _m, 0.01)
        p_price = round(p_price, 2)
        av.val_str(p_currency, 'p_currency', _m)
        av.full_val_bool(p_is_subscription, 'p_is_subscription', _m)
        p_is_subscription = bool(p_is_subscription)
        av.val_str(p_recurring_interval, 'p_recurring_interval', _m)
        av.full_val_int(p_interval_count, 'p_interval_count', _m, 1 if p_is_subscription else 0)
        p_interval_count = int(p_interval_count)
        """
        av.val_instance(product, 'product', _m, Product)
        av.val_str(currency, 'currency', _m)

        print(f'stripe.api_key = {stripe.api_key}')

        new_product_price = stripe.Price.create(
            unit_amount = product.unit_price,
            currency = currency,
            recurring = { "interval": product.name_recurring_interval, "interval_count": product.count_recurring_interval } if product.is_subscription else None,
            product = product.id_stripe_product
        )

        # Save these identifiers
        print(f"Success! Here is your Stripe product price id: {new_product_price.id} for {product.name}")

        return new_product_price.id
    