<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>

<%
	String html = "<table class='table'>\n<tr><th>Id Departamento</th><th>Nombre Departamento</th><th>Zona Geografica</th><th style='text-align:center'><a href='departamentoForm.jsp' class='btn btn-success'>Nuevo Departamento</a></th></tr>\n";
	CtrlDepartamento depto = new CtrlDepartamento();
	List<Departamento> departamentos = depto.daDepartamentos();
	int numDeptos = departamentos.size();

	if (departamentos.isEmpty()) {
		html += "<tr><td colspan='3'>No hay departamentos registrados</td></tr>\n";
	} else {
		Departamento deptoActual;
		for (int i = 0; i < numDeptos; i++) {
			deptoActual = (Departamento) departamentos.get(i);
			html += "<tr><td>"
					+ deptoActual.getIdDepto()
					+ "</td><td>"
					+ deptoActual.getNombreDepto()
					+ "</td><td>"
					+ deptoActual.getZonaGeografica()
					+ "</td><td style='text-align:center'><div class='btn-group btn-group-sm'><a href='departamentoForm.jsp?id_depto="
					+ deptoActual.getIdDepto()
					+ "' class='btn btn-warning'>Editar</a><a href='departamentoProcess.jsp?id_depto="
					+ deptoActual.getIdDepto() 
					+"&accion=eliminar' class='btn btn-danger'>Eliminar</a></div></td></tr>\n";
		}
	}
	html += "</table>";
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Departamentos</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Mantenimiento de la tabla de departamento">
<meta name="author" content="Roberto Pineda">

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
					<h2>Departamentos /</h2>
					<p>Mantenimiento a tabla Departamentos</p>
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