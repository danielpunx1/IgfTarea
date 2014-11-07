package negocio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.EmpleadoDAO;
import dominio.Empleado;
import dominio.Genero;
import dominio.Oficina;
import dominio.Puesto;
import negocio.*;

public class CtrlEmpleado {
	private EmpleadoDAO daoEmpleado = new EmpleadoDAO();

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

	public Empleado daEmpleadoById(String idEmple) {
		return daoEmpleado.daEmpleadoById(idEmple);
	}
}
