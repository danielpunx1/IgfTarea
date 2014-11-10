<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>

<%
	String mensaje = "";
	String readonly = "";
	String accion="agregar";
	
	//Departamento d=new Departamento();//Solo lo uso para inicializar a valores vacios a municipio
	//Municipio municipio = new Municipio("",d,"");
	TiposDescuentos Descuento = new TiposDescuentos();
	
	if (request.getParameter("id_tipodescuento") != null) 
	{
		accion="editar";
		String id_tipodescuento = request.getParameter("id_tipodescuento");
		CtrlTiposDescuentos desc = new CtrlTiposDescuentos();
		
		if (desc.daTipoDescuentoById(id_tipodescuento) != null) 
		{
			readonly = "readonly"; //Para que el input del id_municipio no se pueda editar(cuando se esta editando un registro)
			Descuento = desc.daTipoDescuentoById(id_tipodescuento);
			mensaje += "Edicion del municipio "
					+ Descuento.getId_tiposdescuentos();
		} else {
			mensaje += "El id de tipo descuento especificado es inexistente. Si lo desea puede ingresar un nuevo registro";
		}
	} else {
		mensaje += "Nuevo Tipo descuento";
	}

%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Tipo Descuento</title>
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
					<h2>Tipo Descuentos /</h2>
					<p><%=mensaje%></p>
				</div>
			</div>
		</div>
	</div>

	<div>
		<div class="contact-us container">
			<div class="row">
				<form method="post" action="TiposDescuentosProcess.jsp">
					<div class="otro span5" style="float: center">
						<label for="id_tipodescuento" class="nameLabel">Id tipo descuento</label> 
						<input id="id_tipodescuento" type="text" name="id_tipodescuento" placeholder="Id tipo descuento" value="<%= Descuento.getId_tiposdescuentos()%>" <%=readonly%> required> 
						<label for="descripcion" class="nameLabel">Descripci&oacute;n</label>
						<textarea id="descripcion" name="descripcion" placeholder="Ingrese una descripcion"><%=Descuento.getDescripcion() %></textarea>  
						<label for="porcentaje">Porcentaje</label> 
						<input id="porcentaje" type="text" name="porcentaje" placeholder="Descripcion" maxlength="4" value="<%=Descuento.getPorcentaje_descuento()%>" required>
						<label for="fecha">Fecha</label>
                          <input id="fecha" type="date" name="fecha" value="<%=Descuento.getFecha_ingreso()%>">
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