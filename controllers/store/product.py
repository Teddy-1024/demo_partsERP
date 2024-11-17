"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: App Routing
Feature:    Store Product Routes

Description:
Initializes the Flask application, sets the configuration based on the environment, and defines two routes (/ and /about) that render templates with the specified titles.
"""

# internal
from business_objects.store.product import Product, Parameters_Product
from datastores.datastore_store_product import DataStore_Store_Product
from forms.store.product import Filters_Product
from models.model_view_store_product import Model_View_Store_Product
from helpers.helper_app import Helper_App
import lib.argument_validation as av
# external
from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session, Blueprint, current_app
from extensions import db, oauth
from urllib.parse import quote_plus, urlencode
from authlib.integrations.flask_client import OAuth
from authlib.integrations.base_client import OAuthError
from urllib.parse import quote, urlparse, parse_qs


routes_store_product = Blueprint('routes_store_product', __name__)

@routes_store_product.route(Model_View_Store_Product.HASH_PAGE_STORE_PRODUCTS, methods=['GET'])
def products():
    Helper_App.console_log('products')
    try:
        form_filters = Filters_Product.from_json(request.args)
    except Exception as e:
        Helper_App.console_log(f'Error: {e}')
        form_filters = Filters_Product()
    Helper_App.console_log(f'form_filters={form_filters}')
    model = Model_View_Store_Product(form_filters)
    if not model.is_user_logged_in:
        # return redirect(url_for('routes_user.login', data = jsonify({ Model_View_Store_Product.FLAG_CALLBACK: Model_View_Store_Product.HASH_PAGE_STORE_PRODUCTS })))
        return redirect(url_for('routes_core.home'))
    return render_template('pages/store/_products.html', model = model)


@routes_store_product.route(Model_View_Store_Product.HASH_SAVE_STORE_PRODUCT, methods=['POST'])
def save_product():
    data = Helper_App.get_request_data(request)
    try:
        form_filters = Filters_Product.from_json(data[Model_View_Store_Product.FLAG_FORM_FILTERS])
        if not form_filters.validate_on_submit():
            return jsonify({
                Model_View_Store_Product.FLAG_STATUS: Model_View_Store_Product.FLAG_FAILURE, 
                Model_View_Store_Product.FLAG_MESSAGE: f'Filters form invalid.\n{form_filters.errors}'
            })
        # filters_form = Filters_Product.from_form(form_filters)
        Helper_App.console_log(f'form_filters: {form_filters}')

        products = data[Model_View_Store_Product.FLAG_PRODUCT]
        if len(products) == 0:
            return jsonify({
                Model_View_Store_Product.FLAG_STATUS: Model_View_Store_Product.FLAG_FAILURE, 
                Model_View_Store_Product.FLAG_MESSAGE: f'No products.'
            })
        objsProduct = []
        for product in products:
            objsProduct.append(Product.from_json(product))
        # model_save = Model_View_Store_Product() # filters_product=filters_form)
        Helper_App.console_log(f'objsProduct={objsProduct}')
        save_errors = Model_View_Store_Product.save_products(data.get('comment', 'No comment'), objsProduct)

        model_return = Model_View_Store_Product(form_filters_old=form_filters)
        if not model_return.is_user_logged_in:
            raise Exception('User not logged in')
        Helper_App.console_log('nips')
        return jsonify({
            Model_View_Store_Product.FLAG_STATUS: Model_View_Store_Product.FLAG_SUCCESS, 
            Model_View_Store_Product.FLAG_DATA: model_return.category_list.to_json()
        })
    except Exception as e:
        return jsonify({
            Model_View_Store_Product.FLAG_STATUS: Model_View_Store_Product.FLAG_FAILURE, 
            Model_View_Store_Product.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'
        })
    