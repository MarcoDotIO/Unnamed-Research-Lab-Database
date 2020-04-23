from research_lab import app
from flask import redirect, render_template

@app.route('/')
def index():
    return redirect('/home/')

@app.route('/home/')
def home():
    return render_template('home.j2')