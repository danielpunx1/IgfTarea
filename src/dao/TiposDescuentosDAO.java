package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;

import datos.HibernateUtil;
import dominio.Municipio;
import dominio.TiposDescuentos;;

public class TiposDescuentosDAO {

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
	
	public void guardaActualiza(TiposDescuentos tipoDes) {
		try {
			iniciaOperacion() ;
			sesion.saveOrUpdate(tipoDes) ;
			tx.commit() ;
			sesion.flush() ;
		} catch (HibernateException he) {
			manejaExcepcion(he) ;
			throw he ;
		} finally {
			sesion.close() ;
		}
	}
	
	public void eliminar(TiposDescuentos tipodes) {
		try {
			iniciaOperacion();
			sesion.delete(tipodes);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}
	
	public TiposDescuentos daDescuentoById(String ids){
		sesion = sessionFactory.openSession() ;
		TiposDescuentos id = (TiposDescuentos) sesion.get(TiposDescuentos.class, ids);
		sesion.close() ;
		return id ;
	}
	
	public List<TiposDescuentos> daTiposDescuentos() {
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(TiposDescuentos.class).addOrder(Order.asc("id_tiposdescuentos"));
		List<TiposDescuentos> Tiposdesc = criteria.list();
		sesion.close();
		return Tiposdesc;
	}
	
}
