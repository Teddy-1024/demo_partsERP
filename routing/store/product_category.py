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
from business_objects.store.product_category import Product_Category, Filters_Product_Category
from forms.store.product_category import Form_Filters_Product_Category
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
    filters = Filters_Product_Category.get_default()
    model = Model_View_Store_Product_Category(filters)
    return render_template('_page_store_product_categories.html', model = model)

@routes_store_product_category.route(Model_View_Store_Product_Category.HASH_GET_STORE_PRODUCT_CATEGORY, methods=['POST'])
def filter_category():
    data = Helper_App.get_request_data(request)
    # form_filters = None
    try:
        form_filters = get_Form_Filters_Product_Category(data)
        if not form_filters.validate_on_submit():
            return jsonify({'status': 'failure', 'Message': f'Form invalid.\n{form_filters.errors}'})
        # ToDo: manually validate category, product
        filters_form = Filters_Product_Category.from_form(form_filters)
        model = Model_View_Store_Product_Category(filters_category = filters_form)
        return jsonify({'status': 'success', 'Success': True, 'data': model.category_list.to_json_str()})
    except Exception as e:
        return jsonify({'status': 'failure', 'Message': f'Bad data received by controller.\n{e}'})

def get_Form_Filters_Product_Category(data_request):
    data_form = data_request[Model_View_Store_Product_Category.KEY_FORM]
    form_filters = Form_Filters_Product_Category(**data_form)
    form_filters.is_not_empty.data = av.input_bool(data_form['is_not_empty'], 'is_not_empty', 'filter_category')
    form_filters.active.data = av.input_bool(data_form['active'], 'active', 'filter_category')
    return form_filters

@routes_store_product_category.route(Model_View_Store_Product_Category.HASH_SAVE_STORE_PRODUCT_CATEGORY, methods=['POST'])
def save_category():
    data = Helper_App.get_request_data(request)
    # form_filters = None
    print(f'data={data}')
    try:
        form_filters = get_Form_Filters_Product_Category(data)
        if not form_filters.validate_on_submit():
            return jsonify({'status': 'failure', 'Message': f'Filters form invalid.\n{form_filters.errors}'})
        filters_form = Filters_Product_Category.from_form(form_filters)
        
        categories = data[Model_View_Store_Product_Category.FLAG_PRODUCT_CATEGORY]
        if len(categories) == 0:
            return jsonify({'status': 'failure', 'Message': f'No categories.'})
        objsCategory = []
        for category in categories:
            objsCategory.append(Product_Category.from_json(category))
        # model_save = Model_View_Store_Product_Category() # filters_product=filters_form)
        print(f'objsCategory={objsCategory}')
        Model_View_Store_Product_Category.save_categories(data.get('comment', 'No comment'), objsCategory)

        model_return = Model_View_Store_Product_Category(filters_category=filters_form)
        print('nips')
        return jsonify({'status': 'success', 'Success': True, 'data': model_return.category_list.to_json_str()})
    except Exception as e:
        return jsonify({'status': 'failure', 'Message': f'Bad data received by controller.\n{e}'})
    