<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%
	String mensaje = "";
	String readonly = "";
	String accion = "agregar";
	String nombrejefe="";
	//Puesto p = new Puesto();
	Empleado empleado = new Empleado();
	//Oficina o = new Oficina();
	Genero g = new Genero();
	//si el campo de id_empleado no se envia en blanco
	if (request.getParameter("id_empleado") != null) {
		accion = "editar";
		String id_empleado = request.getParameter("id_empleado");
		CtrlEmpleado emp = new CtrlEmpleado();
		//si hay un empleado con ese id
		if (emp.daEmpleadoById(id_empleado) != null) {
			readonly = "readonly"; //Para que el input del id_municipio no se pueda editar(cuando se esta editando un registro)
			empleado = emp.daEmpleadoById(id_empleado);
			mensaje += "Edicion del Empleado "
					+ empleado.getId_empleado();
		} else {
			mensaje += "El id del Emplelado especificado es inexistente. Si lo desea puede ingresar un nuevo registro";
		}
	} else {
		mensaje += "Nuevo Empleado";
	}

	//Esto solo se va a hacer cuando quieran poner un select con un listado de otra tabla
	//seleccionar genero
	String selectGenero = "";
	CtrlGenero genero = new CtrlGenero();
	List<Genero> listGenero = genero.daGeneros();
	int numGeneros = listGenero.size();
	if (listGenero.isEmpty()) {
		selectGenero = "<option value='000'>Vacio</option>";
	} else {
		Genero generoActual = new Genero();
		for (int i = 0; i < numGeneros; i++) {
			generoActual = (Genero) listGenero.get(i);
			if (empleado.getId_empleado() != null) {
				if (generoActual.getId_sexo().equalsIgnoreCase(
						empleado.getSexo().getId_sexo())) {
					selectGenero += "\n<option value='"
							+ generoActual.getId_sexo() + "' selected>"
							+ generoActual.getSexo()
							+ "</option>";
				} else {
					selectGenero += "\n<option value='"
							+ generoActual.getId_sexo() + "'>"
							+ generoActual.getSexo()
							+ "</option>";
				}
			} else {
				selectGenero += "\n<option value='"
						+ generoActual.getId_sexo() + "'>"
						+ generoActual.getSexo() + "</option>";
			}
		}
	}
	//seleccionar puesto
	String selectPuesto = "";
	CtrlPuesto puesto = new CtrlPuesto();
	List<Puesto> listPuesto = puesto.daPuestos();
	int numPuestos = listPuesto.size();
	if (listPuesto.isEmpty()) {
		selectPuesto = "<option value='000'>Vacio</option>";
	} else {
		Puesto puestoActual; //hace flta hacer el new Puesto()
		for (int i = 0; i < numGeneros; i++) {
			puestoActual = (Puesto) listPuesto.get(i);
			if (empleado.getId_empleado() != null) {
				if (puestoActual.getIdPuesto() != 0) {
					selectPuesto += "\n<option value='"
							+ puestoActual.getIdPuesto() + "' selected>"
							+ puestoActual.getNombPuesto()
							+ "</option>";
				} else {
					selectPuesto += "\n<option value='"
							+ puestoActual.getIdPuesto() + "'>"
							+ puestoActual.getNombPuesto()
							+ "</option>";
				}
			} else {
				selectPuesto += "\n<option value='"
						+ puestoActual.getIdPuesto() + "'>"
						+ puestoActual.getNombPuesto() + "</option>";
			}
		}
	}
	//seleccionar Oficina
	String selectOficina = "";
	CtrlOficina oficina = new CtrlOficina();
	List<Oficina> listOficina = oficina.daOficinas();
	int numOficinas = listOficina.size();
	if (listOficina.isEmpty()) {
		selectOficina = "<option value='000'>Vacio</option>";
	} else {
		Oficina oficinaActual;
		for (int i = 0; i < numOficinas; i++) {
			oficinaActual = (Oficina) listOficina.get(i);
			if (empleado.getId_empleado() != null) {
				if (oficinaActual.getIdOficina().equalsIgnoreCase(
						empleado.getOficina().getIdOficina())) {
					selectOficina += "\n<option value='"
							+ oficinaActual.getIdOficina() + "' selected>"
							+ oficinaActual.getNombOficina()
							+ "</option>";
				} else {
					selectOficina += "\n<option value='"
							+ oficinaActual.getIdOficina() + "'>"
							+ oficinaActual.getNombOficina()
							+ "</option>";
				}
			} else {
				selectOficina += "\n<option value='"
						+ oficinaActual.getIdOficina() + "'>"
						+ oficinaActual.getNombOficina() + "</option>";
			}
		}
	}
	//seleccionar Jefe
	String selectJefe = "";
	CtrlEmpleado jefe = new CtrlEmpleado();
	List<Empleado> listJefe = jefe.daEmpleados();//rober ya me fije, creo que he olvidado cambiar el select*** doek cada combo
	int numJefes = listJefe.size();
	if (listJefe.isEmpty()) {
		selectJefe = "<option value='000'>Vacio</option>";
	} else {
		Empleado jefeActual;
		for (int i = 0; i < numJefes; i++) {
			jefeActual = (Empleado) listJefe.get(i);
			if (empleado.getId_empleado() != null) {
				if (jefeActual.getId_empleado().equalsIgnoreCase(
						empleado.getId_empleado())) {
					selectJefe += "\n<option value='"
							+ jefeActual.getId_empleado() + "' selected>"
							+ jefeActual.getNombres()+" "+jefeActual.getApellido_paterno()
							+ "</option>";
				} else {
					selectJefe += "\n<option value='"
							+ jefeActual.getId_empleado() + "'>"
							+ jefeActual.getNombres()+" "+jefeActual.getApellido_paterno()
							+ "</option>";
				}
			} else {
				selectJefe += "\n<option value='"//Cambia a otra variable x ejemplo selectJefe
						+ jefeActual.getId_empleado() + "'>"
						+ jefeActual.getNombres()+" "+jefeActual.getApellido_paterno()+ "</option>";
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Ingreso de Empleados</title>
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
					<h2>Empleados /</h2>
					<p><%=mensaje%></p>
				</div>
			</div>
		</div>
	</div>

	<div>
		<div class="contact-us container">
			<div class="row">
				<form method="post" action="empleadoProces.jsp">
					<div class="span5" style="float: center">
						<label for="id_empleado" class="nameLabel"><h5>Id Empleado</h5></label>
						<%=empleado.getId_empleado()%>
						<label for="nombres" class="nameLabel"><h5>Nombres del Empleado</h5></label>
						<%=empleado.getNombres()%> 
						<label for="apellido_pat" class="nameLabel"><h5>Primer Apellido</h5></label>
						<%=empleado.getApellido_paterno()%> 
						<label for="apellido_mat" class="nameLabel"><h5>Segundo Apellido</h5></label>
						<%=empleado.getApellido_materno()%> 
						<label for="sexo"><h5>Sexo</h5></label> 
						<%= empleado.getSexo().getSexo() %>
						<label for="nit" class="nameLabel"><h5>NIT</h5></label>
						<%=empleado.getNit()%>
						<label for="dui" class="nameLabel"><h5>DUI</h5></label>
						<%=empleado.getDui()%>
						<label for="fecha_nacimiento" class="nameLabel"><h5>Fecha Nacimiento</h5></label>
						<%=empleado.getFecha_nacimiento()%>
						<label for="fecha_ingreso" class="nameLabel"><h5>Fecha Ingreso</h5></label>
						<%=empleado.getFecha_ingreso()%>
					</div>
					<div class="span5" style="float: center">
						<label for="sueldo" class="nameLabel"><h5>Sueldo</h5></label>
						$ <%=empleado.getSueldo()%>
						<label for="email" class="nameLabel"><h5>Correo Electronico</h5></label>
						<%=empleado.getEmail()%>
						<label for="telefono" class="nameLabel"><h5>Telefono</h5></label>
						<%=empleado.getTelefono()%>
						<label for="activo" class="nameLabel"><h5>El Empleado es activo</h5></label>
						<%=empleado.getActivo()%>
						<label for="puesto"><h5>Puesto Laboral</h5></label> 
						<%=empleado.getPuesto().getNombPuesto()%>
						<label for="oficina"><h5>Oficina</h5></label> 
						<%=empleado.getOficina().getNombOficina()%>
						<label for="jefe"><h5>Jefe</h5></label>
						<%if(empleado.getJefe()==null)
						{
							nombrejefe="--";
						}
						else{
							nombrejefe=empleado.getJefe().getNombres()+" "+empleado.getJefe().getApellido_paterno();
						}
						%>
						<%=nombrejefe%> 
						
						<br><br>
						<!-- <a href="Empleado.jsp"><button >Atras</button></a> -->
							
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