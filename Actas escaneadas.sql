SELECT A.NRO_ACTA,
       A.FECHA_NOTIFICACION,
       A.JUZGADO,
       A.LOTE,
       NVL(ESCANEADO, 'NO') AS ESCANEADO
  FROM (select o.nro_serie || o.nro_acta as nro_acta,
       O.FECHA_NOTIFICACION,
       j.jzgdescripcion as juzgado,
       v.lote,
       (select max('SI')
          from escaneo_notif where nro_acta = o.nro_serie || o.nro_acta) as ESCANEADO
  from oca_devolucion               o,
       oca_cod_respuesta            c,
       vialcaminera.v_acta_resuelta v,
       vialcaminera.juzgados        j
 where o.cod_dev = c.codigo
   and o.empresa = c.empresa
   and o.cod_dev in ('100', '001')
   and v.nro_acta = o.nro_acta
   and v.nro_seri = o.nro_serie
   and v.cod_juzgado = j.jzgid
   and v.orden > 0
   and lote > 11) A
 order by lote;
