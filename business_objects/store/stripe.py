"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Business Objects
Feature:    Stripe Business Object

Description:
Business objects for Stripe
"""

# internal
import lib.argument_validation as av
from lib import data_types
from forms.forms import Form_Basket_Add, Form_Basket_Edit # Form_Product
from extensions import db

# external
from datetime import datetime, timedelta
import locale

class Stripe_Product(db.Model):
    id_product = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255))
    description = db.Column(db.String(4000))
    price_GBP_full = db.Column(db.Float)
    id_category = db.Column(db.Integer)
    lead_time_manuf = db.Column(db.Integer)
    quantity_min = db.Column(db.Float)
    quantity_max = db.Column(db.Float)
    quantity_step = db.Column(db.Float)
    quantity_stock = db.Column(db.Float)
    id_stripe_product = db.Column(db.String(255))
    id_stripe_price = db.Column(db.String(255))
    is_subscription = db.Column(db.Boolean)
    name_recurring_interval = db.Column(db.String(255))
    name_plural_recurring_interval = db.Column(db.String(256))
    count_recurring_interval = db.Column(db.Integer)
    display_order = db.Column(db.Integer)
    can_view = db.Column(db.Boolean)
    can_edit = db.Column(db.Boolean)
    can_admin = db.Column(db.Boolean)
    # form_basket_add: Form_Basket_Add
    # form_basket_edit: Form_Basket_Edit

    def __new__(cls, id, name, description, price_GBP_full, id_category, lead_time_manuf, quantity_min, quantity_max, quantity_step, quantity_stock, id_stripe_product, id_stripe_price,
                    is_subscription, name_recurring_interval, name_plural_recurring_interval, count_recurring_interval, display_order, can_view, can_edit, can_admin):
        _m = 'Product.__new__'
        v_arg_type = 'class attribute'
        av.val_int(id, 'id', _m, 0, v_arg_type=v_arg_type)
        av.val_str(name, 'name', _m, max_len=256, v_arg_type=v_arg_type)
        av.val_str(description, 'description', _m, max_len=4000, v_arg_type=v_arg_type)
        av.full_val_float(price_GBP_full, 'price_GBP_full', _m, 0., v_arg_type=v_arg_type)
        av.val_int(id_category, 'id_category', _m, 0, v_arg_type=v_arg_type)
        av.val_int(lead_time_manuf, 'lead_time_manuf', _m, 0, v_arg_type=v_arg_type)
        av.full_val_float(quantity_step, 'quantity_step', _m, 0., v_arg_type=v_arg_type)
        av.full_val_float(quantity_min, 'quantity_min', _m, quantity_step, v_arg_type=v_arg_type)
        av.full_val_float(quantity_max, 'quantity_max', _m, quantity_min, v_arg_type=v_arg_type)
        av.full_val_float(quantity_stock, 'quantity_stock', _m, 0, v_arg_type=v_arg_type)
        av.val_str(id_stripe_product, 'id_stripe_product', _m, max_len=100, v_arg_type=v_arg_type)
        av.val_str(id_stripe_price, 'id_stripe_price', _m, max_len=100, v_arg_type=v_arg_type)
        av.full_val_bool(is_subscription, 'is_subscription', _m, v_arg_type=v_arg_type)
        print(f'is_subscription: {is_subscription}, {av.input_bool(is_subscription, "is_subscription", _m, v_arg_type=v_arg_type)}')
        is_subscription = av.input_bool(is_subscription, "is_subscription", _m, v_arg_type=v_arg_type)
        if is_subscription:
            av.val_str(name_recurring_interval, 'name_recurring_interval', _m, max_len=255, v_arg_type=v_arg_type)
            av.val_str(name_plural_recurring_interval, 'name_plural_recurring_interval', _m, max_len=256, v_arg_type=v_arg_type)
            av.val_int(count_recurring_interval, 'count_recurring_interval', _m, 0, v_arg_type=v_arg_type)
        av.val_int(display_order, 'display_order', _m, v_arg_type=v_arg_type)
        av.full_val_bool(can_view, 'can_view', _m, v_arg_type=v_arg_type)
        # can_view = av.input_bool(can_view, "can_view", _m, v_arg_type=v_arg_type)
        av.full_val_bool(can_edit, 'can_edit', _m, v_arg_type=v_arg_type)
        # can_edit = av.input_bool(can_edit, "can_edit", _m, v_arg_type=v_arg_type)
        av.full_val_bool(can_admin, 'can_admin', _m, v_arg_type=v_arg_type)
        # can_admin = av.input_bool(can_admin, "can_admin", _m, v_arg_type=v_arg_type)
        return super(Product, cls).__new__(cls) # , id, name, description, price_GBP, id_category, lead_time_manuf, quantity_min, quantity_max, quantity_step, quantity_stock, id_stripe_product, id_stripe_price,
                    # is_subscription, name_recurring_interval, name_plural_recurring_interval, count_recurring_interval, can_view, can_edit, can_admin)
    
    def __init__(self, id, name, description, price_GBP_full, id_category, lead_time_manuf, quantity_min, quantity_max, quantity_step, quantity_stock, id_stripe_product, id_stripe_price,
                    is_subscription, name_recurring_interval, name_plural_recurring_interval, count_recurring_interval, display_order, can_view, can_edit, can_admin):
        _m = 'Product.__new__'
        v_arg_type = 'class attribute'
        self.id_product = id
        self.name = name
        self.description = description
        self.price_GBP_full = price_GBP_full
        self.id_category = id_category
        self.lead_time_manuf = lead_time_manuf
        self.quantity_min = quantity_min
        self.quantity_max = quantity_max
        self.quantity_step = quantity_step
        self.quantity_stock = quantity_stock
        self.id_stripe_product = id_stripe_product
        self.id_stripe_price = id_stripe_price
        self.is_subscription = av.input_bool(is_subscription, "is_subscription", _m, v_arg_type=v_arg_type)
        self.name_recurring_interval = name_recurring_interval
        self.name_plural_recurring_interval = name_plural_recurring_interval
        self.count_recurring_interval = count_recurring_interval
        self.display_order = display_order
        self.can_view = av.input_bool(can_view, "can_view", _m, v_arg_type=v_arg_type)
        self.can_edit = av.input_bool(can_edit, "can_edit", _m, v_arg_type=v_arg_type)
        self.can_admin = av.input_bool(can_admin, "can_admin", _m, v_arg_type=v_arg_type)
        self.variations = []
        self.images = []
        self.delivery_options = []
        self.discounts = []
        self.discount_index = {}
        super().__init__()
        self.form_basket_add = Form_Basket_Add()
        self.form_basket_edit = Form_Basket_Edit()

    def output_lead_time(self):
        return '1 day' if self.lead_time_manuf == 1 else f'{self.lead_time_manuf} days'
    
    def output_delivery_date(self):
        return (datetime.now() + timedelta(days=self.lead_time_manuf)).strftime('%A, %d %B %Y')
    
    def output_price(self):
        locale.setlocale(locale.LC_ALL, '')
        return locale.format_string("%d", self.price_GBP_full, grouping=True)
    """
    def add_form_basket_add(self):
        self.form_basket_add = None

    def add_form_basket_edit(self):
        self.form_basket_edit = None
    """
    def __repr__(self):
        return f'''Product
            id: {self.id_product}
            name: {self.name}
            description: {self.description}
            price_GBP_full: {self.price_GBP_full}
            id_category: {self.id_category}
            lead_time_manuf: {self.lead_time_manuf}
            quantity_min: {self.quantity_min}
            quantity_max: {self.quantity_max}
            quantity_step: {self.quantity_step}
            quantity_stock: {self.quantity_stock}
            id_stripe_product: {self.id_stripe_product}
            id_stripe_price: {self.id_stripe_price}
            is_subscription: {self.is_subscription}
            name_recurring_interval: {self.name_recurring_interval}
            name_plural_recurring_interval: {self.name_plural_recurring_interval}
            count_recurring_interval: {self.count_recurring_interval}
            display_order: {self.display_order}
            can_view: {self.can_view}
            can_edit: {self.can_edit}
            can_admin: {self.can_admin}
            variations: {self.variations}
            images: {self.images}
            delivery_options: {self.delivery_options}
            '''

    def add_product_price_discount(self, discount):
        _m = 'Category.add_product'
        av.val_instance(discount, 'discount', _m, Discount)
        # self.product_index.append(len(self.products))
        self.discount_index[discount.id_discount] = len(self.discounts)
        self.discounts.append(discount)