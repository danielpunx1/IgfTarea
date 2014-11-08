<%@page import="java.text.ParseException"%>
<%@page import="negocio.CtrlEmpleado"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.CtrlEmpleado.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
	String id_empleado = request.getParameter("idemp");
	String nombres = request.getParameter("nombres");
	String apellido_paterno = request.getParameter("ape1");
	String apellido_materno = request.getParameter("ape2");
	String nit = request.getParameter("nit");
	String dui = request.getParameter("dui");
	SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
	Date fecha_nacimiento = formato.parse(request.getParameter("fechanac"));
	Date fecha_ingreso = formato.parse(request.getParameter("fechaing"));
	Double sueldo = Double.parseDouble(request.getParameter("sueldo"));
	//Date fnacimiento, fingreso;
	String email = request.getParameter("email");
	String telefono = request.getParameter("telef");
	String activo = request.getParameter("activo");
	
	String id_genero = request.getParameter("genero");
	String id_oficina = request.getParameter("oficina");
	int id_puesto = Integer.parseInt(request.getParameter("puesto"));
	String id_jefe = request.getParameter("empleado");
	String mensaje="";
	CtrlEmpleado ctrlempleado = new CtrlEmpleado();
	
	if(ctrlempleado.daEmpleadoById(id_empleado)==null){
		ctrlempleado.crearEmpleado(id_empleado, nit, dui, nombres, apellido_paterno, apellido_materno, 
				fecha_nacimiento, fecha_ingreso, sueldo, email, telefono, activo,
				id_genero, id_puesto, id_oficina, id_jefe);
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