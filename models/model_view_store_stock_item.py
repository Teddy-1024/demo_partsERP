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
# from routes import bp_home
from business_objects.store.product import Product, Parameters_Product, Product_Permutation
from business_objects.store.stock_item import Stock_Item, Parameters_Stock_Item
from forms.store.stock_item import Filters_Stock_Item
import lib.argument_validation as av

# external
from pydantic import BaseModel
from typing import ClassVar

class Model_View_Store_Stock_Item(Model_View_Store):
    category_list: Product_Category_Container = None
    category_list_filters: Product_Category_Container = None
    currencies: list = None
    currency_options: list = None
    filters_stock_item: Filters_Stock_Item
    form_filters: Filters_Stock_Item = None
    list_options_product: list = None
    units_measurement: list = None
    units_measurement_time: list = None
    variations: list = None
    variation_types: list = None

    @property
    def title(self):
        return 'Store Stock Items'
    
    def __init__(self, filters_stock_item, hash_page_current=Model_View_Store.HASH_PAGE_STORE_STOCK_ITEMS):
        _m = 'Model_View_Store_Stock_Item.__init__'
        print(f'{_m}\nstarting...')
        super().__init__(hash_page_current=hash_page_current, filters_stock_item=filters_stock_item)
        # BaseModel.__init__(self, app=app, filters_stock_item=filters_stock_item, **kwargs)
        self.form_filters = Filters_Stock_Item.from_json(filters_stock_item.to_json()) # .from_form_stock_item(filters_stock_item)
        datastore_store = DataStore_Store_Stock_Item()
        tmp_category_list_stock_item, errors = datastore_store.get_many_product(Parameters_Product.from_filters_stock_item(filters_stock_item))
        self.category_list, errors = datastore_store.get_many_stock_item(Parameters_Stock_Item.from_form_stock_item(filters_stock_item), tmp_category_list_stock_item) 
        self.category_list_filters, errors_filters = datastore_store.get_many_product(Parameters_Product.get_default())
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
        
        print(f'category_list_filters: {self.category_list_filters.categories}')
        self.form_filters.id_category.choices += [(str(category.id_category), category.name) for category in self.category_list_filters.categories] # [Filters_Stock_Item.get_choice_all()] +
        print(f'category options: {self.form_filters.id_category.choices}')
        product_list = self.category_list_filters.to_product_option_list()
        filtered_product_list = []
        if product_list is not None:
            for product in product_list:
                # print(f'product: {product}\n{product[Stock_Item.ATTR_ID_PRODUCT_CATEGORY]}\n{self.form_filters.id_category.data}\n{str(type(product[Stock_Item.ATTR_ID_PRODUCT_CATEGORY]))}\n{str(type(self.form_filters.id_category.data))}')
                if (self.form_filters.id_category.data == '' or str(product[Stock_Item.ATTR_ID_PRODUCT_CATEGORY]) == self.form_filters.id_category.data):
                    filtered_product_list.append(product)
        print(f'product_list: {product_list}\nfiltered_product_list: {filtered_product_list}')
        self.form_filters.id_product.choices += [(str(product['value']), product['text']) for product in filtered_product_list] #  [Filters_Stock_Item.get_choice_all()] +
        # self.form_filters.import_values(filters_stock_item)
        self.variation_types, self.variations, errors = self.get_many_product_variation()
        self.units_measurement = self.get_many_unit_measurement()
        self.units_measurement_time = [unit_measurement for unit_measurement in self.units_measurement if unit_measurement.is_unit_of_time]
        self.currencies = self.get_many_currency()
        self.currency_options = [currency.to_json_option() for currency in self.currencies]

    @classmethod
    def save_stock_items(cls, comment, list_stock_items):
        _m = f'{cls.__name__}.save_stock_items'
        return DataStore_Store_Stock_Item().save_stock_items(comment, list_stock_items)