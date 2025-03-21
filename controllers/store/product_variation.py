"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: App Routing
Feature:    Store Product Variation Routes

Description:
Initializes the Flask application, sets the configuration based on the environment, and defines two routes (/ and /about) that render templates with the specified titles.
"""

# internal
from business_objects.store.product_variation import Product_Variation, Parameters_Product_Variation
from business_objects.store.product_variation_type import Product_Variation_Type
from datastores.datastore_store_product_variation import DataStore_Store_Product_Variation
from forms.store.product_variation import Filters_Product_Variation
from models.model_view_store_product_variation import Model_View_Store_Product_Variation
from helpers.helper_app import Helper_App
import lib.argument_validation as av
# external
from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session, Blueprint, current_app
from extensions import db, oauth
from urllib.parse import quote_plus, urlencode
from authlib.integrations.flask_client import OAuth
from authlib.integrations.base_client import OAuthError
from urllib.parse import quote, urlparse, parse_qs


routes_store_product_variation = Blueprint('routes_store_product_variation', __name__)


@routes_store_product_variation.route(Model_View_Store_Product_Variation.HASH_PAGE_STORE_PRODUCT_VARIATIONS, methods=['GET'])
def product_variations():
    Helper_App.console_log('product_variations')
    try:
        form_filters = Filters_Product_Variation.from_json(request.args)
    except Exception as e:
        Helper_App.console_log(f'Error: {e}')
        form_filters = Filters_Product_Variation()
    Helper_App.console_log(f'form_filters={form_filters}')
    model = Model_View_Store_Product_Variation(form_filters)
    if not model.is_user_logged_in:
        return redirect(url_for('routes_core.home'))
    return render_template('pages/store/_product_variations.html', model = model)


@routes_store_product_variation.route(Model_View_Store_Product_Variation.HASH_SAVE_STORE_PRODUCT_VARIATION, methods=['POST'])
def save_product_variation():
    data = Helper_App.get_request_data(request)
    try:
        form_filters = Filters_Product_Variation.from_json(data[Model_View_Store_Product_Variation.FLAG_FORM_FILTERS])
        if not form_filters.validate_on_submit():
            return jsonify({
                Model_View_Store_Product_Variation.FLAG_STATUS: Model_View_Store_Product_Variation.FLAG_FAILURE, 
                Model_View_Store_Product_Variation.FLAG_MESSAGE: f'Filters form invalid.\n{form_filters.errors}'
            })
        Helper_App.console_log(f'form_filters: {form_filters}')

        product_variation_types = data[Model_View_Store_Product_Variation.FLAG_PRODUCT_VARIATION_TYPE]
        if len(product_variation_types) == 0:
            return jsonify({
                Model_View_Store_Product_Variation.FLAG_STATUS: Model_View_Store_Product_Variation.FLAG_FAILURE, 
                Model_View_Store_Product_Variation.FLAG_MESSAGE: f'No Product Variations.'
            })
        objs_product_variation_type = []
        for product_variation_type in product_variation_types:
            objs_product_variation_type.append(Product_Variation_Type.from_json(product_variation_type))
        Helper_App.console_log(f'objs_product_variation_type={objs_product_variation_type}')
        save_errors = Model_View_Store_Product_Variation.save_product_variations(data.get('comment', 'No comment'), objs_product_variation_type)

        model_return = Model_View_Store_Product_Variation(form_filters_old = form_filters)
        if not model_return.is_user_logged_in:
            raise Exception('User not logged in')
        Helper_App.console_log('nips')
        return jsonify({
            Model_View_Store_Product_Variation.FLAG_STATUS: Model_View_Store_Product_Variation.FLAG_SUCCESS, 
            Model_View_Store_Product_Variation.FLAG_DATA: model_return.convert_list_objects_to_json(model_return.variation_types)
        })
    except Exception as e:
        return jsonify({
            Model_View_Store_Product_Variation.FLAG_STATUS: Model_View_Store_Product_Variation.FLAG_FAILURE, 
            Model_View_Store_Product_Variation.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'
        })
    