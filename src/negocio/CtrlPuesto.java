package negocio;
import java.math.BigDecimal;
import java.sql.Date;
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
	
	public Puesto buscarPuesto(int idPuesto){
		
		return daoPuesto.daPuestoById(idPuesto);
	}
	
	public boolean eliminarPuesto(int idPuesto){
		//Eliminar LEL :v
		return false;
	}
}
