"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Backend
Feature:    Configuration

Description:
Configuration variables
"""

from lib import argument_validation as av
import os
from dotenv import load_dotenv, find_dotenv
from flask import current_app

load_dotenv(find_dotenv())

class Config:
    is_development = False
    is_production = False

    DB_HOST = os.getenv('DB_HOST')
    DB_NAME = os.getenv('partsltd_prod')
    DB_PASSWORD = os.getenv('DB_PASSWORD')
    DB_USER = os.getenv('DB_USER')
    DEBUG = False
    DOMAIN_AUTH0 = os.getenv('DOMAIN_AUTH0')
    ID_AUTH0_CLIENT = os.getenv('ID_AUTH0_CLIENT')
    ID_AUTH0_CLIENT_SECRET = os.getenv('ID_AUTH0_CLIENT_SECRET')
    ID_TOKEN_USER = 'user'
    MAIL_DEBUG = False
    MAIL_SERVER = 'mail.partsltd.co.uk'
    MAIL_PORT = 465
    MAIL_USE_TLS = False
    MAIL_USE_SSL = True
    MAIL_USERNAME = os.getenv('MAIL_DEFAULT_SENDER')
    MAIL_PASSWORD = os.getenv('MAIL_PASSWORD')
    MAIL_DEFAULT_SENDER = os.getenv('MAIL_DEFAULT_SENDER')
    MAIL_CONTACT_PUBLIC = os.getenv('MAIL_CONTACT_PUBLIC')
    RECAPTCHA_PUBLIC_KEY = os.getenv('RECAPTCHA_PUBLIC_KEY')
    RECAPTCHA_PRIVATE_KEY = os.getenv('RECAPTCHA_PRIVATE_KEY')
    REMEMBER_COOKIE_SECURE = True
    SECRET_KEY = os.getenv('KEY_SECRET_FLASK')
    SESSION_COOKIE_SECURE = True
    SESSION_COOKIE_HTTPONLY = True
    SESSION_COOKIE_SAMESITE = 'Lax' # 'Strict' # Strict is preferable for security, but Lax is required for OAuth functionality
    SQLALCHEMY_DATABASE_URI = os.getenv('SQLALCHEMY_DATABASE_URI')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_ENGINE_OPTIONS = {
        'pool_size': 10,
        'pool_recycle': 280,
        'pool_pre_ping': True,
        'pool_timeout': 30,
    }
    TESTING = False
    URL_HOST = os.getenv('URL_HOST')
    WTF_CSRF_ENABLED = True
    WTF_CSRF_SSL_STRICT = False
    WTF_CSRF_TIME_LIMIT = None

class DevelopmentConfig(Config):
    is_development = True
    DEBUG = True
    MAIL_DEBUG = True
    SESSION_COOKIE_SECURE = False

class ProductionConfig(Config):
    is_production = True

config_env = os.getenv('FLASK_ENV', "production")
with open('app.log', 'a') as f:
    print(f'config_env: {config_env}')
    f.write(f'config_env: {config_env}\n')
if config_env == 'development':
    app_config = DevelopmentConfig
elif config_env == 'production':
    app_config = ProductionConfig
else:
    raise ValueError("Invalid configuration environment")
