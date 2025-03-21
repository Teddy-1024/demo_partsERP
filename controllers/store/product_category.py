"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: App Routing
Feature:    Store Product Category Routes

Description:
Initializes the Flask application, sets the configuration based on the environment, and defines two routes (/ and /about) that render templates with the specified titles.
"""

# internal
from business_objects.store.product_category import Product_Category #, Filters_Product_Category
from forms.store.product_category import Filters_Product_Category
from models.model_view_store_product_category import Model_View_Store_Product_Category
from helpers.helper_app import Helper_App
import lib.argument_validation as av
# external
from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session, Blueprint, current_app
from extensions import db, oauth
from urllib.parse import quote_plus, urlencode
from authlib.integrations.flask_client import OAuth
from authlib.integrations.base_client import OAuthError
from urllib.parse import quote, urlparse, parse_qs


routes_store_product_category = Blueprint('routes_store_product_category', __name__)


@routes_store_product_category.route(Model_View_Store_Product_Category.HASH_PAGE_STORE_PRODUCT_CATEGORIES, methods=['GET'])
def categories():
    Helper_App.console_log('categories')
    try:
        form_filters = Filters_Product_Category.from_json(request.args)
    except Exception as e:
        Helper_App.console_log(f'Error: {e}')
        form_filters = Filters_Product_Category()
    Helper_App.console_log(f'form_filters={form_filters}')
    model = Model_View_Store_Product_Category(form_filters)
    if not model.is_user_logged_in:
        return redirect(url_for('routes_core.home'))
    return render_template('pages/store/_product_categories.html', model = model)

@routes_store_product_category.route(Model_View_Store_Product_Category.HASH_SAVE_STORE_PRODUCT_CATEGORY, methods=['POST'])
def save_category():
    data = Helper_App.get_request_data(request)
    try:
        form_filters = Filters_Product_Category.from_json(data[Model_View_Store_Product_Category.FLAG_FORM_FILTERS])
        if not form_filters.validate_on_submit():
            return jsonify({
                Model_View_Store_Product_Category.FLAG_STATUS: Model_View_Store_Product_Category.FLAG_FAILURE, 
                Model_View_Store_Product_Category.FLAG_MESSAGE: f'Filters form invalid.\n{form_filters.errors}'
            })
        
        categories = data[Model_View_Store_Product_Category.FLAG_PRODUCT_CATEGORY]
        if len(categories) == 0:
            return jsonify({
                Model_View_Store_Product_Category.FLAG_STATUS: Model_View_Store_Product_Category.FLAG_FAILURE, 
                Model_View_Store_Product_Category.FLAG_MESSAGE: f'No categories.'
            })
        objsCategory = []
        for category in categories:
            objsCategory.append(Product_Category.from_json(category))
        Helper_App.console_log(f'objsCategory={objsCategory}')
        errors = Model_View_Store_Product_Category.save_categories(data.get('comment', 'No comment'), objsCategory)

        model_return = Model_View_Store_Product_Category(form_filters_old=form_filters)
        if not model_return.is_user_logged_in:
            raise Exception('User not logged in')
        if (len(errors) > 0):
            return jsonify({
                Model_View_Store_Product_Category.FLAG_STATUS: Model_View_Store_Product_Category.FLAG_FAILURE, 
                Model_View_Store_Product_Category.FLAG_MESSAGE: f'Error saving categories.\n{model_return.convert_list_objects_to_json(errors)}'
            })
        return jsonify({
            Model_View_Store_Product_Category.FLAG_STATUS: Model_View_Store_Product_Category.FLAG_SUCCESS, 
            Model_View_Store_Product_Category.FLAG_DATA: model_return.category_list.to_json()
        })
    except Exception as e:
        return jsonify({
            Model_View_Store_Product_Category.FLAG_STATUS: Model_View_Store_Product_Category.FLAG_FAILURE, 
            Model_View_Store_Product_Category.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'
        })
    