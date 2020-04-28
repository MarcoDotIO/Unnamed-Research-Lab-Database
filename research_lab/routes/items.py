from research_lab import app, db, login_required
from flask import render_template, request

@app.route('/items/')
@login_required
def items():
    q = request.args.get('q', default='')
    if q == '':
        return render_template('items.j2', items=db.find_items(item_name='%'))
    else:
        return render_template('items.j2', items=db.find_items(item_name='%' + q + '%'))