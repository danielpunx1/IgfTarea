package dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import datos.HibernateUtil;
import dominio.Oficina;

public class OficinaDAO {
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
	
	public Oficina daOficinaById(String ids){
		sesion = sessionFactory.openSession() ;
		Oficina id = (Oficina) sesion.get(Oficina.class, ids);
		sesion.close() ;
		return id ;
	}
}
