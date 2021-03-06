<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>

<%
	String mensaje = "";
	String readonly = "";
	String accion="agregar";
	
	Departamento d=new Departamento();//Solo lo uso para inicializar a valores vacios a municipio
	Municipio municipio = new Municipio("",d,"");
	if (request.getParameter("id_municipio") != null) {
		accion="editar";
		String id_municipio = request.getParameter("id_municipio");
		CtrlMunicipio mun = new CtrlMunicipio();
		if (mun.daMunicipioByIdMunicipio(id_municipio) != null) {
			readonly = "readonly"; //Para que el input del id_municipio no se pueda editar(cuando se esta editando un registro)
			municipio = mun.daMunicipioByIdMunicipio(id_municipio);
			mensaje += "Edicion del municipio "
					+ municipio.getIdMunicipio();
		} else {
			mensaje += "El id de municipio especificado es inexistente. Si lo desea puede ingresar un nuevo registro";
		}
	} else {
		mensaje += "Nuevo Municipio";
	}

	//Esto solo se va a hacer cuando quieran poner un select con un listado de otra tabla
	String selectDeptos = "";
	CtrlDepartamento deptos = new CtrlDepartamento();
	List<Departamento> listDeptos = deptos.daDepartamentos();
	int numDeptos = listDeptos.size();

	if (listDeptos.isEmpty()) {
		selectDeptos = "<option value='000'>Vacio</option>";
	} else {
		Departamento deptoActual = new Departamento();
		for (int i = 0; i < numDeptos; i++) {
			deptoActual = (Departamento) listDeptos.get(i);
			if(municipio.getIdMunicipio()!=null){
				if (deptoActual.getIdDepto().equalsIgnoreCase(municipio.getDepto().getIdDepto())){
					selectDeptos += "\n<option value='"
							+ deptoActual.getIdDepto() + "' selected>"
							+ deptoActual.getNombreDepto() + "</option>";
				}else{
					selectDeptos += "\n<option value='"
							+ deptoActual.getIdDepto() + "'>"
							+ deptoActual.getNombreDepto() + "</option>";
				}
			}else{
				selectDeptos += "\n<option value='"
						+ deptoActual.getIdDepto() + "'>"
						+ deptoActual.getNombreDepto() + "</option>";
			}
		}
	}
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Municipios</title>
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
					<h2>Municipios /</h2>
					<p><%=mensaje%></p>
				</div>
			</div>
		</div>
	</div>

	<div>
		<div class="contact-us container">
			<div class="row">
				<form method="post" action="municipioProcess.jsp">
					<div class="otro span5" style="float: center">
						<label for="id_municipio" class="nameLabel">Id Municipio</label> 
						<input id="id_municipio" type="text" name="id_municipio" placeholder="Id Municipio"	value="<%=municipio.getIdMunicipio()%>" <%=readonly%> required> 
						<label for="nomb_municipio" class="nameLabel">Nombre del Municipio</label> 
						<input id="nomb_municipio" type="text" name="nomb_municipio" placeholder="Nombre del Municipio"	value="<%=municipio.getNombMunicipio()%>" required> 
						<label for="id_depto">Departamento</label> 
						<select name="id_depto" id="id_depto" class="form-control"><%=selectDeptos%></select>
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