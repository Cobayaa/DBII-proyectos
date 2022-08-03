from publicaciones import dibujarpublicaciones, listarpublicaciones

limitededatos=input("Ingrese el límite de la consulta: ")
buscarpor=input("Buscar datos por Título: ")
buscarpornombre=input("Buscar datos por Nombre del usuario de la publicación: ")
buscarporfecha=input("Buscar datos por  fecha_de_publicación: ")
orden=input(": ")
if limitededatos:
    paginado=input("Página 1: ")
else:
    paginado=" "

publicacionesdedatos=listarpublicaciones(limitededatos=limitededatos, buscarpor=buscarpor,buscarpornombre=buscarpornombre,buscarporfecha=buscarporfecha , paginado=paginado)
dibujarpublicaciones(publicacionesdedatos)