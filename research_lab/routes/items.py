from research_lab import app, login_required
from flask import render_template

@app.route('/items/')
@login_required
def items():
    return render_template('items.j2')
