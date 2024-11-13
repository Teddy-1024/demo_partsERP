"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Supplier Business Object

Description:
Business object for supplier
"""

# internal
import lib.argument_validation as av
from business_objects.store.supplier_address import Supplier_Address
from business_objects.currency import Currency
from business_objects.db_base import Get_Many_Parameters_Base
from business_objects.store.store_base import Store_Base
from extensions import db
from helpers.helper_app import Helper_App
# external
from pydantic import BaseModel
from typing import ClassVar


class Supplier(db.Model, Store_Base):
    FLAG_DEPARTMENT_CONTACT: ClassVar[str] = 'department_contact'
    FLAG_NAME_COMPANY: ClassVar[str] = 'name_company'
    FLAG_NAME_CONTACT: ClassVar[str] = 'name_contact'
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Store_Base.ATTR_ID_SUPPLIER
    NAME_ATTR_OPTION_TEXT: ClassVar[str] = FLAG_NAME_COMPANY
    __tablename__ = 'Shop_Supplier'
    id_supplier = db.Column(db.Integer, primary_key=True)
    # id_address = db.Column(db.Integer)
    id_currency = db.Column(db.Integer)
    name_company = db.Column(db.String(255))
    name_contact = db.Column(db.String(255))
    department_contact = db.Column(db.String(255))
    phone_number = db.Column(db.String(50))
    fax = db.Column(db.String(50))
    email = db.Column(db.String(255))
    website = db.Column(db.String(255))
    active = db.Column(db.Boolean)
    created_on = db.Column(db.DateTime)
    created_by = db.Column(db.Integer)
    def __init__(self):
        super().__init__()
        Store_Base.__init__(self)
        self.addresses = []
        self.currency = None
    @classmethod
    def from_DB_supplier(cls, query_row):
        supplier = cls()
        supplier.id_supplier = query_row[0]
        # supplier.id_address = query_row[1]
        # supplier.address = Supplier_Address.from_DB_supplier(query_row)
        supplier.id_currency = query_row[1]
        supplier.currency = Currency.from_DB_supplier(query_row)
        supplier.name_company = query_row[4]
        supplier.name_contact = query_row[5]
        supplier.department_contact = query_row[6]
        supplier.phone_number = query_row[7]
        supplier.fax = query_row[8]
        supplier.email = query_row[9]
        supplier.website = query_row[10]
        supplier.active = av.input_bool(query_row[11], 'active', f'{cls.__name__}.from_DB_supplier')
        return supplier
    @classmethod
    def from_DB_supplier_purchase_order(cls, query_row):
        supplier = cls()
        supplier.id_supplier = query_row[1]
        supplier.name_company = query_row[2]
        return supplier
    def __repr__(self):
        return f'''
id: {self.id_supplier},
id_currency: {self.id_currency},
name_company: {self.name_company},
name_contact: {self.name_contact},
department_contact: {self.department_contact},
phone_number: {self.phone_number},
fax: {self.fax},
email: {self.email},
website: {self.website},
active: {self.active},
addresses: {self.addresses}
            '''
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_SUPPLIER: self.id_supplier,
            # self.ATTR_ID_ADDRESS: self.id_address,
            self.ATTR_ID_CURRENCY: self.id_currency,
            self.FLAG_NAME_COMPANY: self.name_company,
            self.FLAG_NAME_CONTACT: self.name_contact,
            self.FLAG_DEPARTMENT_CONTACT: self.department_contact,
            self.FLAG_PHONE_NUMBER: self.phone_number,
            self.FLAG_FAX: self.fax,
            self.FLAG_EMAIL: self.email,
            self.FLAG_WEBSITE: self.website,
            self.FLAG_ACTIVE: av.input_bool(self.active, self.FLAG_ACTIVE, f'{self.__class__.__name__}.to_json')
        }
    def to_json_option(self):
        return {
            'value': self.id_supplier,
            'text': self.name_company
        }
    @classmethod
    def from_json(cls, json):
        Helper_App.console_log(f'{cls.__name__}.from_json: {json}')
        supplier = cls()
        supplier.id_supplier = json[cls.ATTR_ID_SUPPLIER]
        supplier.id_currency = json[cls.ATTR_ID_CURRENCY]
        supplier.name_company = json[cls.FLAG_NAME_COMPANY]
        supplier.name_contact = json[cls.FLAG_NAME_CONTACT]
        supplier.department_contact = json[cls.FLAG_DEPARTMENT_CONTACT]
        supplier.phone_number = json[cls.FLAG_PHONE_NUMBER]
        supplier.fax = json[cls.FLAG_FAX]
        supplier.email = json[cls.FLAG_EMAIL]
        supplier.website = json[cls.FLAG_WEBSITE]
        supplier.active = json[cls.FLAG_ACTIVE]
        addresses = json.get(cls.FLAG_SUPPLIER_ADDRESS, [])
        supplier.addresses = [Supplier_Address.from_json(address) for address in addresses]
        return supplier
    def get_address_active(self):
        for address in self.addresses:
            if address.active:
                return address
        return Supplier_Address()
        address = Supplier_Address()
        address.postcode = ''
        return address

class Parameters_Supplier(Get_Many_Parameters_Base):
    a_get_all_supplier: bool
    a_get_inactive_supplier: bool
    a_ids_supplier: str
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
    @classmethod
    def get_default(cls):
        return cls(
            a_get_all_supplier = True,
            a_get_inactive_supplier = False,
            a_ids_supplier = '',
        )
    @classmethod
    def from_filters_supplier(cls, form):
        parameters = cls.get_default()
        parameters.a_get_inactive_supplier = form.active.data
        return parameters

class Supplier_Temp(db.Model, Store_Base):
    __tablename__: ClassVar[str] = 'Shop_Supplier_Temp'
    __table_args__ = { 'extend_existing': True }
    id_temp: int = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_supplier: int = db.Column(db.Integer)
    id_currency: int = db.Column(db.Integer)
    # id_address: int = db.Column(db.Integer)
    name_company: str = db.Column(db.String(255))
    name_contact: str = db.Column(db.String(255))
    department_contact: str = db.Column(db.String(255))
    phone_number: str = db.Column(db.String(50))
    fax: str = db.Column(db.String(50))
    email: str = db.Column(db.String(255))
    website: str = db.Column(db.String(255))
    active: bool = db.Column(db.Boolean)
    guid: str = db.Column(db.String(36))
    def __init__(self):
        super().__init__()
        self.id_temp = None
    @classmethod
    def from_supplier(cls, supplier):
        row = cls()
        row.id_supplier = supplier.id_supplier
        row.id_currency = supplier.id_currency
        # row.id_address = supplier.id_address
        row.name_company = supplier.name_company
        row.name_contact = supplier.name_contact
        row.department_contact = supplier.department_contact
        row.phone_number = supplier.phone_number
        row.fax = supplier.fax
        row.email = supplier.email
        row.website = supplier.website
        row.active = 1 if supplier.active else 0
        return row
    def __repr__(self):
        return f'''
id_supplier: {self.id_supplier}
id_currency: {self.id_currency}
name_company: {self.name_company}
name_contact: {self.name_contact}
department_contact: {self.department_contact}
phone_number: {self.phone_number}
fax: {self.fax}
email: {self.email}
website: {self.website}
active: {self.active}
guid: {self.guid}
            '''