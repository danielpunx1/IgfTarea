package negocio;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;

import dao.TiposDescuentosDAO;
import dominio.TiposDescuentos;;

public class CtrlTiposDescuentos {

	private TiposDescuentosDAO  daoDescuento = new TiposDescuentosDAO();
	
	public boolean crearDescuento(String id, String descripcion, BigDecimal porcentaje, Date fecha ){
		if(daoDescuento.daDescuentoById(id) == null)
		{
			TiposDescuentos nuevo = new TiposDescuentos(id,descripcion,porcentaje,fecha);
			daoDescuento.guardaActualiza(nuevo);
			return true;
		}
		else
		{
			return false;
		}
	}
	
}
