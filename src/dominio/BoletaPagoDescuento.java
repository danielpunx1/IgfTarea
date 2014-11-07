package dominio;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "boletapagodescuento", catalog = "clave2", schema = "")
public class BoletaPagoDescuento implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id_boletapagodescuento", nullable=false)
	private Short id_boletapagodescuento;
	
	public Short getIdBoletaPagoDescuento() {
		return id_boletapagodescuento;
	}

	public void setIdBoletaPagoDescuento(Short id_boletapagodescuento) {
		this.id_boletapagodescuento = id_boletapagodescuento;
	}
	
	@JoinColumn(name="id_boletapago", referencedColumnName="id_boletapago")
	@ManyToOne(optional = false)
	private BoletaPago boletapago;
	
	public BoletaPago getBoletaPago() {
		return boletapago;
	}

	public void setBoletaPago(BoletaPago boletapago) {
		this.boletapago = boletapago;
	}
	
	@JoinColumn(name="id_tiposdescuentos", referencedColumnName="id_tiposdescuentos")
	@ManyToOne(optional = false)
	private TiposDescuentos tiposdescuentos;
	
	public TiposDescuentos getTiposDescuentos() {
		return tiposdescuentos;
	}

	public void setTiposDescuentos(TiposDescuentos tiposdescuentos) {
		this.tiposdescuentos = tiposdescuentos;
	}
	
	@Basic(optional = false)
	@Column(name = "monto_descuento", nullable=false)
	private double monto_descuento;
	
	public double getMontoDescuento() {
		return monto_descuento;
	}

	public void setMontoDescuento(double monto_descuento) {
		this.monto_descuento = monto_descuento;
	}
	
	public BoletaPagoDescuento() {

	}

	public BoletaPagoDescuento(BoletaPago boletapago, TiposDescuentos tiposdescuentos, double monto_descuento) {
		this.boletapago = boletapago;
		this.tiposdescuentos = tiposdescuentos;
		this.monto_descuento = monto_descuento;
	}

}
