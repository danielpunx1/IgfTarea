package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import datos.HibernateUtil;
import dominio.Empleado;
import dominio.Genero;

public class GeneroDAO {

	private HibernateUtil hibernateUtil = new HibernateUtil() ;
	private SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
	private Session sesion;
	private Transaction tx;
	
	private void iniciaOperacion() throws HibernateException {
		sesion = sessionFactory.openSession() ;
		tx = sesion.beginTransaction() ;
	}
	
	private void manejaExcepcion(HibernateException he) throws HibernateException {
		tx.rollback();
		throw new HibernateException("Ocurrió un error en la capa DAO", he);
	}
	
	public void guardaActualiza(Genero genero) {
		try {
			iniciaOperacion() ;
			sesion.saveOrUpdate(genero);
			tx.commit() ;
			sesion.flush() ;
		} catch (HibernateException he) {
			manejaExcepcion(he) ;
			throw he ;
		} finally {
			sesion.close() ;
		}
	}
	
	public void eliminar(Genero genero) {
		try {
			iniciaOperacion();
			sesion.delete(genero);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}
	@SuppressWarnings("unchecked")
	public List<Genero> daGeneros() {
		sesion = sessionFactory.openSession();
		Query query = sesion.getNamedQuery("Genero.findAll");
		List<Genero> genero = query.list();
		sesion.close();
		return genero;
	}
	
	public Genero daGeneroById(String idGenero){
		sesion = sessionFactory.openSession() ;
		// Retorna la instancia persistente de la clase por medio del atributo identidad
		Genero id = (Genero) sesion.get(Genero.class, new String(idGenero)) ;
		sesion.close() ;
		return id;
	}
}
