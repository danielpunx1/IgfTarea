<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%
	String mensaje="";
	//String id_municipio=request.getParameter("id_municipio");
	//CtrlMunicipio mun=new CtrlMunicipio();
	//CtrlDepartamento depto=new CtrlDepartamento();
	Empleado empleado;
	BoletaPago boleta;
	CtrlBoletaPago bp = new CtrlBoletaPago();
	CtrlEmpleado emp = new CtrlEmpleado();
	
	if(request.getParameter("accion").equalsIgnoreCase("eliminar"))
	{//Para eliminar un registro
	
		if( bp.daBoletaPagoById( (short)Integer.parseInt(request.getParameter("id_boletapago") ) ) != null)
		{
			if( bp.eliminarBoletaPago( (short)Integer.parseInt(request.getParameter("id_boletapago") ) ) )
				mensaje+="¡La boleta de pago "+ request.getParameter("id_boletapago")  +" fue eliminada correctamente!";
			else
				mensaje+="¡No se pudo eliminar la boleta de pago "+request.getParameter("id_boletapago")+"!";
		}else
			mensaje+="¡La id de boleta de pago "+ request.getParameter("id_boletapago") +" no existe!";
	
	} 
	else if(request.getParameter("accion").equalsIgnoreCase("editar"))
	{//Para editar un registro
		int ids = Integer.parseInt(request.getParameter("id_boletapago") );
		if( bp.daBoletaPagoById( (short)ids ) != null )
		{ 
			empleado = emp.daEmpleadoById(request.getParameter("id_empleado"));
			double salario = Double.parseDouble(request.getParameter("sueldo"));
			String periodo = request.getParameter("periodo");
			if( bp.modificarBoletaPago2((short)ids,empleado, periodo,salario )) 
				mensaje+="¡La boletad de pago "+request.getParameter("id_boletapago")+" fue modificada correctamente!";	
			else
				mensaje+="¡No se pudo modificar la boleta de pago "+request.getParameter("id_boletapago")+"!";
		}
		else
		{
			mensaje+="!La id de boleta de pago "+request.getParameter("id_boletapago")+" no existe!";
		}

	}
	else if(request.getParameter("accion").equalsIgnoreCase("agregar"))
	{//Para ingresar un nuevo registro
		//if( bp.daBoletaPagoById( (short)Integer.parseInt(request.getParameter("id_boletapago") ) ) != null)
		//	mensaje+="!La id de boleta de pago "+request.getParameter("id_boletapago")+" ya existe!";
		//else
		//{
			empleado = emp.daEmpleadoById(request.getParameter("id_empleado"));
			double varSaldo = Double.parseDouble(request.getParameter("sueldo"));
			if( bp.crearBoleta(empleado, request.getParameter("periodo"), varSaldo)) 
				mensaje+="!La boleata de pago fue ingresada correctamente!";
			else
				mensaje+="!No se pudo ingresar la boleta de pago!";
		//}
	}
	else
	{ //Cualquier otro error
		mensaje+="¡Error! Los parametros proporcionados no son correctos";
	}
	//Esot es para que despues de realizar la accion regrese a la pagina principal de Municipios.jsp
	mensaje+="<meta http-equiv='REFRESH' content='3,url=" 
		+ request.getRequestURL().toString().replace(request.getRequestURI().toString(), "") 
		+ request.getContextPath()+"/BoletaPago.jsp'>";
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
					<h2>Boleta Pago /</h2>
					<p><%=mensaje%></p>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>