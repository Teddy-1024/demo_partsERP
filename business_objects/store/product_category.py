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
from business_objects.store.product_variation import Product_Variation
from business_objects.store.image import Image
from business_objects.store.delivery_option import Delivery_Option
from business_objects.store.discount import Discount
from business_objects.store.stock_item import Stock_Item
from business_objects.store.store_base import Store_Base
from extensions import db
# external
from pydantic import BaseModel
from typing import ClassVar


class Product_Category(SQLAlchemy_ABC, Store_Base):
    FLAG_ACCESS_LEVEL_REQUIRED: ClassVar[str] = 'id_access_level_required'
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Store_Base.ATTR_ID_PRODUCT_CATEGORY
    NAME_ATTR_OPTION_TEXT: ClassVar[str] = Store_Base.FLAG_NAME

    __tablename__ = 'Shop_Product_Category_Temp'
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
    """
    def key_product_index_from_ids_product_permutation(id_product, id_permutation):
        return f'{id_product},{"" if id_permutation is None else id_permutation}'
    def key_product_index_from_product(product):
        av.val_instance(product, 'product', 'Category.key_product_index_from_product', Product)
        return f'{product.id_product},{"" if product.id_permutation is None else product.id_permutation}'
    """
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
        # self.product_index.append(len(self.products))
        # self.product_index[Category.key_product_index_from_ids_product_permutation(product.id_product, product.id_permutation)] = len(self.products)
        try:
            self.get_index_product(product)
            raise ValueError(f"{av.error_msg_str(product, 'product', _m, Product)}\nProduct already in category.")
        except KeyError:
            self.product_index[product.id_product] = len(self.products)
            self.products.append(product)
    def add_product_permutation(self, permutation):
        _m = 'Category.add_product_permutation'
        av.val_instance(permutation, 'permutation', _m, Product_Permutation)
        # self.product_index.append(len(self.products))
        # self.product_index[Category.key_product_index_from_ids_product_permutation(product.id_product, product.id_permutation)] = len(self.products)
        index_product = self.get_index_product_from_id(permutation.id_product)
        # index_product = self.product_index[permutation.id_product]
        self.products[index_product].add_product_permutation(permutation)
    def add_product_variation(self, variation):
        av.val_instance(variation, 'variation', 'Category.add_product_variation', Product_Variation)
        index_product = self.get_index_product_from_id(variation.id_product)
        self.products[index_product].add_product_variation(variation)
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
                print(f'product with id:{product.id_product} has variations')
                product.get_variation_trees()
    """
    def index_product_from_ids_product_permutation(self, id_product, id_permutation):
        key = Category.key_product_index_from_ids_product_permutation(id_product, id_permutation)
        print(f'product_index: {self.product_index}')
        print(f'Key Error: {key}')
        try:
            return self.product_index[key]
        except KeyError:
            pass
    """
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
    """
    def get_permutation_first(self):
        if not (len(self.products) == 0):
            print(f'getting first permutation from product')
        return None if len(self.products) == 0 else self.products[0].get_permutation_selected()
    """
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
        print(f' Category.from_json: {json}')
        category = cls()
        category.id_category = json[cls.ATTR_ID_PRODUCT_CATEGORY]
        category.code = json[cls.FLAG_CODE]
        category.name = json[cls.FLAG_NAME]
        category.description = json[cls.FLAG_DESCRIPTION]
        category.id_access_level_required = json[cls.ATTR_ID_ACCESS_LEVEL]
        category.name_access_level_required = json.get(cls.FLAG_ACCESS_LEVEL_REQUIRED, '')
        category.display_order = json[cls.FLAG_DISPLAY_ORDER]
        category.active = json[cls.FLAG_ACTIVE]
        category.can_view = json.get(cls.FLAG_CAN_VIEW, False)
        category.can_edit = json.get(cls.FLAG_CAN_EDIT, False)
        category.can_admin = json.get(cls.FLAG_CAN_ADMIN, False)
        return category
    """
    def to_json_str(self):
        return {
            self.ATTR_ID_PRODUCT_CATEGORY: self.id_category[0] if isinstance(self.id_category, tuple) else self.id_category,
            self.FLAG_CODE: self.code[0] if isinstance(self.code, tuple) else self.code,
            self.FLAG_NAME: self.name[0] if isinstance(self.name, tuple) else self.name,
            self.FLAG_DESCRIPTION: self.description[0] if isinstance(self.description, tuple) else self.description,
            self.ATTR_ID_ACCESS_LEVEL: self.id_access_level_required[0] if isinstance(self.id_access_level_required, tuple) else self.id_access_level_required,
            self.FLAG_ACCESS_LEVEL_REQUIRED: self.name_access_level_required[0] if isinstance(self.name_access_level_required, tuple) else self.name_access_level_required,
            self.FLAG_DISPLAY_ORDER: self.display_order,
            self.FLAG_ACTIVE: self.output_bool(self.active),
            self.FLAG_CAN_VIEW: self.output_bool(self.can_view),
            self.FLAG_CAN_EDIT: self.output_bool(self.can_edit),
            self.FLAG_CAN_ADMIN: self.output_bool(self.can_admin)
        }
    """
    @staticmethod
    def output_bool(value):
        return av.input_bool(value, 'Product_Category bool attribute', 'Product_Category.output_bool')
    def to_json_option(self):
        return {
            'value': self.id_category,
            'text': self.name
        }
