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
from business_objects.sql_error import SQL_Error
from business_objects.store.stock_item import Stock_Item, Parameters_Stock_Item, Stock_Item_Temp
from datastores.datastore_store_base import DataStore_Store_Base
from helpers.helper_app import Helper_App
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

# db = SQLAlchemy()


class DataStore_Store_Stock_Item(DataStore_Store_Base):
    # Global constants
    # Attributes

    def __init__(self):
        super().__init__()

    # Stock Items
    def get_many_stock_item(self, parameters_stock_item, category_list):
        # redundant argument validation? 
        _m = 'DataStore_Store_Stock_Item.get_many_stock_item'
        av.val_instance(parameters_stock_item, 'parameters_stock_item', _m, Parameters_Stock_Item)
        argument_dict = parameters_stock_item.to_json()
        user = self.get_user_session()
        argument_dict = {
            'a_id_user': user.id_user
            , **argument_dict
            , 'a_debug': 0
        }
        ids_permutation = category_list.get_csv_ids_permutation()
        Helper_App.console_log(f'ids_permutation: {ids_permutation}')
        argument_dict['a_ids_product_permutation'] = ids_permutation
        Helper_App.console_log(f'argument_dict: {argument_dict}')
        Helper_App.console_log('executing p_shop_get_many_stock_item')
        result = self.db_procedure_execute('p_shop_get_many_stock_item', argument_dict)
        cursor = result.cursor
        Helper_App.console_log('data received')
        category_list, errors = DataStore_Store_Stock_Item.input_many_stock_item(cursor, category_list)
        DataStore_Store_Stock_Item.db_cursor_clear(cursor)

        return category_list, errors 


    def input_many_stock_item(cursor, category_list):
        _m = 'DataStore_Store_Stock_Item.input_many_stock_item'
        result_set_1 = cursor.fetchall()
        Helper_App.console_log(f'raw categories: {result_set_1}')
        for row in result_set_1:
            new_stock_item = Stock_Item.from_DB_stock_item(row)
            category_list.add_stock_item(new_stock_item) # , row)
        
        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        Helper_App.console_log(f'raw errors: {result_set_e}')
        errors = []
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # (row[0], row[1])
            for error in errors:
                Helper_App.console_log(f"Error [{error.code}]: {error.msg}")
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
        DataStore_Store_Stock_Item.db_cursor_clear(cursor)
        return category_list, errors # categories, category_index
    
    @classmethod
    def save_stock_items(cls, comment, stock_items):
        _m = 'DataStore_Store_Stock_Item.save_stock_items'
        av.val_str(comment, 'comment', _m)

        guid = Helper_DB_MySQL.create_guid_str()
        now = datetime.now()
        user = cls.get_user_session()
        rows = []
        for stock_item in stock_items:
            # row = permutation.to_temporary_record()
            row = Stock_Item_Temp.from_stock_item(stock_item)
            row.guid = guid
            rows.append(row)
        
        Helper_App.console_log(f'rows: {rows}')
        
        DataStore_Store_Base.upload_bulk(Stock_Item_Temp.__tablename__, rows, 1000)
        Helper_App.console_log('bulk uploaded')

        argument_dict_list = {
            'a_comment': comment,
            'a_guid': guid,
            'a_id_user': user.id_user,
            'a_debug': 0
        }
        result = cls.db_procedure_execute('p_shop_save_stock_item', argument_dict_list)
        Helper_App.console_log('saved product permutations')
        
        # Errors
        cursor = result.cursor
        cursor.nextset()
        result_set_e = cursor.fetchall()
        Helper_App.console_log(f'raw errors: {result_set_e}')
        errors = []
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # (row[0], row[1])
            for error in errors:
                Helper_App.console_log(f"Error [{error.code}]: {error.msg}")
        DataStore_Store_Stock_Item.db_cursor_clear(cursor)
        return errors
