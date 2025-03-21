"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Backend
Feature:    Forms - Product Category Filters data input

Description:
Defines Flask-WTF forms for handling product category filter input.
"""

# internal
from business_objects.store.store_base import Store_Base
# from business_objects.store.product_category import Filters_Product_Category
# from models.model_view_store import Model_View_Store # circular
# from helpers.DEPRECATED.helper_abc import Interface_ABC
from forms.base import Form_Base
import lib.argument_validation as av
# external
from flask_wtf import FlaskForm
from wtforms import StringField, TextAreaField, SubmitField, BooleanField, IntegerField, SelectField, FloatField
from wtforms.validators import InputRequired, NumberRange, Regexp, DataRequired, Optional
from flask_wtf.recaptcha import RecaptchaField
from abc import ABCMeta, abstractmethod


class Filters_Product_Category(Form_Base):
    is_not_empty = BooleanField('Not empty only?')
    active = BooleanField("Active only?", default = True)
    
    def __repr__(self):
        return f'Filters_Product_Category(is_not_empty={self.is_not_empty.data}, active={self.active.data})'
    @classmethod
    def from_json(cls, json):
        _m = f'{cls.__name__}.from_json'
        form =  Filters_Product_Category() # is_not_empty=json['is_not_empty'], active=json['active'])
        form.is_not_empty.data = av.input_bool(json[Store_Base.FLAG_IS_NOT_EMPTY], 'is_not_empty', _m)
        form.active.data = av.input_bool(json[Store_Base.FLAG_ACTIVE], 'active', _m)
        return form