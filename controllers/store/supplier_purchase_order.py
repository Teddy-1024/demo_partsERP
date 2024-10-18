"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: App Routing
Feature:    Store Supplier_Purchase_Order Routes

Description:
Initializes the Flask application, sets the configuration based on the environment, and defines two routes (/ and /about) that render templates with the specified titles.
"""

# internal
from business_objects.store.supplier_purchase_order import Supplier_Purchase_Order
from forms.store.supplier_purchase_order import Filters_Supplier_Purchase_Order
from models.model_view_store_supplier_purchase_order import Model_View_Store_Supplier_Purchase_Order
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

routes_store_supplier_purchase_order = Blueprint('routes_store_supplier_purchase_order', __name__)

@routes_store_supplier_purchase_order.route(Model_View_Store_Supplier_Purchase_Order.HASH_PAGE_STORE_SUPPLIER_PURCHASE_ORDERS, methods=['GET'])
def supplier_purchase_orders():
    print('supplier_purchase_orders')
    try:
        form_filters = Filters_Supplier_Purchase_Order.from_json(request.args)
    except Exception as e:
        print(f'Error: {e}')
        form_filters = Filters_Supplier_Purchase_Order()
    print(f'form_filters={form_filters}')
    model = Model_View_Store_Supplier_Purchase_Order(form_filters)
    if not model.is_user_logged_in:
        return redirect(url_for('routes_core.home'))
    return render_template('pages/store/_supplier_purchase_orders.html', model = model, datetime = datetime)

@routes_store_supplier_purchase_order.route(Model_View_Store_Supplier_Purchase_Order.HASH_GET_STORE_SUPPLIER_PURCHASE_ORDER, methods=['POST'])
def filter_supplier_purchase_order():
    data = Helper_App.get_request_data(request)
    try:
        form_filters = Filters_Supplier_Purchase_Order.from_json(data)
        if not form_filters.validate_on_submit():
            error_keys = list(form_filters.errors.keys())
            try:
                error_keys.remove(Supplier_Purchase_Order.ATTR_ID_PRODUCT_CATEGORY)
            except:
                pass
            try:
                error_keys.remove(Supplier_Purchase_Order.ATTR_ID_PRODUCT)
            except:
                pass
            if error_keys:
                return jsonify({
                    Model_View_Store_Supplier_Purchase_Order.FLAG_STATUS: Model_View_Store_Supplier_Purchase_Order.FLAG_FAILURE, 
                    Model_View_Store_Supplier_Purchase_Order.FLAG_MESSAGE: f'Form invalid.\n{form_filters.errors}'
                })
        model = Model_View_Store_Supplier_Purchase_Order(filters_supplier_purchase_order = form_filters)
        if not model.is_user_logged_in:
            raise Exception('User not logged in.')
        return jsonify({
            Model_View_Store_Supplier_Purchase_Order.FLAG_STATUS: Model_View_Store_Supplier_Purchase_Order.FLAG_SUCCESS, 
            Model_View_Store_Supplier_Purchase_Order.FLAG_DATA: model.category_list.to_json()
        })
    except Exception as e:
        return jsonify({
            Model_View_Store_Supplier_Purchase_Order.FLAG_STATUS: Model_View_Store_Supplier_Purchase_Order.FLAG_FAILURE, 
            Model_View_Store_Supplier_Purchase_Order.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'
        })

@routes_store_supplier_purchase_order.route(Model_View_Store_Supplier_Purchase_Order.HASH_SAVE_STORE_SUPPLIER_PURCHASE_ORDER, methods=['POST'])
def save_supplier_purchase_order():
    data = Helper_App.get_request_data(request)
    try:
        form_filters = Filters_Supplier_Purchase_Order.from_json(data[Model_View_Store_Supplier_Purchase_Order.FLAG_FORM_FILTERS])
        print(f'form_filters: {form_filters}')

        supplier_purchase_orders = data[Model_View_Store_Supplier_Purchase_Order.FLAG_SUPPLIER_PURCHASE_ORDER]
        if len(supplier_purchase_orders) == 0:
            return jsonify({
                Model_View_Store_Supplier_Purchase_Order.FLAG_STATUS: Model_View_Store_Supplier_Purchase_Order.FLAG_FAILURE, 
                Model_View_Store_Supplier_Purchase_Order.FLAG_MESSAGE: f'No stock items.'
            })
        print(f'supplier_purchase_orders={supplier_purchase_orders}')
        objs_supplier_purchase_order = []
        for supplier_purchase_order in supplier_purchase_orders:
            objs_supplier_purchase_order.append(Supplier_Purchase_Order.from_json(supplier_purchase_order))
        print(f'objs_supplier_purchase_order={objs_supplier_purchase_order}')
        save_errors = Model_View_Store_Supplier_Purchase_Order.save_supplier_purchase_orders(data.get('comment', 'No comment'), objs_supplier_purchase_order)
        if len(save_errors) > 0:
            return jsonify({
                Model_View_Store_Supplier_Purchase_Order.FLAG_STATUS: Model_View_Store_Supplier_Purchase_Order.FLAG_FAILURE, 
                Model_View_Store_Supplier_Purchase_Order.FLAG_MESSAGE: f'Save errors: {save_errors}'
            })
        model_return = Model_View_Store_Supplier_Purchase_Order(filters_supplier_purchase_order_old = form_filters)
        if not model_return.is_user_logged_in:
            raise Exception('User not logged in.')
        return jsonify({
            Model_View_Store_Supplier_Purchase_Order.FLAG_STATUS: Model_View_Store_Supplier_Purchase_Order.FLAG_SUCCESS, 
            Model_View_Store_Supplier_Purchase_Order.FLAG_DATA: model_return.category_list.to_json()
        })
    except Exception as e:
        return jsonify({
            Model_View_Store_Supplier_Purchase_Order.FLAG_STATUS: Model_View_Store_Supplier_Purchase_Order.FLAG_FAILURE, 
            Model_View_Store_Supplier_Purchase_Order.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'
        })
    