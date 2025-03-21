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
import lib.argument_validation as av
from lib import data_types
from forms.forms import Form_Basket_Add, Form_Basket_Edit
from forms.store.product_permutation import Filters_Product_Permutation
from business_objects.db_base import SQLAlchemy_ABC, Get_Many_Parameters_Base
from business_objects.store.discount import Discount
from business_objects.store.image import Image
from business_objects.store.product_permutation import Product_Permutation
from business_objects.store.product_price import Product_Price
from business_objects.store.store_base import Store_Base
from business_objects.store.stock_item import Stock_Item
from business_objects.store.product_variation import Product_Variation
from business_objects.store.product_variation_tree import Product_Variation_Tree
from extensions import db
from forms.base import Form_Base
from forms.store.product import Filters_Product
from helpers.helper_app import Helper_App
# external
from dataclasses import dataclass
from typing import ClassVar, List

class Product(SQLAlchemy_ABC, Store_Base):
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Store_Base.ATTR_ID_PRODUCT
    NAME_ATTR_OPTION_TEXT = Store_Base.FLAG_NAME
    FLAG_INDEX_PERMUTATION_SELECTED: ClassVar[str] = 'index-permutation-selected'
    FLAG_PRODUCT_VARIATION_TREES: ClassVar[str] = 'variation-trees'

    id_product = db.Column(db.Integer, primary_key=True)
    id_category = db.Column(db.Integer)
    name = db.Column(db.String(255))
    id_access_level_required = db.Column(db.Integer)
    active = db.Column(db.Boolean)
    display_order = db.Column(db.Integer)
    can_view = db.Column(db.Boolean)
    can_edit = db.Column(db.Boolean)
    can_admin = db.Column(db.Boolean)

    def __init__(self):
        self.permutations = []
        self.permutation_index = {}
        self.variation_trees = []
        self.index_permutation_selected = None
        self.has_variations = False
        super().__init__()
        Store_Base.__init__(self)
        self.form_basket_add = Form_Basket_Add()
        self.form_basket_edit = Form_Basket_Edit()
        self.name_access_level_required = None

    def from_DB_get_many_product_catalogue(query_row):
        _m = 'Product.from_DB_get_many_product_catalogue'
        v_arg_type = 'class attribute'
        product = Product()
        product.id_product = query_row[0]
        product.id_category = query_row[1]
        product.name = query_row[2]
        product.has_variations = av.input_bool(query_row[3], "has_variations", _m, v_arg_type=v_arg_type)
        product.id_access_level_required = query_row[4]
        product.name_access_level_required = query_row[5]
        product.active = av.input_bool(query_row[6], "active", _m, v_arg_type=v_arg_type)
        product.display_order = query_row[7]
        product.can_view = av.input_bool(query_row[8], "can_view", _m, v_arg_type=v_arg_type)
        product.can_edit = av.input_bool(query_row[9], "can_edit", _m, v_arg_type=v_arg_type)
        product.can_admin = av.input_bool(query_row[10], "can_admin", _m, v_arg_type=v_arg_type)
        return product
    def add_product_permutation(self, permutation):
        _m = 'Product.add_product_permutation'
        av.val_instance(permutation, 'permutation', _m, Product_Permutation)
        try:
            self.permutation_index[permutation.id_permutation]
            raise ValueError(f"{av.error_msg_str(permutation, 'permutation', _m, Product_Permutation)}\nPermutation ID already in product")
        except KeyError:
            self.permutation_index[permutation.id_permutation] = len(self.permutations)
            self.permutations.append(permutation)
        if self.index_permutation_selected is None:
            self.index_permutation_selected = self.permutation_index[permutation.id_permutation]
            Helper_App.console_log(f'setting selected permutation for product {self.id_product} to {self.index_permutation_selected}') 
    def get_variation_trees(self):
        self.variation_trees = []
        for index_permutation in range(len(self.permutations)):
            permutation = self.permutations[index_permutation]
            variation_tree = permutation.variation_tree # Product_Variation_Tree.from_product_permutation(permutation)
            found_variation_tree_match = False
            for index_tree in range(len(self.variation_trees)):
                if self.variation_trees[index_tree].is_equal(variation_tree):
                    found_variation_tree_match = True
                    break
            if not found_variation_tree_match and variation_tree is not None:
                self.variation_trees.append(variation_tree)
    def from_DB_Stripe_product(query_row):
        permutation = Product_Permutation.from_DB_Stripe_product(query_row)
        product = Product.from_permutation(permutation)
        return product
    def from_DB_Stripe_price(query_row):
        permutation = Product_Permutation.from_DB_Stripe_price(query_row)
        product = Product.from_permutation(permutation)
        return product
    @classmethod
    def from_json(cls, json):
        product = cls()
        product.id_product = json[cls.ATTR_ID_PRODUCT]
        product.display_order = json[cls.FLAG_DISPLAY_ORDER]
        product.id_category = json[cls.ATTR_ID_PRODUCT_CATEGORY]
        product.name = json[cls.FLAG_NAME]
        product.has_variations = av.input_bool(json.get(cls.FLAG_HAS_VARIATIONS, None), cls.FLAG_HAS_VARIATIONS, f'{cls.__name__}.from_json')
        product.id_access_level_required = json.get(cls.ATTR_ID_ACCESS_LEVEL, None)
        product.active = 1 if av.input_bool(json[cls.FLAG_ACTIVE], cls.FLAG_ACTIVE, f'{cls.__name__}.from_json') else 0
        product.can_view = json.get(cls.FLAG_CAN_VIEW, None)
        product.can_edit = json.get(cls.FLAG_CAN_EDIT, None)
        product.can_admin = json.get(cls.FLAG_CAN_ADMIN, None)
        return product
    def get_permutation_selected(self):
        try:
            return self.permutations[self.index_permutation_selected]
        except:
            raise ValueError(f'list index {self.index_permutation_selected} out of range')
    def output_lead_time(self):
        return self.get_permutation_selected().output_lead_time()
    def output_delivery_date(self):
        return self.get_permutation_selected().output_delivery_date()
    def output_price(self, is_included_VAT):
        return self.get_permutation_selected().output_price(is_included_VAT)
    def output_price_VAT_incl(self):
        return self.get_permutation_selected().output_price(True)
    def output_price_VAT_excl(self):
        return self.get_permutation_selected().output_price(False)
    def get_price_local(self, is_included_VAT):
        if is_included_VAT:
            return self.get_price_local_VAT_incl()
        else:
            return self.get_price_local_VAT_excl()
    def get_price_local_VAT_incl(self):
        return self.get_permutation_selected().get_price_local_VAT_incl()
    def get_price_local_VAT_excl(self):
        return self.get_permutation_selected().get_price_local_VAT_excl()
    def get_quantity_min(self):
        return self.get_permutation_selected().quantity_min
    def get_id_permutation(self):
        return self.get_permutation_selected().id_permutation
    def get_image_from_index(self, index_image):
        return self.get_permutation_selected().images[index_image]
    def get_name(self):
        return self.get_permutation_selected().name
    def get_description(self):
        return self.get_permutation_selected().description
    def output_currency(self):
        return self.get_permutation_selected().get_price().symbol_currency
    
    def __repr__(self):
        return f'''Product
            id_product: {self.id_product}
            id_category: {self.id_category}
            name: {self.name}
            display_order: {self.display_order}
            can_view: {self.can_view}
            can_edit: {self.can_edit}
            can_admin: {self.can_admin}
            has_variations: {self.has_variations}
            permutations: {self.permutations}
            variation trees: {self.variation_trees}
            active: {self.active}
            '''
    
    def add_product_variation_type(self, variation_type):
        variation = variation_type.variations[0]
        index_permutation = self.permutation_index[variation.id_permutation]
        self.permutations[index_permutation].add_product_variation_type(variation_type)
    def add_product_price(self, price):
        av.val_instance(price, 'price', 'Product.add_product_price', Product_Price)
        index_permutation = self.permutation_index[price.id_permutation] # self.get_index_permutation_from_id(price.id_permutation)
        self.permutations[index_permutation].add_product_price(price)
    def add_product_image(self, image):
        av.val_instance(image, 'image', 'Product.add_product_image', Image)
        index_permutation = self.permutation_index[image.id_permutation] # self.get_index_permutation_from_id(image.id_permutation)
        self.permutations[index_permutation].add_product_image(image)
    def add_delivery_option(self, delivery_option):
        av.val_instance(delivery_option, 'delivery_option', 'Product.add_delivery_option', Delivery_Option)
        index_permutation = self.permutation_index[delivery_option.id_permutation] # self.get_index_permutation_from_id(delivery_option.id_permutation)
        self.permutations[index_permutation].add_delivery_option(delivery_option)
    def add_product_price_discount(self, discount):
        av.val_instance(discount, 'discount', 'Product.add_product_price_discount', Discount)
        index_permutation = self.permutation_index[discount.id_permutation] # self.get_index_permutation_from_id(discount.id_permutation)
        self.permutations[index_permutation].add_product_price_discount(discount)
    def add_stock_item(self, stock_item):
        av.val_instance(stock_item, 'stock_item', 'Product.add_stock_item', Stock_Item)
        index_permutation = self.permutation_index[stock_item.id_permutation]
        self.permutations[index_permutation].add_stock_item(stock_item)
    def has_permutations(self):
        return len(self.permutations) > 0
    def is_available(self):
        if len(self.permutations) == 0:
            return False
        for permutation in self.permutations:
            if permutation.is_available():
                return True
        return False
    def to_permutation_row_list(self):
        list_rows = []
        for permutation in self.permutations:
            list_rows.append(permutation.to_row_permutation())
        return list_rows
    
    def to_json(self):
        return {
            **self.get_shared_json_attributes(self),
            self.ATTR_ID_PRODUCT: self.id_product,
            self.ATTR_ID_PRODUCT_CATEGORY: self.id_category,
            self.FLAG_NAME: self.name,
            self.FLAG_DISPLAY_ORDER: self.display_order,
            self.FLAG_CAN_VIEW: self.can_view,
            self.FLAG_CAN_EDIT: self.can_edit,
            self.FLAG_CAN_ADMIN: self.can_admin,
            self.FLAG_HAS_VARIATIONS: self.has_variations,
            self.FLAG_INDEX_PERMUTATION_SELECTED: self.index_permutation_selected,
            self.ATTR_ID_PRODUCT_PERMUTATION: [permutation.to_json() for permutation in self.permutations],
            self.FLAG_PRODUCT_VARIATION_TREES: [tree.to_json() for tree in self.variation_trees]
        }
    def to_json_option(self):
        return {
            'value': self.id_product,
            'text': self.name
        }
    def get_variation_types_unique(self):
        list_types = [] 
        for tree in self.variation_trees:
            for type in tree.get_types_unique():
                if type not in list_types:
                    list_types.append(type)
        return list_types
    
    def get_csv_ids_permutation(self):
        csv = ''
        for permutation in self.permutations:
            if csv != '':
                csv += ','
            csv += str(permutation.id_permutation)
        return csv


