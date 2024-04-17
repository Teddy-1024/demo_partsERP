"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Backend
Feature:    Initialisation

Description:
Initializes the Flask application.
Initializes any extensions used in the project.
"""

from flask import Flask

app = Flask(__name__)
app.config.from_object('config')

# from app import routes
# import business_objects, lib, models
