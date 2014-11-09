<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>

<%
	String html = "<table class='table'>\n<tr><th>Nombre Empleado</th><th>Apellidos</th><th> </th><th>Activo</th><th>Jefe</th><th style='text-align:center'><a href='empleadoForm.jsp' class='btn btn-success'>Nuevo Empleado</a></th></tr>\n";
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
					+ empActual.getNombres()
					+ "</td><td>"
					+ empActual.getApellido_paterno()
					+ "</td><td>"
					+ empActual.getApellido_materno()
					+ "</td><td>"
					+ empActual.getActivo()
					+ "</td><td>"  
					+ empActual.getJefe()
					+ "</td><td style='text-align:center'><div class='btn-group btn-group-sm'><a href='empleadoForm.jsp?id_empleado="
					+ empActual.getId_empleado()
					+ "' class='btn btn-primary'>Ver</a><a href='empleadoProcess.jsp?id_empleado="
					+ empActual.getId_empleado()
					+"' class='btn btn-warning'>Editar</a><a href='empleadoProcess.jsp?id_empleado="
					+ empActual.getId_empleado()
					+"&accion=eliminar' class='btn btn-danger'>Eliminar</a></div></td></tr>\n";
		}
	}
	html += "</table>";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Empleados</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<jsp:include page="includes/links.jsp"></jsp:include>

</head>
<body>

	<jsp:include page="includes/header.jsp"></jsp:include>

	<!-- Page Title -->
	<div class="page-title" style="height: 40px">
		<div class="container">
			<div class="row">
				<div class="span12">
					<i class="icon-tasks page-title-icon"></i>
					<h2>Empleados /</h2>
					<p>Mantenimiento a tabla Empleados</p>
				</div>
			</div>
		</div>
	</div>

	<div>
		<!-- Services -->
		<div class="what-we-do container">
			<div class='table-responsive'>
				<%=html%>
			</div>
		</div>
	</div>

	<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>