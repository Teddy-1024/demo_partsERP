"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: App General
Feature:    App

Description:
Initializes the Flask application, sets the configuration based on the environment, and defines two routes (/ and /about) that render templates with the specified titles.
"""

# internal
from config import app_config, Config
from controllers.core import routes_core
from controllers.legal import routes_legal
from controllers.store.store import routes_store
from controllers.store.manufacturing_purchase_order import routes_store_manufacturing_purchase_order
from controllers.store.product import routes_store_product
from controllers.store.product_category import routes_store_product_category
from controllers.store.product_permutation import routes_store_product_permutation
from controllers.store.product_variation import routes_store_product_variation
from controllers.store.stock_item import routes_store_stock_item
from controllers.store.supplier import routes_store_supplier
from controllers.store.supplier_purchase_order import routes_store_supplier_purchase_order
from controllers.user import routes_user
from extensions import db, csrf, mail, oauth
from helpers.helper_app import Helper_App
# external
from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session
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

sys.path.insert(0, os.path.dirname(__file__))

app = Flask(__name__)

app.config.from_object(app_config)
app.app_config = app_config

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

@app.before_request
def make_session_permanent():
    session.permanent = True

csrf = CSRFProtect()
csrf.init_app(app)

cors = CORS(app, resources={
    r"/static/*": {
        "origins": [app.config["URL_HOST"]],
        "methods": ["GET"],
        "max_age": 3600
    }
})
cors.init_app(app)

db.init_app(app)

oauth.init_app(app)

mail.init_app(app)

with app.app_context():
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
app.register_blueprint(routes_store_product_variation)
app.register_blueprint(routes_store_stock_item)
app.register_blueprint(routes_store_supplier)
app.register_blueprint(routes_store_supplier_purchase_order)
app.register_blueprint(routes_user)



@app.template_filter('console_log')
def console_log(value):
    Helper_App.console_log(value)
    return value

@app.after_request
def add_cache_headers(response):
    if request.path.startswith('/static/'):
        response.headers['Cache-Control'] = 'public, max-age=31536000'
    else:
        response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
    return response