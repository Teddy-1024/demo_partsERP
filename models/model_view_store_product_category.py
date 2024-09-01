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
from business_objects.store.product_category import Container_Product_Category, Filters_Product_Category
from forms.forms import Form_Filters_Permutation
from forms.store.product_category import Form_Filters_Product_Category
# from routes import bp_home
from business_objects.store.product import Product, Filters_Product, Product_Permutation
from business_objects.store.product_variation import Product_Variation_List
import lib.argument_validation as av

# external
from pydantic import BaseModel
from typing import ClassVar

class Model_View_Store_Product_Category(Model_View_Store):
    FLAG_IS_NOT_EMPTY: ClassVar[str] = 'is-not-empty'
    ID_FORM_FILTERS_PRODUCT_CATEGORY: ClassVar[str] = 'Form_Filters_Product_Category'
    KEY_CATEGORIES: ClassVar[str] = 'categories'

    category_list: Container_Product_Category = None # (str)
    filters_category: Filters_Product_Category
    form_filters: Form_Filters_Product_Category = None

    @property
    def title(self):
        return 'Product Category'
    
    def __init__(self, filters_category, hash_page_current=Model_View_Store.HASH_PAGE_STORE_PRODUCT_CATEGORIES):
        _m = 'Model_View_Store_Product_Category.__init__'
        print(f'{_m}\nstarting...')
        super().__init__(hash_page_current=hash_page_current, filters_category=filters_category)
        # BaseModel.__init__(self, app=app, filters_product=filters_product, **kwargs)
        datastore_store = DataStore_Store_Product_Category()
        self.form_filters = Form_Filters_Product_Category.from_filters_product_category(filters_category)
        filters_product = Filters_Product.from_filters_product_category(filters_category)
        self.category_list, errors = datastore_store.get_many_product(filters_product) 

    @classmethod
    def save_categories(cls, comment, list_categories):
        _m = f'{cls.__name__}.save_categories'
        DataStore_Store_Product_Category().save_categories(comment, list_categories)