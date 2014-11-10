package dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;

import datos.HibernateUtil;
import dominio.Empleado;

public class EmpleadoDAO {

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
	
	public void guardaActualiza(Empleado empleado) {
		try {
			iniciaOperacion() ;
			sesion.saveOrUpdate(empleado);
			tx.commit() ;
			sesion.flush() ;
		} catch (HibernateException he) {
			manejaExcepcion(he) ;
			throw he ;
		} finally {
			sesion.close() ;
		}
	}
	
	public void eliminar(Empleado empleado) {
		//creando validacion si no tiene registros hijos
		//if(empleado.getJefe().equals(null))
		try {
			iniciaOperacion();
			sesion.delete(empleado);
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
	public List<Empleado> daEmpleados() {
		sesion = sessionFactory.openSession();
		//Query query = sesion.getNamedQuery("Empleado.findAll");
		//List<Empleado> empleados = query.list();
		Criteria criteria = sesion.createCriteria(Empleado.class).addOrder(Order.asc("id_empleado"));
		List<Empleado> empleados = criteria.list();
		sesion.close();
		return empleados;
	}
	
	public Empleado daEmpleadoById(String idEmpleado){
		sesion = sessionFactory.openSession() ;
		// Retorna la instancia persistente de la clase por medio del atributo identidad
		Empleado id = (Empleado) sesion.get(Empleado.class, new String(idEmpleado)) ;
		sesion.close() ;
		return id;
	}
}
