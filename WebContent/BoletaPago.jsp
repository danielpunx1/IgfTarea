<%@page import="java.util.Date"%>
<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="dominio.BoletaPago" %>
<%@ page import="negocio.CtrlBoletaPago" %> 
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="dominio.Empleado" %> 
<%@ page import="negocio.CtrlEmpleado" %>  

<% 
	String msj ="";
 	int id = Integer.parseInt(request.getParameter("id"));
 	String periodo = request.getParameter("periodo");
	BigDecimal sueldo = new BigDecimal( request.getParameter("sueldo") );
	String empleado = request.getParameter("empleado");
	
	CtrlEmpleado verificar = CtrlEmpleado();
	Empleado emp = verificar.obtenerEmpleado(id);
	
	if( emp != null ){
		CtrlBoletaPago nuevo = CtrlBoletaPago();
		boolean res = nuevo.crearBoleta(id, emp, periodo, sueldo);
	}
	else
	{
		msj = "El empleado no existe";
	}
	
	

	
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
<title>Boleta Pago</title>
</head>
<body>
<%= msj %>
</body>
</html>