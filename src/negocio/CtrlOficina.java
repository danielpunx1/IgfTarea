package negocio;

import java.util.List;

import dao.MunicipioDAO;
import dao.OficinaDAO;
import dominio.Municipio;
import dominio.Oficina;

public class CtrlOficina {
	private OficinaDAO daoOficina = new OficinaDAO();
	private MunicipioDAO daoMunicipio = new MunicipioDAO();

	public boolean crearOficina(String id_oficina, String id_municipio, String nomb_oficina,
			String domicilio){

		if(daoOficina.daOficinaByIdOficina(id_oficina)==null
				&&daoMunicipio.daMunicipioByIdMunicipio(id_municipio)!=null){
			Municipio municipio = daoMunicipio.daMunicipioByIdMunicipio(id_municipio);
			Oficina oficina = new Oficina(id_oficina, municipio, nomb_oficina, domicilio);
			daoOficina.guardaActualiza(oficina);
			return true;
		}
		else {
			return false;
		}
	}

	public boolean eliminarOficina(String id_oficina){
		Oficina oficina = daoOficina.daOficinaByIdOficina(id_oficina);
		if(oficina!=null){
			daoOficina.eliminar(oficina);
			return true;
		}
		else {
			return false;
		}
	}

	public boolean modificarOficina(String id_oficina, String id_municipio, String nomb_oficina,
			String domicilio){
		
		if(daoOficina.daOficinaByIdOficina(id_oficina)!=null
				&&daoMunicipio.daMunicipioByIdMunicipio(id_municipio)!=null){
			Municipio municipio = daoMunicipio.daMunicipioByIdMunicipio(id_municipio);
			Oficina oficina = daoOficina.daOficinaByIdOficina(id_oficina);
			oficina.setMunicipio(municipio);
			oficina.setDomicilio(domicilio);
			oficina.setNomb_oficina(nomb_oficina);
			daoOficina.guardaActualiza(oficina);
			return true;
		}
		else {
			return false;
		}
	}
	
	public Oficina daOficinaByIdOficina(String id_oficina){
		return daoOficina.daOficinaByIdOficina(id_oficina);
	}
	
	public List<Oficina> daOficinas(){
		return daoOficina.daOficinas();
	}
	
	public Oficina daOficinaByNombOficina(String nomb_oficina){
		return daoOficina.daOFicinaByNombOficina(nomb_oficina);
	}
	
	public List<Oficina> daOficinaByMunicipio(String id_municipio){
		return daoOficina.daOficinasByIdMunicipio(id_municipio);
	}
}
