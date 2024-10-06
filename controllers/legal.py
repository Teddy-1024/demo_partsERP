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
# from models.model_view_home import Model_View_Home
from models.model_view_license import Model_View_License
from models.model_view_privacy_policy import Model_View_Privacy_Policy
from models.model_view_accessibility_report import Model_View_Accessibility_Report
from models.model_view_accessibility_statement import Model_View_Accessibility_Statement
from models.model_view_retention_schedule import Model_View_Retention_Schedule
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
        model = Model_View_License()
        html_body = render_template('pages/legal/_license.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
@routes_legal.route('/accessibility-statement', methods=['GET'])
def accessibility_statement():
    try:
        model = Model_View_Accessibility_Statement()
        html_body = render_template('pages/legal/_accessibility_statement.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
@routes_legal.route('/accessibility-report', methods=['GET'])
def accessibility_report():
    try:
        model = Model_View_Accessibility_Report()
        html_body = render_template('pages/legal/_accessibility_report.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
@routes_legal.route('/retention-schedule', methods=['GET'])
def retention_schedule():
    try:
        model = Model_View_Retention_Schedule()
        html_body = render_template('pages/legal/_retention_schedule.html', model = model)
    except Exception as e:
        return str(e)
    return html_body
@routes_legal.route('/privacy-policy', methods=['GET'])
def privacy_policy():
    try:
        model = Model_View_Privacy_Policy()
        html_body = render_template('pages/legal/_privacy_policy.html', model = model)
    except Exception as e:
        return str(e)
    return html_body

