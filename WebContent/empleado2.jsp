<%@page import="java.text.ParseException"%>
<%@page import="negocio.CtrlEmpleado"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.CtrlEmpleado.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
	String ident = request.getParameter("idemp");
	String names = request.getParameter("nombres");
	String apellido1 = request.getParameter("ape1");
	String apellido2 = request.getParameter("ape2");
	String nitribut = request.getParameter("nit");
	String docunico = request.getParameter("dui");
	SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
	Date fnacimiento = formato.parse(request.getParameter("fechanac"));
	Date fingreso = formato.parse(request.getParameter("fechaing"));
	Double sueld = Double.parseDouble(request.getParameter("sueldo"));
	//Date fnacimiento, fingreso;
	String correoelectronico = request.getParameter("email");
	String telefono = request.getParameter("telef");
	String esactive = request.getParameter("activo");
	
	String genero = request.getParameter("genero");
	String oficina = request.getParameter("oficina");
	int puesto = Integer.parseInt(request.getParameter("puesto"));
	String empleado = request.getParameter("empleado");
	String mensaje="";
	CtrlEmpleado ctrlempleado = new CtrlEmpleado();
	
	if(ctrlempleado.daEmpleadoById(ident)==null){
		ctrlempleado.crearEmpleado(ident, nitribut, docunico, names, apellido1, apellido2, fnacimiento, fingreso, sueld, correoelectronico, telefono, esactive, genero, puesto, oficina, empleado);
		mensaje = "Se inserto esta babosada!!! xD";
	}
	else
		 mensaje = "FAIL!!!! no se inserto, Ya existe!";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	La respuesta a tu solicitud es: <%= mensaje %>
</body>
</html>