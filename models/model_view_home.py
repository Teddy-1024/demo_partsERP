"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Home View Model

Description:
Data model for home view
"""

# IMPORTS
# VARIABLE INSTANTIATION
# METHODS

# IMPORTS
# internal
from models.model_view_base import Model_View_Base
# from routes import bp_home
# external


# VARIABLE INSTANTIATION


# CLASSES
class Model_View_Home(Model_View_Base):
    # Attributes
    @property
    def title(self):
        return 'Home'
    
    def __init__(self, hash_page_current=Model_View_Base.HASH_PAGE_HOME):
        # Constructor
        super().__init__(hash_page_current=hash_page_current)
    