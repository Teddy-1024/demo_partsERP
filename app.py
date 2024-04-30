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
from app.forms import Form_Contact, Form_Basket_Add, Form_Basket_Edit, Form_Billing, Form_Delivery_Region, Form_Currency # , Form_Product
from models.model_view_base import Model_View_Base
from models.model_view_home import Model_View_Home
from models.model_view_store import Model_View_Store
from models.model_view_store_home import Model_View_Store_Home
from models.model_view_store_product import Model_View_Store_Product
from models.model_view_store_basket import Model_View_Store_Basket
from models.model_view_store_checkout import Model_View_Store_Checkout
from models.model_view_store_checkout_success import Model_View_Store_Checkout_Success
from models.model_view_contact import Model_View_Contact
from business_objects.product import Product # , Product_Image_Filters, Resolution_Level_Enum
import lib.argument_validation as av
from business_objects.basket import Basket_Item
from datastores.datastore_store import DataStore_Store
from business_objects.product import Product_Filters
# external
from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail, Message
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
CORS(app)
# app.register_blueprint(bp_home, url_prefix='')
email_recipient = 'edward.middletonsmith@gmail.com' # 'noreply'

app.config.from_object(app_config)
print(f'secret key = {app.secret_key}')
app.SQLALCHEMY_DATABASE_URI = Config.SQLALCHEMY_DATABASE_URI
app.SQLALCHEMY_TRACK_MODIFICATIONS = Config.SQLALCHEMY_TRACK_MODIFICATIONS
app.ID_AUTH0_CLIENT = Config.ID_AUTH0_CLIENT
app.ID_AUTH0_CLIENT_SECRET = Config.ID_AUTH0_CLIENT_SECRET
app.DOMAIN_AUTH0 = Config.DOMAIN_AUTH0
app.ID_TOKEN_USER = Config.ID_TOKEN_USER
"""
app.is_included_VAT = Config.is_included_VAT
app.KEY_IS_INCLUDED_VAT = Config.KEY_IS_INCLUDED_VAT
app.code_currency = Config.code_currency
app.KEY_CODE_CURRENCY = Config.KEY_CODE_CURRENCY
app.code_region_delivery = Config.code_region_delivery
app.KEY_CODE_REGION_DELIVERY = Config.KEY_CODE_REGION_DELIVERY
app.KEY_ID_CURRENCY = Config.KEY_ID_CURRENCY
app.KEY_ID_REGION_DELIVERY = Config.KEY_ID_REGION_DELIVERY
app.id_currency = Config.id_currency
app.id_region_delivery = Config.id_region_delivery
"""

db = SQLAlchemy(app)

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

mail = Mail(app)


# METHODS
sys.path.insert(0, os.path.dirname(__file__))


def application(environ, start_response):
    start_response('200 OK', [('Content-Type', 'text/plain')])
    message = 'It works!\n'
    version = 'Python %s\n' % sys.version.split()[0]
    response = '\n'.join([message, version])
    return [response.encode()]


# ROUTING
@app.route('/', methods=['GET'])
def home():
    return render_template('_page_home.html', model=Model_View_Home(db, get_info_user(), app))


@app.route('/contact', methods=['GET'])
def contact():
    form = Form_Contact()
    if form.validate_on_submit():
        # Handle form submission
        email = form.email.data
        CC = form.CC.data # not in use
        name = form.name.data
        msg = form.msg.data
        # send email
        mailItem = Message("PARTS Website Contact Us Message", recipients=[app.config['MAIL_DEFAULT_SENDER']])
        mailItem.body = f"Dear Lord Edward Middleton-Smith,\n\n{msg}\n\nKind regards,\n{name}\n{email}"
        mail.send(mailItem)
    return render_template('_page_contact.html', model=Model_View_Contact(db, get_info_user(), app, form))

@app.route('/services', methods=['GET', 'POST'])
@app.route('/public_html/services', methods=['GET', 'POST'])
def services():
    return render_template('_page_services.html', model=Model_View_Home(db, get_info_user(), app))