class Parameters_Product(Get_Many_Parameters_Base):
    get_all_product_category: bool
    get_inactive_product_category: bool
    ids_product_category: str
    get_all_product: bool
    get_inactive_product: bool
    ids_product: str
    get_all_permutation: bool
    get_inactive_permutation: bool
    ids_permutation: str
    get_all_image: bool
    get_inactive_image: bool
    ids_image: str
    get_products_quantity_stock_below_min: bool

    def to_json(self):
        return {
            # 'a_id_user': None,
            'a_get_all_product_category': self.get_all_product_category,
            'a_get_inactive_product_category': self.get_inactive_product_category,
            'a_ids_product_category': self.ids_product_category,
            'a_get_all_product': self.get_all_product,
            'a_get_inactive_product': self.get_inactive_product,
            'a_ids_product': self.ids_product,
            'a_get_all_permutation': self.get_all_permutation,
            'a_get_inactive_permutation': self.get_inactive_permutation,
            'a_ids_permutation': self.ids_permutation,
            'a_get_all_image': self.get_all_image,
            'a_get_inactive_image': self.get_inactive_image,
            'a_ids_image': self.ids_image,
            'a_get_products_quantity_stock_below_min': self.get_products_quantity_stock_below_min
        }
    
    @staticmethod
    def from_form_filters_product(form):
        av.val_instance(form, 'form', 'Parameters_Product.from_form', Filters_Product)
        has_filter_category = not (form.id_category.data == '0' or form.id_category.data == '' or form.id_category.data is None)
        is_not_empty = av.input_bool(form.is_not_empty.data, "is_not_empty", "Parameters_Product.from_form_filters_product")
        active = av.input_bool(form.active.data, "active", "Parameters_Product.from_form_filters_product")
        return Parameters_Product(
            get_all_product_category = not has_filter_category,
            get_inactive_product_category = not active,
            ids_product_category = form.id_category.data if form.id_category.data is not None else '',
            get_all_product = True,
            get_inactive_product = not active,
            ids_product = '',
            get_all_permutation = True,
            get_inactive_permutation = not active,
            ids_permutation = '',
            get_all_image = False,
            get_inactive_image = False,
            ids_image = '',
            get_products_quantity_stock_below_min = False
        )
    @staticmethod
    def from_form_filters_product_permutation(form):
        has_category_filter = not (form.id_category.data == '0' or form.id_category.data == '' or form.id_category.data is None)
        has_product_filter = not (form.id_product.data == '0' or form.id_product.data == '' or form.id_product.data is None)
        get_permutations_stock_below_min = av.input_bool(form.is_out_of_stock.data, "is_out_of_stock", "Parameters_Product.from_form_filters_product_permutation")
        get_inactive = not av.input_bool(form.active.data, "active", "Parameters_Product.from_form_filters_product_permutation")
        Helper_App.console_log(f'form question: {type(form.is_out_of_stock)}\nbool interpretted: {get_permutations_stock_below_min}\nform question: {type(form.active)}\nget_inactive:{get_inactive}\ntype form: {type(form)}')
        return Parameters_Product(
            get_all_product_category = not has_category_filter,
            get_inactive_product_category = get_inactive,
            ids_product_category = form.id_category.data if form.id_category.data is not None else '',
            get_all_product = not has_product_filter,
            get_inactive_product = get_inactive,
            ids_product = form.id_product.data if form.id_product.data is not None else '',
            get_all_permutation = not get_permutations_stock_below_min,
            get_inactive_permutation = get_inactive,
            ids_permutation = '',
            get_all_image = False,
            get_inactive_image = False,
            ids_image = '',
            get_products_quantity_stock_below_min = get_permutations_stock_below_min
        )
    
    @staticmethod
    def get_default():
        return Parameters_Product(
            get_all_product_category = True,
            get_inactive_product_category = False,
            ids_product_category = '',
            get_all_product = True,
            get_inactive_product = False,
            ids_product = '',
            get_all_permutation = True,
            get_inactive_permutation = False,
            ids_permutation = '',
            get_all_image = True,
            get_inactive_image = False,
            ids_image = '',
            get_products_quantity_stock_below_min = True
        )
    
    @classmethod
    def from_json(cls, json):
        return cls(
            get_all_product_category = json.get('a_get_all_product_category', False),
            get_inactive_product_category = json.get('a_get_inactive_product_category', False),
            ids_product_category = json.get('a_ids_product_category', ''),
            get_all_product = json.get('a_get_all_product', False),
            get_inactive_product = json.get('a_get_inactive_product', False),
            ids_product = json.get('a_ids_product', ''),
            get_all_permutation = json.get('a_get_all_permutation', False),
            get_inactive_permutation = json.get('a_get_inactive_permutation', False),
            ids_permutation = json.get('a_ids_permutation', ''),
            get_all_image = json.get('a_get_all_image', False),
            get_inactive_image = json.get('a_get_inactive_image', False),
            ids_image = json.get('a_ids_image', ''),
            get_products_quantity_stock_below_min = json.get('a_get_products_quantity_stock_below_min', False)
        )
    
    @classmethod
    def from_filters_product_category(cls, filters_category):
        return cls(
            get_all_product_category = True,
            get_inactive_product_category = not filters_category.active.data,
            ids_product_category = '',
            get_all_product = True,
            get_inactive_product = False,
            ids_product = '',
            get_all_permutation = True,
            get_inactive_permutation = False,
            ids_permutation = '',
            get_all_image = False,
            get_inactive_image = False,
            ids_image = '',
            get_products_quantity_stock_below_min = False
        )
    @classmethod
    def from_filters_stock_item(cls, filters_stock_item):
        return cls.from_form_filters_product_permutation(filters_stock_item)
    
