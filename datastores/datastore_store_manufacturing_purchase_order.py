"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: DataStores
Feature:    Store Manufacturing Purchase Order Purchase Order DataStore

Description:
Datastore for Store Manufacturing Purchase Order Purchase Orders
"""

# internal
# from routes import bp_home
import lib.argument_validation as av
from business_objects.sql_error import SQL_Error
from business_objects.store.manufacturing_purchase_order import Manufacturing_Purchase_Order, Manufacturing_Purchase_Order_Product_Link, Parameters_Manufacturing_Purchase_Order, Manufacturing_Purchase_Order_Temp, Manufacturing_Purchase_Order_Product_Link_Temp
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


class DataStore_Store_Manufacturing_Purchase_Order(DataStore_Store_Base):

    def __init__(self):
        super().__init__()

    def get_many_manufacturing_purchase_order(self, parameters_manufacturing_purchase_order):
        _m = 'DataStore_Store_Manufacturing_Purchase_Order.get_many_manufacturing_purchase_order'
        av.val_instance(parameters_manufacturing_purchase_order, 'parameters_manufacturing_purchase_order', _m, Parameters_Manufacturing_Purchase_Order)
        argument_dict = parameters_manufacturing_purchase_order.to_json()
        user = self.get_user_session()
        argument_dict = {
            'a_id_user': user.id_user
            , **argument_dict
            , 'a_debug': 0
        }
        Helper_App.console_log(f'argument_dict: {argument_dict}')
        Helper_App.console_log('executing p_shop_get_many_manufacturing_purchase_order')
        result = self.db_procedure_execute('p_shop_get_many_manufacturing_purchase_order', argument_dict)
        cursor = result.cursor
        Helper_App.console_log('data received')
        
        # Manufacturing_Purchase_Orders
        result_set_1 = cursor.fetchall()
        Helper_App.console_log(f'raw manufacturing_purchase_orders: {result_set_1}')
        manufacturing_purchase_orders = []
        indices_manufacturing_purchase_order = {}
        for row in result_set_1:
            new_manufacturing_purchase_order = Manufacturing_Purchase_Order.from_DB_manufacturing_purchase_order(row)
            indices_manufacturing_purchase_order[new_manufacturing_purchase_order.id_order] = len(manufacturing_purchase_orders)
            manufacturing_purchase_orders.append(new_manufacturing_purchase_order)
        
        # Manufacturing_Purchase_Orders Items
        cursor.nextset()
        result_set_1 = cursor.fetchall()
        Helper_App.console_log(f'raw manufacturing_purchase_order_product_links: {result_set_1}')
        order_product_links = []
        for row in result_set_1:
            new_link = Manufacturing_Purchase_Order_Product_Link.from_DB_manufacturing_purchase_order(row)
            order_product_links.append(new_link)
            manufacturing_purchase_orders[indices_manufacturing_purchase_order[new_link.id_order]].items.append(new_link)

        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        Helper_App.console_log(f'raw errors: {result_set_e}')
        errors = []
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e]
            for error in errors:
                Helper_App.console_log(f"Error [{error.code}]: {error.msg}")
        
        DataStore_Store_Manufacturing_Purchase_Order.db_cursor_clear(cursor)

        return manufacturing_purchase_orders, errors

    @classmethod
    def save_manufacturing_purchase_orders(cls, comment, manufacturing_purchase_orders):
        _m = 'DataStore_Store_Manufacturing_Purchase_Order.save_manufacturing_purchase_orders'
        av.val_str(comment, 'comment', _m)

        guid = Helper_DB_MySQL.create_guid_str()
        now = datetime.now()
        user = cls.get_user_session()
        rows_order = []
        for manufacturing_purchase_order in manufacturing_purchase_orders:
            row = Manufacturing_Purchase_Order_Temp.from_manufacturing_purchase_order(manufacturing_purchase_order)
            row.guid = guid
            rows_order.append(row)
        Helper_App.console_log(f'order rows: {rows_order}')
        DataStore_Store_Base.upload_bulk(Manufacturing_Purchase_Order_Temp.__tablename__, rows_order, 1000)
        Helper_App.console_log('bulk uploaded orders')

        rows_link = []
        for manufacturing_purchase_order in manufacturing_purchase_orders:
            for link in manufacturing_purchase_order.items:
                row = Manufacturing_Purchase_Order_Product_Link_Temp.from_manufacturing_purchase_order_product_link(link)
                row.guid = guid
                rows_link.append(row)
        Helper_App.console_log(f'link rows: {rows_link}')
        DataStore_Store_Base.upload_bulk(Manufacturing_Purchase_Order_Product_Link_Temp.__tablename__, rows_link, 1000)
        Helper_App.console_log('bulk uploaded links')

        argument_dict_list = {
            'a_comment': comment,
            'a_guid': guid,
            'a_id_user': user.id_user,
            'a_debug': 0
        }
        result = cls.db_procedure_execute('p_shop_save_manufacturing_purchase_order', argument_dict_list)
        Helper_App.console_log('saved manufacturing purchase orders')
        
        # Errors
        cursor = result.cursor
        cursor.nextset()
        result_set_e = cursor.fetchall()
        Helper_App.console_log(f'raw errors: {result_set_e}')
        errors = []
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e]
            for error in errors:
                Helper_App.console_log(f"Error [{error.code}]: {error.msg}")
                
        DataStore_Store_Manufacturing_Purchase_Order.db_cursor_clear(cursor)
        return errors
