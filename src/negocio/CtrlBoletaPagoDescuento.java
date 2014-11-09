package negocio;

import java.util.List;

import dao.BoletaPagoDAO;
import dao.BoletaPagoDescuentoDAO;
import dao.TiposDescuentosDAO;
import dominio.BoletaPago;
import dominio.BoletaPagoDescuento;
import dominio.TiposDescuentos;

public class CtrlBoletaPagoDescuento {
	private BoletaPagoDescuentoDAO daoBoletaPD = new BoletaPagoDescuentoDAO();
	private BoletaPagoDAO daoBoletaP = new BoletaPagoDAO();
	private TiposDescuentosDAO daoTiposDesc = new TiposDescuentosDAO();
	private CtrlBoletaPago bp= new CtrlBoletaPago();

	public int crearBoletaPagoDescuento(Short id_boletapago, String id_tiposdescuentos) {
		if(daoBoletaP.daBoletaPagoById(id_boletapago)!=null){
			if(daoBoletaPD.tipoDescuentoAplicado(id_boletapago, id_tiposdescuentos)==false){//Verifica que el descuento no se le haya aplicado ya
				BoletaPago boletapago = daoBoletaP.daBoletaPagoById(id_boletapago);
				TiposDescuentos tiposdescuentos =  daoTiposDesc.daDescuentoById(id_tiposdescuentos);
				
				//Determinando el monto del descuento
				double monto_descuento=0;
				double sueldo_total=boletapago.getSueldo_neto();
				List<BoletaPagoDescuento> descuentos=daoBoletaPD.daBoletaPagoDescuentoByIdBoletaPago(id_boletapago);
				int numDesc=descuentos.size();
				if(!descuentos.isEmpty()){//Calculando el sueldo_total
					BoletaPagoDescuento actualDesc;
					for(int i=0;i<numDesc;i++){
						actualDesc=(BoletaPagoDescuento) descuentos.get(i);
						sueldo_total+=actualDesc.getMontoDescuento();
					}
				}
				monto_descuento=sueldo_total*tiposdescuentos.getPorcentaje_descuento();
				
				double nuevo_saldo=boletapago.getSueldo_neto()-monto_descuento;
				if(nuevo_saldo<0)
					return 3; //El descuento es mayor que el sueldo neto;
				
				if(!bp.modificarBoletaPago(boletapago.getId_empleado(), boletapago.getPeriodo_pago(), nuevo_saldo))
					return 4; //No se pudo modificar pagoboleta con el nuevo sueldo_neto despues de descuento
				
				BoletaPagoDescuento boletapagodescuento = new BoletaPagoDescuento(boletapago, tiposdescuentos, monto_descuento);
				daoBoletaPD.guardaActualiza(boletapagodescuento);
				return 1;//Guardado con exito
			}else
				return 2;//Ya se le aplico ese descuento
		}else
			return 0;//No existe la boleta de pago indicada
	}
	
	public boolean eliminarBoletaPagoDescuento(Short id_boletapagodescuento) {
		if (daoBoletaPD.daBoletaPagoDescuentoById(id_boletapagodescuento)!= null) {
			BoletaPagoDescuento boletapagodescuento = daoBoletaPD.daBoletaPagoDescuentoById(id_boletapagodescuento);
			
			//Modificando la boleta de pago con el nuevo sueldo neto despues de eliminar un descuento
			BoletaPago boletapago=boletapagodescuento.getBoletaPago();
			double nuevo_saldo=boletapago.getSueldo_neto()+boletapagodescuento.getMontoDescuento();
			
			if(!bp.modificarBoletaPago(boletapago.getId_empleado(), boletapago.getPeriodo_pago(), nuevo_saldo))
				return false; //No se pudo modificar pagoboleta con el nuevo sueldo_neto 
			
			daoBoletaPD.eliminar(boletapagodescuento);
			return true;
		} else
			return false;
	}

	public int modificarBoletaPagoDescuento(Short id_boletapagodescuento, String id_tiposdescuentos) {
		if (daoBoletaPD.daBoletaPagoDescuentoById(id_boletapagodescuento) != null) {
			
			CtrlBoletaPagoDescuento bpd = new CtrlBoletaPagoDescuento();
			BoletaPago boletapago = bpd.daBoletaPagoDescuantoById(id_boletapagodescuento).getBoletaPago();
			
			if(bpd.eliminarBoletaPagoDescuento(id_boletapagodescuento)==false)	return 4;
			
			return bpd.crearBoletaPagoDescuento(boletapago.getId_boletapago(), id_tiposdescuentos);
		}
		
		return 5;
	}
	
	public List<BoletaPagoDescuento> daBoletaPagosDescuentos() {
		return daoBoletaPD.daBoletaPagosDescuentos();
	}

	public BoletaPagoDescuento daBoletaPagoDescuantoById(Short id_boletapagodescuento) {
		return daoBoletaPD.daBoletaPagoDescuentoById(id_boletapagodescuento);
	}

	public List<BoletaPagoDescuento> daBoletaPagoDescuentoByIdBoletaPago(Short id_boletapago){
		return daoBoletaPD.daBoletaPagoDescuentoByIdBoletaPago(id_boletapago);
	}
}
