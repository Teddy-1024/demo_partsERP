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
from business_objects.store.basket import Basket, Basket_Item
from business_objects.store.product_category import Product_Category_Container, Product_Category
from business_objects.currency import Currency
from business_objects.store.image import Image
from business_objects.store.delivery_option import Delivery_Option
from business_objects.region import Region
from business_objects.store.discount import Discount
from business_objects.store.order import Order
from business_objects.store.product import Product, Product_Permutation, Parameters_Product 
from business_objects.sql_error import SQL_Error
from business_objects.store.stock_item import Stock_Item
from business_objects.user import User, User_Filters, User_Permission_Evaluation
from business_objects.store.product_variation import Product_Variation_Type, Product_Variation, Product_Variation_Filters, Product_Variation_Container
from datastores.datastore_base import DataStore_Base
from extensions import db
from helpers.helper_db_mysql import Helper_DB_MySQL
import lib.argument_validation as av
# from models.model_view_store_checkout import Model_View_Store_Checkout # circular!
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


class DataStore_Store_Base(DataStore_Base):
    # Global constants
    KEY_BASKET: ClassVar[str] = Basket.KEY_BASKET
    KEY_IS_INCLUDED_VAT: ClassVar[str] = Basket.KEY_IS_INCLUDED_VAT # 'is_included_VAT'
    KEY_ID_CURRENCY: ClassVar[str] = Basket.KEY_ID_CURRENCY # 'id_currency'
    KEY_ID_REGION_DELIVERY: ClassVar[str] = Basket.KEY_ID_REGION_DELIVERY # 'id_region_delivery'
    # Attributes

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
    @classmethod
    def get_many_product(cls, product_filters):
        # redundant argument validation? 
        _m = 'DataStore_Store_Base.get_many_product'
        av.val_instance(product_filters, 'product_filters', _m, Parameters_Product) 
        argument_dict = product_filters.to_json()
        user = cls.get_user_session()
        """
        argument_dict['a_id_user'] = user.id_user # 'auth0|6582b95c895d09a70ba10fef' # id_user
        argument_dict['a_debug'] = 0
        """
        argument_dict = {
            'a_id_user': user.id_user
            , **argument_dict
            , 'a_debug': 0
        }
        print(f'argument_dict: {argument_dict}')
        print('executing p_shop_get_many_product')
        result = cls.db_procedure_execute('p_shop_get_many_product', argument_dict)
        cursor = result.cursor
        print('data received')
        
        
        category_list = Product_Category_Container()
        print(f'initial category_list: {category_list}')

        # Categories
        result_set_1 = cursor.fetchall()
        print(f'raw categories: {result_set_1}')
        for row in result_set_1:
            new_category = Product_Category.from_DB_get_many_product_catalogue(row)
            print(f'new_category: {new_category}')
            category_list.add_product_category(new_category)

        print(f'category-loaded category_list: {category_list}')

        # Products
        cursor.nextset()
        result_set_2 = cursor.fetchall()
        print(f'raw products: {result_set_2}')
        for row in result_set_2:
            print(f'row: {row}')
            new_product = Product.from_DB_get_many_product_catalogue(row)
            print(f'new_product: {new_product}')
            try:
                category_list.add_product(new_product)
            except Exception as e:
                print(f'Error adding product: {e}')

        # Permutations
        cursor.nextset()
        result_set_3 = cursor.fetchall()
        for row in result_set_3:
            new_permutation = Product_Permutation.from_DB_get_many_product_catalogue(row)
            try:
                category_list.add_product_permutation(new_permutation)
            except Exception as e:
                print(f'Error adding permutation: {e}')

        # Product_Variations
        cursor.nextset()
        result_set_4 = cursor.fetchall()
        for row in result_set_4:
            new_variation = Product_Variation.from_DB_get_many_product_catalogue(row)
            try:
                category_list.add_product_variation(new_variation)
            except Exception as e:
                print(f'Error adding variation: {e}')

        # Images
        cursor.nextset()
        result_set_5 = cursor.fetchall()
        for row in result_set_5:
            new_image = Image.from_DB_get_many_product_catalogue(row)
            category_list.add_product_image(new_image)
        
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
        cursor.close()

        print(f'get many category_list: {category_list}')
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
    @staticmethod
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
    @classmethod
    def get_many_currency(cls):
        _m  = 'DataStore_Store_Base.get_many_currency'
        _m_db_currency = 'p_shop_get_many_currency'

        argument_dict_list_currency = {
            'a_get_inactive_currency': 0
        }

        print(f'executing {_m_db_currency}')
        result = cls.db_procedure_execute(_m_db_currency, argument_dict_list_currency)
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

        return currencies
    
    @classmethod
    def get_many_region(cls):
        _m  = 'DataStore_Store_Base.get_many_region'
        _m_db_region = 'p_shop_get_many_region'

        argument_dict_list_region = {
            'a_get_inactive_currency': 0
        }

        print(f'executing {_m_db_region}')
        result = cls.db_procedure_execute(_m_db_region, argument_dict_list_region)
        cursor = result.cursor
        print('data received')

        # cursor.nextset()
        result_set_1 = cursor.fetchall()
        regions = []
        for row in result_set_1:
            region = Region.from_DB_region(row)
            regions.append(region)
        print(f'regions: {regions}')
        DataStore_Store_Base.db_cursor_clear(cursor)
        cursor.close()

        return regions
    
    @classmethod
    def get_many_region_and_currency(cls):
        _m  = 'DataStore_Store_Base.get_many_region_and_currency'
        currencies = cls.get_many_currency()
        regions = cls.get_many_region()
        return regions, currencies
    
    @classmethod
    def get_many_product_variation(cls, variation_filters):
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
        user = cls.get_user_session()
        argument_dict_list = {
            # 'a_guid': guid
            'a_id_user': user.id_user
            , **variation_filters.to_json()
            , 'a_debug': 0
        }
        # argument_dict_list['a_guid'] = guid
        result = cls.db_procedure_execute('p_shop_get_many_product_variation', argument_dict_list)

        cursor = result.cursor
        result_set_vt = cursor.fetchall()
        
        # Product_Variation Types
        # variation_container = Product_Variation_Container()
        variation_types = []
        variation_types_dict = {}
        for row in result_set_vt:
            new_variation_type = Product_Variation_Type.from_DB_get_many_product_variation(row) 
            # variation_container.add_product_variation_type(new_variation_type)
            variation_types.append(new_variation_type)
            variation_types_dict[new_variation_type.id_type] = new_variation_type

        print(f'variation_types_dict: {variation_types_dict}')

        # Product_Variations
        cursor.nextset()
        result_set_v = cursor.fetchall()
        # variations = Product_Variation_Container()
        variations = []
        for row in result_set_v:
            new_variation = Product_Variation.from_DB_get_many_product_variation(row)
            new_variation.variation_type = variation_types_dict[new_variation.id_type]
            # variation_container.add_product_variation(new_variation)
            variations.append(new_variation)

        errors = []
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_e]
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")

        DataStore_Store_Base.db_cursor_clear(cursor)
        
        cursor.close()

        return variation_types, variations, errors
    