from research_lab import app, login_required
from flask import render_template

@app.route('/spaces/')
@login_required
def spaces():
    return render_template('spaces.j2')

@app.route('/spaces/<int:space_id>/')
@login_required
def space(space_id):
    return render_template('space.j2')
