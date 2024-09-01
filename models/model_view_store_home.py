"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Store Home View Model

Description:
Data model for store home view
"""

# IMPORTS
# VARIABLE INSTANTIATION
# METHODS

# IMPORTS
# internal
from models.model_view_store import Model_View_Store
# from routes import bp_home
from business_objects.store.product import Product
from forms.forms import Form_Basket_Add, Form_Basket_Edit # Form_Product
# external


# VARIABLE INSTANTIATION


# CLASSES
class Model_View_Store_Home(Model_View_Store):
    # Attributes
    product_categories: list # (str)
    forms_product: dict
    forms_basket: dict
    # Global constants
    # category_products: dict { category_enum_id: List[Product] }
    # Attributes
    @property
    def title(self):
        return 'Store Home'
    max_products_per_category = -1

    def __init__(self, id_currency, id_region_delivery, is_included_VAT, hash_page_current=Model_View_Store.HASH_PAGE_STORE_):
        # Constructor
        super().__init__(id_currency, id_region_delivery, is_included_VAT)
        # self.categories = Model_View_Store_Home.get_many_product(self.db, get_all_category = True, get_all_product = True)
        # self.get_many_product(get_all_category = True, get_all_product = True)
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
                    
