package dominio;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "departamento", catalog = "zonas", schema = "")
public class Departamento implements Serializable {
	private String id_depto;
	private String nombre_depto;
	private String zona_geografica;
	private List<Municipio> municipioList;

	private static final long serialVersionUID = 1L;

	public Departamento() {

	}

	public Departamento(String id_depto, String nombre_depto,
			String zona_geografica) {
		this.id_depto = id_depto;
		this.nombre_depto = nombre_depto;
		this.zona_geografica = zona_geografica;
	}

	@Id
	@Basic(optional = false)
	@Column(name = "id_depto", length = 2)
	public String getIdDepto() {
		return id_depto;
	}

	public void setIdDepto(String id_depto) {
		this.id_depto = id_depto;
	}

	@Basic(optional = false)
	@Column(name = "nombre_depto", length = 25)
	public String getNombreDepto() {
		return nombre_depto;
	}

	public void setNombreDepto(String nombre_depto) {
		this.nombre_depto = nombre_depto;
	}

	@Basic(optional = false)
	@Column(name = "zona_geografica", length = 25)
	public String getZonaGeografica() {
		return zona_geografica;
	}

	public void setZonaGeografica(String zona_geografica) {
		this.zona_geografica = zona_geografica;
	}

	//Un departamento tiene varios municipios
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "departamento",  fetch=FetchType.LAZY)
	public List<Municipio> getMunicipioList() {
		return municipioList;
	}

	public void setMunicipioList(List<Municipio> municipioList) {
		this.municipioList = municipioList;
	}

}