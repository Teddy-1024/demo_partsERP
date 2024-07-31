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
from datastores.datastore_store import DataStore_Store
from business_objects.category import Category_List
from forms import Form_Filters_Permutation
# from routes import bp_home
from business_objects.product import Product, Product_Filters, Product_Permutation
import lib.argument_validation as av

# external
from pydantic import BaseModel
from typing import ClassVar

class Model_View_Store_Permutation(Model_View_Store):
    ID_FILTER_CATEGORY: ClassVar[str] = 'id_category'
    ID_FILTER_PRODUCT: ClassVar[str] = 'id_product'
    ID_FILTER_IS_OUT_OF_STOCK: ClassVar[str] = 'is_out_of_stock'
    ID_FILTER_QUANTITY_MIN: ClassVar[str] = 'quantity_min'
    ID_FILTER_QUANTITY_MAX: ClassVar[str] = 'quantity_max'
    ID_Form_Filters_Permutation: ClassVar[str] = 'Form_Filters_Permutation'
    KEY_PERMUTATIONS: ClassVar[str] = 'permutations'

    category_list: Category_List = None # (str)
    filters_product: Product_Filters
    form_filters: Form_Filters_Permutation = None
    permutation_blank: Product_Permutation = None

    @property
    def title(self):
        return 'Store Permutations'
    
    def __init__(self, app, db, filters_product, **kwargs):
        _m = 'Model_View_Store_Permutation.__init__'
        print(f'{_m}\nstarting...')
        super().__init__(app=app, db=db, filters_product=filters_product, **kwargs)
        # BaseModel.__init__(self, app=app, filters_product=filters_product, **kwargs)
        self.form_filters = Form_Filters_Permutation()
        datastore_store = DataStore_Store(self.app, self.db)
        self.category_list, errors = datastore_store.get_many_product_category(filters_product) 
        category_list_filters, errors_filters = datastore_store.get_many_product_category(
            Product_Filters(
                # self.info_user['sub'], 
                True, False, False, '',
                True, False, False, '',
                True, False, False, '',
                False, False, False, '',
                False, False, False, '',
                False, False, False, '',
                False, False, '',
                filters_product.get_products_quantity_stock_below_min
            )
        )
        print(f'category_list_filters: {category_list_filters.categories}')
        self.form_filters.id_category.choices = [('0', 'All')] + [(str(category.id_category), category.name) for category in category_list_filters.categories]
        print(f'category options: {self.form_filters.id_category.choices}')
        product_list = category_list_filters.to_list_products()
        print(f'product_list: {product_list}')
        self.form_filters.id_product.choices = [('0', 'All')] + [(str(product['value']), product['text']) for product in product_list]
        self.permutation_blank = Product_Permutation()
        print(f'category options: {self.form_filters.id_category.choices}')

    def save_permutations(self, comment, list_permutations):
        _m = 'Model_View_Store_Permutation.save_permutations'
        DataStore_Store(self.app, self.db).save_permutations(comment, list_permutations)