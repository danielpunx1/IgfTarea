package dominio;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Table;
import dominio.Puesto;
import dominio.Oficina;

@Entity
@Table(name = "empleado", catalog = "clave2", schema = "")
public class Empleado implements Serializable{
		
	private static final long serialVersionUID = 1L;
		
	@Id
	@Basic(optional = false)
	@Column(name = "id_empleado")
	private String id_empleado;
	
	@Basic(optional = false)
	@Column(name = "nit")
	private String nit;
	
	@Basic(optional = false)
	@Column(name = "dui")
	private String dui;
	
	@Basic(optional = false)
	@Column(name = "nombres")
	private String nombres;
	
	@Basic(optional = false)
	@Column(name = "apellido_pat")
	private String apellido_paterno;
	
	@Basic(optional = false)
	@Column(name = "apellido_mat")
	private String apellido_materno;
	
	@Basic(optional = false)
	@Column(name = "fecha_nacimiento")
	@Temporal(TemporalType.DATE)
	private Date fecha_nacimiento;
	
	@Basic(optional = false)
	@Column(name = "fecha_ingreso")
	@Temporal(TemporalType.DATE)
	private Date fecha_ingreso;
	
	@Basic(optional = false)
	@Column(name = "sueldo")
	private Double sueldo;
	
	@Basic(optional = false)
	@Column(name = "email")
	private String email;
	
	@Basic(optional = false)
	@Column(name = "telefono")
	private String telefono;
	
	@Basic(optional = false)
	@Column(name = "activo")
	private String activo;
	
	@JoinColumn(name = "id_sexo", referencedColumnName = "id_sexo")
	@ManyToOne(optional = false)
	private Genero sexo;
	
	@JoinColumn(name = "id_puesto", referencedColumnName = "id_puesto")
	@ManyToOne(optional = false)
	private Puesto puesto;
	
	@JoinColumn(name = "id_oficina", referencedColumnName = "id_oficina")
	@ManyToOne(optional = false)
	private Oficina oficina;
	
	@JoinColumn(name = "id_jefe", referencedColumnName = "id_empleado")
	@ManyToOne(optional = true)
	private Empleado jefe;
	
	//@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY, mappedBy = "empleado" )
	//private List<BoletaPago> BPList;
	
	public Empleado(){
	}

	public Empleado(String id_empleado, String nit, String dui,
		String nombres, String apellido_paterno,
		String apellido_materno, Date fecha_nacimiento,
		Date fecha_ingreso, Double sueldo, String email,
		String telefono, String activo, Genero sexo, Puesto puesto, Oficina oficina, Empleado jefe) {
	
		this.id_empleado = id_empleado;
		this.nit = nit;
		this.dui = dui;
		this.nombres = nombres;
		this.apellido_paterno = apellido_paterno;
		this.apellido_materno = apellido_materno;
		this.fecha_nacimiento = fecha_nacimiento;
		this.fecha_ingreso = fecha_ingreso;
		this.sueldo = sueldo;
		this.email = email;
		this.telefono = telefono;
		this.activo = activo;
		this.sexo = sexo;
		this.puesto = puesto;
		this.oficina = oficina;
		this.jefe = jefe;
	}
	
	
	public String getId_empleado() {
		return id_empleado;
	}

	public void setId_empleado(String id_empleado) {
		this.id_empleado = id_empleado;
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
		
	
	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	
	public String getApellido_paterno() {
		return apellido_paterno;
	}

	public void setApellido_paterno(String apellido_paterno) {
		this.apellido_paterno = apellido_paterno;
	}

	
	public String getApellido_materno() {
		return apellido_materno;
	}

	public void setApellido_materno(String apellido_materno) {
		this.apellido_materno = apellido_materno;
	}

	
	public Date getFecha_nacimiento() {
		return fecha_nacimiento;
	}

	public void setFecha_nacimiento(Date fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}

	
	public Date getFecha_ingreso() {
		return fecha_ingreso;
	}

	public void setFecha_ingreso(Date fecha_ingreso) {
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
		
	
	public Genero getSexo(){
		return sexo;
	}		

	public void setSexo(Genero sexo){
		this.sexo = sexo;
	}
		
	
	public Puesto getPuesto(){
		return puesto;
	}
	
	public void setPuesto(Puesto puesto){
		this.puesto = puesto;
	}
		
	
	public Oficina getOficina(){
		return oficina;
	}
	
	public void setOficina(Oficina oficina){
		this.oficina = oficina;
	}
		
		
	public Empleado getJefe(){
		return jefe;
	}
	
	public void setJefe(Empleado jefe){
		this.jefe = jefe;
	}

	/*public List<BoletaPago> getBPList() {
		return BPList;
	}

	public void setBPList(List<BoletaPago> bPList) {
		BPList = bPList;
	}*/
		
	
}
