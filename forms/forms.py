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
# from business_objects.store.product_category import Filters_Product_Category # circular
# from models.model_view_store import Model_View_Store # circular
from forms.base import Form_Base
# external
from flask_wtf import FlaskForm
from wtforms import StringField, TextAreaField, SubmitField, BooleanField, IntegerField, SelectField, FloatField
from wtforms.validators import InputRequired, NumberRange, Regexp, DataRequired, Optional
from flask_wtf.recaptcha import RecaptchaField
from abc import ABCMeta, abstractmethod



class Form_Contact(FlaskForm):
    email = StringField('Email address')
    CC = BooleanField('Would you like to receive a copy of this email request?') # not in use
    name = StringField('Name')
    message = TextAreaField('Message')
    recaptcha = RecaptchaField()
    submit = SubmitField('Submit')

class Form_Register(FlaskForm):
    email = StringField('Email address')
    CC = BooleanField('Would you like to receive a copy of this email request?') # not in use
    name = StringField('Name')
    message = TextAreaField('Message')
    submit = SubmitField('Submit')


class Form_Basket_Add(FlaskForm):
    quantity = IntegerField(
        'Quantity',
        validators = [
            NumberRange(min=1, message='Please enter a positive integer')
        ],
        default = 1
    )
    submit = SubmitField('Add')
    form_type = 'Form_Basket_Add'

class Form_Basket_Edit(FlaskForm):
    quantity = IntegerField(
        'Quantity',
        validators = [
            NumberRange(min=1, message='Please enter a positive integer')
        ],
        default = 1
    )
    submit = SubmitField('Update')
    form_type = 'Form_Basket_Edit'

class Form_Billing(FlaskForm):
    identical = BooleanField('Use delivery address')
    region = SelectField('Country / region', choices=[('uk', 'UK'), ('international', 'International')], validators=[DataRequired()])
    name_full = StringField('Full name')
    phone_number = StringField('Phone number', validators=[Regexp(r'^\+?[0-9\s]{5,20}$', message='Only numbers, plus symbol, and space are allowed.'), DataRequired()])
    postcode = StringField('Post code', validators=[DataRequired()])
    address_1 = StringField('Address line 1', validators=[DataRequired()])
    address_2 = StringField('Address line 2 (optional)')
    city = StringField('City', validators=[DataRequired()])
    county = StringField('County', validators=[DataRequired()])
    submit = SubmitField('Submit')
    form_type_billing_not_delivery = False

    def output_id(self):
        return 'formBilling' if self.form_type_billing_not_delivery else 'formDeliver'

class Form_Is_Included_VAT(FlaskForm):
    is_included = BooleanField('Include VAT')

class Form_Delivery_Region(FlaskForm):
    id_id_region_delivery = 'id_region_delivery'
    id_region_delivery = SelectField('Region', id='id_region_delivery')

class Form_Currency(FlaskForm):
    id_id_currency = 'id_currency'
    id_currency = SelectField('Currency', id='id_currency')


class Form_Supplier(FlaskForm):
    id_id_supplier = 'id_supplier'
    id_supplier = SelectField('Supplier', id='id_supplier')
    name_company = StringField('Company name')
    name_contact = StringField('Contact name')
    department_contact = StringField('Contact department')
    id_address = SelectField('Address ID')
    phone_number = StringField('Phone number')
    email = StringField('Email address')
    fax = StringField('Fax number')
    website = StringField('Website')
    id_currency = SelectField('Currency ID')
    is_active = BooleanField('Active', default = True)



class Form_Filters_User(FlaskForm):
    active = BooleanField('Active only?', default = True)
    id_user = SelectField('User ID', validators=[Optional()], choices=[])