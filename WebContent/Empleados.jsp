<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>

<%
	String html = "<table class='table'>\n<tr><th>Id Empleado</th><th>Nombre Empleado</th><th>Apellido 1</th><th>Apellido 2</th><th>DUI</th><th>NIT</th><th>Fecha de Nacimiento</th><th>Fecha de Ingreso</th><th>Sueldo</th><th>Email</th><th>Telefono</th><th>Activo</th><th style='text-align:center'><a href='empleadosForm.jsp' class='btn btn-success'>Nuevo Empleado</a></th></tr>\n";
	CtrlEmpleado emp = new CtrlEmpleado();
	List<Empleado> empleados = emp.daEmpleados();
	int numEmpleados = empleados.size();
	
	if(empleados.isEmpty()){
		html += "<tr><td colspan='3'>No hay Empleados</td></tr>\n";
	}
	else {
		Empleado empActual;
		for (int i = 0; i < numEmpleados; i++) {
			empActual = (Empleado) empleados.get(i);
			html += "<tr><td>"
					+ empActual.getId_empleado()
					+ "</td><td>"
					+ empActual.getNombres()
					+ "</td><td>"
					+ munActual.getDepto().getNombreDepto()
					+ "</td><td style='text-align:center'><div class='btn-group btn-group-sm'><a href='municipioForm.jsp?id_municipio="
					+ munActual.getIdMunicipio()
					+ "' class='btn btn-warning'>Editar</a><a href='municipioProcess.jsp?id_municipio="
					+ munActual.getIdMunicipio() 
					+"&accion=eliminar' class='btn btn-danger'>Eliminar</a></div></td></tr>\n";
		}
	}
	html += "</table>";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>