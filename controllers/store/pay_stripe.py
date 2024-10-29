"""
Project:    PARTS Website
Author:     Edward Middleton-Smith
            Precision And Research Technology Systems Limited

Technology: App General
Feature:    App

Description:
Initializes the Flask application, sets the configuration based on the environment, and defines two routes (/ and /about) that render templates with the specified titles.
"""

# IMPORTS
from helpers.helper_app import Helper_App
import os
import stripe
import json
from flask import Flask, render_template, render_template_string, jsonify, request, send_from_directory, redirect
from dotenv import load_dotenv, find_dotenv


# VARIABLE INSTANTIATION
key_secret = os.environ.get("KEY_SECRET_STRIPE")
key_public = os.environ.get("KEY_PUBLIC_STRIPE") # 'pk_test_51OGrxlL7BuLKjoMpfpfw7bSmZZK1MhqMoQ5VhW2jUj7YtoEejO4vqnxKPiqTHHuh9U4qqkywbPCSI9TpFKtr4SYH007KHMWs68'

# METHODS
def create_product_price():
    Helper_App.console_log(f'stripe.api_key = {stripe.api_key}')
    starter_subscription = stripe.Product.create(
    name="Starter Subscription",
    description="$12/Month subscription",
    )

    starter_subscription_price = stripe.Price.create(
    unit_amount=1200,
    currency="usd",
    recurring={"interval": "month"},
    product=starter_subscription['id'],
    )

    # Save these identifiers
    Helper_App.console_log(f"Success! Here is your starter subscription product id: {starter_subscription.id}")
    Helper_App.console_log(f"Success! Here is your starter subscription price id: {starter_subscription_price.id}")

    return starter_subscription_price.id

def get_file_str(f_address):
    f = open(f_address)
    return f.read()

# Ensure environment variables are set.
price = os.getenv('PRICE')
if price is None or price == 'price_12345' or price == '':
    Helper_App.console_log('You must set a Price ID in .env. Please see the README.')
    exit(0)

# For sample support and debugging, not required for production:
stripe.set_app_info(
    'stripe-samples/checkout-one-time-payments',
    version='0.0.1',
    url='https://github.com/stripe-samples/checkout-one-time-payments')

# stripe.api_version = '2020-08-27'
stripe.api_key = key_secret # os.getenv('KEY_SECRET_STRIPE')

app_dir = str(os.path.abspath(os.path.join(
    __file__, "..", "..")))
static_dir = str(os.path.abspath(os.path.join(
    app_dir, os.getenv("STATIC_DIR"))))
app = Flask(__name__, static_folder=static_dir,
            static_url_path="", template_folder=static_dir)


@app.route('/', methods=['GET'])
def get_example():
    # return render_template(f'{app_dir}\\templates\\_home.html') # f'{app_dir}\\templates\\layout.html')
    # return render_template_string(get_file_str(f'{app_dir}\\templates\\_home.html')) # f'{app_dir}\\templates\\layout.html')
    return render_template('../templates/_home.html')


@app.route('/config', methods=['GET'])
def get_publishable_key():
    price = stripe.Price.retrieve(os.getenv('PRICE'))
    return jsonify({
      'publicKey': key_public, # os.getenv('KEY_PUBLIC_STRIPE'),
      'unitAmount': price['unit_amount'],
      'currency': price['currency']
    })

# Fetch the Checkout Session to display the JSON result on the success page
@app.route('/checkout-session', methods=['GET'])
def get_checkout_session():
    id = request.args.get('sessionId')
    checkout_session = stripe.checkout.Session.retrieve(id)
    return jsonify(checkout_session)


@app.route('/create-checkout-session', methods=['POST'])
def create_checkout_session():
    quantity = request.form.get('quantity', 1)
    domain_url = os.getenv('DOMAIN')

    try:
        # Create new Checkout Session for the order
        # Other optional params include:
        # [billing_address_collection] - to display billing address details on the page
        # [customer] - if you have an existing Stripe Customer ID
        # [payment_intent_data] - lets capture the payment later
        # [customer_email] - lets you prefill the email input in the form
        # [automatic_tax] - to automatically calculate sales tax, VAT and GST in the checkout page
        # For full details see https://stripe.com/docs/api/checkout/sessions/create

        # ?session_id={CHECKOUT_SESSION_ID} means the redirect will have the session ID set as a query param
        checkout_session = stripe.checkout.Session.create(
            success_url=domain_url + '/success.html?session_id={CHECKOUT_SESSION_ID}',
            cancel_url=domain_url + '/canceled.html',
            mode='payment',
            # automatic_tax={'enabled': True},
            line_items=[{
                'price': os.getenv('PRICE'),
                'quantity': quantity,
            }]
        )
        return redirect(checkout_session.url, code=303)
    except Exception as e:
        return jsonify(error=str(e)), 403


@app.route('/webhook', methods=['POST'])
def webhook_received():
    # You can use webhooks to receive information about asynchronous payment events.
    # For more about our webhook events check out https://stripe.com/docs/webhooks.
    webhook_secret = os.getenv('STRIPE_WEBHOOK_SECRET')
    request_data = json.loads(request.data)

    if webhook_secret:
        # Retrieve the event by verifying the signature using the raw body and secret if webhook signing is configured.
        signature = request.headers.get('stripe-signature')
        try:
            event = stripe.Webhook.construct_event(
                payload=request.data, sig_header=signature, secret=webhook_secret)
            data = event['data']
        except Exception as e:
            return e
        # Get the type of webhook event sent - used to check the status of PaymentIntents.
        event_type = event['type']
    else:
        data = request_data['data']
        event_type = request_data['type']
    data_object = data['object']

    Helper_App.console_log('event ' + event_type)

    if event_type == 'checkout.session.completed':
        Helper_App.console_log('🔔 Payment succeeded!')

    return jsonify({Model_View_Base.FLAG_STATUS: Model_View_Base.FLAG_SUCCESS})


if __name__ == '__main__':
    # stripe.api_key = key_secret

    # create_product_price()

    # Setup Stripe python client library.
    load_dotenv(find_dotenv())
    app.run(port=4242, debug=True)