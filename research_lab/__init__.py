from os import urandom, environ
from flask import Flask
from flask_login import LoginManager, UserMixin
from pugsql import module

app = Flask(__name__)
app.config['SECRET_KEY'] = urandom(24)

db = module('queries/')
db.connect(environ['DB_URL'])

login = LoginManager()
login.init_app(app)

class User(UserMixin):
    def __init__(self, username):
        self.details = db.get_user_by_name(username=username)
    def get_id(self):
        if self.details != None:
            return str(self.details['username'])
        else:
            return None

@login.user_loader
def load_user(user_id):
    return User(user_id)

from research_lab import routes