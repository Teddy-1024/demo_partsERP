"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Database Base Business Objects

Description:
Abstract business object for database objects
"""

# internal
# from helpers.DEPRECATED.helper_abc import Interface_ABC
from extensions import db
import lib.argument_validation as av
# external
from typing import ClassVar
from abc import abstractmethod, ABCMeta
from pydantic import BaseModel
from sqlalchemy.ext.declarative import DeclarativeMeta
# from flask_sqlalchemy import SQLAlchemy


class Get_Many_Parameters_Base(BaseModel, metaclass=ABCMeta):
    # a_id_user: int
    def __init__(self, **kwargs): # , a_id_user
        super().__init__(**kwargs) # a_id_user=a_id_user, 
    @classmethod
    @abstractmethod
    def get_default(cls): # , id_user
        pass
    """
    @abstractmethod
    def to_json(self):
        pass
    """
    """
    @classmethod
    @abstractmethod
    def from_json(cls, json):
        pass
    """
    """
    @classmethod
    @abstractmethod
    def from_form(cls, form):
        pass
    """


# db = SQLAlchemy()
# Base = declarative_base()
class SQLAlchemy_ABCMeta(db.Model.__class__, ABCMeta):
    pass

class SQLAlchemy_ABC(db.Model, metaclass=SQLAlchemy_ABCMeta):
    __abstract__ = True
    # id = db.Column(db.Integer, primary_key=True)
    def __init__(self):
        pass
    def __repr__(self):
        pass
    def to_json(self):
        pass
    @classmethod
    def from_json(cls, json):
        pass
    """
    def to_json_option(self):
        pass
    """
    def to_temporary_record(self):
        pass
    def to_object_with_missing_attributes(self, excluded_attributes):
        return {
            column.name: getattr(self, column.name) 
            for column in self.__table__.columns
            if column.name not in excluded_attributes
        }