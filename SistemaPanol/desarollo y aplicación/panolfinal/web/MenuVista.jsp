<%@page import="org.apache.jasper.tagplugins.jstl.ForEach"%>
<%@page import="oracle.net.aso.i"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidad.Login"%>
<%@page import="DAO.LoginDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Bienvenidos Sosoft Sistema Pañol</title>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="Styless/EstiloMenu.css" type="text/css">
    </head>
    <body class="menu"> 
        <%
            int IdTipo = Integer.parseInt(session.getAttribute("tipo").toString());
        %> 
        <%if (IdTipo == 1) {   //Usuario System   %>  
        <div>
            <center>
                <h1 class="titulo">Sistema de Pa&ntildeol Sosoft 2016</h1>     
                <ul id="nav">   
                    <li><a href="Inicio.jsp">Inicio</a></li>   
                    <li><a>Maestros</a>
                        <ul>
                            <li><a>Carrera</a>
                                <ul>
                                    <li><a href="CrearCarrera.jsp">Ingresar Carrera</a></li> 
                                    <li><a href="ListaCarrera.jsp">Listar Carreras</a></li>
                                </ul>
                            </li>

                            <li><a>Categoria</a>
                                <ul>
                                    <li><a href="CrearCategoria.jsp">Ingresar Categoria</a></li> 
                                    <li><a href="ServletCategoriaRead">Listar Categoria</a></li>
                                </ul>
                            </li>

                            <li><a>Escuela</a>  
                                <ul>
                                    <li><a href="CrearEscuela.jsp">Ingresar Escuela</a></li>						 	
                                    <li><a href="ListaEscuela.jsp">Listar Escuelas</a></li>							
                                </ul>
                            </li>

                            <li><a>Sedes</a>  
                                <ul>
                                    <li><a href="CrearSede.jsp">Ingresar Sede</a></li>						  	
                                    <li><a href="ListaSede.jsp">Listar Sedes</a></li> 						
                                </ul>
                            </li>

                            <li><a>Usuarios</a>  
                                <ul>
                                    <li><a href="CrearUsuario.jsp">Ingresar Usuario </a></li>						
                                    <li><a href="ServletUsuarioRead">Listar Usuarios</a></li>   							
                                </ul>
                            </li>						

                        </ul>	
                    </li>
                    <li><a>Producto</a>
                        <ul>
                            <li><a href="CrearProducto.jsp">Ingresar Producto</a></li>                       
                            <li><a href="ingresarStock.jsp">Ingresar Stock</a></li>  
                            <li><a href="ServletProductoRead">Listar Producto</a></li>						
                        </ul>	
                    </li>
                    <li><a>Movimientos</a>
                        <ul>
                            <li><a>Solicitudes</a>  
                                <ul>
                                    <li><a href="CrearSolicitud.jsp">Ingresar Solicitud</a></li>
                                    <li><a href="MisSolicitudes.jsp">Mis Solicitudes</a></li>
                                    <li><a href="ListaSolicitud.jsp">Revisar Solicitudes</a></li>  							
                                </ul>
                            </li>	

                            <li><a>Prestamos</a>  
                                <ul>
                                    <li><a href="">Ingresar Prestamo </a></li>						
                                    <li><a href="">Listar Prestamo</a></li> 							
                                </ul>
                            </li>						

                            <li><a>Devoluciones</a>  
                                <ul>
                                    <li><a href="">Ingresar Devolucion </a></li>					
                                    <li><a href="">Listar Devoluciones</a></li> 							
                                </ul>
                            </li>					
                        </ul>	
                    </li> 

                    <li><a>Informes</a>            
                        <ul>
                            <li><a href="Reporte.jsp">Reportes </a></li>
                        </ul>
                    </li>
                    <li><a>Mantenedor</a>
                        <ul>                      
                            <li><a href="ServletLoginInsert">Ingresar Login</a></li>
                            <li><a href="ServletLoginRead">Listar Login</a></li>                      
                        </ul>	
                    </li>   
                    <li><a href="CerrarSession.jsp">Salir</a></li>             
                </ul>
            </center>
        </div>
        <%}%>
        <%if (IdTipo == 2) {   //Jefe de Carrera   %>  
        <div>
            <center>
                <h1 class="titulo">Sistema de Pa&ntildeol Sosoft 2016</h1>     
                <ul id="nav">   
                    <li><a href="Inicio.jsp">Inicio</a></li>   
                    <li><a>Maestros</a>
                        <ul>
                            <li><a>Carrera</a>
                                <ul>
                                    <li><a href="CrearCarrera.jsp">Ingresar Carrera</a></li> 
                                    <li><a href="ListaCarrera.jsp">Listar Carreras</a></li>
                                </ul>
                            </li>

                            <li><a>Categoria</a>
                                <ul>
                                    <li><a href="CrearCategoria.jsp">Ingresar Categoria</a></li> 
                                    <li><a href="ServletCategoriaRead">Listar Categoria</a></li>
                                </ul>
                            </li>

                            <li><a>Escuela</a>  
                                <ul>
                                    <li><a href="CrearEscuela.jsp">Ingresar Escuela</a></li>						 	
                                    <li><a href="ListaEscuela.jsp">Listar Escuelas</a></li>							
                                </ul>
                            </li>

                            <li><a>Sedes</a>  
                                <ul>
                                    <li><a href="CrearSede.jsp">Ingresar Sede</a></li>						  	
                                    <li><a href="ListaSede.jsp">Listar Sedes</a></li> 						
                                </ul>
                            </li>

                            <li><a>Usuarios</a>  
                                <ul>
                                    <li><a href="CrearUsuario.jsp">Ingresar Usuario </a></li>						
                                    <li><a href="ServletUsuarioRead">Listar Usuarios</a></li>   							
                                </ul>
                            </li>						

                        </ul>	
                    </li>
                    <li><a>Producto</a>
                        <ul>
                            <li><a href="CrearProducto.jsp">Ingresar Producto</a></li>                       
                            <li><a href="ingresarStock.jsp">Ingresar Stock</a></li>  
                            <li><a href="ServletProductoRead">Listar Producto</a></li>						
                        </ul>	
                    </li>
                    <li><a>Informes</a>            
                        <ul>
                            <li><a href="Reporte.jsp">Reportes </a></li>
                        </ul>
                    </li>
                    <li><a>Mantenedor</a>
                        <ul>                      
                            <li><a href="ServletLoginInsert">Ingresar Login</a></li>
                            <li><a href="ServletLoginRead">Listar Login</a></li>                      
                        </ul>	
                    </li>   
                    <li><a href="CerrarSession.jsp">Salir</a></li>             
                </ul>
            </center>
        </div>
        <%}%>
        <%if (IdTipo == 3) {   //Usuario Pañolero   %>  
        <div>
            <center>
                <h1 class="titulo">Sistema de Pa&ntildeol Sosoft 2016</h1>     
                <ul id="nav">   
                    <li><a href="Inicio.jsp">Inicio</a></li>   
                    <li><a>Maestros</a>
                        <ul>
                            <li><a>Carrera</a>
                                <ul>
                                    <li><a href="CrearCarrera.jsp">Ingresar Carrera</a></li> 
                                    <li><a href="ListaCarrera.jsp">Listar Carreras</a></li>
                                </ul>
                            </li>

                            <li><a>Categoria</a>
                                <ul>
                                    <li><a href="CrearCategoria.jsp">Ingresar Categoria</a></li> 
                                    <li><a href="ServletCategoriaRead">Listar Categoria</a></li>
                                </ul>
                            </li>

                            <li><a>Escuela</a>  
                                <ul>
                                    <li><a href="CrearEscuela.jsp">Ingresar Escuela</a></li>						 	
                                    <li><a href="ListaEscuela.jsp">Listar Escuelas</a></li>							
                                </ul>
                            </li>

                            <li><a>Sedes</a>  
                                <ul>
                                    <li><a href="CrearSede.jsp">Ingresar Sede</a></li>						  	
                                    <li><a href="ListaSede.jsp">Listar Sedes</a></li> 						
                                </ul>
                            </li>
                        </ul>	
                    </li>
                    <li><a>Producto</a>
                        <ul>
                            <li><a href="CrearProducto.jsp">Ingresar Producto</a></li>                       
                            <li><a href="ingresarStock.jsp">Ingresar Stock</a></li>  
                            <li><a href="ServletProductoRead">Listar Producto</a></li>						
                        </ul>	
                    </li>
                    <li><a>Movimientos</a>
                        <ul>
                            <li><a>Solicitudes</a>  
                                <ul>						
                                    <li><a href="ListaSolicitud.jsp">Listar Solicitud</a></li>  							
                                </ul>
                            </li>	

                            <li><a>Prestamos</a>  
                                <ul>
                                    <li><a href="">Ingresar Prestamo </a></li>						
                                    <li><a href="">Listar Prestamo</a></li> 							
                                </ul>
                            </li>						

                            <li><a>Devoluciones</a>  
                                <ul>
                                    <li><a href="">Ingresar Devolucion </a></li>					
                                    <li><a href="">Listar Devoluciones</a></li> 							
                                </ul>
                            </li>					
                        </ul>	
                    </li> 

                    <li><a>Informes</a>            
                        <ul>
                            <li><a href="Reporte.jsp">Reportes </a></li>
                        </ul>
                    </li> 
                    <li><a href="CerrarSession.jsp">Salir</a></li>             
                </ul>
            </center>
        </div>
        <%}%>
        <%if (IdTipo == 4) {   //Usuario Docente   %>      
        <div>
            <center>
                <h1 class="titulo">Sistema de Pa&ntildeol Sosoft 2016</h1>     
                <ul id="nav">   
                    <li><a href="Inicio.jsp">Inicio</a></li>   
                    <li><a>Movimientos</a>
                        <ul>
                            <li><a>Solicitudes</a>  
                                <ul>
                                    <li><a href="CrearSolicitud.jsp">Ingresar Solicitud</a></li>
                                    <li><a href="MisSolicitudes.jsp">Mis Solicitudes</a></li>                                     
                                </ul>
                            </li>	 					
                        </ul>	
                    </li> 
                    <li><a href="CerrarSession.jsp">Salir</a></li>             
                </ul>
            </center>
        </div>
        <%}%>
        <%if (IdTipo == 5) {   //Usuario Alumno   %>  
        <div>
            <center>
                <h1 class="titulo">Sistema de Pa&ntildeol Sosoft 2016</h1>     
                <ul id="nav">   
                    <li><a href="Inicio.jsp">Inicio</a></li>   

                    <li><a>Movimientos</a>
                        <ul>
                            <li><a>Solicitudes</a>  
                                <ul>
                                    <li><a href="CrearSolicitud.jsp">Ingresar Solicitud</a></li>
                                    <li><a href="MisSolicitudes.jsp">Mis Solicitudes</a></li> 							
                                </ul>
                            </li>	 					
                        </ul>	
                    </li> 

                    <li><a href="CerrarSession.jsp">Salir</a></li>             
                </ul>
            </center>
        </div>
        <%}%>
     <%if (IdTipo == 6) {     //Usuario Coordinador   %>  
        <div>
            <center>
                <h1 class="titulo">Sistema de Pa&ntildeol Sosoft 2016</h1>     
                <ul id="nav">   
                    <li><a href="Inicio.jsp">Inicio</a></li>   
                    <li><a>Maestros</a>
                        <ul>
                            <li><a>Carrera</a>
                                <ul>
                                    <li><a href="CrearCarrera.jsp">Ingresar Carrera</a></li> 
                                    <li><a href="ListaCarrera.jsp">Listar Carreras</a></li>
                                </ul>
                            </li>

                            <li><a>Categoria</a>
                                <ul>
                                    <li><a href="CrearCategoria.jsp">Ingresar Categoria</a></li> 
                                    <li><a href="ServletCategoriaRead">Listar Categoria</a></li>
                                </ul>
                            </li>

                            <li><a>Escuela</a>  
                                <ul>
                                    <li><a href="CrearEscuela.jsp">Ingresar Escuela</a></li>						 	
                                    <li><a href="ListaEscuela.jsp">Listar Escuelas</a></li>							
                                </ul>
                            </li>

                            <li><a>Sedes</a>  
                                <ul>
                                    <li><a href="CrearSede.jsp">Ingresar Sede</a></li>						  	
                                    <li><a href="ListaSede.jsp">Listar Sedes</a></li> 						
                                </ul>
                            </li>

                            <li><a>Usuarios</a>  
                                <ul>
                                    <li><a href="CrearUsuario.jsp">Ingresar Usuario </a></li>						
                                    <li><a href="ServletUsuarioRead">Listar Usuarios</a></li>   							
                                </ul>
                            </li>						

                        </ul>	
                    </li>
                    <li><a>Producto</a>
                        <ul>
                            <li><a href="CrearProducto.jsp">Ingresar Producto</a></li>                       
                            <li><a href="ingresarStock.jsp">Ingresar Stock</a></li>  
                            <li><a href="ServletProductoRead">Listar Producto</a></li>						
                        </ul>	
                    </li>
                    <li><a>Movimientos</a>
                        <ul>
                            <li><a>Solicitudes</a>  
                                <ul>
                                    <li><a href="CrearSolicitud.jsp">Ingresar Solicitud</a></li>
                                    <li><a href="MisSolicitudes.jsp">Mis Solicitudes</a></li>
                                    <li><a href="ListaSolicitud.jsp">Revisar Solicitudes</a></li>  							
                                </ul>
                            </li>	

                            <li><a>Prestamos</a>  
                                <ul>
                                    <li><a href="">Ingresar Prestamo </a></li>						
                                    <li><a href="">Listar Prestamo</a></li> 							
                                </ul>
                            </li>						

                            <li><a>Devoluciones</a>  
                                <ul>
                                    <li><a href="">Ingresar Devolucion </a></li>					
                                    <li><a href="">Listar Devoluciones</a></li> 							
                                </ul>
                            </li>					
                        </ul>	
                    </li> 

                    <li><a>Informes</a>            
                        <ul>
                            <li><a href="Reporte.jsp">Reportes </a></li>
                        </ul>
                    </li>
                    <li><a>Mantenedor</a>
                        <ul>                      
                            <li><a href="ServletLoginInsert">Ingresar Login</a></li>
                            <li><a href="ServletLoginRead">Listar Login</a></li>                      
                        </ul>	
                    </li>   
                    <li><a href="CerrarSession.jsp">Salir</a></li>             
                </ul>
            </center>
        </div>
        <%}%>
    </body>
</html>
