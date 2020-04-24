# Unnamed-Research-Lab-Database
Researcher lab data base for the database project.

## Setting up

### Setting up the web application
**Note:** On Windows you need a 64-bit version of Python. For some reason,
this is not the default option for 64-bit machines on the Python website, 
so you'll need to go out of your way to get an x86-64 version of the 
installer.

At time of writing,
[this](https://www.python.org/ftp/python/3.8.2/python-3.8.2-amd64.exe) is 
the latest 64-bit version of Python for Windows.

1. Install an up-to-date Python with pip
2. Update pip: `python -m pip install --upgrade pip --user`
3. Install pipenv: `python -m pip install pipenv --user`
4. Make sure you're in the project directory
5. Install the dependencies: `python -m pipenv install`

### Initializing the DB
Create a new MySQL database and import the `schema.sql` and `testdata.sql` 
files.

## Running
For the Windows command prompt:
```
set DB_URL=mysql://user:pass@host:port/database
python -m pipenv run serve
```

Replace the word `set` with `export` on Unix.

For the `DB_URL` portion, replace `user` with the username, `pass` with 
the password, `host` with the host (`localhost` if running locally), 
`port` with the port number (MySQL defaults to 3306), and `database` with 
the name of the database (e.g. research_lab).

Note that `pass` and `port` can be omitted if there is no password or the 
database is using the default port, respectively.

With a basic configuration, the URL may look like this: 
`mysql://root@localhost/research_lab`

The server should then be running at `localhost:5000`.

## Developing
This project uses [Flask](https://flask.palletsprojects.com/) for the 
framework, [Flask-Login](https://flask-login.readthedocs.io/en/latest/) 
for session management, [PugSQL](https://pugsql.org/) for database access, 
and [Passlib](https://passlib.readthedocs.io/en/stable/) for password 
hashing.

**TODO:** Add more here.