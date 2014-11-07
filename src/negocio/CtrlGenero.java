package negocio;

import java.util.List;

import dao.DepartamentoDAO;
import dao.EmpleadoDAO;
import dao.GeneroDAO;
import dao.MunicipioDAO;
import dominio.Departamento;
import dominio.Genero;
import dominio.Municipio;

public class CtrlGenero {
	
	private GeneroDAO daoGen = new GeneroDAO();
	private EmpleadoDAO daoEmp = new EmpleadoDAO();

	/*public boolean crearGenero(String id_municipio, String id_depto, String nomb_municipio) {
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
	}*/

	public Genero daGeneroByIdGenero(String id_Genero) {
		return daoGen.daGeneroById(id_Genero);
	}

}
