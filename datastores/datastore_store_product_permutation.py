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
from business_objects.store.basket import Basket, Basket_Item
from business_objects.store.product_category import Product_Category_Container, Product_Category
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
from datastores.datastore_store_base import DataStore_Store_Base
# from helpers.helper_db_mysql import Helper_DB_MySQL
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

    def save_permutations(self, comment, permutations):
        _m = 'DataStore_Store_Base.save_permutations'
        av.val_str(comment, 'comment', _m)
        av.val_list(permutations, 'list_permutations', _m, Product_Permutation, 1)

        guid = Helper_DB_MySQL.create_guid()
        now = datetime.now()
        user = self.get_user_session()
        for permutation in permutations:
            setattr(permutation, 'guid', guid)
            setattr(permutation, 'created_on', now)
            setattr(permutation, 'created_by', user.id_user)
        
        cursor = self.db.cursor()
        cursor.executemany(
            'INSERT INTO Shop_Product_Permutation_Temp (id_permutation, id_product, description, cost_local, id_currency_cost, profit_local_min, latency_manufacture, quantity_min, quantity_max, quantity_step, quantity_stock, is_subscription, id_recurrence_interval, count_recurrence_interval, id_stripe_product, active, display_order, guid) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)',
            permutations
        )
        self.db.commit()
        
        argument_dict_list = {
            'a_id_user': user.id_user,
            'a_comment': comment,
            'a_guid': guid
        }
        self.db_procedure_execute('p_shop_save_permutation', argument_dict_list)
        
        cursor.close()
