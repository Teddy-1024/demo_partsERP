"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Product Category Business Object

Description:
Business object for product
"""

# internal
import lib.argument_validation as av
from business_objects.store.plant import Plant
from business_objects.store.store_base import Store_Base
from extensions import db
from helpers.helper_app import Helper_App
# external
from typing import ClassVar


class Storage_Location(db.Model, Store_Base):
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Store_Base.ATTR_ID_STORAGE_LOCATION
    NAME_ATTR_OPTION_TEXT: ClassVar[str] = Store_Base.FLAG_NAME
    __tablename__ = 'Shop_Storage_Location_Temp'
    id_location = db.Column(db.Integer, primary_key=True)
    id_plant = db.Column(db.Integer)
    code = db.Column(db.String(50))
    name = db.Column(db.String(255))
    active = db.Column(db.Boolean)

    # plant = None
    
    def __init__(self):
        super().__init__()
        Store_Base.__init__(self)
        self.plant = None

    @classmethod
    def from_DB_storage_location(cls, query_row):
        location = cls()
        location.id_location = query_row[0]
        location.id_plant = query_row[1]
        location.plant = Plant.from_DB_storage_location(query_row)
        location.code = query_row[4]
        location.name = query_row[5]
        location.active = query_row[6]
        return location
    @classmethod
    def from_DB_stock_item(cls, query_row):
        location = cls()
        location.id_location = query_row[4]
        location.id_plant = query_row[5]
        location.code = query_row[8]
        location.name = query_row[9]
        location.plant = Plant.from_DB_stock_item(query_row)
        return location
    def __repr__(self):
        return f'''
            {self.ATTR_ID_STORAGE_LOCATION}: {self.id_location}
            {self.ATTR_ID_PLANT}: {self.id_plant}
            {self.FLAG_CODE}: {self.code}
            {self.FLAG_NAME}: {self.name}
            {self.FLAG_ACTIVE}: {self.active}
            '''
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_STORAGE_LOCATION: self.id_location,
            self.ATTR_ID_PLANT: self.id_plant,
            self.FLAG_CODE: self.code,
            self.FLAG_NAME: self.name,
            self.FLAG_ACTIVE: 1 if av.input_bool(self.active, self.FLAG_ACTIVE, f'{self.__class__.__name__}.to_json') else 0
        }
    @classmethod
    def from_json(cls, json):
        Helper_App.console_log(f'{cls.__name__}.from_json: {json}')
        location = cls()
        location.id_location = json[cls.ATTR_ID_STORAGE_LOCATION],
        location.id_plant = json[cls.ATTR_ID_PLANT],
        location.code = json[cls.FLAG_CODE],
        location.name = json[cls.FLAG_NAME],
        location.active = json[cls.FLAG_ACTIVE]
        return location

    def get_full_name(self):
        return f'{self.plant.name} - {self.name}'