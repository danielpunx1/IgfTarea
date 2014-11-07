<%@page import="java.util.*"%>
<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="dominio.TiposDescuentos" %>
<%@ page import="negocio.CtrlTiposDescuentos" %> 
<%@ page import="java.text.SimpleDateFormat" %>    

<%
	String html = "<table class='table'>\n<tr><th>Id tipo descuento</th><th>Descripcion</th><th>Porcentaje descuento</th><th>Fecha ingreso</th><th style='text-align:center'><a href='TipoDescuentoForm.jsp' class='btn btn-success'>Nuevo Tipo descuento</a></th></tr>\n";
	CtrlTiposDescuentos desc = new CtrlTiposDescuentos();
	List<TiposDescuentos> tiposdes = desc.daTiposDescuentos();
	int numdesc = tiposdes.size();

	if (tiposdes.isEmpty()) {
		html += "<tr><td colspan='3'>No hay tipos de descuentos</td></tr>\n";
	} else {
		TiposDescuentos descuentoActual;
		for (int i = 0; i < numdesc; i++) {
			descuentoActual = (TiposDescuentos) tiposdes.get(i);
			html += "<tr><td>"
					+ descuentoActual.getId_tiposdescuentos()
					+ "</td><td>"
					+ descuentoActual.getDescripcion()
					+ "</td><td>"
					+ descuentoActual.getPorcentaje_descuento()
					+ "</td><td>"
					+ descuentoActual.getFecha_ingreso()
					+ "</td><td style='text-align:center'><div class='btn-group btn-group-sm'><a href='TipoDescuentoForm.jsp?id_tipodescuento="
					+ descuentoActual.getId_tiposdescuentos()
					+ "' class='btn btn-warning'>Editar</a><a href='TiposDescuentosProcess.jsp?id_tipodescuento="
					+ descuentoActual.getId_tiposdescuentos()
					+"&accion=eliminar' class='btn btn-danger'>Eliminar</a></div></td></tr>\n";
		}
	}
	html += "</table>";
%> 


<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Tipos Descuentos</title>
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
					<h2>Tipos Descuento /</h2>
					<p>Mantenimiento a tabla Tipos Descuentos</p>
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