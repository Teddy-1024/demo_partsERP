"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Base View Model

Description:
Base data model for views
"""

# IMPORTS
# VARIABLE INSTANTIATION
# METHODS

# IMPORTS
# internal
# from routes import bp_home
import lib.argument_validation as av
from forms.forms import Form_Is_Included_VAT, Form_Delivery_Region, Form_Currency
from datastores.datastore_base import DataStore_Base
from datastores.datastore_user import DataStore_User
from business_objects.store.store_base import Store_Base
from business_objects.store.product_category import Product_Category
from business_objects.store.access_level import Filters_Access_Level
from business_objects.user import User, User_Filters
# external
from abc import ABC, abstractmethod
from flask_sqlalchemy import SQLAlchemy
from flask import Flask, session, current_app
from pydantic import BaseModel, ConfigDict
from typing import ClassVar


class Model_View_Base(BaseModel, ABC):
    # Global constants
    # ATTR_FOR: ClassVar[str] = 'for'
    ATTR_ID_ACCESS_LEVEL: ClassVar[str] = Store_Base.ATTR_ID_ACCESS_LEVEL
    ATTR_TEXT_COLLAPSED: ClassVar[str] = 'textCollapsed'
    ATTR_TEXT_EXPANDED: ClassVar[str] = 'textExpanded'
    ATTR_VALUE_CURRENT: ClassVar[str] = 'current-value'
    ATTR_VALUE_PREVIOUS: ClassVar[str] = 'previous-value'
    FLAG_ACCESS_LEVEL: ClassVar[str] = 'access_level'
    FLAG_ACCESS_LEVEL_REQUIRED: ClassVar[str] = Product_Category.FLAG_ACCESS_LEVEL_REQUIRED
    FLAG_ACTIVE: ClassVar[str] = Store_Base.FLAG_ACTIVE
    FLAG_ADD: ClassVar[str] = 'add'
    FLAG_CANCEL: ClassVar[str] = 'button-cancel'
    # FLAG_CONTACT_US: ClassVar[str] = 'button-contact'
    FLAG_CLOSE_TEMPORARY_ELEMENT: ClassVar[str] = 'button-temporary-element-close'
    FLAG_CARD: ClassVar[str] = 'card'
    FLAG_CODE: ClassVar[str] = Store_Base.FLAG_CODE
    FLAG_COLLAPSED: ClassVar[str] = 'collapsed'
    FLAG_COLLAPSIBLE: ClassVar[str] = 'collapsible'
    FLAG_COLUMN: ClassVar[str] = 'column'
    FLAG_COMMENT: ClassVar[str] = 'comment'
    FLAG_CONTAINER: ClassVar[str] = 'container'
    FLAG_CONTAINER_INPUT: ClassVar[str] = FLAG_CONTAINER + '-input'
    FLAG_DELETE: ClassVar[str] = 'delete'
    FLAG_DESCRIPTION: ClassVar[str] = Store_Base.FLAG_DESCRIPTION
    FLAG_DETAIL: ClassVar[str] = 'detail'
    FLAG_DIALOG: ClassVar[str] = 'dialog' # try <dialog> element
    FLAG_DIRTY: ClassVar[str] = 'dirty'
    FLAG_DISPLAY_ORDER: ClassVar[str] = Store_Base.FLAG_DISPLAY_ORDER
    FLAG_ERROR: ClassVar[str] = 'error'
    FLAG_EXPANDED: ClassVar[str] = 'expanded'
    FLAG_FAILURE: ClassVar[str] = 'failure'
    FLAG_FILTER: ClassVar[str] = 'filter'
    FLAG_FORM_FILTERS: ClassVar[str] = 'form-filters'
    FLAG_HAMBURGER: ClassVar[str] = 'hamburger'
    FLAG_IMAGE_LOGO: ClassVar[str] = 'image-logo'
    FLAG_INITIALISED: ClassVar[str] = 'initialised'
    FLAG_KEY_PRIMARY: ClassVar[str] = Store_Base.FLAG_KEY_PRIMARY
    FLAG_MESSAGE: ClassVar[str] = 'Message'
    FLAG_MODAL: ClassVar[str] = 'modal'
    FLAG_NAME: ClassVar[str] = Store_Base.FLAG_NAME
    FLAG_NAV_ADMIN_HOME: ClassVar[str] = 'navAdminHome'
    FLAG_NAV_ADMIN_STORE_STRIPE_PRICES: ClassVar[str] = 'navAdminStoreStripePrices'
    FLAG_NAV_ADMIN_STORE_STRIPE_PRODUCTS: ClassVar[str] = 'navAdminStoreStripeProducts'
    FLAG_NAV_CONTACT: ClassVar[str] = 'navContact'
    FLAG_NAV_HOME: ClassVar[str] = 'navHome'
    FLAG_NAV_SERVICES: ClassVar[str] = 'navServices'
    FLAG_NAV_STORE_HOME: ClassVar[str] = 'navStoreHome'
    FLAG_NAV_STORE_PRODUCTS: ClassVar[str] = 'navStoreProducts'
    FLAG_NAV_STORE_PRODUCT_CATEGORIES: ClassVar[str] = 'navStoreProductCategories'
    FLAG_NAV_STORE_PRODUCT_PERMUTATIONS: ClassVar[str] = 'navStoreProductPermutations'
    FLAG_NAV_STORE_PRODUCT_PRICES: ClassVar[str] = 'navStoreProductPrices'
    FLAG_NAV_STORE_PRODUCT_VARIATIONS: ClassVar[str] = 'navStoreProductVariations'
    FLAG_NAV_STORE_STOCK_ITEMS: ClassVar[str] = 'navStoreStockItems'
    FLAG_NAV_USER_ACCOUNT: ClassVar[str] = 'navUserAccount'
    FLAG_NAV_USER_ADMIN: ClassVar[str] = 'navUserAdmin'
    FLAG_NAV_USER_LOGIN: ClassVar[str] = 'navUserLogin'
    FLAG_NAV_USER_LOGOUT: ClassVar[str] = 'navUserLogout'
    FLAG_OVERLAY: ClassVar[str] = 'overlay'
    FLAG_TEMPORARY_ELEMENT: ClassVar[str] = 'temporary-element'
    FLAG_PAGE_BODY: ClassVar[str] = 'page-body'
    FLAG_ROW: ClassVar[str] = 'row'
    FLAG_ROW_NEW: ClassVar[str] = 'row-new'
    FLAG_ROWS: ClassVar[str] = Store_Base.FLAG_ROWS
    FLAG_SAVE: ClassVar[str] = 'save'
    FLAG_SCROLLABLE: ClassVar[str] = 'scrollable'
    FLAG_SLIDER: ClassVar[str] = 'slider'
    FLAG_STATUS: ClassVar[str] = 'status'
    FLAG_SUBMIT: ClassVar[str] = 'submit'
    FLAG_SUBMITTED: ClassVar[str] = 'submitted'
    FLAG_SUCCESS: ClassVar[str] = 'success'
    # flagIsDatePicker: ClassVar[str] = 'is-date-picker'
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
    # HASH_PAGE_STORE_ADMIN: ClassVar[str] = '/store/admin'
    HASH_PAGE_STORE_BASKET: ClassVar[str] = '/store/basket'
    HASH_PAGE_STORE_HOME: ClassVar[str] = '/store'
    HASH_PAGE_STORE_PRODUCT_CATEGORIES: ClassVar[str] = '/store/categories'
    HASH_PAGE_STORE_PRODUCTS: ClassVar[str] = '/store/products'
    HASH_PAGE_STORE_PRODUCT_PERMUTATIONS: ClassVar[str] = '/store/permutations'
    HASH_PAGE_STORE_PRODUCT_PRICES: ClassVar[str] = '/store/prices'
    HASH_PAGE_STORE_PRODUCT_VARIATIONS: ClassVar[str] = '/store/variations'
    HASH_PAGE_STORE_STOCK_ITEMS: ClassVar[str] = '/store/stock_items'
    HASH_PAGE_STORE_SUPPLIER: ClassVar[str] = '/store/supplier'
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
    ID_MODAL_SERVICES: ClassVar[str] = 'modalServices'
    ID_MODAL_TECHNOLOGIES: ClassVar[str] = 'modalTechnologies'
    """
    ID_BUTTON_NAV_ADMIN_HOME: ClassVar[str] = 'navAdminHome'
    ID_BUTTON_NAV_ADMIN_STORE_STRIPE_PRICE: ClassVar[str] = 'navAdminStoreStripePrice'
    ID_BUTTON_NAV_ADMIN_STORE_STRIPE_PRODUCT: ClassVar[str] = 'navAdminStoreStripeProduct'
    # ID_BUTTON_NAV_CONTACT: ClassVar[str] = 'navContact'
    ID_BUTTON_NAV_HOME: ClassVar[str] = 'navHome'
    ID_BUTTON_NAV_SERVICES: ClassVar[str] = 'navServices'
    ID_BUTTON_NAV_STORE_HOME: ClassVar[str] = 'navStoreHome'
    ID_BUTTON_NAV_STORE_PRODUCT: ClassVar[str] = 'navStoreProduct'
    ID_BUTTON_NAV_STORE_PRODUCT_CATEGORIES: ClassVar[str] = 'navStoreProductCategories'
    ID_BUTTON_NAV_STORE_PRODUCT_PERMUTATIONS: ClassVar[str] = 'navStoreProductPermutations'
    ID_BUTTON_NAV_STORE_PRODUCT_PRICES: ClassVar[str] = 'navStoreProductPrices'
    ID_BUTTON_NAV_STORE_PRODUCT_VARIATIONS: ClassVar[str] = 'navStoreProductVariations'
    ID_BUTTON_NAV_STORE_STOCK_ITEMS: ClassVar[str] = 'navStoreStockItems'
    ID_BUTTON_NAV_USER_ACCOUNT: ClassVar[str] = 'navUserAccount'
    ID_BUTTON_NAV_USER_ADMIN: ClassVar[str] = 'navUserAdmin'
    ID_BUTTON_NAV_USER_LOGIN: ClassVar[str] = 'navUserLogin'
    ID_BUTTON_NAV_USER_LOGOUT: ClassVar[str] = 'navUserLogout'
    """
    ID_OVERLAY_CONFIRM: ClassVar[str] = 'overlayConfirm'
    ID_OVERLAY_ERROR: ClassVar[str] = 'overlayError'
    ID_OVERLAY_HAMBURGER: ClassVar[str] = 'overlayHamburger'
    ID_PAGE_BODY: ClassVar[str] = 'pageBody'
    ID_TABLE_MAIN: ClassVar[str] = 'tableMain'
    ID_TEXTAREA_CONFIRM: ClassVar[str] = 'textareaConfirm'
    KEY_CALLBACK: ClassVar[str] = 'callback'
    # KEY_CSRF_TOKEN: ClassVar[str] = 'X-CSRFToken'
    KEY_DATA: ClassVar[str] = 'data'
    KEY_FORM: ClassVar[str] = 'form'
    KEY_FORM_FILTERS: ClassVar[str] = KEY_FORM + 'Filters'
    KEY_USER: ClassVar[str] = User.KEY_USER
    NAME_COMPANY: ClassVar[str] = 'Precision And Research Technology Systems Limited'
    NAME_CSRF_TOKEN: ClassVar[str] = 'csrf-token'
    # URL_HOST: ClassVar[str] = os.env() 'http://127.0.0.1:5000' # 'https://www.partsltd.co.uk'
    URL_GITHUB: ClassVar[str] = 'https://github.com/Teddy-1024'
    URL_LINKEDIN: ClassVar[str] = 'https://uk.linkedin.com/in/lordteddyms'

    # Attributes
    """
    is_user_logged_in: bool
    id_user: str
    form_is_included_VAT: Form_Is_Included_VAT
    form_delivery_region: Form_Delivery_Region
    form_currency: Form_Currency
    # app: Flask
    db: SQLAlchemy
    """
    # """
    hash_page_current: str
    # """
    app: Flask = None
    session: None = None
    is_page_store: bool = None
    is_user_logged_in: bool = None
    access_levels: list = None

    model_config = ConfigDict(arbitrary_types_allowed=True)

    @property
    @abstractmethod
    def title(self):
        pass
    
    """
    def __new__(cls, db, info_user, app): # , *args, **kwargs
        # Initialiser - validation
        _m = 'Model_View_Base.__new__'
        v_arg_type = 'class attribute'
        print(f'{_m}\nstarting')
        # return super().__new__(cls, *args, **kwargs)
        av.val_instance(db, 'db', _m, SQLAlchemy, v_arg_type=v_arg_type)
        return super(Model_View_Base, cls).__new__(cls)
    """
    def __init__(self, hash_page_current, **kwargs):
        # Constructor
        """
        _m = 'Model_View_Base.__init__'
        v_arg_type = 'class attribute'
        print(f'{_m}\nstarting')
        av.val_instance(db, 'db', _m, SQLAlchemy, v_arg_type=v_arg_type)
        """
        BaseModel.__init__(self, hash_page_current=hash_page_current, **kwargs)
        """
        self.db = db
        self.session = session
        info_user = self.get_info_user()
        print(f'info_user: {info_user}\ntype: {str(type(info_user))}')
        self.is_user_logged_in = ('sub' in list(info_user.keys()) and not info_user['sub'] == '' and not str(type(info_user['sub'])) == "<class 'NoneType'?")
        print(f'is_user_logged_in: {self.is_user_logged_in}')
        self.id_user = info_user['sub'] if self.is_user_logged_in else ''
        self.app = app
        """
        self.app = current_app
        with self.app.app_context():
            self.session = session
        # self.form_is_included_VAT = Form_Is_Included_VAT()
        # self.form_delivery_region = Form_Delivery_Region()
        # self.form_currency = Form_Currency()
        self.is_page_store = False
        print(f'session: {self.session}')
        
        datastore_user = DataStore_User()
        user = datastore_user.get_user_session()
        self.is_user_logged_in = user.is_logged_in
        
    def output_bool(self, boolean):
        return str(boolean).lower()
    
    def get_url_host(self):
        return self.app.config['URL_HOST']

    def get_user_session(self):
        datastore_user = DataStore_User()
        return datastore_user.get_user_session()
    
    """
    def get_is_admin_store_user(self):
        datastore_store = DataStore_Store()
        user = datastore_store.get_user_session()
        if not user.is_logged_in: return False
        filters_user = User_Filters.from_user(user) # get_default(datastore_store)
        users, errors = datastore_store.get_many_user(filters_user)
        try:
            user = users[0]
            return av.input_bool(user.can_admin_store, 'can_admin_store', 'Model_View_Base.get_is_admin_store_user')
        except:
            return False
        user = self.get_user_session()
        return user.can_admin_store

    def get_is_admin_user_user(self):
        datastore_store = DataStore_Store()
        user = datastore_store.get_user_session()
        if not user.is_logged_in: return False
        filters_user = User_Filters.from_user(user) # .get_default(datastore_store)
        users, errors = datastore_store.get_many_user(filters_user)
        try:
            user = users[0]
            return av.input_bool(user.can_admin_user, 'can_admin_user', 'Model_View_Base.get_is_admin_user_user')
        except:
            return False
    """

    def get_many_access_level(self, filters):
        _m = 'Model_View_Store.get_many_access_level'
        av.val_instance(filters, 'filters', _m, Filters_Access_Level)
        
        access_levels, errors = DataStore_Base.get_many_access_level(filters)
        
        return access_levels
    @staticmethod
    def convert_list_objects_to_list_options(list_objects):
        return Store_Base.convert_list_objects_to_list_options(list_objects)
    @staticmethod
    def join_with_linebreaks(strs):
        str_multiline = ''
        for str in strs:
            if str_multiline != '':
                str_multiline += '\n'
            str_multiline += str
        return str_multiline