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


@app.route("/shop")
def shop():
    try:
        cursor = conn.cursor()
        storeProc = "execute [dbo].[MostrarTodosProductos]"
        cursor.execute(storeProc)
        DatosProductos = cursor.fetchall()
    except Exception as e:
        print("Error: %s", e)
    return render_template("shop.html", DatosProductos=DatosProductos)


@app.route("/detail/<idProducto>", methods=["GET", "POST"])
def details(idProducto):
    print(idProducto)
    try:
        cursor = conn.cursor()
        cursor.execute("select p.idProducto,p.nombreProducto, p.precio, p.descripcion,p.urlImg, m.marca, t.tipoProducto from Productos p inner join Marcas m on m.idMarca = p.idMarca inner join TiposProducto t on t.idTipoProducto = p.idTipoProducto where p.idProducto = ?", idProducto)
        DetalleProducto = cursor.fetchall()
        for i in DetalleProducto:
            print(i)
    except Exception as e:
        print("Error: %s", e)
    return render_template("detail.html", DetalleProducto=DetalleProducto)


@app.route("/Historial")
def HistorialC():
    return render_template("HistorialC.html")


@app.route("/admin")
def Admin():
    return render_template("Admin.html")


@app.route("/reportes")
def reportes():
    return render_template("reportes.html")


@app.route("/clientes", methods=["GET", "POST"])
def clientes():
    try:
        cursor = conn.cursor()
        spClientes = "execute [dbo].[MostrarTodosClientes]"
        cursor.execute(spClientes)
        DatosClientes = cursor.fetchall()
    except Exception as e:
        print("Error: %s", e)
    return render_template("clientes.html", DatosClientes=DatosClientes)


@app.route("/perfilCliente", methods=["GET", "POST"])
def perfilCliente():
    if 'IDCliente' in session:
        IDCliente = session["IDCliente"]
        try:
            cursor = conn.cursor()
            storeProce = "execute [dbo].[mostrar_cliente] @id = ?"
            param = (IDCliente)
            cursor.execute(storeProce, param)
            DatosCliente = cursor.fetchall()
            return render_template("PerfilCliente.html", cliente=DatosCliente)
        except Exception as e:
            print("Error: %s", e)
    return redirect("/")


@app.route("/editarPerfilCliente/<idCliente>", methods=["GET", "POST"])
def editarPerfilCliente(idCliente):
    if request.method == "POST":
        print(idCliente)
        pNombre = request.form.get("pnombre")
        sNombre = request.form.get("snombre")
        pApellido = request.form.get("papellido")
        sApellido = request.form.get("sapellido")
        nTelefono = request.form.get("telefono")
        nUsuario = request.form.get("username")
        if not pNombre or not sNombre or not pApellido or not sApellido or not nTelefono or not nUsuario:
            flash("Debes llenar todos los campos", category="warning")
        else:
            try:
                cursor1 = conn.cursor()
                sp = " execute [dbo].[modificar_cliente] ?,?,?,?,?,?,?"
                params = (idCliente, pNombre, sNombre, pApellido,
                          sApellido, nTelefono, nUsuario)
                cursor1.execute(sp, params)
                cursor1.commit()
                flash("El usuario se edito correctamente!", category="success")
            except Exception as e:
                print("Error: %s ", e)
            return redirect("/perfilCliente")
    else:
        print(idCliente)
        try:
            cursor = conn.cursor()
            storeProc = " execute [dbo].[mostrar_cliente] ?"
            params1 = (idCliente)
            cursor.execute(storeProc, params1)
            clientePerfil = cursor.fetchall()
            return render_template("profiledite.html", clientePerfil=clientePerfil)
        except Exception as e:
            print("Error: %s", e)


# Este agrega empleados
@app.route("/empleados", methods=["GET", "POST"])
def empleados():
    if request.method == "POST":
        pnombre = request.form.get("pnombre")
        snombre = request.form.get("snombre")
        papellido = request.form.get("papellido")
        sapellido = request.form.get("sapellido")
        telefono = request.form.get("telefono")
        dni = request.form.get("dni")
        correo = request.form.get("correo")
        username = request.form.get("username")
        contrasena = request.form.get("password")
        rol = request.form.get("idrol")

        if not pnombre or snombre or papellido or sapellido or telefono or dni or correo or username or contrasena or rol:
            flash("Debes llenar todos los campos ", category="warning")
            return redirect(request.url)
        try:
            cursor1 = conn.cursor()
            sp = " execute [dbo].[insertar_empleado] ?,?,?,?,?,?,?,?,?,?"
            params = (pnombre, snombre, papellido, sapellido,
                      telefono, dni, correo, username, contrasena, rol)
            cursor1.execute(sp, params)
            cursor1.commit()
            flash("Se agregó correctamente", category="success")
        except Exception as e:
            print("Error: %s", e)
        return redirect(request.url)  # Redirige a la misma ruta
    else:
        try:
            cursor = conn.cursor()
            storeProc = "execute [dbo].[Read_roles]"
            cursor.execute(storeProc)
            roles = cursor.fetchall()
            spEmpleados = "execute [dbo].[MostrarTodosEmpleados]"
            cursor.execute(spEmpleados)
            DatosEmpleados = cursor.fetchall()
        except Exception as e:
            print("Error: %s", e)
        return render_template("empleado.html", roles=roles, DatosEmpleados=DatosEmpleados)


