"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Address Business Object

Description:
Business object for address
"""

# internal
import lib.argument_validation as av
from business_objects.base import Base
from business_objects.region import Region
from extensions import db
from helpers.helper_app import Helper_App
# external
from typing import ClassVar
from flask import jsonify

class Address(db.Model, Base):
    FLAG_ADDRESS_LINE_1: ClassVar[str] = 'address_line_1'
    FLAG_ADDRESS_LINE_2: ClassVar[str] = 'address_line_2'
    FLAG_CITY: ClassVar[str] = 'city'
    FLAG_COUNTY: ClassVar[str] = 'county'
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Base.ATTR_ID_ADDRESS
    NAME_ATTR_OPTION_TEXT: ClassVar[str] = Base.FLAG_POSTCODE
    __tablename__ = 'Shop_Address'
    id_address = db.Column(db.Integer, primary_key=True)
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
        Base.__init__(self)
        self.region = None
    @classmethod
    def from_DB_storage_location(cls, query_row):
        address = cls()
        address.id_address = query_row[2]
        address.id_region = query_row[3]
        return address
    @classmethod
    def from_DB_plant(cls, query_row):
        address = cls()
        address.id_address = query_row[1]
        address.id_region = query_row[2]
        return address
    @classmethod
    def from_DB_stock_item(cls, query_row):
        address = cls()
        address.id_address = query_row[6]
        address.id_region = query_row[7]
        return address
    @classmethod
    def from_DB_supplier(cls, query_row):
        address = cls()
        address.id_address = query_row[1]
        address.postcode = query_row[2]
        return address
    def __repr__(self):
        return f'''
            {self.ATTR_ID_ADDRESS}: {self.id_address}
            {self.FLAG_REGION}: {self.region}
            {self.FLAG_POSTCODE}: {self.postcode}
            {self.FLAG_ADDRESS_LINE_1}: {self.address_line_1}
            {self.FLAG_ADDRESS_LINE_2}: {self.address_line_2}
            {self.FLAG_CITY}: {self.city}
            {self.FLAG_COUNTY}: {self.county}
            {self.FLAG_ACTIVE}: {self.active}
            '''
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_ADDRESS: self.id_address,
            self.FLAG_REGION: None if self.region is None else self.region.to_json(),
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
        Helper_App.console_log(f'{cls.__name__}.from_json: {json}')
        address = cls()
        address.id_address = json[cls.ATTR_ID_ADDRESS],
        address.region = Region.from_json(json[cls.FLAG_REGION]),
        address.postcode = json[cls.FLAG_POSTCODE],
        address.address_line_1 = json[cls.FLAG_ADDRESS_LINE_1],
        address.address_line_2 = json.get(cls.FLAG_ADDRESS_LINE_2, ''),
        address.city = json[cls.FLAG_CITY],
        address.county = json[cls.FLAG_COUNTY],
        address.active = json[cls.FLAG_ACTIVE]
        return address