package negocio;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import dao.PuestoDAO;
import dominio.Puesto;

public class CtrlPuesto {

	private PuestoDAO daoPuesto = new PuestoDAO();

	public boolean crearPuesto(int idPuesto, String nombPuesto, String perfilPuesto,
			Date fechaIng, BigDecimal sueldoMin, BigDecimal sueldoMax){

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
			daoPuesto.elimina(puesto);
			return true;
		}
		else{
			return false;
		}
	}
	
	public boolean modificaPuesto(int idPuesto, String nombPuesto, String perfilPuesto,
			BigDecimal sueldoMin, BigDecimal sueldoMax){
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

	@SuppressWarnings("unchecked")
	public List<Puesto> daPuestosSMinMayorA(BigDecimal s_min){
		return daoPuesto.daPuestosSMinMayorA(s_min);
	}
	
	@SuppressWarnings("unchecked")
	public List<Puesto> daPuestosSMinMenorA(BigDecimal s_min){
		return daoPuesto.daPuestosSMinMenorA(s_min);
	}
	
	@SuppressWarnings("unchecked")
	public List<Puesto> daPuestosSMaxMayorA(BigDecimal s_max){
		return daoPuesto.daPuestosSMaxMayorA(s_max);
	}
	
	@SuppressWarnings("unchecked")
	public List<Puesto> daPuestosSMaxMenorA(BigDecimal s_max){
		return daoPuesto.daPuestosSMaxMenorA(s_max);
	}
}
