"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: DataStores
Feature:    Store Product Variation DataStore

Description:
Datastore for Store Product Variations
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


class DataStore_Store_Product_Variation(DataStore_Store_Base):
    # Global constants
    # Attributes

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

    def get_many_product_variation(self, variation_filters):
        _m = 'DataStore_Store_Product_Variation.get_many_product_variation'
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
        variations = Product_Variation_Container()
        for row in result_set:
            new_variation = Product_Variation.from_DB_variation(row) 
            variations.add_product_variation(new_variation)

        errors = []
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_e]
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")

        DataStore_Store_Product_Variation.db_cursor_clear(cursor)

        return variations, errors