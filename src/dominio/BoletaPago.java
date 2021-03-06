package dominio;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@SuppressWarnings("unused")
@Entity
@Table(name = "boletapago", catalog = "clave2", schema = "")

public class BoletaPago implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id_boletapago")
	private Short id_boletapago;
	
	@JoinColumn(name = "id_empleado", referencedColumnName = "id_empleado")
	@ManyToOne(optional = false)
	private Empleado id_empleado;
	
	@Basic(optional = false)
	@Column(name = "periodo_pago")
	private String periodo_pago;
	
	@Column(name = "sueldo_neto")
	private double sueldo_neto;
	
	/*@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY,mappedBy = "BoletaPago" )
	private List<BoletaPagoDescuento> BPDList;*/
	
	public BoletaPago(){
		
	}
	
	public BoletaPago(Empleado id_empleado, String periodo_pago, double sueldo_neto){
		this.id_empleado = id_empleado;
		this.periodo_pago = periodo_pago;
		this.sueldo_neto = sueldo_neto;
	}


	public Short getId_boletapago() {
		return id_boletapago;
	}

	public void setId_boletapago(Short id_boletapago) {
		this.id_boletapago = id_boletapago;
	}
	
	public Empleado getId_empleado() {
		return id_empleado;
	}

	public void setId_empleado(Empleado id_empleado) {
		this.id_empleado = id_empleado;
	}
	
	public String getPeriodo_pago() {
		return periodo_pago;
	}

	public void setPeriodo_pago(String periodo_pago) {
		this.periodo_pago = periodo_pago;
	}
	
	public double getSueldo_neto() {
		return sueldo_neto;
	}

	public void setSueldo_neto(double sueldo_neto) {
		this.sueldo_neto = sueldo_neto;
	}
	
	
}
