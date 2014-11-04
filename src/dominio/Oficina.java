package dominio;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Oficina", catalog="clave2", schema="")

public class Oficina implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@Basic(optional = false)
	@Column(name = "id_oficina",nullable=false,length=5)
	private String id_oficina;
	
	@ManyToOne
	@Column(name="id_municipio",nullable=false)
	private Municipio municipio;
	
	@Column(name="nomb_oficina",nullable=false,length=45)
	private String nomb_oficina;
	
	@Column(name="domicilio",nullable=false,length=100)
	private String domicilio;

	private Oficina() {
	}

	public Oficina(String id_oficina, Municipio municipio, String nomb_oficina,
			String domicilio) {
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
	
	
}
