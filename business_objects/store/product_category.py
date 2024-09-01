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

"""
class Enum_Product_Category(Enum):
    ASSISTIVE_DEVICES = 0
    HOME_DECOR = 1
    MISCELLANEOUS = 99

    def text(self):
        return Enum_Product_Category.Enum_Product_Category_Text(self)
    
    def Enum_Product_Category_Text(category):
        av.val_instance(category, 'category', 'Product_Category_Enum_Text', Enum_Product_Category)
        if category == Enum_Product_Category.ASSISTIVE_DEVICES:
            return 'Assistive devices'
        elif category == Enum_Product_Category.HOME_DECOR:
            return 'Home decor'
        else:
            return 'Other'
    
    def get_member_by_text(text):
        av.val_str(text, 'text', 'Enum_Product_Category.get_member_by_text')
        return data_types.get_enum_member_by_text(Enum_Product_Category, text.upper())
"""

class Product_Category(db.Model, Store_Base):
    __tablename__ = 'Shop_Product_Category_Temp'
    id_category = db.Column(db.Integer, primary_key=True)
    code = db.Column(db.String(50))
    name = db.Column(db.String(255))
    description = db.Column(db.String(4000))
    id_access_level_required = db.Column(db.Integer)
    display_order = db.Column(db.Integer)
    active = db.Column(db.Boolean)
    can_view = db.Column(db.Boolean)
    can_edit = db.Column(db.Boolean)
    can_admin = db.Column(db.Boolean)
    created_on = db.Column(db.DateTime)
    created_by = db.Column(db.Integer)
    """
    def __new__(cls, id, name, description, display_order):
        _m = 'Category.__new__'
        v_arg_type = 'class attribute'
        av.val_int(id, 'id', _m, 0, v_arg_type=v_arg_type)
        av.val_str(name, 'name', _m, max_len=256, v_arg_type=v_arg_type)
        av.val_str(description, 'description', _m, max_len=4001, v_arg_type=v_arg_type)
        av.val_int(display_order, 'display_order', _m, v_arg_type=v_arg_type)
        return super(Category, cls).__new__(cls)
    """
    def __init__(self): # , id, name, description, display_order):
        """
        self.id_category = id
        self.name = name
        self.description = description
        self.display_order = display_order
        """
        self.products = []
        self.product_index = {}
        super().__init__()
        Store_Base.__init__(self)
    def from_DB_product(query_row):
        category = Product_Category()
        category.id_category = query_row[0]
        category.code = query_row[1]
        category.name = query_row[2]
        category.description = query_row[3]
        category.id_access_level_required = query_row[4]
        category.display_order = query_row[5]
        category.active = query_row[6]
        category.can_view = query_row[7]
        category.can_edit = query_row[8]
        category.can_admin = query_row[9]
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
    def add_permutation(self, permutation):
        _m = 'Category.add_permutation'
        av.val_instance(permutation, 'permutation', _m, Product_Permutation)
        # self.product_index.append(len(self.products))
        # self.product_index[Category.key_product_index_from_ids_product_permutation(product.id_product, product.id_permutation)] = len(self.products)
        index_product = self.get_index_product_from_id(permutation.id_product)
        # index_product = self.product_index[permutation.id_product]
        self.products[index_product].add_permutation(permutation)
    def add_variation(self, variation):
        av.val_instance(variation, 'variation', 'Category.add_variation', Product_Variation)
        index_product = self.get_index_product_from_id(variation.id_product)
        self.products[index_product].add_variation(variation)
    def add_price(self, price):
        av.val_instance(price, 'price', 'Category.add_price', Product_Price)
        index_product = self.get_index_product_from_id(price.id_product)
        self.products[index_product].add_price(price)
    def add_image(self, image):
        av.val_instance(image, 'image', 'Category.add_image', Image)
        index_product = self.get_index_product_from_id(image.id_product)
        self.products[index_product].add_image(image)
    def add_delivery_option(self, delivery_option):
        av.val_instance(delivery_option, 'delivery_option', 'Category.add_delivery_option', Delivery_Option)
        index_product = self.get_index_product_from_id(delivery_option.id_product)
        self.products[index_product].add_delivery_option(delivery_option)
    def add_discount(self, discount):
        av.val_instance(discount, 'discount', 'Category.add_discount', Discount)
        index_product = self.get_index_product_from_id(discount.id_product)
        self.products[index_product].add_discount(discount)
    def add_stock_item(self, stock_item):
        av.val_instance(stock_item, 'stock_item', 'Category.add_stock_item', Stock_Item)
        index_product = self.get_index_product_from_id(stock_item.id_product)
        self.products[index_product].add_stock_item(stock_item)
    def get_all_variation_trees(self):
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
            display_order: {self.display_order}
            active: {self.active}
            products: {self.products}
            '''
    def get_permutation_first(self):
        if not (len(self.products) == 0):
            print(f'getting first permutation from product')
        return None if len(self.products) == 0 else self.products[0].get_permutation_selected()
    def is_available(self):
        if len(self.products) == 0:
            return False
        for product in self.products:
            if product.is_available():
                return True
        return False
    def to_list_rows_permutation(self):
        list_rows = []
        for product in self.products:
            list_rows += product.to_list_rows_permutation()
        return list_rows
    def to_list_products(self):
        list_products = []
        for product in self.products:
            list_products.append({'value': product.id_product, 'text': product.name})
        return list_products
    def to_json(self):
        return {
            self.ATTR_ID_PRODUCT_CATEGORY: self.id_category[0] if isinstance(self.id_category, tuple) else self.id_category,
            self.FLAG_CODE: self.code[0] if isinstance(self.code, tuple) else self.code,
            self.FLAG_NAME: self.name[0] if isinstance(self.name, tuple) else self.name,
            self.FLAG_DESCRIPTION: self.description[0] if isinstance(self.description, tuple) else self.description,
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
        category.id_category = json.get(cls.ATTR_ID_PRODUCT_CATEGORY),
        category.code = json[cls.FLAG_CODE],
        category.name = json[cls.FLAG_NAME],
        category.description = json[cls.FLAG_DESCRIPTION],
        category.display_order = json[cls.FLAG_DISPLAY_ORDER]
        category.active = json[cls.FLAG_ACTIVE]
        category.can_view = json.get(cls.FLAG_CAN_VIEW, False)
        category.can_edit = json.get(cls.FLAG_CAN_EDIT, False)
        category.can_admin = json.get(cls.FLAG_CAN_ADMIN, False)
        return category
    def to_json_str(self):
        return {
            self.ATTR_ID_PRODUCT_CATEGORY: self.id_category[0] if isinstance(self.id_category, tuple) else self.id_category,
            self.FLAG_CODE: self.code[0] if isinstance(self.code, tuple) else self.code,
            self.FLAG_NAME: self.name[0] if isinstance(self.name, tuple) else self.name,
            self.FLAG_DESCRIPTION: self.description[0] if isinstance(self.description, tuple) else self.description,
            self.FLAG_DISPLAY_ORDER: self.display_order,
            self.FLAG_ACTIVE: self.output_bool(self.active),
            self.FLAG_CAN_VIEW: self.output_bool(self.can_view),
            self.FLAG_CAN_EDIT: self.output_bool(self.can_edit),
            self.FLAG_CAN_ADMIN: self.output_bool(self.can_admin)
        }
    @staticmethod
    def output_bool(value):
        return av.input_bool(value, 'Product_Category bool attribute', 'Product_Category.output_bool')
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
            'a_ids_product_category': self.ids_product_category,
            'a_ids_product': self.ids_product
        }
    @classmethod
    def from_json(cls, json):
        filters = cls()
        filters.ids_product_category = json['a_ids_product_category'],
        filters.ids_product = json['a_ids_product']
"""
class Filters_Product_Category(BaseModel, Store_Base):
    is_not_empty_only: bool
    active_only: bool
    def __init__(self, is_not_empty_only, active_only):
        super().__init__(is_not_empty_only=is_not_empty_only, active_only=active_only)
    @classmethod
    def get_default(cls):
        return cls(
            is_not_empty_only = False,
            active_only = True
        )
    def to_json(self):
        return {
            'is_not_empty_only': self.is_not_empty_only,
            'active_only': self.active_only
        }
    @classmethod
    def from_json(cls, json):
        return cls(
            is_not_empty_only = json['is_not_empty_only'],
            active_only = json['active_only']
        )
    @classmethod
    def from_form(cls, form):
        return cls(
            is_not_empty_only = av.input_bool(form.is_not_empty.data, 'is_not_empty', 'Filters_Product_Category.from_form'),
            active_only = av.input_bool(form.active.data, 'active', 'Filters_Product_Category.from_form')
        )

class Container_Product_Category(Store_Base):
    categories: list
    def __init__(self):
        self.categories = []
    def add_category(self, category):
        av.val_instance(category, 'category', 'Container_Product_Categories.add_category', Product_Category)
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
    def add_permutation(self, permutation):
        av.val_instance(permutation, 'permutation', 'Container_Product_Categories.add_permutation', Product_Permutation)
        index_category = self.get_index_category_from_id(permutation.id_category)
        self.categories[index_category].add_permutation(permutation)
    def add_variation(self, variation):
        av.val_instance(variation, 'variation', 'Container_Product_Categories.add_variation', Product_Variation)
        index_category = self.get_index_category_from_id(variation.id_category)
        self.categories[index_category].add_variation(variation)
    def add_price(self, price):
        av.val_instance(price, 'price', 'Container_Product_Categories.add_price', Product_Price)
        index_category = self.get_index_category_from_id(price.id_category)
        self.categories[index_category].add_price(price)
    def add_image(self, image):
        av.val_instance(image, 'image', 'Container_Product_Categories.add_image', Image)
        index_category = self.get_index_category_from_id(image.id_category)
        self.categories[index_category].add_image(image)
    def add_delivery_option(self, delivery_option):
        av.val_instance(delivery_option, 'delivery_option', 'Container_Product_Categories.add_delivery_option', Delivery_Option)
        index_category = self.get_index_category_from_id(delivery_option.id_category)
        self.categories[index_category].add_delivery_option(delivery_option)
    def add_discount(self, discount):
        av.val_instance(discount, 'discount', 'Container_Product_Categories.add_discount', Discount)
        index_category = self.get_index_category_from_id(discount.id_category)
        self.categories[index_category].add_discount(discount)
    def add_stock_item(self, stock_item):
        av.val_instance(stock_item, 'stock_item', 'Container_Product_Categories.add_stock_item', Stock_Item)
        index_category = self.get_index_category_from_id(stock_item.id_category)
        self.categories[index_category].add_stock_item(stock_item)
    def get_all_variation_trees(self):
        for category in self.categories:
            category.get_all_variation_trees()
    def __repr__(self):
        return f'categories: {self.categories}'
    def get_permutation_first(self):
        print(f'getting first permutation from category list')
        if not (len(self.categories) == 0):
            print(f'getting first permutation from category')
        return None if len(self.categories) == 0 else self.categories[0].get_permutation_first()
    def get_count_categories(self):
        return len(self.categories)
    def to_list_rows_permutation(self):
        list_rows = []
        for category in self.categories:
            list_rows += category.to_list_rows_permutation()
        return list_rows
    def to_list_category_options(self):
        list_categories = []
        for category in self.categories:
            list_categories.append({'value': category.id_category, 'text': category.name})
        return list_categories
    def to_list_products(self):
        list_products = []
        for category in self.categories:
            # list_products.append(category.to_list_products())
            for product in category.products:
                list_products.append({'value': product.id_product, 'text': product.name, Product.ATTR_ID_PRODUCT_CATEGORY: product.id_category})
        return list_products
    def to_dict_lists_products(self):
        dict_lists_products = {}
        for category in self.categories:
            dict_lists_products[category.id_category] = category.to_list_products()
        return dict_lists_products
    def to_json(self):
        return {
            'categories': [category.to_json() for category in self.categories]
        }
    def to_json_str(self):
        return {
            'categories': [category.to_json_str() for category in self.categories]
        }