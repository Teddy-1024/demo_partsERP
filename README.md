## demo_partsERP
Demo subproject of partsERP Enterprise Resource Planning system featuring the core product functionality.  
This web app uses Python with Flask for the server and MySQL for the database.

## Build And Run
# 0. Prerequisites
- Python 3.10
- npm
- Locally hosted MySQL database

# 1. Create Auth0 application for project

# 2. (Optional) Create Google ReCAPTCHA service
NOTE: IF CONTACT US PAGE FORM FUNCTIONALITY IS REQUIRED, COMPLETE THIS STEP.  
2.1. Go to the reCAPTCHA Admin Console and register your site: https://www.google.com/recaptcha/admin  
2.2. Choose reCAPTCH v2  
2.3. Generate and save keys for step 10  

# 3. (Optional) Create bot email account
NOTE: IF CONTACT US PAGE FORM FUNCTIONALITY IS REQUIRED, COMPLETE THIS STEP.  
3.1. Using your chosen email provider, create a new account for sending emails from the web server  

# 4. Create and populate database
4.1. Sign into your local MySQL workspace  
4.2. Run script static/MySQL/0000_combined.sql  

# 5. Open the project in a new terminal window
5.1. Open a new terminal window  
5.2. Navigate to the project with the following command  
- cd path/to/project/main/directory  

# 6. Create virtual environment
6.1. Terminal command  
python3 -m venv env_demo_partsERP  

# 7. Enter virtual environment
7.1. Terminal command  
source env_demo_partsERP/bin/activate  

# 8. Run module bundler
8.1. Terminal command  
npm run build  

# 9. Install required python packages
9.1. Terminal command  
pip3 install -r requirements.txt  

# 10. Set required environment variables
10.1. Windows command  
SET variable_name=variable_value  

10.2. Linux command  
export variable_name=variable_value  

10.3. Required variables
| Name | Purpose | Example Value |
| -------- | -------- | -------- |
| KEY_SECRET_FLASK | Private key for server encryption. | password123 |
| ID_AUTH0_CLIENT | Public identifier for project's Auth0 application. | erDasdku8asdncuSAAS88C71nSioRR2r |
| ID_AUTH0_CLIENT_SECRET | Private key for project's Auth0 application. | erDasdku8asdncuSAAS88C71nSioRR2rerDasdku8asdncuSAAS88C71nSioRR2r |
| DOMAIN_AUTH0 | Domain for requests related to project's Auth0 application. | dev-pdjf9043dsau7fas8fs.us.auth0.com |
| SQLALCHEMY_DATABASE_URI | Database connection string for SQLAlchemy. | mysql://db_user_name:db_password@127.0.0.1:3306/db_name |
| URL_HOST | Domain (and port as necessary) that the project is hosted on. | https://127.0.0.1:5000/ |

10.4. Optional variables
| Name | Purpose | Example Value |
| -------- | -------- | -------- |
| MAIL_DEFAULT_SENDER | Bot email address. Required for sending internal emails following form completion on Contact Us page. | bot@partsltd.co.uk |
| MAIL_CONTACT_PUBLIC | Company's public communications email address. Required for receiving internal emails following form completion on Contact Us page. | teddy@partltd.co.uk |
| MAIL_PASSWORD | Password for bot email account. Required for receiving internal emails following form completion on Contact Us page. | password123 |
| RECAPTCHA_PUBLIC_KEY | Public key for Google ReCAPTCHA. Required for bot-prevention mesaures on Contact Us page form.| erDasdku8asdncuSAAS88C71nSioRR2rerDasdku |
| RECAPTCHA_PRIVATE_KEY | Private key for Google ReCAPTCHA. Required for bot-prevention mesaures on Contact Us page form. | erDasdku8asdncuSAAS88C71nSioRR2rerDasdku |

# 11. Host project
# Either:
- Host for local machine  
python3 -m flask run

- Host for local network  
python3 -m flask run --host=0.0.0.0


## File Structure
# Files dedicated to each page
CSS:  
    page  
HTML:  
    page  
    row  
JavaScript:  
    page  
    api  
    router  
    base - navigation buttons  
MySQL:  
    get  
    save  
    table  
    staging table  
    audit table  
Python:  
    business object  
    controller  
    datastore  
    form  
    model  