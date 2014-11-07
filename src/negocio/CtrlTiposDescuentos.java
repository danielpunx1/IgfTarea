package negocio;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import dao.TiposDescuentosDAO;
import dominio.Departamento;
import dominio.Municipio;
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
	
	public boolean eliminarTipoDescuento(String id_tipodescuento) 
	{
		if(daoDescuento.daDescuentoById(id_tipodescuento) != null)
		{
			TiposDescuentos desc = daoDescuento.daDescuentoById(id_tipodescuento);
			daoDescuento.eliminar(desc);
			return true;
		} else
			return false;
	}
	
	public boolean modificarTipoDescuento(String id_tipodescuento, String descripcion, BigDecimal porcentaje ,Date fecha){
		if ( daoDescuento.daDescuentoById(id_tipodescuento) != null) {
			TiposDescuentos Descuento = daoDescuento.daDescuentoById(id_tipodescuento);
			Descuento.setDescripcion(descripcion);
			Descuento.setPorcentaje_descuento(porcentaje);
			Descuento.setFecha_ingreso(fecha);
			daoDescuento.guardaActualiza(Descuento);
			return true;
		} else
			return false;
	}
	
	public TiposDescuentos daTipoDescuentoById(String id_tipodescuento) {
		return daoDescuento.daDescuentoById(id_tipodescuento);
	}
	
	public List<TiposDescuentos> daTiposDescuentos() {
		return daoDescuento.daTiposDescuentos();
	}
}
