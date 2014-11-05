package dominio;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "departamento", catalog = "clave2", schema = "")

public class Departamento implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Basic(optional = false)
	@Column(name = "id_depto", length = 2)
	private String id_depto;
	
	@Basic(optional = false)
	@Column(name = "nombre_depto", length = 25)
	private String nombre_depto;
	
	@Basic(optional = false)
	@Column(name = "zona_geografica", length = 25)
	private String zona_geografica;
<<<<<<< HEAD
	
	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY , mappedBy = "departamento")
	private List<Municipio> munlist;
=======
	//private List<Municipio> municipioList;

	private static final long serialVersionUID = 1L;
>>>>>>> 4c3077c8f23de138b917953a960d38fd3cf3a2d1

	
	public Departamento() {

	}

	public Departamento(String id_depto, String nombre_depto, String zona_geografica) {
		this.id_depto = id_depto;
		this.nombre_depto = nombre_depto;
		this.zona_geografica = zona_geografica;
	}

	public String getIdDepto() {
		return id_depto;
	}

	public void setIdDepto(String id_depto) {
		this.id_depto = id_depto;
	}

	public String getNombreDepto() {
		return nombre_depto;
	}

	public void setNombreDepto(String nombre_depto) {
		this.nombre_depto = nombre_depto;
	}

	public String getZonaGeografica() {
		return zona_geografica;
	}

	public void setZonaGeografica(String zona_geografica) {
		this.zona_geografica = zona_geografica;
	}

<<<<<<< HEAD
=======
	/*//Un departamento tiene varios municipios
	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY ,mappedBy = "departamento")
>>>>>>> 4c3077c8f23de138b917953a960d38fd3cf3a2d1
	public List<Municipio> getMunicipioList() {
		return munlist;
	}

	public void setMunicipioList(List<Municipio> municipioList) {
<<<<<<< HEAD
		this.munlist = municipioList;
	}
=======
		this.municipioList = municipioList;
	}*/
>>>>>>> 4c3077c8f23de138b917953a960d38fd3cf3a2d1

}
