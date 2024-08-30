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
from extensions import db
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

class Currency(db.Model):
    ATTR_ID_CURRENCY: ClassVar[str] = 'id-currency'
    FLAG_CODE: ClassVar[str] = 'code-currency'
    FLAG_NAME: ClassVar[str] = 'name-currency'
    FLAG_SYMBOL: ClassVar[str] = 'symbol-currency'
    FLAG_FACTOR_FROM_GBP: ClassVar[str] = 'factor-from-GBP-currency'
    FLAG_DISPLAY_ORDER: ClassVar[str] = 'display-order-currency'

    id_currency = db.Column(db.Integer, primary_key=True)
    code = db.Column(db.String(50))
    name = db.Column(db.String(255))
    symbol = db.Column(db.String(50))
    factor_from_GBP = db.Column(db.Float)
    display_order = db.Column(db.Integer)

    def from_DB_currency(query_row):
        # _m = 'Currency.from_DB_currency'
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
    def from_DB_product(query_row):
        _m = 'Currency.from_DB_product'
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
    def to_json(self):
        return {
            Currency.ATTR_ID_CURRENCY: self.id_currency,
            Currency.FLAG_CODE: self.code,
            Currency.FLAG_NAME: self.name,
            Currency.FLAG_SYMBOL: self.symbol,
            Currency.FLAG_FACTOR_FROM_GBP: self.factor_from_GBP,
            Currency.FLAG_DISPLAY_ORDER: self.display_order
        }
    @staticmethod
    def from_json(json_currency):
        currency = Currency()
        currency.id_currency = json_currency[Currency.ATTR_ID_CURRENCY]
        currency.code = json_currency[Currency.FLAG_CODE]
        currency.name = json_currency[Currency.FLAG_NAME]
        currency.symbol = json_currency[Currency.FLAG_SYMBOL]
        currency.factor_from_GBP = json_currency[Currency.FLAG_FACTOR_FROM_GBP]
        currency.display_order = json_currency[Currency.FLAG_DISPLAY_ORDER]
        return currency