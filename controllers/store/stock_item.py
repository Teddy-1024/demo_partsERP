"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: App Routing
Feature:    Store Stock Item Routes

Description:
Initializes the Flask application, sets the configuration based on the environment, and defines two routes (/ and /about) that render templates with the specified titles.
"""

# internal
from business_objects.store.product import Product, Parameters_Product, Product_Permutation
from business_objects.store.stock_item import Stock_Item
from forms.store.stock_item import Filters_Stock_Item
from models.model_view_base import Model_View_Base
from models.model_view_store import Model_View_Store
from models.model_view_store_supplier import Model_View_Store_Supplier
from models.model_view_store_product_category import Model_View_Store_Product_Category
from models.model_view_store_product_permutation import Model_View_Store_Product_Permutation
from models.model_view_store_stock_item import Model_View_Store_Stock_Item
from helpers.helper_app import Helper_App
import lib.argument_validation as av
# external
from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session, Blueprint, current_app
from extensions import db, oauth
from urllib.parse import quote_plus, urlencode
from authlib.integrations.flask_client import OAuth
from authlib.integrations.base_client import OAuthError
from urllib.parse import quote, urlparse, parse_qs


routes_store_stock_item = Blueprint('routes_store_stock_item', __name__)

"""
@routes_store_stock_item.route('/store/stock_items', methods=['GET'])
def stock():
    filters = Filters_Stock_Item.get_default()
    model = Model_View_Store_Stock_Item(filters_stock_item=filters)
    return render_template('pages/store/_stock_items.html', model = model)

