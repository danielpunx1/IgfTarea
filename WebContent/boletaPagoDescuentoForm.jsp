<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>

<%
	String mensaje = "";
    String input_text="";
	String readonly = "";
	String accion="agregar";
	
	BoletaPago boletapago = new BoletaPago(); //Solo lo uso para inicializar a valores vacios a municipio
	TiposDescuentos tipodescuento = new TiposDescuentos();
	BoletaPagoDescuento boletapagodescuento = new BoletaPagoDescuento(boletapago,tipodescuento,0);
	if (request.getParameter("id_boletapagodescuento") != null) {
		accion="editar";
		Short id_boletapagodescuento=Short.parseShort(request.getParameter("id_boletapagodescuento"));
		CtrlBoletaPagoDescuento bpd = new CtrlBoletaPagoDescuento();
		if (bpd.daBoletaPagoDescuantoById(id_boletapagodescuento) != null) {
			readonly = "readonly"; //Para que el input del id_municipio no se pueda editar(cuando se esta editando un registro)
			input_text="<label for='id_boletapagodescuento' class='nameLabel'>Id Descuento</label><input id='id_boletapagodescuento' type='text' name='id_boletapagodescuento' placeholder='Id Descuento'	value='"+ boletapagodescuento.getIdBoletaPagoDescuento()+ "' " + readonly + " required>";
			boletapagodescuento = bpd.daBoletaPagoDescuantoById(id_boletapagodescuento);
			mensaje += "Edicion del descuento "	+ boletapagodescuento.getIdBoletaPagoDescuento();
		} else {
			mensaje += "El id de descuento especificado es inexistente. Si lo desea puede ingresar un nuevo registro";
		}
	} else {
		mensaje += "Nuevo Descuento";
	}

	//Esto solo se va a hacer cuando quieran poner un select con un listado de otra tabla
	String selectTD = "";
	CtrlTiposDescuentos td = new CtrlTiposDescuentos();
	List<TiposDescuentos> listTD = td.daTiposDescuentos();
	int numTD = listTD.size();

	if (listTD.isEmpty()) {
		selectTD = "<option value='000'>Vacio</option>";
	} else {
		TiposDescuentos tdActual = new TiposDescuentos();
		for (int i = 0; i < numTD; i++) {
			tdActual = (TiposDescuentos) listTD.get(i);
			if(boletapagodescuento.getIdBoletaPagoDescuento()!=null){
				if (tdActual.getId_tiposdescuentos().equalsIgnoreCase(boletapagodescuento.getTiposDescuentos().getId_tiposdescuentos())){
					selectTD += "\n<option value='"
							+ tdActual.getId_tiposdescuentos() + "' selected>"
							+ tdActual.getId_tiposdescuentos() + " - " + (tdActual.getPorcentaje_descuento()) + "</option>";
				}else{
					selectTD += "\n<option value='"
							+ tdActual.getId_tiposdescuentos() + "' >"
							+ tdActual.getId_tiposdescuentos() + " - " + (tdActual.getPorcentaje_descuento()) + "</option>";
				}
			}else{
				selectTD += "\n<option value='"
						+ tdActual.getId_tiposdescuentos() + "' >"
						+ tdActual.getDescripcion() + " - " + (tdActual.getPorcentaje_descuento()) + "</option>";
			}
		}
	}
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Descuentos</title>
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
					<h2>Descuentos /</h2>
					<p><%=mensaje%></p>
				</div>
			</div>
		</div>
	</div>

	<div>
		<div class="contact-us container">
			<div class="row">
				<form method="post" action="boletaPagoDescuentoProcess.jsp">
					<div class="otro span5" style="float: center">
						
						<%=input_text%>
						
						<label for="id_boletapago" class="nameLabel">Boleta de Pago</label> 
						<input id="id_boletapago" type="text" name="id_boletapago" placeholder="Id Boleta de Pago"	required> 
						<label for="id_tiposdescuentos">Tipo de Descuento</label> 
						<select name="id_tiposdescuentos" id="id_tiposdescuentos" class="form-control"><%=selectTD%></select>
						<button type="submit" style="float: right;">Guardar</button>
					</div>
					<!--
						Este input no se desplegara solo servira para enviar otro parametro extra 
						para determinar si estamos agregando un nuevo registro o modificando uno 
						existente
					-->
					<input type="hidden" name="accion" value="<%=accion%>">
				</form>

			</div>
		</div>
	</div>

	<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>