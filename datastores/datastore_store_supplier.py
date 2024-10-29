"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: DataStores
Feature:    Store Supplier DataStore

Description:
Datastore for Store Suppliers
"""

# internal
# from routes import bp_home
import lib.argument_validation as av
from business_objects.sql_error import SQL_Error
from business_objects.store.supplier_address import Supplier_Address, Supplier_Address_Temp
from business_objects.store.supplier import Supplier, Parameters_Supplier, Supplier_Temp
from datastores.datastore_store_base import DataStore_Store_Base
from helpers.helper_app import Helper_App
from helpers.helper_db_mysql import Helper_DB_MySQL
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


class DataStore_Store_Supplier(DataStore_Store_Base):

    def __init__(self):
        super().__init__()

    @classmethod
    def get_many_supplier(cls, parameters_supplier):
        _m = 'DataStore_Store_Supplier.get_many_supplier'
        av.val_instance(parameters_supplier, 'parameters_supplier', _m, Parameters_Supplier)
        argument_dict = parameters_supplier.to_json()
        user = cls.get_user_session()
        argument_dict = {
            'a_id_user': user.id_user
            , **argument_dict
            , 'a_debug': 0
        }
        Helper_App.console_log(f'argument_dict: {argument_dict}')
        Helper_App.console_log('executing p_shop_get_many_supplier')
        result = cls.db_procedure_execute('p_shop_get_many_supplier', argument_dict)
        cursor = result.cursor
        Helper_App.console_log('data received')
        
        # Suppliers
        result_set_1 = cursor.fetchall()
        Helper_App.console_log(f'raw suppliers: {result_set_1}')
        suppliers = []
        supplier_indexes = {}
        for row in result_set_1:
            new_supplier = Supplier.from_DB_supplier(row)
            supplier_indexes[new_supplier.id_supplier] = len(suppliers)
            suppliers.append(new_supplier)
        
        # Supplier Addresses
        cursor.nextset()
        result_set_1 = cursor.fetchall()
        Helper_App.console_log(f'raw supplier addresses: {result_set_1}')
        for row in result_set_1:
            new_address = Supplier_Address.from_DB_supplier(row)
            index_supplier = supplier_indexes[new_address.id_supplier]
            suppliers[index_supplier].addresses.append(new_address)
        
        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        Helper_App.console_log(f'raw errors: {result_set_e}')
        errors = []
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # (row[0], row[1])
            for error in errors:
                Helper_App.console_log(f"Error [{error.code}]: {error.msg}")
        
        DataStore_Store_Supplier.db_cursor_clear(cursor)

        return suppliers, errors

    @classmethod
    def save_suppliers(cls, comment, suppliers):
        _m = 'DataStore_Store_Supplier.save_suppliers'
        Helper_App.console_log(f'{_m}\n{suppliers}')
        av.val_str(comment, 'comment', _m)

        guid = Helper_DB_MySQL.create_guid_str()
        now = datetime.now()
        user = cls.get_user_session()

        rows = []
        for supplier in suppliers:
            row = Supplier_Temp.from_supplier(supplier)
            row.guid = guid
            rows.append(row)        
        Helper_App.console_log(f'rows: {rows}')
        
        DataStore_Store_Base.upload_bulk(Supplier_Temp.__tablename__, rows, 1000)
        Helper_App.console_log('bulk uploaded suppliers')

        rows = []
        for supplier in suppliers:
            Helper_App.console_log(f'supplier: {supplier}')
            for supplier_address in supplier.addresses:
                row = Supplier_Address_Temp.from_supplier_address(supplier_address)
                row.guid = guid
                rows.append(row)        
        Helper_App.console_log(f'rows: {rows}')
        
        DataStore_Store_Base.upload_bulk(Supplier_Address_Temp.__tablename__, rows, 1000)
        Helper_App.console_log('bulk uploaded supplier addresses')

        argument_dict_list = {
            'a_comment': comment,
            'a_guid': guid,
            'a_id_user': user.id_user,
            'a_debug': 0
        }
        result = cls.db_procedure_execute('p_shop_save_supplier', argument_dict_list)
        Helper_App.console_log('saved suppliers')
        
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

        DataStore_Store_Supplier.db_cursor_clear(cursor)
        return errors
