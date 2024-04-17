"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: Backend
Feature:    Controller - Webpage routing

Description:
Defines the routes and view functions for each page.
Manages the interaction between the frontend and backend.
"""

from flask import render_template, url_for, Blueprint
from app import app
from app.forms import Form_Contact
# from forms import MyForm
# from app import MyForm
from models.model_view_contact import Model_View_Contact

@app.route('/', methods=['GET'])
def home():
    return render_template('_home.html', title='Home')

@app.route('/store', methods=['GET'])
def store_home():
    return render_template('_store_home.html', title='Store Home')

@app.route('/contact', methods=['GET', 'POST'])
def contact():
    form = Form_Contact()
    if form.validate_on_submit():
        # Handle form submission
        email = form.sender_email.data
        CC = form.sender_CC.data
        name = form.sender_name.data
        msg = form.sender_message.data
    # return render_template('contact.html', form=form)
    # return render_template('_contact.html', title='Contact Us')
    return render_template('contact.html', model=Model_View_Contact(form))

"""
@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/contact', methods=['GET', 'POST'])
def contact():
    form = MyForm()
    if form.validate_on_submit():
        # Handle form submission
        pass
    return render_template('contact.html', form=form)
"""