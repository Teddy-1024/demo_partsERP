# demo_partsERP
Demo subproject of partsERP Enterprise Resource Planning system featuring the core product functionality.  
This web app uses Python with Flask for the server and MySQL for the database.

# Build And Run
NOTE: ALL INSTRUCTIONS ARE FOR LINUX.  
## 0. Prerequisites
- Python 3.10
- npm
- Locally hosted MySQL database
- Auth0 application for project
- (Optional) Google ReCAPTCHA public and secret keys
- (Optional) Bot email account

## 1. Create and populate database
1.1. Sign into your local MySQL workspace  
1.2. Run script static/MySQL/0000_combined.sql  

## 2. Open the project in a new terminal window
2.1. Open a new terminal window  
2.2. Navigate to the project with the following command  
- cd path/to/project/main/directory  

## 3. Create virtual environment
3.1. Terminal command  
- python3 -m venv env_demo_partsERP  

## 4. Enter virtual environment
4.1. Terminal command  
- source env_demo_partsERP/bin/activate  

## 5. Run module bundler
5.1. Terminal command  
- npm run build  

## 6. Install required python packages
6.1. Terminal command  
- pip3 install -r requirements.txt  

## 7. Set required environment variables
7.1. Terminal command  
- export variable_name=variable_value  

7.2. Required variables
| Name | Purpose | Example Value |
| -------- | -------- | -------- |
| KEY_SECRET_FLASK | Private key for server encryption. | password123 |
| ID_AUTH0_CLIENT | Public identifier for project's Auth0 application. | erDasdku8asdncuS... |
| ID_AUTH0_CLIENT_SECRET | Private key for project's Auth0 application. | erDasdku8asdncuSAAS88... |
| DOMAIN_AUTH0 | Domain for requests related to project's Auth0 application. | dev-pdjf9043dsau7fas8fs.us.auth0.com |
| SQLALCHEMY_DATABASE_URI | Database connection string for SQLAlchemy. | mysql://db_user_name:db_password@127.0.0.1:3306/db_name |
| URL_HOST | Domain (and port as necessary) that the project is hosted on. | https://127.0.0.1:5000/ |

7.3. Optional variables
| Name | Purpose | Example Value |
| -------- | -------- | -------- |
| MAIL_DEFAULT_SENDER | Bot email address. Required for sending internal emails following form completion on Contact Us page. | bot@partsltd.co.uk |
| MAIL_CONTACT_PUBLIC | Company's public communications email address. Required for receiving internal emails following form completion on Contact Us page. | teddy@partltd.co.uk |
| MAIL_PASSWORD | Password for bot email account. Required for receiving internal emails following form completion on Contact Us page. | password123 |
| RECAPTCHA_PUBLIC_KEY | Public key for Google reCAPTCHA. Required for bot-prevention mesaures on Contact Us page form.| erDasdku8asdncuSAAS88... |
| RECAPTCHA_PRIVATE_KEY | Private key for Google reCAPTCHA. Required for bot-prevention mesaures on Contact Us page form. | erDasdku8asdncuSAAS8... |

## 8. Host project
NOTE: DO EITHER 8.1 OR 8.2.  
8.1. Host for local machine  
- python3 -m flask run

8.2. Host for local network  
- python3 -m flask run --host=0.0.0.0


# File Structure
## Files dedicated to each page
CSS:  
- page  

HTML:  
- page  
- row  

JavaScript:  
- page  
- api  
- router  
- base - navigation buttons  

MySQL:  
- get  
- save  
- table  
- staging table  
- audit table  

Python:  
- business object  
- controller  
- datastore  
- form  
- model  


# Link
Live demo site  
[https://erp.sandbox.partsenterprise.partsltd.co.uk/](https://erp.sandbox.partsenterprise.partsltd.co.uk/)  
  
Credentials portal for live demo site  
[https://auth.sandbox.teddy.org.uk/?target=https%3A%2F%2Ferp.sandbox.partsenterprise.partsltd.co.uk](https://auth.sandbox.teddy.org.uk/?target=https%3A%2F%2Ferp.sandbox.partsenterprise.partsltd.co.uk)  


# Gallery
Product Category page  
![Product Category page](static/docs/page-product_category.png)
  
Product Variation page  
![Product Variation page](static/docs/page-product_variation.png)


# License
This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details