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

    """
    def __new__(cls, db, info_user, app):
        # Initialiser - validation
        print(f'info_user: {info_user}')
        return super(Model_View_Home, cls).__new__(cls, db, info_user, app)
    """
    def __init__(self, app):
        # Constructor
        super().__init__(app)
    