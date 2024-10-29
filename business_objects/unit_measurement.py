"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Unit of Measurement Business Object
"""

# internal
from business_objects.base import Base
from business_objects.db_base import SQLAlchemy_ABC, Get_Many_Parameters_Base
from extensions import db
# from forms.forms import Form_Filters_User
from helpers.helper_app import Helper_App
import lib.argument_validation as av
# external
from dataclasses import dataclass
from typing import ClassVar


class Unit_Measurement(SQLAlchemy_ABC, Base):
    ATTR_ID_UNIT_MEASUREMENT: ClassVar[str] = 'id_unit_measurement'
    FLAG_IS_BASE_UNIT: ClassVar[str] = 'is_base_unit'
    FLAG_IS_UNIT_OF_DISTANCE: ClassVar[str] = 'is_unit_of_distance'
    FLAG_IS_UNIT_OF_MASS: ClassVar[str] = 'is_unit_of_mass'
    FLAG_IS_UNIT_OF_TIME: ClassVar[str] = 'is_unit_of_time'
    FLAG_IS_UNIT_OF_VOLUME: ClassVar[str] = 'is_unit_of_volume'
    FLAG_NAME_PLURAL: ClassVar[str] = 'name_plural'
    FLAG_NAME_SINGULAR: ClassVar[str] = 'name_singular'
    FLAG_SYMBOL: ClassVar[str] = 'symbol'
    FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX: ClassVar[str] = 'symbol_is_suffix_not_prefix'
    # KEY_UNIT_MEASUREMENT: ClassVar[str] = 'unit_of_measurement'
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = ATTR_ID_UNIT_MEASUREMENT
    NAME_ATTR_OPTION_TEXT: ClassVar[str] = FLAG_NAME_SINGULAR

    id_unit_measurement = db.Column(db.Integer, primary_key=True)
    name_singular = db.Column(db.String(255))
    name_plural = db.Column(db.String(256))
    symbol = db.Column(db.String(50))
    symbol_is_suffix_not_prefix = db.Column(db.Boolean)
    is_base_unit = db.Column(db.Boolean)
    is_unit_of_distance = db.Column(db.Boolean)
    is_unit_of_mass = db.Column(db.Boolean)
    is_unit_of_time = db.Column(db.Boolean)
    is_unit_of_volume = db.Column(db.Boolean)
    active = db.Column(db.Boolean)
        
    def from_DB_unit_measurement(query_row):
        _m = 'Unit_Measurement.from_DB_unit_measurement'
        unit = Unit_Measurement()
        unit.id_unit_measurement = query_row[0]
        unit.name_singular = query_row[1]
        unit.name_plural = query_row[2]
        unit.symbol = query_row[3]
        unit.symbol_is_suffix_not_prefix = av.input_bool(query_row[4], 'symbol_is_suffix_not_prefix', _m)
        unit.is_base_unit = av.input_bool(query_row[5], 'is_base_unit', _m)
        unit.is_unit_of_distance = av.input_bool(query_row[6], 'is_unit_of_distance', _m)
        unit.is_unit_of_mass = av.input_bool(query_row[7], 'is_unit_of_mass', _m)
        unit.is_unit_of_time = av.input_bool(query_row[8], 'is_unit_of_time', _m)
        unit.is_unit_of_volume = av.input_bool(query_row[9], 'is_unit_of_volume', _m)
        unit.active = av.input_bool(query_row[10], 'active', _m)
        return unit
    
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_UNIT_MEASUREMENT: self.id_unit_measurement,
            self.FLAG_NAME_SINGULAR: self.name_singular,
            self.FLAG_NAME_PLURAL: self.name_plural,
            self.FLAG_SYMBOL: self.symbol,
            self.FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX: self.symbol_is_suffix_not_prefix,
            self.FLAG_IS_BASE_UNIT: self.is_base_unit,
            self.FLAG_IS_UNIT_OF_DISTANCE: self.is_unit_of_distance,
            self.FLAG_IS_UNIT_OF_MASS: self.is_unit_of_mass,
            self.FLAG_IS_UNIT_OF_TIME: self.is_unit_of_time,
            self.FLAG_IS_UNIT_OF_VOLUME: self.is_unit_of_volume,
            self.FLAG_ACTIVE: self.active,
        }
    @classmethod
    def from_json(cls, json):
        Helper_App.console_log(f' Unit_Measurement.from_json: {json}')
        unit = cls()
        unit.id_unit_measurement = json[cls.ATTR_ID_UNIT_MEASUREMENT]
        unit.name_singular = json[cls.FLAG_NAME_SINGULAR]
        unit.name_plural = json[cls.FLAG_NAME_PLURAL]
        unit.symbol = json[cls.FLAG_SYMBOL]
        unit.symbol_is_suffix_not_prefix = json[cls.FLAG_SYMBOL_IS_SUFFIX_NOT_PREFIX]
        unit.is_base_unit = json[cls.FLAG_IS_BASE_UNIT]
        unit.is_unit_of_distance = json[cls.FLAG_IS_UNIT_OF_DISTANCE]
        unit.is_unit_of_mass = json[cls.FLAG_IS_UNIT_OF_MASS]
        unit.is_unit_of_time = json[cls.FLAG_IS_UNIT_OF_TIME]
        unit.is_unit_of_volume = json[cls.FLAG_IS_UNIT_OF_VOLUME]
        unit.active = json[cls.FLAG_ACTIVE]
        return unit
        
    def __repr__(self):
        return f'''
            id_unit_of_measurement: {self.id_unit_measurement},
            name_singular: {self.name_singular},
            name_plural: {self.name_plural},
            symbol: {self.symbol},
            symbol_is_suffix_not_prefix: {self.symbol_is_suffix_not_prefix},
            is_base_unit: {self.is_base_unit},
            is_unit_of_distance: {self.is_unit_of_distance},
            is_unit_of_mass: {self.is_unit_of_mass},
            is_unit_of_time: {self.is_unit_of_time},
            is_unit_of_volume: {self.is_unit_of_volume},
            active: {self.active}
            '''
    
"""
@dataclass
class Filters_Unit_Measurement():
    active_only: bool = False

        def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            'a_get_all_user': self.get_all_user,
            'a_get_inactive_user': self.get_inactive_user,
            'a_get_first_user_only': self.get_first_user_only,
            'a_ids_user': self.ids_user,
            'a_ids_user_auth0': self.ids_user_auth0,
        }
    
    @staticmethod
    def from_form(form):
        av.val_instance(form, 'form', 'User_Filters.from_form', Form_Filters_User)
        get_inactive = av.input_bool(form.active.data, "active", "User_Filters.from_form")
        id_user = form.id_user.data
        return User_Filters(
            get_all_user = (id_user is None),
            get_inactive_user = get_inactive,
            get_first_user_only = False,
            ids_user = id_user,
            ids_user_auth0 = '',
        )
    
    @staticmethod
    def from_user(user):
        av.val_instance(user, 'user', 'User_Filters.from_user', User)
        return User_Filters(
            get_all_user = (user.id_user is None and user.id_user_auth0 is None),
            get_inactive_user = False,
            get_first_user_only = False,
            ids_user = user.id_user,
            ids_user_auth0 = user.id_user_auth0,
        )
    
    @staticmethod
    def get_default(datastore_store):
        user = datastore_store.get_login_user()
        return User_Filters(
            get_all_user = False,
            get_inactive_user = False,
            get_first_user_only = False,
            ids_user = user.id_user,
            ids_user_auth0 = '',
        )
"""