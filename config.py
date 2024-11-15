"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Backend
Feature:    Configuration

Description:
Configuration variables
"""

# IMPORTS
from lib import argument_validation as av
import os
from dotenv import load_dotenv, find_dotenv
from flask import current_app

load_dotenv(find_dotenv())

# CLASSES
class Config:
    is_development = False
    is_production = False
    # Miscellaneous
    DEBUG = False # av.input_bool(os.getenv('DEBUG'), 'DEBUG', 'Config')
    TESTING = False
    URL_HOST = os.getenv('URL_HOST')
    SECRET_KEY = os.getenv('KEY_SECRET_FLASK') # gen cmd: openssl rand -hex 32
    # Add other configuration variables as needed
    # MySQL
    SQLALCHEMY_DATABASE_URI = os.getenv('SQLALCHEMY_DATABASE_URI')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_ENGINE_OPTIONS = {
        'pool_size': 10,
        'pool_recycle': 280,
        'pool_pre_ping': True,
        'pool_timeout': 30,
    }
    # Auth0
    SESSION_COOKIE_SECURE = True
    SESSION_COOKIE_HTTPONLY = True
    # SESSION_COOKIE_SAMESITE = 'Lax'
    # PERMANENT_SESSION_LIFETIME = 3600
    WTF_CSRF_ENABLED = True
    # WTF_CSRF_CHECK_DEFAULT = False  # We'll check it manually for API routes
    # WTF_CSRF_HEADERS = ['X-CSRFToken']  # Accept CSRF token from this header
    WTF_CSRF_TIME_LIMIT = None
    WTF_CSRF_SSL_STRICT = False  # Allows testing without HTTPS
    ID_AUTH0_CLIENT = os.getenv('ID_AUTH0_CLIENT')
    ID_AUTH0_CLIENT_SECRET = os.getenv('ID_AUTH0_CLIENT_SECRET')
    DOMAIN_AUTH0 = os.getenv('DOMAIN_AUTH0')
    ID_TOKEN_USER = 'user'
    # PostgreSQL
    DB_NAME = os.getenv('partsltd')
    DB_USER = os.getenv('DB_USER')
    DB_PASSWORD = os.getenv('DB_PASSWORD')
    DB_HOST = os.getenv('DB_HOST')
    # DB_PORT = os.getenv('DB_PORT')
    # Store
    # is_included_VAT = True
    """
    KEY_IS_INCLUDED_VAT = 'is_included_VAT'
    code_currency = 1
    KEY_CODE_CURRENCY = 'id_currency'
    code_region_delivery = 1
    KEY_CODE_REGION_DELIVERY = 'id_region_delivery'
    KEY_ID_CURRENCY = 'id_currency'
    KEY_ID_REGION_DELIVERY = 'id_region_delivery'
    """
    # id_currency = 1
    # id_region_delivery = 1
    # Mail
    MAIL_DEBUG = False # av.input_bool(os.getenv('DEBUG'), 'DEBUG', 'Config')
    MAIL_SERVER = 'mail.partsltd.co.uk' # 'smtp.gmail.com'
    MAIL_PORT = 465 # 587
    MAIL_USE_TLS = False
    MAIL_USE_SSL = True
    MAIL_USERNAME = os.getenv('MAIL_DEFAULT_SENDER')
    MAIL_PASSWORD = os.getenv('MAIL_PASSWORD')
    MAIL_DEFAULT_SENDER = os.getenv('MAIL_DEFAULT_SENDER')
    MAIL_CONTACT_PUBLIC = os.getenv('MAIL_CONTACT_PUBLIC')
    # Recaptcha
    RECAPTCHA_PUBLIC_KEY = os.getenv('RECAPTCHA_PUBLIC_KEY')
    RECAPTCHA_PRIVATE_KEY = os.getenv('RECAPTCHA_PRIVATE_KEY')

class DevelopmentConfig(Config):
    is_development = True
    # Add development-specific configuration variables
    DEBUG = True
    MAIL_DEBUG = True
    SESSION_COOKIE_SECURE = False

class ProductionConfig(Config):
    is_production = True
    # Add production-specific configuration variables
    pass

# Set the configuration class based on the environment
# You can change 'development' to 'production' when deploying
config_env = os.getenv('FLASK_ENV', "development")
with open('app.log', 'a') as f:
    print(f'config_env: {config_env}')
    f.write(f'config_env: {config_env}\n')
    # current_app.logger.error(f'config_env: {config_env}') # logger not yet initialised
if config_env == 'development':
    app_config = DevelopmentConfig
elif config_env == 'production':
    app_config = ProductionConfig
else:
    raise ValueError("Invalid configuration environment")

# environment variables
"""
SET KEY_SECRET_FLASK=nips
SET ID_AUTH0_CLIENT=
SET ID_AUTH0_CLIENT_SECRET=
SET DOMAIN_AUTH0=
SET MAIL_PASSWORD=
SET RECAPTCHA_PUBLIC_KEY=
SET RECAPTCHA_PRIVATE_KEY=
SET SQLALCHEMY_DATABASE_URI=
SET URL_HOST=
"""
# SET SQLALCHEMY_DATABASE_URI = mysql://username:password@localhost/dbname
    # Replace 'username', 'password', 'localhost', and 'dbname' with your actual database credentials