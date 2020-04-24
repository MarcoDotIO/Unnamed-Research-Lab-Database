from research_lab import app, db
from flask import redirect, render_template

@app.route('/')
def index():
    return redirect('/home/')

@app.route('/home/')
def home():
    return render_template('home.j2', user=db.get_user_by_id(user_id=1))