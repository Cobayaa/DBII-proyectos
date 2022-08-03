from math import ceil
import mysql.connector
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="blog",
)


def listarpublicaciones(limitededatos, buscarpor,buscarpronombre,buscarporfecha, paginado):

    cursor = db.cursor(dictionary=True)
    limitedesql = ''
    busquedadesql = ''
    paginadodesql = ''
    hojas = ''
    resultado = ''
 
    if buscarpor:
        busquedadesql = " WHERE publicaciones.titulo LIKE'%"+ buscarpor +"%' and publicaciones.nombre LIKE'%"+ buscarpronombre +"%' and publicaciones.fecha_de_publicacion  LIKE '%" + buscarporfecha +"%'"   
    
    cursor.execute("SELECT COUNT(*) AS total FROM publicaciones" + busquedadesql)
    retornar = cursor.fetchone()

    mostrar=str(retornar["total"])

    if not(limitededatos=='') and not(paginado==''):

        resultado=int(mostrar)/int(limitededatos)
        resultado=ceil(resultado)
        resultado=str(resultado)
        hojas=(int(paginado)-1)*int(limitededatos)
        hojas=str(hojas)

    elif not(limitededatos=='') and (paginado==''):

        resultado=int(mostrar)/int(limitededatos)
        resultado=ceil(resultado)
        resultado=str(resultado)
        hojas=limitededatos
        
    if limitededatos:
        limitedesql = ' limit ' + hojas 

    if paginado:
        paginadodesql=', '+ limitededatos

    consultar=("SELECT id_publicaciones,titulo,descripcion,imagen,fecha_de_publicacion,nombre FROM publicaciones JOIN usuarios ON usuarios.id_usuarios = publicaciones.id_usuarios "+busquedadesql + limitedesql+ paginadodesql)
    cursor.execute(consultar)
    publicaciones = cursor.fetchall()
    db.commit()
    cursor.close()

    return {
        "paginado": resultado,
        "pagina": paginado,
        "total": retornar["total"],
        "datos": publicaciones
    }


def dibujarpublicaciones(datos):
    
    publicaciones = datos["datos"]
    print('ID          TITULO                  IMAGEN                                   FECHA_PUBLICACION')
    for fila in publicaciones:
        print(str(fila['id_publicaciones'])+' ---- '
              + fila['titulo']+' ---- '

              + fila['imagen']+' ---- '

              + fila['nombre']+' ---- '

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


