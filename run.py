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

if __name__ == '__main__':
    app.run(debug=True)