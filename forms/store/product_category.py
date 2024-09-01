"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Backend
Feature:    Forms - User data input

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


class Form_Filters_Product_Category(FlaskForm):
    is_not_empty = BooleanField('Not empty only?')
    active = BooleanField("Active only?")
    @classmethod
    def from_filters_product_category(cls, filters_product_category):
        form = Form_Filters_Product_Category()
        form.is_not_empty.data = filters_product_category.is_not_empty_only
        form.active.data = filters_product_category.active_only
        return form
    def __repr__(self):
        return f'Form_Filters_Product_Category(is_not_empty={self.is_not_empty.data}, active={self.active.data})'