# SaaS Base Application

__Warning. This repo is rebranded from SaaS-Idea. Please update your urls.__

This free SaaS base application allows you to create a working SaaS with minimal efforts. What it already has:

#### User authentication ####
* Email authentication (with email confirmation)
* User registration, login, logout
* Simple user profile page

#### Payment support ####
* Fully stripe integration (plans list is automatically generated from your Stripe account)
* User plans support
* Payments method support (only credit cards for now, by Stripe)
* Users can select a plan, change it, cancel, pause, resume
* User can see all the history of payment-related actions
* As soon as user logs in, the trial is started automatically (that plan that is marked in Stripe default one)

#### Dev's features ####
* All features are now divided to units and components. Frontend and backend are put side-by-side for easier reference and development.
* Autocreation of tables for users and roles (2 roles are added automatically: User and Admin)
* Autoupdating existing database
* Simple responsive web interface with header, left collapsing menu, central part, and fixed status bar
* Handling 404 and 500 errors
* Integration with Google App Engine (reading entities if env variables are not accessible)

#### Small but pretty user friendly features ####
* Breadcrumbs component
* Loaders to show user when data is fetching but still not finished
* Loaders may be easily added to buttons


### Features: ###
* Well organized project structure (blueprints/components based)
* Used bleeding edge web technologies
* Allows to add your own features, pages and components quickly

### Technologies/libraries in use: ###
#### Database: ####
* PostgreSQL
#### Backend: ####
* Flask / Python 3 / SQLAlchemy

#### Frontend: #### 
* ES6 JavaScript
* Vue
* Axios

#### Design / templates: ####
* Bootstrap 4
* Fontawesome 5
* SASS / SCSS

#### Project organize: ####
* Webpack 4

