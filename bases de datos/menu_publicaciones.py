from publicaciones import listarPublicaciones, dibujarPublicaciones
limit = input("Ingresar el limite de consulta: ")

busqueda= input("Buscar por: ")
if limit:
      
    paginado= input("buscar por pagina(pagina 1): ")
else:

    paginado=""

publicaciones=listarPublicaciones(limite=limit, busqueda=busqueda, paginado=paginado)

dibujarPublicaciones(publicaciones)

