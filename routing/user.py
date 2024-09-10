"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: App Routing
Feature:    User Routes

Description:
Initializes the Flask application, sets the configuration based on the environment, and defines two routes (/ and /about) that render templates with the specified titles.
"""

# IMPORTS
# internal
from models.model_view_base import Model_View_Base
from models.model_view_user import Model_View_User
from business_objects.user import User, User_Filters
from datastores.datastore_user import DataStore_User
from helpers.helper_app import Helper_App
import lib.argument_validation as av
# external
from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session, Blueprint, current_app
from extensions import db, oauth
from urllib.parse import quote_plus, urlencode
from authlib.integrations.flask_client import OAuth
from authlib.integrations.base_client import OAuthError
from urllib.parse import quote, urlparse, parse_qs

routes_user = Blueprint('routes_user', __name__)

# User authentication
@routes_user.route("/login", methods=['POST'])
def login():
    try:
        data = request.json
    except:
        data = {}
    print(f'data={data}')
    # callback_login = F'{Model_View_Base.HASH_CALLBACK_LOGIN}{data.get(Model_View_Base.KEY_CALLBACK, Model_View_Base.HASH_PAGE_HOME)}'
    
    # encoded_path = quote(data.get(Model_View_Base.KEY_CALLBACK, Model_View_Base.HASH_PAGE_HOME))
    uri_redirect = url_for('routes_user.login_callback', _external=True) # , subpath=encoded_path
    
    # uri_redirect = f'{current_app.URL_HOST}/login_callback?subpath={data.get(Model_View_Base.KEY_CALLBACK, Model_View_Base.HASH_PAGE_HOME)}'
    print(f'redirect uri: {uri_redirect}')
    hash_callback = data.get(Model_View_Base.KEY_CALLBACK, Model_View_Base.HASH_PAGE_HOME)
    print(f'hash_callback: {hash_callback}')

    red = oauth.auth0.authorize_redirect(
        redirect_uri = uri_redirect,
        state = quote(hash_callback)
    )
    print(f'redirect: {red}')
    headers = red.headers['Location']
    print(f'headers: {headers}')
    parsed_url = urlparse(headers)
    query_params = parse_qs(parsed_url.query)
    print(f"""
    OAuth Authorize Redirect URL:
    
    Base URL: {parsed_url.scheme}://{parsed_url.netloc}{parsed_url.path}
    {parsed_url}
    
    Query Parameters: {query_params}
    """)
    return jsonify({'Success': True, Model_View_Base.FLAG_STATUS: Model_View_Base.FLAG_SUCCESS, f'{Model_View_Base.KEY_CALLBACK}': headers})

@routes_user.route("/login_callback") # <path:subpath>/<code>
def login_callback():
    try:
        # print(f'code: {code}')
        token = None
        try:
            token = oauth.auth0.authorize_access_token()
        except Exception as e:
            # Log the error for debugging
            print(f"Error: {str(e)}")
        session[current_app.config['ID_TOKEN_USER']] = token
        # import user id
        print(f'str(type(token)) = {str(type(token))}')
        print(f'token = {token}')
        userinfo = token.get('userinfo')
        print(f'user info: {userinfo}')
        # id_user = token.get('sub')
        id_user = userinfo.get('sub')
        print(f'user ID: {id_user}')

        datastore_user = DataStore_User()
        user = datastore_user.get_user_auth0()
        user_filters = User_Filters.from_user(user)
        users, errors = datastore_user.get_many_user(user_filters, user)
        try:
            user = users[0]
            print('User logged in')
            print(f'user ({str(type(user))}): {user}')
            print(f'user key: {Model_View_Base.KEY_USER}')
            user_json = user.to_json()
            session[Model_View_Base.KEY_USER] = user_json
            print(f'user stored on session')
        except:
            print(f'User not found: {user_filters}\nDatabase query error: {errors}')
        
        try:
            hash_callback = token.get('hash_callback')
            if hash_callback is None:
                print('hash is none')
                state = request.args.get('state')
                print(f'state: {state}')
                hash_callback = state # .get('hash_callback')
            print(f'hash_callback: {hash_callback}')
        except:
            print("get hash callback failed")
        # id_user = get_id_user()
        # add user to database
        # DataStore_Store().add_new_user(id_user) # this is part of get basket - should occur on page load

        print(f'user session: {session[Model_View_Base.KEY_USER]}')
        return redirect(f"{current_app.config['URL_HOST']}{hash_callback}")
    except Exception as e:
        return jsonify({Model_View_Base.FLAG_STATUS: Model_View_Base.STATUS_FAILURE, Model_View_Base.FLAG_MESSAGE: f'Controller error.\n{e}'})

@routes_user.route("/logout")
def logout():
    session.clear()
    url_logout = f"https://{current_app.config['DOMAIN_AUTH0']}/v2/logout?" + urlencode(
        {
            "returnTo": url_for("routes_user.logout_callback", _external=True),
            "client_id": current_app.config['ID_AUTH0_CLIENT'],
        }# ,
        # quote_via=quote_plus,
    )
    current_app.logger.debug(f"Redirecting to {url_logout}")
    print(f"Redirecting to {url_logout}")
    return redirect(url_logout)

@routes_user.route("/logout_callback") # <path:subpath>/<code>
def logout_callback():
    return redirect(url_for('routes_core.home'))
    try:
        session[current_app.ID_TOKEN_USER] = None
        user = User()
        try:
            hash_callback = token.get('hash_callback')
            if hash_callback is None:
                print('hash is none')
                state = request.args.get('state')
                print(f'state: {state}')
                hash_callback = state # .get('hash_callback')
            print(f'hash_callback: {hash_callback}')
        except:
            print("get hash callback failed")
        # id_user = get_id_user()
        # add user to database
        # DataStore_Store().add_new_user(id_user) # this is part of get basket - should occur on page load

        print(f'user session: {session[Model_View_Base.KEY_USER]}')
        return redirect(f'{current_app.URL_HOST}{hash_callback}')
    except Exception as e:
        return jsonify({Model_View_Base.FLAG_STATUS: Model_View_Base.STATUS_FAILURE, Model_View_Base.FLAG_MESSAGE: f'Controller error.\n{e}'})


@routes_user.route("/user")
def user():
    try:
        model = Model_View_User(current_app, db)
        html_body = render_template('pages/user/_user.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
