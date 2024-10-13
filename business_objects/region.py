"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Address Region Business Object

Description:
Business object for address region
"""

# internal
import lib.argument_validation as av
from business_objects.base import Base
from extensions import db
# external
from typing import ClassVar


class Region(db.Model, Base):
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Base.ATTR_ID_REGION
    NAME_ATTR_OPTION_TEXT: ClassVar[str] = Base.FLAG_NAME
    __tablename__ = 'Shop_Region'
    id_region = db.Column(db.Integer, primary_key=True)
    code = db.Column(db.String(50))
    name = db.Column(db.String(200))
    active = db.Column(db.Boolean)

    # region = None
    
    def __init__(self):
        super().__init__()
        Base.__init__(self)
        self.region = None

    @classmethod
    def from_DB_stock_item(cls, query_row):
        plant = cls()
        plant.id_region = query_row[7]
        return plant
    def __repr__(self):
        return f'''
            {self.ATTR_ID_REGION}: {self.id_region}
            {self.FLAG_CODE}: {self.code}
            {self.FLAG_NAME}: {self.name}
            {self.FLAG_ACTIVE}: {self.active}
            '''
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_REGION: self.id_region,
            self.FLAG_CODE: self.code,
            self.FLAG_NAME: self.name,
            self.FLAG_ACTIVE: 1 if av.input_bool(self.active, self.FLAG_ACTIVE, f'{self.__class__.__name__}.to_json') else 0
        }
    @classmethod
    def from_json(cls, json):
        print(f'{cls.__name__}.from_json: {json}')
        plant = cls()
        plant.id_region = json[cls.ATTR_ID_REGION]
        plant.code = json[cls.FLAG_CODE]
        plant.name = json[cls.FLAG_NAME]
        plant.active = json[cls.FLAG_ACTIVE]
        return plant
    @classmethod
    def from_DB_get_many_product_catalogue(cls, query_row):
        region = cls()
        region.id_region = query_row[0]
        region.name = query_row[1]
        region.code = query_row[2]
        # self.display_order = query_row[3]
        return region
    @classmethod
    def from_DB_region(cls, query_row):
        region = cls()
        region.id_region = query_row[0]
        region.code = query_row[1]
        region.name = query_row[2]
        region.active = av.input_bool(query_row[3], cls.FLAG_ACTIVE, f'{cls.__name__}.from_DB_region')
        region.display_order = query_row[4]
        return region
