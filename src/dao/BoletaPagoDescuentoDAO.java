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
import dominio.BoletaPagoDescuento;

public class BoletaPagoDescuentoDAO {
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
				"Ocurrió un error en la capa DAO de BoletaPagoDescuento", he);
	}

	public void guardaActualiza(BoletaPagoDescuento boletapagodescuento) {
		try {
			iniciaOperacion();
			sesion.saveOrUpdate(boletapagodescuento);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}

	public void eliminar(BoletaPagoDescuento boletapagodescuento) {
		try {
			iniciaOperacion();
			sesion.delete(boletapagodescuento);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}

	public BoletaPagoDescuento daBoletaPagoDescuentoById(Short id_boletapagodescuento) {
		sesion = sessionFactory.openSession();
		BoletaPagoDescuento boletapagodescuento = (BoletaPagoDescuento) sesion.get(BoletaPagoDescuento.class, id_boletapagodescuento);
		sesion.close();
		return boletapagodescuento;
	}
	
	@SuppressWarnings("unchecked")
	public List<BoletaPagoDescuento> daBoletaPagoDescuentoByIdBoletaPago(Short id_boletapago) {
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(BoletaPagoDescuento.class).add(Restrictions.like("boletapago.id_boletapago", id_boletapago));
		List<BoletaPagoDescuento> boletapagosdescuentos = (List<BoletaPagoDescuento>) criteria.list();
		sesion.close();
		return boletapagosdescuentos;
	}

	@SuppressWarnings("unchecked")
	public List<BoletaPagoDescuento> daBoletaPagosDescuentos() {
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(BoletaPagoDescuento.class).addOrder(Order.asc("boletapago.id_boletapago"));
		List<BoletaPagoDescuento> boletapagodescuentos = criteria.list();
		sesion.close();
		return boletapagodescuentos;
	}
	
	public Boolean tipoDescuentoAplicado(Short id_boletapago, String id_tiposdescuentos){ //Verifica si ya se le ha aplicado un tipo de descuento especifico
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(BoletaPagoDescuento.class).add(Restrictions.like("boletapago.id_boletapago", id_boletapago));
		criteria.add(Restrictions.like("tiposdescuentos.id_tiposdescuentos", id_tiposdescuentos));
		BoletaPagoDescuento boletapagodescuento = (BoletaPagoDescuento) criteria.uniqueResult();
		if(boletapagodescuento!=null)
			return true;
		else
			return false;
	}
}
