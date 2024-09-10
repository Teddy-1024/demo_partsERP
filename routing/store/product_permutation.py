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
from business_objects.store.product import Product, Filters_Product, Product_Permutation
from business_objects.store.stock_item import Stock_Item, Stock_Item_Filters
from forms.forms import Form_Supplier, Form_Filters_Permutation, Form_Filters_Stock_Item
from models.model_view_base import Model_View_Base
from models.model_view_store import Model_View_Store
from models.model_view_store_supplier import Model_View_Store_Supplier
from models.model_view_store_product_category import Model_View_Store_Product_Category
from models.model_view_store_product_permutation import Model_View_Store_Product_Permutation
from models.model_view_store_stock_items import Model_View_Store_Stock_Items
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


@routes_store_product_permutation.route('/store/permutations', methods=['GET'])
def permutation():
    filters = Filters_Product.get_default()
    model = Model_View_Store_Product_Permutation(filters_product=filters)
    return render_template('pages/store/_product_permutations.html', model = model)

@routes_store_product_permutation.route('/store/permutation_filter', methods=['POST'])
def permutation_filter():
    data = Helper_App.get_request_data(request)
    form_filters = None
    try:
        form_filters = get_Form_Filters_Permutation(data)
        if not form_filters.validate_on_submit():
            return jsonify({Model_View_Base.FLAG_STATUS: Model_View_Base.STATUS_FAILURE, Model_View_Base.FLAG_MESSAGE: f'Form invalid.\n{form_filters.errors}'})
        # ToDo: manually validate category, product
        filters_form = Filters_Product.from_form(form_filters)
        model = Model_View_Store_Product_Permutation(filters_product=filters_form)
        return jsonify({Model_View_Base.FLAG_STATUS: Model_View_Base.FLAG_SUCCESS, 'Success': True, Model_View_Base.KEY_DATA: model.category_list.to_permutation_row_list()})
    except Exception as e:
        return jsonify({Model_View_Base.FLAG_STATUS: Model_View_Base.STATUS_FAILURE, Model_View_Base.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'})

def get_Form_Filters_Permutation(data_request):
    data_form = data_request[Model_View_Store_Product_Permutation.KEY_FORM]
    form_filters = Form_Filters_Permutation(**data_form)
    form_filters.is_out_of_stock.data = av.input_bool(data_form['is_out_of_stock'], 'is_out_of_stock', 'permutations_post')
    return form_filters

@routes_store_product_permutation.route('/store/permutation_save', methods=['POST'])
def permutation_save():
    data = Helper_App.get_request_data(request)
    form_filters = None
    try:
        form_filters = get_Form_Filters_Permutation(data)
        if not form_filters.validate_on_submit():
            return jsonify({Model_View_Base.FLAG_STATUS: Model_View_Base.STATUS_FAILURE, Model_View_Base.FLAG_MESSAGE: f'Filters form invalid.\n{form_filters.errors}'})
        
        permutations = data[Model_View_Store_Product_Permutation.KEY_PERMUTATIONS]
        if len(permutations) == 0:
            return jsonify({Model_View_Base.FLAG_STATUS: Model_View_Base.STATUS_FAILURE, Model_View_Base.FLAG_MESSAGE: f'No permutations.'})
        objsPermutation = []
        for permutation in permutations:
            objsPermutation.append(Product_Permutation.from_json(permutation))

        # ToDo: manually validate category, product
        filters_form = Filters_Product.from_form(form_filters)
        model_save = Model_View_Store_Product_Permutation(filters_product=filters_form)
        model_save.save_permutations(data.comment, objsPermutation)

        model_return = Model_View_Store_Product_Permutation(filters_product=filters_form)
        return jsonify({Model_View_Base.FLAG_STATUS: Model_View_Base.FLAG_SUCCESS, 'Success': True, Model_View_Base.KEY_DATA: model_return.category_list.to_permutation_row_list()})
    except Exception as e:
        return jsonify({Model_View_Base.FLAG_STATUS: Model_View_Base.STATUS_FAILURE, Model_View_Base.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'})
    