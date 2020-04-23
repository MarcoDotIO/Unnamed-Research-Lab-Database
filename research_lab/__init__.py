from os import urandom
from flask import Flask
from flask_login import LoginManager

app = Flask(__name__)
app.config['SECRET_KEY'] = urandom(24)

#login = LoginManager()
#login.init_app(app)

from research_lab import routes