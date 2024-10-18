"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Backend
Feature:    Forms - Manufacturing Purchase Order Filters data input

Description:
Defines Flask-WTF forms for handling manufacturing purchase order filter input.
"""

# internal
from business_objects.store.store_base import Store_Base
from forms.base import Form_Base
import lib.argument_validation as av
# external
from flask_wtf import FlaskForm
from wtforms import StringField, TextAreaField, SubmitField, BooleanField, IntegerField, SelectField, FloatField, DateField
from wtforms.validators import InputRequired, NumberRange, Regexp, DataRequired, Optional
from flask_wtf.recaptcha import RecaptchaField
from abc import ABCMeta, abstractmethod


class Filters_Manufacturing_Purchase_Order(Form_Base):
    active = BooleanField("Active only?", default = True)
    date_from = DateField('Date from')
    date_to = DateField('Date to')
    def __repr__(self):
        return f'Filters_Manufacturing_Purchase_Order(active={self.active.data}, date_from={self.date_from.data}, date_to={self.date_to.data})'
    @classmethod
    def from_json(cls, json):
        _m = f'{cls.__name__}.from_json'
        form =  cls()
        form.active.data = av.input_bool(json[Store_Base.FLAG_ACTIVE], 'active', _m)
        form.date_from.data = json[Store_Base.FLAG_DATE_FROM]
        form.date_to.data = json[Store_Base.FLAG_DATE_TO]
        return form