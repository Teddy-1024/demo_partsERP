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
from forms import Form_Contact, Form_Supplier, Form_Filters_Permutations
from models.model_view_base import Model_View_Base
from models.model_view_home import Model_View_Home
from models.model_view_contact import Model_View_Contact
from models.model_view_supplier import Model_View_Supplier
from models.model_view_store_permutations import Model_View_Store_Permutations
from business_objects.product import Product, Product_Filters # , Product_Image_Filters, Resolution_Level_Enum
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

app.DB_NAME = Config.DB_NAME
app.DB_USER = Config.DB_USER
app.DB_PASSWORD = Config.DB_PASSWORD
app.DB_HOST = Config.DB_HOST
# app.DB_PORT = Config.DB_PORT

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

db = SQLAlchemy()
db.init_app(app)
with app.app_context():
    db.create_all()
    db.engine.url = app.config.SQLALCHEMY_DATABASE_URI

mail = Mail(app) # ToDo: move to helper

# METHODS
sys.path.insert(0, os.path.dirname(__file__)) # Todo: why?

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
        model = Model_View_Home(app)
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
            mailItem = Message("PARTS Website Contact Us Message", recipients=[app.config['MAIL_CONTACT_PUBLIC']])
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

# shop management
@app.route('/supplier', methods=['GET'])
def supplier():
    try:
        data = request.json
    except:
        data = {}
    print(f'data={data}')
    form_data = data[Model_View_Supplier.key_form]
    print(f'form_data: {form_data}')
    form = Form_Supplier(**form_data)
    print('form acquired')
    print(form.__repr__)
    if form.validate_on_submit():
        print('valid form')
        # model = input_JSON_basket(model, data)
        # if not logged in:
        try:
            model = Model_View_Supplier(db, get_info_user(), app, form)
            # print('importing basket')
            # model.import_JSON_basket(data)
            model.get_basket(data)
            permutation_id, quantity = model.import_JSON_basket_item(data, form)
            model.basket_item_edit(permutation_id, quantity, False) # new_basket = 
        except Exception as e:
            return jsonify({'status': 'failure', 'Message': f'Bad data received by controller.\n{e}'})
        # return jsonify(Success = True, data = { html_block: render_template(), Model_View_Store.key_basket: new_basket })
        # html_block = render_template('_block_store_basket.html', model = model)
        # print(f'html_block:\n{html_block}')
        # return jsonify(Success = True, data = { 'html_block': html_block, 'basket': {'items': model.basket.to_json_list()}})
        return render_template('_page_supplier.html', model = model)
    return jsonify({'status': 'failure', 'Message': f'Invalid supplier details.\n{form.errors}'})

# product permutations
@app.route('/store/permutations', methods=['GET'])
def permutations_get():
    filters = Product_Filters.get_default()
    model = Model_View_Store_Permutations(app=app, db=db, filters_product=filters)
    return render_template('_page_store_product.html', model = model)

@app.route('/store/permutations', methods=['POST'])
def permutations_post():
    try:
        data = request.json
    except:
        data = {}
    print(f'data={data}')
    form_filters = None
    try:
        form_data = data[Model_View_Store_Permutations.KEY_FORM_FILTERS]
        print(f'form_data: {form_data}')
        form_filters = Form_Filters_Permutations(**form_data)
        print('form acquired')
        print(form_filters.__repr__)
        print('valid form')
        filters_form = Product_Filters.from_form(form_filters)
        model = Model_View_Store_Permutations(app=app, db=db, filters_product=filters_form)
        # return render_template('_page_store_product.html', model = model)
        return jsonify({'status': 'success', 'data': model.category_list.to_list_rows_permutation()})
    except Exception as e:
        return jsonify({'status': 'failure', 'Message': f'Bad data received by controller.\n{e}'})
    
    

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

# Onload
if __name__ == '__main__':
    app.run()
    # app.run(debug=True, host="0.0.0.0", port=5000)