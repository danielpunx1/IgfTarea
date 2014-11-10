package dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import datos.HibernateUtil;
import dominio.Oficina;

public class OficinaDAO {
	private HibernateUtil hibernateUtil = new HibernateUtil() ;
	@SuppressWarnings("static-access")
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
	
	public void guardaActualiza(Oficina Oficina) {
		try {
			iniciaOperacion() ;
			sesion.saveOrUpdate(Oficina);
			tx.commit() ;
			sesion.flush() ;
		} catch (HibernateException he) {
			manejaExcepcion(he) ;
			throw he ;
		} finally {
			sesion.close() ;
		}
	}
	
	public void eliminar(Oficina oficina) {
		try {
			iniciaOperacion();
			sesion.delete(oficina);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}
	
	public Oficina daOficinaByIdOficina(String id_oficina){
		sesion = sessionFactory.openSession() ;
		Oficina oficina = (Oficina) sesion.get(Oficina.class, id_oficina);
		sesion.close() ;
		return oficina ;
	}
	
	public Oficina daOFicinaByNombOficina(String nomb_oficina){
		sesion = sessionFactory.openSession() ;
		Oficina oficina = (Oficina) sesion.get(Oficina.class, nomb_oficina);
		sesion.close() ;
		return oficina ;
	}
	
	@SuppressWarnings("unchecked")
	public List<Oficina> daOficinas(){
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(Oficina.class);
		List<Oficina> oficinas = (List<Oficina>) criteria.list();
		sesion.close();
		return oficinas;
	}
	
	@SuppressWarnings("unchecked")
	public List<Oficina> daOficinasByIdMunicipio(String id_municipio){
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(Oficina.class)
				.add(Restrictions.like("municipio.id_municipio", id_municipio));
		List<Oficina> oficinas = (List<Oficina>) criteria.list();
		sesion.close();
		return oficinas;
	}
}
