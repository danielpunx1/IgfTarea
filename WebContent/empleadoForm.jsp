<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%
	String mensaje = "";
	String readonly = "";
	String accion = "agregar";
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
			mensaje += "Edicion del municipio "
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
				if (oficinaActual.getId_oficina().equalsIgnoreCase(
						empleado.getOficina().getId_oficina())) {
					selectOficina += "\n<option value='"
							+ oficinaActual.getId_oficina() + "' selected>"
							+ oficinaActual.getNomb_oficina()
							+ "</option>";
				} else {
					selectOficina += "\n<option value='"
							+ oficinaActual.getId_oficina() + "'>"
							+ oficinaActual.getNomb_oficina()
							+ "</option>";
				}
			} else {
				selectOficina += "\n<option value='"
						+ oficinaActual.getId_oficina() + "'>"
						+ oficinaActual.getNomb_oficina() + "</option>";
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
				<form method="post" action="municipioProcess.jsp">
					<div class="span5" style="float: center">
						<label for="id_empleado" class="nameLabel">Id Empleado</label> <input
							id="id_empleado" type="text" name="id_empleado"
							placeholder="Id Empleado" <%=readonly%> required> <label for="nombres"
							class="nameLabel">Nombres del Empleado</label> <input
							id="nombres" type="text" name="nombres"
							placeholder="Ingrese aqui los nombres..." required>
							<label for="apellido_pat" class="nameLabel">Primer Apellido</label>
							<input id="apellido_pat" type="text" name="apellido_pat" placeholder="Ingrece primer apellido..." required>
							<label for="apellido_mat" class="nameLabel">Segundo Apellido</label>
							<input id="apellido_mat" type="text" name="apellido_mat" placeholder="Ingrese segundo apellido..." required>
							<label for="sexo">Sexo</label> 
							<select name="sexo" id="sexo" class="form-control"><%=selectGenero%></select>
							<label for="nit" class="nameLabel">NIT</label>
							<input id="nit" type="text" name="nit" placeholder="Ingrese aqui el Nit..." required>
							<label for="dui" class="nameLabel">DUI</label>
							<input id="dui" type="text" name="dui" placeholder="Ingrese aqui el Dui..." required>
							<label for="fecha_nacimiento" class="nameLabel">Fecha Nacimiento</label>
							<input id="fecha_nacimiento" type="Date" name="fecha_nacimiento"  required>
							<label for="fecha_ingreso" class="nameLabel">Fecha Ingreso</label>
							<input id="fecha_ingreso" type="Date" name="fecha_ingreso" required>
					</div>
					<div class="span5" style="float: center">
							<label for="sueldo" class="nameLabel">Sueldo</label>
							<input id="sueldo" type="text" name="sueldo" placeholder="Ingrese el Sueldo..." required>
							<label for="email" class="nameLabel">Correo Electronico</label>
							<input id="email" type="text" name="email" placeholder="Ingrese el email..." required>
							<label for="telefono" class="nameLabel">Telefono</label>
							<input id="telefono" type="text" name="telefono" placeholder="Ingrese el telefono..." required>
							<label for="activo" class="nameLabel">El Empleado es activo</label>
							<select name ="activo" id="activo" class="form-control">
								<option value="S" seected>Si</option>
								<option value="N">No</option>
							</select>
							<label for="puesto">Puesto Laboral</label> 
							<select name="puesto" id="puesto" class="form-control"><%=selectPuesto%></select>
							<label for="oficina">Oficina</label> 
							<select name="oficina" id="oficina" class="form-control"><%=selectOficina%></select>
							<label for="oficina">Jefe</label> 
							<select name="jefe" id="jefe" class="form-control">
								<option value="null" selected></option>
								<%=selectJefe%>
							</select>
							<button type="submit" style=float: right;>Guardar</button>
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