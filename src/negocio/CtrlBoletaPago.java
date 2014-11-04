package negocio;

import java.math.BigDecimal;
import java.util.Date;

import dao.BoletaPagoDAO;
import dominio.BoletaPago;
import dominio.Empleado;

public class CtrlBoletaPago {

	private BoletaPagoDAO  daoBoleta = new BoletaPagoDAO();
	
	public boolean crearBoleta(Integer id, Empleado empleado, String periodo, BigDecimal sueldo ){
		if(daoBoleta.daBoletaPagoById(id) == null)
		{
			BoletaPago nuevo = new BoletaPago(id,empleado,periodo,sueldo);
			daoBoleta.guardaActualiza(nuevo);
			return true;
		}
		else
		{
			return false;
		}
	}
	
}
