"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Product Price Business Object

Description:
Business object for product price
"""

# internal
from business_objects.store.currency import Currency
from business_objects.store.delivery_region import Delivery_Region
from business_objects.store.store_base import Store_Base
from extensions import db
# external
from dataclasses import dataclass
from typing import ClassVar

class Product_Price(db.Model, Store_Base):
    ATTR_ID_PRODUCT_PRICE: ClassVar[str] = 'id-price'
    FLAG_VALUE_LOCAL_VAT_INCL: ClassVar[str] = 'value-local-vat-incl'
    FLAG_VALUE_LOCAL_VAT_EXCL: ClassVar[str] = 'value-local-vat-excl'
    FLAG_DISPLAY_ORDER: ClassVar[str] = 'display-order-price'

    id_price = db.Column(db.Integer, primary_key=True)
    id_permutation = db.Column(db.Integer)
    id_product = db.Column(db.Integer)
    id_category = db.Column(db.Integer)
    id_currency = db.Column(db.Integer)
    code_currency = db.Column(db.String(50))
    name_currency = db.Column(db.String(255))
    symbol_currency = db.Column(db.String(50))
    id_region = db.Column(db.Integer)
    value_local_VAT_incl = db.Column(db.Float)
    value_local_VAT_excl = db.Column(db.Float)
    display_order = db.Column(db.Float)

    def __init__(self):
        super().__init__()
        Store_Base.__init__(self)

    def from_DB_get_many_product_catalogue(query_row):
        # _m = 'Product_Price.from_DB_get_many_product_catalogue'
        price = Product_Price()
        price.id_price = query_row[0]
        price.id_permutation = query_row[1]
        price.id_product = query_row[2]
        price.id_category = query_row[3]
        price.id_currency = query_row[4]
        price.code_currency = query_row[5]
        price.name_currency = query_row[6]
        price.symbol_currency = query_row[7]
        price.id_region = query_row[8]
        price.value_local_VAT_incl = query_row[9]
        price.value_local_VAT_excl = query_row[10]
        price.display_order = query_row[11]
        return price
    
    def __repr__(self):
        return f'''Product_Price
            id: {self.id_price}
            id_permutation: {self.id_permutation}
            id_product: {self.id_product}
            id_category: {self.id_category}
            id_currency: {self.id_currency}
            code_currency: {self.code_currency}
            name_currency: {self.name_currency}
            symbol_currency: {self.symbol_currency}
            id_region: {self.id_region}
            value_local (VAT incl): {self.value_local_VAT_incl}
            value_local (VAT excl): {self.value_local_VAT_excl}
            display_order (UID): {self.display_order}
            '''
    
    def to_json(self):
        return {
            self.ATTR_ID_PRODUCT_PRICE: {self.id_price},
            self.ATTR_ID_PRODUCT_PERMUTATION: {self.id_permutation},
            self.ATTR_ID_PRODUCT: {self.id_product},
            self.ATTR_ID_PRODUCT_CATEGORY: {self.id_category},
            Currency.ATTR_ID_CURRENCY: {self.id_currency},
            Currency.FLAG_CODE: {self.code_currency},
            Currency.FLAG_NAME: {self.name_currency},
            Currency.FLAG_SYMBOL: {self.symbol_currency},
            Delivery_Region.ATTR_ID_REGION: {self.id_region},
            self.FLAG_VALUE_LOCAL_VAT_INCL: {self.value_local_VAT_incl},
            self.FLAG_VALUE_LOCAL_VAT_EXCL: {self.value_local_VAT_excl},
            self.FLAG_DISPLAY_ORDER: {self.display_order}
        }
    def to_json_option(self):
        return {
            'value': self.id_price,
            'text': f'{self.symbol_currency} {self.value_local_VAT_incl}'
        }

    @classmethod
    def from_json(cls, json):
        price = cls()
        price.id_price = json[cls.ATTR_ID_PRODUCT_PRICE]
        price.id_permutation = json[cls.ATTR_ID_PRODUCT_PERMUTATION]
        price.id_product = json[cls.ATTR_ID_PRODUCT]
        price.id_category = json[cls.ATTR_ID_PRODUCT_CATEGORY]
        price.id_currency = json[Currency.ATTR_ID_CURRENCY]
        price.code_currency = json[Currency.FLAG_CODE]
        price.name_currency = json[Currency.FLAG_NAME]
        price.symbol_currency = json[Currency.FLAG_SYMBOL]
        price.id_region = json[Delivery_Region.ATTR_ID_REGION]
        price.value_local_VAT_incl = json[cls.FLAG_VALUE_LOCAL_VAT_INCL]
        price.value_local_VAT_excl = json[cls.FLAG_VALUE_LOCAL_VAT_EXCL]
        price.display_order = json[cls.FLAG_DISPLAY_ORDER]
        return price