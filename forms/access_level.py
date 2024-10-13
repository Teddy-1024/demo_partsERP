"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Backend
Feature:    Forms - Access Level Filters data input

Description:
Defines Flask-WTF forms for handling access level filter input.
"""

# internal
from business_objects.base import Base
from forms.base import Form_Base
import lib.argument_validation as av
# external
from flask_wtf import FlaskForm
from wtforms import StringField, TextAreaField, SubmitField, BooleanField, IntegerField, SelectField, FloatField
from wtforms.validators import InputRequired, NumberRange, Regexp, DataRequired, Optional
from flask_wtf.recaptcha import RecaptchaField
from abc import ABCMeta, abstractmethod


class Filters_Access_Level(Form_Base):
    active = BooleanField("Active only?", default = True)
    def __repr__(self):
        return f'{self.__class__.__name__}(active={self.active.data})'
    @classmethod
    def from_json(cls, json):
        form =  Filters_Access_Level()
        form.active.data = av.input_bool(json[Base.FLAG_ACTIVE], Base.FLAG_ACTIVE, f'{cls.__name__}.from_json')
        return form
    def to_json(self):
        return {
            Base.FLAG_ACTIVE: 1 if av.input_bool(self.active.data, Base.FLAG_ACTIVE, f'{self.__class__.__name__}.to_json') else 0,
        }