## What does the app look like?
Before you even clone anything it would be nice to show you what eventually you would own. There are 4 screenshots:
* Login
![Login page](https://saasidea.io/static/images/login.png)
* Register
![Register page](https://www.saasidea.io/static/images/register.png)
* Confirmed
![Confirmed page](https://www.saasidea.io/static/images/confirmed.png)
* Dashboard
![Dashboard page](https://www.saasidea.io/static/images/dashboard.png)

### Billing/payments ###
* Billing summary
![Billing summary](https://www.saasidea.io/static/images/BillingSummary.png)
* Stripe integration
![Stripe integration](https://www.saasidea.io/static/images/PlansStripeIntegration.png)
* Payment method selection
![Payment method selection](https://www.saasidea.io/static/images/PaymentMethodSelectionForm.png)
* After user selected plan and pai he/she can pause or cancel it
![After user selected plan and pai he/she can pause or cancel it](https://www.saasidea.io/static/images/UserSelectedPlanAndPaid.png)
* Billing history
![Billing history](https://www.saasidea.io/static/images/BillingHistory.png)

## Getting Started

Follow instruction to install, set up and run this boilerplate to start your SaaS quicker.

### Prerequisites

Before we start make sure you have installed Python 3 and Node.js. Please follow the official instructions. Also, you need to have a PostgreSQL database handy. If you don't want to install it you can use ElephantSQL service, they have a free plan: [https://www.elephantsql.com/plans.html](https://www.elephantsql.com/plans.html).


### Installing

1. Download the full zip or pull code from the repository, [here](https://help.github.com/articles/which-remote-url-should-i-use/) you can find full instruction:
```
git clone https://github.com/CaravelKit/saas-base
cd saas-base
```
2. Create a virtual environment (not necessarily but highly recommended):
```
python -m venv venv
```
(First 'venv' is a command, the second one is a new folder for a virtual environment. Or you can call it whatever.)


3. Add necessarily environment variables:
* Find venv/Scripts/activate.bat file, open in a text editor (__Important! Don't use Notepad++ as for some reason it spoils the file.__)
* Add the following variables before _:END_:
	* set FLASK_APP=application
	* set env=dev
	* set "db_url=postgres://user:password@dbhost:port/database"
	* set "secret_key=your_local_secret_key"
	* set "secret_salt=your_local_salt"
	* set mail_server=your_email_server
	* set mail_port=usually_465
	* set "mail_username=your_email"
	* set "mail_password=your_email_password"
	* set "admin_email=admin_email"
    * set "TEST_STRIPE_PUBLISHABLE_KEY=your test publishable key"
    * set "TEST_STRIPE_SECRET_KEY=your test secret key"
    * set "GOOGLE_APPLICATION_CREDENTIALS=path to your google credential json file"
    * set "stripe_endpoint_secret="
* The same folder find deactivate.bat and add the following strings before _:END_:
	* set FLASK_APP=
	* set env=
	* set db_url=
	* set secret_key=
	* set secret_salt=
	* set mail_server=
	* set mail_port=
	* set mail_username=
	* set mail_password=
	* set admin_email=
    * set TEST_STRIPE_PUBLISHABLE_KEY="
    * set TEST_STRIPE_SECRET_KEY=
    * set GOOGLE_APPLICATION_CREDENTIALS=
    * set stripe_endpoint_secret=

Note: if you use privateemail.com for your email you can set up the following settings:
```
set "mail_server=mail.privateemail.com"
set "mail_port=465"
```
### Setting up (quick, automate)
Just run the command:
```
init
```
Or, from a terminal:
```
./init.bat
```

> Warning! This command clears up your database before creating new entities. If you want just to update your current database, change the following code:

```
call flask dbinit -c
``` 
to
```
call flask dbinit -u
```

As soon as you see the following info you can open your browser:
```
* Serving Flask app "main"
* Environment: production
  WARNING: Do not use the development server in a production environment.
  Use a production WSGI server instead.
* Debug mode: off
* Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
```
### Setting up (slow, manual)

1. Activate the environment:
```
venv/Scripts/activate.bat
```

2. Move to the venv folder and install Python dependencies:
```
pip install -r requirements.txt
```
If you see some error you definitely have to update your pip:
```
python -m pip install --upgrade pip
```

3. Move back to the folder where your project is. Install webpack/JavaScript dependencies:
```
npm install
```

4. Build the javascript code and styles:
```
npm run dev
```
Note, there is another config, for production that you can run with "npm run prod" - in this version you will get well zipped (but not readable) code.

5. Initialize the database:
```
flask dbinit -c
```

6. Run the app:
```
flask run
```

7. Open a browser and go http://127.0.0.1:5000/. It will show the 404 error page because there is no any route defined for the root. If you see this page it means everything works fine! Feel free to explore, it's your code now!

## How to add/edit breadcrumbs
In file \app\components\dashboard\js\appDashboard.js
change/add the following code:
```
var routes = [
    ...
    { 
        path: '/user/profile', 
        component: UserProfile,
        name: 'userProfile',
        meta: {
            breadcrumb: [
                {   name: 'User'    }, <= breadcrumb link or text
                {   name: 'Profile' } // add 'link' field with name or the route
            ]
        } 
    },
    ...
```
Name your routes to have the access from breadcrumbs to them.

## Trial default period (in days)
By default, for a production version it's 14 days, for dev it's just a one day (for easier validation). If you want to change this setting, 
please change the corresponding line in config.py:
```
TRIAL_PERIOD_IN_DAYS = 1
```

## How to debug the code
We prefer MS VS Code. It's free and have tons of plugins for any language and framework. We use plugins for Python, Flask, Vue. To debug Python code you need to do some setups:

1. Open settings: File -> Preferences --> Settings
2. In the Workspace settings section add the following data:
```
{
    "python.pythonPath": "path_to_you_venv/Scripts/python.exe",
    "python.venvPath": "path_to_you_venv/Scripts/activate",
    "python.linting.pylintEnabled": false,
}
```
3. Follow [this instructions](https://code.visualstudio.com/docs/python/tutorial-flask#_run-the-app-in-the-debugger) to set up launch.json. In our case you should have something like that:
```
{
	"name": "Python Experimental: Flask",
	"type": "pythonExperimental",
	"request": "launch",
	"module": "flask",
	"env": {
		"FLASK_APP": "application.py"
	},
	"args": [
		"run",
		"--no-debugger",
		"--no-reload"
	   //"dbinit", 
	   //"-u"
	],
	"jinja": true
}
```
4. To start debugging, open the Terminal, activate the environment from there, the save as we did from the command line, then select Debug-->Start debugging.

## How to update the database

Every time when you change something in your models, run the following command to update the database:
```
flask dbinit -u
```

## Future features
We want to build the great product and we believe it's possible only when we collaborate with our users. So, we created a survey to figure out what is most important for you. Please [fill it up](https://goo.gl/forms/rCjQPeqgdPkTnfmB2) and we will develop next feature on your choice! 

## Important note about this free version

This version of our SaaS boilerplate is free and it will NOT have all the features. 

## Authors

[Caravel Kit](https://www.caravelkit.com)

[SaaS Idea](https://www.saasidea.io)

## License

Copyright (c) 2019 Caravel Kit [www.caravelkit.com](www.caravelkit.com) under the [MIT license](https://opensource.org/licenses/MIT).
If you are interested in the full-functional version please check our website [www.caravelkit.com](https://www.caravelkit.com) for pricing and conditions.

## Feedback

* If you find a bug please open an issue or drop us a line at [info@caravelkit.com](info@caravelkit.com).