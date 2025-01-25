
from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session, current_app
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail, Message
from flask_wtf.csrf import CSRFProtect
from authlib.integrations.flask_client import OAuth


csrf = CSRFProtect()
# cors = CORS()
db = SQLAlchemy()
mail = Mail()
oauth = OAuth()