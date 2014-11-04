<%@page import="java.util.Date"%>
<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="dominio.TiposDescuentos" %>
<%@ page import="negocio.CtrlTiposDescuentos" %> 
<%@ page import="java.text.SimpleDateFormat" %>    

<% 
	String msj ="";
 	String id = request.getParameter("id");
 	String descripcion = request.getParameter("descripcion");
	BigDecimal porcentaje = new BigDecimal( request.getParameter("porcentaje") );
	String fecha = request.getParameter("fecha");
	
    SimpleDateFormat var = new SimpleDateFormat("yyyy-MM-dd");
    Date fechas = null; //iniciamos fecha
    fechas = var.parse(fecha);
	
	CtrlTiposDescuentos nuevo = new CtrlTiposDescuentos();
	boolean res = nuevo.crearDescuento(id,descripcion,porcentaje,fechas);
	
	if( res ){
		msj = "El descuento fue creado exitosamente";
	}
	else
	{
		msj = "El descuento ya existe";
	}
	

%>   


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%= msj %>
</body>
</html>