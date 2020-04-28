from research_lab import app, db, login_required
from flask import render_template

@app.route('/projects/')
@login_required
def projects():
    return render_template('projects.j2',
        active=db.get_active_projects(),
        inactive=db.get_inactive_projects()
    )

@app.route('/projects/<int:project_id>/')
@login_required
def project(project_id):
    return render_template('project.j2',
        project=db.get_project_by_id(project_id=project_id),
        members=db.get_users_by_project_id(project_id=project_id)
    )
