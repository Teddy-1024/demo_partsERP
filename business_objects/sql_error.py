"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    SQL Error Business Object

Description:
Business object for SQL errors
"""

# internal
from business_objects.base import Base
import lib.argument_validation as av
from lib import data_types
from forms.forms import Form_Basket_Add, Form_Basket_Edit # Form_Product
# external
from enum import Enum
from datetime import datetime, timedelta
import locale
from flask_sqlalchemy import SQLAlchemy


# VARIABLE INSTANTIATION
db = SQLAlchemy()


# CLASSES
class SQL_Error(db.Model):
    display_order = db.Column(db.Integer, primary_key=True)
    id_type = db.Column(db.Integer)
    code = db.Column(db.String(50))
    msg = db.Column(db.String(4000))
    name = db.Column(db.String(500))
    description = db.Column(db.String(4000))

    """
    def __new__(cls, display_order, code, msg):
        _m = 'SQL_Error.__new__'
        v_arg_type = 'class attribute'
        av.val_int(display_order, 'display_order', _m)
        av.val_str(code, 'code', _m, max_len=50, v_arg_type=v_arg_type)
        av.val_str(msg, 'msg', _m, max_len=4000, v_arg_type=v_arg_type)
        return super(SQL_Error, cls).__new__(cls)
    
    def __init__(self, display_order, code, msg):
        self.display_order = display_order
        self.code = code
        self.msg = msg
        super().__init__()
    """

    def from_DB_record(record):
        error = SQL_Error()
        error.display_order = record[0]
        error.id_type = record[1]
        error.code = record[2]
        error.msg = record[3]
        error.name = record[4]
        error.description = record[5]
        return error
    def to_json(self):
        return {
            Base.FLAG_DISPLAY_ORDER: self.display_order,
            Base.ATTR_ID_MSG_ERROR_TYPE: self.id_type,
            Base.FLAG_CODE: self.code,
            Base.FLAG_MESSAGE: self.msg,
            Base.FLAG_NAME: self.name,
            Base.FLAG_DESCRIPTION: self.description,
        }