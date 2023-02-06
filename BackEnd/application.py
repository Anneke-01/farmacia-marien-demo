# Importar solo la conexión a la base de datos
from bdconnection import conectar_a_la_base_de_datos

# Importar Flask y sus dependencias
from flask import Flask, session, render_template, request, redirect
from flask_session import Session

# Crear una instancia de Flask
app = Flask(__name__)

# Configurar la sesión de Flask
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

# Inicializar la conexión a la base de datos


if __name__ == "__main__":
    # Ejecutar la aplicación con el modo de depuración habilitado en el puerto 3300
    conectar_a_la_base_de_datos().conn
    app.run(debug=True, port=3300)
