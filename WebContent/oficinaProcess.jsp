<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>

<%
	String mensaje="";
	String id_oficina = request.getParameter("id_oficina");
	
	CtrlMunicipio cMun = new CtrlMunicipio();
	Municipio mun = new Municipio();
	
	CtrlOficina cOfi = new CtrlOficina();
	Oficina oficina = cOfi.daOficinaByIdOficina(id_oficina);
	
	if(request.getParameter("accion").equalsIgnoreCase("eliminar")){//Para eliminar un registro
	
		if(cOfi.daOficinaByIdOficina(id_oficina)!=null){
			if(cOfi.eliminarOficina(id_oficina))
				mensaje+="¡La oficina "+id_oficina+" fue eliminada correctamente!";
			else
				mensaje+="¡No se pudo eliminar la oficina "+id_oficina+"!";
		}else
			mensaje+="¡El id de oficina "+id_oficina+" no existe!";
	
	}else if(request.getParameter("accion").equalsIgnoreCase("editar")){//Para editar un registro
		
		if(cOfi.daOficinaByIdOficina(id_oficina)!=null){
			if(cMun.daMunicipioByIdMunicipio(request.getParameter("id_municipio"))!=null){
			if(cOfi.modificarOficina(id_oficina, request.getParameter("id_municipio"),
					request.getParameter("nomb_oficina"), request.getParameter("domicilio")))
				mensaje+="¡La oficina "+id_oficina+" fue modificada correctamente!";	
			else
				mensaje+="¡No se pudo modificar la oficina "+id_oficina+"!";
		}
			else
				mensaje+="¡El municipio "+request.getParameter("id_municipio")+" no existe!\n¡No puede crearse la oficina solicitada!";
		}else
			mensaje+="!El id de oficina "+id_oficina+" no existe!";

	}else if(request.getParameter("accion").equalsIgnoreCase("agregar")){//Para ingresar un nuevo registro
		if(cOfi.daOficinaByIdOficina(id_oficina)!=null)
			mensaje+="!El id de oficina "+id_oficina+" ya existe!";
		else{
			if(cMun.daMunicipioByIdMunicipio(request.getParameter("id_municipio"))!=null){
				/* System.out.println(request.getParameter("id_municipio"));
				System.out.println(request.getParameter("id_municipio"));
				System.out.println(request.getParameter("id_municipio"));
				System.out.println(request.getParameter("id_municipio"));
				System.out.println(request.getParameter("id_municipio"));
				System.out.println(request.getParameter("id_municipio"));
				System.out.println(request.getParameter("id_municipio"));
				System.out.println(request.getParameter("id_municipio"));
				System.out.println(request.getParameter("id_municipio"));
				System.out.println(request.getParameter("id_municipio")); */
				if(cOfi.crearOficina(id_oficina, request.getParameter("id_municipio"), request.getParameter("nomb_oficina"),
						request.getParameter("domicilio")))
					mensaje+="!La oficina "+id_oficina+" fue ingresada correctamente!";
				else
					mensaje+="¡No se pudo ingresar el registro "+id_oficina+"!";
			}else
				mensaje+="¡No se pudo ingresar el registro "+id_oficina+"!\nDebido a que no existe el municipio solicitado";
	}
	}else{ //Cualquier otro error
		mensaje+="¡Error! Los parametros proporcionados no son correctos";
	}
	
	//Esto es para que despues de realizar la accion regrese a la pagina principal de Municipios.jsp
	mensaje+="<meta http-equiv='REFRESH' content='3,url=" 
		+ request.getRequestURL().toString().replace(request.getRequestURI().toString(), "") 
		+ request.getContextPath()+"/Oficinas.jsp'>";
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Procesando Accion</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Procesa las peticiones para Crear, Eliminar y Modificar Oficinas">
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
					<h2>Oficinas /</h2>
					<p><%=mensaje%></p>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>