"""
class Filters_Product_Category(BaseModel, Store_Base):
    ids_product_category: str
    ids_product: str
    ""
    def __new__(cls, product_ids, product_categories):
        _m = 'Filters_Product.__new__'
        v_arg_type = 'class attribute'
        # av.val_list_instances(product_ids, 'product_ids', _m, str, v_arg_type=v_arg_type)
        # av.val_list_instances(product_categories, 'product_categories', _m, Product_Category_Enum, v_arg_type=v_arg_type)
        av.val_str(product_ids, 'product_ids', _m, v_arg_type=v_arg_type)
        av.val_str(product_categories, 'product_categories', _m, v_arg_type=v_arg_type)
        return super(Filters_Product_Category, cls).__new__(cls)
    ""
    def __init__(self, ids_product, ids_product_category):
        super().__init__(ids_product=ids_product, ids_product_category=ids_product_category)
        ""
        # Constructor
        self.ids = product_ids
        self.categories = product_categories
        ""
    @classmethod
    def get_default(cls):
        return Filters_Product_Category(
            ids_product_category = '',
            ids_product = ''
        )
        def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            'a_ids_product_category': self.ids_product_category,
            'a_ids_product': self.ids_product
        }
    @classmethod
    def from_json(cls, json):
        filters = cls()
        filters.ids_product_category = json['a_ids_product_category'],
        filters.ids_product = json['a_ids_product']


class Filters_Product_Category(Get_Many_Parameters_Base):
    FLAG_IS_NOT_EMPTY: ClassVar[str] = 'is_not_empty'
    is_not_empty: bool
    active: bool
    def __init__(self, is_not_empty, active):
        super().__init__(is_not_empty=is_not_empty, active=active)
    @classmethod
    def get_default(cls):
        return cls(
            is_not_empty = False,
            active = True
        )
        def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.FLAG_IS_NOT_EMPTY: self.is_not_empty,
            self.FLAG_ACTIVE: av.input_bool(self.active, self.FLAG_ACTIVE, f'{self.__class__.__name__}.to_json')
        }
    @classmethod
    def from_json(cls, json):
        return cls(
            is_not_empty = json['is_not_empty'],
            active = json['active']
        )
    @classmethod
    def from_form(cls, form):
        return cls(
            is_not_empty = av.input_bool(form.is_not_empty.data, 'is_not_empty', 'Filters_Product_Category.from_form'),
            active = av.input_bool(form.active.data, 'active', 'Filters_Product_Category.from_form')
        )
"""

class Product_Category_Container(Store_Base):
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
    def add_product_variation(self, variation):
        av.val_instance(variation, 'variation', 'Container_Product_Categories.add_product_variation', Product_Variation)
        index_category = self.get_index_category_from_id(variation.id_category)
        self.categories[index_category].add_product_variation(variation)
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
    """
    def get_permutation_first(self):
        print(f'getting first permutation from category list')
        if not (len(self.categories) == 0):
            print(f'getting first permutation from category')
        return None if len(self.categories) == 0 else self.categories[0].get_permutation_first()
    """
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
            # list_products.append(category.to_product_option_list())
            """
            for product in category.products:
                list_products.append({'value': product.id_product, 'text': product.name, Product.ATTR_ID_PRODUCT_CATEGORY: product.id_category})
            """
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
    """
    def to_json_str(self):
        return {
            f'{self.FLAG_ROWS}': [category.to_json_str() for category in self.categories]
        }
    """
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
    
    
"""
class Table_Shop_Product_Category(db.Model):
    __tablename__ = 'Shop_Product_Category'
    id_category: int = db.Column(db.Integer, primary_key=True)
    code: str = db.Column(db.String(50))
    name: str = db.Column(db.String(255))
    description: str = db.Column(db.String(4000))
    active: bool = db.Column(db.Boolean)
    display_order: int = db.Column(db.Integer)
    created_on: datetime = db.Column(db.DateTime)
    created_by: int = db.Column(db.Integer)
    id_change_set: int = db.Column(db.Integer)
"""
class Product_Category_Temp(db.Model):
    __tablename__ = 'Shop_Product_Category_Temp'
    __table_args__ = { 'extend_existing': True }
    id_category: int = db.Column(db.Integer, primary_key=True)
    code: str = db.Column(db.String(50))
    name: str = db.Column(db.String(255))
    description: str = db.Column(db.String(4000))
    id_access_level_required: int = db.Column(db.Integer)
    active: bool = db.Column(db.Boolean)
    display_order: int = db.Column(db.Integer)
    guid: str = db.Column(db.BINARY(36))
    # created_on: datetime = db.Column(db.DateTime)
    # created_by: int = db.Column(db.Integer)

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
        """
        row.guid = product_category.guid
        row.created_on = product_category.created_on
        row.created_by = product_category.created_by
        """
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
        """
        'created_on': self.created_on,
        'created_by': self.created_by
        """
