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
    # data = Helper_App.get_request_data(request)
    try:
        form_filters = Filters_Product_Category.from_json(request.args)
    except Exception as e:
        Helper_App.console_log(f'Error: {e}')
        form_filters = Filters_Product_Category()
    Helper_App.console_log(f'form_filters={form_filters}')
    """
    filters = Filters_Product_Category.get_default()
    have_changed_filters = False
    arg_filter_is_not_empty = request.args.get(Model_View_Store_Product_Category.FLAG_IS_NOT_EMPTY, None)
    have_changed_filters = have_changed_filters or arg_filter_is_not_empty is None
    Helper_App.console_log(f'arg_filter_is_not_empty={arg_filter_is_not_empty}')
    filters.is_not_empty = filters.is_not_empty if arg_filter_is_not_empty is None else av.input_bool(arg_filter_is_not_empty, 'is_not_empty', 'filter_category')
    arg_filter_active = request.args.get(Model_View_Store_Product_Category.FLAG_ACTIVE, None)
    have_changed_filters = have_changed_filters or arg_filter_active is None
    Helper_App.console_log(f'arg_filter_active={arg_filter_active}')
    filters.active = filters.active if arg_filter_active is None else av.input_bool(arg_filter_active, 'active', 'filter_category')
    if have_changed_filters:
        Helper_App.console_log('redirecting')
        return redirect(url_for('routes_store_product_category.categories', **filters.to_json()))
    """
    model = Model_View_Store_Product_Category(form_filters)
    if not model.is_user_logged_in:
        # return redirect(url_for('routes_user.login', data = jsonify({ Model_View_Store_Product_Category.FLAG_CALLBACK: Model_View_Store_Product_Category.HASH_PAGE_STORE_PRODUCT_CATEGORIES })))
        return redirect(url_for('routes_core.home'))
    return render_template('pages/store/_product_categories.html', model = model)

@routes_store_product_category.route(Model_View_Store_Product_Category.HASH_GET_STORE_PRODUCT_CATEGORY, methods=['POST'])
def filter_category():
    data = Helper_App.get_request_data(request)
    # form_filters = None
    try:
        form_filters = Filters_Product_Category.from_json(data)
        if not form_filters.validate_on_submit():
            return jsonify({
                Model_View_Store_Product_Category.FLAG_STATUS: Model_View_Store_Product_Category.FLAG_FAILURE, 
                Model_View_Store_Product_Category.FLAG_MESSAGE: f'Form invalid.\n{form_filters.errors}'
            })
        # ToDo: manually validate category, product
        # filters_form = Filters_Product_Category.from_form(form_filters)
        model = Model_View_Store_Product_Category(form_filters = form_filters)
        if not model.is_user_logged_in:
            raise Exception('User not logged in')
        return jsonify({
            Model_View_Store_Product_Category.FLAG_STATUS: Model_View_Store_Product_Category.FLAG_SUCCESS, 
            Model_View_Store_Product_Category.FLAG_DATA: model.category_list.to_json()
        })
    except Exception as e:
        return jsonify({
            Model_View_Store_Product_Category.FLAG_STATUS: Model_View_Store_Product_Category.FLAG_FAILURE, 
            Model_View_Store_Product_Category.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'
        })

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
        # filters_form = Filters_Product_Category.from_form(form_filters)
        
        categories = data[Model_View_Store_Product_Category.FLAG_PRODUCT_CATEGORY]
        if len(categories) == 0:
            return jsonify({
                Model_View_Store_Product_Category.FLAG_STATUS: Model_View_Store_Product_Category.FLAG_FAILURE, 
                Model_View_Store_Product_Category.FLAG_MESSAGE: f'No categories.'
            })
        objsCategory = []
        for category in categories:
            objsCategory.append(Product_Category.from_json(category))
        # model_save = Model_View_Store_Product_Category() # filters_product=filters_form)
        Helper_App.console_log(f'objsCategory={objsCategory}')
        Model_View_Store_Product_Category.save_categories(data.get('comment', 'No comment'), objsCategory)

        model_return = Model_View_Store_Product_Category(form_filters=form_filters)
        if not model_return.is_user_logged_in:
            raise Exception('User not logged in')
        return jsonify({
            Model_View_Store_Product_Category.FLAG_STATUS: Model_View_Store_Product_Category.FLAG_SUCCESS, 
            Model_View_Store_Product_Category.FLAG_DATA: model_return.category_list.to_json()
        })
    except Exception as e:
        return jsonify({
            Model_View_Store_Product_Category.FLAG_STATUS: Model_View_Store_Product_Category.FLAG_FAILURE, 
            Model_View_Store_Product_Category.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'
        })
    