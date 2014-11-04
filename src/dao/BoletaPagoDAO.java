package dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import datos.HibernateUtil;
import dominio.BoletaPago;
import dominio.TiposDescuentos;

public class BoletaPagoDAO {

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
	
	public void guardaActualiza(BoletaPago boleta) {
		try {
			iniciaOperacion() ;
			sesion.saveOrUpdate(boleta) ;
			tx.commit() ;
			sesion.flush() ;
		} catch (HibernateException he) {
			manejaExcepcion(he) ;
			throw he ;
		} finally {
			sesion.close() ;
		}
	}
	
	public BoletaPago daBoletaPagoById(Integer ids){
		sesion = sessionFactory.openSession() ;
		BoletaPago id = (BoletaPago) sesion.get(BoletaPago.class, ids);
		sesion.close() ;
		return id ;
	}
	
}
