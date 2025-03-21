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
from business_objects.user import User, Parameters_User
from datastores.datastore_user import DataStore_User
from helpers.helper_app import Helper_App
import lib.argument_validation as av
# external
from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session, Blueprint, current_app
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import exc
from flask_wtf.csrf import generate_csrf
from werkzeug.exceptions import BadRequest
from extensions import oauth # db, 
from urllib.parse import quote_plus, urlencode
from authlib.integrations.flask_client import OAuth
from authlib.integrations.base_client import OAuthError
from urllib.parse import quote, urlparse, parse_qs
from functools import wraps

db = SQLAlchemy()

routes_user = Blueprint('routes_user', __name__)

def handle_db_disconnect(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        try:
            return f(*args, **kwargs)
        except exc.OperationalError as e:
            if "MySQL server has gone away" in str(e):
                # Close the session and create a new connection
                db.session.remove()
                db.session.rollback()
                # Retry the operation
                return f(*args, **kwargs)
            raise
    return decorated_function

# User authentication
@routes_user.route("/login", methods=['POST', 'OPTIONS'])
def login():
    try:
        Helper_App.console_log('login')
        Helper_App.console_log(f'method={request.method}')
        try:
            data = request.json
            try:
                data = request.get_json()
            except:
                data = {}
        except:
            data = {}
        Helper_App.console_log(f'data={data}')
        hash_callback = data.get(Model_View_Base.FLAG_CALLBACK, Model_View_Base.HASH_PAGE_HOME)
        Helper_App.console_log(f'hash_callback: {hash_callback}')

        """
        # Verify CSRF token manually
        Helper_App.console_log(f'request headers={request.headers}')
        token = request.headers.get(Model_View_Base.FLAG_CSRF_TOKEN)
        Helper_App.console_log(f'token={token}')
        Helper_App.console_log(f'session={session}')
        Helper_App.console_log(f'session token={session.get('csrf_token')}')
        if not token or token != session.get('csrf_token'):
            token = data.get(Model_View_Base.FLAG_CSRF_TOKEN, None)
            Helper_App.console_log(f'token={token}')
            if not token or token != session.get('csrf_token'):
                raise BadRequest('Invalid or missing CSRF token')
        """
        # OAuth login
        # callback_login = F'{Model_View_Base.HASH_CALLBACK_LOGIN}{data.get(Model_View_Base.FLAG_CALLBACK, Model_View_Base.HASH_PAGE_HOME)}'
        
        # encoded_path = quote(data.get(Model_View_Base.FLAG_CALLBACK, Model_View_Base.HASH_PAGE_HOME))
        uri_redirect = url_for('routes_user.login_callback', _external=True) # , subpath=encoded_path
        
        # uri_redirect = f'{current_app.URL_HOST}/login_callback?subpath={data.get(Model_View_Base.FLAG_CALLBACK, Model_View_Base.HASH_PAGE_HOME)}'
        Helper_App.console_log(f'redirect uri: {uri_redirect}')

        Helper_App.console_log(f'Before red')

        red = oauth.auth0.authorize_redirect(
            redirect_uri = uri_redirect,
            state = quote(hash_callback)
        )
        Helper_App.console_log(f'redirect: {red}')
        headers = red.headers['Location']
        Helper_App.console_log(f'headers: {headers}')
        parsed_url = urlparse(headers)
        query_params = parse_qs(parsed_url.query)
        Helper_App.console_log(f"""
        OAuth Authorize Redirect URL:
        
        Base URL: {parsed_url.scheme}://{parsed_url.netloc}{parsed_url.path}
        {parsed_url}
        
        Query Parameters: {query_params}
        """)
        return jsonify({'Success': True, Model_View_Base.FLAG_STATUS: Model_View_Base.FLAG_SUCCESS, f'{Model_View_Base.FLAG_CALLBACK}': headers})

        return jsonify({'status': 'success', 'redirect': callback})
    except Exception as e:
        return jsonify({'status': 'error', 'message': str(e)}), 400
    

@routes_user.route("/login_callback")
@handle_db_disconnect
def login_callback():
    Helper_App.console_log('login_callback')
    try:
        error_state = request.args.get(Model_View_User.FLAG_ERROR_OAUTH)
        has_error = error_state is not None
        if has_error:
            error_description = request.args.get(Model_View_User.FLAG_ERROR_DESCRIPTION_OAUTH)
            error_text = f'Error: {error_state}: {error_description}'
            Helper_App.console_log(error_text)
            return login()
        token = None
        try:
            token = oauth.auth0.authorize_access_token()
        except Exception as e:
            Helper_App.console_log(f"Error: {str(e)}")
        session[current_app.config['ID_TOKEN_USER']] = token
        user = User.from_json_auth0(token)
        Helper_App.console_log(f'user: {user}')
        filters = Parameters_User.from_user(user)
        datastore_user = DataStore_User()
        users, errors = datastore_user.get_many_user(filters, user)
        try:
            user = users[0]
            Helper_App.console_log('User logged in')
            Helper_App.console_log(f'user ({str(type(user))}): {user}')
            Helper_App.console_log(f'user key: {Model_View_Base.FLAG_USER}')
            user_json = user.to_json()
            session[Model_View_Base.FLAG_USER] = user_json
            Helper_App.console_log(f'user stored on session')
        except:
            Helper_App.console_log(f'User not found: {Parameters_User}\nDatabase query error: {errors}')
        
        try:
            hash_callback = token.get('hash_callback')
            if hash_callback is None:
                Helper_App.console_log('hash is none')
                state = request.args.get('state')
                Helper_App.console_log(f'state: {state}')
                hash_callback = state 
            Helper_App.console_log(f'hash_callback: {hash_callback}')
        except:
            Helper_App.console_log("get hash callback failed")

        Helper_App.console_log(f'user session: {session[Model_View_Base.FLAG_USER]}')
        return redirect(f"{current_app.config['URL_HOST']}{hash_callback}")
    except Exception as e:
        return jsonify({Model_View_Base.FLAG_STATUS: Model_View_Base.FLAG_FAILURE, Model_View_Base.FLAG_MESSAGE: f'Controller error.\n{e}'})

@routes_user.route("/logout")
def logout():
    session.clear()
    url_logout = f"https://{current_app.config['DOMAIN_AUTH0']}/v2/logout?" + urlencode(
        {
            "returnTo": url_for("routes_user.logout_callback", _external=True),
            "client_id": current_app.config['ID_AUTH0_CLIENT'],
        }
    )
    Helper_App.console_log(f"Redirecting to {url_logout}")
    return redirect(url_logout)

@routes_user.route("/logout_callback")
@handle_db_disconnect
def logout_callback():
    return redirect(url_for('routes_core.home'))

@routes_user.route("/user")
def user():
    try:
        model = Model_View_User()
        for currency in model.currencies:
            if currency.id_currency == model.user.id_currency_default:
                model.user.currency_default = currency
                break
        for region in model.regions:
            if region.id_region == model.user.id_region_default:
                model.user.region_default = region
                break
        model.users = [model.user]
        if not model.is_user_logged_in:
            return redirect(url_for('routes_core.home'))
        html_body = render_template('pages/user/_user.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
