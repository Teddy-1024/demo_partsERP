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
from forms import Form_Contact, Form_Supplier, Form_Filters_Permutation, Form_Filters_Stock_Item
from models.model_view_base import Model_View_Base
from models.model_view_home import Model_View_Home
from models.model_view_contact import Model_View_Contact
from models.model_view_services import Model_View_Services
from models.model_view_store_stock_item import Model_View_Store_Stock_Item
from models.model_view_supplier import Model_View_Supplier
from models.model_view_store_permutation import Model_View_Store_Permutation
from models.model_view_user import Model_View_User
from business_objects.product import Product, Product_Filters, Product_Permutation # , Product_Image_Filters, Resolution_Level_Enum
from business_objects.stock_item import Stock_Item, Stock_Item_Filters
from business_objects.user import User, User_Filters
from datastores.datastore_store import DataStore_Store
from helpers.helper_app import Helper_App
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
from authlib.integrations.base_client import OAuthError
import jwt
from urllib.parse import quote, urlparse, parse_qs


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
app.URL_HOST = Config.URL_HOST

app.config.SQLALCHEMY_DATABASE_URI = Config.SQLALCHEMY_DATABASE_URI
app.config.SQLALCHEMY_TRACK_MODIFICATIONS = Config.SQLALCHEMY_TRACK_MODIFICATIONS
app.config.ID_AUTH0_CLIENT = Config.ID_AUTH0_CLIENT
app.config.ID_AUTH0_CLIENT_SECRET = Config.ID_AUTH0_CLIENT_SECRET
app.config.DOMAIN_AUTH0 = Config.DOMAIN_AUTH0
app.config.ID_TOKEN_USER = Config.ID_TOKEN_USER
app.config.URL_HOST = Config.URL_HOST
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

oauth = OAuth(app)
oauth.register(
    "auth0",
    client_id = app.ID_AUTH0_CLIENT,
    client_secret = app.ID_AUTH0_CLIENT_SECRET, # =env.get("AUTH0_CLIENT_SECRET"),
    client_kwargs={
        "scope": "openid profile email",
    },
    server_metadata_url=f'https://{app.DOMAIN_AUTH0}/.well-known/openid-configuration',
    api_base_url = f'https://{app.DOMAIN_AUTH0}',
    authorize_url = f'https://{app.DOMAIN_AUTH0}/authorize',
    access_token_url = f'https://{app.DOMAIN_AUTH0}/oauth/token',
)
# session[app.ID_TOKEN_USER] = {'userinfo': {'sub': ''}}


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
        model = Model_View_Home(app, db)
        print('nips')
        html_body = render_template('_page_home.html', model = model)
    except Exception as e:
        return jsonify(error=str(e)), 403
    return html_body
    
@app.route('/contact', methods=['GET'])
def contact():
    try:
        form = Form_Contact()
        model = Model_View_Contact(app, db, form)
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
        model = Model_View_Services(app, db)
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
            model = Model_View_Supplier(app, db, form)
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
@app.route('/store/permutation', methods=['GET'])
def permutation():
    filters = Product_Filters.get_default()
    model = Model_View_Store_Permutation(app=app, db=db, filters_product=filters)
    return render_template('_page_store_product_permutation.html', model = model)

@app.route('/store/permutation_filter', methods=['POST'])
def permutation_filter():
    data = Helper_App.get_request_data(request)
    form_filters = None
    try:
        form_filters = get_Form_Filters_Permutation(data)
        if not form_filters.validate_on_submit():
            return jsonify({'status': 'failure', 'Message': f'Form invalid.\n{form_filters.errors}'})
        # ToDo: manually validate category, product
        filters_form = Product_Filters.from_form(form_filters)
        model = Model_View_Store_Permutation(app=app, db=db, filters_product=filters_form)
        return jsonify({'status': 'success', 'Success': True, 'data': model.category_list.to_list_rows_permutation()})
    except Exception as e:
        return jsonify({'status': 'failure', 'Message': f'Bad data received by controller.\n{e}'})

def get_Form_Filters_Permutation(data_request):
    data_form = data_request[Model_View_Store_Permutation.KEY_FORM]
    form_filters = Form_Filters_Permutation(**data_form)
    form_filters.is_out_of_stock.data = av.input_bool(data_form['is_out_of_stock'], 'is_out_of_stock', 'permutations_post')
    return form_filters

