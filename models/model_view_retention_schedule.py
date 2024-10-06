"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Legal View Models
Feature:    Retention Schedule View Model

Description:
Data model for retention schedule view
"""

# internal
from models.model_view_base import Model_View_Base
# from routes import bp_home
# external

class Model_View_Retention_Schedule(Model_View_Base):
    @property
    def title(self):
        return 'Retention Schedule'
    def __init__(self, hash_page_current=Model_View_Base.HASH_PAGE_DATA_RETENTION_SCHEDULE):
        super().__init__(hash_page_current=hash_page_current)
    