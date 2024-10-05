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

class Filters_Stock_Item(Form_Base):
    id_category = SelectField('Category', validators=[Optional()], choices=[])
    id_product = SelectField('Product', validators=[Optional()], choices=[])
    is_out_of_stock = BooleanField('Out of stock only?')
    quantity_min = FloatField('Min stock')
    quantity_max = FloatField('Max stock')
    # submit = SubmitField('Submit')
    """
    def __repr__(self):
        return f'''
            {self.__class__.__name__}(
                id_category={self.id_category.data}, 
                id_product={self.id_product.data}, 
                is_out_of_stock={self.is_out_of_stock.data}, 
                quantity_min={self.quantity_min.data}, 
                quantity_max={self.quantity_max.data})
        '''
    """
    @classmethod
    def from_json(cls, json):
        form =  cls()
        form.id_category.choices = [(json[Store_Base.ATTR_ID_PRODUCT_CATEGORY], json[Store_Base.ATTR_ID_PRODUCT_CATEGORY])]
        form.id_category.data = json[Store_Base.ATTR_ID_PRODUCT_CATEGORY]
        form.id_product.choices = [(json[Store_Base.ATTR_ID_PRODUCT], json[Store_Base.ATTR_ID_PRODUCT])]
        form.id_product.data = json[Store_Base.ATTR_ID_PRODUCT]
        form.is_out_of_stock.data = av.input_bool(json[Store_Base.FLAG_IS_OUT_OF_STOCK], Store_Base.FLAG_IS_OUT_OF_STOCK, f'{cls.__name__}.from_json')
        form.quantity_min.data = json[Store_Base.FLAG_QUANTITY_MIN]
        form.quantity_max.data = json[Store_Base.FLAG_QUANTITY_MAX]
        return form
    def to_json(self):
        return {
            Store_Base.ATTR_ID_PRODUCT_CATEGORY: self.id_category.data,
            Store_Base.ATTR_ID_PRODUCT: self.id_product.data,
            Store_Base.FLAG_IS_OUT_OF_STOCK: self.is_out_of_stock.data,
            Store_Base.FLAG_QUANTITY_MIN: self.quantity_min.data,
            Store_Base.FLAG_QUANTITY_MAX: self.quantity_max.data
        }
    @classmethod
    def get_default(cls):
        filters = cls()
        filters.id_category.choices = cls.get_choices_blank()
        filters.id_product.choices = cls.get_choices_blank()