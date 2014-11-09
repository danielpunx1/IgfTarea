<%@page import="org.omg.CORBA.Request"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%
	String mensaje="";
	
	CtrlBoletaPagoDescuento bpd = new CtrlBoletaPagoDescuento();
	CtrlBoletaPago bp=new CtrlBoletaPago();
	CtrlTiposDescuentos td = new CtrlTiposDescuentos();
	BoletaPagoDescuento boletapagodescuento;
	BoletaPago boletapago;
	TiposDescuentos tiposdescuentos;
	
	String accion = request.getParameter("accion");
	
	if(accion.equalsIgnoreCase("eliminar")){//Para eliminar un registro
		Short id_boletapagodescuento = Short.parseShort(request.getParameter("id_boletapagodescuento"));
		if(bpd.daBoletaPagoDescuantoById(id_boletapagodescuento)!=null){
			if(bpd.eliminarBoletaPagoDescuento(id_boletapagodescuento))
				mensaje+="¡El descuento "+id_boletapagodescuento+" fue eliminado correctamente!";
			else
				mensaje+="¡No se pudo eliminar el descuento "+id_boletapagodescuento+"!";
		}else
			mensaje+="¡El id de descuento "+id_boletapagodescuento+" no existe!";
	
	}else if(accion.equalsIgnoreCase("agregar")){//Para ingresar un nuevo registro
		String id_tiposdescuentos = request.getParameter("id_tiposdescuentos");
		Short id_boletapago = Short.parseShort(request.getParameter("id_boletapago"));
		switch (bpd.crearBoletaPagoDescuento(id_boletapago, id_tiposdescuentos)){
		case 1:
			mensaje+="¡El descuento fue aplicado correctamente!";
			break;
		case 2:
			mensaje+="¡Error. El descuento seleccionado ya fue aplicado previamente!";
			break;
		case 3:
			mensaje+="¡Error. El descuento es mayor que el sueldo neto actual del empleado!";
			break;
		case 4:
			mensaje+="¡Error. No se pudo aplicar el descuento a la boleta de pago!";
			break;
		case 0:
			mensaje+="¡Error. No existe la boleta de pago indicada";
			break;
		}
	}else if(accion.equalsIgnoreCase("editar")){
		String id_tiposdescuentos = request.getParameter("id_tiposdescuentos");
		Short id_boletapagodescuento = Short.parseShort(request.getParameter("id_boletapagodescuento"));
		
		switch (bpd.modificarBoletaPagoDescuento(id_boletapagodescuento, id_tiposdescuentos)){
		case 1:
			mensaje+="¡El descuento fue actualizado correctamente!";
			break;
		case 2:
			mensaje+="¡Error. El descuento seleccionado ya fue aplicado previamente!";
			break;
		case 3:
			mensaje+="¡Error. El descuento es mayor que el sueldo neto actual del empleado!";
			break;
		case 4:
			mensaje+="¡Error. No se pudo aplicar el descuento a la boleta de pago!";
			break;
		case 0:
			mensaje+="¡Error. No existe la boleta de pago indicada";
			break;
		case 5:
			mensaje+="¡Error. No existe el id de descuento especificado";
			break;
		}
	}else{ //Cualquier otro error
		mensaje+="¡Error! Los parametros proporcionados no son correctos";
	}
	//Esto es para que despues de realizar la accion regrese a la pagina principal de BoletaPagoDescuento.jsp
	mensaje+="<meta http-equiv='REFRESH' content='3,url=" 
		+ request.getRequestURL().toString().replace(request.getRequestURI().toString(), "") 
		+ request.getContextPath()+"/BoletaPagoDescuento.jsp'>";
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Procesando Accion</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Procesa las peticiones para Crear, Eliminar y Modificar Descuentos">
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
					<h2>Descuentos /</h2>
					<p><%=mensaje%></p>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>