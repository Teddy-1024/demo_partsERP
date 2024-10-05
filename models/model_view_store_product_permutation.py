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
from datastores.datastore_store_product_permutation import DataStore_Store_Product_Permutation
from business_objects.store.product_category import Product_Category_Container
from forms.store.product_permutation import Filters_Product_Permutation
# from routes import bp_home
from business_objects.store.product import Product, Parameters_Product, Product_Permutation
from business_objects.store.product_variation import Product_Variation_Container
import lib.argument_validation as av

# external
from pydantic import BaseModel
from typing import ClassVar

class Model_View_Store_Product_Permutation(Model_View_Store):
    """
    ID_FILTER_CATEGORY: ClassVar[str] = 'id_category'
    ID_FILTER_PRODUCT: ClassVar[str] = 'id_product'
    ID_FILTER_IS_OUT_OF_STOCK: ClassVar[str] = 'is_out_of_stock'
    ID_FILTER_QUANTITY_MIN: ClassVar[str] = 'quantity_min'
    ID_FILTER_QUANTITY_MAX: ClassVar[str] = 'quantity_max'
    """
    # ID_Filters_Product_Permutation: ClassVar[str] = 'Filters_Product_Permutation'
    # KEY_PERMUTATIONS: ClassVar[str] = 'permutations'

    category_list: Product_Category_Container = None
    category_list_filters: Product_Category_Container = None
    currencies: list = None
    currency_options: list = None
    filters_product: Parameters_Product = None
    form_filters: Filters_Product_Permutation
    list_options_product: list = None
    permutation_blank: Product_Permutation = None
    units_measurement: list = None
    units_measurement_time: list = None
    # variation_container: Product_Variation_Container = None
    variations: list = None
    variation_types: list = None
    
    @property
    def title(self):
        return 'Product Permutations'
    
    def __init__(self, form_filters, hash_page_current=Model_View_Store.HASH_PAGE_STORE_PRODUCT_PERMUTATIONS):
        _m = 'Model_View_Store_Permutation.__init__'
        print(f'{_m}\nstarting...')
        super().__init__(hash_page_current=hash_page_current, form_filters=form_filters)
        # self.form_filters = Filters_Product_Permutation()
        filters_product = Parameters_Product.from_form_filters_product_permutation(self.form_filters)
        datastore_store = DataStore_Store_Product_Permutation()
        self.category_list, errors = datastore_store.get_many_product(filters_product) 
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
                get_products_quantity_stock_below_min = filters_product.get_products_quantity_stock_below_min
            )
        )
        print(f'category filters: {self.category_list_filters.categories}')
        self.form_filters.id_category.choices = [('0', 'All')] + [(str(category.id_category), category.name) for category in self.category_list_filters.categories]
        print(f'category options: {self.form_filters.id_category.choices}')
        self.list_options_product = self.category_list_filters.to_product_option_list()
        print(f'product options: {self.list_options_product}')
        self.form_filters.id_product.choices = [('0', 'All')] + [(str(product['value']), product['text']) for product in self.list_options_product]
        self.permutation_blank = Product_Permutation()
        self.variation_types, self.variations, errors = self.get_many_product_variation()
        self.units_measurement = self.get_many_unit_measurement()
        self.units_measurement_time = [unit_measurement for unit_measurement in self.units_measurement if unit_measurement.is_unit_of_time]
        self.currencies = self.get_many_currency()
        self.currency_options = [currency.to_json_option() for currency in self.currencies]

    @staticmethod
    def save_permutations(comment, list_permutations):
        _m = 'Model_View_Store_Permutation.save_permutations'
        DataStore_Store_Product_Permutation.save_permutations(comment, list_permutations)