package negocio;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import dao.BoletaPagoDAO;
import dao.BoletaPagoDescuentoDAO;
import dominio.BoletaPago;
import dominio.Empleado;
import dominio.TiposDescuentos;

@SuppressWarnings("unused")
public class CtrlBoletaPago {

	private BoletaPagoDAO  daoBoleta = new BoletaPagoDAO();
	private BoletaPagoDescuentoDAO bpd = new BoletaPagoDescuentoDAO();
	
	public boolean crearBoleta(Empleado empleado, String periodo, Double sueldo ){
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
	
	public boolean eliminarBoletaPago(Short id) 
	{
		if(daoBoleta.daBoletaPagoById(id) != null)
		{
			if(!bpd.daBoletaPagoDescuentoByIdBoletaPago(id).isEmpty())
					return false;
			BoletaPago boleta = daoBoleta.daBoletaPagoById(id);
			daoBoleta.eliminar(boleta);
			return true;
		} else
			return false;
	}
	

	public boolean modificarBoletaPago2(Short id,Empleado empleado,String periodo, double sueldo){
		if(daoBoleta.daBoletaPagoByPeriodo(periodo) == null)
		{
			//BoletaPago boleta = daoBoleta.daBoletaPagoByPeriodo(periodo);
			BoletaPago boleta = daoBoleta.daBoletaPagoById(id);
			boleta.setId_empleado(empleado);
			boleta.setPeriodo_pago(periodo);
			boleta.setSueldo_neto(sueldo);
			daoBoleta.guardaActualiza(boleta);
			return true;
		} else
			return false;
	}

	public boolean modificarBoletaPago(Empleado empleado,String periodo, double sueldo){
		if(daoBoleta.daBoletaPagoByPeriodo(periodo) != null) 
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
	
	public List<BoletaPago> daBoletaPagoAll() {
		return daoBoleta.daBoletasPago();
	}
	
	public BoletaPago daBoletaPagoById(Short id_boletapago) {
		return daoBoleta.daBoletaPagoById(id_boletapago);
	}
}
