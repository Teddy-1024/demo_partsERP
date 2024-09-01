"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: DataStores
Feature:    User DataStore

Description:
Datastore for Users
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
from business_objects.store.product import Product, Product_Permutation, Product_Price, Filters_Product 
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

# db = SQLAlchemy()


class DataStore_User(DataStore_Base):
    # Global constants
    # Attributes

    def __init__(self):
        super().__init__()

    def edit_user(self):
        # redundant argument validation? 
        _m = 'DataStore_User.edit_user'
        # av.val_instance(filters, 'filters', _m, Filters_Product_Category)

        argument_dict_list = {
            'a_id_user': self.info_user.get('sub'),
            'a_name': self.info_user.get('name'),
            'a_email': self.info_user.get('email'),
            'a_email_verified': 1 if self.info_user.get('email_verified') == 'True' else 0
        }

        result = self.db_procedure_execute('p_shop_edit_user', argument_dict_list)
        cursor = result.cursor
        
        result_set_1 = cursor.fetchall()
        print(f'raw user data: {result_set_1}')

        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_2]
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")

        DataStore_User.db_cursor_clear(cursor)

        return (result_set_1[0][1] == b'\x01')
    
    """
    def get_many_user_order(self, id_user, ids_order, n_order_max, id_checkout_session):
        _m  = 'DataStore_User.get_many_user_order'
        # av.val_str(id_user)
        # validation conducted by server

        argument_dict_list = {
            'a_id_user': id_user,
            'a_ids_order': ids_order,
            'a_n_order_max': n_order_max,
            'a_id_checkout_session': id_checkout_session
        }

        print('executing p_shop_get_many_user_order')
        result = self.db_procedure_execute('p_shop_get_many_user_order', argument_dict_list)
        cursor = result.cursor
        print('data received')

        
        # Discount Delivery Regions
        cursor.nextset()
        result_set_1 = cursor.fetchall()
        orders = []
        for row in result_set_1:
            new_order = Order(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
            orders.append(new_order)
        print(f'orders: {orders}')        
        
        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_e]
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")

        DataStore_User.db_cursor_clear(cursor)

        return orders
    """

    def get_many_user(self, user_filters, user=None):
        _m = 'DataStore_User.get_many_user'
        print(_m)
        # av.val_str(user_filters, 'user_filters', _m)
        # av.val_list(permutations, 'list_permutations', _m, Product_Permutation, 1)
        av.val_instance(user_filters, 'user_filters', _m, User_Filters)

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
        if user is None:
            user = self.get_user_session()
        argument_dict_list = {
            # 'a_guid': guid
            'a_id_user': user.id_user
            , 'a_id_user_auth0': user.id_user_auth0
            , **user_filters.to_json()
        }
        # argument_dict_list['a_guid'] = guid
        result = self.db_procedure_execute('p_get_many_user', argument_dict_list)
        """
        query = text(f"SELECT * FROM Shop_User_Eval_Temp UE_T WHERE UE_T.guid = '{guid}'")
        result = self.db.session.execute(query)
        """
        cursor = result.cursor
        result_set = cursor.fetchall()
        print(f'raw users: {result_set}')
        print(f'type result set: {str(type(result_set))}')
        print(f'len result set: {len(result_set)}') 
        """
        user_permission_evals = []
        for row in result_set:
            user_permission_eval = User_Permission_Evaluation.from_DB_user_eval(row)
            user_permission_evals.append(user_permission_eval)
        print(f'user_permission_evals: {user_permission_evals}')
        """
        users = []
        if len(result_set) > 0:
            for row in result_set:
                print(f'row: {row}')
                user = User.from_DB_user(row)
                users.append(user)
                print(f'user {str(type(user))}: {user}')
        print(f'type users: {str(type(users))}\n type user 0: {str(type(None if len(users) == 0 else users[0]))}')
        # error_list, cursor = self.get_error_list_from_cursor(cursor)
        errors = []
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_e]
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")

        DataStore_User.db_cursor_clear(cursor)

        return users, errors
