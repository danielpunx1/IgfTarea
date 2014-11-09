<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%
	String html = "<table class='table'>\n<tr><th>Id Municipio</th><th>Nombre Municipio</th><th>Departamento</th><th style='text-align:center'><a href='municipioForm.jsp' class='btn btn-success'>Nuevo Municipio</a></th></tr>\n";
	CtrlMunicipio mun = new CtrlMunicipio();
	List<Municipio> municipios = mun.daMunicipios();
	int numMunicipios = municipios.size();

	if (municipios.isEmpty()) {
		html += "<tr><td colspan='3'>No hay municipios</td></tr>\n";
	} else {
		Municipio munActual;
		for (int i = 0; i < numMunicipios; i++) {
			munActual = (Municipio) municipios.get(i);
			html += "<tr><td>"
					+ munActual.getIdMunicipio()
					+ "</td><td>"
					+ munActual.getNombMunicipio()
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

<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Municipios</title>
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
					<h2>Municipios /</h2>
					<p>Mantenimiento a tabla Municipios</p>
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