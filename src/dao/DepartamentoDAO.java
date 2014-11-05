package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
//import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import datos.HibernateUtil;
import dominio.Departamento;

public class DepartamentoDAO {
	private HibernateUtil hibernateUtil = new HibernateUtil();
	@SuppressWarnings("static-access")
	private SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
	private Session sesion;
	private Transaction tx;

	private void iniciaOperacion() throws HibernateException {
		sesion = sessionFactory.openSession();
		tx = sesion.beginTransaction();
	}

	private void manejaExcepcion(HibernateException he)
			throws HibernateException {
		tx.rollback();
		throw new HibernateException(
				"Ocurrió un error en la capa DAO de Dapartamento", he);
	}

	public void guardaActualiza(Departamento departamento) {
		try {
			iniciaOperacion();
			sesion.saveOrUpdate(departamento);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}

	public void eliminar(Departamento depto) {
		try {
			iniciaOperacion();
			sesion.delete(depto);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}

	public Departamento daDepartamentoByIdDepto(String id_depto) {
		sesion = sessionFactory.openSession();
		Departamento depto = (Departamento) sesion.get(Departamento.class, id_depto);
		sesion.close();
		return depto;
	}

	public Departamento daDepartamentoByNombreDepto(String nombre_depto) {
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(Departamento.class).add(
				Restrictions.like("nombre_depto", nombre_depto));
		Departamento depto = (Departamento) criteria.uniqueResult();
		sesion.close();
		return depto;
	}

	@SuppressWarnings("unchecked")
	public List<Departamento> daDepartamentos() {
		sesion = sessionFactory.openSession();
		//Query query = sesion.getNamedQuery("Departamentos.findAll");
		//List<Departamento> departamentos = query.list();
		Criteria criteria = sesion.createCriteria(Departamento.class);
		List<Departamento> departamentos = (List<Departamento>) criteria.list();
		sesion.close();
		return departamentos;
	}
}