class Product_Temp(db.Model, Store_Base):
    __tablename__ = 'Shop_Product_Temp'
    __table_args__ = { 'extend_existing': True }
    id_temp: int = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_product: int = db.Column(db.Integer)
    id_category: int = db.Column(db.Integer)
    name: str = db.Column(db.String(255))
    has_variations: bool = db.Column(db.Boolean)
    id_access_level_required: int = db.Column(db.Integer)
    active: bool = db.Column(db.Boolean)
    display_order: int = db.Column(db.Integer)
    guid: str = db.Column(db.BINARY(36))
    # created_on: datetime = db.Column(db.DateTime)
    # created_by: int = db.Column(db.Integer)
    def __init__(self):
        self.id_temp = None
    @classmethod
    def from_product(cls, product):
        row = cls()
        row.id_product = product.id_product[0] if isinstance(product.id_product, tuple) else product.id_product
        row.id_category = product.id_category[0] if isinstance(product.id_category, tuple) else product.id_category
        row.name = product.name[0] if isinstance(product.name, tuple) else product.name
        row.has_variations = product.has_variations
        row.id_access_level_required = product.id_access_level_required[0] if isinstance(product.id_access_level_required, tuple) else product.id_access_level_required
        row.active = product.active
        row.display_order = product.display_order
        return row
    def to_json(self):
        return {
            'id_product': self.id_product,
            'id_category': self.id_category,
            'name': self.name,
            'has_variations': av.input_bool(self.has_variations, self.FLAG_HAS_VARIATIONS, f'{self.__class__.__name__}.to_json'),
            'id_access_level_required': self.id_access_level_required,
            'active': av.input_bool(self.active, self.FLAG_ACTIVE, f'{self.__class__.__name__}.to_json'),
            'display_order': self.display_order,
            'guid': self.guid,
        }
    def __repr__(self):
        return f'''Product_Temp
            id_product: {self.id_product}
            id_category: {self.id_category}
            name: {self.name}
            has_variations: {self.has_variations}
            id_access_level_required: {self.id_access_level_required}
            active: {self.active}
            display_order: {self.display_order}
            guid: {self.guid}
            '''