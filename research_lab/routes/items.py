from research_lab import app, db, login_required
from flask import render_template, request, redirect
from flask_login import current_user

@app.route('/items/')
@login_required
def items():
    q = request.args.get('q', default='')
    return render_template('items.j2',
        checkouts=db.get_items_by_loanee(user_id=current_user.details['user_id']),
        items=db.find_items(item_name='%' + q + '%')
    )

@app.route('/items/<int:item_id>/checkout/')
@login_required
def checkout_item(item_id):
    if db.get_item_by_id(item_id=item_id)['checkout_id'] == None:
        db.checkout(user_id=current_user.details['user_id'], item_id=item_id)
    return redirect('/items/')

@app.route('/items/<int:item_id>/return/')
@login_required
def return_item(item_id):
    if db.get_item_by_id(item_id=item_id)['user_id'] == current_user.details['user_id']:
        db.return_item(item_id=item_id)
    return redirect('/items/')