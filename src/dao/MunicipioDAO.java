package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
//import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;

import datos.HibernateUtil;
import dominio.Municipio;

public class MunicipioDAO {
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
				"Ocurrió un error en la capa DAO de Municipio", he);
	}

	public void guardaActualiza(Municipio municipio) {
		try {
			iniciaOperacion();
			sesion.saveOrUpdate(municipio);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}

	public void eliminar(Municipio municipio) {
		try {
			iniciaOperacion();
			sesion.delete(municipio);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}

	public Municipio daMunicipioByIdMunicipio(String id_municipio) {
		sesion = sessionFactory.openSession();
		Municipio municipio = (Municipio) sesion.get(Municipio.class, id_municipio);
		sesion.close();
		return municipio;
	}

	public Municipio daMunicipioByNombreNombMunicipio(String nomb_municipio) {
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(Municipio.class).add(
				Restrictions.like("nomb_municipio", nomb_municipio));
		Municipio municipio = (Municipio) criteria.uniqueResult();
		sesion.close();
		return municipio;
	}
	
	@SuppressWarnings("unchecked")
	public List<Municipio> daMunicipiosByIdDepto(String id_depto) {
		sesion = sessionFactory.openSession();
		//Query query = sesion.getNamedQuery("Departamentos.findAll");
		//List<Departamento> departamentos = query.list();
		Criteria criteria = sesion.createCriteria(Municipio.class).add(Restrictions.like("id_depto", id_depto));
		List<Municipio> municipios = (List<Municipio>) criteria.list();
		sesion.close();
		return municipios;
	}

	@SuppressWarnings("unchecked")
	public List<Municipio> daMunicipios() {
		sesion = sessionFactory.openSession();
		//Query query = sesion.getNamedQuery("Departamentos.findAll");
		//List<Departamento> departamentos = query.list();
		Criteria criteria = sesion.createCriteria(Municipio.class).addOrder(Order.asc("id_municipio"));
		List<Municipio> municipios = criteria.list();
		sesion.close();
		return municipios;
	}
}