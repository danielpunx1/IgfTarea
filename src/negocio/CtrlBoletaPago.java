package negocio;

import java.math.BigDecimal;
import java.util.Date;

import dao.BoletaPagoDAO;
import dominio.BoletaPago;
import dominio.Empleado;
import dominio.TiposDescuentos;

public class CtrlBoletaPago {

	private BoletaPagoDAO  daoBoleta = new BoletaPagoDAO();
	
	public boolean crearBoleta(Empleado empleado, String periodo, BigDecimal sueldo ){
		if(daoBoleta.daBoletaPagoByPeriodo(periodo) == null)
		{
			BoletaPago nuevo = new BoletaPago(empleado,periodo,sueldo);
			daoBoleta.guardaActualiza(nuevo);
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public boolean eliminarBoletaPago(Empleado empleado,String periodo,BigDecimal sueldo) 
	{
		if(daoBoleta.daBoletaPagoByPeriodo(periodo) == null)
		{
			BoletaPago boleta = daoBoleta.daBoletaPagoByPeriodo(periodo);
			daoBoleta.eliminar(boleta);
			return true;
		} else
			return false;
	}
	
	public boolean modificarBoletaPago(Empleado empleado,String periodo, BigDecimal sueldo){
		if(daoBoleta.daBoletaPagoByPeriodo(periodo) == null) 
		{
			BoletaPago boleta = daoBoleta.daBoletaPagoByPeriodo(periodo);
			boleta.setId_empleado(empleado);
			boleta.setPeriodo_pago(periodo);
			boleta.setSueldo_neto(sueldo);
			daoBoleta.guardaActualiza(boleta);
			return true;
		} else
			return false;
	}
	
}
