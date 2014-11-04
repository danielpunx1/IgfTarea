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
	
	@Id
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id_empleado")
	private String id_empleado;
	
	@Basic(optional = false)
	@Column(name = "nit")
	private String nit;
	
	@Basic(optional = false)
	@Column(name = "dui")
	private String dui;
	
	@JoinColumn(name = "id_puesto", referencedColumnName = "id_puesto")
	@ManyToOne(optional = false)
	private Puesto id_puesto;
	
	@JoinColumn(name = "id_empleado", referencedColumnName = "id_empleado")
	@ManyToOne(optional = false)
	private Oficina oficina;
	
	@JoinColumn(name = "id_sexo", referencedColumnName = "id_sexo")
	@ManyToOne(optional = false)
	private Genero genero;
	
	@JoinColumn(name = "id_jefe", referencedColumnName = "id_jefe")
	@ManyToOne(optional = false)
	private Empleado empleado;
	
	@Basic(optional = false)
	@Column(name = "nombres")
	private String nombres;
	
	@Basic(optional = false)
	@Column(name = "apellido_pat")
	private String apellido_pat;
	
	@Basic(optional = false)
	@Column(name = "apellido_mat")
	private String apellido_mat;
	
	@Basic(optional = false)
	@Column(name = "fecha_nacimiento")
	private String fecha_nacimiento;
	
	@Basic(optional = false)
	@Column(name = "fecha_ingreso")
	private String fecha_ingreso;
	
	@Basic(optional = false)
	@Column(name = "sueldo")
	private Double sueldo;
	
	@Column(name = "email")
	private String email;
	
	@Basic(optional = false)
	@Column(name = "telefono")
	private String telefono;
	
	@Column(name = "activo")
	private String activo;
	
	public Puesto getPuesto() {
		return id_puesto;
	}

	public void setPuesto(Puesto puesto) {
		this.id_puesto = puesto;
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
	
	public Empleado(String nit, String dui, String id_empleado, String nombres,
			String apellido_pat, String apellido_mat, String fecha_nacimiento,
			String fecha_ingreso, Double sueldo, String email, String telefono,
			String activo) {
		this.nit = nit;
		this.dui = dui;
		this.id_empleado = id_empleado;
		this.id_puesto = id_puesto;
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
