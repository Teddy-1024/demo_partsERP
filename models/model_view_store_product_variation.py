"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Store Product View Model

Description:
Data model for store product view
"""

# IMPORTS
# VARIABLE INSTANTIATION
# METHODS

# IMPORTS
# internal
from business_objects.store.product_variation import Product_Variation, Parameters_Product_Variation
from business_objects.store.product_category import Product_Category_Container
from datastores.datastore_store_product_variation import DataStore_Store_Product_Variation
from forms.access_level import Filters_Access_Level
from forms.store.product_variation import Filters_Product_Variation
from helpers.helper_app import Helper_App
from models.model_view_store import Model_View_Store
# from routes import bp_home
import lib.argument_validation as av
# external
from typing import ClassVar


class Model_View_Store_Product_Variation(Model_View_Store):
    form_filters: Filters_Product_Variation = None
    form_filters_old: Filters_Product_Variation
    variation_types: list = None
    variations: list = None

    @property
    def title(self):
        return 'Store Product Variation'
    
    def __init__(self, form_filters_old, hash_page_current=Model_View_Store.HASH_PAGE_STORE_PRODUCT_VARIATIONS):
        _m = 'Model_View_Store_Product_Variation.__init__'
        Helper_App.console_log(f'{_m}\nstarting...')
        super().__init__(hash_page_current = hash_page_current, form_filters_old = form_filters_old)
        self.form_filters = form_filters_old
        parameters_variation = Parameters_Product_Variation.from_filters_product_variation(self.form_filters)
        datastore_variation = DataStore_Store_Product_Variation()
        self.variation_types, self.variations, errors = datastore_variation.get_many_product_variation(parameters_variation)

    @classmethod
    def save_product_variations(cls, comment, list_orders):
        _m = f'{cls.__name__}.save_product_variations'
        return DataStore_Store_Product_Variation().save_product_variations(comment, list_orders)