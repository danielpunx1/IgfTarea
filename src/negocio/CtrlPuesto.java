package negocio;
import java.sql.Date;
import java.util.List;

import dao.EmpleadoDAO;
import dao.PuestoDAO;
import dominio.Puesto;

public class CtrlPuesto {

	private PuestoDAO daoPuesto = new PuestoDAO();
	private EmpleadoDAO daoEmp = new EmpleadoDAO();

	public boolean crearPuesto(int idPuesto, String nombPuesto, String perfilPuesto,
			Date fechaIng, double sueldoMin, double sueldoMax){

		if(daoPuesto.daPuestoById(idPuesto)==null){
			Puesto puesto = new Puesto(idPuesto, nombPuesto, perfilPuesto, fechaIng, sueldoMin, sueldoMax);
			daoPuesto.guardaActualiza(puesto);
			return true;
		}
		else {
			return false;
		}
	}
	
	public boolean eliminarPuesto(int idPuesto){
		Puesto puesto = daoPuesto.daPuestoById(idPuesto);
		if(puesto!=null){
			if(!daoEmp.daEmpleadosByIdPuesto(idPuesto).isEmpty())
				return false;
			daoPuesto.elimina(puesto);
			return true;
		}
		else{
			return false;
		}
	}
	
	public boolean modificarPuesto(int idPuesto, String nombPuesto, String perfilPuesto,
			double sueldoMin, double sueldoMax){
		Puesto puesto = daoPuesto.daPuestoById(idPuesto);
		if(puesto!=null){
			puesto.setNombPuesto(nombPuesto);
			puesto.setPerfilPuesto(perfilPuesto);
			puesto.setSueldoMax(sueldoMax);
			puesto.setSueldoMin(sueldoMin);
			daoPuesto.guardaActualiza(puesto);
			return true;
		}
		else {
			return false;
		}
	}
	
	public Puesto daPuestoById(int id_puesto){
		return daoPuesto.daPuestoById(id_puesto);
	}
	
	public Puesto daPuestoByNombPuesto(String nomb_puesto){
		return daoPuesto.daPuestoByNombPuesto(nomb_puesto);
	}
	
	public List<Puesto> daPuestos(){
		return daoPuesto.daPuestos();
	}

	public List<Puesto> daPuestosSMinMayorA(double s_min){
		return daoPuesto.daPuestosSMinMayorA(s_min);
	}
	
	public List<Puesto> daPuestosSMinMenorA(double s_min){
		return daoPuesto.daPuestosSMinMenorA(s_min);
	}
	
	public List<Puesto> daPuestosSMaxMayorA(double s_max){
		return daoPuesto.daPuestosSMaxMayorA(s_max);
	}
	
	public List<Puesto> daPuestosSMaxMenorA(double s_max){
		return daoPuesto.daPuestosSMaxMenorA(s_max);
	}
}
