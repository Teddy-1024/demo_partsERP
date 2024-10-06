"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Admin Home View Model

Description:
Data model for admin home view
"""

# internal
from models.model_view_admin import Model_View_Admin

# external
from pydantic import BaseModel
from typing import ClassVar

class Model_View_Admin_Home(Model_View_Admin):
    @property
    def title(self):
        return 'Admin Home'
    
    def __init__(self, hash_page_current=Model_View_Admin.HASH_PAGE_ADMIN_HOME):
        super().__init__(hash_page_current=hash_page_current)
    