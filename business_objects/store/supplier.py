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
from business_objects.store.store_base import Store_Base
from extensions import db
# external
from pydantic import BaseModel
from typing import ClassVar


class Supplier(db.Model, Store_Base):
    FLAG_DEPARTMENT_CONTACT: ClassVar[str] = 'department_contact'
    FLAG_NAME_COMPANY: ClassVar[str] = 'name_company'
    FLAG_NAME_CONTACT: ClassVar[str] = 'name_contact'
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Store_Base.ATTR_ID_SUPPLIER
    NAME_ATTR_OPTION_TEXT: ClassVar[str] = Store_Base.FLAG_NAME
    __tablename__ = 'Shop_Supplier_Temp'
    id_supplier = db.Column(db.Integer, primary_key=True)
    id_address = db.Column(db.Integer)
    id_currency = db.Column(db.Integer)
    name_company = db.Column(db.String(255))
    name_contact = db.Column(db.String(255))
    department_contact = db.Column(db.String(255))
    # address
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
    @classmethod
    def from_DB_supplier(cls, query_row):
        supplier = cls()
        supplier.id_supplier = query_row[0]
        supplier.id_address = query_row[1]
        supplier.id_currency = query_row[2]
        supplier.name_company = query_row[3]
        supplier.name_contact = query_row[4]
        supplier.department_contact = query_row[5]
        supplier.phone_number = query_row[6]
        supplier.fax = query_row[7]
        supplier.email = query_row[8]
        supplier.website = query_row[9]
        supplier.active = query_row[10]
        return supplier

    def __repr__(self):
        return f'''
id: {self.id_supplier},
id_address: {self.id_address},
id_currency: {self.id_currency},
name_company: {self.name_company},
name_contact: {self.name_contact},
department_contact: {self.department_contact},
phone_number: {self.phone_number},
fax: {self.fax},
email: {self.email},
website: {self.website},
active: {self.active},
            '''
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_SUPPLIER: self.id_supplier,
            self.ATTR_ID_ADDRESS: self.id_address,
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
        print(f'{cls.__name__}.from_json: {json}')
        supplier = cls()
        supplier.id_supplier = json[cls.ATTR_ID_SUPPLIER]
        supplier.id_address = json[cls.ATTR_ID_ADDRESS]
        supplier.id_currency = json[cls.ATTR_ID_CURRENCY]
        supplier.name_company = json[cls.FLAG_NAME_COMPANY]
        supplier.name_contact = json[cls.FLAG_NAME_CONTACT]
        supplier.department_contact = json[cls.FLAG_DEPARTMENT_CONTACT]
        supplier.phone_number = json[cls.FLAG_PHONE_NUMBER]
        supplier.fax = json[cls.FLAG_FAX]
        supplier.email = json[cls.FLAG_EMAIL]
        supplier.website = json[cls.FLAG_WEBSITE]
        supplier.active = json[cls.FLAG_ACTIVE]
        return supplier
