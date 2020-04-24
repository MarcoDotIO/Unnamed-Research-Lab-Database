from os import urandom, environ
from flask import Flask
from flask_login import LoginManager
from pugsql import module

app = Flask(__name__)
app.config['SECRET_KEY'] = urandom(24)

#login = LoginManager()
#login.init_app(app)

db = module('queries/')
db.connect(environ['DB_URL'])

from research_lab import routes