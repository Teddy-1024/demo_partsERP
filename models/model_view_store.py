"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Store Parent View Model

Description:
Parent data model for store views
"""


# internal
# from context import models
from business_objects.store.store_base import Store_Base
from business_objects.store.product import Product, Parameters_Product, Product_Permutation # Product_Image_Filters, 
# from business_objects.store.product_category import Filters_Product_Category
from business_objects.store.image import Resolution_Level_Enum
from business_objects.store.product_category import Product_Category
from business_objects.store.product_variation import Product_Variation, Parameters_Product_Variation
from business_objects.store.stock_item import Stock_Item
from datastores.datastore_store_base import DataStore_Store_Base
from datastores.datastore_user import DataStore_User
from forms.forms import Form_Basket_Edit, Form_Is_Included_VAT, Form_Delivery_Region, Form_Currency
from helpers.helper_app import Helper_App
import lib.argument_validation as av
from models.model_view_base import Model_View_Base
# external
from flask import send_file, jsonify
from flask_sqlalchemy import SQLAlchemy
import locale
from typing import ClassVar
from abc import abstractmethod


class Model_View_Store(Model_View_Base):
    ATTR_FORM_TYPE: ClassVar[str] = 'form-type'
    ATTR_ID_CUSTOMER: ClassVar[str] = 'id-customer'
    ATTR_ID_CUSTOMER_ADDRESS: ClassVar[str] = Store_Base.ATTR_ID_CUSTOMER_ADDRESS
    ATTR_ID_CUSTOMER_SALES_ORDER: ClassVar[str] = 'id-customer-sales-order'
    ATTR_ID_DELIVERY_OPTION: ClassVar[str] = Store_Base.ATTR_ID_DELIVERY_OPTION
    ATTR_ID_DISCOUNT: ClassVar[str] = Store_Base.ATTR_ID_DISCOUNT
    ATTR_ID_MANUFACTURING_PURCHASE_ORDER: ClassVar[str] = Store_Base.ATTR_ID_MANUFACTURING_PURCHASE_ORDER
    ATTR_ID_MANUFACTURING_PURCHASE_ORDER_PRODUCT_LINK: ClassVar[str] = Store_Base.ATTR_ID_MANUFACTURING_PURCHASE_ORDER_PRODUCT_LINK
    ATTR_ID_PLANT: ClassVar[str] = 'id-plant'
    ATTR_ID_PRODUCT : ClassVar[str] = Product.ATTR_ID_PRODUCT
    ATTR_ID_PRODUCT_CATEGORY: ClassVar[str] = Product.ATTR_ID_PRODUCT_CATEGORY
    ATTR_ID_PRODUCT_PERMUTATION : ClassVar[str] = Product.ATTR_ID_PRODUCT_PERMUTATION
    ATTR_ID_PRODUCT_PRICE: ClassVar[str] = Product.ATTR_ID_PRODUCT_PRICE
    ATTR_ID_PRODUCT_VARIATION : ClassVar[str] = Product_Variation.ATTR_ID_PRODUCT_VARIATION 
    ATTR_ID_PRODUCT_VARIATION_TYPE : ClassVar[str] = Product_Variation.ATTR_ID_PRODUCT_VARIATION_TYPE 
    ATTR_ID_STOCK_ITEM: ClassVar[str] = Store_Base.ATTR_ID_STOCK_ITEM
    ATTR_ID_STORAGE_LOCATION: ClassVar[str] = Store_Base.ATTR_ID_STORAGE_LOCATION
    ATTR_ID_SUPPLIER: ClassVar[str] = Store_Base.ATTR_ID_SUPPLIER
    ATTR_ID_SUPPLIER_ADDRESS: ClassVar[str] = Store_Base.ATTR_ID_SUPPLIER_ADDRESS
    ATTR_ID_SUPPLIER_PURCHASE_ORDER: ClassVar[str] = Store_Base.ATTR_ID_SUPPLIER_PURCHASE_ORDER
    ATTR_ID_SUPPLIER_PURCHASE_ORDER_PRODUCT_LINK: ClassVar[str] = Store_Base.ATTR_ID_SUPPLIER_PURCHASE_ORDER_PRODUCT_LINK
    ATTR_ID_UNIT_MEASUREMENT_LATENCY_MANUFACTURE: ClassVar[str] = Product_Permutation.ATTR_ID_UNIT_MEASUREMENT_LATENCY_MANUFACTURE
    ATTR_ID_UNIT_MEASUREMENT_QUANTITY: ClassVar[str] = Product_Permutation.ATTR_ID_UNIT_MEASUREMENT_QUANTITY
    FLAG_BUTTON_BASKET_ADD : ClassVar[str] = Model_View_Base.FLAG_SUBMIT + '.buttonAddToBasket'
    FLAG_BUTTON_BUY_NOW : ClassVar[str] = 'buttonBuyNow'
    FLAG_COST_TOTAL_LOCAL_VAT_EXCL: ClassVar[str] = Store_Base.FLAG_COST_TOTAL_LOCAL_VAT_EXCL
    FLAG_COST_TOTAL_LOCAL_VAT_INCL: ClassVar[str] = Store_Base.FLAG_COST_TOTAL_LOCAL_VAT_INCL
    FLAG_COST_UNIT_LOCAL_VAT_EXCL: ClassVar[str] = Store_Base.FLAG_COST_UNIT_LOCAL_VAT_EXCL
    FLAG_COST_UNIT_LOCAL_VAT_INCL: ClassVar[str] = Store_Base.FLAG_COST_UNIT_LOCAL_VAT_INCL
    FLAG_COUNT_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED: ClassVar[str] = Product_Permutation.FLAG_COUNT_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED
    FLAG_COUNT_UNIT_MEASUREMENT_INTERVAL_RECURRENCE: ClassVar[str] = Product_Permutation.FLAG_COUNT_UNIT_MEASUREMENT_INTERVAL_RECURRENCE
    FLAG_COUNT_UNIT_MEASUREMENT_PER_QUANTITY_STEP: ClassVar[str] = Product_Permutation.FLAG_COUNT_UNIT_MEASUREMENT_PER_QUANTITY_STEP
    FLAG_CURRENCY_COST: ClassVar[str] = Product_Permutation.FLAG_CURRENCY_COST
    FLAG_CUSTOMER: ClassVar[str] = Store_Base.FLAG_CUSTOMER
    FLAG_CUSTOMER_ADDRESS: ClassVar[str] = Store_Base.FLAG_CUSTOMER_ADDRESS
    FLAG_CUSTOMER_SALES_ORDER: ClassVar[str] = Store_Base.FLAG_CUSTOMER_SALES_ORDER
    FLAG_DATE_CONSUMED: ClassVar[str] = Stock_Item.FLAG_DATE_CONSUMED
    FLAG_DATE_EXPIRATION: ClassVar[str] = Stock_Item.FLAG_DATE_EXPIRATION
    FLAG_DATE_PURCHASED: ClassVar[str] = Stock_Item.FLAG_DATE_PURCHASED
    FLAG_DATE_RECEIVED: ClassVar[str] = Stock_Item.FLAG_DATE_RECEIVED
    FLAG_DATE_UNSEALED: ClassVar[str] = Stock_Item.FLAG_DATE_UNSEALED
    FLAG_DISCOUNT: ClassVar[str] = Store_Base.FLAG_DISCOUNT
    FLAG_DOES_EXPIRE_FASTER_ONCE_UNSEALED: ClassVar[str] = Product_Permutation.FLAG_DOES_EXPIRE_FASTER_ONCE_UNSEALED
    FLAG_HAS_VARIATIONS: ClassVar[str] = Product_Permutation.FLAG_HAS_VARIATIONS
    FLAG_ID_STRIPE_PRODUCT: ClassVar[str] = Product_Permutation.FLAG_ID_STRIPE_PRODUCT
    FLAG_IS_CONSUMED: ClassVar[str] = Stock_Item.FLAG_IS_CONSUMED
    FLAG_IS_NOT_EMPTY: ClassVar[str] = Store_Base.FLAG_IS_NOT_EMPTY
    FLAG_IS_OUT_OF_STOCK: ClassVar[str] = Store_Base.FLAG_IS_OUT_OF_STOCK
    FLAG_IS_SEALED: ClassVar[str] = Stock_Item.FLAG_IS_SEALED
    FLAG_IS_SUBSCRIPTION: ClassVar[str] = Product_Permutation.FLAG_IS_SUBSCRIPTION
    FLAG_LATENCY_DELIVERY_DAYS: ClassVar[str] = Store_Base.FLAG_LATENCY_DELIVERY_DAYS
    FLAG_LATENCY_MANUFACTURE: ClassVar[str] = Product_Permutation.FLAG_LATENCY_MANUFACTURE
    FLAG_MANUFACTURING_PURCHASE_ORDER: ClassVar[str] = Store_Base.FLAG_MANUFACTURING_PURCHASE_ORDER
    FLAG_NAME_PLURAL_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED: ClassVar[str] = Product_Permutation.FLAG_NAME_PLURAL_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED
    FLAG_NAME_PLURAL_UNIT_MEASUREMENT_INTERVAL_RECURRENCE: ClassVar[str] = Product_Permutation.FLAG_NAME_PLURAL_UNIT_MEASUREMENT_INTERVAL_RECURRENCE
    FLAG_NAME_PLURAL_UNIT_MEASUREMENT_QUANTITY: ClassVar[str] = Product_Permutation.FLAG_NAME_PLURAL_UNIT_MEASUREMENT_QUANTITY
    FLAG_NAME_SINGULAR_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED: ClassVar[str] = Product_Permutation.FLAG_NAME_SINGULAR_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED
    FLAG_NAME_SINGULAR_UNIT_MEASUREMENT_INTERVAL_RECURRENCE: ClassVar[str] = Product_Permutation.FLAG_NAME_SINGULAR_UNIT_MEASUREMENT_INTERVAL_RECURRENCE
    FLAG_NAME_SINGULAR_UNIT_MEASUREMENT_QUANTITY: ClassVar[str] = Product_Permutation.FLAG_NAME_SINGULAR_UNIT_MEASUREMENT_QUANTITY
    FLAG_ORDER_ITEMS: ClassVar[str] = Store_Base.FLAG_ORDER_ITEMS
    FLAG_PLANT: ClassVar[str] = Store_Base.FLAG_PLANT
    FLAG_PRICE_TOTAL_LOCAL_VAT_EXCL: ClassVar[str] = Store_Base.FLAG_PRICE_TOTAL_LOCAL_VAT_EXCL
    FLAG_PRICE_TOTAL_LOCAL_VAT_INCL: ClassVar[str] = Store_Base.FLAG_PRICE_TOTAL_LOCAL_VAT_INCL
    FLAG_PRICE_UNIT_LOCAL_VAT_EXCL: ClassVar[str] = Store_Base.FLAG_PRICE_UNIT_LOCAL_VAT_EXCL
    FLAG_PRICE_UNIT_LOCAL_VAT_INCL: ClassVar[str] = Store_Base.FLAG_PRICE_UNIT_LOCAL_VAT_INCL
    FLAG_PRODUCT: ClassVar[str] = Store_Base.FLAG_PRODUCT
    FLAG_PRODUCT_CATEGORY: ClassVar[str] = Store_Base.FLAG_PRODUCT_CATEGORY
    FLAG_PRODUCT_PERMUTATION: ClassVar[str] = Store_Base.FLAG_PRODUCT_PERMUTATION
    FLAG_PRODUCT_PRICE: ClassVar[str] = Store_Base.FLAG_PRODUCT_PRICE
    FLAG_PRODUCT_VARIATION: ClassVar[str] = Store_Base.FLAG_PRODUCT_VARIATION
    FLAG_PRODUCT_VARIATIONS: ClassVar[str] = Store_Base.FLAG_PRODUCT_VARIATIONS
    FLAG_PRODUCT_VARIATION_TYPE: ClassVar[str] = Store_Base.FLAG_PRODUCT_VARIATION_TYPE
    FLAG_PROFIT_LOCAL_MIN: ClassVar[str] = Product_Permutation.FLAG_PROFIT_LOCAL_MIN
    FLAG_QUANTITY: ClassVar[str] = 'quantity'
    FLAG_QUANTITY_MAX: ClassVar[str] = Product_Permutation.FLAG_QUANTITY_MAX
    FLAG_QUANTITY_MIN: ClassVar[str] = Product_Permutation.FLAG_QUANTITY_MIN
    FLAG_QUANTITY_ORDERED: ClassVar[str] = Store_Base.FLAG_QUANTITY_ORDERED
    FLAG_QUANTITY_RECEIVED: ClassVar[str] = Store_Base.FLAG_QUANTITY_RECEIVED
    FLAG_QUANTITY_STOCK: ClassVar[str] = Product_Permutation.FLAG_QUANTITY_STOCK
    FLAG_REGION: ClassVar[str] = Store_Base.FLAG_REGION
    FLAG_STOCK_ITEM: ClassVar[str] = Store_Base.FLAG_STOCK_ITEM
    FLAG_STORAGE_LOCATION: ClassVar[str] = Store_Base.FLAG_STORAGE_LOCATION
    FLAG_SUPPLIER: ClassVar[str] = Store_Base.FLAG_SUPPLIER
    FLAG_SUPPLIER_ADDRESS: ClassVar[str] = Store_Base.FLAG_SUPPLIER_ADDRESS
    FLAG_SUPPLIER_PURCHASE_ORDER: ClassVar[str] = Store_Base.FLAG_SUPPLIER_PURCHASE_ORDER
    FLAG_SYMBOL_CURRENCY_COST: ClassVar[str] = Product_Permutation.FLAG_SYMBOL_CURRENCY_COST
    FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED: ClassVar[str] = Product_Permutation.FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED
    FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX_UNIT_MEASUREMENT_INTERVAL_RECURRENCE: ClassVar[str] = Product_Permutation.FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX_UNIT_MEASUREMENT_INTERVAL_RECURRENCE
    FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX_UNIT_MEASUREMENT_QUANTITY: ClassVar[str] = Product_Permutation.FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX_UNIT_MEASUREMENT_QUANTITY
    FLAG_SYMBOL_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED: ClassVar[str] = Product_Permutation.FLAG_SYMBOL_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED
    FLAG_SYMBOL_UNIT_MEASUREMENT_INTERVAL_RECURRENCE: ClassVar[str] = Product_Permutation.FLAG_SYMBOL_UNIT_MEASUREMENT_INTERVAL_RECURRENCE
    FLAG_SYMBOL_UNIT_MEASUREMENT_QUANTITY: ClassVar[str] = Product_Permutation.FLAG_SYMBOL_UNIT_MEASUREMENT_QUANTITY
    FLAG_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED: ClassVar[str] = Product_Permutation.FLAG_UNIT_MEASUREMENT_INTERVAL_EXPIRATION_UNSEALED
    FLAG_UNIT_MEASUREMENT_INTERVAL_RECURRENCE: ClassVar[str] = Product_Permutation.FLAG_UNIT_MEASUREMENT_INTERVAL_RECURRENCE
    FLAG_UNIT_MEASUREMENT_LATENCY_MANUFACTURE: ClassVar[str] = Store_Base.FLAG_UNIT_MEASUREMENT_LATENCY_MANUFACTURE
    FLAG_UNIT_MEASUREMENT_QUANTITY: ClassVar[str] = Product_Permutation.FLAG_UNIT_MEASUREMENT_QUANTITY
    HASH_GET_STORE_CUSTOMER_SALES_ORDER: ClassVar[str] = '/store/customer_sales_order_get'
    HASH_GET_STORE_MANUFACTURING_PURCHASE_ORDER: ClassVar[str] = '/store/manufacturing_purchase_order_get'
    HASH_GET_STORE_PRODUCT: ClassVar[str] = '/store/product_get'
    HASH_GET_STORE_PRODUCT_CATEGORY: ClassVar[str] = '/store/category_get'
    HASH_GET_STORE_PRODUCT_PERMUTATION: ClassVar[str] = '/store/permutation_get'
    HASH_GET_STORE_PRODUCT_VARIATION: ClassVar[str] = '/store/product_variation_get'
    HASH_GET_STORE_STOCK_ITEM: ClassVar[str] = '/store/stock_item_get'
    HASH_GET_STORE_SUPPLIER: ClassVar[str] = '/store/supplier_get'
    HASH_GET_STORE_SUPPLIER_PURCHASE_ORDER: ClassVar[str] = '/store/supplier_purchase_order_get'
    HASH_PAGE_STORE_BASKET : ClassVar[str] = '/store/basket'
    HASH_SAVE_STORE_CUSTOMER_SALES_ORDER: ClassVar[str] = '/store/save_customer_sales_order'
    HASH_SAVE_STORE_MANUFACTURING_PURCHASE_ORDER: ClassVar[str] = '/store/save_manufacturing_purchase_order'
    HASH_SAVE_STORE_PRODUCT: ClassVar[str] = '/store/save_product'
    HASH_SAVE_STORE_PRODUCT_CATEGORY: ClassVar[str] = '/store/save_category'
    HASH_SAVE_STORE_PRODUCT_PERMUTATION: ClassVar[str] = '/store/save_permutation'
    HASH_SAVE_STORE_PRODUCT_VARIATION: ClassVar[str] = '/store/save_product_variation'
    HASH_SAVE_STORE_STOCK_ITEM: ClassVar[str] = '/store/save_stock_item'
    HASH_SAVE_STORE_SUPPLIER: ClassVar[str] = '/store/save_supplier'
    HASH_SAVE_STORE_SUPPLIER_PURCHASE_ORDER: ClassVar[str] = '/store/save_supplier_purchase_order'
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
    ID_BUTTON_BASKET_ADD : ClassVar[str] = 'buttonBasketAdd'
    ID_BUTTON_BUY_NOW : ClassVar[str] = 'buttonBuyNow'
    ID_BUTTON_CHECKOUT : ClassVar[str] = 'buttonCheckout'
    ID_CURRENCY : ClassVar[str] = Form_Currency.id_id_currency
    ID_CURRENCY_DEFAULT : ClassVar[str] = 1
    ID_LABEL_BASKET_EMPTY : ClassVar[str] = 'basketEmpty'
    ID_PRODUCT_CATEGORY_DEFAULT: ClassVar[str] = 1
    ID_REGION_DELIVERY_DEFAULT : ClassVar[str] = 1
    IS_INCLUDED_VAT_DEFAULT : ClassVar[str] = True
    TYPE_FORM_BASKET_ADD : ClassVar[str] = 'Form_Basket_Add'
    TYPE_FORM_BASKET_EDIT : ClassVar[str] = 'Form_Basket_Edit'
    
    @property
    def title(self):
        raise NotImplementedError('title must be implemented in child class')

    def __init__(self, hash_page_current, **kwargs):
        _m = 'Model_View_Store.__init__'
        Helper_App.console_log(f'{_m}\nstarting')
        super().__init__(hash_page_current=hash_page_current, **kwargs)
        self.is_page_store = True

    def get_many_product(self, product_filters):
        _m = 'Model_View_Store.get_many_product'
        av.val_instance(product_filters, 'product_filters', _m, Parameters_Product)
        
        self.category_list, errors = DataStore_Store_Base().get_many_product(product_filters)
    
    def get_many_product_image_src(self, product_id, image_ids = '', get_primary_only = True, resolution_level = ''):
        _m = 'Model_View_Store.get_many_product_image'
        av.val_int(product_id, 'product_id', _m)
        av.val_str(image_ids, 'image_ids', _m)
        av.full_val_bool(get_primary_only, 'get_primary_only', _m)
        get_primary_only = bool(get_primary_only)
        resolution_level = Resolution_Level_Enum.get_member_by_text(resolution_level)
        av.val_instance(resolution_level, 'resolution_level', _m, Resolution_Level_Enum)
        if (product_id not in Model_View_Store.valid_product_id_list): 
            return ''
        path_suffix = 'jpg'
        path_file = f'/static/images/{product_id}.{path_suffix}'
        return path_file
    
    def get_many_user_order(self, ids_order, n_order_max, id_checkout_session):
        return DataStore_User().get_many_user_order(self.info_user['sub'], ids_order, n_order_max, id_checkout_session)
    
    def get_many_plant(self, get_inactive = False):
        plants = DataStore_Store_Base().get_many_plant(get_inactive)
        return plants
    def get_many_storage_location(self, get_inactive = False):
        storage_locations = DataStore_Store_Base().get_many_storage_location(get_inactive)
        return storage_locations
    def get_many_currency(self):
        currencies = DataStore_Store_Base().get_many_currency()
        return currencies
    def get_many_region(self):
        regions = DataStore_Store_Base().get_many_region()
        return regions
    def get_many_region_and_currency(self):
        regions, currencies = DataStore_Store_Base().get_many_region_and_currency()
        return regions, currencies
    
    def get_many_product_variation(self, variation_filters = None):
        if variation_filters is None:
            variation_filters = Parameters_Product_Variation.get_default()
        variation_types, variations, errors = DataStore_Store_Base().get_many_product_variation(variation_filters)
        return variation_types, variations, errors