package negocio;
import dao.EmpleadoDAO;
import dominio.Empleado;

public class CtrlEmpleado {
	private EmpleadoDAO daoEmpleado = new EmpleadoDAO();
	
	public boolean crearEmpleado(String nit, String dui, String id_empleado, String nombres,
			String apellido_pat, String apellido_mat, String fecha_nacimiento,
			String fecha_ingreso, Double sueldo, String email, String telefono,
			String activo){
		if(daoEmpleado.daEmpleadoById(id_empleado)==null){
			Empleado nuevo = new Empleado(nit, dui, id_empleado, nombres, apellido_pat, apellido_mat, fecha_nacimiento,fecha_ingreso, sueldo, email, telefono, activo);
			daoEmpleado.guardaActualiza(nuevo);
			return true;
		}
		else
			return false;
	}
}
