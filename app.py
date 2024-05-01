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
from forms import Form_Contact
from models.model_view_base import Model_View_Base
from models.model_view_home import Model_View_Home
from models.model_view_contact import Model_View_Contact
from business_objects.product import Product # , Product_Image_Filters, Resolution_Level_Enum
import lib.argument_validation as av
# external
from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail, Message
from flask_wtf.csrf import CSRFProtect
import stripe
import json
from dotenv import load_dotenv, find_dotenv
import os
import sys
from urllib.parse import quote_plus, urlencode
from authlib.integrations.flask_client import OAuth
import jwt


# VARIABLE INSTANTIATION
app = Flask(__name__)

csrf = CSRFProtect(app)
CORS(app)
# app.register_blueprint(bp_home, url_prefix=''

# app.config.from_object(app_config)
# app.app_config = app_config
app.DEBUG = Config.DEBUG
app.TESTING = Config.TESTING
app.SECRET_KEY = "007cfbdaaf6d1eb27209720e8a5fc8ba0a334ae0be6fcac132b0a471549cde7c" # Config.SECRET_KEY
app.config['SECRET_KEY'] = app.SECRET_KEY

app.SQLALCHEMY_DATABASE_URI = Config.SQLALCHEMY_DATABASE_URI
app.SQLALCHEMY_TRACK_MODIFICATIONS = Config.SQLALCHEMY_TRACK_MODIFICATIONS
app.ID_AUTH0_CLIENT = Config.ID_AUTH0_CLIENT
app.ID_AUTH0_CLIENT_SECRET = Config.ID_AUTH0_CLIENT_SECRET
app.DOMAIN_AUTH0 = Config.DOMAIN_AUTH0
app.ID_TOKEN_USER = Config.ID_TOKEN_USER

app.config.SQLALCHEMY_DATABASE_URI = Config.SQLALCHEMY_DATABASE_URI
app.config.SQLALCHEMY_TRACK_MODIFICATIONS = Config.SQLALCHEMY_TRACK_MODIFICATIONS
app.config.ID_AUTH0_CLIENT = Config.ID_AUTH0_CLIENT
app.config.ID_AUTH0_CLIENT_SECRET = Config.ID_AUTH0_CLIENT_SECRET
app.config.DOMAIN_AUTH0 = Config.DOMAIN_AUTH0
app.config.ID_TOKEN_USER = Config.ID_TOKEN_USER

app.config['SQLALCHEMY_DATABASE_URI'] = Config.SQLALCHEMY_DATABASE_URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = Config.SQLALCHEMY_TRACK_MODIFICATIONS
app.config['ID_AUTH0_CLIENT'] = Config.ID_AUTH0_CLIENT
app.config['ID_AUTH0_CLIENT_SECRET'] = Config.ID_AUTH0_CLIENT_SECRET
app.config['DOMAIN_AUTH0'] = Config.DOMAIN_AUTH0
app.config['ID_TOKEN_USER'] = Config.ID_TOKEN_USER

app.MAIL_DEBUG = True
app.MAIL_SERVER = Config.MAIL_SERVER
app.MAIL_PORT = Config.MAIL_PORT
app.MAIL_USE_TLS = Config.MAIL_USE_TLS
app.MAIL_USE_SSL = Config.MAIL_USE_SSL
app.MAIL_USERNAME = Config.MAIL_USERNAME
app.MAIL_PASSWORD = Config.MAIL_PASSWORD
app.MAIL_DEFAULT_SENDER = Config.MAIL_DEFAULT_SENDER

app.config.MAIL_DEBUG = True
app.config.MAIL_SERVER = Config.MAIL_SERVER
app.config.MAIL_PORT = Config.MAIL_PORT
app.config.MAIL_USE_TLS = Config.MAIL_USE_TLS
app.config.MAIL_USE_SSL = Config.MAIL_USE_SSL
app.config.MAIL_USERNAME = Config.MAIL_USERNAME
app.config.MAIL_PASSWORD = Config.MAIL_PASSWORD
app.config.MAIL_DEFAULT_SENDER = Config.MAIL_DEFAULT_SENDER

app.config['MAIL_DEBUG'] = True
app.config['MAIL_SERVER'] = Config.MAIL_SERVER
app.config['MAIL_PORT'] = Config.MAIL_PORT
app.config['MAIL_USE_TLS'] = Config.MAIL_USE_TLS
app.config['MAIL_USE_SSL'] = Config.MAIL_USE_SSL
app.config['MAIL_USERNAME'] = Config.MAIL_USERNAME
app.config['MAIL_PASSWORD'] = Config.MAIL_PASSWORD
app.config['MAIL_DEFAULT_SENDER'] = Config.MAIL_DEFAULT_SENDER
app.config['MAIL_CONTACT_PUBLIC'] = Config.MAIL_CONTACT_PUBLIC

