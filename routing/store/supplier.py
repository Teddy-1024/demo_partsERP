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
from business_objects.store.product import Product, Product_Filters, Product_Permutation
from business_objects.store.stock_item import Stock_Item, Stock_Item_Filters
from forms import Form_Supplier, Form_Filters_Permutation, Form_Filters_Stock_Item
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


routes_store_supplier= Blueprint('routes_store_supplier', __name__)


@routes_store_supplier.route('/supplier', methods=['GET'])
def supplier():
    try:
        data = request.json
    except:
        data = {}
    print(f'data={data}')
    form_data = data[Model_View_Store_Supplier.key_form]
    print(f'form_data: {form_data}')
    form = Form_Supplier(**form_data)
    print('form acquired')
    print(form.__repr__)
    if form.validate_on_submit():
        print('valid form')
        # model = input_JSON_basket(model, data)
        # if not logged in:
        try:
            model = Model_View_Store_Supplier(form)
            # print('importing basket')
            # model.import_JSON_basket(data)
            model.get_basket(data)
            permutation_id, quantity = model.import_JSON_basket_item(data, form)
            model.basket_item_edit(permutation_id, quantity, False) # new_basket = 
        except Exception as e:
            return jsonify({'status': 'failure', 'Message': f'Bad data received by controller.\n{e}'})
        # return jsonify(Success = True, data = { html_block: render_template(), Model_View_Store.key_basket: new_basket })
        # html_block = render_template('_block_store_basket.html', model = model)
        # print(f'html_block:\n{html_block}')
        # return jsonify(Success = True, data = { 'html_block': html_block, 'basket': {'items': model.basket.to_json_list()}})
        return render_template('_page_supplier.html', model = model)
    return jsonify({'status': 'failure', 'Message': f'Invalid supplier details.\n{form.errors}'})
