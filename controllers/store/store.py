"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: App Routing
Feature:    Store Routes

Description:
Initializes the Flask application, sets the configuration based on the environment, and defines two routes (/ and /about) that render templates with the specified titles.
"""

# IMPORTS
# internal
from models.model_view_store import Model_View_Store
# external
from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session, Blueprint, current_app
from extensions import db, oauth
from urllib.parse import quote_plus, urlencode
from authlib.integrations.flask_client import OAuth
from authlib.integrations.base_client import OAuthError
from urllib.parse import quote, urlparse, parse_qs

routes_store = Blueprint('routes_store', __name__)

@routes_store.route(Model_View_Store.HASH_SCRIPTS_SECTION_STORE, methods=['GET'])
def scripts_section_store():
    hash_page_current = request.args.get('hash_page_current', default = Model_View_Store.HASH_SCRIPTS_SECTION_STORE, type = str)
    model = Model_View_Store(hash_page_current=hash_page_current)
    return render_template('js/sections/store.js', model = model)