@app.route('/store/permutation_save', methods=['POST'])
def permutation_save():
    data = Helper_App.get_request_data(request)
    form_filters = None
    try:
        form_filters = get_Form_Filters_Permutation(data)
        if not form_filters.validate_on_submit():
            return jsonify({'status': 'failure', 'Message': f'Filters form invalid.\n{form_filters.errors}'})
        
        permutations = data[Model_View_Store_Permutation.KEY_PERMUTATIONS]
        if len(permutations) == 0:
            return jsonify({'status': 'failure', 'Message': f'No permutations.'})
        objsPermutation = []
        for permutation in permutations:
            objsPermutation.append(Product_Permutation.from_json(permutation))

        # ToDo: manually validate category, product
        filters_form = Product_Filters.from_form(form_filters)
        model_save = Model_View_Store_Permutation(app=app, db=db, filters_product=filters_form)
        model_save.save_permutations(data.comment, objsPermutation)

        model_return = Model_View_Store_Permutation(app=app, db=db, filters_product=filters_form)
        return jsonify({'status': 'success', 'Success': True, 'data': model_return.category_list.to_list_rows_permutation()})
    except Exception as e:
        return jsonify({'status': 'failure', 'Message': f'Bad data received by controller.\n{e}'})
    
# stock
@app.route('/store/stock_item', methods=['GET'])
def stock():
    filters = Stock_Item_Filters.get_default()
    model = Model_View_Store_Stock_Item(app=app, db=db, filters_stock_item=filters)
    return render_template('_page_store_stock_item.html', model = model)

@app.route('/store/stock_item_filter', methods=['POST'])
def stock_filter():
    data = Helper_App.get_request_data(request)
    form_filters = None
    try:
        form_filters = get_form_filters_stock_items(data)
        if not form_filters.validate_on_submit():
            return jsonify({'status': 'failure', 'Message': f'Form invalid.\n{form_filters.errors}'})
        # ToDo: manually validate category, product
        filters_form = Stock_Item_Filters.from_form(form_filters)
        model = Model_View_Store_Stock_Item(app=app, db=db, filters_stock_item=filters_form)
        return jsonify({'status': 'success', 'Success': True, 'data': model.category_list.to_list_rows_permutation()})
    except Exception as e:
        return jsonify({'status': 'failure', 'Message': f'Bad data received by controller.\n{e}'})

def get_form_filters_stock_items(data_request):
    data_form = data_request[Model_View_Store_Stock_Item.KEY_FORM]
    form_filters = Form_Filters_Stock_Item(**data_form)
    form_filters.is_out_of_stock.data = av.input_bool(data_form['is_out_of_stock'], 'is_out_of_stock', 'permutations_post')
    return form_filters

@app.route('/store/stock_item_save', methods=['POST'])
def stock_save():
    data = Helper_App.get_request_data(request)
"""
    form_filters = None
    try:
        form_filters = get_form_filters_stock_items(data)
        if not form_filters.validate_on_submit():
            return jsonify({'status': 'failure', 'Message': f'Filters form invalid.\n{form_filters.errors}'})
        
        stock_items = data[Model_View_Store_Stock.KEY_PERMUTATIONS]
        print(f'stock_items: {stock_items}')
        if len(stock_items) == 0:
            return jsonify({'status': 'failure', 'Message': f'No stock items.'})
        objsStockItem = []
        for stock_item in stock_items:
            objsStockItem.append(Product_Permutation.from_json(stock_item))
        print(f'objsStockItem: {objsStockItem}')

        # ToDo: manually validate category, product
        filters_form = Stock_Filters.from_form(form_filters)
        model_save = Model_View_Store_Stock(app=app, db=db, filters_product=filters_form)
        model_save.save_stock_items(data.comment, objsPermutation)

        model_return = Model_View_Store_Stock(app=app, db=db, filters_product=filters_form)
        return jsonify({'status': 'success', 'Success': True, 'data': model_return.category_list.to_list_rows_permutation()})
    except Exception as e:
        return jsonify({'status': 'failure', 'Message': f'Bad data received by controller.\n{e}'})
"""


# User authentication
@app.route("/login", methods=['POST'])
def login():
    try:
        data = request.json
    except:
        data = {}
    print(f'data={data}')
    # callback_login = F'{Model_View_Base.HASH_CALLBACK_LOGIN}{data.get(Model_View_Base.KEY_CALLBACK, Model_View_Base.HASH_PAGE_HOME)}'
    
    # encoded_path = quote(data.get(Model_View_Base.KEY_CALLBACK, Model_View_Base.HASH_PAGE_HOME))
    uri_redirect = url_for('login_callback', _external=True) # , subpath=encoded_path
    
    # uri_redirect = f'{app.URL_HOST}/login_callback?subpath={data.get(Model_View_Base.KEY_CALLBACK, Model_View_Base.HASH_PAGE_HOME)}'
    print(f'redirect uri: {uri_redirect}')
    hash_callback = data.get(Model_View_Base.KEY_CALLBACK, Model_View_Base.HASH_PAGE_HOME)
    print(f'hash_callback: {hash_callback}')

    red = oauth.auth0.authorize_redirect(
        redirect_uri = uri_redirect,
        state = quote(hash_callback)
    )
    print(f'redirect: {red}')
    headers = red.headers['Location']
    print(f'headers: {headers}')
    parsed_url = urlparse(headers)
    query_params = parse_qs(parsed_url.query)
    print(f"""
    OAuth Authorize Redirect URL:
    
    Base URL: {parsed_url.scheme}://{parsed_url.netloc}{parsed_url.path}
    {parsed_url}
    
    Query Parameters: {query_params}
    """)
    return jsonify({'Success': True, 'status': 'success', f'{Model_View_Base.KEY_CALLBACK}': headers})

