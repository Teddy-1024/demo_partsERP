"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Store Permutations View Model

Description:
Data model for store permutations view
"""

# internal
from models.model_view_store import Model_View_Store
# from datastores.datastore_store_base import DataStore_Store_Base
from datastores.datastore_store_product_category import DataStore_Store_Product_Category
from business_objects.store.product import Parameters_Product
from business_objects.store.product_category import Product_Category_Container # , Filters_Product_Category
from forms.access_level import Filters_Access_Level
# from forms.store.product_permutation import Filters_Product_Permutation
from forms.store.product_category import Filters_Product_Category
# from routes import bp_home
from helpers.helper_app import Helper_App
import lib.argument_validation as av

# external
from pydantic import BaseModel
from typing import ClassVar

class Model_View_Store_Product_Category(Model_View_Store):
    # KEY_CATEGORIES: ClassVar[str] = 'categories'

    access_levels: list = None
    category_list: Product_Category_Container = None # (str)
    # filters_category: Filters_Product_Category
    form_filters: Filters_Product_Category = None
    form_filters_old: Filters_Product_Category

    @property
    def title(self):
        return 'Product Category'
    
    def __init__(self, form_filters_old, hash_page_current=Model_View_Store.HASH_PAGE_STORE_PRODUCT_CATEGORIES):
        _m = 'Model_View_Store_Product_Category.__init__'
        Helper_App.console_log(f'{_m}\nstarting...')
        super().__init__(hash_page_current=hash_page_current, form_filters_old=form_filters_old) # filters_category=filters_category)
        self.form_filters = form_filters_old
        # BaseModel.__init__(self, app=app, filters_product=filters_product, **kwargs)
        self.access_levels = self.get_many_access_level(Filters_Access_Level())
        datastore_store = DataStore_Store_Product_Category()
        # self.form_filters = Filters_Product_Category.from_filters(filters_category)
        filters_product = Parameters_Product.from_filters_product_category(self.form_filters)
        self.category_list, errors = datastore_store.get_many_product(filters_product) 

    @classmethod
    def save_categories(cls, comment, list_categories):
        _m = f'{cls.__name__}.save_categories'
        DataStore_Store_Product_Category().save_categories(comment, list_categories)