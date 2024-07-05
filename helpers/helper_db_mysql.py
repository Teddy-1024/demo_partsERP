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
from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session
from flask_sqlalchemy import SQLAlchemy


class Helper_DB_MySQL(BaseModel):
    app: Flask

    model_config = ConfigDict(arbitrary_types_allowed=True)

    def __init__(self, app):
        super().__init__(app=app)
        # self.app = app

    def get_db_connection(self):
        db = SQLAlchemy()
        db.init_app(self.app)
        with self.app.app_context():
            db.create_all()
            db.engine.url = self.app.config.SQLALCHEMY_DATABASE_URI
        return db