@app.route("/login_callback") # <path:subpath>/<code>
def login_callback():
    try:
        # print(f'code: {code}')
        token = None
        try:
            token = oauth.auth0.authorize_access_token()
        except Exception as e:
            # Log the error for debugging
            print(f"Error: {str(e)}")
        session[app.ID_TOKEN_USER] = token
        # import user id
        print(f'str(type(token)) = {str(type(token))}')
        print(f'token = {token}')
        userinfo = token.get('userinfo')
        print(f'user info: {userinfo}')
        # id_user = token.get('sub')
        id_user = userinfo.get('sub')
        print(f'user ID: {id_user}')

        datastore_store = DataStore_Store(app, db)
        user = datastore_store.get_user_auth0()
        user_filters = User_Filters.from_user(user)
        users, errors = datastore_store.get_many_user(user_filters, user)
        try:
            user = users[0]
            print('User logged in')
            print(f'user ({str(type(user))}): {user}')
            print(f'user key: {Model_View_Base.KEY_USER}')
            user_json = user.to_json()
            session[Model_View_Base.KEY_USER] = user_json
            print(f'user stored on session')
        except:
            print(f'User not found: {user_filters}')
        
        try:
            hash_callback = token.get('hash_callback')
            if hash_callback is None:
                print('hash is none')
                state = request.args.get('state')
                print(f'state: {state}')
                hash_callback = state # .get('hash_callback')
            print(f'hash_callback: {hash_callback}')
        except:
            print("get hash callback failed")
        # id_user = get_id_user()
        # add user to database
        # DataStore_Store(db, userinfo).add_new_user(id_user) # this is part of get basket - should occur on page load

        print(f'user session: {session[Model_View_Base.KEY_USER]}')
        return redirect(f'{app.URL_HOST}{hash_callback}')
    except Exception as e:
        return jsonify({'status': 'failure', 'Message': f'Controller error.\n{e}'})

@app.route("/logout")
def logout():
    session.clear()
    url_logout = "https://" + app.DOMAIN_AUTH0 + "/v2/logout?" + urlencode(
        {
            "returnTo": url_for("logout_callback", _external=True),
            "client_id": app.ID_AUTH0_CLIENT,
        }# ,
        # quote_via=quote_plus,
    )
    app.logger.debug(f"Redirecting to {url_logout}")
    print(f"Redirecting to {url_logout}")
    return redirect(url_logout)

@app.route("/logout_callback") # <path:subpath>/<code>
def logout_callback():
    return home()
    try:
        session[app.ID_TOKEN_USER] = None
        user = User()
        try:
            hash_callback = token.get('hash_callback')
            if hash_callback is None:
                print('hash is none')
                state = request.args.get('state')
                print(f'state: {state}')
                hash_callback = state # .get('hash_callback')
            print(f'hash_callback: {hash_callback}')
        except:
            print("get hash callback failed")
        # id_user = get_id_user()
        # add user to database
        # DataStore_Store(db, userinfo).add_new_user(id_user) # this is part of get basket - should occur on page load

        print(f'user session: {session[Model_View_Base.KEY_USER]}')
        return redirect(f'{app.URL_HOST}{hash_callback}')
    except Exception as e:
        return jsonify({'status': 'failure', 'Message': f'Controller error.\n{e}'})


@app.route("/user")
def user():
    try:
        model = Model_View_User(app, db)
        html_body = render_template('_page_user.html', model = model)
    except Exception as e:
        return str(e)
    return html_body


# snore
@app.route('/license', methods=['GET'])
def license():
    try:
        model = Model_View_Home(app, db)
        html_body = render_template('_page_license.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
@app.route('/accessibility-statement', methods=['GET'])
def accessibility_statement():
    try:
        model = Model_View_Home(app, db)
        html_body = render_template('_page_accessibility_statement.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
@app.route('/accessibility-report', methods=['GET'])
def accessibility_report():
    try:
        model = Model_View_Home(app, db)
        html_body = render_template('_page_accessibility_report.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
@app.route('/retention-schedule', methods=['GET'])
def retention_schedule():
    try:
        model = Model_View_Home(app, db)
        html_body = render_template('_page_retention_schedule.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
@app.route('/privacy-notice', methods=['GET'])
def privacy_notice():
    try:
        model = Model_View_Home(app, db)
        html_body = render_template('_page_privacy_notice.html', model = model)
    except Exception as e:
        return str(e)
    return html_body

# Onload
if __name__ == '__main__':
    app.run()
    # app.run(debug=True, host="0.0.0.0", port=5000)