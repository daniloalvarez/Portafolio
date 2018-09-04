<%-- 
    Document   : ListaSolicitudDeta
    Created on : 04-07-2016, 01:26:19
    Author     : Miguel Pasten
--%>

<%@page import="Entidad.Usuario"%>
<%@page import="Entidad.Encasoli"%>
<%@page import="Entidad.Detasoli"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidad.Categoria"%>
<%@page import="Entidad.Producto"%>
<%@page import="Entidad.Sede"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
        <link rel="stylesheet" type="text/css" href="Styless/EstiloFondo.css">      
        <link rel="stylesheet" type="text/css" href="Styless/EstiloSolicitudDeta.css"> 
        <script src="JQuery/jquery-1.12.3.min.js" type="text/javascript"></script>       
        <script src="JavaScript/jsStock.js" type="text/javascript"></script>   
        <title>Detalle de Solicitud </title> 

        <% ArrayList miArray = new ArrayList();
            if (session.getAttribute("miListaSesion") == null) {
                response.sendRedirect("index.html");
            } else {
                DAO.UsuarioDAO boUsuario = new DAO.UsuarioDAO();
                miArray.add(session.getAttribute("miListaSesion"));
                // Formateador de fecha
                SimpleDateFormat fmtFecha = new SimpleDateFormat("dd/MM/yyyy");
                // Separador de valores miles
                DecimalFormat fmtMonto = new DecimalFormat("###,###.##");

                BO.BOproducto prodBO = new BO.BOproducto();
                BO.BOsolicitudEnca encaBO = new BO.BOsolicitudEnca();
                BO.BOsolicitudDeta detaBO = new BO.BOsolicitudDeta();
                BO.BOusuario usBO = new BO.BOusuario();
                BO.BOsede sedeBO = new BO.BOsede();
        %>
    </head>
    <%@include file="MenuVista.jsp" %>
    <body> 
    <center>
        <form name="frmFichaSolicitud" action="" method="POST">
        <h1>Ficha de Solicitud</h1>    
        <%
            int numSolicitud = Integer.parseInt(String.valueOf(session.getAttribute("solicitud")));
        %> 
        <table border="1" id="tablaEncaSoli"> 
            <tr>
                <td><label class="etiqueta" for="txtNumero">Nº Solicitud:</label></td>
                <td class="tdCentro"><input type="text" id="txtNumero" name="txtNumero" value="<%=numSolicitud%>" readOnly="true"/></td>                
            </tr>
            <%for (Encasoli en : encaBO.listadoEncaSolicitud()) {
                    if (en.getNumsolicitud() == numSolicitud) {%>   
            <tr>
                <td><label class="etiqueta" for="txtFecha">Fecha Solicitud:</label></td>  

                <td><input type="text" id="txtFecha" name="txtFecha" readOnly="true" value="<%=fmtFecha.format(en.getFechasolicitud())%>"/></td>                        
            </tr>
            <tr>
                <td><label class="etiqueta" for="txtSolicitante">Solicitante:</label></td>
                <%for (Usuario us : usBO.listadoUsuario()) {
                        if (us.getRutusuario() == en.getUsuarioRutusuario()) {
                %>
                <td><input type="text" id="txtSolicitante" name="txtSolicitante" readOnly="true" value="<%=us.getNomusuario() + " " + us.getPaternousuario() + " " + us.getMaternousuario()%>"/></td> 
                    <%}
                        }%>
            </tr>            
            <tr>
                <td><label class="etiqueta" for="txtComentario">Comentario:</label></td>
                <%if (en.getComentario() == null) {%>
                <td><input type="text" value="" id="txtComentario" name="txtComentario" readOnly="true"/></td>
                    <%} else {%>
                <td><input type="text" value="<%=en.getComentario()%>" id="txtComentario" name="txtComentario" readOnly="true"/></td>
                    <%}%>
            </tr>
            <tr>
              <%  String miEstado="";
                  String mensaje ="";
                   if(en.getEstado().equals("P")) {
                     miEstado = "Pendiente"; 
                     mensaje =  "En proceso de Aprobación, se validará Stock"; 
                   } else if(en.getEstado().equals("E")){
                     miEstado = "Parcial";
                     mensaje =  "Se entrega parte del total Solicitado "; 
                   } else if(en.getEstado().equals("A")){
                     miEstado = "Aceptado";
                     mensaje =  "Se realiza prestamo total"; 
                   } else {
                     miEstado = "Rechazado";
                     mensaje  = "Solicitud rechazada por falta de Stock";
                   }
              %>                
                <td><label class="etiqueta" for="txtEstado">Estado:</label></td> 
                <td><input type="text" value="<%=miEstado.toUpperCase()%>" id="txtEstado" name="txtEstado" readOnly="true" style="color: blue;"/></td>            
            </tr>
            <tr>
                <td><label class="etiqueta" for="txtMotivo">Motivo:</label></td> 
                <td><input type="text" value="<%=mensaje.toUpperCase()%>" id="txtMotivo" name="txtMotivo" readOnly="true" style="color: blue;"/></td>                 
            </tr>
            <tr>
                <td><label class="etiqueta" for="txtCodSede">Codigo Sede:</label></td>
                <% for(Detasoli d: detaBO.listaDetalle()){
                    if(d.getEncasoliNumsolicitud() == en.getNumsolicitud()) {
                      for(Sede s: sedeBO.listadoSede()) {
                        if(d.getProductoSedeIdSede() == s.getIdSede()) { %>                        
                <td><input type="text" value="<%=s.getIdSede()%>" id="txtCodSede" name="txtCodSede" readOnly="true"/></td>                    
            </tr>
            <tr>
                <td><label class="etiqueta" for="txtSede">Sede:</label></td>                
                <td><input type="text" value="<%=s.getNomsede().toUpperCase()%>" id="txtSede" name="txtSede" readOnly="true"/></td>                                        
                <% }} %>   
            </tr>            
            <tr>
                <td><label class="etiqueta" for="txtProducto">Producto:</label></td>
                <% for(Producto pr: prodBO.listaProductoFiltro()){
                      if(pr.getCodproducto().equals(d.getProductoCodproducto())) {%>
                         <td><input type="text" value="<%=pr.getNomproducto().toUpperCase()%>" id="txtProducto" name="txtProducto" readOnly="true"/></td>      
            </tr>
            <tr>
                <td><label class="etiqueta" for="txtCodigo">Codigo Item:</label></td>
                <td><input type="text" value="<%=pr.getCodproducto().toUpperCase()%>" id="txtCodigo" name="txtCodigo" readOnly="true"/></td>   
                        
            </tr>
            <tr> 
                <td><label class="etiqueta" for="txtSolicitado">Solicitado:</label></td>
                <td><input type="text" value="<%=d.getCantsolicitada()%>" id="txtSolicitado" name="txtSolicitado" readOnly="true"/>
                    <label class="etiqueta" for="txtPrestamo" style="padding: 2px 10px;">Prestamo:</label>
                    <input type="text" value="0" id="txtPrestamo" name="txtPrestamo" readOnly="true"/>
                    <label class="etiqueta" for="txtSaldo" style="padding: 2px 10px;">Pendiente:</label>                    
                    <input type="text" value="0" id="txtSaldo" name="txtSaldo" readOnly="true" style="color: red"/>
                </td>   
                <% }} %>
            </tr>            
 
            <% }}}} %>
        </table>
        <br> 
        <input type="button" value="<< Volver >>" name="btnVolver" id="btnVolver" onclick="cambiarPagina2()"/>  
        <input type="button" value="<< Stock Actual >>" name="btnStockSede" id="btnStockSede"/>        
        <input type="button" value="<< Stock en Sedes >>" name="btnStock" id="btnStock" onclick="verPaginaStock()"/> 
        <br><br>
        <input type="button" value="<< Prestamo Total >>" name="btnPrestamo" id="btnPrestamo"/> 
        <input type="button" value="<< Prestamo Parcial >>" name="btnParcial" id="btnParcial"/>
        <input type="button" value="<< Rechazar >>" name="btnRechazar" id="btnRechazar"/>   
        </form>
    </center>
    <%}%>         
</body>
</html>
