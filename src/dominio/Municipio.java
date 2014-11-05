package dominio;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "municipio", catalog = "clave2", schema = "")

public class Municipio implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Basic(optional = false)
	@Column(name = "id_municipio", length = 2)
	private String id_municipio;
	
	@JoinColumn(name="id_depto", referencedColumnName="id_depto")
	@ManyToOne(optional = false)
	private Departamento depto;
	
	@Basic(optional = false)
	@Column(name = "nomb_municipio", length = 25)
	private String nomb_municipio;
	
	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY ,mappedBy = "municipio")
	private List<Oficina> oficinaslist;

	public Municipio() {

	}

	public Municipio(String id_municipio, Departamento depto, String nomb_municipio) {
		this.depto = depto;
		this.id_municipio = id_municipio;
		this.nomb_municipio = nomb_municipio;
	}

	public String getIdMunicipio() {
		return id_municipio;
	}

	public void setIdMunicipio(String id_municipio) {
		this.id_municipio = id_municipio;
	}

	public Departamento getDepto() {
		return depto;
	}

	public void setIdDepto(Departamento id_depto) {
		this.depto = id_depto;
	}

	public String getNombMunicipio() {
		return nomb_municipio;
	}

	public void setNombMunicipio(String nomb_municipio) {
		this.nomb_municipio = nomb_municipio;
	}

	public List<Oficina> getOficinaslist() {
		return oficinaslist;
	}

	public void setOficinaslist(List<Oficina> oficinaslist) {
		this.oficinaslist = oficinaslist;
	}
	
	

}
