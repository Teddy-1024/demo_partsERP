"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Manufacturing Purchase Order View Model

Description:
Data model for manufacturing purchase order view page
"""

# internal
from models.model_view_store import Model_View_Store
from datastores.datastore_store_manufacturing_purchase_order import DataStore_Store_Manufacturing_Purchase_Order
from business_objects.store.manufacturing_purchase_order import Manufacturing_Purchase_Order, Parameters_Manufacturing_Purchase_Order
from forms.store.manufacturing_purchase_order import Filters_Manufacturing_Purchase_Order
import lib.argument_validation as av

class Model_View_Store_Manufacturing_Purchase_Order(Model_View_Store):
    currencies: list = None
    currency_options: list = None
    form_filters: Filters_Manufacturing_Purchase_Order = None
    form_filters_old: Filters_Manufacturing_Purchase_Order
    manufacturing_purchase_orders: list = None
    units_measurement: list = None
    units_measurement_time: list = None

    @property
    def title(self):
        return 'Store Manufacturing Purchase Order'
    
    def __init__(self, form_filters_old, hash_page_current=Model_View_Store.HASH_PAGE_STORE_MANUFACTURING_PURCHASE_ORDERS):
        _m = 'Model_View_Store_Manufacturing.__init__'
        print(f'{_m}\nstarting...')
        super().__init__(hash_page_current = hash_page_current, form_filters_old = form_filters_old)
        self.form_filters = form_filters_old # Filters_Manufacturing_Purchase_Order.from_json(form_filters_old.to_json())
        parameters_manufacturing_purchase_order = Parameters_Manufacturing_Purchase_Order.from_filters_manufacturing_purchase_order(form_filters_old)
        datastore_manufacturing_purchase_order = DataStore_Store_Manufacturing_Purchase_Order()
        self.manufacturing_purchase_orders, errors = datastore_manufacturing_purchase_order.get_many_manufacturing_purchase_order(parameters_manufacturing_purchase_order)
        self.units_measurement = self.get_many_unit_measurement()
        self.units_measurement_time = [unit_measurement for unit_measurement in self.units_measurement if unit_measurement.is_unit_of_time]
        self.currencies = self.get_many_currency()
        self.currency_options = [currency.to_json_option() for currency in self.currencies]

    @classmethod
    def save_manufacturing_purchase_orders(cls, comment, list_orders):
        _m = f'{cls.__name__}.save_manufacturing_purchase_orders'
        return DataStore_Store_Manufacturing_Purchase_Order().save_manufacturing_purchase_orders(comment, list_orders)