# Store
@app.route('/store', methods=['GET', 'POST'])
def store_home():
    print("store home")
    try:
        data = request.json
    except:
        data = {}
    print(f'data={data}')
    """
    try:
        id_currency = data.id_currency
    except:
        id_currency = Model_View_Store.ID_CURRENCY_DEFAULT
    try:
        id_region_delivery = data.id_region_delivery
    except:
        id_region_delivery = Model_View_Store.ID_REGION_DELIVERY_DEFAULT
    """
    id_currency, id_region_delivery, is_included_VAT = DataStore_Store.get_metadata_basket(data)
    print(f"id_currency = {id_currency}")
    print(f"id_region_delivery = {id_region_delivery}")
    model = Model_View_Store_Home(db, get_info_user(), app, id_currency, id_region_delivery, is_included_VAT)
    # model.get_regions_and_currencies()
    # model.categories = Model_View_Store_Home.get_many_product_category(db)
    # product = categories[list(categories.keys())[0]][0]
    model.get_many_product_category(Product_Filters(
        model.id_user,
        True, '', False,
        True, '', False, False, 
        True, '', False, 
        False, '', False, True, 
        False, id_region_delivery, False,
        False, id_currency, False,
        True, '', False
    ))
    """
    for cat in model.categories:
        # for product in model.categories[cat]:
        i_cat = model.category_index[cat.id_category]
        for p in cat.products:
            print(f'adding basket add form for product with id: {p.id_product}')
            model.categories[i_cat].products[model.categories[i_cat].product_index[p.id_product]].add_form_basket_add()
            model.categories[i_cat].products[model.categories[i_cat].product_index[p.id_product]].form_basket_add = Form_Basket_Add()
            print('form added')
            # print('form added for product {p.id}')
    print('rendering page store home')
    """
    for cat in model.category_list.categories:
        # for product in model.categories[cat]:
        # i_cat = model.category_index[cat.id_category]
        print(f'category: {cat.name}')
        for p in cat.products:
            print(f'product: {p.name}')
            print(f'selected permutation: {p.get_permutation_selected()}')
    if request.method == 'GET':
        return render_template('_page_store_home.html', model = model) # "<html><body><h1>Boobs</h1></html></body>"
    else: # POST request
        html_block = render_template('_block_store_home_body.html', model = model)
        print(f'html_block:\n{html_block}')
        return jsonify(Success=True, data={'html_block': html_block})

# update with local basket, if not logged in- partial
@app.route('/store/basket_load', methods=['POST'])
def basket_load():
    _m = 'basket_load'
    print(f'{_m}\nstarting...')
    data = request.json
    print(f'data={data}')
    
    # model, html_block = render_basket_from_JSON(data)
    id_currency, id_region_delivery, is_included_VAT = DataStore_Store.get_metadata_basket(data) # , Model_View_Store.KEY_BASKET)
    model = Model_View_Store_Home(db, get_info_user(), app, id_currency, id_region_delivery, is_included_VAT)
    # model.import_JSON_basket(data)
    model.get_basket(data)
    # model.is_included_VAT = is_included_VAT

    html_block = render_template('_block_store_basket.html', model = model)
    print(f'html_block:\n{html_block}')
    return jsonify(Success=True, data={'html_block': html_block, 'basket': model.basket.to_json()}) # {'items': [b_i.to_json() for b_i in model.basket]}}) # { 'html': render_template('_block_store_basket.html', model = model), 'basket': model.basket })

@app.route('/store/basket_add', methods=['POST'])
def basket_add():
    _m = 'basket_add'
    data = request.json # .get('data')
    print(f'data: {data}')
    id_currency, id_region_delivery, is_included_VAT = DataStore_Store.get_metadata_basket(data)
    model = Model_View_Store_Home(db, get_info_user(), app, id_currency, id_region_delivery, is_included_VAT)
    # model.is_included_VAT = is_included_VAT
    form_data = data[Model_View_Store.key_form]
    """
    try:
        form_data[Model_View_Store.KEY_VALUE_DEFAULT]
    except KeyError:
        form_data[Model_View_Store.KEY_VALUE_DEFAULT] = 
    """
    print(f'form_data: {form_data}')
    form = Form_Basket_Add(**form_data)
    print('form acquired')
    print(form.__repr__)
    if form.validate_on_submit():
        print('valid form')
        # model = input_JSON_basket(model, data)
        # if not logged in:
        try:
            print('importing basket')
            # print('success' if model.import_JSON_basket(data) else 'failure')
            model.get_basket(data)
            permutation_id, quantity = model.import_JSON_basket_item(data, form)
            print(f'permutation_id: {permutation_id}\nquantity: {quantity}')
            print(f'editing basket:')
            model.basket_item_edit(permutation_id, quantity, True) # new_basket = 
        except:
            return jsonify({'status': 'failure', 'Message': 'Bad data received by controller'})
        # return jsonify(Success = True, data = { html_block: render_template(), Model_View_Store.key_basket: new_basket })
        html_block = render_template('_block_store_basket.html', model = model)
        # print(f'html_block:\n{html_block}')
        return jsonify(Success = True, data = { 'html_block': html_block, 'basket': {'items': model.basket.to_json_list()}}) # 'items': [b_i.to_json() for b_i in model.basket]}})
    return jsonify({'status': 'failure', 'Message': 'Invalid quantities'})



