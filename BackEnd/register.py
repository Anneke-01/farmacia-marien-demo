import os 
import bcrypt 
import bdconnection 
from flask import Flask, request

app = Flask(__name__) 

# Ruta para el registro de usuarios 
@app.route('/', methods=['POST'])
def registro(): 
    # Recopilamos los datos del formulario
    nombre = request.form['nombre']
    apellido = request.form['apellido']
    cedula = request.form['cedula']
    telefono = request.form['telefono']
    correo = request.form['correo']
    password = request.form['password'] 
    
    # Encriptamos la contraseña 
    password_encriptado = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())
    
    try: 
        # Nos conectamos a la base de datos
        conn = bdconnection.connect()
        cursor = conn.cursor() 
        
        # Ejecutamos una consulta INSERT para registrar el usuario
        query = "INSERT INTO usuarios (nombre, apellido, cedula, telefono, correo, password) VALUES (%s, %s, %s, %s, %s, %s)"
        cursor.execute(query, (nombre, apellido, cedula, telefono, correo, password_encriptado))
        conn.commit()
    except Exception as e: 
        # Devolvemos un mensaje de error en caso de no poder conectarse a la base de datos
        return "Error al conectarse a la base de datos: {}".format(str(e))
    finally: 
        # Cerramos el cursor y la conexión a la base de datos
        cursor.close()
        conn.close() 
    
    # Devolvemos un mensaje de éxito en caso de registrar el usuario exitosamente
    return "Usuario registrado exitosamente"

if __name__ == '__main__':
    app.run()
