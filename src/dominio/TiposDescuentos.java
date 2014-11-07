package dominio;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "tiposdescuentos", catalog = "clave2", schema = "")

public class TiposDescuentos implements Serializable {
	
	@Id
	@Column(name = "id_tiposdescuentos", unique=true, nullable=false, length=5)
	private String id_tiposdescuentos;
	
	@Column(name = "descripcion" , length=250)
	private String descripcion;
	
	@Column(name = "porcentaje_descuento", precision=5, scale=3)
	private BigDecimal porcentaje_descuento;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "fecha_ingreso", nullable=false)
	private Date fecha_ingreso;
	
    @OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY,mappedBy = "tiposdescuentos" )
	private List<BoletaPagoDescuento> BPDList;
	private String BPDList;
	
	
	public TiposDescuentos(){
		
	}
	
	public TiposDescuentos(String id_tiposdescuentos, String descripcion, BigDecimal porcentaje_descuento, Date fecha){
		this.id_tiposdescuentos = id_tiposdescuentos;
		this.descripcion = descripcion;
		this.porcentaje_descuento = porcentaje_descuento;
		this.fecha_ingreso = fecha;
	}

	public String getId_tiposdescuentos() {
		return id_tiposdescuentos;
	}

	public void setId_tiposdescuentos(String id_tiposdescuentos) {
		this.id_tiposdescuentos = id_tiposdescuentos;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public BigDecimal getPorcentaje_descuento() {
		return porcentaje_descuento;
	}

	public void setPorcentaje_descuento(BigDecimal porcentaje_descuento) {
		this.porcentaje_descuento = porcentaje_descuento;
	}

	public Date getFecha_ingreso() {
		return fecha_ingreso;
	}

	public void setFecha_ingreso(Date fecha_ingreso) {
		this.fecha_ingreso = fecha_ingreso;
	}

	/*
	public List<BoletaPagoDescuento> getBPDList() {
		return BPDList;
	}

	public void setBPDList(List<BoletaPagoDescuento> bPDList) {
		BPDList = bPDList;
	}
	*/
	
//	 public Set getBoletapagodescuentos() {
//	        return this.boletapagodescuentos;
//	    }
//	    
//	    public void setBoletapagodescuentos(Set boletapagodescuentos) {
//	        this.boletapagodescuentos = boletapagodescuentos;
//	    }
	
	
}
