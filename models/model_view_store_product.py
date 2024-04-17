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
from datastores.datastore_store import DataStore_Store
# from routes import bp_home
from business_objects.product import Product, Product_Filters
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
        return 'Store Home'

    def __new__(cls, db, id_user, app, id_permutation, id_currency, id_region_delivery): # *args, **kwargs
        # Initialiser - validation
        _m = 'Model_View_Store_Product.__new__'
        print(f'{_m}\nstarting...')
        v_arg_type = 'class attribute'
        
        # av.val_instance(product, 'product', _m, Product, v_arg_type=v_arg_type)
        # av.val_int(id_product, 'id_product', _m, v_arg_type=v_arg_type)
        # av.val_int(id_permutation, 'id_permutation', _m, v_arg_type=v_arg_type)
        
        print(f'user id: {id_user.get("sub")}')
        print(f'ending')
        
        # return super().__new__(cls, *args, **kwargs) # Model_View_Store_Product, cls # , db, id_user, id_product) # , db, id_user)
        return super(Model_View_Store_Product, cls).__new__(cls, db, id_user, app, id_currency, id_region_delivery)
    
    def __init__(self, db, id_user, app, id_permutation, id_currency, id_region_delivery):
        # Constructor
        _m = 'Model_View_Store_Product.__init__'
        print(f'{_m}\nstarting...')
        super().__init__(db, id_user, app, id_currency, id_region_delivery)
        print('supered')
        print(f'user info: {self.info_user}')
        # print(f'user id: {self.info_user.get("sub")}')
        
        category_list = DataStore_Store(self.db, self.info_user).get_many_product_category(Product_Filters(
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
