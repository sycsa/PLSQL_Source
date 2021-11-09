select v.lote, r.descripcion, count(0) as CANTIDAD 
from vial.v_acta_resuelta v, vial.oca_devolucion d, vial.oca_cod_respuesta r
where v.nro_acta = d.nro_acta
  and v.nro_seri = d.nro_serie
  and d.cod_dev = r.codigo
  group by v.lote, r.descripcion
  order by v.lote;
