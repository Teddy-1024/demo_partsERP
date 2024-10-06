"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Helpers
Feature:    PostgreSQL Database Helper
"""

# internal

# external
import psycopg2
# from psycopg2 import sql
from pydantic import BaseModel
from flask import Flask

class Helper_DB_PostgreSQL(BaseModel):

    
    app: Flask

    def __init__(self, app):
        super().__init__(app=app)
        # self.app = app

    def get_db_connection(self):
        return psycopg2.connect(
            dbname = self.app.config['DB_NAME'],
            user = self.app.config['DB_USER'],
            password = self.app.config['DB_PASSWORD'],
            host = self.app.config['DB_HOST'],
            port = self.app.config['DB_PORT']
        )