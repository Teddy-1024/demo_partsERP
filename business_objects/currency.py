"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Product Business Object

Description:
Business object for product
"""

# internal
from business_objects.store.store_base import Store_Base
from extensions import db
from lib import argument_validation as av
# external
from typing import ClassVar

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

class Currency(db.Model, Store_Base):
    FLAG_FACTOR_FROM_GBP: ClassVar[str] = 'factor-from-GBP'
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Store_Base.ATTR_ID_CURRENCY
    NAME_ATTR_OPTION_TEXT: ClassVar[str] = Store_Base.FLAG_NAME

    id_currency = db.Column(db.Integer, primary_key=True)
    code = db.Column(db.String(50))
    name = db.Column(db.String(255))
    symbol = db.Column(db.String(50))
    factor_from_GBP = db.Column(db.Float)
    display_order = db.Column(db.Integer)
    active = db.Column(db.Boolean)
    @classmethod
    def from_DB_currency(cls, query_row):
        _m = 'Currency.from_DB_currency'
        v_arg_type = 'class attribute'
        currency = cls()
        currency.id_currency = query_row[0]
        currency.code = query_row[1]
        currency.name = query_row[2]
        currency.symbol = query_row[3]
        currency.factor_from_GBP = query_row[4]
        currency.display_order = query_row[5]
        currency.active = av.input_bool(query_row[6], 'active', _m, v_arg_type=v_arg_type)
        return currency
    @classmethod
    def from_DB_get_many_product_catalogue_product_permutation(cls, query_row):
        currency = cls()
        currency.id_currency = query_row[6]
        currency.code = query_row[7]
        currency.symbol = query_row[8]
        return currency
    @classmethod
    def from_DB_get_many_product_price_and_discount_and_delivery_region(cls, query_row):
        currency = cls()
        return currency
    @classmethod
    def from_DB_stock_item(cls, query_row):
        currency = cls()
        currency.id_currency = query_row[12]
        currency.code = query_row[13]
        currency.symbol = query_row[14]
        return currency
    @classmethod
    def from_DB_supplier(cls, query_row):
        currency = cls()
        currency.id_currency = query_row[1]
        currency.code = query_row[2]
        currency.symbol = query_row[3]
        return currency
    @classmethod
    def from_DB_supplier_purchase_order(cls, query_row):
        currency = cls()
        currency.id_currency = query_row[3]
        currency.code = query_row[4]
        currency.symbol = query_row[5]
        return currency
    @classmethod
    def from_DB_manufacturing_purchase_order(cls, query_row):
        currency = cls()
        currency.id_currency = query_row[1]
        currency.code = query_row[2]
        currency.symbol = query_row[3]
        return currency
    def __repr__(self):
        return f'''
            id: {self.id_currency}
            name: {self.name}
            code: {self.code}
            symbol: {self.symbol}
            factor from GBP: {self.factor_from_GBP}
            display_order: {self.display_order}
            active: {self.active}
            '''
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.NAME_ATTR_OPTION_TEXT: self.FLAG_NAME,
            self.NAME_ATTR_OPTION_VALUE: self.ATTR_ID_CURRENCY,
            self.ATTR_ID_CURRENCY: self.id_currency,
            self.FLAG_CODE: self.code,
            self.FLAG_NAME: self.name,
            self.FLAG_SYMBOL: self.symbol,
            self.FLAG_FACTOR_FROM_GBP: self.factor_from_GBP,
            self.FLAG_DISPLAY_ORDER: self.display_order,
            self.FLAG_ACTIVE: self.active,
        }
    @classmethod
    def from_json(cls, json_currency, key_suffix = ''):
        currency = cls()
        currency.id_currency = json_currency[f'{cls.ATTR_ID_CURRENCY}{key_suffix}']
        currency.code = json_currency.get(f'{cls.FLAG_CODE}{key_suffix}')
        currency.name = json_currency.get(f'{cls.FLAG_NAME}{key_suffix}')
        currency.symbol = json_currency.get(f'{cls.FLAG_SYMBOL}{key_suffix}')
        currency.factor_from_GBP = json_currency.get(f'{cls.FLAG_FACTOR_FROM_GBP}{key_suffix}')
        currency.display_order = json_currency.get(f'{cls.FLAG_DISPLAY_ORDER}{key_suffix}')
        currency.active = json_currency.get(f'{cls.FLAG_ACTIVE}{key_suffix}')
        return currency
    
    def to_json_option(self):
        return {
            'value': self.id_currency,
            'text': self.name
        }