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
from business_objects.store.basket import Basket, Basket_Item
from business_objects.store.product_category import Product_Category_Container, Product_Category, Product_Category_Temp
from business_objects.store.currency import Currency
from business_objects.store.image import Image
from business_objects.store.delivery_option import Delivery_Option
from business_objects.store.delivery_region import Delivery_Region
from business_objects.store.discount import Discount
from business_objects.store.order import Order
from business_objects.store.product import Product, Product_Permutation, Product_Price, Parameters_Product 
from business_objects.sql_error import SQL_Error
from business_objects.store.stock_item import Stock_Item
from business_objects.user import User, User_Filters, User_Permission_Evaluation
from business_objects.store.product_variation import Product_Variation, Product_Variation_Filters, Product_Variation_Container
# from datastores.datastore_base import Table_Shop_Product_Category, Table_Shop_Product_Category_Temp
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


class DataStore_Store_Product_Category(DataStore_Store_Base):
    def __init__(self):
        super().__init__()
    @classmethod
    def save_categories(cls, comment, categories):
        _m = 'DataStore_Store_Product_Category.save_categories'
        print(f'{_m}\nstarting...')
        print(f'comment: {comment}\ncategories: {categories}')
        # av.val_str(comment, 'comment', _m)
        # av.val_list_instances(categories, 'categories', _m, Product_Category, 1)

        guid = Helper_DB_MySQL.create_guid()
        now = datetime.now()
        user = cls.get_user_session()
        rows = []
        id_category_new = 0
        for category in categories:
            row = Product_Category_Temp.from_product_category(category)
            # row = category.to_temporary_record()
            # id_tmp = 
            if row.id_category == '':
                id_category_new -= 1
                row.id_category = id_category_new
            else:
                print(f'row.id_category: {row.id_category}')
            row.guid = guid
            # row.created_on = now
            # row.created_by = user.id_user
            rows.append(row)
        
        print(f'rows: {rows}')
        """
        cursor = db.cursor()
        print('cursor created') 
        cursor.executemany(
            'INSERT INTO Shop_Product_Category_Temp (id_category, code, name, description, active, display_order, guid, created_on, created_by) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)',
            categories
        )
        print('bulk upload executed')
        db.commit()
        print('bulk upload committed')
        cursor.close()
        print('cursor closed')
        """
        DataStore_Store_Base.upload_bulk(Product_Category_Temp.__tablename__, rows, 1000)

        argument_dict_list = {
            'a_id_user': user.id_user,
            'a_guid': guid,
            'a_comment': comment,
        }
        save_result = cls.db_procedure_execute('p_shop_save_product_category', argument_dict_list)
        save_result.close()
        print('save procedure executed')

