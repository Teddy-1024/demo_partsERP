"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: DataStores
Feature:    Store Product DataStore

Description:
Datastore for Store Products
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
class Row_Shop_Product_Temp(db.Model):
    __tablename__ = 'Shop_Product_Temp'
    __table_args__ = { 'extend_existing': True }
    id_product: int = db.Column(db.Integer, primary_key=True)
    id_category: int = db.Column(db.Integer)
    name: str = db.Column(db.String(50))
    has_variations: str = db.Column(db.String(255))
    id_access_level_required: int = db.Column(db.Integer)
    active: bool = db.Column(db.Boolean)
    display_order: int = db.Column(db.Integer)
    guid: str = db.Column(db.BINARY(36))

    @classmethod
    def from_product(cls, product):
        row = cls()
        row.id_product = product.id_product[0] if isinstance(product.id_product, tuple) else product.id_product
        row.id_category = product.id_category[0] if isinstance(product.id_category, tuple) else product.id_category
        row.name = product.name[0] if isinstance(product.name, tuple) else product.name
        row.id_access_level_required = product.id_access_level_required[0] if isinstance(product.id_access_level_required, tuple) else product.id_access_level_required
        row.active = product.active
        row.display_order = product.display_order
        return row
    def to_json(self):
        return {
            'id_category': self.id_category,
            'name': self.name,
            'id_access_level_required': self.id_access_level_required,
            'active': self.active,
            'display_order': self.display_order,
            'guid': self.guid,
        }


class DataStore_Store_Product(DataStore_Store_Base):
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
        user = cls.get_user_session()
        rows = []
        id_category_new = 0
        for category in categories:
            row = Row_Shop_Product_Temp.from_product(category)
            if row.id_category == '':
                id_category_new -= 1
                row.id_category = id_category_new
            else:
                print(f'row.id_category: {row.id_category}')
            row.guid = guid
            rows.append(row)
        
        print(f'rows: {rows}')

        DataStore_Store_Base.upload_bulk(rows, Row_Shop_Product_Temp, 1000)

        argument_dict_list = {
            'a_id_user': user.id_user,
            'a_guid': guid,
            'a_comment': comment,
        }
        save_result = cls.db_procedure_execute('p_shop_save_product', argument_dict_list)
        save_result.close()
        print('save procedure executed')

