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
from datastores.datastore_store_stock_item import DataStore_Store_Stock_Item
from business_objects.store.product_category import Product_Category_Container
from forms.store.stock_item import Filters_Stock_Item
# from routes import bp_home
from business_objects.store.product import Product, Filters_Product, Product_Permutation
from business_objects.store.stock_item import Stock_Item
from forms.store.stock_item import Filters_Stock_Item
import lib.argument_validation as av

# external
from pydantic import BaseModel
from typing import ClassVar

class Model_View_Store_Stock_Items(Model_View_Store):
    """
    ID_FILTER_CATEGORY: ClassVar[str] = 'id_category'
    ID_FILTER_PRODUCT: ClassVar[str] = 'id_product'
    ID_FILTER_IS_OUT_OF_STOCK: ClassVar[str] = 'is_out_of_stock'
    ID_FILTER_QUANTITY_MIN: ClassVar[str] = 'quantity_min'
    ID_FILTER_QUANTITY_MAX: ClassVar[str] = 'quantity_max'
    ID_Form_Filters_Permutation: ClassVar[str] = 'Form_Filters_Permutation'
    """
    KEY_PERMUTATIONS: ClassVar[str] = 'permutations'

    category_list: Product_Category_Container = None # (str)
    filters_stock_item: Parameters_Stock_Item
    form_filters: Filters_Stock_Item = None
    permutation_blank: Product_Permutation = None

    @property
    def title(self):
        return 'Store Stock Items'
    
    def __init__(self, filters_stock_item, hash_page_current=Model_View_Store.HASH_PAGE_STORE_STOCK_ITEMS):
        _m = 'Model_View_Store_Stock_Item.__init__'
        print(f'{_m}\nstarting...')
        super().__init__(hash_page_current=hash_page_current, filters_stock_item=filters_stock_item)
        # BaseModel.__init__(self, app=app, filters_stock_item=filters_stock_item, **kwargs)
        self.form_filters = Filters_Stock_Item()
        datastore_store = DataStore_Store_Stock_Item()
        tmp_category_list_stock_item, errors = datastore_store.get_many_product(Filters_Product.from_filters_stock_item(filters_stock_item))
        self.category_list, errors = datastore_store.get_many_stock_item(filters_stock_item, tmp_category_list_stock_item) 
        category_list_filters, errors_filters = datastore_store.get_many_stock_item(
            """
            Parameters_Stock_Item(
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
            """
            Filters_Stock_Item()
        )
        
        print(f'category_list_filters: {category_list_filters.categories}')
        self.form_filters.id_category.choices = [('0', 'All')] + [(str(category.id_category), category.name) for category in category_list_filters.categories]
        print(f'category options: {self.form_filters.id_category.choices}')
        product_list = category_list_filters.to_product_option_list()
        print(f'product_list: {product_list}')
        self.form_filters.id_product.choices = [('0', 'All')] + [(str(product['value']), product['text']) for product in product_list]
        self.permutation_blank = Product_Permutation()
        print(f'category options: {self.form_filters.id_category.choices}')

    def save_stock_item(self, comment, list_stock_items):
        _m = 'Model_View_Store_Stock_Item.save_stock_item'
        DataStore_Store_Stock_Item().save_stock_item(comment, list_stock_items)