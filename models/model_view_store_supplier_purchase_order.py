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
from datastores.datastore_store_supplier_purchase_order import DataStore_Store_Supplier_Purchase_Order
from business_objects.store.supplier_purchase_order import Supplier_Purchase_Order, Parameters_Supplier_Purchase_Order
from forms.store.supplier_purchase_order import Filters_Supplier_Purchase_Order
import lib.argument_validation as av

class Model_View_Store_Supplier_Purchase_Order(Model_View_Store):
    currencies: list = None
    currency_options: list = None
    form_filters: Filters_Supplier_Purchase_Order = None
    form_filters_old: Filters_Supplier_Purchase_Order
    supplier_purchase_orders: list = None
    units_measurement: list = None
    units_measurement_time: list = None

    @property
    def title(self):
        return 'Store Supplier Purchase Order'
    
    def __init__(self, form_filters_old, hash_page_current=Model_View_Store.HASH_PAGE_STORE_SUPPLIER_PURCHASE_ORDERS):
        _m = 'Model_View_Store_Supplier.__init__'
        print(f'{_m}\nstarting...')
        super().__init__(hash_page_current = hash_page_current, form_filters_old = form_filters_old)
        self.form_filters = form_filters_old # Filters_Supplier_Purchase_Order.from_json(form_filters_old.to_json())
        parameters_supplier_purchase_order = Parameters_Supplier_Purchase_Order.from_filters_supplier_purchase_order(self.form_filters)
        datastore_supplier_purchase_order = DataStore_Store_Supplier_Purchase_Order()
        self.supplier_purchase_orders, errors = datastore_supplier_purchase_order.get_many_supplier_purchase_order(parameters_supplier_purchase_order)
        
        self.units_measurement = self.get_many_unit_measurement()
        self.units_measurement_time = [unit_measurement for unit_measurement in self.units_measurement if unit_measurement.is_unit_of_time]
        self.currencies = self.get_many_currency()
        self.currency_options = [currency.to_json_option() for currency in self.currencies]

    @classmethod
    def save_supplier_purchase_orders(cls, comment, list_orders):
        _m = f'{cls.__name__}.save_supplier_purchase_orders'
        return DataStore_Store_Supplier_Purchase_Order().save_supplier_purchase_orders(comment, list_orders)