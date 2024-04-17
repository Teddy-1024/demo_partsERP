"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Product Business Object

Description:
Business object for product
"""

# IMPORTS
# VARIABLE INSTANTIATION
# CLASSES
# METHODS

# IMPORTS
# internal
import lib.argument_validation as av
from lib import data_types
from forms import Form_Basket_Add, Form_Basket_Edit # Form_Product
# external
from enum import Enum
from datetime import datetime, timedelta
import locale
from flask_sqlalchemy import SQLAlchemy


# VARIABLE INSTANTIATION
db = SQLAlchemy()


# CLASSES
"""
class Currency_Enum(Enum):
    GBP = 1

    def text(self):
        return Currency_Enum.Currency_Enum_Text(self)
    
    def Currency_Enum_Text(currency):
        av.val_instance(currency, 'currency', 'Currency_Enum_Text', Currency_Enum)
        if currency == Currency_Enum.GBP:
            return 'GBP'
        else:
            # return 'Unknown'
            raise ValueError("Unknown Currency Enum.")
    
    def get_member_by_text(text):
        for member in Resolution_Level_Enum.__members__.values():
            if member.name == text:
                return member
        raise ValueError("Unknown Currency Enum.")
        # return Resolution_Level_Enum.HIGH
"""

class Currency(db.Model):
    id_currency = db.Column(db.Integer, primary_key=True)
    code = db.Column(db.String)
    name = db.Column(db.String)
    symbol = db.Column(db.String)
    factor_from_GBP = db.Column(db.Float)
    display_order = db.Column(db.Integer)

    def make_from_DB_currency(query_row):
        # _m = 'Currency.make_from_DB_currency'
        # v_arg_type = 'class attribute'
        currency = Currency()
        currency.id_currency = query_row[0]
        currency.code = query_row[1]
        currency.name = query_row[2]
        currency.symbol = query_row[3]
        currency.factor_from_GBP = query_row[4]
        currency.display_order = query_row[5]
        return currency
    """
    def make_from_DB_product(query_row):
        _m = 'Currency.make_from_DB_product'
        v_arg_type = 'class attribute'
        currency = Currency()
        currency.id_permutation = query_row[0]
        currency.id_product = query_row[1]
        currency.id_category = query_row[2]
        currency.id_variation = query_row[3]
        return currency
    """
    def __repr__(self):
        return f'''
            id: {self.id_currency}
            name: {self.name}
            code: {self.code}
            symbol: {self.symbol}
            factor from GBP: {self.factor_from_GBP}
            display_order: {self.display_order}
            '''