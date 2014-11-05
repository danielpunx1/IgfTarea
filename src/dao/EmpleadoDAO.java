package dao;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import datos.HibernateUtil;
import dominio.Empleado;
import dominio.TiposDescuentos;

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
	
	public Empleado daEmpleadoById(String ids){
		sesion = sessionFactory.openSession() ;
		Empleado id = (Empleado) sesion.get(Empleado.class, ids);
		sesion.close() ;
		return id ;
	}
}
