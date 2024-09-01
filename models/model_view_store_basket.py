"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Store Basket View Model

Description:
Data model for store basket view
"""

# IMPORTS
# VARIABLE INSTANTIATION
# METHODS

# IMPORTS
# internal
from models.model_view_store import Model_View_Store
# from routes import bp_home
from business_objects.store.product import Product
from forms.forms import Form_Billing # Form_Product
# external


# VARIABLE INSTANTIATION


# CLASSES
class Model_View_Store_Basket(Model_View_Store):
    # Attributes
    # product_categories: list # (str)
    form_delivery: Form_Billing
    form_billing: Form_Billing
    forms_delivery_method: list # []
    is_collapsed_info_billing: bool
    is_collapsed_info_delivery: bool
    # Global constants
    # category_products: dict { category_enum_id: List[Product] }
    hash_page_store_checkout = '/store/checkout'
    hash_page_store_checkout_session = '/store/checkout_session'
    hash_store_basket_info = '/store/basket_info'
    id_container_info_billing = 'containerInfoBilling'
    id_container_info_delivery = 'containerInfoDelivery'
    id_overlay_info_delivery = 'overlayInfoDelivery'
    id_overlay_info_billing = 'overlayInfoBilling'
    key_address1 = 'address_1'
    key_address2 = 'address_2'
    key_city = 'city'
    key_county = 'county'
    key_id_checkout = 'checkout-session-id'
    key_info_billing = 'billing-info'
    key_info_delivery = 'delivery-info'
    key_info_identical = 'identical'
    key_info_type = 'type-info'
    key_is_subscription = 'is-subscription'
    key_name_full = 'name_full'
    key_phone_number = 'phone_number'
    key_postcode = 'postcode'
    key_region = 'region'
    key_url_checkout = 'checkout-url'
    
    # Attributes
    @property
    def title(self):
        return 'Store Basket'
    
    def __init__(self, id_currency, id_region_delivery, is_included_VAT, hash_page_current=Model_View_Store.HASH_PAGE_STORE_BASKET):
        # Constructor
        super().__init__(hash_page_current=hash_page_current, id_currency=id_currency, id_region_delivery=id_region_delivery, is_included_VAT=is_included_VAT)
        # self.product_categories = Model_View_Store_Basket.get_many_product(get_all_category = True, get_all_product = True)
        self.form_billing = Form_Billing()
        self.form_billing.form_type_billing_not_delivery = True
        self.form_delivery = Form_Billing()
        # if logged in:
        # else:
        self.is_collapsed_info_billing = False
        self.is_collapsed_info_delivery = False
        """
        self.forms_product = {}
        for cat in self.product_categories:
            for product in cat:
                if len(list(product.variations.keys())) == 0:
                    new_form = Form_Product()
                    if new_form.validate_on_submit():
                        # Handle form submission
                        self.add_2_basket(product.id, )
                    self.forms[str(product.id)] = new_form
        """