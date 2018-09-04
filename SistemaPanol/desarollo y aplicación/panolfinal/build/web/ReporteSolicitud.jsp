<%-- 
    Document   : ReporteSolicitud
    Created on : 09-07-2016, 21:48:01
    Author     : Danilo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="net.sf.jasperreports.engine.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 

<% /*Parametros para realizar la conexión*/ 
Connection conexion; 
conexion = Conexion.Conecta.getConexion();

/*Establecemos la ruta del reporte*/ 
File reportFile = new File(application.getRealPath("Reportes/rptSolicitud.jasper")); 
/* No enviamos parámetros porque nuestro reporte no los necesita asi que escriba 
cualquier cadena de texto ya que solo seguiremos el formato del método runReportToPdf*/ 
Map parameters = new HashMap(); parameters.put("Nombre_parametro", "Valor_Parametro"); 
/*Enviamos la ruta del reporte, los parámetros y la conexión(objeto Connection)*/ 
byte[] bytesq = JasperRunManager.runReportToPdf(reportFile.getPath (), parameters, conexion); 
/*Indicamos que la respuesta va a ser en formato PDF*/ response.setContentType("application/pdf");
response.setContentLength(bytesq.length); ServletOutputStream ouputStream = response.getOutputStream(); 
ouputStream.write(bytesq, 0, bytesq.length); /*Limpiamos y cerramos flujos de salida*/ ouputStream.flush(); 
ouputStream.close();
%>
