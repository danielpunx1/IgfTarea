<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>

<%
	String html = "<table class='table'>\n<tr><th>Id Puesto</th><th>Nombre Puesto</th><th>Perfil</th><th>Fecha de Ingreso</th><th>Sueldo Minimo</th><th>Sueldo Maximo</th><th style='text-align:center'><a href='puestoForm.jsp' class='btn btn-success'>Nuevo Puesto</a></th></tr>\n";
	CtrlPuesto cp = new CtrlPuesto();
	List<Puesto> puestos = cp.daPuestos();
	int numPuestos = puestos.size();

	if (puestos.isEmpty()) {
		html += "<tr><td colspan='3'>No hay puestos</td></tr>\n";
	} else {
		Puesto cpActual;
		for (int i = 0; i < numPuestos; i++) {
			cpActual = (Puesto) puestos.get(i);
			html += "<tr><td>"
					+ cpActual.getIdPuesto()
					+ "</td><td>"
					+ cpActual.getNombPuesto()
					+ "</td><td>"
					+ cpActual.getPerfilPuesto()
					+ "</td><td>"
					+ cpActual.getFechaIng().toString()
					+ "</td><td>"
					+ cpActual.getSueldoMin()
					+ "</td><td>"
					+ cpActual.getSueldoMax()
					+ "</td><td style='text-align:center'><div class='btn-group btn-group-sm'><a href='puestoForm.jsp?id_puesto="
					+ cpActual.getIdPuesto()
					+ "' class='btn btn-warning'>Editar</a><a href='puestoProcess.jsp?id_puesto="
					+ cpActual.getIdPuesto() 
					+"&accion=eliminar' class='btn btn-danger'>Eliminar</a></div></td></tr>\n";
		}
	}
	html += "</table>";
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Puestos</title>
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
					<h2>Puestos /</h2>
					<p>Mantenimiento a tabla Puestos</p>
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