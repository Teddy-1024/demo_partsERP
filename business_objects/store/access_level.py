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
from business_objects.store.store_base import Store_Base
from extensions import db
# external
from pydantic import BaseModel
from typing import ClassVar


class Access_Level(db.Model, Store_Base):
    __tablename__ = 'Shop_Access_Level_Temp'
    id_access_level = db.Column(db.Integer, primary_key=True)
    code = db.Column(db.String(50))
    name = db.Column(db.String(255))
    description = db.Column(db.String(4000))
    priority = db.Column(db.Integer)
    display_order = db.Column(db.Integer)
    active = db.Column(db.Boolean)
    created_on = db.Column(db.DateTime)
    created_by = db.Column(db.Integer)
    def __init__(self):
        super().__init__()
        Store_Base.__init__(self)
    def from_DB_access_level(query_row):
        access_level = Access_Level()
        access_level.id_access_level = query_row[0]
        access_level.code = query_row[1]
        access_level.name = query_row[2]
        access_level.priority = query_row[3]
        access_level.display_order = query_row[4]
        access_level.active = query_row[5]
        return access_level
    def __repr__(self):
        return f'''
            id: {self.id_access_level[0] if isinstance(self.id_access_level, tuple) else self.id_access_level}
            code: {self.code[0] if isinstance(self.code, tuple) else self.code}
            name: {self.name[0] if isinstance(self.name, tuple) else self.name}
            description: {self.description[0] if isinstance(self.description, tuple) else self.description}
            priority: {self.priority[0] if isinstance(self.priority, tuple) else self.priority}
            display_order: {self.display_order}
            active: {self.active}
            '''
    def to_json(self):
        return {
            self.ATTR_ID_ACCESS_LEVEL: self.id_access_level[0] if isinstance(self.id_access_level, tuple) else self.id_access_level,
            self.FLAG_CODE: self.code[0] if isinstance(self.code, tuple) else self.code,
            self.FLAG_NAME: self.name[0] if isinstance(self.name, tuple) else self.name,
            self.FLAG_DESCRIPTION: self.description[0] if isinstance(self.description, tuple) else self.description,
            self.FLAG_PRIORITY: self.priority[0] if isinstance(self.priority, tuple) else self.priority,
            self.FLAG_DISPLAY_ORDER: self.display_order,
            self.FLAG_ACTIVE: self.active
        }
    def to_json_option(self):
        return {
            'value': self.id_access_level,
            'text': self.name
        }
    @classmethod
    def from_json(cls, json):
        print(f'Access Level.from_json: {json}')
        access_level = cls()
        access_level.id_access_level = json[cls.ATTR_ID_ACCESS_LEVEL],
        access_level.code = json[cls.FLAG_CODE],
        access_level.name = json[cls.FLAG_NAME],
        access_level.priority = json[cls.FLAG_PRIORITY],
        access_level.description = json[cls.FLAG_DESCRIPTION],
        access_level.display_order = json[cls.FLAG_DISPLAY_ORDER]
        access_level.active = json[cls.FLAG_ACTIVE]
        return access_level

class Filters_Access_Level(BaseModel):
    get_inactive_access_level: bool
    def __init__(self, get_inactive_access_level = False):
        super().__init__(get_inactive_access_level = get_inactive_access_level)
    def to_json(self):
        return {
            'a_get_inactive_access_level': self.get_inactive_access_level
        }
    @classmethod
    def from_json(cls, json):
        filters = cls()
        filters.get_inactive_access_level = json['a_get_inactive_access_level']
        return filters