@app.route('/store/basket_edit', methods=['POST'])
def basket_edit():
    _m = 'basket_edit'
    data = request.json # .get('data')
    print(f'data: {data}')
    id_currency, id_region_delivery, is_included_VAT = DataStore_Store.get_metadata_basket(data)
    model = Model_View_Store_Home(db, get_info_user(), app, id_currency, id_region_delivery, is_included_VAT)
    model.is_included_VAT = is_included_VAT
    form_data = data[Model_View_Store.key_form]
    print(f'form_data: {form_data}')
    form = Form_Basket_Edit(**form_data)
    print('form acquired')
    print(form.__repr__)
    if form.validate_on_submit():
        print('valid form')
        # model = input_JSON_basket(model, data)
        # if not logged in:
        try:
            # print('importing basket')
            # model.import_JSON_basket(data)
            model.get_basket(data)
            permutation_id, quantity = model.import_JSON_basket_item(data, form)
            model.basket_item_edit(permutation_id, quantity, False) # new_basket = 
        except:
            return jsonify({'status': 'failure', 'Message': 'Bad data received by controller'})
        # return jsonify(Success = True, data = { html_block: render_template(), Model_View_Store.key_basket: new_basket })
        html_block = render_template('_block_store_basket.html', model = model)
        # print(f'html_block:\n{html_block}')
        return jsonify(Success = True, data = { 'html_block': html_block, 'basket': {'items': model.basket.to_json_list()}})
    return jsonify({'status': 'failure', 'Message': 'Invalid quantities'})

@app.route('/store/basket_delete', methods=['POST'])
def basket_delete():
    _m = 'basket_delete'
    data = request.json # .get('data')
    print(f'data: {data}')
    id_currency, id_region_delivery, is_included_VAT = DataStore_Store.get_metadata_basket(data)
    model = Model_View_Store_Home(db, get_info_user(), app, id_currency, id_region_delivery, is_included_VAT)
    model.is_included_VAT = is_included_VAT
    try:
        # print('importing basket')
        # model.import_JSON_basket(data)
        model.get_basket(data)
        permutation_id, quantity = model.import_JSON_basket_item(data)
        model.basket_item_edit(permutation_id, 0, False) # new_basket = 
    except:
        return jsonify({'status': 'failure', 'Message': 'Bad data received by controller'})
    # return jsonify(Success = True, data = { html_block: render_template(), Model_View_Store.key_basket: new_basket })
    html_block = render_template('_block_store_basket.html', model = model)
    # print(f'html_block:\n{html_block}')
    return jsonify(Success = True, data = { 'html_block': html_block, 'basket': {'items': model.basket.to_json_list()}})
    # delete basket item with product_id
    item_deleted = False
    for basket_item in model.basket:
        if basket_item.product.id_product == product_id:
            model.basket.remove(basket_item)
            item_deleted = True
            break
    if not item_deleted:
        return jsonify({'status': 'failure', 'Message': 'Basket item removal failure: product not found in basket.'})
    # return jsonify(Success = True, data = { html_block: render_template(), Model_View_Store.key_basket: new_basket })
    html_block = render_template('_block_store_basket.html', model = model)
    # print(f'html_block:\n{html_block}')
    return jsonify(Success = True, data = { 'html_block': html_block, 'basket': {'items': [b_i.to_json() for b_i in model.basket]}})

