"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Helpers
Feature:    MySQL Database Helper

Notes: This architecture does not work with Flask-SQLAlchemy - db connection must be initialised with Flask app initialisation
"""

# internal

# external
from pydantic import BaseModel, ConfigDict
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import uuid

class Helper_DB_MySQL(BaseModel):
    app: Flask

    model_config = ConfigDict(arbitrary_types_allowed=True)

    def __init__(self, app):
        super().__init__(app=app)

    def get_db_connection(self):
        db = SQLAlchemy()
        db.init_app(self.app)
        with self.app.app_context():
            db.create_all()
            db.engine.url = self.app.config['SQLALCHEMY_DATABASE_URI']
        return db
    
    @staticmethod
    def create_guid_str():
        return str(uuid.uuid4())
    @staticmethod
    def create_guid():
        return uuid.uuid4().bytes