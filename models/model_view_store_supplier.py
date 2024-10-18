"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Supplier View Model

Description:
Data model for supplier view page
"""

# internal
from models.model_view_store import Model_View_Store
from datastores.datastore_store_supplier import DataStore_Store_Supplier
from business_objects.store.supplier import Supplier, Parameters_Supplier
from forms.store.supplier import Filters_Supplier
import lib.argument_validation as av
# external
from typing import ClassVar

class Model_View_Store_Supplier(Model_View_Store):
    FLAG_DEPARTMENT_CONTACT: ClassVar[str] = Supplier.FLAG_DEPARTMENT_CONTACT
    FLAG_NAME_COMPANY: ClassVar[str] = Supplier.FLAG_NAME_COMPANY
    FLAG_NAME_CONTACT: ClassVar[str] = Supplier.FLAG_NAME_CONTACT
    supplier_addresses: list = None
    currencies: list = None
    currency_options: list = None
    form_filters: Filters_Supplier = None
    form_filters_old: Filters_Supplier
    regions: list = None
    suppliers: list = None
    units_measurement: list = None
    units_measurement_time: list = None

    @property
    def title(self):
        return 'Store Supplier'
    
    def __init__(self, form_filters_old, hash_page_current=Model_View_Store.HASH_PAGE_STORE_SUPPLIERS):
        _m = 'Model_View_Store_Supplier.__init__'
        print(f'{_m}\nstarting...')
        super().__init__(hash_page_current = hash_page_current, form_filters_old = form_filters_old)
        self.form_filters = form_filters_old # Filters_Supplier.from_json(form_filters_old.to_json())
        parameters_supplier = Parameters_Supplier.from_filters_supplier(self.form_filters)
        datastore_supplier = DataStore_Store_Supplier()
        self.suppliers, errors = datastore_supplier.get_many_supplier(parameters_supplier)
        
        """
        self.units_measurement = self.get_many_unit_measurement()
        self.units_measurement_time = [unit_measurement for unit_measurement in self.units_measurement if unit_measurement.is_unit_of_time]
        """
        self.currencies = self.get_many_currency()
        self.currency_options = [currency.to_json_option() for currency in self.currencies]
        self.supplier_addresses = {}
        for supplier in self.suppliers:
            self.supplier_addresses[supplier.id_supplier] = [address.to_json() for address in supplier.addresses] if supplier.addresses else []
        self.regions = self.get_many_region()
    @classmethod
    def save_suppliers(cls, comment, list_suppliers):
        _m = f'{cls.__name__}.save_suppliers'
        return DataStore_Store_Supplier().save_suppliers(comment, list_suppliers)