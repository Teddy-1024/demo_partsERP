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
from forms import Form_Is_Included_VAT, Form_Delivery_Region, Form_Currency
# external
from abc import ABC, abstractmethod, abstractproperty
from flask_sqlalchemy import SQLAlchemy
from flask import Flask

# VARIABLE INSTANTIATION


# CLASSES
class Model_View_Base(ABC):
    # Attributes
    is_user_logged_in: bool
    id_user: str
    form_is_included_VAT: Form_Is_Included_VAT
    form_delivery_region: Form_Delivery_Region
    form_currency: Form_Currency
    # app: Flask
    is_page_store: bool
    # Global constants
    ATTR_TEXT_COLLAPSED = 'textCollapsed'
    ATTR_TEXT_EXPANDED = 'textExpanded'
    FLAG_BUTTON_MODAL_CLOSE = 'btn-overlay-close'
    FLAG_BUTTON_SUBMIT = 'btn-submit'
    FLAG_CARD = 'card'
    FLAG_COLLAPSED = 'collapsed'
    FLAG_COLLAPSIBLE = 'collapsible'
    FLAG_COLUMN = 'column'
    FLAG_CONTAINER = 'container'
    FLAG_CONTAINER_INPUT = FLAG_CONTAINER + '-input'
    FLAG_EXPANDED = 'expanded'
    FLAG_HAMBURGER = 'hamburger'
    FLAG_INITIALISED = 'initialised'
    FLAG_OVERLAY = 'overlay'
    FLAG_PAGE_BODY = 'page-body'
    FLAG_ROW = 'row'
    FLAG_SCROLLABLE = 'scrollable'
    FLAG_SUBMITTED = 'submitted'
    # flagIsDatePicker = 'is-date-picker'
    HASH_PAGE_ACCESSIBILITY_STATEMENT = '/accessibility-statement'
    HASH_PAGE_CONTACT = '/contact'
    HASH_PAGE_ERROR_NO_PERMISSION = '/error'
    HASH_PAGE_HOME = '/'
    HASH_PAGE_LICENSE = '/license'
    HASH_PAGE_SERVICES = '/services'
    HASH_PAGE_STORE_HOME = '/store'
    HASH_PAGE_STORE_PRODUCT = '/store/product'
    ID_BUTTON_HAMBURGER = 'btnHamburger'
    ID_FORM_CONTACT = 'formContact'
    ID_FORM_CURRENCY = 'formCurrency'
    ID_FORM_DELIVERY_REGION = 'formDeliveryRegion'
    ID_FORM_IS_INCLUDED_VAT = 'formIsIncludedVAT'
    ID_MODAL_SERVICES = 'modalServices'
    ID_MODAL_TECHNOLOGIES = 'modalTechnologies'
    ID_NAV_CONTACT = 'navContact'
    ID_NAV_HOME = 'navHome'
    ID_NAV_SERVICES = 'navServices'
    ID_NAV_STORE_HOME = 'navStoreHome'
    ID_NAV_STORE_PRODUCT = 'navStoreProduct'
    ID_OVERLAY_HAMBURGER = 'overlayHamburger'
    ID_PAGE_BODY = 'pageBody'
    NAME_COMPANY = 'Precision And Research Technology Systems Limited'
    URL_HOST = 'https://www.partsltd.co.uk' # 'http://127.0.0.1:5000'
    URL_GITHUB = 'https://github.com/Teddy-1024'
    URL_LINKEDIN = 'https://uk.linkedin.com/in/lordteddyms'

    @abstractproperty
    def title(self):
        pass

    def __new__(cls, db, info_user, app): # , *args, **kwargs
        # Initialiser - validation
        _m = 'Model_View_Base.__new__'
        v_arg_type = 'class attribute'
        print(f'{_m}\nstarting')
        # return super().__new__(cls, *args, **kwargs)
        av.val_instance(db, 'db', _m, SQLAlchemy, v_arg_type=v_arg_type)
        return super(Model_View_Base, cls).__new__(cls)
    
    def __init__(self, db, info_user, app):
        # Constructor
        _m = 'Model_View_Base.__init__'
        v_arg_type = 'class attribute'
        print(f'{_m}\nstarting')
        av.val_instance(db, 'db', _m, SQLAlchemy, v_arg_type=v_arg_type)
        self.db = db
        self.info_user = info_user
        print(f'info_user: {info_user}\ntype: {str(type(info_user))}')
        self.is_user_logged_in = ('sub' in list(info_user.keys()) and not info_user['sub'] == '' and not str(type(info_user['sub'])) == "<class 'NoneType'?")
        print(f'is_user_logged_in: {self.is_user_logged_in}')
        self.id_user = info_user['sub'] if self.is_user_logged_in else ''
        self.form_is_included_VAT = Form_Is_Included_VAT()
        self.form_delivery_region = Form_Delivery_Region()
        self.form_currency = Form_Currency()
        self.app = app
        self.is_page_store = False
        
    def output_bool(self, boolean):
        return str(boolean).lower()