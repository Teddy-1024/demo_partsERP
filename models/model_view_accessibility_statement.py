"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Legal View Models
Feature:    Accessibility Statement View Model

Description:
Data model for accessibility statement view
"""

# internal
from models.model_view_base import Model_View_Base
# from routes import bp_home
# external

class Model_View_Accessibility_Statement(Model_View_Base):
    @property
    def title(self):
        return 'Accessibility Statement'
    def __init__(self, hash_page_current=Model_View_Base.HASH_PAGE_ACCESSIBILITY_STATEMENT):
        super().__init__(hash_page_current=hash_page_current)
    