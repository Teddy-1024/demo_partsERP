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


class Filters_Product_Permutation(Form_Base):
    id_category = SelectField('Category', validators=[Optional()], choices=[('', 'All')], default='')
    id_product = SelectField('Product', validators=[Optional()], choices=[('', 'All')], default='')
    is_out_of_stock = BooleanField('Out of stock only?')
    active = BooleanField('Active only?', default=True)
    quantity_min = FloatField('Min stock')
    quantity_max = FloatField('Max stock')
    
    def __repr__(self):
        return f'''
            Filters_Product_Permutation(
                id_category={self.id_category.data}, 
                id_product={self.id_product.data}, 
                is_out_of_stock={self.is_out_of_stock.data}, 
                active={self.active.data},
                quantity_min={self.quantity_min.data}, 
                quantity_max={self.quantity_max.data})
        '''
    @classmethod
    def from_json(cls, json):
        form =  cls()
        form.id_category.choices = [(json[Store_Base.ATTR_ID_PRODUCT_CATEGORY], json[Store_Base.ATTR_ID_PRODUCT_CATEGORY])]
        form.id_category.data = json[Store_Base.ATTR_ID_PRODUCT_CATEGORY]
        form.id_product.choices = [(json[Store_Base.ATTR_ID_PRODUCT], json[Store_Base.ATTR_ID_PRODUCT])]
        form.id_product.data = json[Store_Base.ATTR_ID_PRODUCT]
        form.is_out_of_stock.data = av.input_bool(json[Store_Base.FLAG_IS_OUT_OF_STOCK], Store_Base.FLAG_IS_OUT_OF_STOCK, f'{cls.__name__}.from_json')
        form.active.data = av.input_bool(json[Store_Base.FLAG_ACTIVE], Store_Base.FLAG_ACTIVE, f'{cls.__name__}.from_json')
        form.quantity_min.data = json[Store_Base.FLAG_QUANTITY_MIN]
        form.quantity_max.data = json[Store_Base.FLAG_QUANTITY_MAX]
        return form