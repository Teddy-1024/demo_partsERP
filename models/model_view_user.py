"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    User View Model

Description:
Data model for user view
"""

# internal
from datastores.datastore_user import DataStore_User
# from models.model_view_base import Model_View_Base
from models.model_view_store import Model_View_Store
# from routes import bp_home
# external
from typing import ClassVar

class Model_View_User(Model_View_Store):
    FLAG_ERROR_OAUTH: ClassVar[str] = 'error'
    FLAG_ERROR_DESCRIPTION_OAUTH: ClassVar[str] = 'error_description'
    FLAG_FIRSTNAME: ClassVar[str] = 'firstname'
    FLAG_SURNAME: ClassVar[str] = 'surname'
    FLAG_STATE_OAUTH: ClassVar[str] = 'state'
    # Attributes
    currencies: list = None
    regions: list = None
    users: list = None
    @property
    def title(self):
        return 'User'
    
    def __init__(self, hash_page_current=Model_View_Store.HASH_PAGE_USER_ACCOUNT):
        # Constructor
        super().__init__(hash_page_current=hash_page_current, form_filters_old = None)
        datastore_user = DataStore_User()
        self.currencies = datastore_user.get_many_currency()
        self.regions = datastore_user.get_many_region()
    