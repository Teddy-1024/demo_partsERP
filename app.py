"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: App General
Feature:    App

Description:
Initializes the Flask application, sets the configuration based on the environment, and defines two routes (/ and /about) that render templates with the specified titles.
"""

# IMPORTS
# VARIABLE INSTANTIATION
# METHODS

# IMPORTS
# internal
from config import app_config, Config
# from routes import bp_home
"""
from forms import Form_Contact, Form_Supplier, Form_Filters_Permutation, Filters_Stock_Item
from models.model_view_base import Model_View_Base
from models.model_view_admin import Model_View_Admin
from models.model_view_home import Model_View_Home
from models.model_view_contact import Model_View_Contact
from models.model_view_services import Model_View_Services
from models.Model_View_Store_Stock_Item import Model_View_Store_Stock_Item
from models.model_view_store_supplier import Model_View_Store_Supplier
from models.model_view_store_product_permutation import Model_View_Store_Product_Permutations
from models.model_view_user import Model_View_User
from business_objects.store.product import Product, Parameters_Product, Product_Permutation # , Product_Image_Filters, Resolution_Level_Enum
from business_objects.store.stock_item import Stock_Item
from business_objects.user import User, User_Filters
from datastores.datastore_store_base import DataStore_Store
from helpers.helper_app import Helper_App
import lib.argument_validation as av
"""
from controllers.core import routes_core
from controllers.legal import routes_legal
from controllers.store.store import routes_store
from controllers.store.manufacturing_purchase_order import routes_store_manufacturing_purchase_order
from controllers.store.product import routes_store_product
from controllers.store.product_category import routes_store_product_category
from controllers.store.product_permutation import routes_store_product_permutation
from controllers.store.stock_item import routes_store_stock_item
from controllers.store.supplier import routes_store_supplier
from controllers.store.supplier_purchase_order import routes_store_supplier_purchase_order
from controllers.user import routes_user
from extensions import db, csrf, cors, mail, oauth
from helpers.helper_app import Helper_App
# external
from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session
# from flask_appconfig import AppConfig
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail, Message
from flask_wtf.csrf import CSRFProtect
from werkzeug.exceptions import HTTPException
from authlib.integrations.flask_client import OAuth
import os
import sys
from logging.handlers import RotatingFileHandler
import traceback
import logging

sys.path.insert(0, os.path.dirname(__file__)) # Todo: why?


app = Flask(__name__)

# AppConfig(app)
app.config.from_object(app_config) # for db init with required keys
# app.config["config"] = app_config()

# logging
handler = RotatingFileHandler('app.log', maxBytes=10000, backupCount=3)
handler.setLevel(logging.DEBUG)
app.logger.addHandler(handler)

@app.errorhandler(Exception)
def internal_server_error(error):
    if isinstance(error, HTTPException) and error.code == 404:
        return "Not Found", 404

    app.logger.error('Server Error: %s', (error))
    app.logger.error('Request: %s %s %s %s %s',
                     request.remote_addr,
                     request.method,
                     request.scheme,
                     request.full_path,
                     request.headers)
    app.logger.error('Request data: %s', request.get_data())
    app.logger.error('Traceback: %s', traceback.format_exc())
    return "Internal Server Error", 500



"""
csrf = CSRFProtect()
cors = CORS()
db = SQLAlchemy()
mail = Mail()
oauth = OAuth()
"""

csrf.init_app(app)
cors.init_app(app)
db.init_app(app)
mail.init_app(app)
oauth.init_app(app)

with app.app_context():
    # config = app.config["config"]
    db.create_all()
    db.engine.url = app.config['SQLALCHEMY_DATABASE_URI']

    oauth.register(
        "auth0",
        client_id = app.config['ID_AUTH0_CLIENT'],
        client_secret = app.config['ID_AUTH0_CLIENT_SECRET'],
        client_kwargs={
            "scope": "openid profile email",
        },
        server_metadata_url=f'https://{app.config["DOMAIN_AUTH0"]}/.well-known/openid-configuration',
        api_base_url = f'https://{app.config["DOMAIN_AUTH0"]}',
        authorize_url = f'https://{app.config["DOMAIN_AUTH0"]}/authorize',
        access_token_url = f'https://{app.config["DOMAIN_AUTH0"]}/oauth/token',
    )


app.register_blueprint(routes_core)
app.register_blueprint(routes_legal)
app.register_blueprint(routes_store)
app.register_blueprint(routes_store_manufacturing_purchase_order)
app.register_blueprint(routes_store_product)
app.register_blueprint(routes_store_product_category)
app.register_blueprint(routes_store_product_permutation)
app.register_blueprint(routes_store_stock_item)
app.register_blueprint(routes_store_supplier)
app.register_blueprint(routes_store_supplier_purchase_order)
app.register_blueprint(routes_user)



@app.template_filter('console_log')
def console_log(value):
    Helper_App.console_log(value)
    return value