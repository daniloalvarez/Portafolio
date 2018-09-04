<%-- 
    Document   : Reporte
    Created on : 26/09/2013, 03:32:39 PM
    Author     : Danilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloListar.css">    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">
        <title>Reportes Sede</title>

    </head>
    <%@include file="MenuVista.jsp" %>
    <body>
    <center>
        <div class="centro"> 
            <h1>Lista de Reporte </h1>
            <table borde = "2">
                <tr>
                    <td><a href="ReporteCategoria.jsp" borde="2">Reporte Categoria</a></td>
                </tr>
                <tr>
                    <td><a href="ReportePrestamo.jsp" borde="2">Reporte Prestamo</a></td>
                </tr>
                <tr>
                    <td><a href="ReporteSolicitud.jsp" borde="2">Reporte Solicitud</a></td>
                </tr>
                <tr>
                    <td><a href="ReporteStock.jsp" borde="2">Reporte Stock</a></td>
                </tr>
            </table>
        </div>
    </center>
</body>
</html>
