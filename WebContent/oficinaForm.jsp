
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>

<%
	String mensaje = "";
	String readonly = "";
	String accion="agregar";
	
	Municipio m = new Municipio();
	Oficina oficina = new Oficina("",m,"","");
	
	
	if (request.getParameter("id_oficina") != null) {
		accion="editar";
		String id_oficina = request.getParameter("id_oficina");
		CtrlOficina cp = new CtrlOficina();
		if (cp.daOficinaByIdOficina(id_oficina) != null) {
			readonly = "readonly"; //Para que el input del id_oficina no se pueda editar(cuando se esta editando un registro)
			oficina = cp.daOficinaByIdOficina(id_oficina);
			mensaje += "Edicion de oficina "
					+ oficina.getIdOficina();
		} else {
			mensaje += "El id de oficina especificado es inexistente. Si lo desea puede ingresar un nuevo registro";
		}
	} else {
		mensaje += "Nueva Oficina";
	}
 
	//Esto solo se va a hacer cuando quieran poner un select con un listado de otra tabla
		String selectMun = "";
		CtrlMunicipio muns = new CtrlMunicipio();
		List<Municipio> listMun = muns.daMunicipios();
		int numMun = listMun.size();

		if (listMun.isEmpty()) {
			selectMun = "<option value='000'>Vacio</option>";
		} else {
			Municipio munActual = new Municipio();
			for (int i = 0; i < numMun; i++) {
				munActual = (Municipio) listMun.get(i);
				if(oficina.getIdOficina()!=null){
					if (munActual.getIdMunicipio().equalsIgnoreCase(oficina.getMunicipio().getIdMunicipio())){
						selectMun += "\n<option value='"
								+ munActual.getIdMunicipio() + "' selected>"
								+ munActual.getNombMunicipio() + "</option>";
					}else{
						selectMun += "\n<option value='"
								+ munActual.getIdMunicipio() + "'>"
								+ munActual.getNombMunicipio() + "</option>";
					}
				}else{
					selectMun += "\n<option value='"
							+ munActual.getIdMunicipio() + "'>"
							+ munActual.getNombMunicipio() + "</option>";
				}
			}
		} 
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Oficinas</title>
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
					<h2>Oficinas /</h2>
					<p><%=mensaje%></p>
				</div>
			</div>
		</div>
	</div>

	<div>
		<div class="contact-us container">
			<div class="row">
				<form method="post" action="oficinaProcess.jsp">
					<div class="otro span5" style="float: center">
						<label for="id_oficina" class="nameLabel">Id Oficina</label> 
						<input id="id_oficina" type="text" name="id_oficina" placeholder="Id Oficina"	value="<%=oficina.getIdOficina()%>" <%=readonly%> required> 
						<label for="nomb_oficina" class="nameLabel">Nombre de Oficina</label> 
						<input id="nomb_oficina" type="text" name="nomb_oficina" placeholder="Nombre del Oficina"	value="<%=oficina.getNombOficina()%>" required> 
						<label for="domicilio" class="nameLabel">Domicilio</label>
						<input id="domicilio" type="text" name="domicilio" placeholder="Domicilio de Oficina" value="<%=oficina.getDomicilio()%>" required>
						<label for="id_municipio">Municipio</label> 
						<select name="id_municipio" id="id_municipio" class="form-control"><%=selectMun%></select>
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