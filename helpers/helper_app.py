"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Helpers
Feature:    App Helper
"""

# internal

# external
from pydantic import BaseModel, ConfigDict
from flask import current_app
# from flask_sqlalchemy import SQLAlchemy


class Helper_App(BaseModel):

    @staticmethod
    def get_request_data(request):
        Helper_App.console_log(f'request={request}')
        data = {}
        try:
            data = request.json
        except:
            try:
                data = request.data
            except:
                try:
                    data = request.form
                except:
                    pass
        Helper_App.console_log(f'data={data}')
        return data
    
    @staticmethod
    def console_log(message):
        if current_app.app_config.is_development:
            print(message)
        elif current_app.app_config.is_production:
            current_app.logger.info(message)