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
from extensions import db, csrf, cors, mail, oauth
"""
from forms import Form_Contact, Form_Supplier, Form_Filters_Permutation, Form_Filters_Stock_Item
from models.model_view_base import Model_View_Base
from models.model_view_admin import Model_View_Admin
from models.model_view_home import Model_View_Home
from models.model_view_contact import Model_View_Contact
from models.model_view_services import Model_View_Services
from models.model_view_store_stock_items import Model_View_Store_Stock_Items
from models.model_view_store_supplier import Model_View_Store_Supplier
from models.model_view_store_product_permutation import Model_View_Store_Product_Permutations
from models.model_view_user import Model_View_User
from business_objects.store.product import Product, Filters_Product, Product_Permutation # , Product_Image_Filters, Resolution_Level_Enum
from business_objects.store.stock_item import Stock_Item, Stock_Item_Filters
from business_objects.user import User, User_Filters
from datastores.datastore_store_base import DataStore_Store
from helpers.helper_app import Helper_App
import lib.argument_validation as av
"""
from routing.core import routes_core
from routing.legal import routes_legal
from routing.store.product_category import routes_store_product_category
from routing.store.product_permutation import routes_store_product_permutation
from routing.store.stock_item import routes_store_stock_item
from routing.store.supplier import routes_store_supplier
from routing.user import routes_user
# external
from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session
# from flask_appconfig import AppConfig
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail, Message
from flask_wtf.csrf import CSRFProtect
from authlib.integrations.flask_client import OAuth
import os
import sys


sys.path.insert(0, os.path.dirname(__file__)) # Todo: why?


app = Flask(__name__)

# AppConfig(app)
app.config.from_object(app_config) # for db init with required keys
# app.config["config"] = app_config()

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
        server_metadata_url=f'https://{app.config['DOMAIN_AUTH0']}/.well-known/openid-configuration',
        api_base_url = f'https://{app.config['DOMAIN_AUTH0']}',
        authorize_url = f'https://{app.config['DOMAIN_AUTH0']}/authorize',
        access_token_url = f'https://{app.config['DOMAIN_AUTH0']}/oauth/token',
    )


app.register_blueprint(routes_core)
app.register_blueprint(routes_legal)
# app.register_blueprint(routes_store_product)
app.register_blueprint(routes_store_product_category)
app.register_blueprint(routes_store_product_permutation)
app.register_blueprint(routes_store_stock_item)
app.register_blueprint(routes_store_supplier)
app.register_blueprint(routes_user)
