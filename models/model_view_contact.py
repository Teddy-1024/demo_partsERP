"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Contact View Model

Description:
Data model for contact view
"""

# internal
from models.model_view_base import Model_View_Base
# from routes import bp_home
from lib import argument_validation as av
from forms.forms import Form_Contact
# external
from flask_wtf import FlaskForm
from abc import abstractproperty
from pydantic import BaseModel

class Model_View_Contact(Model_View_Base):
    # Attributes
    ID_EMAIL: str = 'email'
    ID_MESSAGE: str = 'msg'
    ID_NAME: str = 'name'

    form_contact: Form_Contact

    @property
    def title(self):
        return 'Contact'
    
    def __init__(self, form_contact, hash_page_current=Model_View_Base.HASH_PAGE_CONTACT, **kwargs):
        super().__init__(hash_page_current=hash_page_current, form_contact=form_contact, **kwargs)
        # self.form = form
