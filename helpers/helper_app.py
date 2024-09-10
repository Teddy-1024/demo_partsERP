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
        print(f'request={request}')
        data = {}
        try:
            data = request.json
        except:
            try:
                data = request.data
            except:
                try:
                    data = request.form
                except:
                    pass
        print(f'data={data}')
        return data