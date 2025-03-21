"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Backend
Feature:    Launcher

Description:
Runs project.
"""

from app import app
import os
from dotenv import load_dotenv, find_dotenv

load_dotenv(find_dotenv())

if __name__ == '__main__':
    app.run(debug=(os.getenv('FLASK_ENV') == 'development'))
    # app.run(debug=True, host="0.0.0.0", port=5000)