"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Store Home View Model

Description:
Data model for store home view
"""

# internal
from models.model_view_store import Model_View_Store
# from routes import bp_home
from business_objects.store.product import Product
from forms.forms import Form_Basket_Add, Form_Basket_Edit # Form_Product
# external
from typing import ClassVar


class Model_View_Store_Home(Model_View_Store):
    MAX_PRODUCTS_PER_CATEGORY: ClassVar[int] = -1

    product_categories: list
    forms_product: dict
    forms_basket: dict
    
    @property
    def title(self):
        return 'Store Home'

    def __init__(self, id_currency, id_region_delivery, is_included_VAT, hash_page_current=Model_View_Store.HASH_PAGE_STORE_HOME):
        super().__init__(id_currency, id_region_delivery, is_included_VAT)
        