<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>

<%
	String mensaje = "";
	String readonly = "";
	String accion="agregar";
	
	Departamento departamento = new Departamento("","","");
	if (request.getParameter("id_depto") != null) {
		accion="editar";
		String id_depto = request.getParameter("id_depto");
		CtrlDepartamento depto = new CtrlDepartamento();
		if (depto.daDepartamentoByIdDepto(id_depto) != null) {
			readonly = "readonly"; //Para que el input del id_depto no se pueda editar(cuando se esta editando un registro)
			departamento = depto.daDepartamentoByIdDepto(id_depto);
			mensaje += "Edicion del municipio "
					+ departamento.getIdDepto();
		} else {
			mensaje += "El id de departamento especificado es inexistente. Si lo desea puede ingresar un nuevo registro";
		}
	} else {
		mensaje += "Nuevo Departamento";
	}
	
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Departamentos</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Formulario para el ingreso y modificacion de departamentos">
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

	<div>
		<div class="contact-us container">
			<div class="row">
				<form method="post" action="departamentoProcess.jsp">
					<div class="otro span5" style="float: center">
						<label for="id_depto" class="nameLabel">Id Departamento</label> 
						<input id="id_depto" type="text" name="id_depto" placeholder="Id Departamento"	value="<%=departamento.getIdDepto()%>" <%=readonly%> required> 
						<label for="nombre_depto" class="nameLabel">Nombre del Departamento</label> 
						<input id="nombre_depto" type="text" name="nombre_depto" placeholder="Nombre del Departamento"	value="<%=departamento.getNombreDepto()%>" required> 
						<label for="zona_geografica">Zona Geografica</label> 
						<input name="zona_geografica" id="zona_geografica" placeholder="Zona Geografica" value="<%=departamento.getZonaGeografica()%>" required>
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