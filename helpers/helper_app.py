"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Helpers
Feature:    App Helper
"""

# internal

# external
from pydantic import BaseModel, ConfigDict
# from flask import Flask, render_template, jsonify, request,  render_template_string, send_from_directory, redirect, url_for, session
# from flask_sqlalchemy import SQLAlchemy


class Helper_App(BaseModel):

    @staticmethod
    def get_request_data(request):
        try:
            return request.json
        except:
            try:
                return request.data
            except:
                try:
                    return request.form
                except:
                    return {}