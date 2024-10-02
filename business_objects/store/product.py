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
from business_objects.store.delivery_option import Delivery_Option
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
from forms.store.product import Form_Filters_Product
# external
from dataclasses import dataclass
from typing import ClassVar, List
"""
class Enum_Status_Stock(Enum):
    OUT = 0
    LOW = 1
    IN = 99

    def text(self):
        return Enum_Status_Stock.Enum_Status_Stock_Text(self)
    
    def Enum_Status_Stock_Text(status):
        av.val_instance(status, 'category', 'Enum_Status_Stock_Text', Enum_Status_Stock)
        if status == Enum_Status_Stock.OUT:
            return 'Out of stock'
        elif status == Enum_Status_Stock.LOW:
            return 'Low on stock'
        else:
            return 'Fully stocked'
    
    def get_member_by_text(text):
        return data_types.get_enum_member_by_text(Enum_Status_Stock, text.upper())
        
"""
class Product(SQLAlchemy_ABC, Store_Base):
    NAME_ATTR_OPTION_VALUE: ClassVar[str] = Store_Base.ATTR_ID_PRODUCT
    NAME_ATTR_OPTION_TEXT = Store_Base.FLAG_NAME
    FLAG_HAS_VARIATIONS: ClassVar[str] = 'has-variations-product'
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
    # form_basket_add: Form_Basket_Add
    # form_basket_edit: Form_Basket_Edit
    # has_variations: bool
    # index_permutation_selected: int

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
    """
    def from_permutation(permutation, has_variations = False):
        _m = 'Product.from_permutation'
        v_arg_type = 'class attribute'
        av.val_instance(permutation, 'permutation', _m, Product_Permutation, v_arg_type=v_arg_type)
        product = Product()
        product.has_variations = has_variations
        product.index_permutation_selected = 0
        product.id_product = permutation.id_product
        product.id_category = permutation.id_category
        product.display_order = permutation.display_order
        product.can_view = permutation.can_view
        product.can_edit = permutation.can_edit
        product.can_admin = permutation.can_admin
        product.permutations.append(permutation)
        # product.get_variation_trees()
        return product
    """
    def add_product_permutation(self, permutation):
        _m = 'Product.add_product_permutation'
        av.val_instance(permutation, 'permutation', _m, Product_Permutation)
        try:
            self.permutation_index[permutation.id_permutation]
            raise ValueError(f"{av.error_msg_str(permutation, 'permutation', _m, Product_Permutation)}\nPermutation ID already in product")
        except KeyError:
            self.permutation_index[permutation.id_permutation] = len(self.permutations)
            self.permutations.append(permutation)
            """
            if self.has_variations:
                self.has_variations = False
            """
        if self.index_permutation_selected is None:
            self.index_permutation_selected = self.permutation_index[permutation.id_permutation]
            print(f'setting selected permutation for product {self.id_product} to {self.index_permutation_selected}') # :\n{self.permutations[self.index_permutation_selected]}
    """
    def from_permutations(permutations):
        _m = 'Product.from_permutations'
        v_arg_type = 'class attribute'
        if len(permutations) == 0:
            raise ValueError(av.error_msg_str(permutations, 'permutations', _m, list, v_arg_type=v_arg_type))
        product = Product()
        product.has_variations = True
        product.index_permutation_selected = 0
        product.id_product = permutations[0].id_product
        product.id_category = permutations[0].id_category
        product.display_order = permutations[0].display_order
        product.can_view = True
        product.can_edit = True
        product.can_admin = True
        for permutation in permutations:
            product.can_view &= permutation.can_view
            product.can_edit &= permutation.can_edit
            product.can_admin &= permutation.can_admin
        product.permutations.append(permutations)
        product.get_variation_trees()
        return product
    """
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
            if not found_variation_tree_match:
                self.variation_trees.append(variation_tree)
    def from_DB_Stripe_product(query_row):
        permutation = Product_Permutation.from_DB_Stripe_product(query_row)
        product = Product.from_permutation(permutation)
        return product
    def from_DB_Stripe_price(query_row):
        permutation = Product_Permutation.from_DB_Stripe_price(query_row)
        product = Product.from_permutation(permutation)
        return product
    def from_json(json_basket_item, key_id_product, key_id_permutation):
        permutation = Product_Permutation.from_json(json_basket_item, key_id_product, key_id_permutation)
        product = Product.from_permutation(permutation)
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
    """
    def add_form_basket_add(self):
        self.form_basket_add = None

    def add_form_basket_edit(self):
        self.form_basket_edit = None
    """
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
            '''
    """
    def get_index_permutation_from_id(self, id_permutation):
        if id_permutation is None and not self.has_variations:
            return 0
        for index_permutation in range(len(self.permutations)):
            permutation = self.permutations[index_permutation]
            if permutation.id_permutation == id_permutation:
                return index_permutation
        raise ValueError(f"{av.error_msg_str(id_permutation, 'id_permutation', 'Product.get_index_permutation_from_id', int)}\nPermutation ID not found.")
    """
    def add_product_variation(self, variation):
        av.val_instance(variation, 'variation', 'Product.add_product_variation', Product_Variation)
        # print(f'variation: {variation}')
        index_permutation = self.permutation_index[variation.id_permutation] # self.get_index_permutation_from_id(variation.id_permutation)
        self.permutations[index_permutation].add_product_variation(variation)
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
    @classmethod
    def from_json(cls, json):
        product = cls()
        product.id_product = json[cls.ATTR_ID_PRODUCT]
        product.id_category = json[cls.ATTR_ID_PRODUCT_CATEGORY]
        product.name = json[cls.FLAG_NAME]
        product.display_order = json[cls.FLAG_DISPLAY_ORDER]
        product.can_view = json[cls.FLAG_CAN_VIEW]
        product.can_edit = json[cls.FLAG_CAN_EDIT]
        product.can_admin = json[cls.FLAG_CAN_ADMIN]
        product.has_variations = json[cls.FLAG_HAS_VARIATIONS]
        product.index_permutation_selected = json[cls.FLAG_INDEX_PERMUTATION_SELECTED]
        product.permutations = []
        for json_permutation in json[cls.ATTR_ID_PRODUCT_PERMUTATION]:
            product.permutations.append(Product_Permutation.from_json(json_permutation))
        product.variation_trees = []
        for json_tree in json[cls.FLAG_PRODUCT_VARIATION_TREES]:
            product.variation_trees.append(Product_Variation_Tree.from_json(json_tree))
        return product
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
    """
    def get_json_str_types_variation_trees(self):
        json_str = ''
        for tree in self.variation_trees:
            if json_str != '':
                json_str += '\n'
            json_str += tree.get_json_str_types()
        return json_str
    def get_text_input_variation_types(self):
        text_input = ''
        for tree in self.variation_trees:
            if text_input != '':
                text_input += '\n'
            text_input += tree.get_text_input_types()
        return text_input
    """


@dataclass
class Filters_Product():
    # id_user: str
    get_all_product_category: bool
    get_inactive_product_category: bool
    # get_first_product_category_only: bool
    ids_product_category: str
    get_all_product: bool
    get_inactive_product: bool
    # get_first_product_only: bool
    ids_product: str
    get_all_permutation: bool
    get_inactive_permutation: bool
    # get_first_permutation_only: bool
    ids_permutation: str
    get_all_image: bool
    get_inactive_image: bool
    # get_first_image_only: bool
    ids_image: str
    """
    get_all_region: bool
    get_inactive_region: bool
    get_first_region_only: bool
    ids_region: str
    get_all_currency: bool
    get_inactive_currency: bool
    get_first_currency_only: bool
    ids_currency: str
    get_all_discount: bool
    get_inactive_discount: bool
    ids_discount: str
    """
    get_products_quantity_stock_below_min: bool

    def to_json(self):
        return {
            'a_id_user': None,
            'a_get_all_product_category': self.get_all_product_category,
            'a_get_inactive_product_category': self.get_inactive_product_category,
            # 'a_get_first_product_category_only': self.get_first_product_category_only,
            'a_ids_product_category': self.ids_product_category,
            'a_get_all_product': self.get_all_product,
            'a_get_inactive_product': self.get_inactive_product,
            # 'a_get_first_product_only': self.get_first_product_only,
            'a_ids_product': self.ids_product,
            'a_get_all_permutation': self.get_all_permutation,
            'a_get_inactive_permutation': self.get_inactive_permutation,
            # 'a_get_first_permutation_only': self.get_first_permutation_only,
            'a_ids_permutation': self.ids_permutation,
            'a_get_all_image': self.get_all_image,
            'a_get_inactive_image': self.get_inactive_image,
            # 'a_get_first_image_only': self.get_first_image_only,
            'a_ids_image': self.ids_image,
            # 'a_get_all_delivery_region': self.get_all_region,
            # 'a_get_inactive_delivery_region': self.get_inactive_region,
            # 'a_get_first_delivery_region_only': self.get_first_region_only,
            # 'a_ids_delivery_region': self.ids_region,
            # 'a_get_all_currency': self.get_all_currency,
            # 'a_get_inactive_currency': self.get_inactive_currency,
            # 'a_get_first_currency_only': self.get_first_currency_only,
            # 'a_ids_currency': self.ids_currency,
            # 'a_get_all_discount': self.get_all_discount,
            # 'a_get_inactive_discount': self.get_inactive_discount,
            # 'a_ids_discount': self.ids_discount,
            'a_get_products_quantity_stock_below_min': self.get_products_quantity_stock_below_min
        }
    
    @staticmethod
    def from_form_filters_product(form):
        # if not (form is Filters_Product_Permutation): raise ValueError(f'Invalid form type: {type(form)}')
        av.val_instance(form, 'form', 'Filters_Product.from_form', Form_Filters_Product)
        has_filter_category = not (form.id_category.data == '0' or form.id_category.data == '')
        is_not_empty = av.input_bool(form.is_not_empty.data, "is_not_empty", "Filters_Product.from_form_filters_product")
        active = av.input_bool(form.active.data, "active", "Filters_Product.from_form_filters_product")
        return Filters_Product(
            get_all_product_category = not has_filter_category,
            get_inactive_product_category = not active,
            # get_first_product_category_only = False,
            ids_product_category = form.id_category.data,
            get_all_product = True,
            get_inactive_product = not active,
            # get_first_product_only = False,
            ids_product = '',
            get_all_permutation = True,
            get_inactive_permutation = not active,
            # get_first_permutation_only = False,
            ids_permutation = '',
            get_all_image = False,
            get_inactive_image = False,
            # get_first_image_only = False,
            ids_image = '',
            # get_all_region = False,
            # get_inactive_region = False,
            # get_first_region_only = False,
            # ids_region = '',
            # get_all_currency = False,
            # get_inactive_currency = False,
            # get_first_currency_only = False,
            # ids_currency = '',
            # get_all_discount = False,
            # get_inactive_discount = False,
            # ids_discount = '',
            get_products_quantity_stock_below_min = False
        )
    @staticmethod
    def from_form_filters_product_permutation(form):
        # if not (form is Filters_Product_Permutation): raise ValueError(f'Invalid form type: {type(form)}')
        av.val_instance(form, 'form', 'Filters_Product.from_form', Filters_Product_Permutation)
        has_category_filter = not (form.id_category.data == '0' or form.id_category.data == '')
        has_product_filter = not (form.id_product.data == '0' or form.id_product.data == '')
        get_permutations_stock_below_min = av.input_bool(form.is_out_of_stock.data, "is_out_of_stock", "Filters_Product.from_form")
        print(f'form question: {type(form.is_out_of_stock)}\nbool interpretted: {get_permutations_stock_below_min}\type form: {type(form)}')
        return Filters_Product(
            get_all_product_category = not has_category_filter,
            get_inactive_product_category = False,
            # get_first_product_category_only = False,
            ids_product_category = form.id_category.data,
            get_all_product = not has_product_filter,
            get_inactive_product = False,
            # get_first_product_only = False,
            ids_product = form.id_product.data,
            get_all_permutation = not get_permutations_stock_below_min,
            get_inactive_permutation = False,
            # get_first_permutation_only = False,
            ids_permutation = '',
            get_all_image = False,
            get_inactive_image = False,
            # get_first_image_only = False,
            ids_image = '',
            # get_all_region = False,
            # get_inactive_region = False,
            # get_first_region_only = False,
            # ids_region = '',
            # get_all_currency = False,
            # get_inactive_currency = False,
            # get_first_currency_only = False,
            # ids_currency = '',
            # get_all_discount = False,
            # get_inactive_discount = False,
            # ids_discount = '',
            get_products_quantity_stock_below_min = get_permutations_stock_below_min
        )
    
    @staticmethod
    def get_default():
        return Filters_Product(
            get_all_product_category = True,
            get_inactive_product_category = False,
            # get_first_product_category_only = False,
            ids_product_category = '',
            get_all_product = True,
            get_inactive_product = False,
            # get_first_product_only = False,
            ids_product = '',
            get_all_permutation = True,
            get_inactive_permutation = False,
            # get_first_permutation_only = False,
            ids_permutation = '',
            get_all_image = True,
            get_inactive_image = False,
            # get_first_image_only = False,
            ids_image = '',
            # get_all_region = True,
            # et_inactive_region = False,
            # get_first_region_only = False,
            # ids_region = '',
            # get_all_currency = True,
            # get_inactive_currency = False,
            # get_first_currency_only = False,
            # ids_currency = '',
            # get_all_discount = True,
            # get_inactive_discount = False,
            # ids_discount = '',
            get_products_quantity_stock_below_min = True
        )
    
    @classmethod
    def from_json(cls, json):
        return cls(
            get_all_product_category = json.get('a_get_all_product_category', False),
            get_inactive_product_category = json.get('a_get_inactive_product_category', False),
            # get_first_product_category_only = json.get('a_get_first_product_category_only', False),
            ids_product_category = json.get('a_ids_product_category', ''),
            get_all_product = json.get('a_get_all_product', False),
            get_inactive_product = json.get('a_get_inactive_product', False),
            # get_first_product_only = json.get('a_get_first_product_only', False),
            ids_product = json.get('a_ids_product', ''),
            get_all_permutation = json.get('a_get_all_permutation', False),
            get_inactive_permutation = json.get('a_get_inactive_permutation', False),
            # get_first_permutation_only = json.get('a_get_first_permutation_only', False),
            ids_permutation = json.get('a_ids_permutation', ''),
            get_all_image = json.get('a_get_all_image', False),
            get_inactive_image = json.get('a_get_inactive_image', False),
            # get_first_image_only = json.get('a_get_first_image_only', False),
            ids_image = json.get('a_ids_image', ''),
            # get_all_region = json.get('a_get_all_region', False),
            # get_inactive_region = json.get('a_get_inactive_region', False),
            # get_first_region_only = json.get('a_get_first_region_only', False),
            # ids_region = json.get('a_ids_region', ''),
            # get_all_currency = json.get('a_get_all_currency', False),
            # get_inactive_currency = json.get('a_get_inactive_currency', False),
            # get_first_currency_only = json.get('a_get_first_currency_only', False),
            # ids_currency = json.get('a_ids_currency', ''),
            # get_all_discount = json.get('a_get_all_discount', False),
            # get_inactive_discount = json.get('a_get_inactive_discount', False),
            # ids_discount = json.get('a_ids_discount', ''),
            get_products_quantity_stock_below_min = json.get('a_get_products_quantity_stock_below_min', False)
        )
    
    @classmethod
    def from_filters_product_category(cls, filters_category):
        return cls(
            get_all_product_category = True,
            get_inactive_product_category = filters_category.active,
            ids_product_category = '',
            get_all_product = True,
            get_inactive_product = False,
            ids_product = False,
            get_all_permutation = True,
            get_inactive_permutation = False,
            ids_permutation = '',
            get_all_image = False,
            get_inactive_image = False,
            ids_image = '',
            get_products_quantity_stock_below_min = False
        )
    

class Filters_Product(Get_Many_Parameters_Base):
    # id_user: str
    get_all_product_category: bool
    get_inactive_product_category: bool
    # get_first_product_category_only: bool
    ids_product_category: str
    get_all_product: bool
    get_inactive_product: bool
    # get_first_product_only: bool
    ids_product: str
    get_all_permutation: bool
    get_inactive_permutation: bool
    # get_first_permutation_only: bool
    ids_permutation: str
    get_all_image: bool
    get_inactive_image: bool
    # get_first_image_only: bool
    ids_image: str
    """
    get_all_region: bool
    get_inactive_region: bool
    get_first_region_only: bool
    ids_region: str
    get_all_currency: bool
    get_inactive_currency: bool
    get_first_currency_only: bool
    ids_currency: str
    get_all_discount: bool
    get_inactive_discount: bool
    ids_discount: str
    """
    get_products_quantity_stock_below_min: bool

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

    def to_json(self):
        return {
            'a_id_user': None,
            'a_get_all_product_category': self.get_all_product_category,
            'a_get_inactive_product_category': self.get_inactive_product_category,
            # 'a_get_first_product_category_only': self.get_first_product_category_only,
            'a_ids_product_category': self.ids_product_category,
            'a_get_all_product': self.get_all_product,
            'a_get_inactive_product': self.get_inactive_product,
            # 'a_get_first_product_only': self.get_first_product_only,
            'a_ids_product': self.ids_product,
            'a_get_all_permutation': self.get_all_permutation,
            'a_get_inactive_permutation': self.get_inactive_permutation,
            # 'a_get_first_permutation_only': self.get_first_permutation_only,
            'a_ids_permutation': self.ids_permutation,
            'a_get_all_image': self.get_all_image,
            'a_get_inactive_image': self.get_inactive_image,
            # 'a_get_first_image_only': self.get_first_image_only,
            'a_ids_image': self.ids_image,
            # 'a_get_all_delivery_region': self.get_all_region,
            # 'a_get_inactive_delivery_region': self.get_inactive_region,
            # 'a_get_first_delivery_region_only': self.get_first_region_only,
            # 'a_ids_delivery_region': self.ids_region,
            # 'a_get_all_currency': self.get_all_currency,
            # 'a_get_inactive_currency': self.get_inactive_currency,
            # 'a_get_first_currency_only': self.get_first_currency_only,
            # 'a_ids_currency': self.ids_currency,
            # 'a_get_all_discount': self.get_all_discount,
            # 'a_get_inactive_discount': self.get_inactive_discount,
            # 'a_ids_discount': self.ids_discount,
            'a_get_products_quantity_stock_below_min': self.get_products_quantity_stock_below_min
        }
    
    @staticmethod
    def from_form_filters_product(form):
        # if not (form is Filters_Product_Permutation): raise ValueError(f'Invalid form type: {type(form)}')
        av.val_instance(form, 'form', 'Filters_Product.from_form', Form_Filters_Product)
        has_filter_category = not (form.id_category.data == '0' or form.id_category.data == '')
        is_not_empty = av.input_bool(form.is_not_empty.data, "is_not_empty", "Filters_Product.from_form_filters_product")
        active = av.input_bool(form.active.data, "active", "Filters_Product.from_form_filters_product")
        return Filters_Product(
            get_all_product_category = not has_filter_category,
            get_inactive_product_category = not active,
            # get_first_product_category_only = False,
            ids_product_category = str(form.id_category.data),
            get_all_product = True,
            get_inactive_product = not active,
            # get_first_product_only = False,
            ids_product = '',
            get_all_permutation = True,
            get_inactive_permutation = not active,
            # get_first_permutation_only = False,
            ids_permutation = '',
            get_all_image = False,
            get_inactive_image = False,
            # get_first_image_only = False,
            ids_image = '',
            # get_all_region = False,
            # get_inactive_region = False,
            # get_first_region_only = False,
            # ids_region = '',
            # get_all_currency = False,
            # get_inactive_currency = False,
            # get_first_currency_only = False,
            # ids_currency = '',
            # get_all_discount = False,
            # get_inactive_discount = False,
            # ids_discount = '',
            get_products_quantity_stock_below_min = False
        )
    @staticmethod 
    def from_form_filters_product_permutation(form):
        # if not (form is Filters_Product_Permutation): raise ValueError(f'Invalid form type: {type(form)}')
        # av.val_instance(form, 'form', 'Filters_Product.from_form', Form_Base)
        has_category_filter = not (form.id_category.data is None or form.id_category.data == '0' or form.id_category.data == '')
        has_product_filter = not (form.id_product.data is None or form.id_product.data == '0' or form.id_product.data == '')
        get_permutations_stock_below_min = av.input_bool(form.is_out_of_stock.data, "is_out_of_stock", "Filters_Product.from_form")
        print(f'form question: {type(form.is_out_of_stock)}\nbool interpretted: {get_permutations_stock_below_min}\type form: {type(form)}')
        return Filters_Product(
            get_all_product_category = not has_category_filter,
            get_inactive_product_category = False,
            # get_first_product_category_only = False,
            ids_product_category = str(form.id_category.data) if has_category_filter else '',
            get_all_product = not has_product_filter,
            get_inactive_product = False,
            # get_first_product_only = False,
            ids_product = str(form.id_product.data) if has_product_filter else '',
            get_all_permutation = not get_permutations_stock_below_min,
            get_inactive_permutation = False,
            # get_first_permutation_only = False,
            ids_permutation = '',
            get_all_image = False,
            get_inactive_image = False,
            # get_first_image_only = False,
            ids_image = '',
            # get_all_region = False,
            # get_inactive_region = False,
            # get_first_region_only = False,
            # ids_region = '',
            # get_all_currency = False,
            # get_inactive_currency = False,
            # get_first_currency_only = False,
            # ids_currency = '',
            # get_all_discount = False,
            # get_inactive_discount = False,
            # ids_discount = '',
            get_products_quantity_stock_below_min = get_permutations_stock_below_min
        )
    
    @staticmethod
    def get_default():
        return Filters_Product(
            get_all_product_category = True,
            get_inactive_product_category = False,
            # get_first_product_category_only = False,
            ids_product_category = '',
            get_all_product = True,
            get_inactive_product = False,
            # get_first_product_only = False,
            ids_product = '',
            get_all_permutation = True,
            get_inactive_permutation = False,
            # get_first_permutation_only = False,
            ids_permutation = '',
            get_all_image = True,
            get_inactive_image = False,
            # get_first_image_only = False,
            ids_image = '',
            # get_all_region = True,
            # et_inactive_region = False,
            # get_first_region_only = False,
            # ids_region = '',
            # get_all_currency = True,
            # get_inactive_currency = False,
            # get_first_currency_only = False,
            # ids_currency = '',
            # get_all_discount = True,
            # get_inactive_discount = False,
            # ids_discount = '',
            get_products_quantity_stock_below_min = True
        )
    
    @classmethod
    def from_json(cls, json):
        return cls(
            get_all_product_category = json.get('a_get_all_product_category', False),
            get_inactive_product_category = json.get('a_get_inactive_product_category', False),
            # get_first_product_category_only = json.get('a_get_first_product_category_only', False),
            ids_product_category = json.get('a_ids_product_category', ''),
            get_all_product = json.get('a_get_all_product', False),
            get_inactive_product = json.get('a_get_inactive_product', False),
            # get_first_product_only = json.get('a_get_first_product_only', False),
            ids_product = json.get('a_ids_product', ''),
            get_all_permutation = json.get('a_get_all_permutation', False),
            get_inactive_permutation = json.get('a_get_inactive_permutation', False),
            # get_first_permutation_only = json.get('a_get_first_permutation_only', False),
            ids_permutation = json.get('a_ids_permutation', ''),
            get_all_image = json.get('a_get_all_image', False),
            get_inactive_image = json.get('a_get_inactive_image', False),
            # get_first_image_only = json.get('a_get_first_image_only', False),
            ids_image = json.get('a_ids_image', ''),
            # get_all_region = json.get('a_get_all_region', False),
            # get_inactive_region = json.get('a_get_inactive_region', False),
            # get_first_region_only = json.get('a_get_first_region_only', False),
            # ids_region = json.get('a_ids_region', ''),
            # get_all_currency = json.get('a_get_all_currency', False),
            # get_inactive_currency = json.get('a_get_inactive_currency', False),
            # get_first_currency_only = json.get('a_get_first_currency_only', False),
            # ids_currency = json.get('a_ids_currency', ''),
            # get_all_discount = json.get('a_get_all_discount', False),
            # get_inactive_discount = json.get('a_get_inactive_discount', False),
            # ids_discount = json.get('a_ids_discount', ''),
            get_products_quantity_stock_below_min = json.get('a_get_products_quantity_stock_below_min', False)
        )
    
    @classmethod
    def from_filters_product_category(cls, filters_category):
        return cls(
            get_all_product_category = True,
            get_inactive_product_category = filters_category.active.data,
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