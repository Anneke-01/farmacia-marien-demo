from bdconnection import conn
import pyodbc
from flask import Flask, session, render_template, request, redirect
from flask_session import Session


app = Flask(__name__)

app.config["SESSION_PERMANENTE"] = False
app.config["SESSION_TYPE"] = "filesystem"

Session(app)


if __name__ == "__main__":
    conn
    app.run(debug=True)
    app.run(port=3300)
