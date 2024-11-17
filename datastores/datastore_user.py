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
from business_objects.sql_error import SQL_Error
from business_objects.store.stock_item import Stock_Item
from business_objects.user import User, Parameters_User, User_Permission_Evaluation
# from datastores.datastore_base import DataStore_Base
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

db = SQLAlchemy()


class DataStore_User(DataStore_Store_Base):
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
        Helper_App.console_log(f'raw user data: {result_set_1}')

        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        Helper_App.console_log(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_2]
            for error in errors:
                Helper_App.console_log(f"Error [{error.code}]: {error.msg}")

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

        Helper_App.console_log('executing p_shop_get_many_user_order')
        result = self.db_procedure_execute('p_shop_get_many_user_order', argument_dict_list)
        cursor = result.cursor
        Helper_App.console_log('data received')

        
        # Discount Delivery Regions
        cursor.nextset()
        result_set_1 = cursor.fetchall()
        orders = []
        for row in result_set_1:
            new_order = Order(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
            orders.append(new_order)
        Helper_App.console_log(f'orders: {orders}')        
        
        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        Helper_App.console_log(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_e]
            for error in errors:
                Helper_App.console_log(f"Error [{error.code}]: {error.msg}")

        DataStore_User.db_cursor_clear(cursor)

        return orders
    """

    def get_many_user(self, user_filters, user=None):
        _m = 'DataStore_User.get_many_user'
        Helper_App.console_log(_m)
        # av.val_str(user_filters, 'user_filters', _m)
        # av.val_list(permutations, 'list_permutations', _m, Product_Permutation, 1)
        av.val_instance(user_filters, 'user_filters', _m, Parameters_User)

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
            , 'a_debug': 0

        }
        # argument_dict_list['a_guid'] = guid
        result = self.db_procedure_execute('p_get_many_user', argument_dict_list)
        """
        query = text(f"SELECT * FROM Shop_Calc_User_Temp UE_T WHERE UE_T.guid = '{guid}'")
        result = self.db.session.execute(query)
        """
        cursor = result.cursor
        result_set = cursor.fetchall()
        Helper_App.console_log(f'raw users: {result_set}')
        Helper_App.console_log(f'type result set: {str(type(result_set))}')
        Helper_App.console_log(f'len result set: {len(result_set)}') 
        """
        user_permission_evals = []
        for row in result_set:
            user_permission_eval = User_Permission_Evaluation.from_DB_user_eval(row)
            user_permission_evals.append(user_permission_eval)
        Helper_App.console_log(f'user_permission_evals: {user_permission_evals}')
        """
        users = []
        if len(result_set) > 0:
            for row in result_set:
                Helper_App.console_log(f'row: {row}')
                user = User.from_DB_user(row)
                users.append(user)
                Helper_App.console_log(f'user {str(type(user))}: {user}')
        Helper_App.console_log(f'type users: {str(type(users))}\n type user 0: {str(type(None if len(users) == 0 else users[0]))}')
        # error_list, cursor = self.get_error_list_from_cursor(cursor)
        errors = []
        cursor.nextset()
        result_set_e = cursor.fetchall()
        Helper_App.console_log(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_e]
            for error in errors:
                Helper_App.console_log(f"Error [{error.code}]: {error.msg}")

        DataStore_User.db_cursor_clear(cursor)

        return users, errors

    def get_many_user(self, user_filters, user=None):
        _m = 'DataStore_User.get_many_user'
        Helper_App.console_log(_m)
        # av.val_str(user_filters, 'user_filters', _m)
        # av.val_list(permutations, 'list_permutations', _m, Product_Permutation, 1)
        av.val_instance(user_filters, 'user_filters', _m, Parameters_User)

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
            , 'a_debug': 0

        }
        # argument_dict_list['a_guid'] = guid
        result = self.db_procedure_execute('p_get_many_user', argument_dict_list)
        """
        query = text(f"SELECT * FROM Shop_Calc_User_Temp UE_T WHERE UE_T.guid = '{guid}'")
        result = self.db.session.execute(query)
        """
        cursor = result.cursor
        result_set = cursor.fetchall()
        Helper_App.console_log(f'raw users: {result_set}')
        Helper_App.console_log(f'type result set: {str(type(result_set))}')
        Helper_App.console_log(f'len result set: {len(result_set)}') 
        """
        user_permission_evals = []
        for row in result_set:
            user_permission_eval = User_Permission_Evaluation.from_DB_user_eval(row)
            user_permission_evals.append(user_permission_eval)
        Helper_App.console_log(f'user_permission_evals: {user_permission_evals}')
        """
        users = []
        if len(result_set) > 0:
            for row in result_set:
                Helper_App.console_log(f'row: {row}')
                user = User.from_DB_user(row)
                users.append(user)
                Helper_App.console_log(f'user {str(type(user))}: {user}')
        Helper_App.console_log(f'type users: {str(type(users))}\n type user 0: {str(type(None if len(users) == 0 else users[0]))}')
        # error_list, cursor = self.get_error_list_from_cursor(cursor)
        errors = []
        cursor.nextset()
        result_set_e = cursor.fetchall()
        Helper_App.console_log(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_e]
            for error in errors:
                Helper_App.console_log(f"Error [{error.code}]: {error.msg}")

        DataStore_User.db_cursor_clear(cursor)

        return users, errors
