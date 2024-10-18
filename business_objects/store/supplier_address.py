"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Supplier Address Business Object

Description:
Business object for supplier address
"""

# internal
import lib.argument_validation as av
from business_objects.store.store_base import Store_Base
from business_objects.region import Region
from extensions import db
# external
from typing import ClassVar
from flask import jsonify

class Supplier_Address(db.Model, Store_Base):
    FLAG_ADDRESS_LINE_1: ClassVar[str] = 'address_line_1'
    FLAG_ADDRESS_LINE_2: ClassVar[str] = 'address_line_2'
    FLAG_CITY: ClassVar[str] = 'city'
    FLAG_COUNTY: ClassVar[str] = 'county'
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Store_Base.ATTR_ID_ADDRESS
    NAME_ATTR_OPTION_TEXT: ClassVar[str] = Store_Base.FLAG_POSTCODE
    __tablename__ = 'Shop_Supplier_Address'
    id_address = db.Column(db.Integer, primary_key=True)
    id_supplier = db.Column(db.Integer)
    id_region = db.Column(db.Integer)
    postcode = db.Column(db.String(20))
    address_line_1 = db.Column(db.String(256))
    address_line_2 = db.Column(db.String(256))
    city = db.Column(db.String(256))
    county = db.Column(db.String(256))
    active = db.Column(db.Boolean)

    # region = None
    
    def __init__(self):
        super().__init__()
        Store_Base.__init__(self)
        self.region = Region()
    @classmethod
    def from_DB_supplier(cls, query_row):
        address = cls()
        address.id_supplier = query_row[0]
        address.id_address = query_row[1]
        address.id_region = query_row[2]
        address.region = Region.from_DB_supplier(query_row)
        address.postcode = query_row[4]
        address.address_line_1 = query_row[5]
        address.address_line_2 = query_row[6]
        address.city = query_row[7]
        address.county = query_row[8]
        address.active = av.input_bool(query_row[9], 'active', f'{cls.__name__}.from_DB_supplier')

        return address
    def __repr__(self):
        return f'''
{self.ATTR_ID_ADDRESS}: {self.id_address}
{self.ATTR_ID_SUPPLIER}: {self.id_supplier}
{self.FLAG_REGION}: {self.region}
{self.FLAG_POSTCODE}: {self.postcode}
{self.FLAG_ADDRESS_LINE_1}: {self.address_line_1}
{self.FLAG_ADDRESS_LINE_2}: {self.address_line_2}
{self.FLAG_CITY}: {self.city}
{self.FLAG_COUNTY}: {self.county}
{self.FLAG_ACTIVE}: {self.active}
            '''
    def to_json(self):
        print(f'{self.__class__.__name__}.to_json\n{self.__dict__}\n{self}')
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_ADDRESS: self.id_address,
            self.ATTR_ID_SUPPLIER: self.id_supplier,
            self.FLAG_REGION: self.region.to_json(),
            self.FLAG_POSTCODE: self.postcode,
            self.FLAG_ADDRESS_LINE_1: self.address_line_1,
            self.FLAG_ADDRESS_LINE_2: self.address_line_2,
            self.FLAG_CITY: self.city,
            self.FLAG_COUNTY: self.county,
            self.FLAG_ACTIVE: 1 if av.input_bool(self.active, self.FLAG_ACTIVE, f'{self.__class__.__name__}.to_json') else 0
        }
    def to_json_str(self):
        return jsonify(self.to_json())
    @classmethod
    def from_json(cls, json):
        print(f'{cls.__name__}.from_json: {json}')
        address = cls()
        address.id_address = json[cls.ATTR_ID_ADDRESS]
        address.id_supplier = json[cls.ATTR_ID_SUPPLIER]
        address.id_region = json[cls.ATTR_ID_REGION]
        address.region = Region()
        address.region.id_region = json[cls.ATTR_ID_REGION]
        address.postcode = json[cls.FLAG_POSTCODE]
        address.address_line_1 = json[cls.FLAG_ADDRESS_LINE_1]
        address.address_line_2 = json.get(cls.FLAG_ADDRESS_LINE_2, '')
        address.city = json[cls.FLAG_CITY]
        address.county = json[cls.FLAG_COUNTY]
        address.active = json[cls.FLAG_ACTIVE]
        return address
    

class Supplier_Address_Temp(db.Model, Store_Base):
    __tablename__: ClassVar[str] = 'Shop_Supplier_Address_Temp'
    __table_args__ = { 'extend_existing': True }
    id_address: int = db.Column(db.Integer, primary_key=True)
    id_supplier: int = db.Column(db.Integer)
    id_region: int = db.Column(db.Integer)
    postcode: str = db.Column(db.String(20))
    address_line_1: str = db.Column(db.String(256))
    address_line_2: str = db.Column(db.String(256))
    city: str = db.Column(db.String(256))
    county: str = db.Column(db.String(256))
    active: bool = db.Column(db.Boolean)
    guid: str = db.Column(db.String(36))
    @classmethod
    def from_supplier_address(cls, address):
        row = cls()
        row.id_address = address.id_address
        row.id_supplier = address.id_supplier
        row.id_region = address.id_region
        row.postcode = address.postcode
        row.address_line_1 = address.address_line_1
        row.address_line_2 = address.address_line_2
        row.city = address.city
        row.county = address.county
        row.active = 1 if address.active else 0
        return row
    def __repr__(self):
        return f'''
id_address: {self.id_address}
id_supplier: {self.id_supplier}
id_region: {self.id_region}
postcode: {self.postcode}
address_line_1: {self.address_line_1}
address_line_2: {self.address_line_2}
city: {self.city}
county: {self.county}
active: {self.active}
guid: {self.guid}
            '''