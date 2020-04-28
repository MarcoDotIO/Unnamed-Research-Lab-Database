from research_lab import app, login_required
from flask import render_template

@app.route('/items/')
@login_required
def items():
    return render_template('items.j2')

@app.route('/items/<int:item_id>/')
@login_required
def item(item_id):
    return render_template('item.j2')
