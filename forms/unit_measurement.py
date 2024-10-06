"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Backend
Feature:    Forms - Unit of Measurement Filters data input

Description:
Defines Flask-WTF forms for handling unit of measurement filter input.
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


class Filters_Unit_Measurement(Form_Base):
    active = BooleanField("Active only?")
    @classmethod
    def from_filters(cls, filters):
        form = Filters_Unit_Measurement()
        form.active.data = filters.active
        return form
    def __repr__(self):
        return f'Filters_Unit_Measurement(active={self.active.data})'
    @classmethod
    def from_json(cls, json):
        form =  Filters_Unit_Measurement()
        form.active.data = av.input_bool(json[Store_Base.FLAG_ACTIVE], 'active', 'Filters_Unit_Measurement')
        return form
    def to_json(self):
        return {
            Store_Base.FLAG_ACTIVE: av.input_bool(self.active.data, Store_Base.FLAG_ACTIVE, f'{self.__class__.__name__}.to_json'),
        }