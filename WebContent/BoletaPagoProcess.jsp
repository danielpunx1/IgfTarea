<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%
	String mensaje="";
	String id_municipio=request.getParameter("id_municipio");
	CtrlMunicipio mun=new CtrlMunicipio();
	CtrlDepartamento depto=new CtrlDepartamento();
	Municipio municipio;
	Departamento departamento;
	
	if(request.getParameter("accion").equalsIgnoreCase("eliminar")){//Para eliminar un registro
	
		if(mun.daMunicipioByIdMunicipio(id_municipio)!=null){
			if(mun.eliminarMunicipio(id_municipio))
				mensaje+="¡El municipio "+id_municipio+" fue eliminado correctamente!";
			else
				mensaje+="¡No se pudo eliminar el municipio "+id_municipio+"!";
		}else
			mensaje+="¡El id de municipio "+id_municipio+" no existe!";
	
	}else if(request.getParameter("accion").equalsIgnoreCase("editar")){//Para editar un registro
		
		if(mun.daMunicipioByIdMunicipio(id_municipio)!=null){
			if(mun.modificarMunicipio(id_municipio, request.getParameter("id_depto"), request.getParameter("nomb_municipio")))
				mensaje+="¡El municipio "+id_municipio+" fue modificado correctamente!";	
			else
				mensaje+="¡No se pudo modificar el municipio "+id_municipio+"!";
		}else
			mensaje+="!El id de municipio "+id_municipio+" no existe!";

	}else if(request.getParameter("accion").equalsIgnoreCase("agregar")){//Para ingresar un nuevo registro
		if(mun.daMunicipioByIdMunicipio(id_municipio)!=null)
			mensaje+="!El id de municipio "+id_municipio+" ya existe!";
		else
			if(mun.crearMunicipio(id_municipio, request.getParameter("id_depto"), request.getParameter("nomb_municipio")))
				mensaje+="!El municipio "+id_municipio+" fue ingresado correctamente!";
			else
				mensaje+="!No se pudo ingresar el registro "+id_municipio+"!";
	}else{ //Cualquier otro error
		mensaje+="¡Error! Los parametros proporcionados no son correctos";
	}
	//Esot es para que despues de realizar la accion regrese a la pagina principal de Municipios.jsp
	mensaje+="<meta http-equiv='REFRESH' content='3,url=" 
		+ request.getRequestURL().toString().replace(request.getRequestURI().toString(), "") 
		+ request.getContextPath()+"/Municipios.jsp'>";
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
					<h2>Municipios /</h2>
					<p><%=mensaje%></p>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>