<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	String mensaje="";
	int id_puesto = 0;
	try{
	id_puesto = Integer.parseInt(request.getParameter("id_puesto"));}
	catch(Exception ex){
		
	}
	CtrlPuesto cp = new CtrlPuesto();
	Puesto puesto = cp.daPuestoById(id_puesto);
	BigDecimal sMin, sMax;
	Date fecha;
	SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd", new Locale("es", "ES"));
	if(request.getParameter("accion").equalsIgnoreCase("eliminar")){//Para eliminar un registro
	
		if(cp.daPuestoById(id_puesto)!=null){
			if(cp.eliminarPuesto(id_puesto))
				mensaje+="¡El puesto "+Integer.toString(id_puesto)+" fue eliminado correctamente!";
			else
				mensaje+="¡No se pudo eliminar el puesto "+Integer.toString(id_puesto)+"!";
		}else
			mensaje+="¡El id de puesto "+Integer.toString(id_puesto)+" no existe!";
	
	}else if(request.getParameter("accion").equalsIgnoreCase("editar")){//Para editar un registro
		
		if(cp.daPuestoById(id_puesto)!=null){
			sMin = new BigDecimal(request.getParameter("sueldo_min"));
			sMax = new BigDecimal(request.getParameter("sueldo_max"));
			if(cp.modificarPuesto(id_puesto, request.getParameter("nomb_puesto"), request.getParameter("perfil_puesto"),
							sMin, sMax))
				mensaje+="¡El puesto "+Integer.toString(id_puesto)+" fue modificado correctamente!";	
			else
				mensaje+="¡No se pudo modificar el puesto "+Integer.toString(id_puesto)+"!";
		}else
			mensaje+="!El id de puesto "+Integer.toString(id_puesto)+" no existe!";

	}else if(request.getParameter("accion").equalsIgnoreCase("agregar")){//Para ingresar un nuevo registro
		if(cp.daPuestoById(id_puesto)!=null)
			mensaje+="!El id de puesto "+Integer.toString(id_puesto)+" ya existe!";
		else{
			sMin = new BigDecimal(request.getParameter("sueldo_min"));
			sMax = new BigDecimal(request.getParameter("sueldo_max"));
			try{
				fecha = Date.valueOf(request.getParameter("fecha_ing"));
				if(cp.crearPuesto(id_puesto, request.getParameter("nomb_puesto"), request.getParameter("perfil_puesto"),
						fecha,sMin, sMax))
					mensaje+="!El puesto "+Integer.toString(id_puesto)+" fue ingresado correctamente!";
				else
					mensaje+="1!No se pudo ingresar el registro "+Integer.toString(id_puesto)+"!";
			}catch(Exception ex) {
				mensaje+="!No se pudo ingresar el registro "+Integer.toString(id_puesto)+"!, revise fecha ingresada";
			}
	}
	}else{ //Cualquier otro error
		mensaje+="¡Error! Los parametros proporcionados no son correctos";
	}
	
	//Esto es para que despues de realizar la accion regrese a la pagina principal de Municipios.jsp
	mensaje+="<meta http-equiv='REFRESH' content='3,url=" 
		+ request.getRequestURL().toString().replace(request.getRequestURI().toString(), "") 
		+ request.getContextPath()+"/Puestos.jsp'>";
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Procesando Accion</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Procesa las peticiones para Crear, Eliminar y Modificar Puestos">
<meta name="author" content="Diego Monterroza">

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
					<p><%=mensaje%></p>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>