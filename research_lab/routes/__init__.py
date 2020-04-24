from research_lab import app, db
from flask import redirect, render_template
from flask_login import current_user, login_required

from research_lab.routes import users

@app.route('/')
def index():
    if current_user.is_authenticated:
        return redirect('/home/')
    else:
        return redirect('/login/')

@app.route('/home/')
@login_required
def home():
    return render_template('home.j2')