"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Services View Model

Description:
Data model for services view
"""

# internal
from models.model_view_base import Model_View_Base
# from routes import bp_home
# external
from typing import ClassVar

class Model_View_Services(Model_View_Base):
    FLAG_FAQ: ClassVar[str] = 'faq'
    FLAG_SERVICES: ClassVar[str] = 'services'
    FLAG_TECHNOLOGIES: ClassVar[str] = 'technologies'

    @property
    def title(self):
        return 'Services'
    
    def __init__(self, hash_page_current=Model_View_Base.HASH_PAGE_SERVICES):
        super().__init__(hash_page_current=hash_page_current)
    