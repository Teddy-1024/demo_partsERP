"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Base View Model

Description:
Base data model for views
"""

# internal
# from routes import bp_home
from business_objects.base import Base
from business_objects.store.product_category import Product_Category
from business_objects.user import User, Parameters_User
from datastores.datastore_base import DataStore_Base
from datastores.datastore_user import DataStore_User
from forms.access_level import Filters_Access_Level
from forms.forms import Form_Is_Included_VAT, Form_Delivery_Region, Form_Currency
from forms.unit_measurement import Filters_Unit_Measurement
from helpers.helper_app import Helper_App
import lib.argument_validation as av
# external
from abc import ABC, abstractmethod
from flask_sqlalchemy import SQLAlchemy
from flask import Flask, session, current_app, jsonify
from pydantic import BaseModel, ConfigDict
from typing import ClassVar


class Model_View_Base(BaseModel, ABC):
    ATTR_ID_ACCESS_LEVEL: ClassVar[str] = Base.ATTR_ID_ACCESS_LEVEL
    ATTR_ID_ADDRESS: ClassVar[str] = Base.ATTR_ID_ADDRESS
    ATTR_ID_CURRENCY: ClassVar[str] = Base.ATTR_ID_CURRENCY
    ATTR_ID_REGION: ClassVar[str] = Base.ATTR_ID_REGION
    ATTR_TEXT_COLLAPSED: ClassVar[str] = 'textCollapsed'
    ATTR_TEXT_EXPANDED: ClassVar[str] = 'textExpanded'
    ATTR_VALUE_CURRENT: ClassVar[str] = 'current-value'
    ATTR_VALUE_PREVIOUS: ClassVar[str] = 'previous-value'
    FLAG_ACCESS_LEVEL: ClassVar[str] = 'access_level'
    FLAG_ACCESS_LEVEL_REQUIRED: ClassVar[str] = Product_Category.FLAG_ACCESS_LEVEL_REQUIRED
    FLAG_ACTIVE: ClassVar[str] = Base.FLAG_ACTIVE
    FLAG_ADD: ClassVar[str] = 'add'
    FLAG_ADDRESS: ClassVar[str] = Base.FLAG_ADDRESS
    FLAG_ADDRESS_LINE_1: ClassVar[str] = Base.FLAG_ADDRESS_LINE_1
    FLAG_ADDRESS_LINE_2: ClassVar[str] = Base.FLAG_ADDRESS_LINE_2
    FLAG_BOOL_FALSE: ClassVar[str] = 'false'
    FLAG_BOOL_TRUE: ClassVar[str] = 'true'
    FLAG_CANCEL: ClassVar[str] = 'button-cancel'
    FLAG_CALLBACK: ClassVar[str] = 'callback'
    FLAG_CARD: ClassVar[str] = 'card'
    FLAG_CITY: ClassVar[str] = Base.FLAG_CITY
    FLAG_CLOSE_TEMPORARY_ELEMENT: ClassVar[str] = 'button-temporary-element-close'
    FLAG_CODE: ClassVar[str] = Base.FLAG_CODE
    FLAG_COLLAPSED: ClassVar[str] = 'collapsed'
    FLAG_COLLAPSIBLE: ClassVar[str] = 'collapsible'
    FLAG_COLUMN: ClassVar[str] = 'column'
    FLAG_COMMENT: ClassVar[str] = 'comment'
    FLAG_CONTAINER: ClassVar[str] = 'container'
    FLAG_CONTAINER_ICON_AND_LABEL: ClassVar[str] = 'container-icon-label'
    FLAG_CONTAINER_INPUT: ClassVar[str] = FLAG_CONTAINER + '-input'
    FLAG_COUNTY: ClassVar[str] = Base.FLAG_COUNTY
    FLAG_CSRF_TOKEN: ClassVar[str] = 'X-CSRFToken'
    FLAG_CURRENCY: ClassVar[str] = 'currency'
    FLAG_DATA: ClassVar[str] = 'data'
    FLAG_DATE_FROM: ClassVar[str] = Base.FLAG_DATE_FROM
    FLAG_DATE_TO: ClassVar[str] = Base.FLAG_DATE_TO
    FLAG_DELETE: ClassVar[str] = 'delete'
    FLAG_DESCRIPTION: ClassVar[str] = Base.FLAG_DESCRIPTION
    FLAG_DETAIL: ClassVar[str] = 'detail'
    FLAG_DIALOG: ClassVar[str] = 'dialog'
    FLAG_DIRTY: ClassVar[str] = 'dirty'
    FLAG_DISPLAY_ORDER: ClassVar[str] = Base.FLAG_DISPLAY_ORDER
    FLAG_EDIT: ClassVar[str] = 'edit'
    FLAG_EMAIL: ClassVar[str] = Base.FLAG_EMAIL
    FLAG_ERROR: ClassVar[str] = 'error'
    FLAG_EXPANDED: ClassVar[str] = 'expanded'
    FLAG_FAILURE: ClassVar[str] = 'failure'
    FLAG_FAX: ClassVar[str] = Base.FLAG_FAX
    FLAG_FILTER: ClassVar[str] = 'filter'
    FLAG_FORM: ClassVar[str] = 'form'
    FLAG_FORM_FILTERS: ClassVar[str] = 'form-filters'
    FLAG_HAMBURGER: ClassVar[str] = 'hamburger'
    FLAG_IMAGE_LOGO: ClassVar[str] = 'image-logo'
    FLAG_INITIALISED: ClassVar[str] = 'initialised'
    FLAG_IS_INCLUDED_VAT: ClassVar[str] = 'is_included_VAT'
    # FLAG_KEY_PRIMARY: ClassVar[str] = Store_Base.FLAG_KEY_PRIMARY
    FLAG_MESSAGE: ClassVar[str] = 'Message'
    FLAG_MODAL: ClassVar[str] = 'modal'
    FLAG_NAME: ClassVar[str] = Base.FLAG_NAME
    FLAG_NAME_ATTR_OPTION_TEXT: ClassVar[str] = Base.FLAG_NAME_ATTR_OPTION_TEXT
    FLAG_NAME_ATTR_OPTION_VALUE: ClassVar[str] = Base.FLAG_NAME_ATTR_OPTION_VALUE
    FLAG_NAME_PLURAL: ClassVar[str] = Base.FLAG_NAME_PLURAL
    # FLAG_NAME_SINGULAR: ClassVar[str] = Base.FLAG_NAME_SINGULAR
    FLAG_NAV_ADMIN_HOME: ClassVar[str] = 'navAdminHome'
    FLAG_NAV_ADMIN_STORE_STRIPE_PRICES: ClassVar[str] = 'navAdminStoreStripePrices'
    FLAG_NAV_ADMIN_STORE_STRIPE_PRODUCTS: ClassVar[str] = 'navAdminStoreStripeProducts'
    FLAG_NAV_CONTACT: ClassVar[str] = 'navContact'
    FLAG_NAV_HOME: ClassVar[str] = 'navHome'
    FLAG_NAV_SERVICES: ClassVar[str] = 'navServices'
    FLAG_NAV_STORE_HOME: ClassVar[str] = 'navStoreHome'
    FLAG_NAV_STORE_MANUFACTURING_PURCHASE_ORDERS: ClassVar[str] = 'navStoreManufacturingPurchaseOrders'
    FLAG_NAV_STORE_PRODUCTS: ClassVar[str] = 'navStoreProducts'
    FLAG_NAV_STORE_PRODUCT_CATEGORIES: ClassVar[str] = 'navStoreProductCategories'
    FLAG_NAV_STORE_PRODUCT_PERMUTATIONS: ClassVar[str] = 'navStoreProductPermutations'
    FLAG_NAV_STORE_PRODUCT_PRICES: ClassVar[str] = 'navStoreProductPrices'
    FLAG_NAV_STORE_PRODUCT_VARIATIONS: ClassVar[str] = 'navStoreProductVariations'
    FLAG_NAV_STORE_STOCK_ITEMS: ClassVar[str] = 'navStoreStockItems'
    FLAG_NAV_STORE_SUPPLIERS: ClassVar[str] = 'navStoreSuppliers'
    FLAG_NAV_STORE_SUPPLIER_PURCHASE_ORDERS: ClassVar[str] = 'navStoreSupplierPurchaseOrders'
    FLAG_NAV_USER_ACCOUNT: ClassVar[str] = 'navUserAccount'
    FLAG_NAV_USER_ADMIN: ClassVar[str] = 'navUserAdmin'
    FLAG_NAV_USER_LOGIN: ClassVar[str] = 'navUserLogin'
    FLAG_NAV_USER_LOGOUT: ClassVar[str] = 'navUserLogout'
    FLAG_OVERLAY: ClassVar[str] = 'overlay'
    FLAG_PAGE_BODY: ClassVar[str] = 'page-body'
    FLAG_PHONE_NUMBER: ClassVar[str] = Base.FLAG_PHONE_NUMBER
    FLAG_POSTCODE: ClassVar[str] = Base.FLAG_POSTCODE
    FLAG_ROW: ClassVar[str] = 'row'
    FLAG_ROW_NEW: ClassVar[str] = 'row-new'
    FLAG_ROWS: ClassVar[str] = Base.FLAG_ROWS
    FLAG_SAVE: ClassVar[str] = 'save'
    FLAG_SCROLLABLE: ClassVar[str] = 'scrollable'
    FLAG_SLIDER: ClassVar[str] = 'slider'
    FLAG_STATUS: ClassVar[str] = 'status'
    FLAG_SUBMIT: ClassVar[str] = 'submit'
    FLAG_SUBMITTED: ClassVar[str] = 'submitted'
    FLAG_SUCCESS: ClassVar[str] = 'success'
    FLAG_TEMPORARY_ELEMENT: ClassVar[str] = 'temporary-element'
    FLAG_USER: ClassVar[str] = User.FLAG_USER
    FLAG_WEBSITE: ClassVar[str] = Base.FLAG_WEBSITE
    HASH_APPLY_FILTERS_STORE_PRODUCT_PERMUTATION: ClassVar[str] = '/store/permutation_filter'
    HASH_CALLBACK_LOGIN: ClassVar[str] = '/callback-login'
    HASH_PAGE_ACCESSIBILITY_REPORT: ClassVar[str] = '/accessibility-report'
    HASH_PAGE_ACCESSIBILITY_STATEMENT: ClassVar[str] = '/accessibility-statement'
    HASH_PAGE_ADMIN_HOME: ClassVar[str] = '/admin'
    HASH_PAGE_CONTACT: ClassVar[str] = '/contact'
    HASH_PAGE_DATA_RETENTION_SCHEDULE: ClassVar[str] = '/retention-schedule'
    HASH_PAGE_ERROR_NO_PERMISSION: ClassVar[str] = '/error'
    HASH_PAGE_HOME: ClassVar[str] = '/'
    HASH_PAGE_LICENSE: ClassVar[str] = '/license'
    HASH_PAGE_PRIVACY_POLICY: ClassVar[str] = '/privacy-policy'
    HASH_PAGE_SERVICES: ClassVar[str] = '/services'
    HASH_PAGE_STORE_BASKET: ClassVar[str] = '/store/basket'
    HASH_PAGE_STORE_CUSTOMER_SALES_ORDERS: ClassVar[str] = '/store/customer_sales_orders'
    HASH_PAGE_STORE_HOME: ClassVar[str] = '/store'
    HASH_PAGE_STORE_MANUFACTURING_PURCHASE_ORDERS: ClassVar[str] = '/store/manufacturing_purchase_orders'
    HASH_PAGE_STORE_PRODUCT_CATEGORIES: ClassVar[str] = '/store/categories'
    HASH_PAGE_STORE_PRODUCTS: ClassVar[str] = '/store/products'
    HASH_PAGE_STORE_PRODUCT_PERMUTATIONS: ClassVar[str] = '/store/permutations'
    HASH_PAGE_STORE_PRODUCT_PRICES: ClassVar[str] = '/store/prices'
    HASH_PAGE_STORE_PRODUCT_VARIATIONS: ClassVar[str] = '/store/variations'
    HASH_PAGE_STORE_STOCK_ITEMS: ClassVar[str] = '/store/stock_items'
    HASH_PAGE_STORE_SUPPLIERS: ClassVar[str] = '/store/suppliers'
    HASH_PAGE_STORE_SUPPLIER_PURCHASE_ORDERS: ClassVar[str] = '/store/supplier_purchase_orders'
    HASH_PAGE_USER_ACCOUNT: ClassVar[str] = '/user'
    HASH_PAGE_USER_ADMIN: ClassVar[str] = '/user/admin'
    HASH_PAGE_USER_LOGIN: ClassVar[str] = '/login'
    HASH_PAGE_USER_LOGOUT: ClassVar[str] = '/logout'
    HASH_SCRIPTS_SECTION_STORE: ClassVar[str] = '/scripts_store'
    ID_BUTTON_ADD: ClassVar[str] = 'buttonAdd'
    ID_BUTTON_APPLY_FILTERS: ClassVar[str] = 'buttonApplyFilters'
    ID_BUTTON_CANCEL: ClassVar[str] = 'buttonCancel'
    ID_BUTTON_HAMBURGER: ClassVar[str] = 'buttonHamburger'
    ID_BUTTON_SAVE: ClassVar[str] = 'buttonSave'
    ID_CSRF_TOKEN: ClassVar[str] = 'X-CSRFToken'
    ID_FORM_CONTACT: ClassVar[str] = 'formContact'
    ID_FORM_CURRENCY: ClassVar[str] = 'formCurrency'
    ID_FORM_DELIVERY_REGION: ClassVar[str] = 'formDeliveryRegion'
    ID_FORM_FILTERS: ClassVar[str] = 'formFilters'
    ID_FORM_IS_INCLUDED_VAT: ClassVar[str] = 'formIsIncludedVAT'
    ID_LABEL_ERROR: ClassVar[str] = 'labelError'
    ID_OVERLAY_CONFIRM: ClassVar[str] = 'overlayConfirm'
    ID_OVERLAY_ERROR: ClassVar[str] = 'overlayError'
    ID_OVERLAY_HAMBURGER: ClassVar[str] = 'overlayHamburger'
    ID_PAGE_BODY: ClassVar[str] = 'pageBody'
    ID_TABLE_MAIN: ClassVar[str] = 'tableMain'
    ID_TEXTAREA_CONFIRM: ClassVar[str] = 'textareaConfirm'
    NAME_COMPANY: ClassVar[str] = 'Precision And Research Technology Systems Limited'
    NAME_CSRF_TOKEN: ClassVar[str] = 'csrf-token'
    # URL_HOST: ClassVar[str] = os.env() 'http://127.0.0.1:5000' # 'https://www.partsltd.co.uk'
    URL_GITHUB: ClassVar[str] = 'https://github.com/Teddy-1024'
    URL_LINKEDIN: ClassVar[str] = 'https://uk.linkedin.com/in/lordteddyms'

    hash_page_current: str
    app: Flask = None
    session: None = None
    is_page_store: bool = None
    is_user_logged_in: bool = None
    user: User = None
    access_levels: list = None

    model_config = ConfigDict(arbitrary_types_allowed=True)

    @property
    @abstractmethod
    def title(self):
        pass
    
    def __init__(self, hash_page_current, **kwargs):
        BaseModel.__init__(self, hash_page_current=hash_page_current, **kwargs)
        self.app = current_app
        with self.app.app_context():
            self.session = session
        self.is_page_store = False
        Helper_App.console_log(f'session: {self.session}')
        
        datastore_user = DataStore_User()
        self.user = datastore_user.get_user_session()
        self.is_user_logged_in = self.user.is_logged_in
        Helper_App.console_log(f'model_view_base init end - model.user: {self.user}')
        
    def output_bool(self, boolean):
        return str(boolean).lower()
    
    def get_url_host(self):
        return self.app.config['URL_HOST']

    def get_user_session(self):
        datastore_user = DataStore_User()
        return datastore_user.get_user_session()

    def get_many_access_level(self, filters=None):
        _m = 'Model_View_Store.get_many_access_level'
        access_levels, errors = DataStore_Base.get_many_access_level(filters)
        return access_levels
    def get_many_unit_measurement(self, filters=None):
        _m = 'Model_View_Store.get_many_unit_measurement'
        units_measurement, errors = DataStore_Base.get_many_unit_measurement(filters)
        return units_measurement
    
    @staticmethod
    def convert_list_objects_to_json(list_objects):
        return [obj.to_json() for obj in list_objects]
    @staticmethod
    def convert_list_objects_to_list_options(list_objects):
        return Base.convert_list_objects_to_list_options(list_objects)
    @staticmethod
    def convert_list_objects_to_dict_by_attribute_key(list_objects, key):
        return {getattr(obj, key): obj for obj in list_objects}
    @staticmethod
    def convert_list_objects_to_dict_json_by_attribute_key(list_objects, key):
        return {getattr(obj, key): obj.to_json() for obj in list_objects}
    @staticmethod
    def convert_list_objects_to_dict_by_attribute_key_default(list_objects):
        if list_objects is None or len(list_objects) == 0:
            return {}
        obj_class = list_objects[0].__class__
        return Model_View_Base.convert_list_objects_to_dict_by_attribute_key(list_objects, getattr(obj_class, obj_class.FLAG_NAME_ATTR_OPTION_VALUE))
    @staticmethod
    def convert_list_objects_to_dict_json_by_attribute_key_default(list_objects):
        if list_objects is None or len(list_objects) == 0:
            return {}
        obj_class = list_objects[0].__class__
        return Model_View_Base.convert_list_objects_to_dict_json_by_attribute_key(list_objects, getattr(obj_class, obj_class.FLAG_NAME_ATTR_OPTION_VALUE))
    @staticmethod
    def convert_dict_values_to_json(dict):
        return {key: dict[key].to_json() for key in dict.keys()}
    @staticmethod
    def convert_list_objects_to_preview_str(list_objects):
        preview_str = ''
        for obj in list_objects:
            if preview_str != '':
                preview_str += '\n'
            obj_json = obj.to_json()
            Helper_App.console_log(f'obj_json: {obj_json}')
            preview_str += obj_json[obj_json[Base.FLAG_NAME_ATTR_OPTION_TEXT]]
        return preview_str
    @staticmethod
    def join_with_linebreaks(strs):
        str_multiline = ''
        for str in strs:
            if str_multiline != '':
                str_multiline += '\n'
            str_multiline += str
        return str_multiline
    @staticmethod
    def format_date(date):
        if date is None:
            return ''
        return date.strftime('%Y-%m-%d')
    @staticmethod
    def format_datetime(date_time):
        if date_time is None:
            return ''
        return date_time.strftime('%Y-%m-%dT%H:%M')
    @staticmethod
    def jsonify(data):
        return jsonify(data)