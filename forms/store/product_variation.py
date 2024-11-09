"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Backend
Feature:    Forms - Product Variation Filters data input

Description:
Defines Flask-WTF forms for handling product variation filter input.
"""

# internal
from business_objects.store.store_base import Store_Base
from forms.base import Form_Base
from helpers.helper_app import Helper_App
import lib.argument_validation as av
# external
from flask_wtf import FlaskForm
from wtforms import StringField, TextAreaField, SubmitField, BooleanField, IntegerField, SelectField, FloatField, DateField
from wtforms.validators import InputRequired, NumberRange, Regexp, DataRequired, Optional
from flask_wtf.recaptcha import RecaptchaField
from abc import ABCMeta, abstractmethod


class Filters_Product_Variation(Form_Base):
    is_not_empty = BooleanField('Not empty only?')
    active = BooleanField("Active only?", default = True)
    def __repr__(self):
        return f'Filters_Product_Variation(is_not_empty={self.is_not_empty.data}, active={self.active.data})'
    @classmethod
    def from_json(cls, json):
        _m = f'{cls.__name__}.from_json'
        Helper_App.console_log(f'{_m}\njson={json}')
        form =  cls()
        form.is_not_empty.data = av.input_bool(json[Store_Base.FLAG_IS_NOT_EMPTY], Store_Base.FLAG_IS_NOT_EMPTY, _m)
        form.active.data = av.input_bool(json[Store_Base.FLAG_ACTIVE], Store_Base.FLAG_ACTIVE, _m)
        return form