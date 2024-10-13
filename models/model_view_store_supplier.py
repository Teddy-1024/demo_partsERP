"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Supplier View Model

Description:
Data model for supplier view page
"""

# internal
from models.model_view_base import Model_View_Base
from models.model_view_store import Model_View_Store
# from routes import bp_home
from lib import argument_validation as av
from forms.forms import Form_Supplier

# external

class Model_View_Store_Supplier(Model_View_Store):
    # Attributes
    form: Form_Supplier

    @property
    def title(self):
        return 'Supplier'
    
    """
    def __new__(cls, db, info_user, app, form):
        # Initialiser - validation
        _m = 'Model_View_Supplier.__new__'
        av.val_instance(form, 'form', _m, FlaskForm)
        return super(Model_View_Supplier, cls).__new__(cls, db, info_user, app)
    """
    def __init__(self,form, hash_page_current=Model_View_Base.HASH_PAGE_STORE_SUPPLIERS):
        super().__init__(hash_page_current=hash_page_current, form=form)
