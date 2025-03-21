"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Supplier Purchase Order View Model

Description:
Data model for supplier purchase order view page
"""

# internal
from models.model_view_store import Model_View_Store
from datastores.datastore_store_supplier import DataStore_Store_Supplier
from datastores.datastore_store_supplier_purchase_order import DataStore_Store_Supplier_Purchase_Order
from business_objects.store.product import Product, Parameters_Product
from business_objects.store.product_category import Product_Category_Container
from business_objects.store.supplier import Supplier, Parameters_Supplier
from business_objects.store.supplier_purchase_order import Supplier_Purchase_Order, Parameters_Supplier_Purchase_Order
from forms.store.supplier_purchase_order import Filters_Supplier_Purchase_Order
from helpers.helper_app import Helper_App
import lib.argument_validation as av

class Model_View_Store_Supplier_Purchase_Order(Model_View_Store):
    category_list_filters: Product_Category_Container = None
    currencies: list = None
    currency_options: list = None
    form_filters: Filters_Supplier_Purchase_Order = None
    form_filters_old: Filters_Supplier_Purchase_Order
    supplier_purchase_orders: list = None
    suppliers: list = None
    units_measurement: list = None
    units_measurement_time: list = None
    variation_types: list = None
    variations: list = None

    @property
    def title(self):
        return 'Store Supplier Purchase Order'
    
    def __init__(self, form_filters_old, hash_page_current=Model_View_Store.HASH_PAGE_STORE_SUPPLIER_PURCHASE_ORDERS):
        _m = 'Model_View_Store_Supplier.__init__'
        Helper_App.console_log(f'{_m}\nstarting...')
        super().__init__(hash_page_current = hash_page_current, form_filters_old = form_filters_old)
        self.form_filters = form_filters_old
        parameters_supplier_purchase_order = Parameters_Supplier_Purchase_Order.from_filters_supplier_purchase_order(self.form_filters)
        datastore_supplier_purchase_order = DataStore_Store_Supplier_Purchase_Order()
        self.supplier_purchase_orders, errors = datastore_supplier_purchase_order.get_many_supplier_purchase_order(parameters_supplier_purchase_order)

        self.suppliers, errors = DataStore_Store_Supplier.get_many_supplier(Parameters_Supplier.get_default())
        self.category_list_filters, errors = DataStore_Store_Supplier_Purchase_Order.get_many_product(Parameters_Product.get_default())
        self.variation_types, self.variations, errors = self.get_many_product_variation()
        self.units_measurement = self.get_many_unit_measurement()
        self.units_measurement_time = [unit_measurement for unit_measurement in self.units_measurement if unit_measurement.is_unit_of_time]
        self.currencies = self.get_many_currency()
        self.currency_options = [currency.to_json_option() for currency in self.currencies]

    @classmethod
    def save_supplier_purchase_orders(cls, comment, list_orders):
        _m = f'{cls.__name__}.save_supplier_purchase_orders'
        return DataStore_Store_Supplier_Purchase_Order().save_supplier_purchase_orders(comment, list_orders)