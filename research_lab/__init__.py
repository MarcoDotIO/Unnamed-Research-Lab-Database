from os import urandom, environ
from functools import wraps
from flask import Flask, redirect
from flask_login import LoginManager, UserMixin, current_user
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

def login_required(fn):
    @wraps(fn)
    def decorated_view(*args, **kwargs):
        if current_user.is_authenticated:
            return fn(*args, **kwargs)
        else:
            return redirect('/login/')
    return decorated_view

def admin_required(fn):
    @wraps(fn)
    def decorated_view(*args, **kwargs):
        if current_user.is_authenticated and current_user.details['perm_level'] == 'admin':
            return fn(*args, **kwargs)
        elif current_user.is_authenticated:
            return redirect('/home/')
        else:
            return redirect('/login/')
    return decorated_view

from research_lab import routes