import os
from time import time
import mysql.connector
from pick import pick
host= input("ingrese el host de su base de datos: ")
user= input("ingrese el usuario de su base de datos: ")
password= input("ingrese la contraseña de su base de datos: ")
port= input("ingrese el puerto de su base de datos ")
bases=""
db = mysql.connector.connect(
    host=host,
    user=user,
    password=password,
    port=port,
)

cursor = db.cursor()
cursor.execute("SHOW DATABASES")
bases=cursor.fetchall()
option, index = pick(bases, 'elija una base de datos: ')
ruta= input("agrege la ruta de destino")
os.popen('mysqldump -h '+host+' -u '+user+' --databases '+str(option[0])+' > '+str(ruta)+''+str(option[0])+'.sql')