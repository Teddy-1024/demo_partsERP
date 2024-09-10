"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Product Discount Business Object

Description:
Business object for discount
"""

# internal
from extensions import db


# CLASSES
class Discount(db.Model):
    id_discount = db.Column(db.Integer, primary_key=True)
    id_category = db.Column(db.Integer)
    id_product = db.Column(db.Integer)
    id_permutation = db.Column(db.Integer)
    code = db.Column(db.String(50))
    name = db.Column(db.String(200))
    multiplier = db.Column(db.Float)
    subtractor = db.Column(db.Float)
    apply_multiplier_first = db.Column(db.Boolean)
    quantity_min = db.Column(db.Integer)
    quantity_max = db.Column(db.Integer)
    date_start = db.Column(db.DateTime)
    date_end = db.Column(db.DateTime)
    codes_region = db.Column(db.String(4000))
    names_region = db.Column(db.String(4000))
    codes_currency = db.Column(db.String(4000))
    names_currency = db.Column(db.String(4000))
    display_order = db.Column(db.Integer)

    def __init__(self):
        self.delivery_regions = []
    def from_DB_get_many_product_catalogue(query_row):
        discount = Discount()
        discount.id_discount = query_row[0]
        discount.id_category = query_row[1]
        discount.id_product = query_row[2]
        discount.id_permutation = query_row[3]
        discount.code = query_row[4]
        discount.name = query_row[5]
        discount.multiplier = query_row[6]
        discount.subtractor = query_row[7]
        discount.apply_multiplier_first = query_row[8]
        discount.quantity_min = query_row[9]
        discount.quantity_max = query_row[10]
        discount.date_start = query_row[11]
        discount.date_end = query_row[12]
        discount.codes_region = query_row[13]
        discount.names_region = query_row[14]
        discount.codes_currency = query_row[15]
        discount.names_currency = query_row[16]
        discount.display_order = query_row[17]
        return discount
    def __repr__(self):
        return f'''
            id: {self.id_discount}
            id_category: {self.id_category}
            id_product: {self.id_product}
            name: {self.name}
            code: {self.code}
            multiplier: {self.multiplier}
            quantity_min: {self.quantity_min}
            quantity_max: {self.quantity_max}
            date_start: {self.date_start}
            date_end: {self.date_end}
            display_order: {self.display_order}
            '''

