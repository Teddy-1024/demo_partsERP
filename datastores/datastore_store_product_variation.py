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
from business_objects.store.product_variation import Product_Variation, Parameters_Product_Variation, Product_Variation_Temp
from business_objects.store.product_variation_type import Product_Variation_Type, Product_Variation_Type_Temp
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



class DataStore_Store_Product_Variation(DataStore_Store_Base):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

    @classmethod
    def save_product_variations(cls, comment, variation_types):
        _m = f'{cls.__class__}.save_product_variations'
        av.val_str(comment, 'comment', _m)

        guid = Helper_DB_MySQL.create_guid_str()
        user = cls.get_user_session()
        rows = []
        for variation_type in variation_types:
            row = Product_Variation_Type_Temp.from_product_variation_type(variation_type)
            row.guid = guid
            rows.append(row)
        Helper_App.console_log(f'rows: {rows}')

        DataStore_Store_Base.upload_bulk(Product_Variation_Type_Temp.__tablename__, rows, 1000)
        Helper_App.console_log('bulk uploaded product variation types')

        rows = []
        for variation_type in variation_types:
            if variation_type.variations is not None:
                for variation in variation_type.variations:
                    row = Product_Variation_Temp.from_product_variation(variation)
                    row.guid = guid
                    rows.append(row)
        Helper_App.console_log(f'rows: {rows}')

        DataStore_Store_Base.upload_bulk(Product_Variation_Temp.__tablename__, rows, 1000)
        Helper_App.console_log('bulk uploaded product variations')

        argument_dict_list = {
            'a_comment': comment,
            'a_guid': guid,
            'a_id_user': user.id_user,
            'a_debug': 0,
        }
        cls.db_procedure_execute('p_shop_save_product_variation', argument_dict_list)
        Helper_App.console_log('saved product variations')
