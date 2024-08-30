"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Store Parent View Model

Description:
Parent data model for store views
"""

# IMPORTS
# VARIABLE INSTANTIATION
# METHODS

# IMPORTS
# internal
# from context import models
from models.model_view_base import Model_View_Base
from business_objects.store.product import Product, Product_Filters, Product_Permutation # Product_Image_Filters, 
from business_objects.store.image import Resolution_Level_Enum
import lib.argument_validation as av
from datastores.datastore_store_base import DataStore_Store_Base
from datastores.datastore_user import DataStore_User
from datastores.datastore_store_basket import DataStore_Store_Basket
from forms import Form_Basket_Edit, Form_Is_Included_VAT, Form_Delivery_Region, Form_Currency
from business_objects.store.basket import Basket_Item, Basket
from business_objects.store.product_category import Product_Category
from business_objects.store.product_variation import Product_Variation_Filters, Product_Variation
# external
from flask import send_file, jsonify
from flask_sqlalchemy import SQLAlchemy
import locale
from typing import ClassVar

# VARIABLE INSTANTIATION


# CLASSES
class Model_View_Store(Model_View_Base):
    # Global constants
    ATTR_FORM_TYPE: ClassVar[str] = 'form-type'
    ATTR_ID_CATEGORY: ClassVar[str] = Product.ATTR_ID_PRODUCT_CATEGORY
    # ATTR_ID_PRODUCT_CATEGORY : ClassVar[str] = 'id-product-category'
    ATTR_ID_PRODUCT : ClassVar[str] = Product.ATTR_ID_PRODUCT # 'id-product'
    ATTR_ID_PERMUTATION : ClassVar[str] = Product.ATTR_ID_PRODUCT_PERMUTATION # 'id-permutation'
    ATTR_ID_VARIATION : ClassVar[str] = Product_Variation.ATTR_ID_PRODUCT_VARIATION # 'id-variation'
    ATTR_ID_VARIATION_TYPE : ClassVar[str] = Product_Variation.ATTR_ID_PRODUCT_VARIATION_TYPE # 'id-variation-type'
    FLAG_BUTTON_BASKET_ADD : ClassVar[str] = Model_View_Base.FLAG_SUBMIT + '.buttonAdd2Basket'
    FLAG_BUTTON_BUY_NOW : ClassVar[str] = 'buttonBuyNow'
    FLAG_COST_LOCAL_VAT_INCL: ClassVar[str] = 'cost-local-VAT-incl'
    FLAG_CURRENCY: ClassVar[str] = 'currency'
    FLAG_DATE_CONSUMED: ClassVar[str] = 'date-consumed'
    FLAG_DATE_EXPIRATION: ClassVar[str] = 'date-expiration'
    FLAG_DATE_PURCHASED: ClassVar[str] = 'date-purchased'
    FLAG_DATE_RECEIVED: ClassVar[str] = 'date-received'
    FLAG_DATE_UNSEALED: ClassVar[str] = 'date-unsealed'
    FLAG_IS_OUT_OF_STOCK: ClassVar[str] = 'is-out-of-stock'
    FLAG_LOCATION_STORAGE: ClassVar[str] = 'storage-location'
    FLAG_PRODUCT: ClassVar[str] = 'product'
    FLAG_PRODUCT_CATEGORY: ClassVar[str] = 'category'
    FLAG_QUANTITY_MAX: ClassVar[str] = Product_Permutation.FLAG_QUANTITY_MAX # 'quantity-max'
    FLAG_QUANTITY_MIN: ClassVar[str] = Product_Permutation.FLAG_QUANTITY_MIN # 'quantity-min'
    FLAG_QUANTITY_STOCK: ClassVar[str] = Product_Permutation.FLAG_QUANTITY_STOCK # 'quantity-stock'
    FLAG_PLANT_STORAGE: ClassVar[str] = 'plant-storage'
    FLAG_REGION_STORAGE: ClassVar[str] = 'region-storage'
    FLAG_VARIATIONS: ClassVar[str] = 'variations'
    HASH_PAGE_STORE_BASKET : ClassVar[str] = '/store/basket'
    HASH_STORE_BASKET_ADD : ClassVar[str] = '/store/basket_add'
    HASH_STORE_BASKET_DELETE : ClassVar[str] = '/store/basket_delete'
    HASH_STORE_BASKET_EDIT : ClassVar[str] = '/store/basket_edit'
    HASH_STORE_BASKET_LOAD : ClassVar[str] = '/store/basket_load'
    HASH_STORE_SET_CURRENCY : ClassVar[str] = '/store/set_currency'
    HASH_STORE_SET_DELIVERY_REGION : ClassVar[str] = '/store/set_delivery_region'
    HASH_STORE_SET_IS_INCLUDED_VAT : ClassVar[str] = '/store/set_is_included_VAT'
    ID_BASKET : ClassVar[str] = 'basket'
    ID_BASKET_CONTAINER : ClassVar[str] = 'basketContainer'
    ID_BASKET_TOTAL : ClassVar[str] = 'basketTotal'
    ID_BUTTON_CHECKOUT : ClassVar[str] = 'buttonCheckout'
    ID_BUTTON_BASKET_ADD : ClassVar[str] = 'buttonBasketAdd'
    ID_BUTTON_BUY_NOW : ClassVar[str] = 'buttonBuyNow'
    ID_CATEGORY_DEFAULT: ClassVar[str] = 1
    ID_CURRENCY : ClassVar[str] = Form_Currency.id_id_currency # 'id_currency'
    ID_CURRENCY_DEFAULT : ClassVar[str] = 1
    ID_LABEL_BASKET_EMPTY : ClassVar[str] = 'basketEmpty'
    ID_REGION_DELIVERY : ClassVar[str] = Form_Delivery_Region.id_id_region_delivery # 'id_region_delivery'
    ID_REGION_DELIVERY_DEFAULT : ClassVar[str] = 1
    IS_INCLUDED_VAT_DEFAULT : ClassVar[str] = True
    KEY_BASKET : ClassVar[str] = Basket.KEY_BASKET # 'basket'
    # KEY_CODE_CURRENCY : ClassVar[str] = 'code_currency'
    # KEY_FORM : ClassVar[str] = 'form'
    KEY_ID_CURRENCY : ClassVar[str] = Basket.KEY_ID_CURRENCY # 'id_currency'
    KEY_ID_PRODUCT : ClassVar[str] = 'product_id'
    KEY_ID_PERMUTATION : ClassVar[str] = 'permutation_id'
    KEY_ID_REGION_DELIVERY : ClassVar[str] = Basket.KEY_ID_REGION_DELIVERY # 'id_region_delivery'
    KEY_IS_INCLUDED_VAT : ClassVar[str] = Basket.KEY_IS_INCLUDED_VAT # 'is_included_VAT'
    KEY_ITEMS : ClassVar[str] = Basket.KEY_ITEMS # 'items'
    KEY_NAME_VARIATION : ClassVar[str] = Product_Variation.KEY_NAME_VARIATION
    KEY_NAME_VARIATION_TYPE : ClassVar[str] = Product_Variation.KEY_NAME_VARIATION_TYPE
    KEY_PRICE : ClassVar[str] = 'price'
    KEY_PRODUCT_CATEGORY: ClassVar[str] = 'category'
    KEY_QUANTITY : ClassVar[str] = 'quantity'
    KEY_VALUE_DEFAULT : ClassVar[str] = 'default'
    TYPE_FORM_BASKET_ADD : ClassVar[str] = 'Form_Basket_Add'
    TYPE_FORM_BASKET_EDIT : ClassVar[str] = 'Form_Basket_Edit'
    # development variables
    # valid_product_id_list = ['prod_PB0NUOSEs06ymG']

    # Attributes
    # id_user: str
    # db: SQLAlchemy
    # basket: Basket # list # dict
    # basket_total: float
    """
    id_currency: bool
    id_region_delivery: bool
    is_included_VAT: bool
    show_delivery_option: bool # for checkout page
    """
    """
    def __new__(cls, db, info_user, app, id_currency, id_region_delivery, is_included_VAT): # , *args, **kwargs``
        # Initialiser - validation
        _m = 'Model_View_Store.__new__'
        v_arg_type = 'class attribute'
        print(f'{_m}\nstarting')
        # av.val_str(id_user, 'id_user', _m)
        # return super().__new__(cls, *args, **kwargs)
        # cls.FLAG_BUTTON_BASKET_ADD = cls.FLAG_BUTTON_SUBMIT + '.buttonAdd2Basket'
        return super().__new__(cls, db, info_user, app) # Model_View_Store, cls
    """

    def __init__(self, hash_page_current, **kwargs): # , id_currency, id_region_delivery, is_included_VAT):
        # Constructor
        _m = 'Model_View_Store.__init__'
        print(f'{_m}\nstarting')
        super().__init__(hash_page_current=hash_page_current, **kwargs)
        self.is_page_store = True
        """
        self.basket = Basket(id_currency, id_region_delivery, is_included_VAT)
        # self.basket_total = 0
        # self.db = db
        # if logged in:
        # else:
        self.id_currency = id_currency
        self.id_region_delivery = id_region_delivery
        self.is_included_VAT = is_included_VAT
        self.show_delivery_option = True
        self.form_is_included_VAT = Form_Is_Included_VAT()
        regions, currencies = self.get_regions_and_currencies()
        self.form_currency = Form_Currency(id_currency=self.id_currency)
        self.form_currency.id_currency.choices = [(currency.id_currency, f'{currency.code} - {currency.name}') for currency in currencies]
        self.form_currency.id_currency.data = str(self.id_currency) if len(currencies) > 0 else None
        self.form_delivery_region = Form_Delivery_Region(id_region_delivery=self.id_region_delivery)
        self.form_delivery_region.id_region_delivery.choices = [(region.id_region, f'{region.code} - {region.name}') for region in regions]
        self.form_delivery_region.id_region_delivery.data = str(self.id_region_delivery) if len(regions) > 0 else None
        """

    def get_many_product(self, product_filters): # category_ids = '', product_ids = '', get_all_category = True, get_all_product = True, max_products_per_category = -1):
        _m = 'Model_View_Store.get_many_product'
        av.val_instance(product_filters, 'product_filters', _m, Product_Filters)
        """
        av.val_str(category_ids, 'category_ids', _m)
        av.val_str(product_ids, 'product_ids', _m)
        av.val_bool(get_all_category, 'get_all_category', _m)
        av.val_bool(get_all_product, 'get_all_product', _m)
        av.val_int(max_products_per_category, 'max_products_per_category', _m)
        """
        # get products from database
        # call datastore method
        # return [Product.template()]
        self.category_list, errors = DataStore_Store_Base().get_many_product(product_filters) # category_ids, product_ids, get_all_category, get_all_product, max_products_per_category)
        # self.categories = categories
        # self.category_index = category_index
        
        return
        if get_all_category or get_all_product:
            prod = Product.template()
            prod_list = [ prod, prod ]
            return { 'MISCELLANEOUS': prod_list if max_products_per_category < 0 else prod_list[:max_products_per_category] }
        if product_ids == 'panties123':
            prod = Product.template()
            return { 'MISCELLANEOUS': [ prod] }
    
    # def product_category_getMany(self, category_ids = '', product_ids = '', get_all_category = True, get_all_product = True):
    #     return Model_View_Store.product_category_getMany(category_ids, product_ids, get_all_category, get_all_product)
    
    def get_many_product_image_src(self, product_id, image_ids = '', get_primary_only = True, resolution_level = ''):
        _m = 'Model_View_Store.get_many_product_image'
        # print(f'{_m}\n')
        # av.val_instance(filters, 'filters', _m, Product_Image_Filters)
        av.val_int(product_id, 'product_id', _m)
        # av.full_val_int(product_id, 'product_id', _m)
        # product_id = int(product_id)
        av.val_str(image_ids, 'image_ids', _m)
        av.full_val_bool(get_primary_only, 'get_primary_only', _m)
        get_primary_only = bool(get_primary_only)
        resolution_level = Resolution_Level_Enum.get_member_by_text(resolution_level)
        av.val_instance(resolution_level, 'resolution_level', _m, Resolution_Level_Enum)
        # if (filters.product_id < 0 or filters.product_id not in self.valid_product_id_list):
        if (product_id not in Model_View_Store.valid_product_id_list): # product_id < 0 or 
            return ''
        path_suffix = 'jpg' # get_suffix_from_product_id(product_id)
        path_file = f'/static/images/{product_id}.{path_suffix}'
        return path_file
        # return send_file(path_file, mimetype=f'image/{path_suffix}')
    
    """
    def get_product_category_text(self, category):
        return Enum_Product_Product_Category.get_member_by_text(category).text()
    
    def add_2_basket(product_id, quantity, basket_local):
        _m = 'Model_View_Store.add_2_basket'
        av.full_val_int(product_id, 'product_id', _m)
        product_id = str(product_id)
        av.full_val_int(quantity, 'quantity', _m)
        quantity = int(quantity)
        av.val_instance(basket_local, 'basket_local', _m, dict)
        # send to database

        # update basket on webpage with new database status
        if product_id in basket_local:
            basket_local[product_id] += quantity
        else:
            basket_local[product_id] = quantity
        return basket_local // jsonify(basket_local)
    """


    def basket_item_edit(self, permutation_id, quantity, quantity_sum_not_replace):
        _m = 'Model_View_Store.basket_item_edit'
        # av.full_val_int(product_id, 'product_id', _m)
        # product_id = int(product_id)
        # av.val_instance(db, 'db', _m, SQLAlchemy)
        print(f'{_m} starting')
        # print(f'product_id: {product_id}\npermutation_id: {permutation_id}\nquantity = {quantity}')
        # av.full_val_int(product_id, 'product_id', _m)
        # print('valid product id')
        av.full_val_int(quantity, 'quantity', _m)
        quantity = int(quantity)
        # item_added = False
        print(f'basket: {self.basket}')
        ids_permutation, quantities_permutation = self.basket.to_csv()
        self.basket = DataStore_Store_Basket().edit_basket(ids_permutation, quantities_permutation, permutation_id, quantity, quantity_sum_not_replace, self.id_currency, self.id_region_delivery, self.is_included_VAT)
        return True
    
    def get_basket(self, json_data):
        self.import_JSON_basket(json_data)
        if self.is_user_logged_in:
            ids_permutation, quantities_permutation = self.basket.to_csv()
            self.basket = DataStore_Store_Basket().edit_basket(ids_permutation, quantities_permutation, None, None, None, self.id_currency, self.id_region_delivery, self.is_included_VAT)
            # return self.basket
    
    def _get_json_basket_id_CSVs_product_permutation(self, basket):
        product_ids = ''
        permutation_ids = ''
        item_index_dict = {}
        if len(basket) > 0:
            for index_item in range(len(basket)):
                if index_item > 0:
                    product_ids += ','
                    permutation_ids += ','
                basket_item = basket[index_item]
                id_product = basket_item[self.KEY_ID_PRODUCT]
                id_permutation = basket_item[self.KEY_ID_PERMUTATION]
                id_permutation = '' if (id_permutation is None or id_permutation == 'None') else str(id_permutation)
                product_ids += str(id_product) # str(basket[b].product.id)
                permutation_ids += id_permutation # str(basket[b].product.id)
                # item_index_dict[Basket.get_key_product_index_from_ids_product_permutation(id_product, id_permutation)] = index_item
                item_index_dict[id_permutation] = index_item
        print(f'product_ids = {product_ids}')
        print(f'permutation_ids = {permutation_ids}')
        return product_ids, permutation_ids, item_index_dict

    def _get_basket_from_json(self, json_data):
        basket = json_data[self.KEY_BASKET]['items']
        av.val_instance(basket, 'basket', 'Model_View_Store._get_basket_from_json', list)
        print(f'basket = {basket}')
        return basket
        
    def import_JSON_basket(self, json_data):
        _m = 'Model_View_Store.import_JSON_basket'
        # av.val_instance(db, 'db', _m, SQLAlchemy)
        items = self._get_basket_from_json(json_data)
        basket = json_data[self.KEY_BASKET]
        id_currency = basket[self.KEY_ID_CURRENCY]
        id_region_delivery = basket[self.KEY_ID_REGION_DELIVERY]
        is_included_VAT = basket[self.KEY_IS_INCLUDED_VAT]
        print(f'json basket items: {items}')
        product_ids, permutation_ids, item_index_dict = self._get_json_basket_id_CSVs_product_permutation(items)
        category_list, errors = DataStore_Store_Base().get_many_product(Product_Filters(
            self.id_user, # :a_id_user
            True, '', False, # :a_get_all_category, :a_ids_category, :a_get_inactive_category
            False, product_ids, False, False, # :a_get_all_product, :a_ids_product, :a_get_inactive_product, :a_get_first_product_only
            False, permutation_ids, False, # :a_get_all_permutation, :a_ids_permutation, :a_get_inactive_permutation
            False, '', False, True, # :a_get_all_image, :a_ids_image, :a_get_inactive_image, :a_get_first_image_only
            False, str(id_region_delivery), False, # :a_get_all_delivery_region, :a_ids_delivery_region, :a_get_inactive_delivery_region
            False, str(id_currency), False, #  :a_get_all_currency, :a_ids_currency, :a_get_inactive_currency
            True, '', False # :a_get_all_discount, :a_ids_discount, :a_get_inactive_discount
        )) # product_ids=product_ids, get_all_category=False, get_all_product=False)
        # print(f'categories = {categories}')                    
        self.basket = Basket(id_currency, id_region_delivery, is_included_VAT)
        if len(category_list.categories) > 0: # not (categories is None):
            for category in category_list.categories:
                for product in category.products:
                    # product = Product.from_json(items[index_item])
                    product.form_basket_edit = Form_Basket_Edit()
                    # key_index_product = Basket.get_key_product_index_from_ids_product_permutation(product.id_product, product.get_id_permutation())
                    permutation = product.get_permutation_selected()
                    self.basket.add_item(Basket_Item.from_product_and_quantity_and_VAT_included(product, items[item_index_dict[str(permutation.id_permutation)]][self.KEY_QUANTITY], self.is_included_VAT))
        """
        if len(items) > 0:
            for index_item in range(len(items)):
        """
        print(f'basket data: {json_data}')
        print(f'basket: {self.basket}')

        # ids_permutation_unavailable_region_or_currency = []
        # id_permutation_unavailable_otherwise = []
        if len(errors) > 0:
            for error in errors:
                if error[1] == 'PRODUCT_AVAILABILITY':
                    ids_permutation = DataStore_Store_Base.get_ids_permutation_from_error_availability(error[2])
                    for id_permutation in ids_permutation:
                        for item in self.basket.items:
                            permutation = item.product.get_permutation_selected()
                            if id_permutation == permutation.id_permutation:
                                item.is_available = False
                                if 'region' in error[2] or 'currency' in error[2]:
                                    item.is_unavailable_in_currency_or_region = True
                                    # ids_permutation_unavailable_region_or_currency.append(id_permutation)
                                    # else:
                                        # for id_permutation in ids_permutation:
                                            # id_permutation_unavailable_otherwise.append(id_permutation)
        """
        ids_permutation_unavailable = self.basket.get_ids_permutation_unavailable()
        if len(ids_permutation_unavailable) > 0:
            category_list_unavailable, errors_unavailable = DataStore_Store().get_many_product(Product_Filters(
                self.id_user, # :a_id_user
                True, '', False, # :a_get_all_category, :a_ids_category, :a_get_inactive_category
                False, '', False, False, # :a_get_all_product, :a_ids_product, :a_get_inactive_product, :a_get_first_product_only
                False, ','.join(ids_permutation_unavailable), False, # :a_get_all_permutation, :a_ids_permutation, :a_get_inactive_permutation
                False, '', False, True, # :a_get_all_image, :a_ids_image, :a_get_inactive_image, :a_get_first_image_only
                True, '', False, # :a_get_all_delivery_region, :a_ids_delivery_region, :a_get_inactive_delivery_region
                True, '', False, #  :a_get_all_currency, :a_ids_currency, :a_get_inactive_currency
                True, '', False # :a_get_all_discount, :a_ids_discount, :a_get_inactive_discount
            )) # product_ids=product_ids, get_all_category=False, get_all_product=False)
        else:
            category_list_unavailable = None
            errors_unavailable = []
        """
        
    
    def import_JSON_basket_item(self, json_data, form_basket = None):
        _m = 'Model_View_Store.import_JSON_basket_item'
        print(f'starting {_m}')
        # print('getting product id')
        # product_id = av.input_int(json_data[self.key_id_product], self.key_id_product, _m)

        # print(f'product id: {product_id}, type: {str(type(product_id))}')
        try:
            permutation_id = json_data[self.KEY_ID_PERMUTATION]
            av.full_val_int(permutation_id, self.KEY_ID_PERMUTATION, _m)
            permutation_id = int(permutation_id)
        except:
            permutation_id = None
            if not permutation_id == 'None':
                print(f'permutation_id invalid: {permutation_id}')
                raise ValueError("Invalid permutation id")
        print(f'permutation_id: {permutation_id}')
            
        try:
            print(f'form_basket: {form_basket}')
            print('getting quantity')
            print(f'form_basket.quantity: {form_basket.quantity}')
            print(f'form_basket.quantity.data: {form_basket.quantity.data}')
            quantity = int(form_basket.quantity.data)
        except:
            quantity = 0
        print(f'quantity: {quantity}')

        print(f'permutation_id: {permutation_id}\nquantity: {quantity}')

        return permutation_id, quantity
    
    def output_basket_total(self):
        return self.basket.output_total()

    
    def init_forms_basket_add(self):
        for cat in self.categories:
            c = self.category_index
    
    def get_many_user_order(self, ids_order, n_order_max, id_checkout_session):
        # _m = 'Model_View_Store.get_many_user_order'
        # av.val_str(id_user)
        # validation conducted by server
        return DataStore_User().get_many_user_order(self.info_user['sub'], ids_order, n_order_max, id_checkout_session)
    
    def get_regions_and_currencies(self):
        regions, currencies = DataStore_Store_Base().get_regions_and_currencies()
        return regions, currencies
    
    def get_many_product_variation(self, variation_filters = None):
        if variation_filters is None:
            variation_filters = Product_Variation_Filters.get_default()
        variations, errors = DataStore_Store_Base().get_many_product_variation(variation_filters)
        return variations, errors