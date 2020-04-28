from research_lab import app, db, login_required
from flask import redirect, render_template
from flask_login import current_user

from research_lab.routes import users, projects, items, spaces

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