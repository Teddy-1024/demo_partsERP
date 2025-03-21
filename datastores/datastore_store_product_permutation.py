"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: DataStores
Feature:    Store Product Permutation DataStore

Description:
Datastore for Store Product Permutations
"""

# internal
import lib.argument_validation as av
from business_objects.store.store_base import Store_Base
from business_objects.store.product_permutation import Product_Permutation, Product_Permutation_Temp
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



class DataStore_Store_Product_Permutation(DataStore_Store_Base):
    def __init__(self):
        super().__init__()

    @classmethod
    def save_permutations(cls, comment, permutations):
        _m = 'DataStore_Store_Product_Permutation.save_permutations'
        av.val_str(comment, 'comment', _m)

        guid = Helper_DB_MySQL.create_guid_str()
        now = datetime.now()
        user = cls.get_user_session()
        rows = []
        for permutation in permutations:
            row = Product_Permutation_Temp.from_product_permutation(permutation)
            row.guid = guid
            rows.append(row)

        DataStore_Store_Base.upload_bulk(Product_Permutation_Temp.__tablename__, rows, 1000)

        argument_dict_list = {
            'a_comment': comment,
            'a_guid': guid,
            'a_id_user': user.id_user,
            'a_debug': 0,
        }
        results = cls.db_procedure_execute('p_shop_save_product_permutation', argument_dict_list)
        DataStore_Store_Base.db_cursor_clear(results.cursor)
