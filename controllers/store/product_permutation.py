"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: App Routing
Feature:    Store Product Permutation Routes

Description:
Initializes the Flask application, sets the configuration based on the environment, and defines two routes (/ and /about) that render templates with the specified titles.
"""


# internal
from business_objects.store.product import Parameters_Product, Product_Permutation
from forms.store.product_permutation import Filters_Product_Permutation
from models.model_view_base import Model_View_Base
from models.model_view_store import Model_View_Store
from models.model_view_store_product_permutation import Model_View_Store_Product_Permutation
from helpers.helper_app import Helper_App
import lib.argument_validation as av
# external
from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session, Blueprint, current_app
from extensions import db, oauth
from urllib.parse import quote_plus, urlencode
from authlib.integrations.flask_client import OAuth
from authlib.integrations.base_client import OAuthError
from urllib.parse import quote, urlparse, parse_qs


routes_store_product_permutation = Blueprint('routes_store_product_permutation', __name__)

@routes_store_product_permutation.route(Model_View_Store_Product_Permutation.HASH_PAGE_STORE_PRODUCT_PERMUTATIONS, methods=['GET'])
def permutations():
    Helper_App.console_log('permutations')
    data = Helper_App.get_request_data(request)
    try:
        form_filters = Filters_Product_Permutation.from_json(data)
    except Exception as e:
        Helper_App.console_log(f'Error: {e}')
        form_filters = Filters_Product_Permutation()
    Helper_App.console_log(f'form_filters={form_filters}')
    model = Model_View_Store_Product_Permutation(form_filters)
    if not model.is_user_logged_in:
        # return redirect(url_for('routes_user.login', data = jsonify({ Model_View_Store_Product_Permutation.FLAG_CALLBACK: Model_View_Store_Product_Permutation.HASH_PAGE_STORE_PRODUCT_PERMUTATIONS })))
        return redirect(url_for('routes_core.home'))
    return render_template('pages/store/_product_permutations.html', model = model)

@routes_store_product_permutation.route(Model_View_Store_Product_Permutation.HASH_GET_STORE_PRODUCT_PERMUTATION, methods=['POST'])
def filter_permutation():
    data = Helper_App.get_request_data(request)
    try:
        form_filters = Filters_Product_Permutation.from_json(data)
        if not form_filters.validate_on_submit():
            return jsonify({
                Model_View_Store_Product_Permutation.FLAG_STATUS: Model_View_Store_Product_Permutation.FLAG_FAILURE, 
                Model_View_Store_Product_Permutation.FLAG_MESSAGE: f'Form invalid.\n{form_filters.errors}'
            })
        model = Model_View_Store_Product_Permutation(form_filters_old = form_filters)
        if not model.is_user_logged_in:
            raise Exception('User not logged in')
        return jsonify({
            Model_View_Store_Product_Permutation.FLAG_STATUS: Model_View_Store_Product_Permutation.FLAG_SUCCESS, 
            Model_View_Store_Product_Permutation.FLAG_DATA: model.category_list.to_json()
        })
    except Exception as e:
        return jsonify({
            Model_View_Store_Product_Permutation.FLAG_STATUS: Model_View_Store_Product_Permutation.FLAG_FAILURE, 
            Model_View_Store_Product_Permutation.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'
        })

@routes_store_product_permutation.route(Model_View_Store_Product_Permutation.HASH_SAVE_STORE_PRODUCT_PERMUTATION, methods=['POST'])
def save_permutation():
    data = Helper_App.get_request_data(request)
    try:
        form_filters = Filters_Product_Permutation.from_json(data[Model_View_Store_Product_Permutation.FLAG_FORM_FILTERS])
        if not form_filters.validate_on_submit():
            return jsonify({
                Model_View_Store_Product_Permutation.FLAG_STATUS: Model_View_Store_Product_Permutation.FLAG_FAILURE, 
                Model_View_Store_Product_Permutation.FLAG_MESSAGE: f'Filters form invalid.\n{form_filters.errors}'
            })
        # filters_form = Filters_Product_Permutation.from_form(form_filters)
        Helper_App.console_log(f'form_filters: {form_filters}')

        permutations = data[Model_View_Store_Product_Permutation.FLAG_PRODUCT_PERMUTATION]
        if len(permutations) == 0:
            return jsonify({
                Model_View_Store_Product_Permutation.FLAG_STATUS: Model_View_Store_Product_Permutation.FLAG_FAILURE, 
                Model_View_Store_Product_Permutation.FLAG_MESSAGE: f'No permutations.'
            })
        objsPermutation = []
        for permutation in permutations:
            objsPermutation.append(Product_Permutation.from_json(permutation))
        # model_save = Model_View_Store_Product_Permutation() # filters_product=filters_form)
        Helper_App.console_log(f'objsPermutation={objsPermutation}')
        Model_View_Store_Product_Permutation.save_permutations(data.get('comment', 'No comment'), objsPermutation)

        model_return = Model_View_Store_Product_Permutation(form_filters_old=form_filters)
        if not model_return.is_user_logged_in:
            raise Exception('User not logged in')
        Helper_App.console_log('nips')
        return jsonify({
            Model_View_Store_Product_Permutation.FLAG_STATUS: Model_View_Store_Product_Permutation.FLAG_SUCCESS, 
            Model_View_Store_Product_Permutation.FLAG_DATA: model_return.category_list.to_json()
        })
    except Exception as e:
        return jsonify({
            Model_View_Store_Product_Permutation.FLAG_STATUS: Model_View_Store_Product_Permutation.FLAG_FAILURE, 
            Model_View_Store_Product_Permutation.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'
        })
    