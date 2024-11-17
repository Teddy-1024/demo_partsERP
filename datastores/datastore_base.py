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
from business_objects.store.access_level import Access_Level
"""
from business_objects.store.basket import Basket, Basket_Item
from business_objects.store.product_category import Product_Category_Container, Product_Category
from business_objects.store.currency import Currency
from business_objects.store.image import Image
from business_objects.store.delivery_option import Delivery_Option
from business_objects.store.discount import Discount
from business_objects.store.order import Order
from business_objects.store.product import Product, Product_Permutation, Product_Price, Parameters_Product # Permutation_Variation_Link
"""
from business_objects.region import Region
from business_objects.sql_error import SQL_Error
from business_objects.store.stock_item import Stock_Item
from business_objects.unit_measurement import Unit_Measurement
from business_objects.user import User, Parameters_User, User_Permission_Evaluation
# from helpers.helper_db_mysql import Helper_DB_MySQL
# from models.model_view_store_checkout import Model_View_Store_Checkout # circular!
from extensions import db
from forms.access_level import Filters_Access_Level
from forms.unit_measurement import Filters_Unit_Measurement
from helpers.helper_app import Helper_App
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
        Helper_App.console_log(f'{_m}\nproc_string: {proc_string}\nargs: {argument_dict_list}')

        # with self.db.session.begin() as session:
        # conn = Helper_DB_MySQL(self.app).get_db_connection()

        if has_arguments:
            result = db.session.execute(proc_string, argument_dict_list)
        else:
            result = db.session.execute(proc_string)
        Helper_App.console_log(f'result: {result}')
        # conn.session.remove()
        return result
        cursor = result.cursor
        result_set_1 = cursor.fetchall()
        Helper_App.console_log(f'categories: {result_set_1}')
        cursor.nextset()
        result_set_2 = cursor.fetchall()
        Helper_App.console_log(f'products: {result_set_2}')
    
    @staticmethod
    def db_cursor_clear(cursor):
        while cursor.nextset():
            Helper_App.console_log(f'new result set: {cursor.fetchall()}')
    @classmethod
    def get_many_region_and_currency(cls):
        _m  = 'DataStore_Base.get_many_region_and_currency'
        _m_db_currency = 'p_shop_get_many_currency'
        _m_db_region = 'p_shop_get_many_region'

        argument_dict_list_currency = {
            'a_get_inactive_currency': 0
        }
        argument_dict_list_region = {
            'a_get_inactive_currency': 0
        }

        Helper_App.console_log(f'executing {_m_db_currency}')
        result = cls.db_procedure_execute(_m_db_currency, argument_dict_list_currency)
        cursor = result.cursor
        Helper_App.console_log('data received')

        # cursor.nextset()
        result_set_1 = cursor.fetchall()
        currencies = []
        for row in result_set_1:
            currency = Currency.make_from_DB_currency(row)
            currencies.append(currency)
        Helper_App.console_log(f'currencies: {currencies}')
        DataStore_Base.db_cursor_clear(cursor)

        Helper_App.console_log(f'executing {_m_db_region}')
        result = cls.db_procedure_execute(_m_db_region, argument_dict_list_region)
        cursor = result.cursor
        Helper_App.console_log('data received')

        # cursor.nextset()
        result_set_1 = cursor.fetchall()
        regions = []
        for row in result_set_1:
            region = Region.make_from_DB_region(row)
            regions.append(region)
        Helper_App.console_log(f'regions: {regions}')
        DataStore_Base.db_cursor_clear(cursor)
        cursor.close()

        return regions, currencies
    @staticmethod
    def get_user_session():
        Helper_App.console_log('DataStore_Base.get_user_session')
        user = User.from_json(session.get(User.FLAG_USER))
        if user.is_logged_in:
            filters_user = Parameters_User.get_default()
            filters_user.ids_user = user.id_user
            users = DataStore_Base.get_many_user(filters_user)
        return user
    @classmethod
    def get_many_user(cls, filters=None):
        _m = 'DataStore_Store_Base.get_many_access_level'
        user = User.from_json(session.get(User.FLAG_USER))
        if filters is None:
            filters_user = Parameters_User.get_default()
            filters_user.ids_user = user.id_user if user.is_logged_in else None
        av.val_instance(filters, 'filters', _m, Parameters_User) 
        argument_dict = filters.to_json()

        argument_dict = {
            'a_id_user': user.id_user,
            'a_id_user_auth0': user.id_user_auth0,
            **argument_dict,
            'a_debug': 0,
        }

        Helper_App.console_log(f'argument_dict: {argument_dict}')
        Helper_App.console_log('executing p_get_many_user')
        result = cls.db_procedure_execute('p_get_many_user', argument_dict)
        cursor = result.cursor
        Helper_App.console_log('data received')
        
        # users
        result_set_1 = cursor.fetchall()
        Helper_App.console_log(f'raw users: {result_set_1}')
        users = []
        for row in result_set_1:
            new_user = User.from_DB_user(row)
            users.append(new_user)
            
        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        Helper_App.console_log(f'raw errors: {result_set_e}')
        errors = []
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # (row[0], row[1])
            for error in errors:
                Helper_App.console_log(f"Error [{error.code}]: {error.msg}")
        
        DataStore_Base.db_cursor_clear(cursor)
        cursor.close()

        return users, errors
    @staticmethod
    def upload_bulk(permanent_table_name, records, batch_size):
        _m = 'DataStore_Base.upload_bulk'
        Helper_App.console_log(f'{_m}\nstarting...')
        Helper_App.console_log(f'permanent_table_name: {permanent_table_name}')
        if db.session.dirty or db.session.new or db.session.deleted:
            Helper_App.console_log("Session is not clean")
            return
        # Assuming `permanent_table_name` is a string representing the table name
        table_object = db.metadata.tables.get(permanent_table_name)
        if table_object is None:
            Helper_App.console_log(f"Table {permanent_table_name} not found in metadata.")
            return
        else:
            expected_columns = set(column.name for column in db.inspect(table_object).columns)
            Helper_App.console_log(f'expected_columns: {expected_columns}')
        try:
            for i in range(0, len(records), batch_size):
                batch = records[i:i+batch_size]
                Helper_App.console_log(f'batch: {batch}')
                db.session.bulk_save_objects(batch)
                """
                data = [object.to_json() for object in batch]
                Helper_App.console_log(f'data: {data}')
                for row in data:
                    row_keys = set(row.keys())
                    if row_keys != expected_columns:
                        Helper_App.console_log(f"Column mismatch in row: {row}")
                        Helper_App.console_log(f'missing columns: {expected_columns - row_keys}')
                        Helper_App.console_log(f'extra columns: {row_keys - expected_columns}')
                # db.session.bulk_insert_mappings(permanent_table_name, data)
                """
            db.session.commit()
        except Exception as e:
            Helper_App.console_log(f'{_m}\n{e}')
            db.session.rollback()
            raise e
    @classmethod
    def get_many_access_level(cls, filters=None):
        _m = 'DataStore_Store_Base.get_many_access_level'
        if filters is None:
            filters = Filters_Access_Level()
        av.val_instance(filters, 'filters', _m, Filters_Access_Level) 
        argument_dict = filters.to_json()
        # user = cls.get_user_session()
        # argument_dict['a_id_user'] = 1 # 'auth0|6582b95c895d09a70ba10fef' # id_user
        Helper_App.console_log(f'argument_dict: {argument_dict}')
        Helper_App.console_log('executing p_shop_get_many_access_level')
        result = cls.db_procedure_execute('p_shop_get_many_access_level', argument_dict)
        cursor = result.cursor
        Helper_App.console_log('data received')
        
        # access_levels
        result_set_1 = cursor.fetchall()
        Helper_App.console_log(f'raw access levels: {result_set_1}')
        access_levels = []
        for row in result_set_1:
            new_access_level = Access_Level.from_DB_access_level(row)
            access_levels.append(new_access_level)
            
        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        Helper_App.console_log(f'raw errors: {result_set_e}')
        errors = []
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # (row[0], row[1])
            for error in errors:
                Helper_App.console_log(f"Error [{error.code}]: {error.msg}")
        
        DataStore_Base.db_cursor_clear(cursor)
        cursor.close()

        return access_levels, errors
    @classmethod
    def get_many_unit_measurement(cls, filters=None):
        _m = 'DataStore_Store_Base.get_many_unit_measurement'
        if filters is None:
            filters = Filters_Unit_Measurement()
        av.val_instance(filters, 'filters', _m, Filters_Unit_Measurement) 
        argument_dict = filters.to_json()
        # user = cls.get_user_session()
        # argument_dict['a_id_user'] = 1 # 'auth0|6582b95c895d09a70ba10fef' # id_user
        Helper_App.console_log(f'argument_dict: {argument_dict}')
        Helper_App.console_log('executing p_shop_get_many_unit_measurement')
        result = cls.db_procedure_execute('p_shop_get_many_unit_measurement', argument_dict)
        cursor = result.cursor
        Helper_App.console_log('data received')
        
        # units of measurement
        result_set_1 = cursor.fetchall()
        Helper_App.console_log(f'raw units of measurement: {result_set_1}')
        units = []
        for row in result_set_1:
            new_unit = Unit_Measurement.from_DB_unit_measurement(row)
            units.append(new_unit)
            
        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        Helper_App.console_log(f'raw errors: {result_set_e}')
        errors = []
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # (row[0], row[1])
            for error in errors:
                Helper_App.console_log(f"Error [{error.code}]: {error.msg}")
        
        DataStore_Base.db_cursor_clear(cursor)
        cursor.close()

        return units, errors
    
    @classmethod
    def get_many_region(cls, get_inactive = False):
        _m  = 'DataStore_Store_Base.get_many_region'
        _m_db_region = 'p_shop_get_many_region'

        argument_dict_list_region = {
            'a_get_inactive_region': 1 if get_inactive else 0
        }

        Helper_App.console_log(f'executing {_m_db_region}')
        result = cls.db_procedure_execute(_m_db_region, argument_dict_list_region)
        cursor = result.cursor
        Helper_App.console_log('data received')

        # cursor.nextset()
        result_set_1 = cursor.fetchall()
        regions = []
        for row in result_set_1:
            region = Region.from_DB_region(row)
            regions.append(region)
        Helper_App.console_log(f'regions: {regions}')
        DataStore_Base.db_cursor_clear(cursor)
        cursor.close()

        return regions