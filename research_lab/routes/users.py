from research_lab import app, User
from flask import redirect, render_template, request, abort
from flask_login import login_user, logout_user, login_required
from passlib.hash import argon2

@app.route('/login/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        if not request.form['username'] or not request.form['password']:
            # shouldn't happen because of HTML required params, but just in case
            abort(400)

        user = User(request.form['username'])
        if user.details == None: # no user with this name
            return render_template('login.j2', error='Invalid username or password.')
        
        if argon2.verify(request.form['password'], user.details['password_hash']):
            login_user(user)
            return redirect('/home/')
        else: # invalid password
            return render_template('login.j2', error='Invalid username or password.')

    return render_template('login.j2')

@app.route('/logout/')
@login_required
def logout():
    logout_user()
    return redirect('/login/')

@app.route('/users/')
def users():
    pass

@app.route('/users/<int:user_id>/')
def user(user_id):
    pass
