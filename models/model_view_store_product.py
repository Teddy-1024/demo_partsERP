"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Store Product View Model

Description:
Data model for store product view
"""

# IMPORTS
# VARIABLE INSTANTIATION
# METHODS

# IMPORTS
# internal
from models.model_view_store import Model_View_Store
from datastores.datastore_store_base import DataStore_Store_Base
# from routes import bp_home
from business_objects.store.product import Product, Product_Filters
import lib.argument_validation as av
# external


# VARIABLE INSTANTIATION


# CLASSES
class Model_View_Store_Product(Model_View_Store):
    # categories: list # (str)
    # category_products: dict { category_enum_id: List[Product] }

    # Attributes
    @property
    def title(self):
        return 'Store Product'

    def __init__(self, id_permutation, id_currency, id_region_delivery, is_included_VAT, hash_page_current=Model_View_Store.HASH_PAGE_STORE_PRODUCT):
        # Constructor
        _m = 'Model_View_Store_Product.__init__'
        print(f'{_m}\nstarting...')
        super().__init__(hash_page_current=hash_page_current, id_currency=id_currency, id_region_delivery=id_region_delivery, is_included_VAT=is_included_VAT)
        print('supered')
        
        category_list = DataStore_Store_Base().get_many_product(Product_Filters(
            self.info_user['sub'], 
            True, '', False,
            True, '', False, False,
            False, str(id_permutation), False,
            True, '', False, False,
            False, str(id_region_delivery), False,
            False, str(id_currency), False,
            True, '', False
        )) # product_ids=str(id_product), permutation_ids=str(id_permutation))
        print('connection to db successful')
        # self.categories = categories
        # self.category_index = category_index
        if (category_list.get_count_categories() > 0):
            self.product = category_list.get_permutation_first()
        else:
            self.product = None
        print('selected permutation selected')
