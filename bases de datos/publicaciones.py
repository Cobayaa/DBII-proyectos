
from math import ceil
import mysql.connector
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="blog",
)


def listarPublicaciones(limite, busqueda, paginado):

    cursor = db.cursor(dictionary=True)
    limit_sql = ''
    busqueda_sql = ''
    paginado_sql = ''
    paginas = ''
    respuesta = ''
 
    if busqueda:
        busqueda_sql = " WHERE publicaciones.titulo LIKE '%" + busqueda+"%'"


    cursor.execute("SELECT COUNT(*) AS total FROM publicaciones" + busqueda_sql)
    retorno = cursor.fetchone()

    cambio=str(retorno["total"])

    if not(limite=='') and not(paginado==''):

        respuesta=int(cambio)/int(limite)
        respuesta=ceil(respuesta)
        respuesta=str(respuesta)
        paginas=(int(paginado)-1)*int(limite)
        paginas=str(paginas)

    elif not(limite=='') and (paginado==''):

        respuesta=int(cambio)/int(limite)
        respuesta=ceil(respuesta)
        respuesta=str(respuesta)
        paginas=limite
        
    if limite:
        limit_sql = ' limit ' + paginas 

    if paginado:
        paginado_sql=', '+ limite

    consulta=("SELECT id_publicaciones,titulo,descripcion,imagen,fecha_de_publicacion,nombre FROM publicaciones JOIN usuarios ON usuarios.id_usuarios = publicaciones.id_usuarios "+busqueda_sql + limit_sql+ paginado_sql)
    cursor.execute(consulta)
    

    #cursor.execute("SELECT * FROM publicaciones " + busqueda_sql + limit_sql+ paginado_sql)
    publicaciones = cursor.fetchall()
    db.commit()
    cursor.close()

    return {
        "paginado": respuesta,
        "pagina": paginado,
        "total": retorno["total"],
        "datos": publicaciones
    }


def dibujarPublicaciones(datos):
    
    publicaciones = datos["datos"]
    print('ID             TITULO                                IMAGEN                                         NOMBRE            FECHA_PUBLICACION')
    for fila in publicaciones:
        print(str(fila['id_publicaciones'])+' ---- '
              + fila['titulo']+' ---- '

              + fila['imagen']+' ---- '

              + fila['nombre']+'----'

              + str(fila['fecha_de_publicacion']))
              

    
    print(str(len(publicaciones))+" de " +str(datos["total"])+" registros encontrados")

    if str(datos["pagina"])=='' and str(datos["paginado"])=='':

        datos["pagina"]=1

        datos["paginado"]=1

    elif str(datos["pagina"])=='':

        datos["pagina"]=1

    print("Pagina ("+str(datos["pagina"])+") de "+str(datos["paginado"]))


def publicacion():
    pass


def editarPublicaciones():
    pass


def eliminarPublicaciones():
    pass
