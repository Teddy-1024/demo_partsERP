"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: DataStores
Feature:    Store Product Category DataStore

Description:
Datastore for Store Product Categories
"""

# internal
import lib.argument_validation as av
from business_objects.store.product_category import Product_Category_Container, Product_Category, Product_Category_Temp
from business_objects.sql_error import SQL_Error
# from datastores.datastore_base import Table_Shop_Product_Category, Table_Shop_Product_Category_Temp
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


class DataStore_Store_Product_Category(DataStore_Store_Base):
    def __init__(self):
        super().__init__()
    @classmethod
    def save_categories(cls, comment, categories):
        _m = 'DataStore_Store_Product_Category.save_categories'
        Helper_App.console_log(f'{_m}\nstarting...')
        Helper_App.console_log(f'comment: {comment}\ncategories: {categories}')

        guid = Helper_DB_MySQL.create_guid()
        now = datetime.now()
        user = cls.get_user_session()
        rows = []
        id_category_new = 0
        for category in categories:
            row = Product_Category_Temp.from_product_category(category)
            if row.id_category == '':
                id_category_new -= 1
                row.id_category = id_category_new
            else:
                Helper_App.console_log(f'row.id_category: {row.id_category}')
            row.guid = guid
            rows.append(row)
        
        Helper_App.console_log(f'rows: {rows}')
        DataStore_Store_Base.upload_bulk(Product_Category_Temp.__tablename__, rows, 1000)

        argument_dict_list = {
            'a_comment': comment,
            'a_guid': guid,
            'a_id_user': user.id_user,
            'a_debug': 0,
        }
        save_result = cls.db_procedure_execute('p_shop_save_product_category', argument_dict_list)

        # Errors
        cursor = save_result.cursor
        result_set_e = cursor.fetchall()
        Helper_App.console_log(f'raw errors: {result_set_e}')
        errors = []
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e]
            for error in errors:
                Helper_App.console_log(f"Error [{error.code}]: {error.msg}")
        
        DataStore_Store_Product_Category.db_cursor_clear(cursor)

        save_result.close()
        Helper_App.console_log('save procedure executed')
        return errors