@routes_store_stock_item.route('/store/stock_item_filter', methods=['POST'])
def stock_filter():
    data = Helper_App.get_request_data(request)
    form_filters = None
    try:
        form_filters = get_Filters_Stock_Items(data)
        if not form_filters.validate_on_submit():
            return jsonify({Model_View_Base.FLAG_STATUS: Model_View_Base.FLAG_FAILURE, Model_View_Base.FLAG_MESSAGE: f'Form invalid.\n{form_filters.errors}'})
        # ToDo: manually validate category, product
        filters_form = Filters_Stock_Item.from_form(form_filters)
        model = Model_View_Store_Stock_Item(filters_stock_item=filters_form)
        return jsonify({Model_View_Base.FLAG_STATUS: Model_View_Base.FLAG_SUCCESS, 'Success': True, Model_View_Base.KEY_DATA: model.category_list.to_permutation_row_list()})
    except Exception as e:
        return jsonify({Model_View_Base.FLAG_STATUS: Model_View_Base.FLAG_FAILURE, Model_View_Base.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'})

def get_Filters_Stock_Items(data_request):
    data_form = data_request[Model_View_Store_Stock_Item.KEY_FORM]
    form_filters = Filters_Stock_Item(**data_form)
    form_filters.is_out_of_stock.data = av.input_bool(data_form['is_out_of_stock'], 'is_out_of_stock', 'permutations_post')
    return form_filters

@routes_store_stock_item.route('/store/stock_item_save', methods=['POST'])
def stock_save():
    data = Helper_App.get_request_data(request)
""
    form_filters = None
    try:
        form_filters = get_Filters_Stock_Items(data)
        if not form_filters.validate_on_submit():
            return jsonify({Model_View_Base.FLAG_STATUS: Model_View_Base.FLAG_FAILURE, Model_View_Base.FLAG_MESSAGE: f'Filters form invalid.\n{form_filters.errors}'})
        
        stock_items = data[Model_View_Store_Stock.KEY_PERMUTATIONS]
        print(f'stock_items: {stock_items}')
        if len(stock_items) == 0:
            return jsonify({Model_View_Base.FLAG_STATUS: Model_View_Base.FLAG_FAILURE, Model_View_Base.FLAG_MESSAGE: f'No stock items.'})
        objsStockItem = []
        for stock_item in stock_items:
            objsStockItem.append(Product_Permutation.from_json(stock_item))
        print(f'objsStockItem: {objsStockItem}')

        # ToDo: manually validate category, product
        filters_form = Stock_Filters.from_form(form_filters)
        model_save = Model_View_Store_Stock(filters_product=filters_form)
        model_save.save_stock_items(data.comment, objsPermutation)

        model_return = Model_View_Store_Stock(filters_product=filters_form)
        return jsonify({Model_View_Base.FLAG_STATUS: Model_View_Base.FLAG_SUCCESS, 'Success': True, Model_View_Base.KEY_DATA: model_return.category_list.to_permutation_row_list()})
    except Exception as e:
        return jsonify({Model_View_Base.FLAG_STATUS: Model_View_Base.FLAG_FAILURE, Model_View_Base.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'})
""
"""


@routes_store_stock_item.route(Model_View_Store_Stock_Item.HASH_PAGE_STORE_STOCK_ITEMS, methods=['GET'])
def permutations():
    print('permutations')
    try:
        form_filters = Filters_Stock_Item.from_json(request.args)
    except Exception as e:
        print(f'Error: {e}')
        form_filters = Filters_Stock_Item()
    print(f'form_filters={form_filters}')
    model = Model_View_Store_Stock_Item(form_filters)
    return render_template('pages/store/_stock_items.html', model = model)

@routes_store_stock_item.route(Model_View_Store_Stock_Item.HASH_GET_STORE_STOCK_ITEM, methods=['POST'])
def filter_permutation():
    data = Helper_App.get_request_data(request)
    try:
        form_filters = Filters_Stock_Item.from_json(data)
        if not form_filters.validate_on_submit():
            return jsonify({
                Model_View_Store_Stock_Item.FLAG_STATUS: Model_View_Store_Stock_Item.FLAG_FAILURE, 
                Model_View_Store_Stock_Item.FLAG_MESSAGE: f'Form invalid.\n{form_filters.errors}'
            })
        model = Model_View_Store_Stock_Item(form_filters = form_filters)
        return jsonify({
            Model_View_Store_Stock_Item.FLAG_STATUS: Model_View_Store_Stock_Item.FLAG_SUCCESS, 
            Model_View_Store_Stock_Item.KEY_DATA: model.category_list.to_json()
        })
    except Exception as e:
        return jsonify({
            Model_View_Store_Stock_Item.FLAG_STATUS: Model_View_Store_Stock_Item.FLAG_FAILURE, 
            Model_View_Store_Stock_Item.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'
        })

@routes_store_stock_item.route(Model_View_Store_Stock_Item.HASH_SAVE_STORE_STOCK_ITEM, methods=['POST'])
def save_permutation():
    data = Helper_App.get_request_data(request)
    try:
        form_filters = Filters_Stock_Item.from_json(data[Model_View_Store_Stock_Item.FLAG_FORM_FILTERS])
        if not form_filters.validate_on_submit():
            return jsonify({
                Model_View_Store_Stock_Item.FLAG_STATUS: Model_View_Store_Stock_Item.FLAG_FAILURE, 
                Model_View_Store_Stock_Item.FLAG_MESSAGE: f'Filters form invalid.\n{form_filters.errors}'
            })
        # filters_form = Filters_Stock_Item.from_form(form_filters)
        print(f'form_filters: {form_filters}')

        permutations = data[Model_View_Store_Stock_Item.FLAG_STOCK_ITEM]
        if len(permutations) == 0:
            return jsonify({
                Model_View_Store_Stock_Item.FLAG_STATUS: Model_View_Store_Stock_Item.FLAG_FAILURE, 
                Model_View_Store_Stock_Item.FLAG_MESSAGE: f'No permutations.'
            })
        objsPermutation = []
        for permutation in permutations:
            objsPermutation.append(Stock_Item.from_json(permutation))
        # model_save = Model_View_Store_Stock_Item() # filters_product=filters_form)
        print(f'objsPermutation={objsPermutation}')
        Model_View_Store_Stock_Item.save_permutations(data.get('comment', 'No comment'), objsPermutation)

        model_return = Model_View_Store_Stock_Item(form_filters=form_filters)
        print('nips')
        return jsonify({
            Model_View_Store_Stock_Item.FLAG_STATUS: Model_View_Store_Stock_Item.FLAG_SUCCESS, 
            Model_View_Store_Stock_Item.KEY_DATA: model_return.category_list.to_json()
        })
    except Exception as e:
        return jsonify({
            Model_View_Store_Stock_Item.FLAG_STATUS: Model_View_Store_Stock_Item.FLAG_FAILURE, 
            Model_View_Store_Stock_Item.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'
        })
    