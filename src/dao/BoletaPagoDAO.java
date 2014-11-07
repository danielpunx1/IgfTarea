package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

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
	
	public void eliminar(BoletaPago boleta) {
		try {
			iniciaOperacion();
			sesion.delete(boleta);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}
	
	public BoletaPago daBoletaPagoById(Short ids){
		sesion = sessionFactory.openSession() ;
		BoletaPago id = (BoletaPago) sesion.get(BoletaPago.class, ids);
		sesion.close() ;
		return id ;
	}
	
	public BoletaPago daBoletaPagoByPeriodo(String periodo){
		sesion = sessionFactory.openSession() ;
		Criteria var = sesion.createCriteria(BoletaPago.class).add(Restrictions.eq("periodo_pago", periodo));
		BoletaPago boleta = (BoletaPago)var.uniqueResult();
		sesion.close() ;
		return boleta ;
	}
	
	public List<BoletaPago> daBoletasPago() {
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(BoletaPago.class).addOrder(Order.asc("id_boletapago"));
		List<BoletaPago> boletas = criteria.list();
		sesion.close();
		return boletas;
	}
	
}
