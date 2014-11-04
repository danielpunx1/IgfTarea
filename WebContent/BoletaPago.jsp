<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.math.BigDecimal"%>
<%@ page import="dominio.BoletaPago" %>
<%@ page import="negocio.CtrlBoletaPago" %> 
<%@ page import="dominio.Empleado" %> 
<%@ page import="negocio.CtrlEmpleado" %>  

<% 
	String msj ="";
 	int id = Integer.parseInt(request.getParameter("id"));
 	String periodo = request.getParameter("periodo");
	BigDecimal sueldo = new BigDecimal( request.getParameter("sueldo") );
	String empleado = request.getParameter("empleado");
	
	CtrlEmpleado verificar = new CtrlEmpleado();
	Empleado emp = verificar.obtenerEmpleado(empleado);
	
	if( emp != null ){
		CtrlBoletaPago nuevo = new CtrlBoletaPago();
		boolean res = nuevo.crearBoleta(id, emp, periodo, sueldo);
		
		if( res == true)
		{
			msj ="La boleta fue creada con exito";
		}
		else
		{
			msj = "NO se pudo crear la boleta";
		}
	}
	else
	{
		msj = "El empleado no existe";
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