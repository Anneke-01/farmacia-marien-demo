from bdconnection import conn
import pyodbc
from flask import Flask, session, render_template, request, redirect, flash
from flask_session import Session
from decorator import login_required


app = Flask(__name__)

app.config["SESSION_PERMANENTE"] = False
app.config["SESSION_TYPE"] = "filesystem"

Session(app)

if conn:  # probando la nueva conexión
    print("si se pudo")


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":
        pnombre = request.form.get("snombre")
        snombre = request.form.get("snombre")
        papellido = request.form.get("papellido")
        sapellido = request.form.get("sapellido")
        telefono = request.form.get("telefono")
        correo = request.form.get("correo")
        username = request.form.get("username")
        contrasena = request.form.get("contrasena")
        confirmarcontra = request.form.get("confirmarcontra")

        # Aquí irán las validaciones del HTML

        # Llamando al SP
        try:
            cursor = conn.cursor()
            storeProc = "execute [dbo].[Insertar_Cliente] @valor1 = ?, @valor2 = ?"
            params = (pnombre, snombre, papellido, sapellido, telefono,
                      correo, username, contrasena)
            cursor.execute(storeProc, params)
            cursor.commit()
            cursor.close()
            del cursor
            conn.close()
        except pyodbc.DatabaseError as e:
            print("Error: %s", e)
        return redirect("/")
    else:

        return render_template("register.html")


@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password")
        # Validaciones
        if not username:
            flash("Debes ingresar tu nombre de usuario", category="warning")
            return render_template("login.html")
        if not password:
            flash("Debes ingresar tu contraseña", category="warning")
            return render_template("login.html")
        try:
            cursor = conn.cursor()
            storeProc = "execute [dbo].[Validar_acceso] @nombreUsuario = ?, @contraseña = ?"
            params = (username, password)
            cursor.execute(storeProc, params)
            row = cursor.fetchone()
            print(row)
            print(len(row))
            if (len(row)) == 1:
                while row:
                    resultado = str(row[0])
                    if resultado == "Acceso exitoso":
                        print("es un cliente")
                        session["username"] = username
                        return redirect("/")
                    else:
                        flash("Usuario o contraseña incorrectos",
                              category="error")
                        return render_template("login.html")
            elif (len(row)) == 2:
                while row:
                    resultado = str(row[0])
                    rol = str(row[1])
                    if resultado == "Acceso exitoso" and rol == "employee":
                        print("Es un empleado")
                        session["username"] = username
                        session["rol"] = rol
                        return redirect("/")
                    if resultado == "Acceso exitoso" and rol == "admin":
                        print("es un admin")
                        session["username"] = username
                        session["rol"] = rol
                        return redirect("/")
            else:
                flash("Usuario o contraseña incorrectos", category="error")
                return render_template("login.html")

            cursor.close()
            del cursor
            conn.close()
        except pyodbc.DatabaseError as e:
            print("Error: %s", e)
        return redirect("/")
    else:
        return render_template("login.html")


@app.route("/logout")
def logout():
    session.clear()
    return redirect("/")


if __name__ == "__main__":
    conn
    app.run(debug=True, port=3300)
