"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: DataStores
Feature:    Base DataStore

Description:
Datastore for Store
"""

# internal
# from routes import bp_home
import lib.argument_validation as av
from business_objects.store.access_level import Access_Level, Filters_Access_Level
from business_objects.store.basket import Basket, Basket_Item
from business_objects.store.product_category import Product_Category_Container, Product_Category
from business_objects.store.currency import Currency
from business_objects.store.image import Image
from business_objects.store.delivery_option import Delivery_Option
from business_objects.store.delivery_region import Delivery_Region
from business_objects.store.discount import Discount
from business_objects.store.order import Order
from business_objects.store.product import Product, Product_Permutation, Product_Price, Filters_Product # Permutation_Variation_Link
from business_objects.sql_error import SQL_Error
from business_objects.store.stock_item import Stock_Item, Stock_Item_Filters
from business_objects.user import User, User_Filters, User_Permission_Evaluation
from business_objects.store.product_variation import Product_Variation, Product_Variation_Filters, Product_Variation_List
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


class DataStore_Base(BaseModel):
    # Global constants
    # Attributes
    """
    app: Flask = None
    db: SQLAlchemy = None
    session: object = None
    """

    # model_config = ConfigDict(arbitrary_types_allowed=True)

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        # Constructor
        """
        self.db = db
        self.app = current_app    
        with self.app.app_context():
            self.session = session
        """
    @staticmethod
    def db_procedure_execute(proc_name, argument_dict_list = None):
        # Argument validation
        _m = 'DataStore_Base.db_procedure_execute'
        av.val_str(proc_name, 'proc_name', _m)
        has_arguments = not str(type(argument_dict_list)) == "<class 'NoneType'>"
        if has_arguments:
            # av.val_list_instances(argument_dict_list, 'argument_dict_list', _m, dict)
            pass
        # Methods
        proc_string = f'CALL {proc_name}('
        if has_arguments:
            arg_keys = list(argument_dict_list.keys())
            for i in range(len(arg_keys)):
                proc_string += f'{"" if i == 0 else ", "}:{arg_keys[i]}'
        proc_string += ')'
        proc_string = text(proc_string)
        print(f'{_m}\nproc_string: {proc_string}\nargs: {argument_dict_list}')

        # with self.db.session.begin() as session:
        # conn = Helper_DB_MySQL(self.app).get_db_connection()

        if has_arguments:
            result = db.session.execute(proc_string, argument_dict_list)
        else:
            result = db.session.execute(proc_string)
        print(f'result: {result}')
        # conn.session.remove()
        return result
        cursor = result.cursor
        result_set_1 = cursor.fetchall()
        print(f'categories: {result_set_1}')
        cursor.nextset()
        result_set_2 = cursor.fetchall()
        print(f'products: {result_set_2}')
    
    @staticmethod
    def db_cursor_clear(cursor):
        while cursor.nextset():
            print(f'new result set: {cursor.fetchall()}')
    @classmethod
    def get_regions_and_currencies(cls):
        _m  = 'DataStore_Base.get_regions_and_currencies'
        _m_db_currency = 'p_shop_get_many_currency'
        _m_db_region = 'p_shop_get_many_region'

        argument_dict_list_currency = {
            'a_get_inactive_currency': 0
        }
        argument_dict_list_region = {
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
            currency = Currency.make_from_DB_currency(row)
            currencies.append(currency)
        print(f'currencies: {currencies}')
        DataStore_Base.db_cursor_clear(cursor)

        print(f'executing {_m_db_region}')
        result = cls.db_procedure_execute(_m_db_region, argument_dict_list_region)
        cursor = result.cursor
        print('data received')

        # cursor.nextset()
        result_set_1 = cursor.fetchall()
        regions = []
        for row in result_set_1:
            region = Delivery_Region.make_from_DB_region(row)
            regions.append(region)
        print(f'regions: {regions}')
        DataStore_Base.db_cursor_clear(cursor)
        cursor.close()

        return regions, currencies
    @staticmethod
    def get_user_session():
        return User.from_json(session.get(User.KEY_USER))
        user = User.get_default()
        try:
            print(f'user session: {session[self.app.ID_TOKEN_USER]}')
            info_user = session[self.app.ID_TOKEN_USER].get('userinfo')
            print(f'info_user: {info_user}')
            user.is_logged_in = ('sub' in list(info_user.keys()) and not info_user['sub'] == '' and not str(type(info_user['sub'])) == "<class 'NoneType'?")
            user.id_user_auth0 = info_user['sub'] if user.is_logged_in else None
            print(f'user.id_user_auth0: {user.id_user_auth0}')
        except:
            print('get user login failed')
        return user
    @staticmethod
    def get_user_auth0():
        return User.from_json_auth0(session.get(current_app.config['ID_TOKEN_USER']))
    @staticmethod
    def upload_bulk(permanent_table_name, records, batch_size):
        _m = 'DataStore_Base.upload_bulk'
        print(f'{_m}\nstarting...')
        try:
            for i in range(0, len(records), batch_size):
                batch = records[i:i+batch_size]
                data = [object.to_json() for object in batch]
                print(f'batch: {batch}\ndata: {data}')
                db.session.bulk_insert_mappings(permanent_table_name, data)
            db.session.commit()
        except Exception as e:
            print(f'{_m}\n{e}')
            db.session.rollback()
            raise e
    @classmethod
    def get_many_access_level(cls, filters):
        _m = 'DataStore_Store_Base.get_many_access_level'
        av.val_instance(filters, 'filters', _m, Filters_Access_Level) 
        argument_dict = filters.to_json()
        # user = cls.get_user_session()
        # argument_dict['a_id_user'] = 1 # 'auth0|6582b95c895d09a70ba10fef' # id_user
        print(f'argument_dict: {argument_dict}')
        print('executing p_shop_get_many_access_level')
        result = cls.db_procedure_execute('p_shop_get_many_access_level', argument_dict)
        cursor = result.cursor
        print('data received')
        
        # access_levels
        result_set_1 = cursor.fetchall()
        print(f'raw access levels: {result_set_1}')
        access_levels = []
        for row in result_set_1:
            new_access_level = Access_Level.from_DB_access_level(row)
            access_levels.append(new_access_level)
            
        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        errors = []
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # (row[0], row[1])
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")
        
        DataStore_Base.db_cursor_clear(cursor)
        cursor.close()

        return access_levels, errors