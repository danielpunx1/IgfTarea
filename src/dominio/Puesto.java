package dominio;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="puesto",catalog="clave2",schema="")

public class Puesto implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@Basic(optional=false)
	@Column(name="id_puesto",nullable=false)
	private int idPuesto;
	
	@Column(name="nomb_puesto",nullable=false,length=45)
	private String nombPuesto;
	
	@Column(name="perfil_puesto",nullable=false,length=255)
	private String perfilPuesto;
	
	@Column(name="fecha_ing",nullable=false)
	private Date fechaIng;
	
	@Column(name="sueldo_min",nullable=false)
	private double sueldoMin;
	
	@Column(name="sueldo_max",nullable=false)
	private double sueldoMax;

	public Puesto() {
	}

	public Puesto(int idPuesto, String nombPuesto, String perfilPuesto,
			Date fechaIng, double sueldoMin, double sueldoMax) {
		this.idPuesto = idPuesto;
		this.nombPuesto = nombPuesto;
		this.perfilPuesto = perfilPuesto;
		this.fechaIng = fechaIng;
		this.sueldoMin = sueldoMin;
		this.sueldoMax = sueldoMax;
	}

	public int getIdPuesto() {
		return idPuesto;
	}

	public void setIdPuesto(int idPuesto) {
		this.idPuesto = idPuesto;
	}

	public String getNombPuesto() {
		return nombPuesto;
	}

	public void setNombPuesto(String nombPuesto) {
		this.nombPuesto = nombPuesto;
	}

	public String getPerfilPuesto() {
		return perfilPuesto;
	}

	public void setPerfilPuesto(String perfilPuesto) {
		this.perfilPuesto = perfilPuesto;
	}

	public Date getFechaIng() {
		return fechaIng;
	}

	public void setFechaIng(Date fechaIng) {
		this.fechaIng = fechaIng;
	}

	public double getSueldoMin() {
		return sueldoMin;
	}

	public void setSueldoMin(double sueldoMin) {
		this.sueldoMin = sueldoMin;
	}

	public double getSueldoMax() {
		return sueldoMax;
	}

	public void setSueldoMax(double sueldoMax) {
		this.sueldoMax = sueldoMax;
	}
	
	
}
