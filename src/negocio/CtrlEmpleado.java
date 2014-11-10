package negocio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.*;
import dominio.Empleado;
import dominio.Genero;
import dominio.Oficina;
import dominio.Puesto;
import dominio.TiposDescuentos;
import negocio.*;

public class CtrlEmpleado {
	private EmpleadoDAO daoEmpleado = new EmpleadoDAO();
	private PuestoDAO daoPuesto = new PuestoDAO();
	private OficinaDAO daoOficina = new OficinaDAO();
	private GeneroDAO daoGenero = new GeneroDAO();

	public boolean crearEmpleado(String id_empleado, String nit, String dui,
			String nombres, String apellido_paterno, String apellido_materno,
			Date fecha_nacimiento, Date fecha_ingreso, Double sueldo,
			String email, String telefono, String activo, String id_genero,
			int id_puesto, String id_oficina, String id_jefe) {

		if (daoEmpleado.daEmpleadoById(id_empleado) == null) {
			CtrlEmpleado emp=new CtrlEmpleado();
			Empleado jefe = emp.daEmpleadoById(id_jefe);
			CtrlOficina ofi=new CtrlOficina();
			Oficina oficina=ofi.daOficinaByIdOficina(id_oficina);
			CtrlGenero gen = new CtrlGenero();
			Genero genero = gen.daGeneroByIdGenero(id_genero);
			CtrlPuesto pue=new CtrlPuesto();
			Puesto puesto = pue.daPuestoById(id_puesto);
			Empleado empleado = new Empleado(id_empleado, nit, dui, nombres,
					apellido_paterno, apellido_materno, fecha_nacimiento,
					fecha_ingreso, sueldo, email, telefono, activo, genero,
					puesto, oficina, jefe);
			daoEmpleado.guardaActualiza(empleado);
			return true;

		} else
			return false;
	}

	public boolean eliminarEmpleado(String id_empleado) {
		boolean b = false;
		Empleado empleado = daoEmpleado.daEmpleadoById(id_empleado);
		try{
			//si existe ese empleado con ese id, que lo elimine
			if (daoEmpleado.daEmpleadoById(id_empleado)!= null && empleado.getJefe()!=null) {
			//if (daoEmpleado.daEmpleadoById(id_empleado)!= null && empleado.getJefe().equals(null)) {
				//Empleado empleado = daoEmpleado.daEmpleadoById(id_empleado);
				daoEmpleado.eliminar(empleado);
				b = true;
			}
			else
				b = false;
		}catch(NullPointerException e){
		}
		return b;
	}
	
	public boolean modificarEmpleado(String id_empleado, String nit, String dui,
			String nombres, String apellido_paterno, String apellido_materno,
			Date fecha_nacimiento, Date fecha_ingreso, Double sueldo,
			String email, String telefono, String activo, String id_genero,
			int id_puesto, String id_oficina, String id_jefe) {
		
		if (daoEmpleado.daEmpleadoById(id_empleado) != null) {
			//Departamento departamento = daoDepto.daDepartamentoByIdDepto(id_depto);
			Puesto puesto = daoPuesto.daPuestoById(id_puesto);
			Oficina oficina = daoOficina.daOficinaByIdOficina(id_oficina);
			Genero genero = daoGenero.daGeneroById(id_genero);
			Empleado empleado = daoEmpleado.daEmpleadoById(id_empleado);
			
			empleado.setNit(nit);
			empleado.setDui(dui);
			empleado.setNombres(nombres);
			empleado.setApellido_paterno(apellido_paterno);
			empleado.setApellido_materno(apellido_materno);
			empleado.setFecha_nacimiento(fecha_nacimiento);
			empleado.setFecha_ingreso(fecha_ingreso);
			empleado.setSueldo(sueldo);
			empleado.setEmail(email);
			empleado.setTelefono(telefono);
			empleado.setActivo(activo);
			empleado.setSexo(genero);
			empleado.setPuesto(puesto);
			empleado.setOficina(oficina);
			empleado.setJefe(empleado);
			daoEmpleado.guardaActualiza(empleado);
			return true;
		} else
			return false;
	}
	
	
	public Empleado daEmpleadoById(String idEmple) {
		return daoEmpleado.daEmpleadoById(idEmple);
	}
	
	public List<Empleado> daEmpleados() {
		return daoEmpleado.daEmpleados();
	}
}
