"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: DataStores
Feature:    Store Basket DataStore

Description:
Datastore for Store Baskets
"""

# internal
# from routes import bp_home
import lib.argument_validation as av
from business_objects.store.basket import Basket, Basket_Item
from business_objects.store.product_category import Product_Category_Container, Product_Category
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


class DataStore_Store_Basket(DataStore_Store_Base):
    # Global constants
    KEY_BASKET: ClassVar[str] = Basket.KEY_BASKET
    # Attributes

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

    def get_metadata_basket(json_request):
        try:
            basket = json_request[DataStore_Store_Basket.KEY_BASKET]
        except KeyError:
            basket = {DataStore_Store_Basket.KEY_IS_INCLUDED_VAT: True, DataStore_Store_Basket.KEY_ID_CURRENCY: 1, DataStore_Store_Basket.KEY_ID_REGION_DELIVERY: 1}
        is_included_VAT = basket[DataStore_Store_Basket.KEY_IS_INCLUDED_VAT]
        id_currency = basket[DataStore_Store_Basket.KEY_ID_CURRENCY]
        id_region_delivery = basket[DataStore_Store_Basket.KEY_ID_REGION_DELIVERY]
        return id_currency, id_region_delivery, is_included_VAT

    def edit_basket(self, ids_permutation_basket, quantities_permutation_basket, id_permutation_edit, quantity_permutation_edit, sum_not_edit, id_currency, id_region_delivery, is_included_VAT):
        # redundant argument validation? 
        _m = 'DataStore_Store_Base.edit_basket'
        print(f'{_m}\nstarting...')
        # av.val_instance(filters, 'filters', _m, Parameters_Product_Category)
        # av.val_str(ids_product_basket, 'ids_product_basket', _m)
        av.val_str(ids_permutation_basket, 'ids_permutation_basket', _m)
        # av.val_str(quantities_product_basket, 'quantities_product_basket', _m)
        av.val_str(quantities_permutation_basket, 'quantities_permutation_basket', _m)
        """
        if id_product_edit == 'None':
            id_product_edit = None
        else:
            print(f'id_product_edit: {id_product_edit}')
            av.val_int(id_product_edit, 'id_product_edit', _m)
        """
        if id_permutation_edit == 'None' or str(type(id_permutation_edit)) =="<class 'NoneType'>":
            id_permutation_edit = None
        else:
            print(f'id_permutation_edit: {id_permutation_edit}')
            print(str(type(id_permutation_edit)))
            av.val_int(id_permutation_edit, 'id_permutation_edit', _m)
        if quantity_permutation_edit == 'None' or str(type(quantity_permutation_edit)) =="<class 'NoneType'>":
            quantity_permutation_edit = None
        else:
            print(f'quantity_permutation_edit: {quantity_permutation_edit}')
            av.val_int(quantity_permutation_edit, 'quantity_permutation_edit', _m)
        if sum_not_edit == 'None':
            sum_not_edit = None
        else:
            print(f'sum_not_edit: {sum_not_edit}')
            av.val_bool(sum_not_edit, 'sum_not_edit', _m)

        argument_dict_list = {
            'a_id_user': self.info_user.get('sub'),
            # 'a_ids_product_basket': ids_product_basket,
            'a_ids_permutation_basket': ids_permutation_basket,
            # 'a_quantities_product_basket': quantities_product_basket,
            'a_quantities_permutation_basket': quantities_permutation_basket,
            # 'a_id_product_edit': id_product_edit if id_permutation_edit is None else None,
            'a_id_permutation_edit': id_permutation_edit,
            'a_quantity_permutation_edit': quantity_permutation_edit,
            'a_sum_not_edit': 1 if sum_not_edit else 0,
            'a_id_currency': id_currency,
            'a_id_region_purchase': id_region_delivery
        }

        result = self.db_procedure_execute('p_shop_edit_user_basket', argument_dict_list)
        print('data received')

        cursor = result.cursor

        # categories, category_index = DataStore_Store_Base.input_many_product(cursor)
        category_list, errors = DataStore_Store_Base.input_many_product(cursor)

        print(f'cursor: {str(cursor)}')

        # Basket
        if not cursor.nextset():
            raise Exception("No more query results! Cannot open basket contents")
        result_set = cursor.fetchall()
        print(f'raw basket: {result_set}')
        # print(f'variations: {result_set_3}')
        # variations = [Product_Variation(**row) for row in result_set_3]
        basket = Basket(is_included_VAT, id_currency, id_region_delivery)
        for row in result_set:
            index_category = category_list.get_index_category_from_id(row[0])
            category = category_list.categories[index_category]
            index_product = category.get_index_product_from_id(row[1])
            product = category.products[index_product]
            basket_item = Basket_Item.from_product_and_quantity_and_VAT_included(product, row[7], self.app.is_included_VAT)
            print(f'adding basket item: {row}')
            print(f'basket item: {basket_item}')
            basket.add_item(basket_item) # basket.append(basket_item) # Basket_Item(category.name, product, row[4]))
            
        print(f'basket: {basket}')

        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_2]
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")
        
        DataStore_Store_Base.db_cursor_clear(cursor)

        return basket
