<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%
	String mensaje="";
	String id_depto=request.getParameter("id_depto");
	CtrlDepartamento depto=new CtrlDepartamento();
	Departamento departamento;
	
	if(request.getParameter("accion").equalsIgnoreCase("eliminar")){//Para eliminar un registro
	
		if(depto.daDepartamentoByIdDepto(id_depto)!=null){
			if(depto.eliminarDepartamento(id_depto))
				mensaje+="¡El departamento "+id_depto+" fue eliminado correctamente!";
			else
				mensaje+="¡No se pudo eliminar el depertamento "+id_depto+"!";
		}else
			mensaje+="¡El id de departamento "+id_depto+" no existe!";
	
	}else if(request.getParameter("accion").equalsIgnoreCase("editar")){//Para editar un registro
		
		if(depto.daDepartamentoByIdDepto(id_depto)!=null){
			if(depto.modificarDepartamento(id_depto, request.getParameter("nombre_depto"), request.getParameter("zona_geografica")))
				mensaje+="¡El departamento "+id_depto+" fue modificado correctamente!";	
			else
				mensaje+="¡No se pudo modificar el departamento "+id_depto+"!";
		}else
			mensaje+="!El id de departamento "+id_depto+" no existe!";

	}else if(request.getParameter("accion").equalsIgnoreCase("agregar")){//Para ingresar un nuevo registro
		if(depto.daDepartamentoByIdDepto(id_depto)!=null)
			mensaje+="!El id de departamento "+id_depto+" ya existe!";
		else
			if(depto.crearDepartamento(id_depto, request.getParameter("nombre_depto"), request.getParameter("zona_geografica")))
				mensaje+="!El departamento "+id_depto+" fue ingresado correctamente!";
			else
				mensaje+="!No se pudo ingresar el registro "+id_depto+"!";
	}else{ //Cualquier otro error
		mensaje+="¡Error! Los parametros proporcionados no son correctos";
	}
	//Esot es para que despues de realizar la accion regrese a la pagina principal de Municipios.jsp
	mensaje+="<meta http-equiv='REFRESH' content='3,url=" 
		+ request.getRequestURL().toString().replace(request.getRequestURI().toString(), "") 
		+ request.getContextPath()+"/Departamentos.jsp'>";
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Procesando Accion</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Procesa las peticiones para Crear, Eliminar y Modificar Departamentos">
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
					<h2>Departamentos /</h2>
					<p><%=mensaje%></p>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>