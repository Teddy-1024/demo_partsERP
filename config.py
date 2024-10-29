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

load_dotenv(find_dotenv())

# CLASSES
class Config:
    # Miscellaneous
    DEBUG = av.input_bool(os.getenv('DEBUG'), 'DEBUG', 'Config')
    TESTING = False
    URL_HOST = os.getenv('URL_HOST')
    SECRET_KEY = os.getenv('KEY_SECRET_FLASK') # gen cmd: openssl rand -hex 32
    # Add other configuration variables as needed
    # MySQL
    SQLALCHEMY_DATABASE_URI = os.getenv('SQLALCHEMY_DATABASE_URI')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    # Auth0
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
    MAIL_DEBUG = av.input_bool(os.getenv('DEBUG'), 'DEBUG', 'Config')
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
    DEBUG = True
    # Add development-specific configuration variables

class ProductionConfig(Config):
    # Add production-specific configuration variables
    pass

# Set the configuration class based on the environment
# You can change 'development' to 'production' when deploying
config_env = 'development'
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