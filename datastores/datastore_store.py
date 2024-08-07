"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: DataStores
Feature:    Store DataStore

Description:
Datastore for Store
"""

# IMPORTS
# VARIABLE INSTANTIATION
# METHODS

# IMPORTS
# internal
# from routes import bp_home
import lib.argument_validation as av
from business_objects.basket import Basket, Basket_Item
from business_objects.category import Category_List, Category
from business_objects.currency import Currency
from business_objects.image import Image
from business_objects.delivery_option import Delivery_Option
from business_objects.delivery_region import Delivery_Region
from business_objects.discount import Discount
from business_objects.order import Order
from business_objects.product import Product, Product_Permutation, Price, Product_Filters # Permutation_Variation_Link
from business_objects.sql_error import SQL_Error
from business_objects.stock_item import Stock_Item, Stock_Item_Filters
from business_objects.user import User, User_Filters, User_Permission_Evaluation
from business_objects.variation import Variation, Variation_Filters, Variation_List
from helpers.helper_db_mysql import Helper_DB_MySQL
# from models.model_view_store_checkout import Model_View_Store_Checkout # circular!
# external
# from abc import ABC, abstractmethod, abstractproperty
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text
import stripe
import os
from flask import Flask, session
from pydantic import BaseModel, ConfigDict
from typing import ClassVar
from datetime import datetime

# VARIABLE INSTANTIATION


# CLASSES
class DataStore_Store(BaseModel):
    # Global constants
    KEY_BASKET: ClassVar[str] = Basket.KEY_BASKET
    KEY_IS_INCLUDED_VAT: ClassVar[str] = Basket.KEY_IS_INCLUDED_VAT # 'is_included_VAT'
    KEY_ID_CURRENCY: ClassVar[str] = Basket.KEY_ID_CURRENCY # 'id_currency'
    KEY_ID_REGION_DELIVERY: ClassVar[str] = Basket.KEY_ID_REGION_DELIVERY # 'id_region_delivery'
    # Attributes
    app: Flask
    db: SQLAlchemy
    session: object = None
    key_public_stripe: str = None
    key_secret_stripe: str = None

    model_config = ConfigDict(arbitrary_types_allowed=True)

    """
    def __new__(cls, app):
        # Initialiser - validation
        _m = 'DataStore_Store.__new__'
        v_arg_type = 'class attribute'
        av.val_instance(db, 'db', _m, SQLAlchemy, v_arg_type=v_arg_type)
        return super(DataStore_Store, cls).__new__(cls)
    """
    def __init__(self, app, db):
        super().__init__(app=app, db=db)
        # Constructor
        """
        self.db = db
        self.info_user = info_user
        self.app = app
        """
        self.key_secret_stripe = os.environ.get("KEY_SECRET_STRIPE")
        self.key_public_stripe = os.environ.get("KEY_PUBLIC_STRIPE")
        
        # For sample support and debugging, not required for production:
        stripe.set_app_info(
            'stripe-samples/checkout-one-time-payments',
            version='0.0.1',
            url='https://github.com/stripe-samples/checkout-one-time-payments')

        stripe.api_key = self.key_secret_stripe
    
        with self.app.app_context():
            self.session = session

    def get_many_product_category(self, product_filters):
        # redundant argument validation? 
        _m = 'DataStore_Store.get_many_product_category'
        av.val_instance(product_filters, 'product_filters', _m, Product_Filters)
        """
        av.val_str(category_ids, 'category_ids', _m)
        av.val_str(product_ids, 'product_ids', _m)
        av.val_bool(get_all_category, 'get_all_category', _m)
        av.val_bool(get_all_product, 'get_all_product', _m)
        av.val_int(max_products_per_category, 'max_products_per_category', _m)
        argument_dict_list = {
            'a_id_user': self.info_user.get('sub'),
            'a_get_all_categories': 0,
            'a_ids_category': category_ids,
            'a_get_inactive_categories': 0,
            'a_ids_product': product_ids,
            'a_get_inactive_products': 0,
            'a_get_first_product_only': 1 if (max_products_per_category == 1) else 0,
            'a_get_all_products': 1 if get_all_product else 0,
            'a_ids_image': '',
            'a_get_inactive_images': 0,
            'a_get_first_image_only': 0,
            'a_get_all_images': 1
        }
        """
        argument_dict = product_filters.to_json()
        user = self.get_user_session()
        argument_dict['a_id_user'] = 1 # 'auth0|6582b95c895d09a70ba10fef' # id_user
        print(f'argument_dict: {argument_dict}')
        print('executing p_shop_get_many_product')
        result = self.db_procedure_execute('p_shop_get_many_product', argument_dict)
        cursor = result.cursor
        print('data received')
        # categories, category_index = DataStore_Store.input_many_product(cursor)
        category_list, errors = DataStore_Store.input_many_product(cursor)
        DataStore_Store.db_cursor_clear(cursor)

        return category_list, errors # categories, category_index
    

    def edit_basket(self, ids_permutation_basket, quantities_permutation_basket, id_permutation_edit, quantity_permutation_edit, sum_not_edit, id_currency, id_region_delivery, is_included_VAT):
        # redundant argument validation? 
        _m = 'DataStore_Store.edit_basket'
        print(f'{_m}\nstarting...')
        # av.val_instance(filters, 'filters', _m, Product_Category_Filters)
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

        # categories, category_index = DataStore_Store.input_many_product(cursor)
        category_list, errors = DataStore_Store.input_many_product(cursor)

        print(f'cursor: {str(cursor)}')

        # Basket
        if not cursor.nextset():
            raise Exception("No more query results! Cannot open basket contents")
        result_set = cursor.fetchall()
        print(f'raw basket: {result_set}')
        # print(f'variations: {result_set_3}')
        # variations = [Variation(**row) for row in result_set_3]
        basket = Basket(is_included_VAT, id_currency, id_region_delivery)
        for row in result_set:
            index_category = category_list.get_index_category_from_id(row[0])
            category = category_list.categories[index_category]
            index_product = category.get_index_product_from_id(row[1])
            product = category.products[index_product]
            basket_item = Basket_Item.make_from_product_and_quantity_and_VAT_included(product, row[7], self.app.is_included_VAT)
            print(f'adding basket item: {row}')
            print(f'basket item: {basket_item}')
            basket.add_item(basket_item) # basket.append(basket_item) # Basket_Item(category.name, product, row[4]))
            
        print(f'basket: {basket}')

        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.make_from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_2]
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")
        
        DataStore_Store.db_cursor_clear(cursor)

        return basket

    def edit_user(self):
        # redundant argument validation? 
        _m = 'DataStore_Store.edit_user'
        # av.val_instance(filters, 'filters', _m, Product_Category_Filters)

        argument_dict_list = {
            'a_id_user': self.info_user.get('sub'),
            'a_name': self.info_user.get('name'),
            'a_email': self.info_user.get('email'),
            'a_email_verified': 1 if self.info_user.get('email_verified') == 'True' else 0
        }

        result = self.db_procedure_execute('p_shop_edit_user', argument_dict_list)
        cursor = result.cursor
        
        result_set_1 = cursor.fetchall()
        print(f'raw user data: {result_set_1}')

        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.make_from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_2]
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")

        DataStore_Store.db_cursor_clear(cursor)

        return (result_set_1[0][1] == b'\x01')
    

    def db_procedure_execute(self, proc_name, argument_dict_list = None):
        # Argument validation
        _m = 'DataStore_Store.db_procedure_execute'
        av.val_str(proc_name, 'proc_name', _m)
        has_arguments = not str(type(argument_dict_list)) == "<class 'NoneType'>"
        if has_arguments:
            # av.val_list_instances(argument_dict_list, 'argument_dict_list', _m, dict)
            pass
        # Methods
        proc_string = f'CALL {proc_name}('
        if has_arguments:
            arg_keys = list(argument_dict_list.keys())
            for i in range(len(arg_keys)):
                proc_string += f'{"" if i == 0 else ", "}:{arg_keys[i]}'
        proc_string += ')'
        proc_string = text(proc_string)
        print(f'{_m}\nproc_string: {proc_string}\nargs: {argument_dict_list}')

        # with self.db.session.begin() as session:
        # conn = Helper_DB_MySQL(self.app).get_db_connection()

        if has_arguments:
            result = self.db.session.execute(proc_string, argument_dict_list)
        else:
            result = self.db.session.execute(proc_string)
        print(f'result: {result}')
        # conn.session.remove()
        return result
        cursor = result.cursor
        result_set_1 = cursor.fetchall()
        print(f'categories: {result_set_1}')
        cursor.nextset()
        result_set_2 = cursor.fetchall()
        print(f'products: {result_set_2}')
    
    """
    def get_many_id_price(self, product_ids):
        _m = 'DataStore_Store.get_many_id_price'
        av.val_str(product_ids, 'product_ids', _m)
        price_ids = []
        for product_id in product_ids.split(','):
            if product_id == 'prod_PB0NUOSEs06ymG':
                price_ids.append() # get price id
        return price_ids
    """

    def input_many_product(cursor):
        _m = 'DataStore_Store.input_many_product'
        category_list = Category_List()
        # Categories
        result_set_1 = cursor.fetchall()
        print(f'raw categories: {result_set_1}')
        # categories = [Category(row[0], row[1], row[2], row[3]) for row in result_set_1]
        # categories = []
        # category_index = {}
        for row in result_set_1:
            new_category = Category.make_from_DB_product(row) # Category(row[0], row[1], row[2], row[3])
            # category_index[new_category.id_category] = len(categories)
            # categories.append(new_category)
            category_list.add_category(new_category)
        # print(f'categories: {[c.id_category for c in categories]}')

        # Products
        cursor.nextset()
        result_set_2 = cursor.fetchall()
        # print(f'products: {result_set_2}')
        products = [] # [Product(**row) for row in result_set_2]
        product_index = {}
        for row in result_set_2:
            new_permutation = Product_Permutation.make_from_DB_product(row) # (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9], row[10], row[11], row[12], row[13], row[14], row[15], row[16], row[17], row[18], row[19])
            index_category = category_list.get_index_category_from_id(new_permutation.id_category)
            category = category_list.categories[index_category]
            try:
                index_product = category.get_index_product_from_id(new_permutation.id_product)
                category_list.add_permutation(new_permutation)
                # product = products[index_product]
                # product.add_permutation(new_permutation)
            except KeyError:
                product_index[new_permutation.id_product] = len(products)
                product = Product.make_from_DB_product(row)
                product.add_permutation(new_permutation)
                products.append(product)
                # categories[category_index[new_product.id_category]].add_product(new_product)
                category_list.add_product(product)
            # category_list.add_permutation(new_permutation)
        # print(f'products: {[p.id_product for p in products]}') # {products}')
        print(f'category_list: {category_list}')

        # Variations
        cursor.nextset()
        result_set_3 = cursor.fetchall()
        # print(f'variations: {result_set_3}')
        # variations = [Variation(**row) for row in result_set_3]
        variations = []
        for row in result_set_3:
            new_variation = Variation.make_from_DB_product(row) # (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7])
            variations.append(new_variation)
            # products[product_index[new_variation.id_product]].variations.append(new_variation)
            # index_category = category_index[new_variation.id_category]
            # index_product = categories[index_category].index_product_from_ids_product_permutation(new_variation.id_product, new_variation.id_permutation)
            # categories[index_category].products[index_product].variations.append(new_variation)
            category_list.add_variation(new_variation)
        # print(f'variations: {variations}')
        # print(f'products: {[p.id_product for p in products]}')

        """
        # Permutation Variation Links
        cursor.nextset()
        result_set_4 = cursor.fetchall()
        # print(f'variations: {result_set_3}')
        # variations = [Variation(**row) for row in result_set_3]
        permutation_variation_links = []
        for row in result_set_3:
            permutation_variation_link = Permutation_Variation_Link.make_from_DB_product(row) # (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7])
            permutation_variation_links.append(permutation_variation_link)
            # categories[category_index[new_variation.id_category]].products[categories[category_index[new_variation.id_category]].product_index[new_variation.id_product]].variations.append(new_variation)
            categories[category_index[new_variation.id_category]].products[categories[category_index[new_variation.id_category]].product_index[new_variation.id_product]].variations.append(new_variation)
        print(f'variations: {variations}')
        print(f'products: {[p.id_product for p in products]}')
        """

        # Prices
        cursor.nextset()
        result_set_4 = cursor.fetchall()
        # print(f'variations: {result_set_3}')
        # variations = [Variation(**row) for row in result_set_3]
        prices = []
        for row in result_set_4:
            price = Price.make_from_DB_product(row) # (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7])
            prices.append(price)
            """
            index_category = category_index[price.id_category]
            index_product = categories[index_category].index_product_from_ids_product_permutation(price.id_product, price.id_permutation)
            categories[index_category].products[index_product].prices.append(price)
            """
            category_list.add_price(price)
        # print(f'prices: {prices}')
        # print(f'products: {[p.id_product for p in products]}')

        """
        # Currencies
        cursor.nextset()
        result_set_5 = cursor.fetchall()
        # print(f'variations: {result_set_3}')
        # variations = [Variation(**row) for row in result_set_3]
        prices = []
        for row in result_set_4:
            price = Price.make_from_DB_product(row) # (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7])
            prices.append(price)
            index_category = category_index[price.id_category]
            categories[index_category].products[index_category].product_index[price.id_product].prices.append(price)
        print(f'prices: {prices}')
        print(f'products: {[p.id_product for p in products]}')
        """

        # Images
        cursor.nextset()
        result_set_5 = cursor.fetchall()
        # print(f'images: {result_set_4}')
        # images = [Image(**row) for row in result_set_4]
        images = []
        for row in result_set_5:
            new_image = Image.make_from_DB_product(row) # (row[0], row[1], row[2], row[3], row[4])
            images.append(new_image)
            # products[product_index[new_image.id_product]].images.append(new_image)
            """
            index_category = category_index[new_image.id_category]
            index_product = categories[index_category].index_product_from_ids_product_permutation(new_image.id_product, new_image.id_permutation)
            categories[index_category].products[index_product].images.append(new_image)
            """
            category_list.add_image(new_image)
        # print(f'images: {images}')
        # print(f'products: {[p.id_product for p in products]}')
        
        # Delivery options
        cursor.nextset()
        result_set_7 = cursor.fetchall()
        delivery_options = []
        for row in result_set_7:
            new_delivery_option = Delivery_Option.make_from_DB_product(row) # (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9], row[10], row[11], row[12])
            delivery_options.append(new_delivery_option)
            # products[product_index[new_delivery_option.id_product]].delivery_options.append(new_delivery_option)
            """
            index_category = category_index[new_delivery_option.id_category]
            index_product = categories[index_category].index_product_from_ids_product_permutation(new_delivery_option.id_product, new_delivery_option.id_permutation)
            categories[index_category].products[index_product].delivery_options.append(new_delivery_option)
            """
            category_list.add_delivery_option(new_delivery_option)
        # print(f'delivery_options: {delivery_options}')
        # print(f'products: {products}')
        
        # Discounts
        cursor.nextset()
        result_set_8 = cursor.fetchall()
        discounts = []
        for row in result_set_8:
            new_discount = Discount.make_from_DB_product(row) # (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9], row[10])
            discounts.append(new_discount)
            # i_cat = category_index[new_discount.id_category]
            # categories[i_cat].products[categories[i_cat].product_index[new_delivery_option.id_product]].discounts.append(new_delivery_option)
            # categories[i_cat].products[categories[i_cat].product_index[new_delivery_option.id_product]].discount_index[new_discount.id_discount] = len(categories[i_cat].products[categories[i_cat].product_index[new_delivery_option.id_product]].discounts)
            # categories[i_cat].products[categories[i_cat].product_index[new_delivery_option.id_product]].discounts.append(new_discount)
            """
            index_category = category_index[new_discount.id_category]
            index_product = categories[index_category].index_product_from_ids_product_permutation(new_discount.id_product, new_discount.id_permutation)
            categories[index_category].products[index_product].add_discount(new_discount)
            """
            category_list.add_discount(new_discount)
        # print(f'discounts: {discounts}')
        # print(f'products: {products}')
        
        """
        # Delivery Regions
        cursor.nextset()
        result_set_6 = cursor.fetchall()
        delivery_regions = []
        for row in result_set_6:
            new_delivery_region = Delivery_Region.make_from_DB_product(row) # (row[0], row[1], row[2], row[3], row[4], row[5], row[6])
            delivery_regions.append(new_delivery_region)
            # products[product_index[new_delivery_option.id_product]].delivery_regions.append(new_delivery_region)
            i_cat = category_index[new_delivery_region.id_category]
            i_prod = categories[i_cat].product_index[new_delivery_region.id_product]
            categories[i_cat].products[i_prod].discounts[categories[i_cat].products[i_prod].
            categories[i_cat].products[i_prod].discounts[categories[i_cat].products[i_prod].discount_index[new_delivery_region.id_discount]].delivery_regions.append(new_delivery_region)
        print(f'delivery_regions: {delivery_regions}')
        print(f'products: {products}')
        """
        
        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        errors = []
        if len(result_set_e) > 0:
            errors = [SQL_Error.make_from_DB_record(row) for row in result_set_e] # (row[0], row[1])
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")
        
        category_list.get_all_variation_trees()
        """
        for category in category_list.categories:
            print(f'category: {category.name}')
            for product in category.products:
                permutation = product.get_permutation_selected()
                print(f'product: {product.name}\nselected permutation: {permutation}')
        """
        
        if len(errors) > 0:
            for error in errors:
                if error.code == 'PRODUCT_AVAILABILITY':
                    ids_permutation_unavailable = DataStore_Store.get_ids_permutation_from_error_availability(error.msg)
                    for id_permutation in ids_permutation_unavailable:
                        index_category = category_list.get_index_category_from_id_permutation(id_permutation)
                        category = category_list.categories[index_category]
                        index_product = category.get_index_product_from_id_permutation(id_permutation)
                        product = category.products[index_product]
                        index_permutation = product.get_index_permutation_from_id(id_permutation)
                        permutation = product.permutations[index_permutation]
                        permutation.is_available = False
                        if 'region' in error.msg or 'currency' in error.msg:
                            permutation.is_unavailable_in_currency_or_region = True
        
        return category_list, errors # categories, category_index
    
    def db_cursor_clear(cursor):
        while cursor.nextset():
            print(f'new result set: {cursor.fetchall()}')

    def get_ids_permutation_from_error_availability(msg_error_availability):
        ids_permutation = []
        index_colon = msg_error_availability.find(':', msg_error_availability.find(':'))
        msg_error_availability = msg_error_availability[index_colon + 1:]
        index_comma = 0
        while index_comma > -1:
            msg_error_availability = msg_error_availability[index_comma:]
            index_comma = msg_error_availability.find(',')
            ids_permutation.append(msg_error_availability[:index_comma])
        return ids_permutation
    
    # Stock Items
    def get_many_stock_item(self, stock_item_filters):
        # redundant argument validation? 
        _m = 'DataStore_Store.get_many_stock_item'
        av.val_instance(stock_item_filters, 'stock_item_filters', _m, Stock_Item_Filters)
        argument_dict = stock_item_filters.to_json()
        user = self.get_user_session()
        argument_dict['a_id_user'] = 1 # 'auth0|6582b95c895d09a70ba10fef' # id_user
        print(f'argument_dict: {argument_dict}')
        print('executing p_shop_get_many_stock_item')
        result = self.db_procedure_execute('p_shop_get_many_stock_item', argument_dict)
        cursor = result.cursor
        print('data received')
        # categories, category_index = DataStore_Store.input_many_product(cursor)
        category_list, errors = DataStore_Store.input_many_stock_item(cursor)
        DataStore_Store.db_cursor_clear(cursor)

        return category_list, errors # categories, category_index


    def input_many_stock_item(cursor):
        _m = 'DataStore_Store.input_many_stock_item'
        category_list = Category_List()
        # Categories
        result_set_1 = cursor.fetchall()
        print(f'raw categories: {result_set_1}')
        for row in result_set_1:
            new_stock_item = Stock_Item.make_from_DB_stock_item(row)
            # category_list.add_stock_item(new_stock_item, row)
            try:
                index_category = category_list.get_index_category_from_id(new_stock_item.id_category)
                # category_list.add_stock_item(new_stock_item)
                category = category_list.categories[index_category]
                """
                try:
                    index_product = category.get_index_product_from_id(new_stock_item.id_product)
                    product = category.products[index_product]
                    try:
                        index_permutation = product.get_index_permutation_from_id(new_stock_item.id_permutation)
                        permutation = product.permutations[index_permutation]
                        permutation.add_stock_item(new_stock_item)
                    except KeyError:
                        permutation = Product_Permutation.make_from_DB_stock_item(row)
                        permutation.add_stock_item(new_stock_item)
                        product.add_permutation(permutation)
                except KeyError:
                    product = Product.make_from_DB_stock_item(row)
                    permutation = Product_Permutation.make_from_DB_stock_item(row)
                    permutation.add_stock_item(new_stock_item)
                    product.add_permutation(permutation)
                    category_list.add_product(product)
                """
            except KeyError:
                new_category = Category.make_from_DB_stock_item(row)
                """
                product = Product.make_from_DB_stock_item(row)
                permutation = Product_Permutation.make_from_DB_stock_item(row)
                permutation.add_stock_item(new_stock_item)
                product.add_permutation(permutation)
                new_category.add_product(product)
                """
                category_list.add_category(new_category)
            try:
                index_product = category.get_index_product_from_id(new_stock_item.id_product)
                product = category.products[index_product]
            except KeyError:
                new_product = Product.make_from_DB_stock_item(row)
                category_list.add_product(new_product)
            try:
                index_permutation = product.get_index_permutation_from_id(new_stock_item.id_permutation)
                permutation = product.permutations[index_permutation]
                permutation.add_stock_item(new_stock_item)
            except KeyError:
                new_permutation = Product_Permutation.make_from_DB_stock_item(row)
                product.add_permutation(new_permutation)
            category_list.add_stock_item(new_stock_item)
        
        # Variations
        cursor.nextset()
        result_set_3 = cursor.fetchall()
        variations = []
        for row in result_set_3:
            new_variation = Variation.make_from_DB_product(row)
            variations.append(new_variation)
            category_list.add_variation(new_variation)
        
        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        errors = []
        if len(result_set_e) > 0:
            errors = [SQL_Error.make_from_DB_record(row) for row in result_set_e] # (row[0], row[1])
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")
        
        category_list.get_all_variation_trees()
        """
        for category in category_list.categories:
            print(f'category: {category.name}')
            for product in category.products:
                permutation = product.get_permutation_selected()
                print(f'product: {product.name}\nselected permutation: {permutation}')
        """
        
        if len(errors) > 0:
            for error in errors:
                if error.code == 'PRODUCT_AVAILABILITY':
                    ids_permutation_unavailable = DataStore_Store.get_ids_permutation_from_error_availability(error.msg)
                    for id_permutation in ids_permutation_unavailable:
                        index_category = category_list.get_index_category_from_id_permutation(id_permutation)
                        category = category_list.categories[index_category]
                        index_product = category.get_index_product_from_id_permutation(id_permutation)
                        product = category.products[index_product]
                        index_permutation = product.get_index_permutation_from_id(id_permutation)
                        permutation = product.permutations[index_permutation]
                        permutation.is_available = False
                        if 'region' in error.msg or 'currency' in error.msg:
                            permutation.is_unavailable_in_currency_or_region = True
        
        return category_list, errors # categories, category_index
    

    def get_many_user_order(self, id_user, ids_order, n_order_max, id_checkout_session):
        _m = 'Model_View_Store.get_many_user_order'
        # av.val_str(id_user)
        # validation conducted by server

        argument_dict_list = {
            'a_id_user': id_user,
            'a_ids_order': ids_order,
            'a_n_order_max': n_order_max,
            'a_id_checkout_session': id_checkout_session
        }

        print('executing p_shop_get_many_user_order')
        result = self.db_procedure_execute('p_shop_get_many_user_order', argument_dict_list)
        cursor = result.cursor
        print('data received')

        
        # Discount Delivery Regions
        cursor.nextset()
        result_set_1 = cursor.fetchall()
        orders = []
        for row in result_set_1:
            new_order = Order(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
            orders.append(new_order)
        print(f'orders: {orders}')        
        
        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.make_from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_e]
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")

        DataStore_Store.db_cursor_clear(cursor)

        return orders
    
    def get_many_stripe_product_new(self):
        _m = 'Model_View_Store.get_many_stripe_product_new'
        _m_db = 'p_shop_get_many_stripe_product_new'
        # av.val_str(id_user)
        # validation conducted by server

        argument_dict_list = {
            'a_id_user': self.info_user
        }

        print(f'executing {_m_db}')
        result = self.db_procedure_execute(_m_db, argument_dict_list)
        cursor = result.cursor
        print('data received')

        
        # Products
        cursor.nextset()
        result_set_1 = cursor.fetchall()
        products = []
        for row in result_set_1:
            new_product = Product.make_from_DB_Stripe_product(row) # Product(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9], row[10], row[11], row[12], row[13], row[14], row[15], row[16], row[17], row[18], row[19])
            products.append(new_product)
        print(f'products: {products}')        
        
        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.make_from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_e]
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")

        DataStore_Store.db_cursor_clear(cursor)

        return products
    
    def get_many_stripe_price_new(self):
        _m = 'Model_View_Store.get_many_stripe_price_new'
        _m_db = 'p_shop_get_many_stripe_price_new'
        # av.val_str(id_user)
        # validation conducted by server

        argument_dict_list = {
            'a_id_user': self.info_user
        }

        print(f'executing {_m_db}')
        result = self.db_procedure_execute(_m_db, argument_dict_list)
        cursor = result.cursor
        print('data received')

        
        # Products
        cursor.nextset()
        result_set_1 = cursor.fetchall()
        products = []
        for row in result_set_1:
            new_product = Product.make_from_DB_Stripe_price(row) # Product(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9], row[10], row[11], row[12], row[13], row[14], row[15], row[16], row[17], row[18], row[19])
            products.append(new_product)
        print(f'products: {products}')        
        
        # Errors
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.make_from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_e]
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")

        DataStore_Store.db_cursor_clear(cursor)

        return products
    
    def get_many_product_new(self):
        _m = 'Model_View_Store.get_many_product_new'
        # Stripe
        new_products = self.get_many_stripe_product_new()
        for product in new_products:
            product.id_stripe_product = self.create_stripe_product(product)
        return new_products
    
    def get_many_price_new(self):
        _m = 'Model_View_Store.get_many_product_new'
        # Stripe
        new_products = self.get_many_stripe_price_new()
        for product in new_products:
            product.id_stripe_price = self.create_stripe_price(product)
        return new_products

    # Stripe
    def create_stripe_product(self, product): # _name, product_description):
        _m = 'Model_View_Store_Checkout.create_stripe_product'
        # av.val_str(product_name, 'product_name', _m)
        # av.val_str(product_description, 'product_description', _m)
        av.val_instance(product, 'product', _m, Product)

        print(f'stripe.api_key = {stripe.api_key}')
        new_product = stripe.Product.create(
            name = product.name,
            description = product.description,
        )

        # Save these identifiers
        print(f"Success! Here is your new Stripe product id: {new_product.id}")

        return new_product.id
    
    def create_stripe_price(self, product, currency): # product_id, product_price, product_currency, product_is_subscription, product_recurring_interval = '', product_interval_count = 0):
        _m = 'Model_View_Store_Checkout.create_stripe_price'
        """
        av.val_str(p_id, 'p_id', _m)
        av.full_val_float(p_price, 'p_price', _m, 0.01)
        p_price = round(p_price, 2)
        av.val_str(p_currency, 'p_currency', _m)
        av.full_val_bool(p_is_subscription, 'p_is_subscription', _m)
        p_is_subscription = bool(p_is_subscription)
        av.val_str(p_recurring_interval, 'p_recurring_interval', _m)
        av.full_val_int(p_interval_count, 'p_interval_count', _m, 1 if p_is_subscription else 0)
        p_interval_count = int(p_interval_count)
        """
        av.val_instance(product, 'product', _m, Product)
        av.val_str(currency, 'currency', _m)

        print(f'stripe.api_key = {stripe.api_key}')

        new_product_price = stripe.Price.create(
            unit_amount = product.unit_price,
            currency = currency,
            recurring = { "interval": product.name_recurring_interval, "interval_count": product.count_recurring_interval } if product.is_subscription else None,
            product = product.id_stripe_product
        )

        # Save these identifiers
        print(f"Success! Here is your Stripe product price id: {new_product_price.id} for {product.name}")

        return new_product_price.id
    
    def get_regions_and_currencies(self):
        _m = 'Model_View_Store.get_regions_and_currencies'
        _m_db_currency = 'p_shop_get_many_currency'
        _m_db_region = 'p_shop_get_many_region'

        argument_dict_list_currency = {
            'a_get_inactive_currency': 0
        }
        argument_dict_list_region = {
            'a_get_inactive_currency': 0
        }

        print(f'executing {_m_db_currency}')
        result = self.db_procedure_execute(_m_db_currency, argument_dict_list_currency)
        cursor = result.cursor
        print('data received')

        # cursor.nextset()
        result_set_1 = cursor.fetchall()
        currencies = []
        for row in result_set_1:
            currency = Currency.make_from_DB_currency(row)
            currencies.append(currency)
        print(f'currencies: {currencies}')
        DataStore_Store.db_cursor_clear(cursor)

        print(f'executing {_m_db_region}')
        result = self.db_procedure_execute(_m_db_region, argument_dict_list_region)
        cursor = result.cursor
        print('data received')

        # cursor.nextset()
        result_set_1 = cursor.fetchall()
        regions = []
        for row in result_set_1:
            region = Delivery_Region.make_from_DB_region(row)
            regions.append(region)
        print(f'regions: {regions}')
        DataStore_Store.db_cursor_clear(cursor)

        return regions, currencies
    
    def get_metadata_basket(json_request):
        try:
            basket = json_request[DataStore_Store.KEY_BASKET]
        except KeyError:
            basket = {DataStore_Store.KEY_IS_INCLUDED_VAT: True, DataStore_Store.KEY_ID_CURRENCY: 1, DataStore_Store.KEY_ID_REGION_DELIVERY: 1}
        is_included_VAT = basket[DataStore_Store.KEY_IS_INCLUDED_VAT]
        id_currency = basket[DataStore_Store.KEY_ID_CURRENCY]
        id_region_delivery = basket[DataStore_Store.KEY_ID_REGION_DELIVERY]
        return id_currency, id_region_delivery, is_included_VAT

    def get_user_session(self):
        return User.from_json(self.session.get(User.KEY_USER))
        user = User.get_default()
        try:
            print(f'user session: {session[self.app.ID_TOKEN_USER]}')
            info_user = session[self.app.ID_TOKEN_USER].get('userinfo')
            print(f'info_user: {info_user}')
            user.is_logged_in = ('sub' in list(info_user.keys()) and not info_user['sub'] == '' and not str(type(info_user['sub'])) == "<class 'NoneType'?")
            user.id_user_auth0 = info_user['sub'] if user.is_logged_in else None
            print(f'user.id_user_auth0: {user.id_user_auth0}')
        except:
            print('get user login failed')
        return user
    
    def get_user_auth0(self):
        return User.from_json_auth0(self.session.get(self.app.ID_TOKEN_USER))
        
    def save_permutations(self, comment, permutations):
        _m = 'DataStore_Store.save_permutations'
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

    def get_many_user(self, user_filters, user=None):
        _m = 'DataStore_Store.get_many_user'
        print(_m)
        # av.val_str(user_filters, 'user_filters', _m)
        # av.val_list(permutations, 'list_permutations', _m, Product_Permutation, 1)
        av.val_instance(user_filters, 'user_filters', _m, User_Filters)

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
        }
        # argument_dict_list['a_guid'] = guid
        result = self.db_procedure_execute('p_get_many_user', argument_dict_list)
        """
        query = text(f"SELECT * FROM Shop_User_Eval_Temp UE_T WHERE UE_T.guid = '{guid}'")
        result = self.db.session.execute(query)
        """
        cursor = result.cursor
        result_set = cursor.fetchall()
        """
        user_permission_evals = []
        for row in result_set:
            user_permission_eval = User_Permission_Evaluation.make_from_DB_user_eval(row)
            user_permission_evals.append(user_permission_eval)
        print(f'user_permission_evals: {user_permission_evals}')
        """
        users = []
        for row in result_set:
            print(f'row: {row}')
            user = User.make_from_DB_user(row)
            users.append(user)
            print(f'user {str(type(user))}: {user}')
        print(f'type users: {str(type(users))}\n type user 0: {str(type(users[0]))}')
        # error_list, cursor = self.get_error_list_from_cursor(cursor)
        errors = []
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.make_from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_e]
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")

        DataStore_Store.db_cursor_clear(cursor)

        return users, errors

    def get_many_product_variation(self, variation_filters):
        _m = 'DataStore_Store.get_many_product_variation'
        print(_m)
        av.val_instance(variation_filters, 'variation_filters', _m, Variation_Filters)

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
        user = self.get_user_session()
        argument_dict_list = {
            # 'a_guid': guid
            'a_id_user': user.id_user
            , **variation_filters.to_json()
        }
        # argument_dict_list['a_guid'] = guid
        result = self.db_procedure_execute('p_shop_get_many_product_variation', argument_dict_list)

        cursor = result.cursor
        result_set = cursor.fetchall()
        
        # Variations
        variations = Variation_List()
        for row in result_set:
            new_variation = Variation.make_from_DB_variation(row) 
            variations.add_variation(new_variation)

        errors = []
        cursor.nextset()
        result_set_e = cursor.fetchall()
        print(f'raw errors: {result_set_e}')
        if len(result_set_e) > 0:
            errors = [SQL_Error.make_from_DB_record(row) for row in result_set_e] # [SQL_Error(row[0], row[1]) for row in result_set_e]
            for error in errors:
                print(f"Error [{error.code}]: {error.msg}")

        DataStore_Store.db_cursor_clear(cursor)

        return variations, errors