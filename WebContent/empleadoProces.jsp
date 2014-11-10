<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	String mensaje="";
	String id_empleado=request.getParameter("id_empleado");
	CtrlEmpleado ctrlempleado = new CtrlEmpleado();
	CtrlPuesto ctrlpuesto = new CtrlPuesto();
	CtrlGenero ctrlgenero = new CtrlGenero();
	CtrlOficina ctrloficina = new CtrlOficina();
	Empleado empleado;
	//Para eliminar un registro
	if(request.getParameter("accion").equalsIgnoreCase("eliminar")){	
		if(ctrlempleado.daEmpleadoById(id_empleado)!=null){
			if(ctrlempleado.eliminarEmpleado(id_empleado))
				mensaje+="¡El empleado "+id_empleado+" fue eliminado correctamente!";
			else
				mensaje+="¡No se pudo eliminar el empleado "+id_empleado+"!";
		}else
			mensaje+="¡El id del empleado "+id_empleado+" no existe!";
	}else if(request.getParameter("accion").equalsIgnoreCase("editar")){//Para editar un registro
			if(ctrlempleado.daEmpleadoById(id_empleado)!=null){
				SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
				//Date fecha_nacimiento = formato.parse(request.getParameter("fecha_nacimiento")));
				Date fecha_nacimiento = null;
				String fecha1 = request.getParameter("fecha_nacimiento");
				//Date fecha_ingreso = formato.parse(request.getParameter("fecha_ingreso"));
				Date fecha_ingreso = null;
				String fecha2 = request.getParameter("fecha_ingreso");
				int id_puesto = Integer.parseInt(request.getParameter("puesto"));
				Double sueldo = Double.parseDouble(request.getParameter("sueldo"));
				String id_genero = request.getParameter("sexo");
				String id_oficina = request.getParameter("oficina");
				String id_jefe = request.getParameter("jefe");
				fecha_nacimiento = formato.parse(fecha1);
				fecha_ingreso = formato.parse(fecha2);
				if(ctrlempleado.modificarEmpleado(id_empleado, request.getParameter("nit"), request.getParameter("dui"), request.getParameter("nombres"), request.getParameter("apellido_pat"), request.getParameter("apellido_mat"), fecha_nacimiento, fecha_ingreso, sueldo, request.getParameter("email"), request.getParameter("telefono"), request.getParameter("activo"), id_genero, id_puesto, id_oficina, id_jefe))
					mensaje+="¡El empleado "+id_empleado+" fue modificado correctamente!";	
				else
					mensaje+="¡No se pudo modificar el empleado "+id_empleado+"!";
			}else
				mensaje+="!El id de empleado "+id_empleado+" no existe!";
		}else if(request.getParameter("accion").equalsIgnoreCase("agregar")){//Para ingresar un nuevo registro
				if(ctrlempleado.daEmpleadoById(id_empleado)!=null)
					mensaje+="!El id de empleado"+id_empleado+" ya existe!";
				else{
					SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
					//Date fecha_nacimiento = formato.parse(request.getParameter("fecha_nacimiento")));
					Date fecha_nacimiento = null;
					String fecha1 = request.getParameter("fecha_nacimiento");
					//Date fecha_ingreso = formato.parse(request.getParameter("fecha_ingreso"));
					Date fecha_ingreso = null;
					String fecha2 = request.getParameter("fecha_ingreso");
					int id_puesto = Integer.parseInt(request.getParameter("puesto"));
					Double sueldo = Double.parseDouble(request.getParameter("sueldo"));
					String id_genero = request.getParameter("sexo");
					String id_oficina = request.getParameter("oficina");
					String id_jefe = request.getParameter("jefe");
					fecha_nacimiento = formato.parse(fecha1);
					fecha_ingreso = formato.parse(fecha2);
					if(ctrlempleado.crearEmpleado(id_empleado, request.getParameter("nit"), request.getParameter("dui"), request.getParameter("nombres"), request.getParameter("apellido_pat"), request.getParameter("apellido_mat"), fecha_nacimiento, fecha_ingreso, sueldo , request.getParameter("email"), request.getParameter("telefono"), request.getParameter("activo"), id_genero, id_puesto, id_oficina, id_jefe))
						mensaje+="!El empleado "+id_empleado+" fue ingresado correctamente!";
					else
						mensaje+="!No se pudo ingresar el registro "+id_empleado+"!";
		
				}
			}else //Cualquier otro error
				mensaje+="¡Error! Los parametros proporcionados no son correctos";
	//Esot es para que despues de realizar la accion regrese a la pagina principal de Empleados.jsp
	mensaje+="<meta http-equiv='REFRESH' content='3,url=" 
		+ request.getRequestURL().toString().replace(request.getRequestURI().toString(), "") 
		+ request.getContextPath()+"/Empleados.jsp'>";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Procesando Accion</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Procesa las peticiones para Crear, Eliminar y Modificar Municipios">
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
					<h2>Empleados /</h2>
					<p><%=mensaje%></p>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>