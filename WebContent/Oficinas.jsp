<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>

<%
	String html = "<table class='table'>\n<tr><th>Id Oficina</th><th>Nombre Oficina</th><th>Municipio</th><th>Domicilio</th><th style='text-align:center'><a href='oficinaForm.jsp' class='btn btn-success'>Nueva Oficina</a></th></tr>\n";
	CtrlOficina cp = new CtrlOficina();
	List<Oficina> oficinas = cp.daOficinas();
	int numOficinas = oficinas.size();

	if (oficinas.isEmpty()) {
		html += "<tr><td colspan='3'>No hay oficinas</td></tr>\n";
	} else {
		Oficina cpActual;
		for (int i = 0; i < numOficinas; i++) {
			cpActual = (Oficina) oficinas.get(i);
			html += "<tr><td>"
					+ cpActual.getIdOficina()
					+ "</td><td>"
					+ cpActual.getNombOficina()
					+ "</td><td>"
					+ cpActual.getMunicipio().getNombMunicipio()
					+ "</td><td>"
					+ cpActual.getDomicilio()
					+ "</td><td style='text-align:center'><div class='btn-group btn-group-sm'><a href='oficinaForm.jsp?id_oficina="
					+ cpActual.getIdOficina()
					+ "' class='btn btn-warning'>Editar</a><a href='oficinaProcess.jsp?id_oficina="
					+ cpActual.getIdOficina() 
					+"&accion=eliminar' class='btn btn-danger'>Eliminar</a></div></td></tr>\n";
		}
	}
	html += "</table>";
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Oficinas</title>
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
					<h2>Oficinas /</h2>
					<p>Mantenimiento a tabla Oficinas</p>
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