@app.route('/store/basket', methods=['GET']) # 'POST'
def store_basket():
    # _m = 'basket_review'
    try:
        data = request.json
        id_currency, id_region_delivery, is_included_VAT = DataStore_Store.get_metadata_basket(data)
        model = Model_View_Store_Basket(db, get_info_user(), app, id_currency, id_region_delivery, is_included_VAT)
        model.is_included_VAT = is_included_VAT
    except:
        raise Exception('Bad data received by controller')
    return render_template('_page_store_basket.html', model=model)
    data = request.json # .get('data')
    print(f'data: {data}')
    # if logged in
        #html_block = render_template('_page_store_basket.html', model = model) # with basket from database
    try:
        print('importing basket')
        model.import_JSON_basket(data)
    except:
        return jsonify({'status': 'failure', 'Message': 'Bad basket data received by controller'})
    # return jsonify(Success = True, data = { html_block: render_template(), Model_View_Store.key_basket: new_basket })
    html_block = render_template('_page_store_billing.html', model = model)
    # print(f'html_block:\n{html_block}')
    return jsonify(Success = True, data = { 'html_block': html_block, 'basket': {'items': [b_i.to_json() for b_i in model.basket]}})

@app.route('/store/basket_info', methods=['POST'])
def basket_info():
    _m = 'basket_info'
    data = request.json # .get('data')
    print(f'data: {data}')
    id_currency, id_region_delivery, is_included_VAT = DataStore_Store.get_metadata_basket(data)
    model = Model_View_Store_Basket(db, get_info_user(), app, id_currency, id_region_delivery, is_included_VAT)
    form_data = data[Model_View_Store.key_form]
    print(f'form_data: {form_data}')
    form = Form_Billing(**form_data)
    print('form acquired')
    print(form.__repr__)
    if form.validate_on_submit():
        print('valid form')
        # model = input_JSON_basket(model, data)
        # if not logged in:
        data_info = {}
        try:
            info_type = data[model.key_info_type]
            print('importing address information')
            data_info[model.key_region] = form.region.data
            print(f'region: {data_info[model.key_region]}')
            data_info[model.key_name_full] = form.name_full.data
            print(f'full name: {data_info[model.key_name_full]}')
            data_info[model.key_phone_number] = form.phone_number.data
            print(f'phone number: {data_info[model.key_phone_number]}')
            data_info[model.key_postcode] = form.postcode.data
            print(f'postcode: {data_info[model.key_postcode]}')
            data_info[model.key_address1] = form.address_1.data
            print(f'address line 1: {data_info[model.key_address1]}')
            data_info[model.key_address2] = form.address_2.data
            print(f'address line 2: {data_info[model.key_address2]}')
            data_info[model.key_city] = form.city.data
            print(f'city: {data_info[model.key_city]}')
            data_info[model.key_county] = form.county.data
            print(f'county: {data_info[model.key_county]}')
            data_info[model.key_info_identical] = form.identical
            print(f'identical: {data_info[model.key_info_identical]}')
        except:
            return jsonify({'status': 'failure', 'Message': 'Bad form data received by controller'})
        # return jsonify(Success = True, data = { html_block: render_template(), Model_View_Store.key_basket: new_basket })
        # html_block = render_template('_block_store_basket.html', model = model)
        # print(f'html_block:\n{html_block}')
        data = {}
        data[model.key_info_type] = model.key_info_billing if (info_type == model.key_info_billing) else model.key_info_delivery
        data[info_type] = data_info
        return jsonify(Success = True, data = data)
    return jsonify({'status': 'failure', 'Message': f'Invalid address information\n{form.errors}'})


