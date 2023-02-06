from bdconnection import conn
import pyodbc
from flask import Flask, session, render_template, request, redirect
from flask_session import Session


app = Flask(__name__)

app.config["SESSION_PERMANENTE"] = False
app.config["SESSION_TYPE"] = "filesystem"

Session(app)

if conn:  # probando la nueva conexión
    print("si se pudo")


@app.route("/")
def index():
    return "Aquí irá el index, pero por el momento no tenemos"


@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":
        nombre = request.form.get("nombre")
        apellido = request.form.get("apellido")
        cedula = request.form.get("cedula")
        telefono = request.form.get("telefono")
        correo = request.form.get("correo")
        contrasena = request.form.get("contrasena")
        confirmarcontra = request.form.get("confirmarcontra")

        # Aquí irán las validaciones del HTML

        # Llamando al SP
        try:
            cursor = conn.cursor()
            storeProc = "execute [dbo].[Insertar_Cliente] @valor1 = ?, @valor2 = ?"
            params = (nombre, apellido, cedula, telefono,
                      correo, contrasena, confirmarcontra)
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
                        return redirect("/")
            elif (len(row)) == 2:
                while row:
                    resultado = str(row[0])
                    rol = str(row[1])
                    if resultado == "Acceso exitoso" and rol == "employee":
                        print("Es un empleado")
                        return redirect("/")
                    if resultado == "Acceso exitoso" and rol == "admin":
                        print("es un admin")
                        return redirect("/")
            else:
                print("Usuario o contraseña incorrectos")
                return redirect("/")

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
