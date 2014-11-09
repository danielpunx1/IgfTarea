<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>

<%
	String html = "<table class='table'>\n<tr><th>Boleta de Pago</th><th>Tipo de Descuento</th><th>Porcentaje</th><th>Empleado</th><th>Periodo</th><th>Monto</th><th style='text-align:center'><a href='boletaPagoDescuentoForm.jsp' class='btn btn-success'>Nuevo Descuento</a></th></tr>\n";
	CtrlBoletaPagoDescuento bpd = new CtrlBoletaPagoDescuento();
	Short id_boletapago=1;
	List<BoletaPagoDescuento> descuentos = bpd.daBoletaPagosDescuentos();
	int numDesc = descuentos.size();

	if (descuentos.isEmpty()) {
		html += "<tr><td colspan='7'>No hay descuentos</td></tr>\n";
	} else {
		BoletaPagoDescuento descuentoActual;
		for (int i = 0; i < numDesc; i++) {
			descuentoActual = (BoletaPagoDescuento) descuentos.get(i);
			html += "<tr><td>"
					+ descuentoActual.getBoletaPago().getId_boletapago()
					+ "</td><td>"
					+ descuentoActual.getTiposDescuentos().getDescripcion()
					+ "</td><td>"
					+ descuentoActual.getTiposDescuentos().getPorcentaje_descuento()
					+ "</td><td>"
					+ descuentoActual.getBoletaPago().getId_empleado().getNombres()+" "+descuentoActual.getBoletaPago().getId_empleado().getApellido_paterno()
					+ "</td><td>"
					+ descuentoActual.getBoletaPago().getPeriodo_pago()
					+ "</td><td>"
					+ descuentoActual.getMontoDescuento()
					+ "</td><td style='text-align:center'><div class='btn-group btn-group-sm'><a href='boletaPagoDescuentoForm.jsp?id_boletapagodescuento="
					+ descuentoActual.getIdBoletaPagoDescuento()
					+ "' class='btn btn-warning'>Editar</a><a href='boletaPagoDescuentoProcess.jsp?id_boletapagodescuento="
					+ descuentoActual.getIdBoletaPagoDescuento()
					+"&accion=eliminar' class='btn btn-danger'>Eliminar</a></div></td></tr>\n";
		}
	}
	html += "</table>";
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Descuentos</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Se mostraran los descuentos aplicados en las boletas de pago">
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
					<h2>Descuentos /</h2>
					<p>Mantenimiento a tabla BoletaPagoDescuento</p>
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