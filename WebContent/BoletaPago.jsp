<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>

<%
	String html = "<table class='table'>\n<tr><th>Id Boleta Pago</th><th>Empleado</th><th>Periodo</th><th>Sueldo neto</th><th style='text-align:center'><a href='BoletaPagoForm.jsp' class='btn btn-success'>Nueva Boleta</a></th></tr>\n";
	CtrlBoletaPago bp = new CtrlBoletaPago();
	List<BoletaPago> boletas = bp.daBoletaPagoAll();

	if (boletas.isEmpty()) {
		html += "<tr><td colspan='3'>No hay boletas de pago registradas</td></tr>\n";
	} else {
		BoletaPago boletaActual;
		for (int i = 0; i < boletas.size(); i++) {
			boletaActual = (BoletaPago) boletas.get(i);
			html += "<tr><td>"
					+ boletaActual.getId_boletapago()
					+ "</td><td>"
					+ boletaActual.getId_empleado().getNombres() + " " + boletaActual.getId_empleado().getApellido_materno() 
					+ "</td><td>"
					+ boletaActual.getPeriodo_pago()
					+ "</td><td>"
					+ boletaActual.getSueldo_neto()
					+ "</td><td style='text-align:center'><div class='btn-group btn-group-sm'><a href='BoletaPagoForm.jsp?id_boletapago="
					+ boletaActual.getId_boletapago()
					+ "' class='btn btn-warning'>Editar</a><a href='BoletaPagoProcess.jsp?id_boletapago="
					+ boletaActual.getId_boletapago()
					+"&accion=eliminar' class='btn btn-danger'>Eliminar</a></div></td></tr>\n";
		}
	}
	html += "</table>";
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Boleta Pago</title>
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
					<h2>Boleta Pago /</h2>
					<p>Mantenimiento a tabla  Boleta pago</p>
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