<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>

<%
	String mensaje = "";
	String readonly = "";
	String accion="agregar";
	
	BoletaPago Boleta = new BoletaPago();

	if (request.getParameter("id_boletapago") != null)
	{
		accion="editar";
		int id_boletapago = Integer.parseInt( request.getParameter("id_boletapago") );
		CtrlBoletaPago bp = new CtrlBoletaPago();
		
		if (bp.daBoletaPagoById((short)id_boletapago) != null) {
			readonly = "readonly"; //Para que el input del id_municipio no se pueda editar(cuando se esta editando un registro)
			Boleta = bp.daBoletaPagoById((short)id_boletapago);
			mensaje += "Edicion de la boleta de pago "
					+ Boleta.getId_boletapago();
		} else {
			mensaje += "El id de boleta de pago especificado es inexistente. Si lo desea puede ingresar un nuevo registro";
		}
	} else {
		mensaje += "Nueva boleta";
	}

	//Esto solo se va a hacer cuando quieran poner un select con un listado de otra tabla
    String selectEmp = "";
	CtrlEmpleado emple = new CtrlEmpleado();
	
	List<Empleado> listEmp = emple.daEmpleados();

	if (listEmp.isEmpty()) 
	{
		selectEmp = "<option value='000'>Vacio</option>";
	} else 
	{
		Empleado empActual = new Empleado();
		for (int i = 0; i < listEmp.size(); i++) {
			empActual = (Empleado)listEmp.get(i);
			//if( empActual.getId_empleado() != null)
			if( accion.equalsIgnoreCase("editar") )
			{
				if ( empActual.getId_empleado().equalsIgnoreCase(Boleta.getId_empleado().getId_empleado()) )
				{
					selectEmp += "\n<option value='"
							+ empActual.getId_empleado() + "' selected>"
							+ empActual.getNombres() +" " + empActual.getApellido_paterno() + " " 
							+ empActual.getApellido_materno() + "</option>";
				}
				else
				{
					selectEmp += "\n<option value='"
							+ empActual.getId_empleado() + "'>"
							+ empActual.getNombres() +" " + empActual.getApellido_paterno() + " " 
							+ empActual.getApellido_materno() + "</option>";
				}
			}
			else
			{
				selectEmp += "\n<option value='"
						+ empActual.getId_empleado() + "'>"
						+ empActual.getNombres() +" " + empActual.getApellido_paterno() + " " 
						+ empActual.getApellido_materno() + "</option>";
			}
		}
	}  
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Boleta Pago</title>
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
					<h2>Boleta Pago /</h2>
					<p><%=mensaje%></p>
				</div>
			</div>
		</div>
	</div>

	<div>
		<div class="contact-us container">
			<div class="row">
				<form method="post" action="BoletaPagoProcess.jsp">
					<div class="otro span5" style="float: center">
						<label for="id_empleado">Empleado</label> 
						<select name="id_empleado" id="id_empleado" class="form-control"> <%=selectEmp%> </select>
						
						<label for="periodo" class="nameLabel">Periodo de pago</label> 
						<input id="periodo" type="text" name="periodo" value="<%= Boleta.getPeriodo_pago()%>" required> 
						
						<label for="sueldo" class="nameLabel">Sueldo neto</label> 
						<input id="sueldo" type="text" name="sueldo" placeholder="ingrese el sueldo" value="<%=Boleta.getSueldo_neto()%>" required> 
				
						<button type="submit" style="float: right;">Guardar</button>
					</div>
					<!--
						Este input no se desplegara solo servira para enviar otro parametro extra 
						para determinar si estamos agregando un nuevo registro o modificando uno 
						existente
					-->
					<input type="hidden" name="accion" value="<%=accion%>">
					<input type="hidden" name="id_boletapago" value="<%=Boleta.getId_boletapago()%>">
				</form>

			</div>
		</div>
	</div>

	<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>