package dominio;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
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
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id_tiposdescuentos")
	private String id_tiposdescuentos;
	
	@Basic(optional = false)
	@Column(name = "descripcion")
	private String descripcion;
	
	@Column(name = "porcentaje_descuento")
	private BigDecimal porcentaje_descuento;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "fecha_ingreso")
	private Date fecha_ingreso;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "tiposdescuentos" )
	private List<BoletaPagoDescuento> BPDList;
	
	private TiposDescuentos(){
		
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

	public List<BoletaPagoDescuento> getBPDList() {
		return BPDList;
	}

	public void setBPDList(List<BoletaPagoDescuento> bPDList) {
		BPDList = bPDList;
	}
	
}
