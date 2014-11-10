package negocio;

import java.util.List;

import dao.DepartamentoDAO;
import dao.MunicipioDAO;
import dominio.Departamento;

public class CtrlDepartamento {
	private DepartamentoDAO daoDepto = new DepartamentoDAO();
	private MunicipioDAO daoMunicipio = new MunicipioDAO();

	public boolean crearDepartamento(String id_depto, String nombre_depto, String zona_geografica) {
		if ((daoDepto.daDepartamentoByIdDepto(id_depto) == null)&&(daoDepto.daDepartamentoByNombreDepto(nombre_depto)==null)) {
			Departamento departamento = new Departamento(id_depto, nombre_depto, zona_geografica);
			daoDepto.guardaActualiza(departamento);
			return true;
		} else {
			return false;
		}
	}

	public boolean eliminarDepartamento(String id_depto) {
		if (daoDepto.daDepartamentoByIdDepto(id_depto)!= null) {
			if(!daoMunicipio.daMunicipiosByIdDepto(id_depto).isEmpty())
				return false;
			Departamento departamento = daoDepto.daDepartamentoByIdDepto(id_depto);
			daoDepto.eliminar(departamento);
			return true;
		} else
			return false;
	}

	public boolean modificarDepartamento(String id_depto, String nombre_depto, String zona_geografica) {
		if (daoDepto.daDepartamentoByIdDepto(id_depto) != null) {
			Departamento departamento = daoDepto.daDepartamentoByIdDepto(id_depto);
			departamento.setNombreDepto(nombre_depto);
			departamento.setZonaGeografica(zona_geografica);
			daoDepto.guardaActualiza(departamento);
			return true;
		} else
			return false;
	}
	
	public List<Departamento> daDepartamentos() {
		return daoDepto.daDepartamentos();
	}

	public Departamento daDepartamentoByIdDepto(String id_depto) {
		return daoDepto.daDepartamentoByIdDepto(id_depto);
	}

	public Departamento daDepartamentoByNombreDepto(String nombre_depto) {
		return daoDepto.daDepartamentoByNombreDepto(nombre_depto);
	}
}
