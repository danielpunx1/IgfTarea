package dominio;

import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "genero", catalog = "clave2", schema = "")
public class Genero {

	@Id
	@Basic(optional = false)
	@Column(name = "id_sexo")
	private String id_sexo;
	
	@Basic(optional = false)
	@Column(name="d_sexo")
	private String d_sexo;
	
	public Genero(){
	}

	public Genero(String id_sexo, String sexo) {
		this.id_sexo = id_sexo;
		this.d_sexo = sexo;
	}

	public String getId_sexo() {
		return id_sexo;
	}

	public void setId_sexo(String id_sexo) {
		this.id_sexo = id_sexo;
	}

	public String getSexo() {
		return d_sexo;
	}

	public void setSexo(String sexo) {
		this.d_sexo = sexo;
	}	
}
