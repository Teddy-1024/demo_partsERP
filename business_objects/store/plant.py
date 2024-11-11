"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Plant Business Object

Description:
Business object for plant
"""

# internal
import lib.argument_validation as av
from business_objects.address import Address
from business_objects.store.store_base import Store_Base
from extensions import db
from helpers.helper_app import Helper_App
# external
from typing import ClassVar


class Plant(db.Model, Store_Base):
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Store_Base.ATTR_ID_PLANT
    NAME_ATTR_OPTION_TEXT: ClassVar[str] = Store_Base.FLAG_NAME
    __tablename__ = 'Shop_Plant'
    id_plant = db.Column(db.Integer, primary_key=True)
    code = db.Column(db.String(50))
    name = db.Column(db.String(255))
    id_address = db.Column(db.Integer)
    id_user_manager = db.Column(db.Integer)
    active = db.Column(db.Boolean)

    # address = None
    
    def __init__(self):
        super().__init__()
        Store_Base.__init__(self)
        self.address = None
    @classmethod
    def from_DB_storage_location(cls, query_row):
        plant = cls()
        plant.id_plant = query_row[1]
        plant.id_address = query_row[2]
        plant.address = Address.from_DB_storage_location(query_row)
        return plant
    @classmethod
    def from_DB_plant(cls, query_row):
        plant = cls()
        plant.id_plant = query_row[0]
        plant.id_address = query_row[1]
        plant.address = Address.from_DB_plant(query_row)
        plant.code = query_row[4]
        plant.name = query_row[5]
        plant.active = query_row[6]
        return plant
    @classmethod
    def from_DB_stock_item(cls, query_row):
        plant = cls()
        plant.id_plant = query_row[5]
        plant.code = query_row[10]
        plant.name = query_row[11]
        return plant
    def __repr__(self):
        return f'''
            {self.ATTR_ID_PLANT}: {self.id_plant}
            {self.FLAG_CODE}: {self.code}
            {self.FLAG_NAME}: {self.name}
            {self.FLAG_ADDRESS}: {self.address}
            {self.ATTR_ID_USER_MANAGER}: {self.id_user_manager}
            {self.FLAG_ACTIVE}: {self.active}
            '''
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_PLANT: self.id_plant,
            self.FLAG_CODE: self.code,
            self.FLAG_NAME: self.name,
            self.FLAG_ADDRESS: None if self.address is None else self.address.to_json(),
            self.ATTR_ID_USER_MANAGER: self.id_user_manager,
            self.FLAG_ACTIVE: 1 if av.input_bool(self.active, self.FLAG_ACTIVE, f'{self.__class__.__name__}.to_json') else 0
        }
    @classmethod
    def from_json(cls, json):
        Helper_App.console_log(f'{cls.__name__}.from_json: {json}')
        plant = cls()
        plant.id_plant = json[cls.ATTR_ID_PLANT],
        plant.code = json[cls.FLAG_CODE],
        plant.name = json[cls.FLAG_NAME],
        plant.address = Address.from_json(json[cls.FLAG_ADDRESS]),
        plant.id_user_manager = json[cls.ATTR_ID_USER_MANAGER],
        plant.active = json[cls.FLAG_ACTIVE]
        return plant
