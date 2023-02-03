import os
import pyodbc
import tkinter as tk
from tkinter import messagebox

# Definir los valores constantes para los parametros de conexión
DRIVER = "ODBC Driver 18 for SQL Server"
SERVER = "farmaciamariendb.mssql.somee.com,1433"
DATABASE = "farmaciamariendb"
ENCRYPT = "yes"
UID = "Iamtheadmin"
PWD = "this.proof.haha"


def conectar_a_la_base_de_datos():
    """
    Función para conectarse a la base de datos
    """
    try:
        # Obtener la contraseña de las variables de entorno
        conn = os.environ.get('SQL_PASSWORD', '')

        # Definir la cadena de conexión utilizando formateo de cadenas
        conn_string = (
            f"Driver={{{DRIVER}}};"
            f"Server={SERVER};"
            f"Database={DATABASE};"
            f"Encrypt={ENCRYPT};"
            f"UID={UID};"
            f"PWD={PWD}"
        )

        # Conectarse a la base de datos utilizando la libreria pyodbc
        conn = pyodbc.connect(conn_string)

        # Mostrar un mensaje de éxito en una ventana emergente
        messagebox.showinfo("Conexión a la base de datos",
                            "Conexión exitosa a la base de datos.")

        # Regresar el objeto de conexión
        return conn
    except pyodbc.Error as e:
        # Mostrar un mensaje de error en una ventana emergente
        messagebox.showerror("Conexión a la base de datos",
                             "Fallo al conectarse a la base de datos: {}".format(e))
        raise Exception("Fallo al conectarse a la base de datos: {}".format(e))
