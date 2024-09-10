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

# db = SQLAlchemy()

"""
class Table_Shop_Product_Category(db.Model):
    __tablename__ = 'Shop_Product_Category'
    id_category: int = db.Column(db.Integer, primary_key=True)
    code: str = db.Column(db.String(50))
    name: str = db.Column(db.String(255))
    description: str = db.Column(db.String(4000))
    active: bool = db.Column(db.Boolean)
    display_order: int = db.Column(db.Integer)
    created_on: datetime = db.Column(db.DateTime)
    created_by: int = db.Column(db.Integer)
    id_change_set: int = db.Column(db.Integer)
"""
class Row_Shop_Product_Category_Temp(db.Model):
    __tablename__ = 'Shop_Product_Category_Temp'
    __table_args__ = { 'extend_existing': True }
    id_category: int = db.Column(db.Integer, primary_key=True)
    code: str = db.Column(db.String(50))
    name: str = db.Column(db.String(255))
    description: str = db.Column(db.String(4000))
    id_access_level_required: int = db.Column(db.Integer)
    active: bool = db.Column(db.Boolean)
    display_order: int = db.Column(db.Integer)
    guid: str = db.Column(db.BINARY(36))
    # created_on: datetime = db.Column(db.DateTime)
    # created_by: int = db.Column(db.Integer)

    @classmethod
    def from_product_category(cls, product_category):
        row = cls()
        row.id_category = product_category.id_category[0] if isinstance(product_category.id_category, tuple) else product_category.id_category
        row.code = product_category.code[0] if isinstance(product_category.code, tuple) else product_category.code
        row.name = product_category.name[0] if isinstance(product_category.name, tuple) else product_category.name
        row.description = product_category.description[0] if isinstance(product_category.description, tuple) else product_category.description
        row.id_access_level_required = product_category.id_access_level_required[0] if isinstance(product_category.id_access_level_required, tuple) else product_category.id_access_level_required
        row.active = product_category.active
        row.display_order = product_category.display_order
        """
        row.guid = product_category.guid
        row.created_on = product_category.created_on
        row.created_by = product_category.created_by
        """
        return row
    def to_json(self):
        return {
            'id_category': self.id_category,
            'code': self.code,
            'name': self.name,
            'description': self.description,
            'id_access_level_required': self.id_access_level_required,
            'active': self.active,
            'display_order': self.display_order,
            'guid': self.guid,
        }
        """
        'created_on': self.created_on,
        'created_by': self.created_by
        """


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
            # row = Row_Shop_Product_Category_Temp.from_product_category(category)
            row = category.to_temporary_record()
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
        DataStore_Store_Base.upload_bulk(rows, Product_Category.__tablename__, 1000)

        argument_dict_list = {
            'a_id_user': user.id_user,
            'a_guid': guid,
            'a_comment': comment,
        }
        save_result = cls.db_procedure_execute('p_shop_save_product_category', argument_dict_list)
        save_result.close()
        print('save procedure executed')