@app.route('/store/product?permutationId=<permutation_id>regionId=&<region_id>&currencyId=<currency_id>&isIncludedVAT=<is_included_VAT>', methods=['GET']) # <product_id>&
def store_product(permutation_id, region_id, currency_id, is_included_VAT):
    _m = 'store_product'
    """
    av.full_val_int(product_id, 'product_id', _m)
    product_id = int(product_id)
    print(f'product_id: {product_id}')
    if permutation_id == 'None' or str(type(permutation_id)) == "<class 'NoneType'>":
        permutation_id = None
    else:
    """
    # app.id_region_delivery = region_id
    # app.id_currency = currency_id
    av.full_val_int(permutation_id, 'permutation_id', _m)
    permutation_id = int(permutation_id)
    print(f'{_m}\nstarting...')
    # print(f'product id: {product_id}')
    print(f'permutation id: {permutation_id}')
    try:
        model = Model_View_Store_Product(db, get_info_user(), app, permutation_id, currency_id, region_id, is_included_VAT)
        print('model reached')
        # model.id_currency, model.id_region_delivery, model.is_included_VAT = DataStore_Store.get_metadata_basket(request.json)
        # model.get_many_product_category(product_ids = str(product_id))
        # print('categories reached')
        # product = model.categories[0].products[0]# [list(categories.keys())[0]][0]
        # print('product reached')
        # return jsonify({'data': render_template('_page_store_product.html', model=model)})
        permutation_selected = model.product.get_permutation_selected()
        print(f'selected permutation: {permutation_selected}')
        return render_template('_page_store_product.html', model=model)
    except:
        print('except reached')
        return jsonify({'status': 'error'})

# Stripe
@app.route('/config', methods=['GET'])
def get_publishable_key():
    price = stripe.Price.retrieve(Model_View_Store_Checkout.get_price_id(Product.template().id))
    return jsonify({
      'publicKey': Model_View_Store_Checkout.key_public_stripe, # os.getenv('KEY_PUBLIC_STRIPE'),
      'unitAmount': price['unit_amount'],
      'currency': price['currency']
    })

# Create Stripe prices
@app.route('/store/product_create_all', methods=['GET'])
def product_create_all():
    # _m = 'product_create_all'
    model = Model_View_Store_Checkout(db, get_info_user(), app)
    products, currencies = model.get_many_product_new()
    html = f"<html><body>"
    for product in products:
        product.id_stripe_product = model.create_product(product)
        html += f"<h1>product id = {product.id}</h1><br><h1>id_stripe_product = {product.id_stripe_product}</h1>"
    html += "</body></html>"
    
    return html

@app.route('/store/price_create_all', methods=['GET'])
def price_create_all():
    # _m = 'price_create_all'
    model = Model_View_Store_Checkout(db, get_info_user(), app)
    products, currencies = model.get_many_price_new()
    html = f"<html><body>"
    for product in products:
        product.id_stripe_price = model.create_price(product, currencies[product.id])
        html += f"<h1>product id = {product.id}</h1><br><h1>id_stripe_price = {product.id_stripe_price}</h1><br><h1>currency = {currencies[product.id]}</h1>"
    html += "</body></html>"
    
    return html

# Fetch the Checkout Session to display the JSON result on the success page
@app.route('/store/checkout_session?<session_id>', methods=['GET'])
def get_checkout_session(session_id):
    id = request.args.get('session_id')
    _m = 'get_checkout_session'
    # av.full_val_int(session_id, 'session_id', _m)
    av.val_str(session_id, 'session_id', _m)
    print(f'url var normal session id: {session_id}')
    print(f'{_m}\nstarting...')
    # session_id = id
    session_id = session_id
    print(f'request.args checkout session id: {session_id}') # for function
    checkout_session = stripe.checkout.Session.retrieve(session_id)
    return jsonify(checkout_session)


