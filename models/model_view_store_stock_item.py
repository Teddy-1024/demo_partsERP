"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Store Stock Items View Model

Description:
Data model for store stock items view
"""

# internal
from models.model_view_store import Model_View_Store
from datastores.datastore_store import DataStore_Store
from business_objects.category import Category_List
from forms import Form_Filters_Stock_Item
# from routes import bp_home
from business_objects.product import Product, Product_Filters, Product_Permutation
from business_objects.stock_item import Stock_Item, Stock_Item_Filters
import lib.argument_validation as av

# external
from pydantic import BaseModel
from typing import ClassVar

class Model_View_Store_Stock_Item(Model_View_Store):
    ID_FILTER_CATEGORY: ClassVar[str] = 'id_category'
    ID_FILTER_PRODUCT: ClassVar[str] = 'id_product'
    ID_FILTER_IS_OUT_OF_STOCK: ClassVar[str] = 'is_out_of_stock'
    ID_FILTER_QUANTITY_MIN: ClassVar[str] = 'quantity_min'
    ID_FILTER_QUANTITY_MAX: ClassVar[str] = 'quantity_max'
    ID_Form_Filters_Permutation: ClassVar[str] = 'Form_Filters_Permutation'
    KEY_PERMUTATIONS: ClassVar[str] = 'permutations'

    category_list: Category_List = None # (str)
    filters_stock_item: Stock_Item_Filters
    form_filters: Form_Filters_Stock_Item = None
    permutation_blank: Product_Permutation = None

    @property
    def title(self):
        return 'Store Stock Items'
    
    def __init__(self, app, db, filters_stock_item, **kwargs):
        _m = 'Model_View_Store_Stock_Item.__init__'
        print(f'{_m}\nstarting...')
        super().__init__(app=app, db=db, filters_stock_item=filters_stock_item, **kwargs)
        # BaseModel.__init__(self, app=app, filters_stock_item=filters_stock_item, **kwargs)
        self.form_filters = Form_Filters_Stock_Item()
        datastore_store = DataStore_Store(self.app, self.db)
        self.category_list, errors = datastore_store.get_many_stock_item(filters_stock_item) 
        category_list_filters, errors_filters = datastore_store.get_many_stock_item(
            Stock_Item_Filters(
                # self.info_user['sub'], 
                True, False, False, '', # get_all_category, get_inactive_category, get_first_category_only, ids_category
                True, False, False, '', # get_all_product, get_inactive_product, get_first_product_only, ids_product
                True, False, False, '', # get_all_permutation, get_inactive_permutation, get_first_permutation_only, ids_permutation
                False, False, False, '', # get_all_stock_item, get_inactive_stock_item, get_first_stock_item_only, ids_stock_item
                False, False, False, '', # get_all_region_storage, get_inactive_region_storage, get_first_region_storage_only, ids_region_storage
                False, False, False, '', # get_all_plant_storage, get_inactive_plant_storage, get_first_plant_storage_only, ids_plant_storage
                False, False, False, '', # get_all_location_storage, get_inactive_location_storage, get_first_location_storage_only, ids_location_storage
                None, # date_received_to
                False, False, # get_sealed_stock_item_only, get_unsealed_stock_item_only
                False, False, # get_expired_stock_item_only, get_nonexpired_stock_item_only
                False, False # get_consumed_stock_item_only, get_nonconsumed_stock_item_only
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

    def save_stock_item(self, comment, list_stock_items):
        _m = 'Model_View_Store_Stock_Item.save_stock_item'
        DataStore_Store(self.app, self.db).save_stock_item(comment, list_stock_items)