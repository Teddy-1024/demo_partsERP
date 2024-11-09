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
from business_objects.store.product import Product, Parameters_Product
from business_objects.store.product_category import Product_Category_Container
from datastores.datastore_store_product import DataStore_Store_Product
from forms.access_level import Filters_Access_Level
from forms.store.product import Filters_Product
from helpers.helper_app import Helper_App
from models.model_view_store import Model_View_Store
# from routes import bp_home
import lib.argument_validation as av
# external
from typing import ClassVar

"""
class Model_View_Store_Product(Model_View_Store):
    # categories: list # (str)
    # category_products: dict { category_enum_id: List[Product] }

    # Attributes
    @property
    def title(self):
        return 'Store Product'

    def __init__(self, id_permutation, id_currency, id_region_delivery, is_included_VAT, hash_page_current=Model_View_Store.HASH_PAGE_STORE_PRODUCTS):
        # Constructor
        _m = 'Model_View_Store_Product.__init__'
        Helper_App.console_log(f'{_m}\nstarting...')
        super().__init__(hash_page_current=hash_page_current, id_currency=id_currency, id_region_delivery=id_region_delivery, is_included_VAT=is_included_VAT)
        Helper_App.console_log('supered')
        
        category_list = DataStore_Store_Base().get_many_product(Parameters_Product(
            self.info_user['sub'], 
            True, '', False,
            True, '', False, False,
            False, str(id_permutation), False,
            True, '', False, False,
            False, str(id_region_delivery), False,
            False, str(id_currency), False,
            True, '', False
        )) # product_ids=str(id_product), permutation_ids=str(id_permutation))
        Helper_App.console_log('connection to db successful')
        # self.categories = categories
        # self.category_index = category_index
        ""
        if (category_list.get_category_count() > 0):
            self.product = category_list.get_permutation_first()
        else:
            self.product = None
        Helper_App.console_log('selected permutation selected')
        ""
"""


class Model_View_Store_Product(Model_View_Store):
    category_list: Product_Category_Container = None
    category_list_filters: Product_Category_Container = None
    currencies: list = None
    currency_options: list = None
    filters_product: Parameters_Product = None
    form_filters: Filters_Product
    list_options_product: list = None
    # product_blank: Product = None
    units_measurement: list = None
    units_measurement_time: list = None
    variations: list = None
    variation_types: list = None
    
    @property
    def title(self):
        return 'Products'
    
    def __init__(self, form_filters, hash_page_current=Model_View_Store.HASH_PAGE_STORE_PRODUCTS):
        _m = 'Model_View_Store_Product.__init__'
        Helper_App.console_log(f'{_m}\nstarting...')
        super().__init__(hash_page_current=hash_page_current, form_filters=form_filters)
        self.access_levels = self.get_many_access_level(Filters_Access_Level())
        parameters_product = Parameters_Product.from_form_filters_product(self.form_filters)
        datastore_store = DataStore_Store_Product()
        self.category_list, errors = datastore_store.get_many_product(parameters_product)
        countProducts = 0
        for category in self.category_list.categories:
            countProducts += len(category.products)
        Helper_App.console_log(f'category count: {len(self.category_list.categories)}\nproduct count: {countProducts}')
        self.category_list_filters, errors_filters = datastore_store.get_many_product(
            Parameters_Product(
                get_all_product_category = True,
                get_inactive_product_category = False,
                ids_product_category = '',
                get_all_product = True,
                get_inactive_product = False,
                ids_product = '',
                get_all_permutation = True,
                get_inactive_permutation = False,
                ids_permutation = '',
                get_all_image = False,
                get_inactive_image = False,
                ids_image = '',
                get_products_quantity_stock_below_min = parameters_product.get_products_quantity_stock_below_min
            )
        )
        Helper_App.console_log(f'category filters: {self.category_list_filters.categories}')
        self.form_filters.id_category.choices += [(str(category.id_category), category.name) for category in self.category_list_filters.categories]
        Helper_App.console_log(f'category options: {self.form_filters.id_category.choices}')
        self.variation_types, self.variations, errors = self.get_many_product_variation()
        self.units_measurement = self.get_many_unit_measurement()
        self.units_measurement_time = [unit_measurement for unit_measurement in self.units_measurement if unit_measurement.is_unit_of_time]
        self.currencies = self.get_many_currency()
        self.currency_options = [currency.to_json_option() for currency in self.currencies]

        Helper_App.console_log(f'category count: {len(self.category_list.categories)}\nproduct count: {countProducts}')
    @staticmethod
    def save_products(comment, list_products):
        _m = 'Model_View_Store_Product.save_products'
        return DataStore_Store_Product.save_products(comment, list_products)