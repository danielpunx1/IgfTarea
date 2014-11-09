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
@Table(name="oficina", catalog="clave2", schema="")

public class Oficina implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@Basic(optional = false)
	@Column(name = "id_oficina",nullable=false,length=5)
	private String id_oficina;
	
	@JoinColumn(name = "id_municipio", referencedColumnName = "id_municipio")
	@ManyToOne(optional = false)
	private Municipio municipio;
	
	@Column(name="nomb_oficina",nullable=false,length=45)
	private String nomb_oficina;
	
	@Column(name="domicilio",nullable=false,length=100)
	private String domicilio;
	
	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY,mappedBy = "oficina" )
    private List<Empleado> emp;

	@SuppressWarnings("unused")
	public Oficina() {
	}

	public Oficina(String id_oficina, Municipio municipio, String nomb_oficina,String domicilio) {
		this.id_oficina = id_oficina;
		this.municipio = municipio;
		this.nomb_oficina = nomb_oficina;
		this.domicilio = domicilio;
	}

	public String getId_oficina() {
		return id_oficina;
	}

	public void setId_oficina(String id_oficina) {
		this.id_oficina = id_oficina;
	}

	public Municipio getMunicipio() {
		return municipio;
	}

	public void setMunicipio(Municipio municipio) {
		this.municipio = municipio;
	}

	public String getNomb_oficina() {
		return nomb_oficina;
	}

	public void setNomb_oficina(String nomb_oficina) {
		this.nomb_oficina = nomb_oficina;
	}

	public String getDomicilio() {
		return domicilio;
	}

	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}

	public List<Empleado> getEmp() {
		return emp;
	}

	public void setEmp(List<Empleado> emp) {
		this.emp = emp;
	}
	
	
}
