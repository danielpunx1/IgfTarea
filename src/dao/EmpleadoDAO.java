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
import dominio.Empleado;

public class EmpleadoDAO {

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
	
	@SuppressWarnings("unchecked")
	public List<Empleado> daEmpleadosByIdOficina(String id_oficina){
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(Empleado.class)
				.add(Restrictions.like("oficina.id_oficina", id_oficina));
		List<Empleado> empleados = (List<Empleado>) criteria.list();
		sesion.close();
		return empleados;
	}
	
	@SuppressWarnings("unchecked")
	public List<Empleado> daEmpleadosByIdPuesto(int id_puesto){
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(Empleado.class)
				.add(Restrictions.eq("puesto.idPuesto", id_puesto));
		List<Empleado> empleados = (List<Empleado>) criteria.list();
		sesion.close();
		return empleados;
	}
	
	@SuppressWarnings("unchecked")
	public List<Empleado> daEmpleadosByIdJefe(String id_jefe){
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(Empleado.class)
				.add(Restrictions.eq("jefe.id_empleado", id_jefe));
		List<Empleado> empleados = (List<Empleado>) criteria.list();
		sesion.close();
		return empleados;
	}
	
}
