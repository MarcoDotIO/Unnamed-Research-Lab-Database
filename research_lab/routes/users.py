from research_lab import app, User, db, login_required, admin_required
from flask import redirect, render_template, request, abort
from flask_login import login_user, logout_user
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
@login_required
def users():
    return render_template('users.j2', ulist=db.list_users())

@app.route('/users/<int:user_id>/')
@login_required
def user(user_id):
    return render_template('user.j2', user=db.get_user_by_id(user_id=user_id))

@app.route('/users/<int:user_id>/edit/', methods=['GET', 'POST'])
@admin_required
def edituser(user_id):
    u = db.get_user_by_id(user_id=user_id)
    if request.method == 'POST':
        new_username = request.form['username']

        try: # test uniqueness of username
            db.get_user_by_name(new_username)
        except:
            pass
        else:
            if new_username != u['username'] and new_username != '':
                abort(400)

        db.update_user_details(
            user_id=u['user_id'],
            username=request.form['username'],
            full_name=request.form['full_name']
        )

        new_pass = request.form['password']
        if new_pass != '':
            db.update_password(user_id=u['user_id'], password=new_pass)

    return render_template('edituser.j2', user=db.get_user_by_id(user_id=user_id))