
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Date"%>
<%@page import="java.math.BigDecimal"%>

<%
	String mensaje = "";
	String readonly = "";
	String accion="agregar";
	
	BigDecimal cero = new BigDecimal(0.00);
	Date f = Date.valueOf("2014-01-01");
	Puesto puesto = new Puesto(0, "", "",f , cero, cero);
	
	if (request.getParameter("id_puesto") != null) {
		accion="editar";
		int id_puesto = Integer.parseInt(request.getParameter("id_puesto"));
		CtrlPuesto cp = new CtrlPuesto();
		if (cp.daPuestoById(id_puesto) != null) {
			readonly = "readonly"; //Para que el input del id_puesto no se pueda editar(cuando se esta editando un registro)
			puesto = cp.daPuestoById(id_puesto);
			mensaje += "Edicion del puesto "
					+ puesto.getIdPuesto();
		} else {
			mensaje += "El id de puesto especificado es inexistente. Si lo desea puede ingresar un nuevo registro";
		}
	} else {
		mensaje += "Nuevo Puesto";
	}

%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Puestos</title>
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
					<h2>Puestos /</h2>
					<p><%=mensaje%></p>
				</div>
			</div>
		</div>
	</div>

	<div>
		<div class="contact-us container">
			<div class="row">
				<form method="post" action="puestoProcess.jsp">
					<div class="otro span5" style="float: center">
						<label for="id_puesto" class="nameLabel">Id Puesto</label> 
						<input id="id_puesto" type="text" name="id_puesto" placeholder="Id Puesto"	value="<%=puesto.getIdPuesto()%>" <%=readonly%> required> 
						<label for="nomb_puesto" class="nameLabel">Nombre del Puesto</label> 
						<input id="nomb_puesto" type="text" name="nomb_puesto" placeholder="Nombre del Puesto"	value="<%=puesto.getNombPuesto()%>" required> 
						<label for="perfil_puesto" class="nameLabel">Perfil del Puesto</label>
						<input id="perfil_puesto" type="text" name="perfil_puesto" placeholder="Perfil del Puesto" value="<%=puesto.getPerfilPuesto()%>" required>
						<label for="fecha_ing" class="nameLabel">Fecha de Ingreso</label>
						<input id="fecha_ing" type="date" name="fecha_ing" placeholder="Fecha de Ingreso" value="<%=puesto.getFechaIng()%>" required>
						<label for="sueldo_min" class="nameLabel">Sueldo Mínimo</label>
						<input id="sueldo_min" type="number" step="0.01" name="sueldo_min" placeholder="Sueldo mínimo" value="<%=puesto.getSueldoMin()%>" required>
						<label for="sueldo_max" class="nameLabel">Sueldo Máximo</label>
						<input id="sueldo_max" type="number" step="0.01" name="sueldo_max" placeholder="Sueldo máximo" value="<%=puesto.getSueldoMax()%>" required>
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