"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: DataStores
Feature:    Store Stock Item DataStore

Description:
Datastore for Store Stock Items
"""

# internal
# from routes import bp_home
import lib.argument_validation as av
from business_objects.store.basket import Basket, Basket_Item
from business_objects.store.product_category import Product_Category_Container, Product_Category
from business_objects.store.currency import Currency
from business_objects.store.image import Image
from business_objects.store.delivery_option import Delivery_Option
from business_objects.store.delivery_region import Delivery_Region
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


class DataStore_Store_Stock_Item(DataStore_Store_Base):
    # Global constants
    # Attributes

    def __init__(self):
        super().__init__()

    # Stock Items
    def get_many_stock_item(self, Parameters_Stock_Item, category_list):
        # redundant argument validation? 
        _m = 'DataStore_Store_Stock_Item.get_many_stock_item'
        av.val_instance(Parameters_Stock_Item, 'Parameters_Stock_Item', _m, Parameters_Stock_Item)
        argument_dict = Parameters_Stock_Item.to_json()
        user = self.get_user_session()
        argument_dict['a_id_user'] = user.id_user # 1 # 'auth0|6582b95c895d09a70ba10fef' # id_user
        argument_dict['a_debug'] = 0
        print(f'argument_dict: {argument_dict}')
        print('executing p_shop_get_many_stock_item')
        result = self.db_procedure_execute('p_shop_get_many_stock_item', argument_dict)
        cursor = result.cursor
        print('data received')
        # categories, category_index = DataStore_Store_Stock_Item.input_many_product(cursor)
        category_list, errors = DataStore_Store_Stock_Item.input_many_stock_item(cursor, category_list)
        DataStore_Store_Stock_Item.db_cursor_clear(cursor)

        return category_list, errors # categories, category_index


    def input_many_stock_item(cursor, category_list):
        _m = 'DataStore_Store_Stock_Item.input_many_stock_item'
        result_set_1 = cursor.fetchall()
        print(f'raw categories: {result_set_1}')
        for row in result_set_1:
            new_stock_item = Stock_Item.from_DB_stock_item(row)
            category_list.add_stock_item(new_stock_item, row)
        
        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        errors = []
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # (row[0], row[1])
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")
        """
        if len(errors) > 0:
            for error in errors:
                if error.code == 'PRODUCT_AVAILABILITY':
                    ids_permutation_unavailable = DataStore_Store_Stock_Item.get_ids_permutation_from_error_availability(error.msg)
                    for id_permutation in ids_permutation_unavailable:
                        index_category = category_list.get_index_category_from_id_permutation(id_permutation)
                        category = category_list.categories[index_category]
                        index_product = category.get_index_product_from_id_permutation(id_permutation)
                        product = category.products[index_product]
                        index_permutation = product.get_index_permutation_from_id(id_permutation)
                        permutation = product.permutations[index_permutation]
                        permutation.is_available = False
                        if 'region' in error.msg or 'currency' in error.msg:
                            permutation.is_unavailable_in_currency_or_region = True
        """
        return category_list, errors # categories, category_index
    