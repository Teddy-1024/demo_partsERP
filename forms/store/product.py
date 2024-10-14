"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Backend
Feature:    Forms - Product Filter data input

Description:
Defines Flask-WTF forms for handling user input.
"""

# IMPORTS
# internal
# from business_objects.store.product_category import Filters_Product_Category
# from models.model_view_store import Model_View_Store # circular
# external
from flask_wtf import FlaskForm
from wtforms import StringField, TextAreaField, SubmitField, BooleanField, IntegerField, SelectField, FloatField
from wtforms.validators import InputRequired, NumberRange, Regexp, DataRequired, Optional
from flask_wtf.recaptcha import RecaptchaField


class Filters_Product(FlaskForm):
    id_category = SelectField('Category', validators=[Optional()], choices=[('', 'All')], default='')
    is_not_empty = BooleanField('Not empty only?')
    active = BooleanField("Active only?", default = True)
    @classmethod
    def from_filters_product(cls, filters_product):
        form = Filters_Product()
        form.id_category = filters_product.id_category
        form.is_not_empty.data = filters_product.is_not_empty
        form.active.data = filters_product.active
        return form
    def __repr__(self):
        return f'Filters_Product(id_category={self.id_category}, is_not_empty={self.is_not_empty.data}, active={self.active.data})'
    @classmethod
    def from_json(cls, json):
        filters = cls()
        filters.id_category.data = json['id_category']
        filters.is_not_empty.data = json['is_not_empty']
        filters.active.data = json['active']
        return filters