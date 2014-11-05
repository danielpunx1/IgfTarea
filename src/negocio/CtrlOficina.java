package negocio;

import dao.OficinaDAO;
import dominio.Municipio;
import dominio.Oficina;

public class CtrlOficina {
	private OficinaDAO daoOficina = new OficinaDAO();
	
	public boolean crearOficina(String id_oficina, Municipio municipio, String nomb_oficina,
			String domicilio){
		
		if(daoOficina.daOficinaById(id_oficina)==null){
			Oficina oficina = new Oficina(id_oficina, municipio, nomb_oficina, domicilio);
			daoOficina.guardaActualiza(oficina);
			return true;
		}
		else {
			return false;
		}
	}
}
