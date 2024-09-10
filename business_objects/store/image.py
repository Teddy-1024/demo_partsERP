"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Product Image Business Object

Description:
Business object for product image
"""

# internal
import lib.argument_validation as av
from extensions import db
# external
from enum import Enum


class Resolution_Level_Enum(Enum):
    THUMBNAIL = 0
    LOW = 1
    HIGH = 2
    FULL = 3

    def text(self):
        return Resolution_Level_Enum.Resolution_Level_Enum_Text(self)
    
    def Resolution_Level_Enum_Text(category):
        av.val_instance(category, 'category', 'Resolution_Level_Enum_Text', Resolution_Level_Enum)
        if category == Resolution_Level_Enum.THUMBNAIL:
            return 'Thumbnail'
        elif category == Resolution_Level_Enum.LOW:
            return 'Low resolution'
        elif category == Resolution_Level_Enum.HIGH:
            return 'High resolution'
        elif category == Resolution_Level_Enum.FULL:
            return 'Full resolution'
        else:
            return 'Unknown'
    
    def get_member_by_text(text):
        for member in Resolution_Level_Enum.__members__.values():
            if member.name == text:
                return member
        return Resolution_Level_Enum.HIGH


class Image(db.Model):
    id_image = db.Column(db.Integer, primary_key=True)
    id_product = db.Column(db.Integer)
    id_permutation = db.Column(db.Integer)
    id_category = db.Column(db.Integer)
    url = db.Column(db.String(255))
    active = db.Column(db.Boolean)
    display_order = db.Column(db.Integer)
    """
    def __new__(cls, id, id_product, id_category, url, display_order):
        _m = 'Image.__new__'
        v_arg_type = 'class attribute'
        av.val_int(id, 'id', _m, 0, v_arg_type=v_arg_type)
        av.val_int(id_product, 'id_product', _m, 0, v_arg_type=v_arg_type)
        av.val_int(id_category, 'id_category', _m, 0, v_arg_type=v_arg_type)
        av.val_str(url, 'url', _m, max_len=254, v_arg_type=v_arg_type)
        av.val_int(display_order, 'display_order', _m, v_arg_type=v_arg_type)
        return super(Image, cls).__new__(cls)
    
    def __init__(self, id, id_product, id_category, url, display_order):
        self.id_image = id
        self.id_product = id_product
        self.id_category = id_category
        self.url = url
        self.display_order = display_order
        super().__init__()
"""
    def from_DB_get_many_product_catalogue(query_row):
        _m = 'Image.from_DB_get_many_product_catalogue'
        # print(f'image: {query_row}')
        image = Image()
        image.id_image = query_row[0]
        image.id_product = query_row[1]
        image.id_permutation = query_row[2]
        image.id_category = query_row[3]
        image.url = query_row[4]
        image.active = query_row[5]
        image.display_order = query_row[6]
        return image
    def __repr__(self):
        return f'''
            id: {self.id_image}
            id_product: {self.id_product}
            id_category: {self.id_category}
            url: {self.url}
            display_order: {self.display_order}
            '''


class Product_Image_Filters():
    product_id: int
    get_thumbnail: bool
    get_remaining_LQ: bool

    def __new__(cls, product_id, get_thumbnail, get_remaining_LQ):
        # Initialiser - validation
        _m = 'Filters_Product.__new__'
        v_arg_type = 'class attribute'
        av.val_int(product_id, 'product_id', _m, v_arg_type=v_arg_type)
        av.val_bool(get_thumbnail, 'get_thumbnail', _m, v_arg_type=v_arg_type)
        av.val_bool(get_remaining_LQ, 'get_remaining_LQ', _m, v_arg_type=v_arg_type)
        return super(Product, cls).__new__(cls)
    
    def __init__(self, product_id, get_thumbnail, get_remaining_LQ):
        # Constructor
        self.product_id = product_id
        self.get_thumbnail = get_thumbnail
        self.get_remaining_LQ = get_remaining_LQ

