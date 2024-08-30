"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: DataStores
Feature:    Base Store DataStore

Description:
Datastore for Store
"""

# internal
# from routes import bp_home
import lib.argument_validation as av
from business_objects.store.basket import Basket, Basket_Item
from business_objects.store.product_category import Container_Product_Category, Product_Category
from business_objects.store.currency import Currency
from business_objects.store.image import Image
from business_objects.store.delivery_option import Delivery_Option
from business_objects.store.delivery_region import Delivery_Region
from business_objects.store.discount import Discount
from business_objects.store.order import Order
from business_objects.store.product import Product, Product_Permutation, Product_Price, Product_Filters 
from business_objects.sql_error import SQL_Error
from business_objects.store.stock_item import Stock_Item, Stock_Item_Filters
from business_objects.user import User, User_Filters, User_Permission_Evaluation
from business_objects.store.product_variation import Product_Variation, Product_Variation_Filters, Product_Variation_List
from datastores.datastore_base import DataStore_Base
from helpers.helper_db_mysql import Helper_DB_MySQL
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


class DataStore_Store_Base(DataStore_Base):
    # Global constants
    KEY_BASKET: ClassVar[str] = Basket.KEY_BASKET
    KEY_IS_INCLUDED_VAT: ClassVar[str] = Basket.KEY_IS_INCLUDED_VAT # 'is_included_VAT'
    KEY_ID_CURRENCY: ClassVar[str] = Basket.KEY_ID_CURRENCY # 'id_currency'
    KEY_ID_REGION_DELIVERY: ClassVar[str] = Basket.KEY_ID_REGION_DELIVERY # 'id_region_delivery'
    # Attributes

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

    def get_many_product(self, product_filters):
        # redundant argument validation? 
        _m = 'DataStore_Store_Base.get_many_product'
        av.val_instance(product_filters, 'product_filters', _m, Product_Filters) 
        argument_dict = product_filters.to_json()
        user = self.get_user_session()
        argument_dict['a_id_user'] = 1 # 'auth0|6582b95c895d09a70ba10fef' # id_user
        print(f'argument_dict: {argument_dict}')
        print('executing p_shop_get_many_product')
        result = self.db_procedure_execute('p_shop_get_many_product', argument_dict)
        cursor = result.cursor
        print('data received')
        
        
        category_list = Container_Product_Category()
        # Categories
        result_set_1 = cursor.fetchall()
        print(f'raw categories: {result_set_1}')
        # categories = [Product_Category(row[0], row[1], row[2], row[3]) for row in result_set_1]
        # categories = []
        # category_index = {}
        for row in result_set_1:
            new_category = Product_Category.from_DB_product(row) # Product_Category(row[0], row[1], row[2], row[3])
            # category_index[new_category.id_category] = len(categories)
            # categories.append(new_category)
            category_list.add_category(new_category)
        # print(f'categories: {[c.id_category for c in categories]}')

        # Products
        cursor.nextset()
        result_set_2 = cursor.fetchall()
        # print(f'products: {result_set_2}')
        products = [] # [Product(**row) for row in result_set_2]
        product_index = {}
        for row in result_set_2:
            new_permutation = Product_Permutation.from_DB_product(row) # (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9], row[10], row[11], row[12], row[13], row[14], row[15], row[16], row[17], row[18], row[19])
            index_category = category_list.get_index_category_from_id(new_permutation.id_category)
            category = category_list.categories[index_category]
            try:
                index_product = category.get_index_product_from_id(new_permutation.id_product)
                category_list.add_permutation(new_permutation)
                # product = products[index_product]
                # product.add_permutation(new_permutation)
            except KeyError:
                product_index[new_permutation.id_product] = len(products)
                product = Product.from_DB_product(row)
                product.add_permutation(new_permutation)
                products.append(product)
                # categories[category_index[new_product.id_category]].add_product(new_product)
                category_list.add_product(product)
            # category_list.add_permutation(new_permutation)
        # print(f'products: {[p.id_product for p in products]}') # {products}')
        print(f'category_list: {category_list}')

        # Product_Variations
        cursor.nextset()
        result_set_3 = cursor.fetchall()
        # print(f'variations: {result_set_3}')
        # variations = [Product_Variation(**row) for row in result_set_3]
        variations = []
        for row in result_set_3:
            new_variation = Product_Variation.from_DB_product(row) # (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7])
            variations.append(new_variation)
            # products[product_index[new_variation.id_product]].variations.append(new_variation)
            # index_category = category_index[new_variation.id_category]
            # index_product = categories[index_category].index_product_from_ids_product_permutation(new_variation.id_product, new_variation.id_permutation)
            # categories[index_category].products[index_product].variations.append(new_variation)
            category_list.add_variation(new_variation)
        # print(f'variations: {variations}')
        # print(f'products: {[p.id_product for p in products]}')

        # Images
        cursor.nextset()
        result_set_5 = cursor.fetchall()
        # print(f'images: {result_set_4}')
        # images = [Image(**row) for row in result_set_4]
        images = []
        for row in result_set_5:
            new_image = Image.from_DB_product(row) # (row[0], row[1], row[2], row[3], row[4])
            images.append(new_image)
            # products[product_index[new_image.id_product]].images.append(new_image)
            """
            index_category = category_index[new_image.id_category]
            index_product = categories[index_category].index_product_from_ids_product_permutation(new_image.id_product, new_image.id_permutation)
            categories[index_category].products[index_product].images.append(new_image)
            """
            category_list.add_image(new_image)
        # print(f'images: {images}')
        # print(f'products: {[p.id_product for p in products]}')
        
        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        errors = []
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # (row[0], row[1])
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")
        
        category_list.get_all_variation_trees()
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
                    ids_permutation_unavailable = DataStore_Store_Base.get_ids_permutation_from_error_availability(error.msg)
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
        
        
        DataStore_Store_Base.db_cursor_clear(cursor)

        return category_list, errors # categories, category_index
    
    """
    def get_many_id_price(self, product_ids):
        _m = 'DataStore_Store_Base.get_many_id_price'
        av.val_str(product_ids, 'product_ids', _m)
        price_ids = []
        for product_id in product_ids.split(','):
            if product_id == 'prod_PB0NUOSEs06ymG':
                price_ids.append() # get price id
        return price_ids
    """
    
    def get_ids_permutation_from_error_availability(msg_error_availability):
        ids_permutation = []
        index_colon = msg_error_availability.find(':', msg_error_availability.find(':'))
        msg_error_availability = msg_error_availability[index_colon + 1:]
        index_comma = 0
        while index_comma > -1:
            msg_error_availability = msg_error_availability[index_comma:]
            index_comma = msg_error_availability.find(',')
            ids_permutation.append(msg_error_availability[:index_comma])
        return ids_permutation
    
    def get_regions_and_currencies(self):
        _m  = 'DataStore_Store_Base.get_regions_and_currencies'
        _m_db_currency = 'p_shop_get_many_currency'
        _m_db_region = 'p_shop_get_many_region'

        argument_dict_list_currency = {
            'a_get_inactive_currency': 0
        }
        argument_dict_list_region = {
            'a_get_inactive_currency': 0
        }

        print(f'executing {_m_db_currency}')
        result = self.db_procedure_execute(_m_db_currency, argument_dict_list_currency)
        cursor = result.cursor
        print('data received')

        # cursor.nextset()
        result_set_1 = cursor.fetchall()
        currencies = []
        for row in result_set_1:
            currency = Currency.from_DB_currency(row)
            currencies.append(currency)
        print(f'currencies: {currencies}')
        DataStore_Store_Base.db_cursor_clear(cursor)

        print(f'executing {_m_db_region}')
        result = self.db_procedure_execute(_m_db_region, argument_dict_list_region)
        cursor = result.cursor
        print('data received')

        # cursor.nextset()
        result_set_1 = cursor.fetchall()
        regions = []
        for row in result_set_1:
            region = Delivery_Region.from_DB_region(row)
            regions.append(region)
        print(f'regions: {regions}')
        DataStore_Store_Base.db_cursor_clear(cursor)

        return regions, currencies
    
    def get_many_product_variation(self, variation_filters):
        _m = 'DataStore_Store_Base.get_many_product_variation'
        print(_m)
        av.val_instance(variation_filters, 'variation_filters', _m, Product_Variation_Filters)

        guid = Helper_DB_MySQL.create_guid()
        # now = datetime.now()
        # user = self.get_user_session()
        
        """
        argument_dict_list = {
            'a_id_user': id_user,
            'a_comment': comment,
            'a_guid': guid
        }
        """
        user = self.get_user_session()
        argument_dict_list = {
            # 'a_guid': guid
            'a_id_user': user.id_user
            , **variation_filters.to_json()
        }
        # argument_dict_list['a_guid'] = guid
        result = self.db_procedure_execute('p_shop_get_many_product_variation', argument_dict_list)

        cursor = result.cursor
        result_set = cursor.fetchall()
        
        # Product_Variations
        variations = Product_Variation_List()
        for row in result_set:
            new_variation = Product_Variation.from_DB_variation(row) 
            variations.add_variation(new_variation)

        errors = []
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_e]
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")

        DataStore_Store_Base.db_cursor_clear(cursor)

        return variations, errors