@app.route("/editarEmpleado/<idEmpleado>", methods=["GET", "POST"])
def EditarEmpleado(idEmpleado):
    if request.method == "POST":
        pnombre = request.form.get("pnombre")
        snombre = request.form.get("snombre")
        papellido = request.form.get("papellido")
        sapellido = request.form.get("sapellido")
        telefono = request.form.get("telefono")
        dni = request.form.get("dni")
        correo = request.form.get("correo")
        username = request.form.get("username")
        rol = request.form.get("idrol")
        if not pnombre or snombre or papellido or sapellido or telefono or dni or correo or username or rol:
            flash("Debes llenar todos los campos", category="warning")
        return redirect("/empleados")
    else:
        try:
            cursor = conn.cursor()
            storeProc = "execute [dbo].[Read_roles]"
            cursor.execute(storeProc)
            roles = cursor.fetchall()
        except Exception as e:
            print("Error: %s", e)
    return render_template("empleado.html", roles=roles)

# Esto es para el admin


@app.route("/productos", methods=["GET", "POST"])
def productos():
    if request.method == "POST":
        print("hOLA")
        marca = request.form.get("idMarca")
        tipoProducto = request.form.get("idTipoProducto")
        nombre = request.form.get("nombrep")
        expedicion = request.form.get("expedicion")
        vencimiento = request.form.get("vencimiento")
        prescripcion = request.form.get("prescripcion")
        descripcion = request.form.get("descripcion")
        precio = request.form.get("precio")
        cantidad = request.form.get("cantidad")
        imagen = request.form.get("imagen")
        if not nombre or expedicion or vencimiento or prescripcion or descripcion or precio or cantidad or imagen:
            flash("Debes llenar todos los campos", category="warning")
            return redirect(request.url)
        try:
            cursor = conn.cursor()
            storeProcAgregar = "execute [dbo].[insertar_producto] ?, ?,?,?,?,?,?,?,?,?"
            params = (marca, tipoProducto, nombre, expedicion, vencimiento,
                      prescripcion, descripcion, precio, cantidad, imagen)
            print(params)
            cursor.execute(storeProcAgregar, params)
            cursor.commit()
            flash("Se agregó un nuevo producto!", category="success")
        except Exception as e:
            print("Error: %s", e)
        return redirect(request.url)
    else:
        try:
            cursor = conn.cursor()
            storeProc = "execute [dbo].[MostrarTodosProductos]"
            cursor.execute(storeProc)
            DatosProductos = cursor.fetchall()
            listarTiposProducto = cursor.execute(
                "select * from TiposProducto").fetchall()
            listarCategoria = cursor.execute(
                "select * from Categorias").fetchall()
            listarMarcas = cursor.execute(
                "select * from Marcas").fetchall()
        except Exception as e:
            print("Error: %s", e)
            flash("asdad", category="error")
        return render_template("productos.html", DatosProductos=DatosProductos, listarTiposProducto=listarTiposProducto, listarCategoria=listarCategoria, listarMarcas=listarMarcas)


@app.route("/proveedores", methods=["GET", "POST"])
def proveedores():
    if request.method == "POST":
        pnombre = request.form.get("pnombre")
        pcontacto = request.form.get("pcontacto")
        pruc = request.form.get("pruc")
        ptelefono = request.form.get("ptelefono")
        pciudad = request.form.get("pciudad")
        pmunicipio = request.form.get("pmunicipio")
        pdireccion = request.form.get("pdireccion")
        pcorreo = request.form.get("pcorreo")
        try:
            cursor = conn.cursor()
            storeProcAgregar = "execute [dbo].[insertar_proveedor] ?, ?,?,?,?,?,?,?"
            params = (pnombre, pcontacto, pruc, ptelefono,
                      pciudad, pmunicipio, pdireccion, pcorreo)
            print(params)
            cursor.execute(storeProcAgregar, params)
            cursor.commit()
            flash("Se agregó un nuevo proveedor!", category="success")
        except Exception as e:
            print("Error: %s", e)
        return redirect(request.url)
    else:
        try:
            cursor = conn.cursor()
            storeProc = "execute [dbo].[MostrarTodosProveedores]"
            cursor.execute(storeProc)
            DatosProveedores = cursor.fetchall()
            storeProcMunicipios = "execute [dbo].[MostrarMunicipios]"
            cursor.execute(storeProcMunicipios)
            municipios = cursor.fetchall()
            storeProcCiudades = "execute [dbo].[MostrarCiudades]"
            cursor.execute(storeProcCiudades)
            ciudades = cursor.fetchall()
        except Exception as e:
            print("Error: %s", e)
        return render_template("proveedores.html", DatosProveedores=DatosProveedores, municipios=municipios, ciudades=ciudades)


