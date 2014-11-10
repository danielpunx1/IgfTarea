<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@page import="java.math.BigDecimal"%>
<%@ page import="java.text.SimpleDateFormat" %> 

<%
	String mensaje="";
	String id_tipodescuento=request.getParameter("id_tipodescuento");
	CtrlTiposDescuentos desc = new CtrlTiposDescuentos();
	TiposDescuentos Descuento;
	
	if(request.getParameter("accion").equalsIgnoreCase("eliminar"))
	{//Para eliminar un registro
	
		if( desc.daTipoDescuentoById(id_tipodescuento) != null )
		{
			if( desc.eliminarTipoDescuento(id_tipodescuento) )
				mensaje+="¡El tipo descuento "+id_tipodescuento+" fue eliminado correctamente!";
			else
				mensaje+="¡No se pudo eliminar el tipo descuento "+id_tipodescuento+"!";
		}else
			mensaje+="¡El id tipo descuento "+id_tipodescuento+" no existe!";
	
	}else if(request.getParameter("accion").equalsIgnoreCase("editar"))
	{//Para editar un registro
		
		if( desc.daTipoDescuentoById(id_tipodescuento) != null )
		{
			String descripcion = request.getParameter("descripcion");
			double porcentaje = Double.parseDouble( request.getParameter("porcentaje") );
			String fechas = request.getParameter("fecha");
			
		    SimpleDateFormat var = new SimpleDateFormat("yyyy-MM-dd");
		    Date fecha = null; //iniciamos fecha
		    fecha = var.parse(fechas);
		    
			if(desc.modificarTipoDescuento(id_tipodescuento, descripcion, porcentaje, fecha))
				mensaje+="¡El tipo descuento "+id_tipodescuento+" fue modificado correctamente!";	
			else
				mensaje+="¡No se pudo modificar el tipo descuento con ID  "+id_tipodescuento+"!";
		}else
			mensaje+="!El id de tipo descuento "+id_tipodescuento+" no existe!";

	}else if(request.getParameter("accion").equalsIgnoreCase("agregar"))
	{//Para ingresar un nuevo registro
		if( desc.daTipoDescuentoById(id_tipodescuento) != null)
			mensaje+="!El id de tipo descuento "+id_tipodescuento+" ya existe!";
		else
		{
			String descripcion = request.getParameter("descripcion");
			double porcentaje = Double.parseDouble( request.getParameter("porcentaje") );
			String fechas = request.getParameter("fecha");
			
		    SimpleDateFormat var = new SimpleDateFormat("yyyy-MM-dd");
		    Date fecha = null; //iniciamos fecha
		    fecha = var.parse(fechas);
		    
			if(desc.crearDescuento(id_tipodescuento, descripcion, porcentaje, fecha))
				mensaje+="!El tipo descuento "+id_tipodescuento+" fue ingresado correctamente!";
			else
				mensaje+="!No se pudo ingresar el tipo descuento con id "+id_tipodescuento+"!";
		}
	}else{ //Cualquier otro error
		mensaje+="¡Error! Los parametros proporcionados no son correctos";
	}
	//Esot es para que despues de realizar la accion regrese a la pagina principal de Municipios.jsp
	mensaje+="<meta http-equiv='REFRESH' content='3,url=" 
		+ request.getRequestURL().toString().replace(request.getRequestURI().toString(), "") 
		+ request.getContextPath()+"/tiposDescuentos.jsp'>";
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Procesando Accion</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Procesa las peticiones para Crear, Eliminar y Modificar Municipios">
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
					<h2>Tipo Descuentos /</h2>
					<p><%=mensaje%></p>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>