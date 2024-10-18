"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Backend
Feature:    Forms - Supplier Filters data input

Description:
Defines Flask-WTF forms for handling supplier filter input.
"""

# internal
from business_objects.store.store_base import Store_Base
from forms.base import Form_Base
import lib.argument_validation as av
# external
from flask_wtf import FlaskForm
from wtforms import StringField, TextAreaField, SubmitField, BooleanField, IntegerField, SelectField, FloatField
from wtforms.validators import InputRequired, NumberRange, Regexp, DataRequired, Optional
from flask_wtf.recaptcha import RecaptchaField
from abc import ABCMeta, abstractmethod


class Filters_Supplier(Form_Base):
    active = BooleanField("Active only?", default = True)
    def __repr__(self):
        return f'Filters_Supplier(active={self.active.data})'
    @classmethod
    def from_json(cls, json):
        _m = f'{cls.__name__}.from_json'
        form =  cls()
        form.active.data = av.input_bool(json[Store_Base.FLAG_ACTIVE], 'active', _m)
        return form