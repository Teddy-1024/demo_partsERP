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
        # av.val_list(permutations, 'list_permutations', _m, Product_Permutation, 1)

        guid = Helper_DB_MySQL.create_guid_str()
        now = datetime.now()
        user = cls.get_user_session()
        rows = []
        for permutation in permutations:
            # row = permutation.to_temporary_record()
            row = Product_Permutation_Temp.from_product_permutation(permutation)
            row.guid = guid
            rows.append(row)
        
        print(f'rows: {rows}')
        
        """
        cursor = db.cursor()
        print('cursor created')
        cursor.executemany(
            '''INSERT INTO Shop_Product_Permutation_Temp (
                id_permutation, 
                id_product, 
                description, 
                cost_local, 
                id_currency_cost, 
                profit_local_min, 
                latency_manufacture_days,
                id_unit_measurement_quantity,
                count_unit_measurement_quantity,
                quantity_min, 
                quantity_max, 
                quantity_stock, 
                is_subscription, 
                id_unit_measurement_interval_recurrence, 
                count_interval_recurrence, 
                id_stripe_product,
                does_expire_faster_once_unsealed,
                id_unit_measurement_interval_expiration_unsealed,
                count_interval_expiration_unsealed,
                active,
                guid
            ) 
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)''',
            rows
        )
        print('cursor executed')
        db.commit()
        print('cursor committed')
        cursor.close()
        print('cursor closed')
        """
        DataStore_Store_Base.upload_bulk(Product_Permutation_Temp.__tablename__, rows, 1000)
        print('bulk uploaded')

        argument_dict_list = {
            'a_id_user': user.id_user,
            'a_comment': comment,
            'a_guid': guid
        }
        cls.db_procedure_execute('p_shop_save_product_permutation', argument_dict_list)
        print('saved product permutations')
