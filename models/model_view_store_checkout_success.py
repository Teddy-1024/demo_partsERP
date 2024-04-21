"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Store Checkout Success View Model

Description:
Data model for store checkout success view
"""

# IMPORTS
# VARIABLE INSTANTIATION
# METHODS

# IMPORTS
# internal
from models.model_view_store import Model_View_Store
from models.model_view_store_checkout import Model_View_Store_Checkout
# from routes import bp_home
from business_objects.product import Product
from forms import Form_Billing # Form_Product
import lib.argument_validation as av
from datastores.datastore_store import DataStore_Store
# external
import os

# VARIABLE INSTANTIATION


# CLASSES
class Model_View_Store_Checkout_Success(Model_View_Store_Checkout):
    # Attributes
    key_secret_stripe: str
    key_public_stripe: str
    # Global constants
    key_id_price = 'price_id'
    @property
    def title(self):
        return 'Store Checkout Success'

    def __new__(cls, db, id_user, app, id_checkout_session, checkout_items, id_currency, id_region_delivery, is_included_VAT):
        # Initialiser - validation
        _m = 'Model_View_Store_Checkout_Success.__new__'
        # av.val_list(checkout_items, 'checkout_items', _m)
        av.val_str(id_checkout_session, 'id_checkout_session', _m)
        return super(Model_View_Store_Checkout_Success, cls).__new__(cls, db, id_user, app, id_currency, id_region_delivery, is_included_VAT)
    
    def __init__(self, db, id_user, app, id_checkout_session, checkout_items, id_currency, id_region_delivery, is_included_VAT):
        # Constructor
        super().__init__(db, id_user, app, id_currency, id_region_delivery, is_included_VAT)
        self.checkout_items = checkout_items
        self.id_checkout_session = id_checkout_session
        self.order = self.get_many_user_order('', 1, id_checkout_session)