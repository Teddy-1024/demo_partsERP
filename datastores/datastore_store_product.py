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
from business_objects.sql_error import SQL_Error
from business_objects.store.product import Product, Product_Permutation, Product_Price, Parameters_Product, Product_Temp
from datastores.datastore_store_base import DataStore_Store_Base
from helpers.helper_app import Helper_App
from helpers.helper_db_mysql import Helper_DB_MySQL
# from models.model_view_store_checkout import Model_View_Store_Checkout # circular!
from extensions import db
# external
# from abc import ABC, abstractmethod, abstractproperty


class DataStore_Store_Product(DataStore_Store_Base):
    def __init__(self):
        super().__init__()
    @classmethod
    def save_products(cls, comment, products):
        _m = 'DataStore_Store_Product.save_products'
        Helper_App.console_log(f'{_m}\nstarting...')
        Helper_App.console_log(f'comment: {comment}\nproducts: {products}')

        guid = Helper_DB_MySQL.create_guid()
        user = cls.get_user_session()
        rows = []
        id_product_new = 0
        for product in products:
            row = Product_Temp.from_product(product)
            if row.id_product == '':
                id_product_new -= 1
                row.id_product = id_product_new
            else:
                Helper_App.console_log(f'row.id_product: {row.id_product}')
            row.guid = guid
            rows.append(row)
        
        Helper_App.console_log(f'rows: {rows}')
        DataStore_Store_Base.upload_bulk(Product_Temp.__tablename__, rows, 1000)

        argument_dict_list = {
            'a_comment': comment,
            'a_guid': guid,
            'a_id_user': user.id_user,
            'a_debug': 0,
        }
        save_result = cls.db_procedure_execute('p_shop_save_product', argument_dict_list)
        
        cursor = save_result
        Helper_App.console_log('data received')
        
        # Errors
        result_set_e = cursor.fetchall()
        Helper_App.console_log(f'raw errors: {result_set_e}')
        errors = []
        if len(result_set_e) > 0:
            errors = [SQL_Error.from_DB_record(row) for row in result_set_e] 
            for error in errors:
                Helper_App.console_log(f"Error [{error.code}]: {error.msg}")
        try:
            DataStore_Store_Base.db_cursor_clear(cursor)
        except Exception as e:
            Helper_App.console_log(f'Error clearing cursor: {e}')
        cursor.close()

        save_result.close()
        Helper_App.console_log('save procedure executed')
        return errors

