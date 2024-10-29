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
from business_objects.store.stock_item import Stock_Item
from forms.store.stock_item import Filters_Stock_Item
from models.model_view_store_stock_item import Model_View_Store_Stock_Item
from helpers.helper_app import Helper_App
import lib.argument_validation as av
# external
from datetime import datetime
from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session, Blueprint, current_app
from extensions import db, oauth
from urllib.parse import quote_plus, urlencode
from authlib.integrations.flask_client import OAuth
from authlib.integrations.base_client import OAuthError
from urllib.parse import quote, urlparse, parse_qs
import requests

routes_store_stock_item = Blueprint('routes_store_stock_item', __name__)

@routes_store_stock_item.route(Model_View_Store_Stock_Item.HASH_PAGE_STORE_STOCK_ITEMS, methods=['GET'])
def stock_items():
    Helper_App.console_log('stock_items')
    try:
        form_filters = Filters_Stock_Item.from_json(request.args)
    except Exception as e:
        Helper_App.console_log(f'Error: {e}')
        form_filters = Filters_Stock_Item()
    Helper_App.console_log(f'form_filters={form_filters}')
    model = Model_View_Store_Stock_Item(form_filters)
    if not model.is_user_logged_in:
        # return redirect(url_for('routes_user.login', data = jsonify({ Model_View_Store_Stock_Item.FLAG_CALLBACK: Model_View_Store_Stock_Item.HASH_PAGE_STORE_STOCK_ITEMS })))
        # return requests.post(f"{current_app.config['URL_HOST']}{url_for('routes_user.login')}", json={ Model_View_Store_Stock_Item.FLAG_CALLBACK: Model_View_Store_Stock_Item.HASH_PAGE_STORE_STOCK_ITEMS })
        return redirect(url_for('routes_core.home'))
    return render_template('pages/store/_stock_items.html', model = model, datetime = datetime)

@routes_store_stock_item.route(Model_View_Store_Stock_Item.HASH_GET_STORE_STOCK_ITEM, methods=['POST'])
def filter_stock_item():
    data = Helper_App.get_request_data(request)
    try:
        form_filters = Filters_Stock_Item.from_json(data)
        if not form_filters.validate_on_submit():
            error_keys = list(form_filters.errors.keys())
            try:
                error_keys.remove(Stock_Item.ATTR_ID_PRODUCT_CATEGORY)
                """
                if not av.val_int(form_filters.id_product_category.data):
                    form_filters.errors[Stock_Item.ATTR_ID_PRODUCT_CATEGORY] = ['Invalid category.']
                """
            except:
                pass
            try:
                error_keys.remove(Stock_Item.ATTR_ID_PRODUCT)
            except:
                pass
            if error_keys:
                return jsonify({
                    Model_View_Store_Stock_Item.FLAG_STATUS: Model_View_Store_Stock_Item.FLAG_FAILURE, 
                    Model_View_Store_Stock_Item.FLAG_MESSAGE: f'Form invalid.\n{form_filters.errors}'
                })
        model = Model_View_Store_Stock_Item(filters_stock_item = form_filters)
        if not model.is_user_logged_in:
            raise Exception('User not logged in.')
        return jsonify({
            Model_View_Store_Stock_Item.FLAG_STATUS: Model_View_Store_Stock_Item.FLAG_SUCCESS, 
            Model_View_Store_Stock_Item.FLAG_DATA: model.category_list.to_json()
        })
    except Exception as e:
        return jsonify({
            Model_View_Store_Stock_Item.FLAG_STATUS: Model_View_Store_Stock_Item.FLAG_FAILURE, 
            Model_View_Store_Stock_Item.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'
        })

@routes_store_stock_item.route(Model_View_Store_Stock_Item.HASH_SAVE_STORE_STOCK_ITEM, methods=['POST'])
def save_stock_item():
    data = Helper_App.get_request_data(request)
    try:
        form_filters = Filters_Stock_Item.from_json(data[Model_View_Store_Stock_Item.FLAG_FORM_FILTERS])
        """
        if not form_filters.validate_on_submit():
            error_keys = list(form_filters.errors.keys())
            try:
                error_keys.remove(Stock_Item.ATTR_ID_PRODUCT_CATEGORY)
                ""
                if not av.val_int(form_filters.id_product_category.data):
                    form_filters.errors[Stock_Item.ATTR_ID_PRODUCT_CATEGORY] = ['Invalid category.']
                ""
            except:
                pass
            try:
                error_keys.remove(Stock_Item.ATTR_ID_PRODUCT)
            except:
                pass
            if error_keys:
                return jsonify({
                    Model_View_Store_Stock_Item.FLAG_STATUS: Model_View_Store_Stock_Item.FLAG_FAILURE, 
                    Model_View_Store_Stock_Item.FLAG_MESSAGE: f'Form invalid.\n{form_filters.errors}'
                })
        """
        # filters_form = Filters_Stock_Item.from_form(form_filters)
        Helper_App.console_log(f'form_filters: {form_filters}')

        stock_items = data[Model_View_Store_Stock_Item.FLAG_STOCK_ITEM]
        if len(stock_items) == 0:
            return jsonify({
                Model_View_Store_Stock_Item.FLAG_STATUS: Model_View_Store_Stock_Item.FLAG_FAILURE, 
                Model_View_Store_Stock_Item.FLAG_MESSAGE: f'No stock items.'
            })
        Helper_App.console_log(f'stock_items={stock_items}')
        objs_stock_item = []
        for stock_item in stock_items:
            objs_stock_item.append(Stock_Item.from_json(stock_item))
        # model_save = Model_View_Store_Stock_Item() # filters_product=filters_form)
        Helper_App.console_log(f'objs_stock_item={objs_stock_item}')
        save_errors = Model_View_Store_Stock_Item.save_stock_items(data.get('comment', 'No comment'), objs_stock_item)
        if len(save_errors) > 0:
            return jsonify({
                Model_View_Store_Stock_Item.FLAG_STATUS: Model_View_Store_Stock_Item.FLAG_FAILURE, 
                Model_View_Store_Stock_Item.FLAG_MESSAGE: f'Save errors: {save_errors}'
            })
        model_return = Model_View_Store_Stock_Item(filters_stock_item=form_filters)
        if not model_return.is_user_logged_in:
            raise Exception('User not logged in.')
        return jsonify({
            Model_View_Store_Stock_Item.FLAG_STATUS: Model_View_Store_Stock_Item.FLAG_SUCCESS, 
            Model_View_Store_Stock_Item.FLAG_DATA: model_return.category_list.to_json()
        })
    except Exception as e:
        return jsonify({
            Model_View_Store_Stock_Item.FLAG_STATUS: Model_View_Store_Stock_Item.FLAG_FAILURE, 
            Model_View_Store_Stock_Item.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'
        })
    