@app.route('/store/checkout', methods=['POST', 'GET'])
def create_checkout_session():
    # quantity = request.form.get('quantity', 1)
    # domain_url = os.getenv('DOMAIN')
    id_currency, id_region_delivery, is_included_VAT = DataStore_Store.get_metadata_basket(data)
    model = Model_View_Store_Checkout(db, get_info_user(), app, id_currency, id_region_delivery, is_included_VAT)
    print('checkout model created')
    try:
        data = request.json # .get('data')
        print(f'data: {data}')
        print('importing basket')
        model.get_basket(data)
        model.id_currency, model.id_region_delivery, model.is_included_VAT = DataStore_Store.get_metadata_basket(data)
        # model.import_JSON_basket(data)
        # print('getting is subscription')
        # is_subscription_checkout_session = data[model.key_is_subscription]
        code_currency = 'GBP' # data[model.key_code_currency]
        print(f'currency code: {code_currency}')
    except:
        return jsonify({'status': 'failure', 'Message': 'Bad form data received by controller'})
    items = []
    for item in model.basket.items:
        permutation = item.product.get_permutation_selected()
        price = permutation.get_price_from_code_currency(code_currency)
        items.append({'price': price.id_stripe_price,
                        'quantity': item.quantity })
        # if is_subscription_checkout_session:
        #     break
    print(f'items = {items}')
    try:
        # Create new Checkout Session for the order
        # Other optional params include:
        # [billing_address_collection] - to display billing address details on the page
        # [customer] - if you have an existing Stripe Customer ID
        # [payment_intent_data] - lets capture the payment later
        # [customer_email] - lets you prefill the email input in the form
        # [automatic_tax] - to automatically calculate sales tax, VAT and GST in the checkout page
        # For full details see https://stripe.com/docs/api/checkout/sessions/create
        stripe.api_key = model.key_secret_stripe
        # ?session_id={CHECKOUT_SESSION_ID} means the redirect will have the session ID set as a query param
        checkout_session = stripe.checkout.Session.create(
            success_url=Model_View_Store_Checkout.url_host + '/store/checkout_success%3Fsession_id={CHECKOUT_SESSION_ID}',
            cancel_url=Model_View_Store_Checkout.url_host + '/store/checkout_cancelled',
            mode='subscription' if False else 'payment', # is_subscription_checkout_session
            # automatic_tax={'enabled': True},
            line_items=items
        )
        data_out = {}
        # data_out['Success'] = True
        data_out[f'{model.key_id_checkout}'] = checkout_session.id
        data_out[f'{model.key_url_checkout}'] = checkout_session.url
        # return jsonify(Success = True,  data = data_out) # Success = True, f'{model.key_id_checkout}' = checkout_session.id)
        print(f'checkout session url: {checkout_session.url}')
        # redirect(checkout_session.url) # , code=303)
        return jsonify(Success = True, data = data_out)
        # return get_checkout_session(checkout_session.id)
    except Exception as e:
        return jsonify(error=str(e)), 403

@app.route('/store/checkout_success?<session_id>', methods=['GET'])
def checkout_success(session_id):
    _m = 'store checkout success'
    # av.full_val_int(session_id, 'session_id', _m)
    av.val_str(session_id, 'session_id', _m)
    if (session_id[:len('session_id=')] == 'session_id='):
        session_id = session_id[len('session_id='):]
    print(f'url var normal session id: {session_id}')
    print(f'{_m}\nstarting...')
    id = request.args.get('sessionId')
    print(f'request.args checkout session id: {id}')

    checkout_session = stripe.checkout.Session.retrieve(session_id)
    print(f'checkout session data: {checkout_session}')

    # validate billing information
    

    model = Model_View_Store_Checkout_Success(db, get_info_user(), app)

    return render_template('_page_store_checkout_success.html', model=model)

@app.route('/store/checkout_cancelled', methods=['GET'])
def checkout_cancelled():
    _m = 'store checkout success'
    print(f'{_m}\nstarting...')
    return render_template('_page_store_checkout_cancelled.html', model=Model_View_Store_Checkout(db, get_info_user(), app))


# include VAT in prices?
@app.route('/store/set_is_included_VAT', methods=['POST'])
def set_is_included_VAT():
    _m = 'set_is_included_VAT'
    print(f'{_m}\nstarting...')
    data = request.json
    print(f'data={data}')
    app.is_included_VAT = not app.is_included_VAT # session[app.KEY_IS_INCLUDED_VAT] # data[app.KEY_IS_INCLUDED_VAT]
    return jsonify(Success=True, data={Model_View_Base.KEY_IS_INCLUDED_VAT: app.is_included_VAT})

# delivery region
@app.route('/store/set_delivery_region', methods=['POST'])
def set_delivery_region():
    _m = 'set_delivery_region'
    print(f'{_m}\nstarting...')
    data = request.json
    print(f'data={data}')
    # model = Model_View_Store(db, get_info_user(), app)
    form_data = data[Model_View_Store.key_form]
    print(f'form_data: {form_data}')
    """
    form = Form_Delivery_Region(**form_data)
    print('form acquired')
    print(form.__repr__)
    if form.validate_on_submit():
        app.id_region_delivery = form.id_region_delivery.data
    """
    id_region_delivery = form_data[Model_View_Store.KEY_BASKET][Model_View_Base.KEY_ID_REGION_DELIVERY]
    print(f'id_region_delivery: {id_region_delivery}')
    return jsonify(Success=True, data={Model_View_Base.KEY_ID_REGION_DELIVERY: id_region_delivery})

