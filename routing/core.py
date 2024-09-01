"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: App Routing
Feature:    Core Routes

Description:
Initializes the Flask application, sets the configuration based on the environment, and defines two routes (/ and /about) that render templates with the specified titles.
"""

# IMPORTS
# internal
from forms.forms import Form_Contact
from models.model_view_admin_home import Model_View_Admin_Home
from models.model_view_contact import Model_View_Contact
from models.model_view_home import Model_View_Home
from models.model_view_services import Model_View_Services
import lib.argument_validation as av
# external
from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session, Blueprint, current_app
from flask_mail import Mail, Message
from extensions import db, oauth, mail
from urllib.parse import quote_plus, urlencode
from authlib.integrations.flask_client import OAuth
from authlib.integrations.base_client import OAuthError
from urllib.parse import quote, urlparse, parse_qs


routes_core = Blueprint('routes_core', __name__)


@routes_core.route(Model_View_Home.HASH_PAGE_HOME, methods=['GET'])
def home():
    try:
        model = Model_View_Home()
        print('nips')
        html_body = render_template('_page_home.html', model = model)
    except Exception as e:
        return jsonify(error=str(e)), 403
    return html_body
    
@routes_core.route(Model_View_Contact.HASH_PAGE_CONTACT, methods=['GET'])
def contact():
    try:
        form = Form_Contact()
        model = Model_View_Contact(form)
        html_body = render_template('_page_contact.html', model = model)
    except Exception as e:
        return jsonify(error=str(e)), 403
    return html_body

@routes_core.route(Model_View_Contact.HASH_PAGE_CONTACT, methods=['POST'])
def contact_post():
    try:
        form = Form_Contact()
        if form.validate_on_submit():
            # Handle form submission
            email = form.email.data
            CC = form.CC.data # not in use
            name = form.name.data
            message = form.message.data
            # send email
            mailItem = Message("PARTS Website Contact Us Message", recipients=[current_app.config['MAIL_CONTACT_PUBLIC']])
            mailItem.body = f"Dear Lord Edward Middleton-Smith,\n\n{message}\n\nKind regards,\n{name}\n{email}"
            mail.send(mailItem)
            return "Submitted."
        return "Invalid. Failed to submit."
        # html_body = render_template('_page_contact.html', model = model)
    except Exception as e:
        return jsonify(error=str(e)), 403

@routes_core.route(Model_View_Services.HASH_PAGE_SERVICES, methods=['GET', 'POST'])
def services():
    try:
        model = Model_View_Services()
        html_body =  render_template('_page_services.html', model = model)
    except Exception as e:
        return jsonify(error=str(e)), 403
    return html_body

@routes_core.route(Model_View_Admin_Home.HASH_PAGE_ADMIN_HOME, methods=['GET', 'POST'])
def admin_home():
    try:
        model = Model_View_Admin_Home()
        html_body =  render_template('_page_admin_home.html', model = model)
    except Exception as e:
        return jsonify(error=str(e)), 403
    return html_body
