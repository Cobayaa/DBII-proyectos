import mysql.connector
db=mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    port=3306,
    database="blog",
)