"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Stock Item Business Object
"""

# IMPORTS
# internal
import lib.argument_validation as av
from lib import data_types
from forms.forms import Form_Filters_Stock_Item
from business_objects.store.product_price import Product_Price
# from business_objects.discount import Discount
from business_objects.store.store_base import Store_Base
from extensions import db
# external
from dataclasses import dataclass
from typing import ClassVar
from datetime import datetime


class Stock_Item(db.Model, Store_Base):
    ATTR_ID_CURRENCY_COST: ClassVar[str] = f'{Store_Base.ATTR_ID_CURRENCY}-cost'
    FLAG_DATE_CONSUMED: ClassVar[str] = 'date-consumed'
    FLAG_DATE_EXPIRATION: ClassVar[str] = 'date-expiration'
    FLAG_DATE_PURCHASED: ClassVar[str] = 'date-purchased'
    FLAG_DATE_RECEIVED: ClassVar[str] = 'date-received'
    FLAG_DATE_UNSEALED: ClassVar[str] = 'date-unsealed'
    FLAG_IS_CONSUMED: ClassVar[str] = 'is-consumed'
    FLAG_IS_SEALED: ClassVar[str] = 'is-sealed'
    FLAG_VALUE_LOCAL_VAT_EXCL_COST: ClassVar[str] = f'{Product_Price.FLAG_VALUE_LOCAL_VAT_EXCL}-cost'
    FLAG_VALUE_LOCAL_VAT_INCL_COST: ClassVar[str] = f'{Product_Price.FLAG_VALUE_LOCAL_VAT_INCL}-cost'

    id_stock = db.Column(db.Integer, primary_key=True)
    id_permutation = db.Column(db.Integer)
    id_product = db.Column(db.Integer)
    id_category = db.Column(db.Integer)
    # name_category = db.Column(db.String(255))
    # name_product = db.Column(db.String(255))
    date_purchased = db.Column(db.DateTime)
    date_received = db.Column(db.DateTime)
    id_location_storage = db.Column(db.Integer)
    id_currency_cost = db.Column(db.Integer)
    cost_local_VAT_incl = db.Column(db.Float)
    cost_local_VAT_excl = db.Column(db.Float)
    is_sealed = db.Column(db.Boolean)
    date_unsealed = db.Column(db.DateTime)
    date_expiration = db.Column(db.DateTime)
    is_consumed = db.Column(db.Boolean)
    date_consumed = db.Column(db.DateTime)
    active = db.Column(db.Boolean)
    """
    can_view = db.Column(db.Boolean)
    can_edit = db.Column(db.Boolean)
    can_admin = db.Column(db.Boolean)
    """

    def __init__(self):
        super().__init__()
        Store_Base.__init__(self)

    def from_DB_stock_item(query_row):
        _m = 'Product.from_DB_stock_item'
        v_arg_type = 'class attribute'
        stock_item = Stock_Item()
        stock_item.id_stock = query_row[0]
        stock_item.id_permutation = query_row[1]
        stock_item.id_product = query_row[2]
        stock_item.id_category = query_row[3]
        # stock_item.name_category = query_row[4]
        # stock_item.name_product = query_row[5]
        stock_item.date_purchased = query_row[6]
        stock_item.date_received = query_row[7]
        stock_item.id_location_storage = query_row[8]
        # stock_item.name_location_storage = query_row[9]
        stock_item.id_currency_cost = query_row[10]
        stock_item.cost_local_VAT_incl = query_row[13]
        stock_item.cost_local_VAT_excl = query_row[14]
        stock_item.is_sealed = av.input_bool(query_row[15], "is_sealed", _m, v_arg_type=v_arg_type)
        stock_item.date_unsealed = query_row[16]
        stock_item.date_expiration = query_row[17]
        stock_item.is_consumed = av.input_bool(query_row[18], "is_consumed", _m, v_arg_type=v_arg_type)
        stock_item.date_consumed = query_row[19]
        stock_item.active = av.input_bool(query_row[20], "active", _m, v_arg_type=v_arg_type)
        """
        stock_item.can_view = av.input_bool(query_row[24], "can_view", _m, v_arg_type=v_arg_type)
        stock_item.can_edit = av.input_bool(query_row[25], "can_edit", _m, v_arg_type=v_arg_type)
        stock_item.can_admin = av.input_bool(query_row[26], "can_admin", _m, v_arg_type=v_arg_type)
        """
        return stock_item
    
    @classmethod
    def from_json(cls, json):
        stock_item = cls()
        stock_item.id_stock = json[cls.ATTR_ID_STOCK_ITEM]
        stock_item.id_permutation = json[cls.ATTR_ID_PRODUCT_PERMUTATION]
        stock_item.id_product = json[cls.ATTR_ID_PRODUCT]
        stock_item.id_category = json[cls.ATTR_ID_PRODUCT_CATEGORY]
        stock_item.date_purchased = json[cls.FLAG_DATE_PURCHASED]
        stock_item.date_received = json[cls.FLAG_DATE_RECEIVED]
        stock_item.id_location_storage = json[cls.ATTR_ID_LOCATION_STORAGE]
        stock_item.id_currency_cost = json[cls.ATTR_ID_CURRENCY_COST]
        stock_item.cost_local_VAT_incl = json[cls.FLAG_VALUE_LOCAL_VAT_INCL_COST]
        stock_item.cost_local_VAT_excl = json[cls.FLAG_VALUE_LOCAL_VAT_EXCL_COST]
        stock_item.is_sealed = json[cls.FLAG_IS_SEALED]
        stock_item.date_unsealed = json[cls.FLAG_DATE_UNSEALED]
        stock_item.date_expiration = json[cls.FLAG_DATE_EXPIRATION]
        stock_item.is_consumed = json[cls.FLAG_IS_CONSUMED]
        stock_item.date_consumed = json[cls.FLAG_DATE_CONSUMED]
        stock_item.active = json[cls.FLAG_ACTIVE]
        """
        stock_item.can_view = json[cls.FLAG_CAN_VIEW]
        stock_item.can_edit = json[cls.FLAG_CAN_EDIT]
        stock_item.can_admin = json[cls.FLAG_CAN_ADMIN]
        """
        return stock_item
    """
    def from_json(json_basket_item, key_id_product, key_id_permutation):
        permutation = Product_Permutation.from_json(json_basket_item, key_id_product, key_id_permutation)
        product = Product.from_permutation(permutation)
        return product
    
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
    def has_permutations(self):
        return len(self.permutations) > 0
    def is_available(self):
        if len(self.permutations) == 0:
            return False
        for permutation in self.permutations:
            if permutation.is_available():
                return True
        return False
    """
    def to_list_rows_permutation(self):
        list_rows = []
        for permutation in self.permutations:
            list_rows.append(permutation.to_row_permutation())
        return list_rows
    """

