"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Core View Models
Feature:    Home View Model

Description:
Data model for home view
"""

# internal
from models.model_view_base import Model_View_Base
# from routes import bp_home
# external

class Model_View_Home(Model_View_Base):
    @property
    def title(self):
        return 'Home'
    def __init__(self, hash_page_current=Model_View_Base.HASH_PAGE_HOME):
        super().__init__(hash_page_current=hash_page_current)
    