# currency
@app.route('/store/set_currency', methods=['POST'])
def set_currency():
    _m = 'set_currency'
    print(f'{_m}\nstarting...')
    data = request.json
    print(f'data={data}')
    # model = Model_View_Store(db, get_info_user(), app)
    form_data = data[Model_View_Store.key_form]
    print(f'form_data: {form_data}')
    """
    form = Form_Currency(**form_data)
    print('form acquired')
    print(form.__repr__)
    if form.validate_on_submit():
        app.id_currency = form.id_currency.data
        print(f'id_currency: {app.id_currency}')
    """
    app.id_currency = form_data[Model_View_Base.KEY_ID_CURRENCY]
    print(f'id_currency: {app.id_currency}')
    return jsonify(Success=True, data={Model_View_Base.KEY_ID_CURRENCY: app.id_currency})


# User authentication
@app.route("/login")
def login():
    print(f'redirect uri: {url_for("login_callback", _external=True)}')
    return oauth.auth0.authorize_redirect(
        redirect_uri=url_for("login_callback", _external=True)
    )

@app.route("/login_callback", methods=["GET", "POST"])
def login_callback():
    token = oauth.auth0.authorize_access_token()
    session[app.ID_TOKEN_USER] = token

    # import user id
    print(f'str(type(token)) = {str(type(token))}')
    print(f'token = {token}')
    userinfo = token.get('userinfo')
    print(f'user info: {userinfo}')
    # id_user = token.get('sub')
    id_user = userinfo.get('sub')
    print(f'user ID: {id_user}')

    # id_user = get_id_user()
    # add user to database
    # DataStore_Store(db, userinfo).add_new_user(id_user) # this is part of get basket - should occur on page load

    return redirect("/")

@app.route("/logout")
def logout():
    session.clear()
    return redirect(
        "https://" + app.DOMAIN_AUTH0
        + "/v2/logout?"
        + urlencode(
            {
                "returnTo": url_for("home", _external=True),
                "client_id": app.ID_AUTH0_CLIENT,
            },
            quote_via=quote_plus,
        )
    )

def get_info_user():
    try:
        return session[app.ID_TOKEN_USER].get('userinfo') # .get('sub')
    except:
        return {'sub': ''}

"""
@app.route('/send-email', methods=['GET'])
def send_email():
    try:
        msg = Message("Flask Mail test", recipients=[app.config['MAIL_DEFAULT_SENDER']])
        msg.body = "Dear Lord Edward Middleton-Smith,\n\nThis is a test email sent from Flask.\n\nKind regards,\nBot"
        mail.send(msg)
    except:
        return "<html>Error</html>"
    return "<html>Email sent</html>"
"""

"""
@app.route('/test-mysql', methods=['GET'])
def test_mysql():
    model = Model_View_Store(db, get_info_user(), app)
    
     _m = 'test_mysql'
    proc_string = f'CALL {proc_name}('
    if has_arguments:
        arg_keys = list(argument_dict_list.keys())
        for i in range(len(arg_keys)):
            proc_string += f'{"" if i == 0 else ", "}:{arg_keys[i]}'
    proc_string += ')'
    proc_string = text(proc_string)
    print(f'{_m}\nproc_string: {proc_string}\nargs: {argument_dict_list}')
    # with self.db.session.begin() as session:
    if has_arguments:
        result = self.db.session.execute(proc_string, argument_dict_list)
    else:
        result = self.db.session.execute(proc_string)
    print(f'result: {result}')

    return "<html>MySQL test</html>"
"""

@app.route('/public_html/403.shtml', methods=['GET'])
def error_403():
    return "<html>Error 403</html>"


# Onload
if True or __name__ == '__main__':
    app.run()
    # app.run(debug=True, host="0.0.0.0", port=5000)