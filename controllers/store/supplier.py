"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: App Routing
Feature:    Store Supplier Routes

Description:
Initializes the Flask application, sets the configuration based on the environment, and defines two routes (/ and /about) that render templates with the specified titles.
"""

# internal
from business_objects.store.supplier import Supplier
from forms.store.supplier import Filters_Supplier
from models.model_view_store_supplier import Model_View_Store_Supplier
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

routes_store_supplier = Blueprint('routes_store_supplier', __name__)

@routes_store_supplier.route(Model_View_Store_Supplier.HASH_PAGE_STORE_SUPPLIERS, methods=['GET'])
def suppliers():
    Helper_App.console_log('suppliers')
    try:
        form_filters = Filters_Supplier.from_json(request.args)
    except Exception as e:
        Helper_App.console_log(f'Error: {e}')
        form_filters = Filters_Supplier()
    Helper_App.console_log(f'form_filters={form_filters}')
    model = Model_View_Store_Supplier(form_filters)
    if not model.is_user_logged_in:
        return redirect(url_for('routes_core.home'))
    return render_template('pages/store/_suppliers.html', model = model, datetime = datetime)

@routes_store_supplier.route(Model_View_Store_Supplier.HASH_GET_STORE_SUPPLIER, methods=['POST'])
def filter_supplier():
    data = Helper_App.get_request_data(request)
    try:
        form_filters = Filters_Supplier.from_json(data)
        if not form_filters.validate_on_submit():
            error_keys = list(form_filters.errors.keys())
            try:
                error_keys.remove(Supplier.ATTR_ID_PRODUCT_CATEGORY)
            except:
                pass
            try:
                error_keys.remove(Supplier.ATTR_ID_PRODUCT)
            except:
                pass
            if error_keys:
                return jsonify({
                    Model_View_Store_Supplier.FLAG_STATUS: Model_View_Store_Supplier.FLAG_FAILURE, 
                    Model_View_Store_Supplier.FLAG_MESSAGE: f'Form invalid.\n{form_filters.errors}'
                })
        model = Model_View_Store_Supplier(form_filters_old = form_filters)
        if not model.is_user_logged_in:
            raise Exception('User not logged in.')
        return jsonify({
            Model_View_Store_Supplier.FLAG_STATUS: Model_View_Store_Supplier.FLAG_SUCCESS, 
            Model_View_Store_Supplier.FLAG_DATA: {supplier.id_supplier: supplier.to_json() for supplier in model.suppliers}
        })
    except Exception as e:
        return jsonify({
            Model_View_Store_Supplier.FLAG_STATUS: Model_View_Store_Supplier.FLAG_FAILURE, 
            Model_View_Store_Supplier.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'
        })

@routes_store_supplier.route(Model_View_Store_Supplier.HASH_SAVE_STORE_SUPPLIER, methods=['POST'])
def save_supplier():
    data = Helper_App.get_request_data(request)
    try:
        form_filters = Filters_Supplier.from_json(data[Model_View_Store_Supplier.FLAG_FORM_FILTERS])
        Helper_App.console_log(f'form_filters: {form_filters}')

        suppliers = data[Model_View_Store_Supplier.FLAG_SUPPLIER]
        if len(suppliers) == 0:
            return jsonify({
                Model_View_Store_Supplier.FLAG_STATUS: Model_View_Store_Supplier.FLAG_FAILURE, 
                Model_View_Store_Supplier.FLAG_MESSAGE: f'No stock items.'
            })
        Helper_App.console_log(f'suppliers={suppliers}')
        objs_supplier = []
        for supplier in suppliers:
            objs_supplier.append(Supplier.from_json(supplier))
        Helper_App.console_log(f'objs_supplier={objs_supplier}')

        save_errors = Model_View_Store_Supplier.save_suppliers(data.get('comment', 'No comment'), objs_supplier)
        if len(save_errors) > 0:
            return jsonify({
                Model_View_Store_Supplier.FLAG_STATUS: Model_View_Store_Supplier.FLAG_FAILURE, 
                Model_View_Store_Supplier.FLAG_MESSAGE: f'Save errors: {save_errors}'
            })
        model_return = Model_View_Store_Supplier(form_filters_old = form_filters)
        if not model_return.is_user_logged_in:
            raise Exception('User not logged in.')
        return jsonify({
            Model_View_Store_Supplier.FLAG_STATUS: Model_View_Store_Supplier.FLAG_SUCCESS, 
            Model_View_Store_Supplier.FLAG_DATA: {supplier.id_supplier: supplier.to_json() for supplier in model_return.suppliers}
        })
    except Exception as e:
        return jsonify({
            Model_View_Store_Supplier.FLAG_STATUS: Model_View_Store_Supplier.FLAG_FAILURE, 
            Model_View_Store_Supplier.FLAG_MESSAGE: f'Bad data received by controller.\n{e}'
        })
    