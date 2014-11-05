package dominio;
import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "empleado", catalog = "clave2", schema = "")
public class Empleado implements Serializable{
	
	private String nit;
	private String dui;
	@Id
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id_empleado")
	private String id_empleado;
	
	@JoinColumn(name = "id_puesto", referencedColumnName = "id_puesto")
	@ManyToOne(optional = false)
	private Puesto id_puesto;
	
	@JoinColumn(name = "id_empleado", referencedColumnName = "id_empleado")
	@ManyToOne(optional = false)
	private Oficina oficina;
	
	private Genero genero;
	private Empleado empleado;
	private String nombres;
	private String apellido_pat;
	private String apellido_mat;
	private String fecha_nacimiento;
	private String fecha_ingreso;
	private Double sueldo;
	private String email;
	private String telefono;
	private String activo;
	
	public Puesto getPuesto() {
		return puesto;
	}

	public void setPuesto(Puesto puesto) {
		this.puesto = puesto;
	}

	public Oficina getOficina() {
		return oficina;
	}

	public void setOficina(Oficina oficina) {
		this.oficina = oficina;
	}

	public Genero getGenero() {
		return genero;
	}

	public void setGenero(Genero genero) {
		this.genero = genero;
	}

	public Empleado getEmpleado() {
		return empleado;
	}

	public void setEmpleado(Empleado empleado) {
		this.empleado = empleado;
	}
	
	public Empleado(){
	}
	
	public Empleado(String nit, String dui, String id_empleado, Puesto puesto,
			Oficina oficina, Genero genero, Empleado empleado, String nombres,
			String apellido_pat, String apellido_mat, String fecha_nacimiento,
			String fecha_ingreso, Double sueldo, String email, String telefono,
			String activo) {
		this.nit = nit;
		this.dui = dui;
		this.id_empleado = id_empleado;
		this.puesto = puesto;
		this.oficina = oficina;
		this.genero = genero;
		this.empleado = empleado;
		this.nombres = nombres;
		this.apellido_pat = apellido_pat;
		this.apellido_mat = apellido_mat;
		this.fecha_nacimiento = fecha_nacimiento;
		this.fecha_ingreso = fecha_ingreso;
		this.sueldo = sueldo;
		this.email = email;
		this.telefono = telefono;
		this.activo = activo;
	}

	public String getNit() {
		return nit;
	}
	public void setNit(String nit) {
		this.nit = nit;
	}
	public String getDui() {
		return dui;
	}
	public void setDui(String dui) {
		this.dui = dui;
	}
	public String getIdEmpleado() {
		return id_empleado;
	}
	public void setIdEmpleado(String idEmpleado) {
		this.id_empleado = idEmpleado;
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getApellido_pat() {
		return apellido_pat;
	}
	public void setApellido_pat(String apellido_pat) {
		this.apellido_pat = apellido_pat;
	}
	public String getApellido_mat() {
		return apellido_mat;
	}
	public void setApellido_mat(String apellido_mat) {
		this.apellido_mat = apellido_mat;
	}
	public String getFecha_nacimiento() {
		return fecha_nacimiento;
	}
	public void setFecha_nacimiento(String fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}
	public String getFecha_ingreso() {
		return fecha_ingreso;
	}
	public void setFecha_ingreso(String fecha_ingreso) {
		this.fecha_ingreso = fecha_ingreso;
	}
	public Double getSueldo() {
		return sueldo;
	}
	public void setSueldo(Double sueldo) {
		this.sueldo = sueldo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getActivo() {
		return activo;
	}
	public void setActivo(String activo) {
		this.activo = activo;
	}	
}
