from research_lab import app, db, login_required
from flask import render_template

@app.route('/spaces/')
@login_required
def spaces():
    return render_template('spaces.j2', spaces=db.get_spaces())
