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
# from routes import bp_home
from lib import argument_validation as av
from forms import Form_Supplier

# external
from flask_wtf import FlaskForm
from abc import abstractproperty
from pydantic import BaseModel

class Model_View_Supplier(Model_View_Base):
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
    def __init__(self, db, info_user, app, form):
        # Constructor
        super().__init__(db, info_user, app)
        BaseModel.__init__(self, form=form)
        # self.form = form
