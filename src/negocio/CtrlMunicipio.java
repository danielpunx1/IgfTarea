package negocio;

import java.util.List;
import dao.DepartamentoDAO;
import dao.MunicipioDAO;
import dominio.Departamento;
import dominio.Municipio;

public class CtrlMunicipio {
	private MunicipioDAO daoMun = new MunicipioDAO();
	private DepartamentoDAO daoDepto = new DepartamentoDAO();

	public boolean crearMunicipio(String id_municipio, String id_depto, String nomb_municipio) {
		if ((daoMun.daMunicipioByIdMunicipio(id_municipio)== null)&&(daoDepto.daDepartamentoByIdDepto(id_depto)!=null)) {
			Departamento departamento = daoDepto.daDepartamentoByIdDepto(id_depto);
			Municipio municipio = new Municipio(id_municipio, departamento, nomb_municipio);
			daoMun.guardaActualiza(municipio);
			return true;
		} else {
			return false;
		}
	}

	public boolean eliminarMunicipio(String id_municipio) {
		if (daoMun.daMunicipioByIdMunicipio(id_municipio)!= null) {
			Municipio municipio = daoMun.daMunicipioByIdMunicipio(id_municipio);
			daoMun.eliminar(municipio);
			return true;
		} else
			return false;
	}

	public boolean modificarMunicipio(String id_municipio, String id_depto, String nomb_municipio) {
		if (daoMun.daMunicipioByIdMunicipio(id_municipio) != null) {
			Departamento departamento = daoDepto.daDepartamentoByIdDepto(id_depto);
			Municipio municipio = daoMun.daMunicipioByIdMunicipio(id_municipio);
			municipio.setDepto(departamento);
			municipio.setNombMunicipio(nomb_municipio);
			daoMun.guardaActualiza(municipio);
			return true;
		} else
			return false;
	}
	
	public List<Municipio> daMunicipios() {
		return daoMun.daMunicipios();
	}

	public Municipio daMunicipioByIdMunicipio(String id_municipio) {
		return daoMun.daMunicipioByIdMunicipio(id_municipio);
	}

	public Municipio daMunicipioByNombMunicipio(String nomb_municipio) {
		return daoMun.daMunicipioByNombreNombMunicipio(nomb_municipio);
	}
	
	public List<Municipio> daMunicipioByIdDepto(String id_depto){
		return daoMun.daMunicipiosByIdDepto(id_depto);
	}
}