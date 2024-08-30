"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: View Models
Feature:    Store Permutations View Model

Description:
Data model for store permutations view
"""

# internal
from models.model_view_base import Model_View_Base

# external
from pydantic import BaseModel
from typing import ClassVar

class Model_View_Admin(Model_View_Base):
    
    def __init__(self, hash_page_current, **kwargs):
        _m = 'Model_View_Admin.__init__'
        print(f'{_m}\nstarting')
        super().__init__(hash_page_current=hash_page_current, **kwargs)