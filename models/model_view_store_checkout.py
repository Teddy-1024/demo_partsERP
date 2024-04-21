"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Store Checkout View Model

Description:
Data model for store checkout view
"""

# IMPORTS
# VARIABLE INSTANTIATION
# METHODS

# IMPORTS
# internal
from models.model_view_store import Model_View_Store
from models.model_view_store_basket import Model_View_Store_Basket
# from routes import bp_home
from business_objects.product import Product
from forms import Form_Billing # Form_Product
import lib.argument_validation as av
from datastores.datastore_store import DataStore_Store
# external
import os
import stripe

# VARIABLE INSTANTIATION


# CLASSES
class Model_View_Store_Checkout(Model_View_Store_Basket):
    # Attributes
    key_secret_stripe: str
    key_public_stripe: str
    # Global constants
    key_id_price = 'price_id'
    @property
    def title(self):
        return 'Store Checkout'

    def __new__(cls, db, id_user, app, id_currency, id_region_delivery, is_included_VAT):
        # Initialiser - validation
        return super(Model_View_Store_Checkout, cls).__new__(cls, db, id_user, app, id_currency, id_region_delivery, is_included_VAT)
    
    def __init__(self, db, id_user, app, id_currency, id_region_delivery, is_included_VAT):
        # Constructor
        super().__init__(db, id_user, app, id_currency, id_region_delivery, is_included_VAT)
        self.key_secret_stripe = os.environ.get("KEY_SECRET_STRIPE")
        self.key_public_stripe = os.environ.get("KEY_PUBLIC_STRIPE")
        
        # For sample support and debugging, not required for production:
        stripe.set_app_info(
            'stripe-samples/checkout-one-time-payments',
            version='0.0.1',
            url='https://github.com/stripe-samples/checkout-one-time-payments')

        stripe.api_key = self.key_secret_stripe

    
    def create_product(self, product): # _name, product_description):
        return DataStore_Store(self.db, self.info_user).create_product(product) # _name, product_description)
    
    def create_price(self, product, currency):
        return DataStore_Store(self.db, self.info_user).create_price(product, currency)
    
    def get_many_product_new(self):
        return DataStore_Store(self.db, self.info_user).get_many_product_new()
    
    """
    def get_price_id(product_ids):
        return DataStore_Store().get_many_id_price(product_ids)
    """
