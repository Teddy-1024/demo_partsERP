"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Contact View Model

Description:
Data model for contact view
"""

# IMPORTS
# VARIABLE INSTANTIATION
# METHODS

# IMPORTS
# internal
from models.model_view_base import Model_View_Base
# from routes import bp_home
from lib import argument_validation as av
# external
from flask_wtf import FlaskForm
from abc import abstractproperty

# VARIABLE INSTANTIATION


# CLASSES
class Model_View_Contact(Model_View_Base):
    # Attributes
    ID_EMAIL = 'email'
    ID_MESSAGE = 'msg'
    ID_NAME = 'name'

    @property
    def title(self):
        return 'Contact'
    
    def __new__(cls, db, info_user, app, form):
        # Initialiser - validation
        _m = 'Model_View_Contact.__new__'
        av.val_instance(form, 'form', _m, FlaskForm)
        return super(Model_View_Contact, cls).__new__(cls, db, info_user, app)
    
    def __init__(self, db, info_user, app, form):
        # Constructor
        super().__init__(db, info_user, app)
        self.form = form
