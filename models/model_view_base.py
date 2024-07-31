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
from abc import ABC, abstractmethod
from flask_sqlalchemy import SQLAlchemy
from flask import Flask, session
from pydantic import BaseModel, ConfigDict
from typing import ClassVar

# VARIABLE INSTANTIATION

# CLASSES
class Model_View_Base(BaseModel, ABC):
    # Global constants
    ATTR_TEXT_COLLAPSED: ClassVar[str] = 'textCollapsed'
    ATTR_TEXT_EXPANDED: ClassVar[str] = 'textExpanded'
    ATTR_VALUE_CURRENT: ClassVar[str] = 'current-value'
    ATTR_VALUE_PREVIOUS: ClassVar[str] = 'previous-value'
    FLAG_ACTIVE: ClassVar[str] = 'active'
    FLAG_BUTTON_CANCEL: ClassVar[str] = 'button-cancel'
    FLAG_BUTTON_MODAL_CLOSE: ClassVar[str] = 'button-overlay-close'
    FLAG_BUTTON_SUBMIT: ClassVar[str] = 'button-submit'
    FLAG_CARD: ClassVar[str] = 'card'
    FLAG_COLLAPSED: ClassVar[str] = 'collapsed'
    FLAG_COLLAPSIBLE: ClassVar[str] = 'collapsible'
    FLAG_COLUMN: ClassVar[str] = 'column'
    FLAG_CONTAINER: ClassVar[str] = 'container'
    FLAG_CONTAINER_INPUT: ClassVar[str] = FLAG_CONTAINER + '-input'
    FLAG_DIRTY: ClassVar[str] = 'dirty'
    FLAG_ERROR: ClassVar[str] = 'error'
    FLAG_EXPANDED: ClassVar[str] = 'expanded'
    FLAG_HAMBURGER: ClassVar[str] = 'hamburger'
    FLAG_INITIALISED: ClassVar[str] = 'initialised'
    FLAG_OVERLAY: ClassVar[str] = 'overlay'
    FLAG_PAGE_BODY: ClassVar[str] = 'page-body'
    FLAG_ROW: ClassVar[str] = 'row'
    FLAG_ROW_NEW: ClassVar[str] = 'row-new'
    FLAG_SCROLLABLE: ClassVar[str] = 'scrollable'
    FLAG_SUBMITTED: ClassVar[str] = 'submitted'
    # flagIsDatePicker: ClassVar[str] = 'is-date-picker'
    HASH_PAGE_ACCESSIBILITY_STATEMENT: ClassVar[str] = '/accessibility-statement'
    HASH_PAGE_CONTACT: ClassVar[str] = '/contact'
    HASH_PAGE_ERROR_NO_PERMISSION: ClassVar[str] = '/error'
    HASH_PAGE_HOME: ClassVar[str] = '/'
    HASH_PAGE_LICENSE: ClassVar[str] = '/license'
    HASH_PAGE_SERVICES: ClassVar[str] = '/services'
    HASH_PAGE_STORE_HOME: ClassVar[str] = '/store'
    HASH_PAGE_STORE_PRODUCT: ClassVar[str] = '/store/product'
    HASH_PAGE_STORE_PRODUCT_PERMUTATION: ClassVar[str] = '/store/permutation'
    HASH_PAGE_STORE_PRODUCT_PERMUTATION_FILTER: ClassVar[str] = '/store/permutation_filter'
    HASH_PAGE_STORE_PRODUCT_PERMUTATION_SAVE: ClassVar[str] = '/store/permutation_save'
    ID_BUTTON_ADD: ClassVar[str] = 'buttonAdd'
    ID_BUTTON_CANCEL: ClassVar[str] = 'buttonCancel'
    ID_BUTTON_HAMBURGER: ClassVar[str] = 'buttonHamburger'
    ID_BUTTON_SAVE: ClassVar[str] = 'buttonSave'
    ID_FORM_CONTACT: ClassVar[str] = 'formContact'
    ID_FORM_CURRENCY: ClassVar[str] = 'formCurrency'
    ID_FORM_DELIVERY_REGION: ClassVar[str] = 'formDeliveryRegion'
    ID_FORM_IS_INCLUDED_VAT: ClassVar[str] = 'formIsIncludedVAT'
    ID_LABEL_ERROR: ClassVar[str] = 'labelError'
    ID_MODAL_SERVICES: ClassVar[str] = 'modalServices'
    ID_MODAL_TECHNOLOGIES: ClassVar[str] = 'modalTechnologies'
    ID_NAV_CONTACT: ClassVar[str] = 'navContact'
    ID_NAV_HOME: ClassVar[str] = 'navHome'
    ID_NAV_SERVICES: ClassVar[str] = 'navServices'
    ID_NAV_STORE_HOME: ClassVar[str] = 'navStoreHome'
    ID_NAV_STORE_PERMUTATIONS: ClassVar[str] = 'navStorePermutations'
    ID_NAV_STORE_PRODUCT: ClassVar[str] = 'navStoreProduct'
    ID_OVERLAY_CONFIRM: ClassVar[str] = 'overlayConfirm'
    ID_OVERLAY_HAMBURGER: ClassVar[str] = 'overlayHamburger'
    ID_PAGE_BODY: ClassVar[str] = 'pageBody'
    ID_TABLE_MAIN: ClassVar[str] = 'tableMain'
    ID_TEXTAREA_CONFIRM: ClassVar[str] = 'textareaConfirm'
    KEY_FORM: ClassVar[str] = 'form'
    KEY_FORM_FILTERS: ClassVar[str] = KEY_FORM + 'Filters'
    NAME_COMPANY: ClassVar[str] = 'Precision And Research Technology Systems Limited'
    URL_HOST: ClassVar[str] = 'http://127.0.0.1:5000' # 'https://www.partsltd.co.uk'
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
    """
    # """
    app: Flask
    db: SQLAlchemy
    # """
    session: None = None
    is_page_store: bool = None

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
    def __init__(self, app, db, **kwargs):
        # Constructor
        """
        _m = 'Model_View_Base.__init__'
        v_arg_type = 'class attribute'
        print(f'{_m}\nstarting')
        av.val_instance(db, 'db', _m, SQLAlchemy, v_arg_type=v_arg_type)
        """
        BaseModel.__init__(self, app=app, db=db, **kwargs)
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
        with app.app_context():
            self.session = session
        # self.form_is_included_VAT = Form_Is_Included_VAT()
        # self.form_delivery_region = Form_Delivery_Region()
        # self.form_currency = Form_Currency()
        self.is_page_store = False
        
    def output_bool(self, boolean):
        return str(boolean).lower()