@app.route("/editarProveedor/<idProveedor>", methods=["GET", "POST"])
def editarProveedor(idProveedor):
    if request.method == "POST":
        pnombre = request.form.get("pnombre")
        pcontacto = request.form.get("pcontacto")
        pruc = request.form.get("pruc")
        ptelefono = request.form.get("ptelefono")
        pciudad = request.form.get("pciudad")
        pmunicipio = request.form.get("pmunicipio")
        pdireccion = request.form.get("pdireccion")
        pcorreo = request.form.get("pcorreo")

        try:
            cursor = conn.cursor()
            storeProcEditar = "execute [dbo].[modificar_proveedor] ?, ?,?,?,?,?,?,?,?"
            params = (idProveedor, pnombre, pcontacto, pruc, ptelefono,
                      pciudad, pmunicipio, pdireccion, pcorreo)
            print(params)
            cursor.execute(storeProcEditar, params)
            cursor.commit()
            flash("Se editó con éxito", category="success")
        except Exception as e:
            print("Error: %s", e)
        return redirect("/proveedores")
    else:

        return render_template("proveedores.html")


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
            storeProc = "execute [dbo].[insertar_cliente] ?,?,?,?,?,?,?,?"
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
                return redirect(request.url)
            else:
                consultaIDCliente = cursor.execute(
                    "SELECT TOP 1 idCliente FROM clientes WHERE nombreUsuario=?", username)
                IDCliente = consultaIDCliente.fetchone()
                print(IDCliente[0])
                session["IDCliente"] = IDCliente
                # Si el usuario se registra con éxito, entonces guardamos su inicio de sesión (las cookies)
                session["username"] = username
                # session["user_id"] = rows
                print(f"Prueba del registro")
                # Si el usuario se registró con éxito, se le manda un mensaje.
                flash("Registro exitoso!", category="success")
        except db.DatabaseError as e:
            # Si no se pudo ejecutar el SP, entonces el error caerá aquí.
            print("Error: %s", e)
        return redirect("/")  # Lo mandamos a la página principal.
    else:
        # Si el usuario no está mandando datos, entonces simplemente mostramos la plantilla.
        return render_template("register.html")

# Definiendo la ruta para presentar el formulario de iniciar sesión con los métodos GET y POST
# El método HTTP POST envía datos al servidor.
# El método HTTP GET obtiene datos del servidor.


@ app.route("/login", methods=["GET", "POST"])
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
            if (len(row)) == 2:  # Si la longitud de lo que me devuelve el SP es 1
                while row:  # Mientras se cumpla lo que hay en la variable "row"
                    # Se almacena en la variable resultado lo que está en "row", en la columna 0 y se castea a un string.
                    resultado = str(row[0])
                    IDCliente = row[1]
                    print(IDCliente)
                    if resultado == "Acceso exitoso":  # Validamos el resultado que nos devolvió el SP
                        print("es un cliente")
                        # Si se cumple, entonces guardamos la sesión del usuario que se registró
                        session["username"] = username
                        session["IDCliente"] = IDCliente
                        return redirect("/")  # Se manda a la página de inicio
                    else:
                        flash("Usuario o contraseña incorrectos",  # Si los datos son incorrectos, entonces mandamos un mensaje de error
                              category="error")
                        # Se vuelve a mostrar el formulario de inicio de sesión
                        return render_template("login.html")
            elif (len(row)) == 3:  # Si la longitud de lo que nos devuelve el SP es 2, es decir que también nos indicará el rol
                while row:  # Se sigue la misma lógica que arriba
                    resultado = str(row[0])
                    IDEmpleado = str(row[1])
                    rol = str(row[2])  # Además, almacenamos el rol
                    # Se sigue la misma lógica que arriba, solo que se deben de cumplir las dos condiciones.
                    if resultado == "Acceso exitoso" and rol == "employee":
                        print("Es un empleado")
                        session["username"] = username
                        session["IDEmpleado"] = IDEmpleado
                        session["rol"] = rol
                        return redirect("/")
                    if resultado == "Acceso exitoso" and rol == "admin":
                        print("es un admin")
                        session["username"] = username
                        session["IDEmpleado"] = IDEmpleado
                        session["rol"] = rol
                        return redirect("/admin")
            else:
                # Si ninguno de los datos que ingresa el usuario está en la BD, entonces mandamos un mensaje de error con la función flash.
                flash("Usuario o contraseña incorrectos", category="error")
                # retornamos el mismo formulario de inicio de sesión.
                return render_template("login.html")
        except db.DatabaseError as e:
            print("Error: %s", e)
        return redirect("/")
    else:
        return render_template("login.html")


@ app.route("/logout")
def logout():
    session.clear()
    return redirect("/")


@app.route("/checkout")
def checkout():
    return render_template("checkout.html")


if __name__ == "__main__":
    conn
    app.run(debug=True, port=3300)
