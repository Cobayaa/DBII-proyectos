import os
import mysql.connector
from pick import pick

host= input("ingresa el host de tu base de datos: ")
user= input("ingresa el usuario de la base de datos: ")
password= input("ingresa la contraseña de la base de datos: ")
port= input("ingresa el puerto de tu base de datos: ")
bases=""
db = mysql.connector.connect(
    host=host,
    user=user,
    password=password,
    port=port,
)

nombre= input("ingresa el nombre de la copia a importar: ")


os.popen("mysql -h localhost -u "+user+" < "+str(nombre))
