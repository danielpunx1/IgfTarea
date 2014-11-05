package dao;

import java.math.BigDecimal;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import datos.HibernateUtil;
import dominio.Puesto;

public class PuestoDAO {
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
	
	public void guardaActualiza(Puesto puesto) {
		try {
			iniciaOperacion() ;
			sesion.saveOrUpdate(puesto);
			tx.commit() ;
			sesion.flush() ;
		} catch (HibernateException he) {
			manejaExcepcion(he) ;
			throw he ;
		} finally {
			sesion.close() ;
		}
	}
	
	public void elimina(Puesto puesto){
		try {
			iniciaOperacion();
			sesion.delete(puesto);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}

	public Puesto daPuestoById(int id_puesto){
		sesion = sessionFactory.openSession() ;
		Puesto puesto = (Puesto) sesion.get(Puesto.class, id_puesto);
		sesion.close() ;
		return puesto ;
	}
	
	public Puesto daPuestoByNombPuesto(String nomb_puesto){
		sesion = sessionFactory.openSession() ;
		Puesto puesto = (Puesto) sesion.get(Puesto.class, nomb_puesto);
		sesion.close();
		return puesto;
	}
	
	@SuppressWarnings("unchecked")
	public List<Puesto> daPuestos(){
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(Puesto.class);
		List<Puesto> puestos = (List<Puesto>) criteria.list();
		sesion.close();
		return puestos;
	}
	
	@SuppressWarnings("unchecked")
	public List<Puesto> daPuestosSMinMayorA(BigDecimal s_min){
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(Puesto.class)
				.add(Restrictions.ge("sueldo_min", s_min));
		List<Puesto> puestos = (List<Puesto>) criteria.list();
		sesion.close();
		return puestos;
	}
	
	@SuppressWarnings("unchecked")
	public List<Puesto> daPuestosSMinMenorA(BigDecimal s_min){
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(Puesto.class)
				.add(Restrictions.le("sueldo_min", s_min));
		List<Puesto> puestos = (List<Puesto>) criteria.list();
		sesion.close();
		return puestos;
	}
	
	@SuppressWarnings("unchecked")
	public List<Puesto> daPuestosSMaxMayorA(BigDecimal s_max){
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(Puesto.class)
				.add(Restrictions.ge("sueldo_max", s_max));
		List<Puesto> puestos = (List<Puesto>) criteria.list();
		sesion.close();
		return puestos;
	}
	
	@SuppressWarnings("unchecked")
	public List<Puesto> daPuestosSMaxMenorA(BigDecimal s_max){
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(Puesto.class)
				.add(Restrictions.le("sueldo_max", s_max));
		List<Puesto> puestos = (List<Puesto>) criteria.list();
		sesion.close();
		return puestos;
	}
}