# app.RECAPTCHA_PUBLIC_KEY = Config.RECAPTCHA_PUBLIC_KEY
app.config['RECAPTCHA_PUBLIC_KEY'] = Config.RECAPTCHA_PUBLIC_KEY
# app.RECAPTCHA_PRIVATE_KEY = Config.RECAPTCHA_PRIVATE_KEY
app.config['RECAPTCHA_PRIVATE_KEY'] = Config.RECAPTCHA_PRIVATE_KEY

# db = SQLAlchemy(app)
app.config['SQLALCHEMY_DATABASE_URI'] = Config.SQLALCHEMY_DATABASE_URI
db = SQLAlchemy()
db.init_app(app)
with app.app_context():
    db.create_all()
    db.engine.url = app.config.SQLALCHEMY_DATABASE_URI
    
"""
oauth = OAuth(app)
oauth.register(
    "auth0",
    client_id = app.ID_AUTH0_CLIENT,
    client_secret = app.ID_AUTH0_CLIENT_SECRET, # =env.get("AUTH0_CLIENT_SECRET"),
    client_kwargs={
        "scope": "openid profile email",
    },
    server_metadata_url=f'https://{app.DOMAIN_AUTH0}/.well-known/openid-configuration'
)
# session[app.ID_TOKEN_USER] = {'userinfo': {'sub': ''}}
"""

mail = Mail(app)

# METHODS
sys.path.insert(0, os.path.dirname(__file__))

@app.route('/hello')
def hello():
    
    return "Hello, World!" + f"{app.errors}\n{app.config.SQLALCHEMY_DATABASE_URI == app.SQLALCHEMY_DATABASE_URI}"
    
@app.route('/goodbye')
def goodbye():
    return "Goodbye, cruel World!"

"""
@app.route('/public_html/403.shtml', methods=['GET'])
def forbidden():
    return send_from_directory('/home/partsltd/public_html', '403.shtml')
"""

def application(environ, start_response):
    start_response('200 OK', [('Content-Type', 'text/plain')])
    message = 'It works!\n'
    version = 'Python %s\n' % sys.version.split()[0]
    response = '\n'.join([message, version])
    return [response.encode()]


# ROUTING
@app.route('/', methods=['GET'])
def home():
    try:
        model = Model_View_Home(db, get_info_user(), app)
        html_body = render_template('_page_home.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
    
@app.route('/contact', methods=['GET'])
def contact():
    try:
        form = Form_Contact()
        model = Model_View_Contact(db, get_info_user(), app, form)
        html_body = render_template('_page_contact.html', model = model)
    except Exception as e:
        return jsonify(error=str(e)), 403
    return html_body

@app.route('/contact', methods=['POST'])
def contact_post():
    try:
        form = Form_Contact()
        if form.validate_on_submit():
            # Handle form submission
            email = form.email.data
            CC = form.CC.data # not in use
            name = form.name.data
            message = form.message.data
            # send email
            mailItem = Message("PARTS Website Contact Us Message", recipients=[app.config['MAIL_DEFAULT_SENDER']])
            mailItem.body = f"Dear Lord Edward Middleton-Smith,\n\n{message}\n\nKind regards,\n{name}\n{email}"
            mail.send(mailItem)
            return "Submitted."
        return "Invalid. Failed to submit."
        # html_body = render_template('_page_contact.html', model = model)
    except Exception as e:
        return jsonify(error=str(e)), 403

@app.route('/services', methods=['GET', 'POST'])
# @app.route('/public_html/services', methods=['GET', 'POST'])
def services():
    try:
        model = Model_View_Home(db, get_info_user(), app)
        html_body =  render_template('_page_services.html', model = model)
    except Exception as e:
        return jsonify(error=str(e)), 403
    return html_body

# snore
@app.route('/license', methods=['GET'])
def license():
    try:
        model = Model_View_Home(db, get_info_user(), app)
        html_body = render_template('_page_license.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
@app.route('/accessibility-statement', methods=['GET'])
def accessibility_statement():
    try:
        model = Model_View_Home(db, get_info_user(), app)
        html_body = render_template('_page_accessibility_statement.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
@app.route('/accessibility-report', methods=['GET'])
def accessibility_report():
    try:
        model = Model_View_Home(db, get_info_user(), app)
        html_body = render_template('_page_accessibility_report.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
@app.route('/retention-schedule', methods=['GET'])
def retention_schedule():
    try:
        model = Model_View_Home(db, get_info_user(), app)
        html_body = render_template('_page_retention_schedule.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
@app.route('/privacy-notice', methods=['GET'])
def privacy_notice():
    try:
        model = Model_View_Home(db, get_info_user(), app)
        html_body = render_template('_page_privacy_notice.html', model = model)
    except Exception as e:
        return str(e)
    return html_body

def get_info_user():
    try:
        return session[app.ID_TOKEN_USER].get('userinfo') # .get('sub')
    except:
        return {'sub': ''}

# Onload
if __name__ == '__main__':
    app.run()
    # app.run(debug=True, host="0.0.0.0", port=5000)