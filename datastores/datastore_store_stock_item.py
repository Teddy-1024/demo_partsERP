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
from business_objects.store.product import Product, Product_Permutation, Product_Price, Filters_Product 
from business_objects.sql_error import SQL_Error
from business_objects.store.stock_item import Stock_Item, Stock_Item_Filters
from business_objects.user import User, User_Filters, User_Permission_Evaluation
from business_objects.store.product_variation import Product_Variation, Product_Variation_Filters, Product_Variation_List
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
    def get_many_stock_item(self, stock_item_filters):
        # redundant argument validation? 
        _m = 'DataStore_Store_Stock_Item.get_many_stock_item'
        av.val_instance(stock_item_filters, 'stock_item_filters', _m, Stock_Item_Filters)
        argument_dict = stock_item_filters.to_json()
        user = self.get_user_session()
        argument_dict['a_id_user'] = 1 # 'auth0|6582b95c895d09a70ba10fef' # id_user
        print(f'argument_dict: {argument_dict}')
        print('executing p_shop_get_many_stock_item')
        result = self.db_procedure_execute('p_shop_get_many_stock_item', argument_dict)
        cursor = result.cursor
        print('data received')
        # categories, category_index = DataStore_Store_Stock_Item.input_many_product(cursor)
        category_list, errors = DataStore_Store_Stock_Item.input_many_stock_item(cursor)
        DataStore_Store_Stock_Item.db_cursor_clear(cursor)

        return category_list, errors # categories, category_index


    def input_many_stock_item(cursor):
        _m = 'DataStore_Store_Stock_Item.input_many_stock_item'
        category_list = Product_Category_Container()
        # Categories
        result_set_1 = cursor.fetchall()
        print(f'raw categories: {result_set_1}')
        for row in result_set_1:
            new_stock_item = Stock_Item.from_DB_stock_item(row)
            # category_list.add_stock_item(new_stock_item, row)
            try:
                index_category = category_list.get_index_category_from_id(new_stock_item.id_category)
                # category_list.add_stock_item(new_stock_item)
                category = category_list.categories[index_category]
                """
                try:
                    index_product = category.get_index_product_from_id(new_stock_item.id_product)
                    product = category.products[index_product]
                    try:
                        index_permutation = product.get_index_permutation_from_id(new_stock_item.id_permutation)
                        permutation = product.permutations[index_permutation]
                        permutation.add_stock_item(new_stock_item)
                    except KeyError:
                        permutation = Product_Permutation.from_DB_stock_item(row)
                        permutation.add_stock_item(new_stock_item)
                        product.add_product_permutation(permutation)
                except KeyError:
                    product = Product.from_DB_stock_item(row)
                    permutation = Product_Permutation.from_DB_stock_item(row)
                    permutation.add_stock_item(new_stock_item)
                    product.add_product_permutation(permutation)
                    category_list.add_product(product)
                """
            except KeyError:
                new_category = Product_Category.from_DB_stock_item(row)
                """
                product = Product.from_DB_stock_item(row)
                permutation = Product_Permutation.from_DB_stock_item(row)
                permutation.add_stock_item(new_stock_item)
                product.add_product_permutation(permutation)
                new_category.add_product(product)
                """
                category_list.add_product_category(new_category)
            try:
                index_product = category.get_index_product_from_id(new_stock_item.id_product)
                product = category.products[index_product]
            except KeyError:
                new_product = Product.from_DB_stock_item(row)
                category_list.add_product(new_product)
            try:
                index_permutation = product.get_index_permutation_from_id(new_stock_item.id_permutation)
                permutation = product.permutations[index_permutation]
                permutation.add_stock_item(new_stock_item)
            except KeyError:
                new_permutation = Product_Permutation.from_DB_stock_item(row)
                product.add_product_permutation(new_permutation)
            category_list.add_stock_item(new_stock_item)
        
        # Product_Variations
        cursor.nextset()
        result_set_3 = cursor.fetchall()
        variations = []
        for row in result_set_3:
            new_variation = Product_Variation.from_DB_get_many_product_catalogue(row)
            variations.append(new_variation)
            category_list.add_product_variation(new_variation)
        
        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        errors = []
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # (row[0], row[1])
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")
        
        category_list.get_all_product_variation_trees()
        """
        for category in category_list.categories:
            print(f'category: {category.name}')
            for product in category.products:
                permutation = product.get_permutation_selected()
                print(f'product: {product.name}\nselected permutation: {permutation}')
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
        
        return category_list, errors # categories, category_index
    