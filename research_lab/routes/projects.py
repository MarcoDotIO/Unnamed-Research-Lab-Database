from research_lab import app

@app.route('/projects/')
def projects():
    pass

@app.route('/projects/<int:project_id>/')
def project(project_id):
    pass
