"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: App Routing
Feature:    Legal Routes

Description:
Initializes the Flask application, sets the configuration based on the environment, and defines two routes (/ and /about) that render templates with the specified titles.
"""

# IMPORTS
# internal
from models.model_view_home import Model_View_Home
import lib.argument_validation as av
# external
from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session, Blueprint, current_app
from extensions import db, oauth
from urllib.parse import quote_plus, urlencode
from authlib.integrations.flask_client import OAuth
from authlib.integrations.base_client import OAuthError
from urllib.parse import quote, urlparse, parse_qs

routes_legal = Blueprint('routes_legal', __name__)


# snore
@routes_legal.route('/license', methods=['GET'])
def license():
    try:
        model = Model_View_Home()
        html_body = render_template('_page_license.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
@routes_legal.route('/accessibility-statement', methods=['GET'])
def accessibility_statement():
    try:
        model = Model_View_Home()
        html_body = render_template('_page_accessibility_statement.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
@routes_legal.route('/accessibility-report', methods=['GET'])
def accessibility_report():
    try:
        model = Model_View_Home()
        html_body = render_template('_page_accessibility_report.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
@routes_legal.route('/retention-schedule', methods=['GET'])
def retention_schedule():
    try:
        model = Model_View_Home()
        html_body = render_template('_page_retention_schedule.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
@routes_legal.route('/privacy-notice', methods=['GET'])
def privacy_notice():
    try:
        model = Model_View_Home()
        html_body = render_template('_page_privacy_notice.html', model = model)
    except Exception as e:
        return str(e)
    return html_body

