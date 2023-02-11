from bdconnection import conn
import pyodbc as db
from flask import Flask, session, render_template, request, redirect, flash
from flask_session import Session
from decorator import login_required


app = Flask(__name__)

app.config["SESSION_PERMANENTE"] = False
app.config["SESSION_TYPE"] = "filesystem"

Session(app)


@app.route("/")
def index():
    return render_template("index.html")

# Para propósitos de Presentación | Borrar cuando sea necesario

@app.route("/profiledite")
def profiledite():
    return render_template("profiledite.html")

@app.route("/shop")
def shop():
    return render_template("shop.html")


@app.route("/detail")
def details():
    return render_template("detail.html")

@app.route("/Historial")
def HistorialC():
    return render_template("HistorialC.html")




# Definiendo la ruta para presentar el formulario de registro con los métodos GET y POST
# El método HTTP POST envía datos al servidor.
# El método HTTP GET obtiene datos del servidor.
@app.route("/register", methods=["GET", "POST"])
def register():
    # Validamos si  el usuario está enviando información
    if request.method == "POST":
        # Creamos variables para obtener los datos de cada input de register.html con request.form.get
        pnombre = request.form.get("pnombre")
        snombre = request.form.get("snombre")
        papellido = request.form.get("papellido")
        sapellido = request.form.get("sapellido")
        telefono = request.form.get("telefono")
        correo = request.form.get("correo")
        username = request.form.get("username")
        contrasena = request.form.get("contrasena")
        confirmarcontra = request.form.get("confirmarcontra")

        # Validaciones
        # Aquí se valida si el usuario NO está ingresando datos nulos, de ser así se manda un mensaje de error con la función flash.
        if not pnombre:
            flash("Debes llenar todos los campos ", category="warning")
            return render_template("register.html")
        elif not snombre:
            flash("Debes llenar todos los campos ", category="warning")
            return render_template("register.html")
        elif not papellido:
            flash("Debes llenar todos los campos ", category="warning")
            return render_template("register.html")
        elif not sapellido:
            flash("Debes llenar todos los campos ", category="warning")
            return render_template("register.html")
        elif not telefono:
            flash("Debes llenar todos los campos ", category="warning")
            return render_template("register.html")
        elif not correo:
            flash("Debes llenar todos los campos ", category="warning")
            return render_template("register.html")
        elif not username:
            flash("Debes llenar todos los campos ", category="warning")
            return render_template("register.html")
        elif not contrasena:
            flash("Debes llenar todos los campos ", category="warning")
            return render_template("register.html")
        elif not contrasena == confirmarcontra:
            flash("Las contraseñas no coinciden ", category="error")
            return render_template("register.html")

        # Aquí se hace un try-except para mandar a llamar los SP. Es como un try-catch en C#.
        try:
            # Creamos la conexión y hacemos uso de la función cursor() para ejecutar código SQL
            cursor = conn.cursor()
            # Almacenamos en una variable el formato que debe seguir el código SQL. los signos de interrogación corresponden a cada parámetro del SP.
            storeProc = "execute [dbo].[Insertar_clientes] ?,?,?,?,?,?,?,?"
            params = (pnombre, snombre, papellido, sapellido,
                      telefono, correo, username, contrasena)  # En otra variable se almacenan los parámetros que se le pasarán al SP.
            # En una variable almacenamos el resultado de ejecutar el SP.
            rows = cursor.execute(storeProc, params)
            # Con la función commit() aseguramos que el SP se haya ejecutado.
            cursor.commit()
            # En una variable almacenamos el resultado que manda la función "rowcount" luego de ejecutar el SP. Esto es porque el SP tiene validación para no permitir nombres de usuarios repetidos.
            rcount = rows.rowcount
            # Lógica: https://stackoverflow.com/a/47540675
            # La función rowcount retornará -1 cada vez que el SP retorne una respuesta, lo cual significaría que hay un nombre de usuario con el mismo nombre en la BD.
            if rcount == -1:
                flash("Nombre de usuario existente, por favor escoge otro.",
                      category="error")
                # Si el SP manda el mensaje, se enseña un mensaje de error y se retorna la misma plantilla.
                return render_template("register.html")
            # Si el usuario se registra con éxito, entonces guardamos su inicio de sesión (las cookies)
            session["username"] = username
            cursor.close()  # Cerramos el cursor que nos permite ejecutar el SQL
            del cursor  # Lo eliminamos
            conn.close()  # Cerramos la conexión
        except db.DatabaseError as e:
            # Si no se pudo ejecutar el SP, entonces el error caerá aquí.
            print("Error: %s", e)
        # Si el usuario se registró con éxito, se le manda un mensaje.
        flash("Registro exitoso!", category="success")
        return redirect("/")  # Lo mandamos a la página principal.
    else:
        # Si el usuario no está mandando datos, entonces simplemente mostramos la plantilla.
        return render_template("register.html")

# Definiendo la ruta para presentar el formulario de iniciar sesión con los métodos GET y POST
# El método HTTP POST envía datos al servidor.
# El método HTTP GET obtiene datos del servidor.


@app.route("/login", methods=["GET", "POST"])
def login():
    # Validamos si  el usuario está enviando información
    if request.method == "POST":
        # Creamos variables para obtener los datos de cada input de login.html con request.form.get
        username = request.form.get("username")
        password = request.form.get("password")
        # Validaciones
        # Aquí se valida si el usuario NO está ingresando datos nulos, de ser así se manda un mensaje de error con la función flash.
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
            row = cursor.fetchone()  # Debido a que el SP nos retorna datos, entonces los obtenemos con la función fetchone y lo almacenamos en la variable "row"
            print(row)  # Esto es a modo de prueba
            print(len(row))  # Esto es a modo de prueba
            # EL SP devuelve "acceso exitoso" si es un cliente, pero si es un empleado retorna el mismo mensaje con otra columna diciendo su rol.
            # Por esa razón, validamos dependiendo de la longitud qué tipo de usuario sería.
            if (len(row)) == 1:  # Si la longitud de lo que me devuelve el SP es 1
                while row:  # Mientras se cumpla lo que hay en la variable "row"
                    # Se almacena en la variable resultado lo que está en "row", en la columna 0 y se castea a un string.
                    resultado = str(row[0])
                    if resultado == "Acceso exitoso":  # Validamos el resultado que nos devolvió el SP
                        print("es un cliente")
                        # Si se cumple, entonces guardamos la sesión del usuario que se registró
                        session["username"] = username
                        return redirect("/")  # Se manda a la página de inicio
                    else:
                        flash("Usuario o contraseña incorrectos",  # Si los datos son incorrectos, entonces mandamos un mensaje de error
                              category="error")
                        # Se vuelve a mostrar el formulario de inicio de sesión
                        return render_template("login.html")
            elif (len(row)) == 2:  # Si la longitud de lo que nos devuelve el SP es 2, es decir que también nos indicará el rol
                while row:  # Se sigue la misma lógica que arriba
                    resultado = str(row[0])
                    rol = str(row[1])  # Además, almacenamos el rol
                    # Se sigue la misma lógica que arriba, solo que se deben de cumplir las dos condiciones.
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
                # Si ninguno de los datos que ingresa el usuario está en la BD, entonces mandamos un mensaje de error con la función flash.
                flash("Usuario o contraseña incorrectos", category="error")
                # retornamos el mismo formulario de inicio de sesión.
                return render_template("login.html")

            cursor.close()  # Cerramos el cursor.
            del cursor  # Eliminamos el cursor.

        except db.DatabaseError as e:
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
