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
from models.model_view_base import Model_View_Base
# from routes import bp_home
# external
from typing import ClassVar

class Model_View_User(Model_View_Base):
    FLAG_ERROR_OAUTH: ClassVar[str] = 'error'
    FLAG_ERROR_DESCRIPTION_OAUTH: ClassVar[str] = 'error_description'
    FLAG_STATE_OAUTH: ClassVar[str] = 'state'
    # Attributes
    @property
    def title(self):
        return 'User'
    
    def __init__(self, hash_page_current=Model_View_Base.HASH_PAGE_USER_ACCOUNT):
        # Constructor
        super().__init__(hash_page_current=hash_page_current)
    