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

class Model_View_Services(Model_View_Base):
    # Attributes
    @property
    def title(self):
        return 'Services'
    
    def __init__(self, app, db):
        # Constructor
        super().__init__(app=app, db=db)
    