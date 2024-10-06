"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Legal View Models
Feature:    Privacy Policy View Model

Description:
Data model for privacy policy view
"""

# internal
from models.model_view_base import Model_View_Base
# from routes import bp_home
# external

class Model_View_Privacy_Policy(Model_View_Base):
    @property
    def title(self):
        return 'Privacy Policy'
    def __init__(self, hash_page_current=Model_View_Base.HASH_PAGE_PRIVACY_POLICY):
        super().__init__(hash_page_current=hash_page_current)
    