@dataclass
class Stock_Item_Filters():
    # id_user: str
    get_all_category: bool
    get_inactive_category: bool
    get_first_category_only: bool
    ids_category: str
    get_all_product: bool
    get_inactive_product: bool
    get_first_product_only: bool
    ids_product: str
    get_all_permutation: bool
    get_inactive_permutation: bool
    get_first_permutation_only: bool
    ids_permutation: str
    get_all_stock_item: bool
    get_inactive_stock_item: bool
    get_first_stock_item_only: bool
    ids_stock_item: str
    get_all_region_storage: bool
    get_inactive_region_storage: bool
    get_first_region_storage_only: bool
    ids_region_storage: str
    get_all_plant_storage: bool
    get_inactive_plant_storage: bool
    get_first_plant_storage_only: bool
    ids_plant_storage: str
    get_all_location_storage: bool
    get_inactive_location_storage: bool
    get_first_location_storage_only: bool
    ids_location_storage: str
    date_received_to: datetime
    get_sealed_stock_item_only: bool
    get_unsealed_stock_item_only: bool
    get_expired_stock_item_only: bool
    get_nonexpired_stock_item_only: bool
    get_consumed_stock_item_only: bool
    get_nonconsumed_stock_item_only: bool

    def to_json(self):
        return {
            'a_id_user': None,
            'a_get_all_category': self.get_all_category,
            'a_get_inactive_category': self.get_inactive_category,
            'a_get_first_category_only': self.get_first_category_only,
            'a_ids_category': self.ids_category,
            'a_get_all_product': self.get_all_product,
            'a_get_inactive_product': self.get_inactive_product,
            'a_get_first_product_only': self.get_first_product_only,
            'a_ids_product': self.ids_product,
            'a_get_all_permutation': self.get_all_permutation,
            'a_get_inactive_permutation': self.get_inactive_permutation,
            'a_get_first_permutation_only': self.get_first_permutation_only,
            'a_ids_permutation': self.ids_permutation,
            'a_get_all_stock_item': self.get_all_stock_item,
            'a_get_inactive_stock_item': self.get_inactive_stock_item,
            'a_get_first_stock_item_only': self.get_first_stock_item_only,
            'a_ids_stock_item': self.ids_stock_item,
            'a_get_all_delivery_region_storage': self.get_all_region_storage,
            'a_get_inactive_delivery_region_storage': self.get_inactive_region_storage,
            'a_get_first_delivery_region_storage_only': self.get_first_region_storage_only,
            'a_ids_delivery_region_storage': self.ids_region_storage,
            'a_get_all_plant_storage': self.get_all_plant_storage,
            'a_get_inactive_plant_storage': self.get_inactive_plant_storage,
            'a_get_first_plant_storage_only': self.get_first_plant_storage_only,
            'a_ids_plant_storage': self.ids_plant_storage,
            'a_get_all_location_storage': self.get_all_location_storage,
            'a_get_inactive_location_storage': self.get_inactive_location_storage,
            'a_get_first_location_storage_only': self.get_first_location_storage_only,
            'a_ids_location_storage': self.ids_location_storage,
            'a_date_received_to': self.date_received_to,
            'a_get_sealed_stock_item_only': self.get_sealed_stock_item_only,
            'a_get_unsealed_stock_item_only': self.get_unsealed_stock_item_only,
            'a_get_expired_stock_item_only': self.get_expired_stock_item_only,
            'a_get_nonexpired_stock_item_only': self.get_nonexpired_stock_item_only,
            'a_get_consumed_stock_item_only': self.get_consumed_stock_item_only,
            'a_get_nonconsumed_stock_item_only': self.get_nonconsumed_stock_item_only
        }
    
    @staticmethod
    def from_form(form):
        # if not (form is Form_Filters_Permutations): raise ValueError(f'Invalid form type: {type(form)}')
        av.val_instance(form, 'form', 'Filters_Product.from_form', Form_Filters_Stock_Item)
        has_category_filter = not (form.id_category.data == '0' or form.id_category.data == '')
        has_product_filter = not (form.id_product.data == '0' or form.id_product.data == '')
        get_permutations_stock_below_min = av.input_bool(form.is_out_of_stock.data, "is_out_of_stock", "Filters_Product.from_form")
        print(f'form question: {type(form.is_out_of_stock)}\nbool interpretted: {get_permutations_stock_below_min}\type form: {type(form)}')
        return Stock_Item_Filters(
            get_all_category = not has_category_filter,
            get_inactive_category = False,
            get_first_category_only = False,
            ids_category = form.id_category.data,
            get_all_product = not has_product_filter,
            get_inactive_product = False,
            get_first_product_only = False,
            ids_product = form.id_product.data,
            get_all_permutation = not get_permutations_stock_below_min,
            get_inactive_permutation = False,
            get_first_permutation_only = False,
            ids_permutation = '',
            get_all_stock_item = False,
            get_inactive_stock_item = False,
            get_first_stock_item_only = False,
            ids_stock_item = '',
            get_all_region_storage = False,
            get_inactive_region_storage = False,
            get_first_region_storage_only = False,
            ids_region_storage = '',
            get_all_plant_storage = False,
            get_inactive_plant_storage = False,
            get_first_plant_storage_only = False,
            ids_plant_storage = '',
            get_all_location_storage = False,
            get_inactive_location_storage = False,
            get_first_location_storage_only = False,
            ids_location_storage = '',
            date_received_to = None,
            get_sealed_stock_item_only = False,
            get_unsealed_stock_item_only = False,
            get_expired_stock_item_only = False,
            get_nonexpired_stock_item_only = False,
            get_consumed_stock_item_only = False,
            get_nonconsumed_stock_item_only = False
        )
    
    @staticmethod
    def get_default():
        return Stock_Item_Filters(
            get_all_category = True,
            get_inactive_category = False,
            get_first_category_only = False,
            ids_category = '',
            get_all_product = True,
            get_inactive_product = False,
            get_first_product_only = False,
            ids_product = '',
            get_all_permutation = True,
            get_inactive_permutation = False,
            get_first_permutation_only = False,
            ids_permutation = '',
            get_all_stock_item = True,
            get_inactive_stock_item = False,
            get_first_stock_item_only = False,
            ids_stock_item = '',
            get_all_region_storage = True,
            get_inactive_region_storage = False,
            get_first_region_storage_only = False,
            ids_region_storage = '',
            get_all_plant_storage = True,
            get_inactive_plant_storage = False,
            get_first_plant_storage_only = False,
            ids_plant_storage = '',
            get_all_location_storage = True,
            get_inactive_location_storage = False,
            get_first_location_storage_only = False,
            ids_location_storage = '',
            date_received_to = None,
            get_sealed_stock_item_only = False,
            get_unsealed_stock_item_only = False,
            get_expired_stock_item_only = False,
            get_nonexpired_stock_item_only = False,
            get_consumed_stock_item_only = False,
            get_nonconsumed_stock_item_only = False
        )