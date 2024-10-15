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
from business_objects.store.supplier import Supplier, Parameters_Supplier, Supplier_Temp
from datastores.datastore_store_base import DataStore_Store_Base
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


class DataStore_Store_Supplier(DataStore_Store_Base):
    # Global constants
    # Attributes

    def __init__(self):
        super().__init__()

    # Stock Items
    def get_many_supplier(self, parameters_supplier, category_list):
        # redundant argument validation? 
        _m = 'DataStore_Store_Supplier.get_many_supplier'
        av.val_instance(parameters_supplier, 'parameters_supplier', _m, Parameters_Supplier)
        argument_dict = parameters_supplier.to_json()
        user = self.get_user_session()
        """
        argument_dict['a_id_user'] = user.id_user # 'auth0|6582b95c895d09a70ba10fef' # id_user
        argument_dict['a_debug'] = 0
        """
        argument_dict = {
            'a_id_user': user.id_user
            , **argument_dict
            , 'a_debug': 0
        }
        ids_permutation = category_list.get_csv_ids_permutation()
        print(f'ids_permutation: {ids_permutation}')
        argument_dict['a_ids_product_permutation'] = ids_permutation
        print(f'argument_dict: {argument_dict}')
        print('executing p_shop_get_many_supplier')
        result = self.db_procedure_execute('p_shop_get_many_supplier', argument_dict)
        cursor = result.cursor
        print('data received')
        # categories, category_index = DataStore_Store_Supplier.input_many_product(cursor)
        category_list, errors = DataStore_Store_Supplier.input_many_supplier(cursor, category_list)
        DataStore_Store_Supplier.db_cursor_clear(cursor)

        return category_list, errors # categories, category_index


    def input_many_supplier(cursor, category_list):
        _m = 'DataStore_Store_Supplier.input_many_supplier'
        result_set_1 = cursor.fetchall()
        print(f'raw categories: {result_set_1}')
        for row in result_set_1:
            new_supplier = Supplier.from_DB_supplier(row)
            category_list.add_supplier(new_supplier) # , row)
        
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
                    ids_permutation_unavailable = DataStore_Store_Supplier.get_ids_permutation_from_error_availability(error.msg)
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
        DataStore_Store_Supplier.db_cursor_clear(cursor)
        return category_list, errors # categories, category_index
    
    @classmethod
    def save_suppliers(cls, comment, suppliers):
        _m = 'DataStore_Store_Supplier.save_suppliers'
        av.val_str(comment, 'comment', _m)

        guid = Helper_DB_MySQL.create_guid_str()
        now = datetime.now()
        user = cls.get_user_session()
        rows = []
        for supplier in suppliers:
            # row = permutation.to_temporary_record()
            row = Supplier_Temp.from_supplier(supplier)
            row.guid = guid
            rows.append(row)
        
        print(f'rows: {rows}')
        
        DataStore_Store_Base.upload_bulk(Supplier_Temp.__tablename__, rows, 1000)
        print('bulk uploaded')

        argument_dict_list = {
            'a_comment': comment,
            'a_guid': guid,
            'a_id_user': user.id_user,
            'a_debug': 0
        }
        result = cls.db_procedure_execute('p_shop_save_supplier', argument_dict_list)
        print('saved product permutations')
        
        # Errors
        cursor = result.cursor
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        errors = []
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # (row[0], row[1])
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")
        DataStore_Store_Supplier.db_cursor_clear(cursor)
        return errors
