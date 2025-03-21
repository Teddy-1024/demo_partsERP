"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Product Category Business Object

Description:
Business object for product category
"""

# internal
import lib.argument_validation as av
from business_objects.db_base import SQLAlchemy_ABC, Get_Many_Parameters_Base
from business_objects.store.product import Product, Product_Permutation, Product_Price
# from business_objects.store.product_variation import Product_Variation
from business_objects.store.product_variation_type import Product_Variation_Type
from business_objects.store.image import Image
from business_objects.store.discount import Discount
from business_objects.store.stock_item import Stock_Item
from business_objects.store.store_base import Store_Base
from extensions import db
from helpers.helper_app import Helper_App
# external
from pydantic import BaseModel
from typing import ClassVar


class Product_Category(SQLAlchemy_ABC, Store_Base):
    FLAG_ACCESS_LEVEL_REQUIRED: ClassVar[str] = 'id_access_level_required'
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Store_Base.ATTR_ID_PRODUCT_CATEGORY
    NAME_ATTR_OPTION_TEXT: ClassVar[str] = Store_Base.FLAG_NAME

    __tablename__ = 'Shop_Product_Category'
    id_category = db.Column(db.Integer, primary_key=True)
    code = db.Column(db.String(50))
    name = db.Column(db.String(255))
    description = db.Column(db.String(4000))
    id_access_level_required = db.Column(db.Integer)
    name_access_level_required = db.Column(db.String(255))
    display_order = db.Column(db.Integer)
    active = db.Column(db.Boolean)
    can_view = db.Column(db.Boolean)
    can_edit = db.Column(db.Boolean)
    can_admin = db.Column(db.Boolean)
    created_on = db.Column(db.DateTime)
    created_by = db.Column(db.Integer)

    def __init__(self):
        self.products = []
        self.product_index = {}
        super().__init__()
        Store_Base.__init__(self)
        self.name_access_level_required = None
    @classmethod
    def from_DB_get_many_product_catalogue(cls, query_row):
        category = cls()
        category.id_category = query_row[0]
        category.code = query_row[1]
        category.name = query_row[2]
        category.description = query_row[3]
        category.id_access_level_required = query_row[4]
        category.name_access_level_required = query_row[5]
        category.display_order = query_row[6]
        category.active = av.input_bool(query_row[7], cls.FLAG_ACTIVE, f'{cls.__name__}.from_DB_get_many_product_catalogue')
        category.can_view = av.input_bool(query_row[8], cls.FLAG_CAN_VIEW, f'{cls.__name__}.from_DB_get_many_product_catalogue')
        category.can_edit = av.input_bool(query_row[9], cls.FLAG_CAN_EDIT, f'{cls.__name__}.from_DB_get_many_product_catalogue')
        category.can_admin = av.input_bool(query_row[10], cls.FLAG_CAN_ADMIN, f'{cls.__name__}.from_DB_get_many_product_catalogue')
        return category
    def get_index_product(self, product):
        return self.get_index_product_from_id(product.id_product)
    def get_index_product_from_id(self, id_product):
        try:
            return self.product_index[id_product]
        except:
            raise KeyError(f'product id: {id_product} not in product index keys: {self.product_index.keys()} with category id: {self.id_category}')
    def get_index_product_from_id_permutation(self, id_permutation):
        for product in self.products:
            try:
                index_permutation = product.get_index_permutation_from_id(id_permutation)
                return self.get_index_product(product)
            except:
                pass
        raise KeyError(f'permutation id: {id_permutation} not in category id: {self.id_category}')
    def add_product(self, product):
        _m = 'Category.add_product'
        av.val_instance(product, 'product', _m, Product)
        try:
            self.get_index_product(product)
            Helper_App.console_log(f'category: {self}')
            raise ValueError(f"{av.error_msg_str(product, 'product', _m, Product)}\nProduct already in category.")
        except KeyError:
            self.product_index[product.id_product] = len(self.products)
            self.products.append(product)
    def add_product_permutation(self, permutation):
        _m = 'Category.add_product_permutation'
        av.val_instance(permutation, 'permutation', _m, Product_Permutation)
        index_product = self.get_index_product_from_id(permutation.id_product)
        self.products[index_product].add_product_permutation(permutation)
    def add_product_variation_type(self, variation_type):
        av.val_instance(variation_type, 'variation_type', 'Category.add_product_variation_type', Product_Variation_Type)
        variation = variation_type.variations[0]
        index_product = self.get_index_product_from_id(variation.id_product)
        self.products[index_product].add_product_variation_type(variation_type)
    def add_product_price(self, price):
        av.val_instance(price, 'price', 'Category.add_product_price', Product_Price)
        index_product = self.get_index_product_from_id(price.id_product)
        self.products[index_product].add_product_price(price)
    def add_product_image(self, image):
        av.val_instance(image, 'image', 'Category.add_product_image', Image)
        index_product = self.get_index_product_from_id(image.id_product)
        self.products[index_product].add_product_image(image)
    def add_delivery_option(self, delivery_option):
        av.val_instance(delivery_option, 'delivery_option', 'Category.add_delivery_option', Delivery_Option)
        index_product = self.get_index_product_from_id(delivery_option.id_product)
        self.products[index_product].add_delivery_option(delivery_option)
    def add_product_price_discount(self, discount):
        av.val_instance(discount, 'discount', 'Category.add_product_price_discount', Discount)
        index_product = self.get_index_product_from_id(discount.id_product)
        self.products[index_product].add_product_price_discount(discount)
    def add_stock_item(self, stock_item):
        av.val_instance(stock_item, 'stock_item', 'Category.add_stock_item', Stock_Item)
        index_product = self.get_index_product_from_id(stock_item.id_product)
        self.products[index_product].add_stock_item(stock_item)
    def get_all_product_variation_trees(self):
        for product in self.products:
            if product.has_variations:
                Helper_App.console_log(f'product with id:{product.id_product} has variations')
                product.get_variation_trees()
    def __repr__(self):
        return f'''
            id: {self.id_category[0] if isinstance(self.id_category, tuple) else self.id_category}
            code: {self.code[0] if isinstance(self.code, tuple) else self.code}
            name: {self.name[0] if isinstance(self.name, tuple) else self.name}
            description: {self.description[0] if isinstance(self.description, tuple) else self.description}
            access_level: {self.name_access_level_required[0] if isinstance(self.name_access_level_required, tuple) else self.name_access_level_required}
            display_order: {self.display_order}
            active: {self.active}
            products: {self.products}
            '''
    def is_available(self):
        if len(self.products) == 0:
            return False
        for product in self.products:
            if product.is_available():
                return True
        return False
    def to_permutation_row_list(self):
        list_rows = []
        for product in self.products:
            list_rows += product.to_permutation_row_list()
        return list_rows
    def to_product_option_list(self):
        list_products = []
        for product in self.products:
            list_products.append({'value': product.id_product, 'text': product.name})
        return list_products
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_PRODUCT_CATEGORY: self.id_category[0] if isinstance(self.id_category, tuple) else self.id_category,
            self.FLAG_CODE: self.code[0] if isinstance(self.code, tuple) else self.code,
            self.FLAG_NAME: self.name[0] if isinstance(self.name, tuple) else self.name,
            self.FLAG_DESCRIPTION: self.description[0] if isinstance(self.description, tuple) else self.description,
            self.ATTR_ID_ACCESS_LEVEL: self.id_access_level_required[0] if isinstance(self.id_access_level_required, tuple) else self.id_access_level_required,
            self.FLAG_ACCESS_LEVEL_REQUIRED: self.name_access_level_required[0] if isinstance(self.name_access_level_required, tuple) else self.name_access_level_required,
            self.FLAG_DISPLAY_ORDER: self.display_order,
            self.FLAG_ACTIVE: self.active,
            self.FLAG_CAN_VIEW: self.can_view,
            self.FLAG_CAN_EDIT: self.can_edit,
            self.FLAG_CAN_ADMIN: self.can_admin
        }
    @classmethod
    def from_json(cls, json):
        Helper_App.console_log(f' Category.from_json: {json}')
        category = cls()
        category.id_category = json[cls.ATTR_ID_PRODUCT_CATEGORY]
        category.code = json[cls.FLAG_CODE]
        category.name = json[cls.FLAG_NAME]
        category.description = json[cls.FLAG_DESCRIPTION]
        category.id_access_level_required = json[cls.ATTR_ID_ACCESS_LEVEL]
        category.name_access_level_required = json.get(cls.FLAG_ACCESS_LEVEL_REQUIRED, '')
        category.display_order = json[cls.FLAG_DISPLAY_ORDER]
        category.active = 1 if av.input_bool(json[cls.FLAG_ACTIVE], cls.FLAG_ACTIVE, f'{cls.__name__}.from_json') else 0
        category.can_view = json.get(cls.FLAG_CAN_VIEW, False)
        category.can_edit = json.get(cls.FLAG_CAN_EDIT, False)
        category.can_admin = json.get(cls.FLAG_CAN_ADMIN, False)
        return category
    @staticmethod
    def output_bool(value):
        return av.input_bool(value, 'Product_Category bool attribute', 'Product_Category.output_bool')
    def to_json_option(self):
        return {
            'value': self.id_category,
            'text': self.name
        }
    def get_csv_ids_permutation(self):
        list_ids = []
        for product in self.products:
            list_ids += product.get_csv_ids_permutation()
        return list_ids
    
class Product_Category_Container(Store_Base):
    NAME_ATTR_OPTION_TEXT: ClassVar[str] = ''
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Store_Base.FLAG_ROWS
    categories: list
    def __init__(self):
        self.categories = []
    def add_product_category(self, category):
        av.val_instance(category, 'category', 'Container_Product_Categories.add_product_category', Product_Category)
        self.categories.append(category)
    def get_index_category_from_id(self, id_category):
        for index_category in range(len(self.categories)):
            category = self.categories[index_category]
            if category.id_category == id_category:
                return index_category
        raise ValueError(f"{av.error_msg_str(id_category, 'id_category', 'Container_Product_Categories.get_index_category_from_id', int)}\nID not in list")
    def get_index_category_from_id_permutation(self, id_permutation):
        for index_category in range(len(self.categories)):
            category = self.categories[index_category]
            try:
                index_product = category.get_index_product_from_id_permutation(id_permutation)
                return index_category
            except:
                pass
        raise ValueError(f"{av.error_msg_str(id_permutation, 'id_permutation', 'Container_Product_Categories.get_index_category_from_id_permutation', int)}. Permutation ID not in list")
    def add_product(self, product):
        av.val_instance(product, 'product', 'Container_Product_Categories.add_product', Product)
        index_category = self.get_index_category_from_id(product.id_category)
        self.categories[index_category].add_product(product)
    def add_product_permutation(self, permutation):
        av.val_instance(permutation, 'permutation', 'Container_Product_Categories.add_product_permutation', Product_Permutation)
        index_category = self.get_index_category_from_id(permutation.id_category)
        self.categories[index_category].add_product_permutation(permutation)
    def add_product_variation_type(self, variation_type):
        av.val_instance(variation_type, 'variation_type', 'Container_Product_Categories.add_product_variation_type', Product_Variation_Type)
        variation = variation_type.variations[0]
        index_category = self.get_index_category_from_id(variation.id_category)
        self.categories[index_category].add_product_variation_type(variation_type)
    def add_product_price(self, price):
        av.val_instance(price, 'price', 'Container_Product_Categories.add_product_price', Product_Price)
        index_category = self.get_index_category_from_id(price.id_category)
        self.categories[index_category].add_product_price(price)
    def add_product_image(self, image):
        av.val_instance(image, 'image', 'Container_Product_Categories.add_product_image', Image)
        index_category = self.get_index_category_from_id(image.id_category)
        self.categories[index_category].add_product_image(image)
    def add_delivery_option(self, delivery_option):
        av.val_instance(delivery_option, 'delivery_option', 'Container_Product_Categories.add_delivery_option', Delivery_Option)
        index_category = self.get_index_category_from_id(delivery_option.id_category)
        self.categories[index_category].add_delivery_option(delivery_option)
    def add_product_price_discount(self, discount):
        av.val_instance(discount, 'discount', 'Container_Product_Categories.add_product_price_discount', Discount)
        index_category = self.get_index_category_from_id(discount.id_category)
        self.categories[index_category].add_product_price_discount(discount)
    def add_stock_item(self, stock_item):
        av.val_instance(stock_item, 'stock_item', 'Container_Product_Categories.add_stock_item', Stock_Item)
        index_category = self.get_index_category_from_id(stock_item.id_category)
        self.categories[index_category].add_stock_item(stock_item)
    def get_all_product_variation_trees(self):
        for category in self.categories:
            category.get_all_product_variation_trees()
    def __repr__(self):
        return f'categories: {self.categories}'
    def get_category_count(self):
        return len(self.categories)
    def to_permutation_row_list(self):
        list_rows = []
        for category in self.categories:
            list_rows += category.to_permutation_row_list()
        return list_rows
    def to_category_option_list(self):
        list_categories = []
        for category in self.categories:
            list_categories.append({'value': category.id_category, 'text': category.name})
        return list_categories
    def get_list_products(self):
        list_products = []
        for category in self.categories:
            list_products += category.products
        return list_products
    def to_product_option_list(self):
        list_products = self.get_list_products()
        return [{'value': product.id_product, 'text': product.name, Product.ATTR_ID_PRODUCT_CATEGORY: product.id_category} for product in list_products]
    def get_product_option_lists_by_category(self):
        dict_lists_products = {}
        for category in self.categories:
            dict_lists_products[category.id_category] = category.to_product_option_list()
        return dict_lists_products
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            f'{self.FLAG_ROWS}': [category.to_json() for category in self.categories]
        }
    @classmethod
    def from_json(cls, json):
        return None
    def to_json_option(self):
        return None
    def to_temporary_record(self):
        excluded_attributes = {
            column.name: getattr(self, column.name) 
            for column in self.__table__.columns
            if column.name not in ['created_on', 'created_by']
        }
        return self.to_object_with_missing_attributes(excluded_attributes)
    def get_csv_ids_permutation(self):
        list_ids = []
        for category in self.categories:
            list_ids += category.get_csv_ids_permutation()
        return ','.join(list_ids)
    
    
class Product_Category_Temp(db.Model, Store_Base):
    __tablename__ = 'Shop_Product_Category_Temp'
    __table_args__ = { 'extend_existing': True }
    id_temp: int = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_category: int = db.Column(db.Integer)
    code: str = db.Column(db.String(50))
    name: str = db.Column(db.String(255))
    description: str = db.Column(db.String(4000))
    id_access_level_required: int = db.Column(db.Integer)
    active: bool = db.Column(db.Boolean)
    display_order: int = db.Column(db.Integer)
    guid: str = db.Column(db.String(36))
    
    def __init__(self):
        super().__init__()
        self.id_temp = None

    @classmethod
    def from_product_category(cls, product_category):
        row = cls()
        row.id_category = product_category.id_category[0] if isinstance(product_category.id_category, tuple) else product_category.id_category
        row.code = product_category.code[0] if isinstance(product_category.code, tuple) else product_category.code
        row.name = product_category.name[0] if isinstance(product_category.name, tuple) else product_category.name
        row.description = product_category.description[0] if isinstance(product_category.description, tuple) else product_category.description
        row.id_access_level_required = product_category.id_access_level_required[0] if isinstance(product_category.id_access_level_required, tuple) else product_category.id_access_level_required
        row.active = product_category.active
        row.display_order = product_category.display_order
        return row
    
    def to_json(self):
        return {
            'id_category': self.id_category,
            'code': self.code,
            'name': self.name,
            'description': self.description,
            'id_access_level_required': self.id_access_level_required,
            'active': av.input_bool(self.active, self.FLAG_ACTIVE, f'{self.__class__.__name__}.to_json'),
            'display_order': self.display_order,
            'guid': self.guid,
        }
    
    def __repr__(self):
        return str(self.__dict__)